Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C8B193062
	for <devicetree-compiler@vger.kernel.org>; Wed,  5 Mar 2025 04:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741148256; cv=none; b=mXJ2RGrJFG0c84cqyKj/Nn1cJpPDNtMcdoBN5ryyGNeKHjyZck+I1Ta4rMjJeFBwB//jzvGhinQnAz1bRV+TlK32JTm373QyP/1ZP923NLXQJmO3jsLvHe95Jq8aAniK7HPO7lz/x0mFtnuaHiYVsGVwJJklm5UhgpvVc+5S0MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741148256; c=relaxed/simple;
	bh=ms1WJT87Fqnui0SWdhoZUHCyk+SsrwL3MfljLRXH+2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEd0ZnP8/qB9b53slWjRzxTtJ+AvDOvYdUxEW4kwYOk208/mtu9S8sQt1dpiz4+19JpFsxPUmPCWijsfwmxM3sWL3PXu6k3W1wEJ9z1rPpLT2OtdDZZIypxpHjG/VW7oE55VG5cGuyiWZDjW/PxImjRQabXnW9x6aPvOIYymsuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=TMET7hs7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="TMET7hs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202502; t=1741148250;
	bh=9tMM9puWKHhq5rExOI36alGx3uDggJL673g9mmi4keE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMET7hs7EY7zznM2lr0Z153N102nLHm+aDjhF1jnOe7x85vyzJpJdB6kCmcNkZRfD
	 g+x9buCUfUBGP2YPG6SaQbnuXTc7hAPnM96QwqCqiQygoZBGcggNPlCaMXwJjQ3Ugq
	 ZB4T+NLKU1sq283vnPAI2qNA9FnWL3Dzlks/6dd2JugQIhX6Waf5Pgiozfen7fEoYH
	 Qh652SGeGloRdI6iCaFsMhvhpj4jmiN2UMv2c23KVpm+KY07sJFEbesm6tW8xl3Pg+
	 E71319ksTRThsbf3SLoac1BN7z9C+2ztMVednccUKTaGDzuQIEtUrSI+GSaDFz096n
	 AgueM7MyfeUfA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Z6zmB4xsmz4x2g; Wed,  5 Mar 2025 15:17:30 +1100 (AEDT)
Date: Wed, 5 Mar 2025 15:14:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Glass <sjg@chromium.org>, devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 2/3] dtc: Add /./
Message-ID: <Z8fPrDufyd2EvabR@zatzit>
References: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
 <20250301-previous-value-v1-2-71d612eb0ea9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EtIQzihIFC0MHmpu"
Content-Disposition: inline
In-Reply-To: <20250301-previous-value-v1-2-71d612eb0ea9@beagleboard.org>


--EtIQzihIFC0MHmpu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 01, 2025 at 06:55:03PM +0530, Ayush Singh wrote:
> Allow construction new values for a property using old property values.
> Can be used to append, pre-append, duplicate, etc.

Some examples from your series cover letter would make sense in the
commit message.

This mostly LGTM, a few notes below.

>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  dtc-lexer.l  |  5 +++++
>  dtc-parser.y |  5 +++++
>  dtc.h        |  1 +
>  livetree.c   | 44 ++++++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 53 insertions(+), 2 deletions(-)
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
> index 93c77d95a320ec05aa355e12920cef9e1c91c26a..89e15c39e9eadb87cf8376fe1=
67a4d9c6002031a 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -139,10 +139,34 @@ struct node *reference_node(struct node *node)
>  	return node;
>  }
> =20
> +static struct data data_insert_old_value(struct data d, struct marker *m,
> +					 const struct data *old)

The convention is generall to pass struct data by value, not by pointer.

> +{
> +	unsigned int offset =3D m->offset;
> +	struct marker *next =3D m->next;
> +	struct marker *marker =3D m;

There's no point to this initialisation, because..

> +	struct data new_data;
> +
> +	new_data =3D data_insert_at_marker(d, marker, old->val, old->len);

=2E. you could just use 'm' here..

> +
> +	/* Copy all markers from old value */
> +	marker =3D old->markers;

=2E. then it is overwritten.

> +	for_each_marker(marker) {
> +		m->next =3D alloc_marker(marker->offset + offset, marker->type,
> +				       marker->ref);

This will make the new marker have marker->ref aliased with the old
marker.  That's... probably ok... but it makes me nervous.  Might be
better to xstrdup() ref here so each marker has its own copy.

If the marker is a label, and /./ appears multiple times, you'll now
have a duplicate label.  That probably warrants a specific warning, at
least.


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
> +	struct marker *marker;
>  	struct label *l;
> =20
>  	old_node->deleted =3D 0;
> @@ -172,10 +196,26 @@ struct node *merge_nodes(struct node *old_node, str=
uct node *new_node)
>  				for_each_label_withdel(new_prop->labels, l)
>  					add_label(&old_prop->labels, l->label);
> =20
> +				marker =3D new_prop->val.markers;
> +				for_each_marker_of_type(marker, PREV_VALUE) {
> +					new_prop->val =3D data_insert_old_value(
> +						new_prop->val, marker,
> +						&old_prop->val);
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
> +					free(old_prop->srcpos);
> +					old_prop->srcpos =3D new_prop->srcpos;
> +				}
> +

Hrm.  I realised there are some pre-existing bugs here: if srcpos has
multiple things chained onto it, we only free the first one.  Likewise
I think we don't properly free the old property value or its markers.

Then again, dtc is a short-lived process, so to an extent we don't
really care about memory leaks.

>  				free(new_prop);
>  				new_prop =3D NULL;
>  				break;
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--EtIQzihIFC0MHmpu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmfHz6cACgkQzQJF27ox
2GddyhAAp4T8rxaaesYLh4/BHcaeHHVR/vBhem+xefiWmrpUVOE57pzdrmTijXVJ
RjK1VGi+u8zdp7iFzyNaIHdcNQ4mCALujlEVhHS1Q58wJDD33YVEp2K3nu5za/CC
mMGYND+gT21vCNE58C2EUA8auMJVawH0sCmm5Rdueejnm19yj5zR+zZdxhXDNhIJ
w/3z6qZTlJMP4Otwm3nDHcnsf5HoUC/75+RqRhCVEK0R0nNT4dbAsLHIbw5H1mjD
WrbHoUJUhLyyE7YwrVqVR6R67DaOOtQ4fjYtgd+hGPIkfkT13oaZrZJeIVKb96T7
gJeDo15jV8xo+9pRWxp/5TwMt/hBq//KfQJCax+0laA/1N/3Z/Os6zYUU1bZS3S1
0ea/nJgD8IV0yBVPpsgjZfGCSpPMyk2PyKaDhSX9HEOdTpzy7x/tH1ori8aQdChk
E/i/I2I96luv70zvmYl1Ez9F+7Q83HmduEjg4VpKvAjgtmEn7WeGWEwttrmcNl2V
UHEoHRDCM8eJL88EIbUrUYTUCbK4CM+jxKFL7OlX8MJyy/9+uF9B3J9NUpr3n+yU
VS3imBvqk2Sw3hSJmwLq5pb9m3Xv2kdkYuGhTIF+OGLueviyMyDMF2cZKBrX2+hd
tfB6uWCy+UhM43v1QHR54eTVzbjZJO57rWhHtsFC0FMLgsEcick=
=EiZu
-----END PGP SIGNATURE-----

--EtIQzihIFC0MHmpu--
