From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Thu, 23 Jan 2020 20:14:40 +1100
Message-ID: <20200123091440.GQ2347@umbus.fritz.box>
References: <20200117153106.29909-1-trini@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2D20dG0OqTzqkNh7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579771110;
        bh=ZgWHiNYH6kThIFa8Qty3HV6CoTGOGhkUx6bN7P0jYgE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HFEKB0/2QdL3k1CGy8qVAqpwbXzQ7eAve3GsAnWu6VNmAPwmSp2PIjricqNX5p5b1
         A1r4F57cFQ9nv2ESPNqw6wyD6EqTtCPyHN21HGrUUdY+OZMPzHvdvRRUBhGnEK+7Ru
         4Q0YyI25FrF6r2Mm/Ju5B20TE3yxKKx1jzFrVJqI=
Content-Disposition: inline
In-Reply-To: <20200117153106.29909-1-trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--2D20dG0OqTzqkNh7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" introduced
> changes to support unaligned reads for ARM platforms and 11738cf01f15
> "libfdt: Don't use memcpy to handle unaligned reads on ARM" improved the
> performance of these helpers.
>=20
> Ultimately however, these helpers should not exist.  Unaligned access
> only occurs when images are forced out of alignment by the user.  This
> unalignment is not supported and introduces problems later on as other
> parts of the system image are unaligned and they too require alignment.
>=20
> Revert both of these changes.
>=20
> Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
> By way of a little more explanation, looking at the archives it seems
> that the initial bug reporter said that they had a platform that was
> using U-Boot and had the "fdt_high=3D0xffffffff" set in the environment.
> What that does is to tell U-Boot to not do any of the sanity checks and
> relocation to ensure alignment that it would normally do because the
> user knows best.  This later came up on the U-Boot list as once the DTB
> was loaded, Linux is unhappy because it demands correct alignment.
>=20
> I only realized libfdt had introduced changes here when it was reported
> that boot time had gotten much slower once we merged this change in.  It
> would be best to just drop it.

Hmm.  I'm not sure about this.  The commit message makes a case for
why the unaligned handling isn't necessary, but not a case for why
it's bad.  Even if handling an unaligned tree isn't a common case,
isn't it better to be able to than not?

I gather from the previous discussion that there's a significant
performance impact, but that rationale needs to go into the commit
message for posterity.

[snip]
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index fc4c4962a01c..d4ebe915cf46 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(void *fdt, int =
offset, int checklen)
> =20
>  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> =20
> -/*
> - * Alignment helpers:
> - *     These helpers access words from a device tree blob.  They're
> - *     built to work even with unaligned pointers on platforms (ike
> - *     ARM) that don't like unaligned loads and stores
> - */
> -
> -static inline uint32_t fdt32_ld(const fdt32_t *p)
> -{
> -	const uint8_t *bp =3D (const uint8_t *)p;
> -
> -	return ((uint32_t)bp[0] << 24)
> -		| ((uint32_t)bp[1] << 16)
> -		| ((uint32_t)bp[2] << 8)
> -		| bp[3];
> -}

In particular, I definitely think removing the helpers entirely is a
no go.  They're now part of the published interface of the library.
Even if they're not used for reading the internal tags, they can be
used to load integers from within particular properties.  Those are
frequently unaligned, since properties generally have packed
representations.

How much of the performance loss would we get back if we put an actual
conditional on an aligned address in the helpers?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2D20dG0OqTzqkNh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4pY/kACgkQbDjKyiDZ
s5KNoA//S/zvCU3ywdmvEls2O8PpKTr7bBtUkZRH8o1RmPkIfF0IcUAp+zhhXC2h
LffglxdU73kTm+e5KUKpczuKORPsRX+1/dvj9FSrQpLwMhp6S67Hj6EXYCOn4NhY
k3VhHhduOUx0TkLLTND7FshJu3WaW9D9xqc6Vf1fWuFdJYAGBW4HGXAtnhRdyNAD
ZSGtvQPqbhUnu3cB3UUaDtIEacV9jbgoJtlMvlxrES5TWcMW2vTFumQV73DHp1gm
GZdQE3AL1WguuFZFEEXsPSXYuVlKLMyOzUvPKcQJCbs/ooPUddZ7/6JyYNMLj4iF
RJjjrWYKLnlSXIjjLAcZlEjw208sREmQaShfgT9pf0xsTMqkVPNT/UIcLzj6KDjx
/9ZM7pE3oRPQDzsOYVrytcYDDRX7IzkUOla5bmzNDCI0UNnzqw50m07e0MAwglUn
Iy+uEUzssm8KSjWL1zyoOp0IOgvKHAAOSWQfWam7dfS3mg+KbjoCRkdRgq5+INTE
0tLJddYd795ENSyCoObvLwaURHJxw8rLLYl8T6WHu9Kgor27zvjQC7Tzv8JIN+jL
IGm7FXkeKNTmLmGU4K7Gt/YW4gOqYdRmazEphWdzLXRrvXednSlDjdUqj75xzq3N
gxR1Y4NGZmrztBHUVsvQStmqbHHHWQBUYyS8sdt/qEZ+N1xexbc=
=H45A
-----END PGP SIGNATURE-----

--2D20dG0OqTzqkNh7--
