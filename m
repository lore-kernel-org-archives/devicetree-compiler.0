From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in
 base fdt
Date: Fri, 12 Jan 2018 16:33:10 +1100
Message-ID: <20180112053310.GL24770@umbus.fritz.box>
References: <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <CACNAnaG=kcaUFFH7Dh70o1x-=1WxgJJGE1s0zsTdLvdYCcviMg@mail.gmail.com>
 <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
 <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com>
 <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
 <41a2006b-9b54-d803-7a28-457091db6f42@gmail.com>
 <CACNAnaGoZ+Ne6-d75q7bRokQ-Kr4iDr5kJAEXUybYvw2g2cbPg@mail.gmail.com>
 <5c11d86d-da33-ece5-3170-8fa0bbe5b546@gmail.com>
 <CACNAnaER1_EW0_HSWcViSiGPTqoLKkh-JF0UKLN1hAwzxhizvw@mail.gmail.com>
 <79ae4708-6a55-a6b6-7eaf-e473baa2c1ac@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iK/wEI4vkfDmI6Zw"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515735351;
        bh=3wLdADMwhnloi69vX8fbV+IbdvfYfkUtKRP1viQTO4s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CkSMZHKLl+6rgfva88DzWVrO5Mn9zCtXzr8/PDNFbQ77m7XYfRdrc2Y0Pgh1Mr7NA
         DnXv/gHZ6qC/sObfB8KelRF4ubwojWxtALMTs/OgaMd4pHd/rroKubmnOcQs5IajLC
         s5GNZtmgKr4Y1SH3LIljKiCnM43hhDnp4m9bkPhQ=
Content-Disposition: inline
In-Reply-To: <79ae4708-6a55-a6b6-7eaf-e473baa2c1ac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--iK/wEI4vkfDmI6Zw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2018 at 12:40:13PM -0800, Frank Rowand wrote:
> On 01/04/18 21:47, Kyle Evans wrote:
> > On Thu, Jan 4, 2018 at 11:02 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
> >> On 01/04/18 19:50, Kyle Evans wrote:
> >>> On Thu, Jan 4, 2018 at 9:14 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> >>>> On 01/04/18 18:39, Kyle Evans wrote:
> >>>>> On Thu, Jan 4, 2018 at 7:55 PM, Frank Rowand <frowand.list-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> >>>>>> On 01/04/18 13:47, Kyle Evans wrote:
> >>>>>>> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> w=
rote:
> >>>>>>>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> =
wrote:
> >>>>>>>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list@gmai=
l.com> wrote:
> >>>>>>>>>> [... snip ...]
[snip]
> > Your implementation knows what my overlay means otherwise because I
> > reference a labelled node using &foo, dtc generated a /__fixup__ for
> > it, your implementation takes that /__fixup__ and does the lookup in
> > the symbol table. The symbol exists and points to a node, what's the
> > point of rejecting it there?>=20
> > It seems unreasonable to me, because you cannot always control the
> > source of your live tree. In many cases, sure, it's generated in-tree
> > or in U-Boot and passed to you, and you can reasonably expect you
> > won't encounter this. What if you have vendor-provided tree?
> >=20
> > I think the point I'm getting at is that it seems like this will have
> > to change at some point anyways simply because you can't control all
> > sources of your devicetree, and this isn't strictly wrong. Telling
> > someone "No, we can't apply that overlay because your vendor's
> > internal tool for generating dts and $other_format_used_internally
> > simultaneously didn't generate a phandle for that" is kind of hard,> es=
pecially when your reasoning ISN'T "their blob is malformed" or
> > "your overlay's reference is ambiguous" but rather, "we know what
> > that's pointing at, but we just don't generate handles."
>=20
> No, the blob _is_ malformed.  I know there is no official binding
> document for overlays (we do need such things once we figure out
> what we are doing), so this comment is purely my opinion.

In this case it's not a spec for overlays that's the issue, it's a
spec for what base trees require in order to accept overlays.

> The blob is malformed because it was not compiled with the "-@"
> flag.  Mostly not because of anything in the source, although
> again the __symbols__ node should not be hand coded.

I don't think it's reasonable to claim a blob is malformed based
purely on how it was generated, it needs to be something about it's
actualy contents.

So the question is: is "includes a phandle for every node with a
symbol" a requirement for an overlay accepting base tree.  It's never
been explicitly stated, since overlays were just kind of hacked
together rather than fully specced out.  dtc has been written assuming
that is a requirement, BSDdtc has not.

I'm inclined to say "yes, it should be a requirement" on the grounds
that:
    a) that's the interpretation that's more widely deployed already
and
    b) that simplifies the overlay application logic, which generally
       takes place in a more restricted environment than the initial
       compilation.

I'm entirely open to arguments against that position though.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iK/wEI4vkfDmI6Zw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpYSJMACgkQbDjKyiDZ
s5KTDxAA3P/oMcLNLElYsfUJvAKEgHSMcLxhvM8oV/yY1omSG/EwIWb6MbLp+DGQ
tK9VGzKOAgbkpQSUd5c0k2+TS1VUwf6Ukikpp5YYiEbgUm4gqgRlqa9sd8QUkfqk
+LWqW9W5wlXNAYBwCoAkX1XvpQhlLpVR0CCQ7FHTIeUAm2NryUf1Lh9l7iXWoaat
bjLq2wedo+re9seQVAiqEF/mI+ZipPCBAfydayYGmaTlNpq29YNcIY4o2vizjqLO
4TxAtelajuYrM6yYIM2pvUA5+VS011ESYHcuQHMXMM+yJKTkwfHYIdBUvNxuzYLl
ut8esZuZSOGKA2nRGANCc+/cdK4dhD1RJYlQGnCiBbndKMuODfK52iN1aIaAQE2l
ADlcGFh+HAWkNphHkDBHjoANxV3T94LXQrimGuqkMlxyRjB8NvsuXQmsvrTsssvQ
grQclvv9jK5cNIY+EpQkF27ChXGpsQ9m1pMoMWcwExjCyWM5LVzbhe+L4rye6A3h
MSV42Bfkp4euS6EIY03IdrNyMxZmgZvmmjPTpkspZGGe4ZdZYjem8fX/4OtxUDYZ
lcjgQK4/JS1hxlHy6X1rloBRuF9OxOZyCLTY8aEw74L2tYgkqfAeyVS0zMZbAJWz
8HOVvs7sETfBopb38OHzXsHL+5fI0ihFuD2Ryu4tz8CC57XwYbA=
=kpSb
-----END PGP SIGNATURE-----

--iK/wEI4vkfDmI6Zw--
