Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A152B9A9
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Jun 2025 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871593; cv=none; b=Zv3eMZ4/58Bk+RXSmgPskBMXsMbLqSDKaSBRs+xww6CcHXHu+WtfIC41kgNBVoL3fUcNpSVoX9dpVzxJNDX42/5KOR2xj1JqQ0istMzyVJikai5hlGXpHh4AojECod3o8YHO7B9tjCNaPzXmNGMTCadjYm3ORIINXhwNgBXGn+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871593; c=relaxed/simple;
	bh=A3rAexSpbcUocVsCekUVNEe6fE+xxM7Ig5aPK99nB+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+A898P1YO/SwkvKNkMy+ANTz6aqOb4myDOzbHJAS/rSohZ/OI6We3ahpQSBPYHZHqcN53u9+jezWd9HdtA12pzj+6MSWoCem1xS7D5FPRCLbkChAWqQcaU2G7iqyfmkFVCARTnzp2g/ZinZEGD1uUisqO9DF/7vRqGH9AV76vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=linwWfQh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="linwWfQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1748871580;
	bh=Jy6NzNUxZgHJTAlbC6y2ck5DcUdXWAHRTnE7wflFcOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=linwWfQhu3yjzJj1pN5U1qHTdZm60eyupY4VYHB5NdgQ/9A1wgkOk3V3XjXJUMzwY
	 iVY8XO9t1EnYOVpbB+FY0kVOzth6gGJpY4NyH5SrYs46THPVSNAGgD1QVqCwY1yFpH
	 k5x6NlLA8IONthuC+7pLlRKoDd9Cu1g4CGto2wlxLDSJEWAOBGUfymOpKDuG1x9ZJS
	 UPG9zACB/OA9JSmdXl32hw9qHTBCthLKyLNqGbLVKNZ6/d9qAh4Arw5FqJVZ6PlW+F
	 mnlAcHV0gp78ZenMgujB+68nemPXGA079cUNQZvpG513YmuWvEiatwqcEHfkxsVSHH
	 PxIIfFrlgTiAQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4b9w1m37R3z4xD3; Mon,  2 Jun 2025 23:39:40 +1000 (AEST)
Date: Mon, 2 Jun 2025 18:20:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Glass <sjg@chromium.org>, devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dtc: Add /./
Message-ID: <aD1eyw2Xf3pi4bOm@zatzit>
References: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
 <20250311-previous-value-v2-3-e4a8611e956f@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mnddU7wsWfNyaMWZ"
Content-Disposition: inline
In-Reply-To: <20250311-previous-value-v2-3-e4a8611e956f@beagleboard.org>


