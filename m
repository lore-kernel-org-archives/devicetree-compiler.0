From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 4/6] libfdt: libfdt_wip: Fix comparison warning
Date: Fri, 2 Oct 2020 10:30:18 +1000
Message-ID: <20201002003018.GE1844@yekko.fritz.box>
References: <20201001164630.4980-1-andre.przywara@arm.com>
 <20201001164630.4980-5-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+JUInw4efm7IfTNU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601602062;
        bh=7Rhn70cnOYev+0g4Eri+V3yiCngd6AFzeGn3wbhJtq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UOuGf+ZWnQwt7/FLiv9fmnt6LuGQx2GdBD72o4qwnisA5ek2ScwLslxBBky0vzp+/
         lTI7SHEbCxVOk469wQ0Q4a1/YJ15YUYAAnZ1EwzzbqEr74YvVY+3kB7tK3tcCHrBms
         heUIdVrQ9PpURSS51hEpPqGQ2gvNd+cQciUygzqE=
Content-Disposition: inline
In-Reply-To: <20201001164630.4980-5-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--+JUInw4efm7IfTNU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 05:46:28PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_setprop_inplace_namelen_partial().
>=20
> fdt_getprop_namelen() will only return negative error values in "proplen"
> if the return value is NULL. So we can rely on "proplen" being positive
> in our case and can safely cast it to an unsigned type.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_wip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index f64139e..c2d7566 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -23,7 +23,7 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int =
nodeoffset,
>  	if (!propval)
>  		return proplen;
> =20
> -	if (proplen < (len + idx))
> +	if ((unsigned)proplen < (len + idx))
>  		return -FDT_ERR_NOSPACE;
> =20
>  	memcpy((char *)propval + idx, val, len);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+JUInw4efm7IfTNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92dJoACgkQbDjKyiDZ
s5LHow/+KAJtynR9RTnV7Sc4dksWf7Gsyud8ouTIBT5V5aBEAb1H694IeVo+sw7b
PpwnRXNQRoV1p0hn+1Uw37RTHctSmsyb2SBJIWMJt1yvHCAPtyyXs88asWAe/zVb
PSgrCpV238UBcCEhNao4TvPXCRfw5fmgbb5bZZzPX8d7jhxyTMj6pn8lpEQcsWYl
PC9JR1/08/3lrEq4gNJjFXG6XbcPAck0LzYwMj826oU37icZyEFCR2FALHfzGE7O
/yRpP0RV3IfS4/dT1LcTbgxpIeLFj5h59GWtH8cgTC+Q4IzvcMGSMGen3hEWP4Ew
mXOpzQszyUAXcb9i79QaCJkh59qustMft6YACDmlzJAZRPkxTIZ/i0KzYERBprZa
9Tap7dRHROi0KG6yXhylr1qmCl5bbAtvwlUWN4/p73FGa2YCNbnbrFq6l8zasi2N
eUU7ceKhGL6STY1usXlfLBivVPhV9W+Y9cHkmPtFfy3cN2p3AW8q7gUz25GNfxG9
J2WPmiLj8HmNaaYVjFPs41dg6s+ctV7ZkmiEksqdUd0awUHUzYYI/uPXpwAVXQez
NAatCrJ4z6MPRO3gbvqJgBuFrBwxuuuoSUaRNq43tKj7s+8w//BEBZ9GXkViW9NI
wy6DrGJWRpQFaHCRweQLjlhh9xDG2Cqm9p4XcGz5dyYkrjodFDE=
=vW0M
-----END PGP SIGNATURE-----

--+JUInw4efm7IfTNU--
