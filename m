From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/5] annotations: short annotations
Date: Tue, 9 Jan 2018 22:21:30 +1100
Message-ID: <20180109112130.GM2131@umbus.fritz.box>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-4-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fNagykWcDoSVAmSd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515500151;
        bh=bC6wkB0ZVtjjSDqULi2ng2bvPlxi7QC4i43v2Gd6yqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gQHdsvhS0xrTTMP02w4jjWg7e7TSQZBlXPQwFiqutG2wVpULkv40ZcLkKy9E9UbXb
         8111mqTNetUjwqfhlYuxjORyy4u/smmBUlnsGyk9RwCGFt/QAYXSGghNYKr2/3eMfC
         I9W2x8neqfv49jSdjMP4iahLjKBNXD8ct8C1NGS4=
Content-Disposition: inline
In-Reply-To: <1515418607-26764-4-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--fNagykWcDoSVAmSd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 02:36:45PM +0100, Julia Lawall wrote:
> Based on the following patch by Frank Rowand (no changes):
>=20
>
>https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00378.=
html

If there are no changes, then it should definitely have Frank's S-o-b.

>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> ---
>  srcpos.c     | 34 ++++++++++++++++++++++++++++++++++
>  srcpos.h     |  2 ++
>  treesource.c |  8 ++++----
>  3 files changed, 40 insertions(+), 4 deletions(-)
>=20
> diff --git a/srcpos.c b/srcpos.c
> index 1a4db9c..85657c6 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -317,6 +317,40 @@ out:
>  	return pos_str;
>  }
> =20
> +static char *
> +srcpos_string_short(struct srcpos *pos, bool first_line)
> +{
> +	const char *fname =3D "<no-file>";
> +	char *pos_str;
> +	int rc;
> +
> +	if (pos) {
> +		fname =3D pos->file->name;
> +		rc =3D asprintf(&pos_str, "%s:%d", fname,

You can use xasprintf to avoid having to check for failure.

> +			      (first_line) ? pos->first_line: pos->last_line);
> +	}

else on the same line as }, please - dtc uses kernel coding style
(more or less).

> +	else {
> +		rc =3D asprintf(&pos_str, "%s:<no-line>", fname);
> +	}
> +
> +	if (rc =3D=3D -1)
> +		die("Couldn't allocate in srcpos_string_short");
> +
> +	return pos_str;
> +}
> +
> +char *
> +srcpos_string_first(struct srcpos *pos)
> +{
> +	return srcpos_string_short(pos, true);
> +}
> +
> +char *
> +srcpos_string_last(struct srcpos *pos)
> +{
> +	return srcpos_string_short(pos, false);
> +}
> +
>  void srcpos_verror(struct srcpos *pos, const char *prefix,
>  		   const char *fmt, va_list va)
>  {
> diff --git a/srcpos.h b/srcpos.h
> index ec69d89..9281cba 100644
> --- a/srcpos.h
> +++ b/srcpos.h
> @@ -109,6 +109,8 @@ extern struct srcpos *srcpos_copy_all(struct srcpos *=
pos);
>  extern struct srcpos *srcpos_combine(struct srcpos *left_srcpos,
>  	 struct srcpos *right_srcpos);
>  extern char *srcpos_string(struct srcpos *pos);
> +extern char *srcpos_string_first(struct srcpos *pos);
> +extern char *srcpos_string_last(struct srcpos *pos);
> =20
>  extern void PRINTF(3, 0) srcpos_verror(struct srcpos *pos, const char *p=
refix,
>  					const char *fmt, va_list va);
> diff --git a/treesource.c b/treesource.c
> index a99eca4..9a22b5e 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -204,7 +204,7 @@ static void write_propval(FILE *f, struct property *p=
rop)
> =20
>  	if (len =3D=3D 0) {
>  		if (annotate) {
> -			srcstr =3D srcpos_string(prop->srcpos);
> +			srcstr =3D srcpos_string_first(prop->srcpos);
>  			fprintf(f, "; /* %s */\n", srcstr);
>  			free(srcstr);
>  		} else {
> @@ -238,7 +238,7 @@ static void write_propval(FILE *f, struct property *p=
rop)
>  	}
> =20
>  	if (annotate) {
> -		srcstr =3D srcpos_string(prop->srcpos);
> +		srcstr =3D srcpos_string_first(prop->srcpos);
>  		fprintf(f, "; /* %s */\n", srcstr);
>  		free(srcstr);
>  	} else {
> @@ -262,7 +262,7 @@ static void write_tree_source_node(FILE *f, struct no=
de *tree, int level)
>  		fprintf(f, "/ {");
> =20
>  	if (annotate) {
> -		srcstr =3D srcpos_string(tree->srcpos);
> +		srcstr =3D srcpos_string_first(tree->srcpos);
>  		fprintf(f, " /* %s */\n", srcstr);
>  		free(srcstr);
>  	} else {
> @@ -282,7 +282,7 @@ static void write_tree_source_node(FILE *f, struct no=
de *tree, int level)
>  	}
>  	write_prefix(f, level);
>  	if (annotate) {
> -		srcstr =3D srcpos_string(tree->srcpos);
> +		srcstr =3D srcpos_string_last(tree->srcpos);
>  		fprintf(f, "}; /* %s */\n", srcstr);
>  		free(srcstr);
>  	} else {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fNagykWcDoSVAmSd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpUpboACgkQbDjKyiDZ
s5JHxBAAuu1dLV75Rg1F36NfgKQE9ywibtJA+/10ooxpMkpkunx9UjQk8+hmuZdp
z9AYgqrVrnLzSPkdeCbVbH81Wt3znQD6nRwcDd5NzR1+yxvBO4Xj/uxEUrm9LVLw
9DAj0AsXUyt2DatKw4Oj/tnziqvgrfGz+fVS2yOtZg92Ly+fqlDsWRUx0nXYPGcl
T6mqwae/jzbsPHM7CEk1psokvTDqhBPHZK0XzbCIPuDhfqAr/HN5K+tr22r4VO58
hvhABvYHWUqq7RCzpWZFg/vG+04K0Z5RkKo8lT0T2WN3feB5wcBAsWijgnQIvspW
ww6brvBs2sf4TYrNPx9W5uyb21F1h5EzAJynj7TLvdeMCb5aY6TxnQLTKTK8OCfU
iPSx/3BcmNxnGqdbXG/8Dw8a5N1dRtJ7q0kPpD/P5RrHMjgCy+ZRSptZYsCwT6/+
rOnhkS+/QT7HxAI7mmMIb9WBmtC8UD3sqpTXcv0jBJePG7w7gD3GbUK7ClWFiLZ6
c7ZwxzCEXeKsnvOzNKeg94LzVW5f1xb/1p9bSvPRsDgypma+7L5wTt/neR1LR2w4
J4im8vJSsbrva1JR8awdQRmar+AX3keSvJ0sQXMDX3w4rwjfS9S3Lstg7CE7ycOe
nt3ocsfNIZWoePMLBb3i+ccTM1yCSs+ge6rGlTAM+IasjlxowMU=
=O88E
-----END PGP SIGNATURE-----

--fNagykWcDoSVAmSd--
