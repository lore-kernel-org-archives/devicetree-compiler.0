From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: Add markers on known properties
Date: Mon, 26 Jul 2021 14:44:25 +1000
Message-ID: <YP49qUsDIvFklb6r@yekko>
References: <20210608204626.1545418-1-robh@kernel.org>
 <20210608204626.1545418-2-robh@kernel.org>
 <YM23achEk4QOEAAk@yekko>
 <CAL_JsqLnbiz-TzH0C0vw57B-1J=N6jBSHeiyv5yKA+Z3+0fWPw@mail.gmail.com>
 <YOuqzf8LtYM4eX39@yekko>
 <CAL_JsqLYx7Zgd2v_CvTiF0yynB2HX=U+ROV-tkT7qqwxFPnjAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bmFlqLFy2WmFucz8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1627274670;
        bh=X4QyNVOQV7sRIIKpbeRN38h339aqzJ4/8UhKH5cQldw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ofn/9SWflZDhsLAvrxufgczTAD8sgvrf/LsVMjuIrzyB+WupjwQwz9O1hLqukQ6TV
         rrj0enNcOYf48wt6U9ZxWHV4UzfyH8uesI4bBUbX5xUbgGW6v+WmNKW/68sD6StPKg
         8XBBk5v15k+PcJarCCWpYZrk+zwqZue7rL1ymb9I=
