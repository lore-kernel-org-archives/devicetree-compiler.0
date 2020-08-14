From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: fix fdt_check_node_offset_ w/ VALID_INPUT
Date: Fri, 14 Aug 2020 13:17:48 +1000
Message-ID: <20200814031748.GA12805@yekko.fritz.box>
References: <76064614.bJBAheWMra@noys4>
 <20200813095108.GA181791@yekko.fritz.box>
 <1913141.TlUzK5foHS@noys4>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1597375881;
        bh=AuxCnjhuNb7Wa+K4Rn1dFdPC26p5IO+hBid/6ik7Mgk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CiIpGZY/vmcVsBzG4btVNFm6owp38JCxG34Auuequ//s4UhrNo9lMSaZKpU6Pz3tL
         7w5VCOIJ/zLMxh4HbHYezUjOEm2/ZbgBp/zZ5sUOe314hMxTFsOWQ43rVYS4KaX4dn
         2SKw3L13PtWMJrpoYZPgMDwBykddqLHAyxsxwBFc=
Content-Disposition: inline
In-Reply-To: <1913141.TlUzK5foHS@noys4>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Mehnert <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2020 at 05:26:26PM +0200, Frank Mehnert wrote:
> fdt_check_node_offset_() checks for a valid offset but also changes the
> offset by calling fdt_next_tag(). Hence, do not skip this function if
> ASSUME_VALID_INPUT is set but only omit the initial offset check in that
> case.
>=20
> As this function works very similar to fdt_check_prop_offset_(), do the
> offset check there as well depending on ASSUME_VALID_INPUT.

So, it looks like your mailer has mangled the patch (replacing tabs
with spaces).  Since it's simple, I fixed it up this time, though.

Applied.

> ---
>  libfdt/fdt.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index c28fcc1..37b7b93 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -206,10 +206,11 @@ uint32_t fdt_next_tag(const void *fdt, int startoff=
set, int *nextoffset)
>=20
>  int fdt_check_node_offset_(const void *fdt, int offset)
>  {
> -       if (can_assume(VALID_INPUT))
> -               return offset;
> -       if ((offset < 0) || (offset % FDT_TAGSIZE)
> -           || (fdt_next_tag(fdt, offset, &offset) !=3D FDT_BEGIN_NODE))
> +       if (!can_assume(VALID_INPUT)
> +           && ((offset < 0) || (offset % FDT_TAGSIZE)))
> +               return -FDT_ERR_BADOFFSET;
> +
> +       if (fdt_next_tag(fdt, offset, &offset) !=3D FDT_BEGIN_NODE)
>                 return -FDT_ERR_BADOFFSET;
>=20
>         return offset;
> @@ -217,8 +218,11 @@ int fdt_check_node_offset_(const void *fdt, int offs=
et)
>=20
>  int fdt_check_prop_offset_(const void *fdt, int offset)
>  {
> -       if ((offset < 0) || (offset % FDT_TAGSIZE)
> -           || (fdt_next_tag(fdt, offset, &offset) !=3D FDT_PROP))
> +       if (!can_assume(VALID_INPUT)
> +           && ((offset < 0) || (offset % FDT_TAGSIZE)))
> +               return -FDT_ERR_BADOFFSET;
> +
> +       if (fdt_next_tag(fdt, offset, &offset) !=3D FDT_PROP)
>                 return -FDT_ERR_BADOFFSET;
>=20
>         return offset;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl82AlkACgkQbDjKyiDZ
s5Jl+BAAh1ZYKPjIu/Yvkdf1fBEsqoqKxBW1wzEvGUTAK5iCWrZlcZWAGq5yMy31
z6IUYhE6M8ilT6vVultrQ9dXABB2F4pNpbfb9vGnHVaiOB1LG+Fo7jG/ES7S+rXe
xJsGywRSiEVp+DYwY92quiTJk1hRgf7MgPL7Yl71cl1JWFvA34DMEABB6/UNeCoM
iJBuhYsXTW4DLLyXn1TdHKdcm0DqLMt4meOz4UZGZJp/GhSLavc6ZnR9yxQCuNEq
F+DfitYboPn8qtE6LeEQm9g4eIh4eAJsWwZW3w7CYEzVQIDxPaHkQgNSHh0ctlt8
kP4S9I9KKeVt5NDGmdBK5UWigWehCX0UPS/E1Q77/7PdQ2J6LwPLm3NWMjeKru6G
hk0tep/9Qx9ExrXLBFNyskqFumefWJyLTrF/cWPEvgD2o+MYeQ5la1OduW49U7H1
UbY1PTRsZgsg0PP7Nv6wHUIuTZJqvtJndTMiDEXySCGZCbWtTGk9IQiFN4Ye7UrB
PRS+Yip3GeDXwz4QXP3Sqg9qjjMtvbXeKyEL+Do9yBv0oyunL2Aq6UweBzh1Mrmh
g1WQseIiaKAGzIPXpwZ2wupcAw+iQT++UDGPJPZt3t8cRn22GIZHwPyHQ7BR9PT9
9EZPW71rHo5Zi9ZUboGoc+0bctmO0mDof9oFM0zKulzSmj1YzF0=
=RFLR
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
