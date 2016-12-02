From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add helpers to read address and size from reg
Date: Fri, 2 Dec 2016 14:12:56 +1100
Message-ID: <20161202031256.GB10089@umbus.fritz.box>
References: <1478710712-25010-1-git-send-email-b-fair@ti.com>
 <20161125105125.GJ12287@umbus.fritz.box>
 <2f744a7f-5112-c83e-d47a-ce9fef491dde@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1480648567;
        bh=KpTbaVunm0VRIcTpOXym7g+ZPq+B3Vh/qEPyieCQmS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AL5WWoxGf/mD9MUWkzmv4JlbB6eIb8pw+tmcQCY1CRLmQEXwO5STrb2PrZcNoSxWM
         fwOXRCODfISmOlRNbG5vqWy/xLjTUpIzHPrEUi7kuV36VFmjIWwuBhwRMhAvTBej+Z
         vWun9544LMjHqS8tk2jlPUtbHYhijN4wO39WddEs=
Content-Disposition: inline
In-Reply-To: <2f744a7f-5112-c83e-d47a-ce9fef491dde-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2016 at 01:35:04PM -0600, Benjamin Fair wrote:
> On 11/25/2016 04:51 AM, David Gibson wrote:
> > On Wed, Nov 09, 2016 at 10:58:32AM -0600, Benjamin Fair wrote:
> [...]
> >=20
> > I like the concept of a helper to read entries from reg, but there
> > some things about the execution of it I think need some more thought.
> >=20
>=20
> Thanks for the review.
>=20
> [...]
> > > diff --git a/libfdt/fdt_addresses.c b/libfdt/fdt_addresses.c
> > > index eff4dbc..92cbed9 100644
> > > --- a/libfdt/fdt_addresses.c
> > > +++ b/libfdt/fdt_addresses.c
> > > @@ -55,6 +55,9 @@
> > >=20
> > >  #include "libfdt_internal.h"
> > >=20
> > > +#define BYTES_PER_CELL 4
> > > +#define BITS_PER_CELL 32
> >=20
> > You shouldn't need these.  BYTES_PER_CELL =3D=3D sizeof(fdt32_t).
> >=20
>=20
> Of course. Thanks. I'll get rid of them.
>=20
> > > +
> > >  int fdt_address_cells(const void *fdt, int nodeoffset)
> > >  {
> > >  	const fdt32_t *ac;
> > > @@ -94,3 +97,62 @@ int fdt_size_cells(const void *fdt, int nodeoffset)
> > >=20
> > >  	return val;
> > >  }
> > > +
> > > +static uint64_t _fdt_read_cells(const fdt32_t *cells, int n)
> >=20
> > This is a reasonable helper, but the name is bad.  "read_cells"
> > suggests it can read some arbitrary number of cells, but in fact all
> > it can do is read a 32-bit int or a 64-bit int.  Plus everything is
> > made up of cells, but more specifically what you're doing here is
> > interpreting several cells as an integer in the usual encoding.
> >=20
>=20
> Would "cells_to_integer" be a better name? Or would you recommend somethi=
ng
> else for this?

cells_to_integer would be ok.  Or just fdt_read_integer().

