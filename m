From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Validate alias property value is a valid string.
Date: Sun, 14 May 2023 16:50:18 +1000
Message-ID: <ZGCEqneXuj4L9uxv@yekko>
References: <20221010100328.2207018-1-mikemcternan@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J4iKtUYSSAXZG+dt"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1684047020;
        bh=h3Hm/5oMnSxeeGg6wCPShL7MMbr5EOsCWhhNhOWaZK8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kNFW289vAn1It5xEk3JpDjP5+ozxBbm3a6UVw5/55vFQ7z2nnE05fa983t9XasN4d
         QvOV+sDT5jcaYOe4TKkAdWqb78BiPz3DclWB8wR2cnbc/4kQgu+RmgPEBRAUBF9kiG
         KJiR3FfDMOS0FAGmFlz2xks9EVTN+d8uZlW+PjIY=
Content-Disposition: inline
In-Reply-To: <20221010100328.2207018-1-mikemcternan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Mike McTernan <mikemcternan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--J4iKtUYSSAXZG+dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 11:03:28AM +0100, Mike McTernan wrote:
> Prevent circular alias resolution causing infinite recursion.

Sorry, I've neglected this forever.  Unfortunately, I'm not really
sure what to do with it.  On the one hand, this does prevent infinite
recursion which supports the libfdt design goal of being robust
against being given bad trees.

However, although the modern device spec does say "full path"
(although I'm not sure it spells out exactly what that means), I have
a fairly strong memory that IEEE 1275 did allow aliases to reference
one another.  Ideally I'd like libfdt to be able to handle trees which
are transcribed from Open Firmware as well as more modern dtbs created
with dtc.

> Signed-off-by: Mike McTernan <mikemcternan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  libfdt/fdt_ro.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 9f6c551..870c4a5 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -525,13 +525,27 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeo=
ffset)
>  const char *fdt_get_alias_namelen(const void *fdt,
>  				  const char *name, int namelen)
>  {
> +	const char *prop;
>  	int aliasoffset;
> +	int prop_len;
> =20
>  	aliasoffset =3D fdt_path_offset(fdt, "/aliases");
>  	if (aliasoffset < 0)
>  		return NULL;
> =20
> -	return fdt_getprop_namelen(fdt, aliasoffset, name, namelen, NULL);
> +	prop =3D fdt_getprop_namelen(fdt, aliasoffset, name, namelen, &prop_len=
);
> +	if (prop && !can_assume(VALID_INPUT)) {
> +		/* Validate the alias value.  From the devicetree spec v0.3:
> +		 * "An alias value is a device path and is encoded as a string.
> +		 *  The value representes the full path to a node, ..."
> +		 * A full path must start at the root to prevent recursion.
> +		 */
> +		if (prop_len < 2 || *prop !=3D '/' || strnlen(prop, prop_len) !=3D pro=
p_len - 1) {
> +			prop =3D NULL;
> +		}
> +	}
> +
> +	return prop;
>  }
> =20
>  const char *fdt_get_alias(const void *fdt, const char *name)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J4iKtUYSSAXZG+dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRghJUACgkQzQJF27ox
2GdZAA/+OjennVOxtFC37UUcZNMJNaEv1L/90vIEjgTmzoQQRAwNAx0TXjrVVJV7
/LPtKYSgESh6aK6wA7bG1Lg+10PPeZJDZ4eruF+DnWO7QpTHOf0Dgg6PDcSouZ8A
1vWXuP1Pt6XK306tZzxiyFcN5uxofRoKVh/NFWBorW5lXliu25kt6CDmnuSlm43i
Ih+3GHkk2Fz1B6WY4P12WiDs+zAQ/P5Z9hITOzd6P1MFWnLx4ysXJ45X/zuSvvAy
vmozNwBPo8d7iogF11nFIuiLTbsgwCjRzKzaCOenicd6Ca8yQmjMLFk2QdBeonzp
gugeqwEJ+VB14mV5n/6HBuUtJAMchV8yUcs4llQV7XOKtuS0U6en5W8PPKLEZwvC
n0co6g91MNaQuCLbGq6fT66vNa+PBjtwFLeXpBLeEon/7IPINoEE4j8J0ehLWyoK
WPR7t/jmmnQ25Xp7Zp11voTbubv992hW+DpLCf37CKbpnGymiu05v1jv04Ip4HJd
9UxdTX55WX7lgoms/a40aUZe9EKpNSxIgR3hiLIPoFnGVrXQ5EEX08yRKRZ2B83o
AZ+Kjy+QyJsD0liyM+1g3RvYkGwdc+zS84qfyhp55TXnlDcLEmlkiWzESk4YcMUk
jGJbMiatDPBACUGA9DyqrEsQGLcjhjf8exb2EncGVy+2eQmxowg=
=5hQV
-----END PGP SIGNATURE-----

--J4iKtUYSSAXZG+dt--
