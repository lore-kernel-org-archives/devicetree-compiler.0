From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtput.c: Fix memory leak.
Date: Wed, 13 Jul 2016 12:50:22 +1000
Message-ID: <20160713025022.GE14615@voom.fritz.box>
References: <1468362981-32142-1-git-send-email-jcd@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468378695;
	bh=UddvGbIBuW47hiJ81xCCvgpw1UmJB8CMFJ1FJzvMs+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QXYpu8xx+hk8vK8kkMknZBHT2/8NCzuyR2nRRBrO+m5oCgPjBBpC8Oday8kwRmmF4
	 ai2e9ffy0w5aScfJy8OIYEbvIOleikDGwVlFO5f8Gl4tIg5WFgZZ0S3eb3ubn6QUA1
	 FL2h+LkLJWw2NgaHys8rFv1xstm1sRlN+0aNFJRA=
Content-Disposition: inline
In-Reply-To: <1468362981-32142-1-git-send-email-jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 12:36:21AM +0200, Jean-Christophe Dubois wrote:
> CID 132821 (#1 of 1): Resource leak (RESOURCE_LEAK)
> 12. leaked_storage: Variable value going out of scope leaks the storage i=
t points to.
>=20
> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

As with fdtput, because the program exits immediately after, there's
really no point to this free().

> ---
>  fdtput.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/fdtput.c b/fdtput.c
> index 9b15c53..db65e96 100644
> --- a/fdtput.c
> +++ b/fdtput.c
> @@ -328,7 +328,7 @@ static int delete_node(char *blob, const char *node_n=
ame)
>  static int do_fdtput(struct display_info *disp, const char *filename,
>  		    char **arg, int arg_count)
>  {
> -	char *value;
> +	char *value =3D NULL;
>  	char *blob;
>  	char *node;
>  	int len, ret =3D 0;
> @@ -374,6 +374,11 @@ static int do_fdtput(struct display_info *disp, cons=
t char *filename,
>  	}
> =20
>  	free(blob);
> +
> +	if (value) {
> +		free(value);
> +	}
> +
>  	return ret;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhaxuAAoJEGw4ysog2bOSYv8QAMqJ/mVbQliNsr/lsL68kK0J
FddO0kXc0uwCD60MTJAm2Jmc2DmJnwjhauARMfuUh8193g0InQZUmsKOCSM9yYqO
M7EQibzii9r+agVomFrmG1uvZuC0fLqHIibPAlFz3cNKSnx266WfK+qXf1xQlsCI
pZOyaJc/4M+ysfsTtyVewtu5shWcE4hyB7egOnI/MXrvq0AQ9w/cd/u0Lnxqe7AU
F+/z6LhU7nyxCOApbgGcMGt+DJPS4Ov1xu+0eB1sFSbUtI7D14pIGRzRa+zk7BBK
bQJHyt36F5rHTquuQGh/c1rURmTVITVCl7yL75ibsrK1DEkfVie1PXaA1StVBDsJ
qxLCBoiHTYSt+aUUIqa3E3SXSrZ+LuEoZt6+jtjQK4cYYJAzpWdQivliWzW60D0F
gfPia/qCUhGOQQof/5NTIjD01ZabcwQpBc5hT38wRuw91BSP4527u+djK4N4yELR
16uBenmf7MdQsUfmOzCrplu3ohmKZBukEQzNd7By9lwLrSp23vnglqbRbQ0tTXIE
m4gsoP+M8KTO6oucNLnf7c6lBZEa6KnmAOpVm7gya/jZYxPtOynMEwyeBwCQ4jzx
HdwDkCjEjoz0BLurXkJj286I9O3IXbivQqpcT2ecuTLZDOHsgFsSiq+DoSg/wsff
gEzaLhGKI8idsMnTAusr
=0BO3
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--
