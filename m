From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: When compiling to dts interpret /__symbols__ and
 /__local_fixups__
Date: Thu, 4 May 2023 00:06:03 +1000
Message-ID: <ZFJqS+QFMQUgajj8@yekko>
References: <20230426182558.573161-1-u.kleine-koenig@pengutronix.de>
 <ZEtjoSXF/X1osv2B@yekko>
 <20230428191130.nuibhzf3zjoqwpwm@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8Yxdzj5/graHMF2r"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1683130996;
        bh=liTge36zq3WyjTJAH5u9du6XEktgNZFPGBKP9rg2BJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BL+YwwJVO0fktBdwa1f8/kpcDQ/ardruxwQTZWE4ALm5iifFiUEY/zlPbTNoUy+Ja
         SU75zUyGvKMOH85kjKH5nZNg5M2lCHNmUStVoZ5V9HYnnY++1IKaDCQ0J7HFroAk3t
         tK5axyqBfdR7u6eoF+1Ml37WqXmvqM5oXDKpVu9k=
Content-Disposition: inline
In-Reply-To: <20230428191130.nuibhzf3zjoqwpwm-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--8Yxdzj5/graHMF2r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 09:11:30PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Fri, Apr 28, 2023 at 04:11:45PM +1000, David Gibson wrote:
> > On Wed, Apr 26, 2023 at 08:25:58PM +0200, Uwe Kleine-K=F6nig wrote:
> > > The data contained in these nodes can be used to restore labels for n=
odes
> > > (from __symbols__ if -@ is given) and to identify which data values a=
re
> > > references (from __local_fixups__ if -L is given).
> >=20
> > Oh, that's a neat idea.
>=20
> :-)
>=20
> > > The resulting dts doesn't necessarily compiles back into the bitwise =
same
> > > dtb,
> >=20
> > Hmm.. in exactly what ways can it differ?  Is that different from what
> > could happen before?  Generally a dtb -> dts -> dtb round trip should
> > be a no-op to a pretty high degree of fidelity.  That's not true of a
> > dts -> dtb -> dts round trip, since there are many more ways to
> > express things in source form.
>=20
> The actual values of the phandle properties might differ,

Oof.. sorry, I don't think that's an acceptable change for a round
trip of this type.  Couldn't you avoid that if you don't strip out the
'phandle' properties?

> and the order
> of the contents of the __fixup__, __local_fixup__ and __symbol__ nodes.

This.. isn't ideal, but might be tolerable.