--mnddU7wsWfNyaMWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 09:05:39PM +0530, Ayush Singh wrote:
> Allow constructing new values for a property using old property values.
> Can be used to append, pre-append, duplicate, etc.
>=20
> In practice, it looks as follows:
>=20
> dts-v1/;
>=20
> / {
> 	str-prop =3D "0";
> 	int-prop =3D <0>;
> };
>=20
> / {
> 	str-prop =3D /./, "1", /./;
> 	int-prop =3D /./, <1>, /./;
> };
>=20
> dts to source output with -T -T also works as expected:
>=20
> /dts-v1/;
>=20
> / { /* base.dts:3:3-5:3, base.dts:7:3-9:3 */
>         int-prop =3D <0x00 0x01>, <0x02 0x03>, <0x00 0x01>; /* base.dts:4=
:9-4:26, base.dts:8:9-8:36 */
> }; /* base.dts:3:3-5:3, base.dts:7:3-9:3 */
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  dtc-lexer.l  |  5 +++++
>  dtc-parser.y |  5 +++++
>  dtc.h        |  1 +
>  livetree.c   | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 59 insertions(+), 2 deletions(-)
>=20
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index de60a70b6bdbcb5ae4336ea4171ad6f645e91b36..5efeca10363e0c9c338b6578b=
e9240c3f42249f0 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -144,6 +144,11 @@ static void PRINTF(1, 2) lexical_error(const char *f=
mt, ...);
>  			return DT_OMIT_NO_REF;
>  		}
> =20
> +<*>"/./" {
> +			DPRINT("Keyword: /./\n");
> +			return DT_PREV_PROP;
> +		}
> +
>  <*>{LABEL}:	{
>  			DPRINT("Label: %s\n", yytext);
>  			yylval.labelref =3D xstrdup(yytext);
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 4d5eece526243460203157464e3cd75f781e50e7..c34eb10a1068b5eb6a0f08e5a=
1db8066217b16bf 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -57,6 +57,7 @@ static bool is_ref_relative(const char *ref)
>  %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
>  %token DT_BITS
>  %token DT_DEL_PROP
> +%token DT_PREV_PROP

I think DT_PREV_VALUE would be a better name.  "prev prop" suggests
the property defined immediately above, rather than the previous value
of this property.

>  %token DT_DEL_NODE
>  %token DT_OMIT_NO_REF
>  %token <propnodename> DT_PROPNODENAME
> @@ -308,6 +309,10 @@ propdata:
>  		{
>  			$$ =3D data_merge($1, $2);
>  		}
> +        | propdataprefix DT_PREV_PROP
> +                {
> +                        $$ =3D data_add_marker($1, PREV_VALUE, NULL);
> +                }
>  	| propdataprefix arrayprefix '>'
>  		{
>  			$$ =3D data_merge($1, $2.data);
> diff --git a/dtc.h b/dtc.h
> index 86928e1eea9764fe5d74d6dbb987589d65d54b66..175fe3637a31cc28453dc2798=
0f315a171763b49 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -110,6 +110,7 @@ enum markertype {
>  	REF_PHANDLE,
>  	REF_PATH,
>  	LABEL,
> +	PREV_VALUE,
>  	TYPE_UINT8,
>  	TYPE_UINT16,
>  	TYPE_UINT32,
> diff --git a/livetree.c b/livetree.c
> index 93c77d95a320ec05aa355e12920cef9e1c91c26a..22d45ca90bec8971d02231787=
217deb7caf53310 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -139,10 +139,40 @@ struct node *reference_node(struct node *node)
>  	return node;
>  }
> =20
> +static struct data data_insert_old_value(struct data d, struct marker *m,
> +					 struct data old)

Nothing in this function requires 'old' to be the previous value of
the property.  So 'data_insert_data()' would be a better name.  It's
also strictly about manipulating a struct data so it should go in
data.c, not livetree.c.

> +{
> +	unsigned int offset =3D m->offset;
> +	struct marker *next =3D m->next;
> +	struct marker *marker;
> +	struct data new_data;
> +	char *ref;
> +
> +	new_data =3D data_insert_at_marker(d, m, old.val, old.len);
> +
> +	/* Copy all markers from old value */
> +	marker =3D old.markers;
> +	for_each_marker(marker) {
> +		ref =3D NULL;
> +
> +		if (marker->ref)
> +			ref =3D xstrdup(marker->ref);
> +
> +		m->next =3D alloc_marker(marker->offset + offset, marker->type,
> +				       ref);
> +		m =3D m->next;
> +	}
> +	m->next =3D next;
> +
> +	return new_data;
> +}
> +
>  struct node *merge_nodes(struct node *old_node, struct node *new_node)
>  {
>  	struct property *new_prop, *old_prop;
>  	struct node *new_child, *old_child;
> +	bool prev_value_used =3D false;

This is logically per-property, not per-node.  So it needs to be
initialised to false for each property, not just once per node.  So it
might as well be local to the first while loop as well.

> +	struct marker *marker;
>  	struct label *l;
> =20
>  	old_node->deleted =3D 0;
> @@ -172,10 +202,26 @@ struct node *merge_nodes(struct node *old_node, str=
uct node *new_node)
>  				for_each_label_withdel(new_prop->labels, l)
>  					add_label(&old_prop->labels, l->label);
> =20
> +				marker =3D new_prop->val.markers;
> +				for_each_marker_of_type(marker, PREV_VALUE) {
> +					new_prop->val =3D data_insert_old_value(
> +						new_prop->val, marker,
> +						old_prop->val);
> +					prev_value_used =3D true;
> +				}
> +
>  				old_prop->val =3D new_prop->val;
>  				old_prop->deleted =3D 0;
> -				free(old_prop->srcpos);
> -				old_prop->srcpos =3D new_prop->srcpos;
> +
> +				if (prev_value_used) {
> +					old_prop->srcpos =3D
> +						srcpos_extend(old_prop->srcpos,
> +							      new_prop->srcpos);
> +				} else {
> +					srcpos_free(old_prop->srcpos);
> +					old_prop->srcpos =3D new_prop->srcpos;
> +				}
> +
>  				free(new_prop);
>  				new_prop =3D NULL;
>  				break;
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--mnddU7wsWfNyaMWZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmg9XsQACgkQzQJF27ox
2GdiKQ//b2nqS2gpsX8a4iJFU3qM3V0yNZAxLB1w4aCscgGabxBuyrzTB0hfubEZ
8Ytt98XZutqpZyVXI9/JIe+tPZzn/YsXZBMixbqvyCVL7g6yNwr0nXN8RQmQsKb8
uWMHLEfm2rupRH2Wi5n5T40caLG7BZngnI1iAkH8pEYv7MDRLS2349ViHLBAgXAU
G0hUWfM11xvpFbOF8Ck3cIfhhNxWsq4ZoT+6MjLUT6e5I4A4Oelx6iDE5p/IQNxD
DzzQlB+p4PNPBMlFDG7KwCxdmFstKUy0cwZ+UvIm7I9kFHxhdnhNxHhcCH4622cq
TW9T/0JPQBMwAjrV6kageeSADy2HJAxAHV3JgtXVoAisQyOPfdFgagQCXjyPioOC
l9F2raZDQF42kIPfep/UPQzQ6wKfRATN4Fl/7cNf5mmF4tbgHqAGIF7ZJ/xnfjjb
Dyoy04TsxL9rvez+C3AG1YUSkJwWpffSLiHFXxwRgdbe3WRyE1IK7iczJc2d4D2c
jKhOiOiEtcuReb1O3wN23cgvyoT9Kz038qqJjGX6C44myE0gNrkRRbmYGw1Su+O5
DAFKGc2WfyPnvRxZ214fzgVQNNusnZH7bfkbo51SbW7EFIZ6jymKf0gfh6OBBv/2
UXaIMa2RuTFluv6Fzm94j6N1OtP7ogJc7oMXeuVJwkrGl84Lo20=
=1yuh
-----END PGP SIGNATURE-----

--mnddU7wsWfNyaMWZ--
