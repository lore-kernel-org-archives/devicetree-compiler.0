From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: fix fdt_check_node_offset_ w/ VALID_INPUT
Date: Thu, 13 Aug 2020 19:51:08 +1000
Message-ID: <20200813095108.GA181791@yekko.fritz.box>
References: <76064614.bJBAheWMra@noys4>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1597312571;
        bh=yVQCNQhMzqAKkwyfnGtgu90gkhFnTiaHgZPm5epM/EQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aDl9jBpDadgzcd0zPrx4HfcPxVITsHDnsWYdeHpZrD2ApUroVLzi2IS+n+w7EXYG9
         icYVC3zXdbWud7zJymGvCzqIe8aSX95LkF6rt7KIxCdshSPRokc91Di7Bl/2yUHVOO
         UP/P4mPJnnUxJydrL6KFqR0krQx75ZKX+HsTD9e8=
Content-Disposition: inline
In-Reply-To: <76064614.bJBAheWMra@noys4>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Mehnert <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2020 at 09:55:09AM +0200, Frank Mehnert wrote:
> fdt_check_node_offset_() checks for a valid offset but also changes the
> offset by calling fdt_next_tag(). Hence, do not skip this function if
> ASSUME_VALID_INPUT is set.
>=20
> Actually this works similar to fdt_check_prop_offset_().

Correct, but we can do better.  We can still elide the checks for
offset < 0 and offset % FDT_TAGSIZE when VALID_INPUT is set.

> ---
>  libfdt/fdt.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index c28fcc1..39ed8ed 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -206,8 +206,6 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>=20
>  int fdt_check_node_offset_(const void *fdt, int offset)
>  {
> -       if (can_assume(VALID_INPUT))
> -               return offset;
>         if ((offset < 0) || (offset % FDT_TAGSIZE)
>             || (fdt_next_tag(fdt, offset, &offset) !=3D FDT_BEGIN_NODE))
>                 return -FDT_ERR_BADOFFSET;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl81DQkACgkQbDjKyiDZ
s5IiXRAAwT+8t9HKIayq62zr4Kc7IUDSdBd2xM2Vb0uLgaOxCPyo4hOQtD4b+nmd
2A4QDXCDIKtA0uhe47Cc/SABbe9lrWEdR/M8sW/Uw3VybV+ST5KzmSQ+V/wPu5OH
gGdW3VR9gHnzybz34WqJjQbJKvdFh958OK67rNJPYCoD0K4iLmQa9HxfWvUOp3pl
Div3LXVjjg/0bLxvkGhz5wQDlAWQtG7YCBR7xNHjUqFEKfziCJvtJsiBEo0KGODA
nOh4rUf33gkChTXEK3GXPIJztyJ2FxPKb7tBt47JzatryXOeJWX01bY46D2Tf2A8
eOmVIzYNv/iwbd3raWW8A4SbiJK63J79wS+I9eVTfCY9grNmvOYOu1tQ6QD/sd2B
01//B7pzfWQuNAIECxGrzG3lAdK9lz0aSQ4GSiqoaZPzi61x9aIBUK1drB1r/NFU
EHHh0Aj6Etbn15aFaLRjSkuWMwB5360qYT7hM5Lr0HrjsVRgzmnPCY0WJY9j/kMn
uWXVv7F9bP7Jj7tfty/NElE9OpdKTY9mJp27yJtO3PP4CAA+hvMoCpeyazGvY2JI
VfDD7XMuaZYiUS4Pr39kwxTS5AjEStDnYlxmLKE9jbYx2KmgZo0CJvNB2wHto0Ri
VVkGoygMKxDltgjuI8leeaQhAxCrthYO9kM8nwRQjT6VRidkBIo=
=STiJ
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
