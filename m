From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] DTC: Fix unprotected file name member access.
Date: Mon, 11 Jul 2016 11:30:53 +1000
Message-ID: <20160711013053.GC16355@voom.fritz.box>
References: <1468189028-1641-1-git-send-email-jcd@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468200546;
	bh=NsYRdYCaVAFK2c0X2t8N7wlZTOqe3xzDhXlZNQPXsNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5tEN5TUzunrdSc0SE38pjuKe2+r4rIKWgTVgmzsrdRJo/D0MXAN847DaS555UtiC
	 TPKIFcFvboWp8cFOj5VvUKB37Mdg1agQlE9aSp0GEeR324VR7XfrWl2Me6wm67yeNI
	 YjZ/mgPWUCi3h16DYq94VWDxLBMSvlYntMJ3xlgo=
Content-Disposition: inline
In-Reply-To: <1468189028-1641-1-git-send-email-jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org


--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 12:17:08AM +0200, Jean-Christophe Dubois wrote:
> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

A patch like this really needs a commit message describing when the
situation it's guarding against can occur.  In this case when can
pos->file be non-NULL, but pos->file->name =3D=3D NULL.

It's not exactly high priority, since srcpos_dump() has no current
users AFAICT.

> ---
>  srcpos.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/srcpos.c b/srcpos.c
> index af7fb3c..927ac54 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -252,7 +252,7 @@ void
>  srcpos_dump(struct srcpos *pos)
>  {
>  	printf("file        : \"%s\"\n",
> -	       pos->file ? (char *) pos->file : "<no file>");
> +	       (pos->file && pos->file->name) ? pos->file->name : "<no file>");
>  	printf("first_line  : %d\n", pos->first_line);
>  	printf("first_column: %d\n", pos->first_column);
>  	printf("last_line   : %d\n", pos->last_line);
> @@ -267,7 +267,7 @@ srcpos_string(struct srcpos *pos)
>  	const char *fname =3D "<no-file>";
>  	char *pos_str;
> =20
> -	if (pos)
> +	if (pos->file && pos->file->name)
>  		fname =3D pos->file->name;
> =20
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXgvbNAAoJEGw4ysog2bOSvKkP/i4YUZzHTBDsZZdfYoQXXZDA
KPEuYFXEqKIPOyV6sOiZUqe/NAUPyO033J+5+7a9q3jyEdVGRaWpA/j/pa69VScZ
ebBSzUrocOZI3pXvAwQDAT2wqRpSv7ttSWvNWj8Jnaz2x+nlcCNWFxqrBFLp/Hbi
huF70zLHFEMhNC/cWNUhW1CIpCPMJNaENv+qPoMA2wKmHnVjpG8boM+xQ7JJaSxb
Rm4qlUQE5GGgXfzm9jVLKE/hWSVvy+KD1Z7QCrpwa8sryky4nO/BlJ6dFEqrtG25
8EpfANbXueZgAh5yj3XcCErhrtnMCcevJT0h6uTBNn8VFZ4+1zbeG7hETvOsF01h
oDu/5igHszfsfU96ylzZlbyWurFPJMWDDSYzwWj3Xykm27YHHsXW3Yyg495OHGiD
66IdfKiGmi2o+sqPyLBcJp8f9z39o/6Wm5KrWsVN3Pxzxy6uzurHxWB/vm9herqZ
I9lfREBX0KsYyAEy2g4a8i3FYLdgRvEc5twxKLkLwOULkgTKuUizfxcuiPVC/qeb
CH77HeDgPJ+hzcTmVPe277jQEyjhw3x6AjN6zIeKVkgDz/oUDGunhu79QeyGE03P
6MKoUpoDuyNkPKqGsWMr3dtZ6NfwEMzXUj/hQ/xtYVfBEB6AtAyVipjW9jdoZdlg
pJcmysB51nHfc7O+6Wul
=DOGl
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
