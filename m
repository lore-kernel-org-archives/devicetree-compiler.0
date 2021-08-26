From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtdump: fix -Werror=int-to-pointer-cast
Date: Thu, 26 Aug 2021 10:58:40 +1000
Message-ID: <YSbnQFADMTN7IpLB@yekko>
References: <20210825121350.213551-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2931DPE+KasVrg3o"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1629945599;
        bh=oBRUO5O08ppG0HobSAzNJhsFYr+wzqfWXwGi7cOo5zw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AxN5AuLzsXEt0LfzdSfl9kQbxAiCqxXKgMb6rQU4LRokSckgJvU1/1hKMWlbJH8FW
         JBaBhXht9jLWHipcXoky2HE3/kZfC6Dnp4B4n5/NAFaLFvzHywbh3hlk8ddojotUkM
         dCmUXTE+sMKi7saQZ8QvdOp1vABVTMqIWTA5Fm1M=
Content-Disposition: inline
In-Reply-To: <20210825121350.213551-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--2931DPE+KasVrg3o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 25, 2021 at 04:13:50PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> With mingw64-gcc, the compiler complains with various warnings:
> error: cast from pointer to integer of different size [-Werror=3Dpointer-=
to-int-cast]
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> ---
>  fdtdump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index bdc0f94..d424869 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -21,7 +21,7 @@
>  #define MAX_VERSION 17U
> =20
>  #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
> -#define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
> +#define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
>  #define GET_CELL(p)	(p +=3D 4, *((const fdt32_t *)(p-4)))
> =20
>  static const char *tagname(uint32_t tag)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2931DPE+KasVrg3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEm5z8ACgkQbDjKyiDZ
s5IXEQ/6A80+9zBO4615VWQjfqjc+a406Cqgy4SFXda4CDaxPm0s2puJy/Ai8DPn
gR8SYmUq8Pa1aJHFcFnah0RrHGZ/w6m7xqhTznbMUrhak5t96f70w2NkNltfK93/
LiNEee0iI3ME6Rdity/N0SY9Kb9PmSWwl2n+NcYn5UTtwfTGQXI9ref3SaX9nW4m
NxxyDM0S8kbDXKpnWOJSjHpWuXNayrXIzJ9oM48/5y16qrsT9DNGLQiFKRAjJ0Ik
nqsza424f+t6asao1L6ILo6sepAJpF1ZAksyXUJne0uSW6DC4VMMq+/vmtnZDKGh
k6N0QKIHSsu9YFZWRnwY7MmWQxqVOMQpp9CVM3Zx5RvAqm3vXEKfcrGzUKH9UyJr
MkAsurq3/hkzvXvIFdkzrDOOhmJajMjy6hmYYmZcOKDlgoZgYRMaGxMK3gqEMcxz
2JM+WM4Lwz4Ki+ssC2LOIubYhsh/dlYTNbaJlJFVzEz8B0juemdA28L7JFLz+vpA
WvnRBGzNg1LGnbDPIr8YOEDCg0EVPRLwcaBvSBKo/WtrjnFKJTYTHs7RFyUMnvNz
9Eer11R5rATq97j64hka4OrmkTMUZTuDKcULXg7Xf/K/99WHJhOXRMPTRxre3u+b
QjXW0AqAw3Pebez0rxYHikFyY2EakqA3Wgnr3a/P+fZHRaFIvZI=
=1TVv
-----END PGP SIGNATURE-----

--2931DPE+KasVrg3o--
