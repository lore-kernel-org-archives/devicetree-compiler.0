From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add missing errors to fdt_strerror()
Date: Fri, 4 Nov 2016 07:18:59 +1100
Message-ID: <20161103201859.GA4282@umbus>
References: <1478188062-8219-1-git-send-email-b-fair@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1478262966;
        bh=Ntx3f4y1nRzQhYtbsov3rKONnqWqbMAWfwc2Jdsr6MQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pbySg4VmlVIXQztavyNNseJyBbBlUET+GEIupNOT0ejd6Hy0RNCigiH+tj01QcnOK
         4YCLPs2R3e04HieGaFn2H8CLXFOm0QzPZ3od8aWi2EErDwz480f2AlbLg0eZ/gHRIu
         zuWp9R4E/AiBc36lRW3kFeKbx1A217//JyLPPhUE=
Content-Disposition: inline
In-Reply-To: <1478188062-8219-1-git-send-email-b-fair-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2016 at 10:47:42AM -0500, Benjamin Fair wrote:
> Some error values were missing from the table which meant that they could
> not be translated by fdt_strerror().
>=20
> Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_strerror.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
> index 4ab3eb7..9677a18 100644
> --- a/libfdt/fdt_strerror.c
> +++ b/libfdt/fdt_strerror.c
> @@ -77,6 +77,9 @@ static struct fdt_errtabent fdt_errtable[] =3D {
>  	FDT_ERRTABENT(FDT_ERR_BADVERSION),
>  	FDT_ERRTABENT(FDT_ERR_BADSTRUCTURE),
>  	FDT_ERRTABENT(FDT_ERR_BADLAYOUT),
> +	FDT_ERRTABENT(FDT_ERR_INTERNAL),
> +	FDT_ERRTABENT(FDT_ERR_BADNCELLS),
> +	FDT_ERRTABENT(FDT_ERR_BADVALUE),
>  	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
>  	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
>  };

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYG5uwAAoJEGw4ysog2bOSOL4P/0pwpmtB9aKapGQldAlaRmbX
yrQORV8B4u1q24996P5xnmXBTMgv3ZkneLT/VMROUKg9dstpChvEvcqePRmZTLBV
ztzpBaEKmR5WM2Qb7rjJ3XK4QXoD0UG6I2wli3TIhYZD983WSd2dI89faVqyS6lm
tNVoWocanIes0NYBbcQjVZkwjjt6xu8+XsMk1a4pWZWXkb1fsK1aelMDdeb5zR/1
u8Ibd/n4T/U0lkVouplTo5GIKstXO3b2T3165gPYV5UUHxQEvEnFGt+zYsAQJAd6
y0U+pdSbcmornDUBSp2lRRCsk4rw4+js7GMWXztqpiHXbOsEibxTqRnBqxvzALfL
QhyRH629vXV75e9RaJb3UyXR/7s3juVAKMMVENTOnBYUEvJWFOhbg0tRUjusED2U
DOMM0Q9h9rsHorJZFUVgaTxdoQecjCAMwLPR59U12G3roQ0SwpAPomd/ePpOzuHY
SpR88RDXGHO77UAc+k9vCip7jvyn4qBZerqXYeQ4QlmFcuc5VZ334BHdEaz31WD8
0722ueMah9T68wHcNRW+r5bGoScvuLWwUusMd7gcNX2gn7pQR42iNp6ULvQxJJZH
NzbuOMOhBhdJR8xFu/QJl+oOg/SDzt1W5wgfrjxxrIiN5wQtMxD0pOjHeivleTg+
Q4rg+39ACpq0NneFATm8
=N7wh
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
