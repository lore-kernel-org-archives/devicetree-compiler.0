From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix some typing errors in libfdt.h and livetree.c
Date: Tue, 27 Sep 2016 11:35:10 +1000
Message-ID: <20160927013510.GB15376@umbus.fritz.box>
References: <1474906346-29392-1-git-send-email-thuth@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1474945461;
        bh=dUbwVA+w96tqHW3rs9drYgScFDHj0jZdOTnTU9ZC4j4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=btGzIaKe95ksh2j8qsi25pQkJ8icaRn/zC3RfweEePXGBE5QV7WuwDhLiNoWPHvPO
         UPWpZHKBhogP6wEI3Y4h+4iDQ1medV7g9lxvFVPWaKk/sUODXlv8Z3tbH39LIUGtX5
         XyMzTWlnOycTi+hNXQajbHhlr4GIeTOUV/0kaOCA=
Content-Disposition: inline
In-Reply-To: <1474906346-29392-1-git-send-email-thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2016 at 06:12:26PM +0200, Thomas Huth wrote:
> Correct some typos discovered with the codespell utility.
>=20
> Signed-off-by: Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/libfdt.h | 4 ++--
>  livetree.c      | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 376e628..ecb11fc 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -61,7 +61,7 @@
>  #define FDT_ERR_NOTFOUND	1
>  	/* FDT_ERR_NOTFOUND: The requested node or property does not exist */
>  #define FDT_ERR_EXISTS		2
> -	/* FDT_ERR_EXISTS: Attemped to create a node or property which
> +	/* FDT_ERR_EXISTS: Attempted to create a node or property which
>  	 * already exists */
>  #define FDT_ERR_NOSPACE		3
>  	/* FDT_ERR_NOSPACE: Operation needed to expand the device
> @@ -700,7 +700,7 @@ const char *fdt_get_alias_namelen(const void *fdt,
>  				  const char *name, int namelen);
> =20
>  /**
> - * fdt_get_alias - retreive the path referenced by a given alias
> + * fdt_get_alias - retrieve the path referenced by a given alias
>   * @fdt: pointer to the device tree blob
>   * @name: name of the alias th look up
>   *
> diff --git a/livetree.c b/livetree.c
> index e229b84..3dc7559 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -204,7 +204,7 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
>  			}
>  		}
> =20
> -		/* if no collision occured, add child to the old node. */
> +		/* if no collision occurred, add child to the old node. */
>  		if (new_child)
>  			add_child(old_node, new_child);
>  	}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX6czOAAoJEGw4ysog2bOSo+0P/A0y8aHwXff1CFSKp+VJbBnR
+7xEXBwAUDR5FR89xg1kqa3tVW4xPcdrSNzhpXFFmdxv29kga0UK7lzPgkzrxNlA
eoxDP7MYDnX75tgmWBxS6/SDqGCvxRIkEY72I+HLV2qszch/wMIwFImbo41z0NJo
jo+L9Zy0CItujkXxUG0UNKu31r5sEqeZVHPDHD/dkH+/iUwz1BhTee41wArZqyCv
OvuhWFdyZNlaC/LYWtueDETZSfdYZsILdcmhhjX0MiLzUegffEkLabN0lOq9pzS/
38sJUfLPAJrk0eX/JcObuMMDMJ0zF8j+d2vGD66HNCDgW6wHcXr9+1uLZ+l2V9bY
QoFdpj7TsbkFAAImJ0DKVV6h9bapjffRlauXB3oAYYe6u764lq1BXZz8faWKGruQ
E1SHwyy3n5nFgW5vrj+cdFw/U8IWItAzbzPXJcTzh0LWNXta2y5J3TPb46vEvFlK
X791ZNGve7BymRXLxQ9OKUTqICeKMma05laNT3R0Px+SScUBUIg6oboFKJS0it8J
zsJVjBCuDCuTjgA5GUCB5F7EKARDsI5fWsYghcs5Fm+lYDARyn9Fgq7IhZ7X8Dc8
IdL3qVRuYG+kvXO3sXwrioeXs25Z67NdSfy90/Omv+ID6CHhnuyZwXmYATj1JbZ/
4OWLge1K8RT0C7rYO0BN
=S+kd
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