>=20
> > > +{
> > > +	int i;
> > > +	uint64_t res;
> > > +
> > > +	/* TODO: Support values larger than 2 cells */
> >=20
> > I don't really see any way you could support >2 cells without
> > completely changing the interface.
> >=20
>=20
> True. I wanted to have the result be a 128 bit integer, but couldn't find=
 a
> portable way to do so. Is there a better way to go about this? Or is it f=
ine
> to only support at most 2 cells, even though the rest of libfdt supports =
4?

I think just supporting 2 cells is ok - it's useful in enough
practical cases.  However, I'd suggest thinking of this in a more
layered way.

First, create a helper which just locates the relevant pieces of reg
entries, returning addresses and sizes as (fdt32_t *).  That's at
least somewhat useful for the >2 cells case, even though you have to
then parse the address/size yourself.  In the most common case for
this, PCI (address-cells =3D=3D 3), you probably want to do that anyway.
This may also be useful for cases which are <=3D 2 cells, but the
encoding of the address is not just a plain integer.

You can then polish up fdt_read_integer() a bit and export it.

Finally you can add another helper which combines these to directly
get you the addr+size as u64 for buses where that's suitable.  Make
sure to return an error if #a or #s > 2, of course.

> > > +	if (n > 2)
> > > +		return -FDT_ERR_BADNCELLS;
> > > +
> > > +	res =3D 0;
> > > +	for (i =3D 0; i < n; i++) {
> > > +		res <<=3D BITS_PER_CELL;
> > > +		res |=3D fdt32_to_cpu(cells[i]);
> > > +	}
> > > +
> > > +	return res;
> > > +}
> > > +
> > > +int fdt_simple_addr_size(const void *fdt, int nodeoffset, int idx,
> > > +			 uintptr_t *addr, size_t *size)
> > > +{
> > > +	int parent;
> > > +	int ac, sc, reg_stride;
> > > +	int res;
> > > +	const fdt32_t *reg;
> > > +
> > > +	reg =3D fdt_getprop(fdt, nodeoffset, "reg", &res);
> > > +	if (res < 0)
> > > +		return res;
> > > +
> > > +	parent =3D fdt_parent_offset(fdt, nodeoffset);
> > > +	if (parent < 0)
> > > +		return res;
> >=20
> > So, fdt_parent_offset() is very expensive, I wouldn't recommend it in
> > a function that's likely to be called a lot like this.  Instead I'd
> > suggest a function which takes the parent offset as a parameter, and
> > optionally a wrapper that uses fdt_parent_offset().
>=20
> Great idea, I'll do this in the next revision once we have a solution for
> the rest of the comments.
>=20
> >=20
> > > +
> > > +	ac =3D fdt_address_cells(fdt, parent);
> > > +	if (ac < 0)
> > > +		return ac;
> > > +
> > > +	sc =3D fdt_size_cells(fdt, parent);
> > > +	if (sc < 0)
> > > +		return sc;
> > > +
> > > +	reg_stride =3D ac + sc;
> > > +	/*
> > > +	 * res is the number of bytes read and must be an even multiple of =
the
> > > +	 * sum of ac and sc.
> > > +	 */
> > > +	if ((res % (reg_stride * BYTES_PER_CELL)) !=3D 0)
> > > +		return -FDT_ERR_BADVALUE;
> > > +
> > > +	if (addr)
> > > +		*addr =3D (uintptr_t) _fdt_read_cells(&reg[reg_stride * idx], ac);
> >=20
> > I don't think uintptr_t makes sense here.  The addresses in the device
> > tree are in whatever bus they're in, and there are a whole stack of
> > reasons that could be unrelated to the pointer size of environment
> > libfdt is running in:
> >     - The device may be on a subordinate bus whose addresses need
> >       to be translated
> >     - Even at the top-level, the reg properties represent
> >       *physical* addresses, which may not be the same as virtual
> >       addresses  in code running on the system
> >     - libfdt may be running on a completely different system from the
> >       one the device tree in question is aimed at (bootloaders are
> >       only one use case for libfdt).
> >=20
> > > +	if (size)
> > > +		*size =3D (size_t) _fdt_read_cells(&reg[ac + reg_stride * idx],
> > > +						 sc);
> >=20
> > Likewise size_t isn't necessarily right here, although I suspect it's
> > less likely to break in practice.
> >=20
>=20
> Hmm... Is it fine to use uint64_t for both of these instead then?

Yes, I think that's reasonable.  Or you could even use unsigned long
or unsigned long long - as long as you error whenever #cells is too
big for the size of that type.  uint64_t is probably clearer and more
consistent, though.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYQOa4AAoJEGw4ysog2bOSkZQQALmUuvj5H0uhg8iCNunn+H0M
mqG31UPYFLP/zv2E5XMb6Sy88VNLphpVleOdaUMQQdC8aEN89p5jM2OPFArNrfwo
KORAtnPwaok/lPsMc+ALPPU809S5ckKAH3zbDGFRSexi3sGDlSHnnMQL/7d1prAp
XQvzhGwgC4EpNq/DPN5WxZGF+WeBUuAXS5MdB8uiczFEfJuhLgvfK9Z+AvV6JvRh
ZpRHKJ6eQw+6lGcfx5sdACp+dGHyXRd7qi1OoufGlYRQb+6jIIdeeYSHz64PGTYB
iOtbiiGPG6STOtDfFGvqvUvb/b06BDJ5gBHiShwgqQWUvSTHpIe7y2obNY17UU97
Pyd3oeHnhzeXG+X2RYNYkIsC3Oa5tPi+qOwvzOQyA+H/rpP2P3qE/xzvLT6fvTlu
cShHtfKQ1+cQUjQYjCtBIxdKFhIf+hF+q0EKwu68Y+33OMtVmBbKfV93e6fmFDme
SMM0aWz7PUamfgB4ARyTWvJiVfrMtOWZLQm6xc9Y17TwypVmRcvuHMP7r9HyNBDF
pwOY9/h/Y4c3PNzSdrIHzF3Q3dt55lcnibW0NxfcEQ9FrMD0mVqesJvig549scKi
nEDyMeVuIQoyUSOFrNRgFAj6m9Aql/Fi6OUBIOqqJjOtGcAQIL17g2taj9EnaRZq
rVonkEUteLE2LevRndzs
=UdUM
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