Content-Disposition: inline
In-Reply-To: <CAL_JsqLYx7Zgd2v_CvTiF0yynB2HX=U+ROV-tkT7qqwxFPnjAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--bmFlqLFy2WmFucz8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 04:15:43PM -0600, Rob Herring wrote:
> On Sun, Jul 11, 2021 at 8:39 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Mon, Jun 21, 2021 at 12:22:45PM -0600, Rob Herring wrote:
> > > On Sat, Jun 19, 2021 at 3:22 AM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Tue, Jun 08, 2021 at 03:46:24PM -0500, Rob Herring wrote:
> > > > > For properties we already have checks for, we know the type and h=
ow to
> > > > > parse them. Use this to add type and phandle markers so we have t=
hem when
> > > > > the source did not (e.g. dtb format).
> > > > >
> > > > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > > ---
> > > > > v2:
> > > > >  - Set marker.ref on phandle markers
> > > > >  - Avoid adding markers if there's any conflicting type markers.
> > > > > ---
> > > > >  checks.c | 102 ++++++++++++++++++++++++++++++++++++++++++++-----=
------
> > > > >  1 file changed, 82 insertions(+), 20 deletions(-)
> > > > >
> > > > > diff --git a/checks.c b/checks.c
> > > > > index e6c7c3eeacac..0f51b9111be1 100644
> > > > > --- a/checks.c
> > > > > +++ b/checks.c
> > > > > @@ -58,6 +58,38 @@ struct check {
> > > > >  #define CHECK(nm_, fn_, d_, ...) \
> > > > >       CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> > > > >
> > > > > +static struct marker *marker_add(struct marker **list, enum mark=
ertype type,
> > > > > +                              unsigned int offset)
> > > >
> > > > Now that this is only conditionally adding markers, it needs a
> > > > different name.  Maybe "add_type_annotation".
> > >
> > > marker_add_type_annotation to be consistent that marker_* functions
> > > work on markers?
> >
> > Sure, that's fine too.  It's a local function, so naming consistency
> > isn't as important as for globals.
> >
> > > > > +{
> > > > > +     struct marker *m =3D *list;
> > > >
> > > > Since this is strictly about type annotations (and you don't have
> > > > parameters for the necessary ref parameter for other things), an
> > > > assert() that the given type is a TYPE_* wouldn't go astray.
> > > >
> > > > > +
> > > > > +     /* Check if we already have a different type or a type mark=
er at the offset*/
> > > > > +     for_each_marker_of_type(m, type) {
> > > > > +             if ((m->type >=3D TYPE_UINT8) && (m->type !=3D type=
))
> > > >
> > > > I'm assuming the >=3D TYPE_UINT8 is about checking that this is a t=
ype
> > > > marker rather than a ref marker.  Adding a helper function for that
> > > > would probably be a good idea.  Putting it inline in dtc.h would ma=
ke
> > > > it less likely that we break it if we ever add new marker types in
> > > > future.
> > >
> > > It's checking that we don't have markers of a different type within
> > > the property. While that is valid dts format, it's never the case for
> > > any known (by checks.c) properties.
> >
> > That comment doesn't seem to quite match the thing above.
>=20
> The comment applies to both 'if' conditions. I can make it 2 comments.

Sorry, I wasn't clear.  I didn't mean the code comment I meant your
remark in the thread "It's checking that...".  It didn't seem apropos
to my comment it's in reply to.

> > Besides, I don't think that's really true.  It would be entirely
> > sensible for 'reg' to have mixed u32 & u64 type to encode PCI
> > addresses.  Likewise it would make sense for 'ranges' to have mixed
> > u32 & u64 type if mapping between a 32-bit and 64-bit bus.
>=20
> Yes, we could have all sorts of encoding. We could mix strings, u8,
> u16, u32, and u64 too, but we don't because that would be insane given
> next to zero type information is maintained.

Who's "we"?  My point is that you're interacting with user supplied
type information, and we can't control what the user supplies.

> But this isn't really about what encoding we could have for 'reg' as
> if we have any type information already, then we do nothing.

But.. that's *not* what this logic does.  It's quite explicitly more
complicated than "if there's any other type information, then do
nothing".

> This is
> only what is the encoding when there is no other information to go on
> besides the property name. IMO, that should be bracketing each entry
> which is all we're doing here. Maybe you disagree on bracketing, but
> as a user shouldn't I be able to get the output I want?

Yes... that's my point...

> Debating it is
> like debating tabs vs. spaces (BTW, dtc already decided I get tabs).
> So maybe all this would be better in a linter, but we don't have one
> and if I wrote one it would start with forking dtc. We could make this
> all a command line option I suppose.
>=20
> > > It could be an assert() as it's
> > > one of those 'should never happen'.
> >
> > An assert() should only be used if the problem must have been caused
> > by an error in the code.  Bad user input should never trigger an
> > assert().
>=20
> Maybe I misunderstood what you suggested an assert() for.

I didn't, you were the one suggesting an assert().

> > > > > @@ -774,10 +811,16 @@ static void check_reg_format(struct check *=
c, struct dt_info *dti,
> > > > >       size_cells =3D node_size_cells(node->parent);
> > > > >       entrylen =3D (addr_cells + size_cells) * sizeof(cell_t);
> > > > >
> > > > > -     if (!is_multiple_of(prop->val.len, entrylen))
> > > > > +     if (!is_multiple_of(prop->val.len, entrylen)) {
> > > > >               FAIL_PROP(c, dti, node, prop, "property has invalid=
 length (%d bytes) "
> > > > >                         "(#address-cells =3D=3D %d, #size-cells =
=3D=3D %d)",
> > > > >                         prop->val.len, addr_cells, size_cells);
> > > > > +             return;
> > > > > +     }
> > > > > +
> > > > > +     for (offset =3D 0; offset < prop->val.len; offset +=3D entr=
ylen)
> > > > > +             if (!marker_add(&prop->val.markers, TYPE_UINT32, of=
fset))
> > > > > +                     break;
> > > >
> > > > I don't see any point to adding multiple markers.  Each type marker
> > > > indicates the type until the next marker, so just adding one has the
> > > > same effect.
> > >
> > > Multiple markers is the whole point. This is to match the existing
> > > behavior when we have:
> > >
> > > reg =3D <baseA sizeA>, <baseB sizeB>;
> >
> > Urgh, because you're using the type markers for that broken YAML
> > conversion.  Fine, ok.
>=20
> Uhh well, type markers were added in the first place to support YAML,

No, they weren't.  They were added first so that dts -I dts -O dts
would preserve input formatting more closely.  Shortly afterwards they
were used for the YAML stuff.  They're taking what was originally just
a user choice of input formatting and giving it semantic importance,
which I have always thought was a super fragile approach.  But, I've
merged it anyway, since people seem to really want it and I haven't
had time to work on something else myself.

> but they are used on the dts output as well which has changed it a lot
> from what was output before. The YAML and dts code is just about the
> same in terms of how the type information is used. If anything is
> broken, it's the dts output guessing. Multiples of 4 bytes are always
> UINT32 data?

dts output was never supposed to be reliably type accurate - just like
any decompiler.  It was just trying to take a simple guess for
convenience in debugging.  It *does* guarantee that the -O dts output
will produce byte for byte identical dtb output if you feed it back
into dtc.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bmFlqLFy2WmFucz8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD+PacACgkQbDjKyiDZ
s5KJeA/+NLO7SA26p53XAjM0CthT2zFIhR41VVFMJECPHebLUmLcsiZmW83/wvuq
/Gp92sjBHvaHzk3fbDg5PDylvBNk+ugd/nS402LBbRewZ408Fi1OUwlL3bjun2t4
W0kmWs4bEY1BsnbD9kdme5AKYrRtKE4JeS0wAvBXDrgxoSX6YU6q0dKQvrR+16mD
sdvIkjiTERYucOfQJPilcWcponmsSJKS/rvDT5FREUyaBf4xzlZ/pf5pEZ5jcOg5
8ff+v9iGyDfyvqntG4wjW9V5qvzxYGPdAOVOeWrodZAoe/oleumV2wkjvj2iBfKL
Pw9lcY6U/U6wnaxI+WV6zEUkFRAoQsgrQLF4DfU7SYyzCDZkeKCGKpozOHhokYI2
IKuInZctbI7cNjaZm9VnaCm/OHZwNnx6NXIXU2coEVkrykiBmYx054zqpXTuF5gq
JnUEvz/ULgImW0uHVkYQmosmvFkQ0yceXpJ24Hg0z+cVAcnY0w1NYoZ+E2JQoC/A
WHOKuprTJrnw2zKz5/aYxyVAnKspHKFWKA+7Pwi4lK2PD06IWyFP3gFKQgvdVyXh
G8pb7GRYdJLYWzdVSPQIlp3iQyC1lvlhDd+q17LX/1pm9kyP/CQavh9xtYsGk87e
v3obP6ik+dkFQktGCodE5SnSbff/QPLEUI+/IsZfTuuLudZPAnc=
=cAqg
-----END PGP SIGNATURE-----

--bmFlqLFy2WmFucz8--
