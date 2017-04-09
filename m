From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix a few whitespace and style nits
Date: Mon, 10 Apr 2017 01:38:07 +1000
Message-ID: <20170409153807.GH27571@umbus>
References: <20170408161442.9064-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tcC6YSqBgqqkz7Sb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1491753712;
        bh=NTiLnC+EiBVOjXCUY1paBJu0FL6QYway5RRImJAzi0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=No9+kP7khb+qsUQ9XDv0n7V4Zgk2TkcZsFrGQHinMaGpSlquNJAdkAbXkvs0ROhvy
         VYBBqKuj7D97DntZZYX5G3qtXUJM9sbI+WxVeCexOUmz4tGSMUyYuF5kVD/n4fgkR8
         PTRL5ILUr0KJOj6P3FzjrsV/9nf6Qi1et1MmT9Zk=
Content-Disposition: inline
In-Reply-To: <20170408161442.9064-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--tcC6YSqBgqqkz7Sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 08, 2017 at 10:14:42AM -0600, Simon Glass wrote:
> These were noticed when synching with U-Boot's downstream tree.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied, thanks.

> ---
>=20
>  libfdt/fdt_empty_tree.c | 1 -
>  libfdt/fdt_ro.c         | 4 ++--
>  libfdt/fdt_rw.c         | 4 ++--
>  libfdt/fdt_wip.c        | 4 ++--
>  4 files changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/libfdt/fdt_empty_tree.c b/libfdt/fdt_empty_tree.c
> index f72d13b..f2ae9b7 100644
> --- a/libfdt/fdt_empty_tree.c
> +++ b/libfdt/fdt_empty_tree.c
> @@ -81,4 +81,3 @@ int fdt_create_empty_tree(void *buf, int bufsize)
> =20
>  	return fdt_open_into(buf, buf, bufsize);
>  }
> -
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 3d00d2e..08de2cc 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -60,7 +60,7 @@ static int _fdt_nodename_eq(const void *fdt, int offset,
>  {
>  	const char *p =3D fdt_offset_ptr(fdt, offset + FDT_TAGSIZE, len+1);
> =20
> -	if (! p)
> +	if (!p)
>  		/* short match */
>  		return 0;
> =20
> @@ -327,7 +327,7 @@ const void *fdt_getprop_namelen(const void *fdt, int =
nodeoffset,
>  	const struct fdt_property *prop;
> =20
>  	prop =3D fdt_get_property_namelen(fdt, nodeoffset, name, namelen, lenp);
> -	if (! prop)
> +	if (!prop)
>  		return NULL;
> =20
>  	return prop->data;
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 3fd5847..8b487f6 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -207,7 +207,7 @@ static int _fdt_resize_property(void *fdt, int nodeof=
fset, const char *name,
>  	int err;
> =20
>  	*prop =3D fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
> -	if (! (*prop))
> +	if (!*prop)
>  		return oldlen;
> =20
>  	if ((err =3D _fdt_splice_struct(fdt, (*prop)->data, FDT_TAGALIGN(oldlen=
),
> @@ -323,7 +323,7 @@ int fdt_delprop(void *fdt, int nodeoffset, const char=
 *name)
>  	FDT_RW_CHECK_HEADER(fdt);
> =20
>  	prop =3D fdt_get_property_w(fdt, nodeoffset, name, &len);
> -	if (! prop)
> +	if (!prop)
>  		return len;
> =20
>  	proplen =3D sizeof(*prop) + FDT_TAGALIGN(len);
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index 6aaab39..5e85919 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -82,7 +82,7 @@ int fdt_setprop_inplace(void *fdt, int nodeoffset, cons=
t char *name,
>  	int proplen;
> =20
>  	propval =3D fdt_getprop(fdt, nodeoffset, name, &proplen);
> -	if (! propval)
> +	if (!propval)
>  		return proplen;
> =20
>  	if (proplen !=3D len)
> @@ -107,7 +107,7 @@ int fdt_nop_property(void *fdt, int nodeoffset, const=
 char *name)
>  	int len;
> =20
>  	prop =3D fdt_get_property_w(fdt, nodeoffset, name, &len);
> -	if (! prop)
> +	if (!prop)
>  		return len;
> =20
>  	_fdt_nop_region(prop, len + sizeof(*prop));

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tcC6YSqBgqqkz7Sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY6lVdAAoJEGw4ysog2bOS5q8P/0XfmMYyrfJFbl0ORlk74OrR
vfJPI6t3bmj1NPx5raaIQOi8bAAeUDIf3JupRNbpOrb6yg1Zu5A62V/wJwe+Rh0J
VcETjff5mYEn/shB5X++Ei4G64fxnsPY4kkH4b3Swgjc8GId6CG05bg/XSa+ApF+
5xEbICjW99f0ZzcQ2ITiSex6bh6vUFALxTH+GaOhkmwR5kDo16GI5ENWac63Ccig
1ec89PkID3Zpb++WedDIGn2wjvaH0lWIrCLRR5+gBJ2AhA4o/pUtFxlOvpcw7FNP
+2u2sXOa1LgQqa1wJla5nWPZvc1cH8+LRTaCqNsII2Qqal8XYa42o1RsoLYMgNV+
0L95R/ZEBBVR1gneMuvv3oLK3FH78Ao0kZPlmu9Wa0bWybOrGOvn4P3pZXtLafzg
E7k6+eSlKnpN0eXjkgmxRwPo+g0MjcH1odr+SEO4vawJzXGq2qRhlAyKt62T/zc2
nsw7tr0CXv2O+8E88Y4bz2uyQ7KvksgPVHITKZI+KzE/2wKBMK0mAY9fbmDCh7EF
6xDh7PBn1Hf4Or4t5L0mbGnSnhn/kQUr/nnQDx1v2a+NKZQjEUtrkFve7jHQrM6v
evEum0nsS2HpXvfN70Lpmcd0VdSD8P2fj7YeL8IAErinwvUA3QnBsDVgmIQdGPti
DIJlbJG+qJdQeDYEqA6I
=g1uU
-----END PGP SIGNATURE-----

--tcC6YSqBgqqkz7Sb--