> > > but the result is equivalent and easier to modify without breaking
> > > references.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > ---
> > >  dtc.c        | 16 +++++++---
> > >  dtc.h        |  2 ++
> > >  livetree.c   | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++=
++
> > >  treesource.c | 37 +++++++++++++++------
> > >  4 files changed, 132 insertions(+), 13 deletions(-)
> > >=20
> > > diff --git a/dtc.c b/dtc.c
> > > index d2e4e2b55b5c..e36f0dfad313 100644
> > > --- a/dtc.c
> > > +++ b/dtc.c
> > > @@ -335,12 +335,20 @@ int main(int argc, char *argv[])
> > >  	if (auto_label_aliases)
> > >  		generate_label_tree(dti, "aliases", false);
> > > =20
> > > -	if (generate_symbols)
> > > -		generate_label_tree(dti, "__symbols__", true);
> > > +	if (generate_symbols) {
> > > +		if (streq(inform, "fs") || streq(inform, "dtb"))
> > > +			generate_labels_from_tree(dti, "__symbols__");
> > > +		else
> > > +			generate_label_tree(dti, "__symbols__", true);
> >=20
> > Changing behaviour of what we do to the tree based on the input format
> > smells a bit wrong to me.  Should we maybe be importing any existing
> > label information from __symbols__, then re-generating it all cases
> > (effectively merging any symbols from source parsing with ones given
> > in __symbols__).
>=20
> Yeah, that sounds sensible. (Note however that with inform "fs" and
> "dtb" there are no labels in dti, so there is nothing lost here.)
> > > +	}
> > > =20
> > >  	if (generate_fixups) {
> > > -		generate_fixups_tree(dti, "__fixups__");
> > > -		generate_local_fixups_tree(dti, "__local_fixups__");
> > > +		if (streq(inform, "fs") || streq(inform, "dtb")) {
> >=20
> > Similar question here.
>=20
> Similar answer here. :-)
>=20
> I'll rework the patch.

Thanks.

> > > [...]
> > > +static void drop_phandles(struct node *n)
> >=20
> > I don't really understand why you want to remove the phandle properties.
>=20
> As the phandle references are restored the phandle properties hold only
> duplicate information and they might make it harder to further work with
> the resulting dts.

Hrm.. that's not really true, though, since without those you lose the
exact numerical values of the phandles.  Usually that's unimportant of
course, but in certain debugging situations it might matter.

> > > @@ -219,6 +219,9 @@ static void write_propval(FILE *f, struct propert=
y *prop)
> > >  		if (emit_type =3D=3D TYPE_NONE || chunk_len =3D=3D 0)
> > >  			continue;
> > > =20
> > > +		if (m->offset !=3D 0)
> > > +			fputc(' ', f);
> >=20
> > I'm not sure how this change is related to anything else.
>=20
> Without this, the resulting dts might have:
>=20
> 	clocks =3D <&clk 17&clk 19>;
>=20
> I think before my patch this never happend in practise because an array
> never had more than one marker?!

Huh, right.  I'd prefer to see this bugfix separated out into a
preliminary patch.

> > >  		switch(emit_type) {
> > >  		case TYPE_UINT16:
> > >  			write_propval_int(f, p, chunk_len, 2);
> > > @@ -230,10 +233,26 @@ static void write_propval(FILE *f, struct prope=
rty *prop)
> > >  					break;
> > > =20
> > >  			if (m_phandle) {
> > > -				if (m_phandle->ref[0] =3D=3D '/')
> > > -					fprintf(f, "&{%s}", m_phandle->ref);
> > > -				else
> > > -					fprintf(f, "&%s", m_phandle->ref);
> > > +				if (m_phandle->ref) {
> > > +					if (m_phandle->ref[0] =3D=3D '/')
> > > +						fprintf(f, "&{%s}", m_phandle->ref);
> > > +					else
> > > +						fprintf(f, "&%s", m_phandle->ref);
> > > +				} else {
> > > +					cell_t phandle =3D fdt32_to_cpu(*(const fdt32_t *)p);
> > > +					struct node *n =3D get_node_by_phandle(root, phandle);
> > > +
> > > +					if (!n) {
> > > +						fprintf(f, "&??");
> >=20
> > In this case you will present strictly less information than before
> > "&??" instead of whatever integer value was there.  That doesn't seem
> > ideal.
>=20
> I don't think that keeping the previous integer value is beneficial. The
> phandle properties generated when compiling to dtb again will likely
> differ on recompilation and so the previous value might lead to silent
> inconsistencies. So this should result in some human attention.
> Generating a broken dts is one option (the one I chose), I think the
> only other half-way sane option is to abort with an error.
>=20
> > > +					} else {
> > > +						if (n->labels) {
> > > +							fprintf(f, "&%s", n->labels->label);
> > > +						} else {
> > > +							fprintf(f, "&{%s}", n->fullpath);
> >=20
> > DT paths can have some slightly odd characters in them, have you
> > verified that you don't need any escaping here?
>=20
> what would need escaping? A '}'? Looking at the grammar files I don't
> spot a way to quote things here. Am I missing anything?

Ah.. yes, I think you're right.  Actually, it more or less has to be
ok, because we don't do any de-escaping when parsing references like
that.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8Yxdzj5/graHMF2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRSakQACgkQzQJF27ox
2GeP2g/9G7/AMe4iXIv3CNy4lEXopdiZF7tSz1G4dOq5zYTXdmn8l4FUk889WPa/
barcl112u8YFIeTnhCZ1iXiwOu7h2J/iiY4wVvSzRgV6gpbFCAlN5ISR+54Kxaeq
KtfhsrXXdto8NJb0SRaX4GOHQxyHN3PlrTygRPsmQoQjHioFtVCr+CEqAMHPSnOj
1XmGbqEzHGo+g6tAtg5PkZxsk8R3HfPxpdD/m3+bflDfEZM3FESEw9yMnemDheoz
q470dD3ozB5VlxrLLaM3v6k0eCMw69ELG0PbdPMJVi8ZzAq+dnQ5x7uoSuOAYBic
Z4hHew6fku89YR4pEzHVGn3Nkaoc8xz2eibmhgu7fSqNeX0eMZaUNbtcbu+0Uoz9
+bvMK4bQRw3qgT6BFo7O+POhtwvsAX6g+bK/GlGSpMPM6gNxZYmgGgzMTEevA1zX
YHjFZnj1JXMnXtxsxBg3iVpadSq+UhHsZZzdVUoa/qr7I068yN9KG2gVtbxOkegX
KzklMF+vXXhbyE197G4FFV2zdS01UjW360Y8BXFzSzFPNNZhor4+Ten4CW+b8X3H
6vX3SWdQ9dJqB2ueufyeT/okPJ/F2Pdt03yYKGUiV/7vF66S5Z+vzKQaYO3Yo2ab
a7KEsRpltRq6N91otab8xoDtp16TUL6oeb43rdnokBe4UdW39IQ=
=+1R/
-----END PGP SIGNATURE-----

--8Yxdzj5/graHMF2r--
