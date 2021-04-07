From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add FDT alignment check to fdt_check_header()
Date: Wed, 7 Apr 2021 12:45:40 +1000
Message-ID: <YG0c1IZXS5o0/rBR@yekko.fritz.box>
References: <20210406190712.2118098-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gRcbtVLufdpk9aZU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1617770116;
        bh=UOheqzoQexrYaxVlp2M4n8dzJhpiuiZrMRC+/kAkG+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UeuMgLGOM5UojGn1kJxTqP1U8KmpbMFZGvyvtLM/Gvnvt2/AsZlADrqLBAzu0LUlB
         jLi5ut1f3TpOoP4eNadAORiNErvpzbNbno76ZnDMVrUtS7WqnqMk/Zxi/D64e2NZgR
         9kvwZ/M+m0Mc7Wy8yn3vwRkQjVTDsid8MYM0WJkM=
Content-Disposition: inline
In-Reply-To: <20210406190712.2118098-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--gRcbtVLufdpk9aZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 02:07:12PM -0500, Rob Herring wrote:
> Only checking the FDT alignment in fdt_ro_probe_() means that
> fdt_check_header() can pass, but then subsequent API calls fail on
> alignment checks. Let's add an alignment check to fdt_check_header() so
> alignment errors are found up front.
>=20
> Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Good catch.

Applied, thanks.

> ---
> For background, the new alignment check triggered a crash in the=20
> linux kernel. Yes, we should fix the error handling, but=20
> fdt_check_header() shouldn't tell us the FDT is valid only to fail=20
> later on.
>=20
> Maybe we should move the check instead, but fdt_ro_probe_() and
> fdt_check_header() already have a lot of the same checks.
>=20
>  libfdt/fdt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 3e893073da05..9fe7cf4b747d 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -90,6 +90,10 @@ int fdt_check_header(const void *fdt)
>  {
>  	size_t hdrsize;
> =20
> +	/* The device tree must be at an 8-byte aligned address */
> +	if ((uintptr_t)fdt & 7)
> +		return -FDT_ERR_ALIGNMENT;
> +
>  	if (fdt_magic(fdt) !=3D FDT_MAGIC)
>  		return -FDT_ERR_BADMAGIC;
>  	if (!can_assume(LATEST)) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gRcbtVLufdpk9aZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBtHNIACgkQbDjKyiDZ
s5Kmlw/+Ib60twtGRD4QEXjMV+eIfbP2LSZOC5Erj9j/pXBD47rrVs354lpHzJWo
ZMWUgKsfqfMLXYHLINJSOr1jAdpHUnbz0/uf3W/COcV8H/rtVWuhn+409ZP05kc2
fmf9AO3USn3Ql09uectoSiaMl8x3YloBU/z7BvEjIzhLQ8eB3FozlPvzriwIaIGm
aSdyAe2N+6bnHfyqeSkCV7RktPpb3yGe1Ia0zMv4ihGm3ULCgRWyKnNbIHdA/5Uz
RmZ/gnl2kaKNHSw1UfP0i9iyeFi2Px05AJAFe8YwmMe4m0wCnbqGWAO2tm0+AdWx
vF4Bx68XrA/J3/crCYu1wbsG2L9WLXXMQT+QbzvDVWDERlykbo2Kl9gLVihR/kzz
lg1j4hL8b3dho5W2qpGWU7fwejOVjB6/3ERmcmGmBSiypFnrbn4ZAALTjKREtlbZ
AGgXfKCbLEUz4YnneV8xlouLcCdd+QtWiPyOdX08/r3q4WN7/eQaTZvHTKKZ18u7
LPHmUuiY6WDsHou1/UpnFHu8pL6iXgmKM6E6fG8dfFsSLG+Nq1MlcmbjG3MxK3wT
OnqsPBP6jD1WVDvNU3EdMj1QKKCKmj53Ga1Ohy8DKAWJy9PjNMjCVeMkAwyUrxxv
cgznVLCwU4QtAQXAxNK0U0lk3/HlM4crrNgcmnc3QeOhNpeml+s=
=kRhh
-----END PGP SIGNATURE-----

--gRcbtVLufdpk9aZU--
