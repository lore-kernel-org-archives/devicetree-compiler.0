Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9A280325
	for <devicetree-compiler@vger.kernel.org>; Thu, 21 Aug 2025 04:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755750711; cv=none; b=iCt5f8qRDDh/uF1T9rKrIIA3Hv3lFnyOvgIT2QayFZFkjvdGgwEZCsjzd85r4Q2AX0VSuWhYLO8gY2lI7Mm6DDIz07WSUp38Bbv4SN6+Q60PNY+Vv0UkycKL5fZdySGN58SdYQM+2iJ870EOB5Fz4hyTW0mZJEh7U8xR9+B8iYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755750711; c=relaxed/simple;
	bh=7h9uqpmuuMbHwZgkysG7Qe6HX5UA2GTshOZX3ma0h5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/ycBMRKkLgyFdU2QY/SeJIp9I46U/AJ9I3uk5DcF+jC5eTvdvQVoEmcuatzxLO5SJnncOkG0lBwm1NT9eBqBAt+tUdQcsKpoBIGb8ArbdAV/j5+90++SuNNUiZT9bhGKM+NzdEdqbEkkwwGu+0dO5IuXm2VSqWfEvBTPGNBQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=D+jJNQn3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="D+jJNQn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755750703;
	bh=Z59NhVpDfjZvBo+Jf+kIllLHNZEl1PP/Z7TMHkS93B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+jJNQn3Zrpje2vwizj4RZz3yP8u0MI120dibFeFyZibcDVSwDLzv6XDbf7fqr5TT
	 cYjM7KyullGZQZqDvMBbCRkpCPzYVCTinf2LxItKn1fkhVY0XZvk5LQ2JZgyqRi6TO
	 4U1R2suv8qqnweJU02+K6S2v62XFMYz8jq2VjPvYhBah1nJ5fN7FLguNWGKLZz/H/2
	 lgeD16GV3i6gueyDxnKmUKrIpw+a5ux09z1MKR5o66DxkxPZDEpWtAc5+6tXq9eRJb
	 G0Hh4ONWvdNnDxAWAWDa21arlwol4xaYgcentFiIP9z31cwaEECQhgZrwIVzOxharE
	 OmtPPAqXR8wQg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c6r4b6QJvz4xQN; Thu, 21 Aug 2025 14:31:43 +1000 (AEST)
Date: Thu, 21 Aug 2025 14:31:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 6/6] Restore phandle references from __fixups__ node
Message-ID: <aKahKWCQhFt_o0Jp@zatzit>
References: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
 <f3fa240e296b08e68b990d995da12978058c97f9.1755692822.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oom8ingPEc1RAR1m"
Content-Disposition: inline
In-Reply-To: <f3fa240e296b08e68b990d995da12978058c97f9.1755692822.git.u.kleine-koenig@baylibre.com>


--Oom8ingPEc1RAR1m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 03:11:32PM +0200, Uwe Kleine-K=F6nig wrote:
> The __fixups__ node contains information about labels. Parse its
> properties to create phandle markers which improve the resulting dts
> when decompiling a device tree blob.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  dtc.c        |  1 +
>  dtc.h        |  3 ++
>  livetree.c   | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  treesource.c |  6 ++++
>  4 files changed, 106 insertions(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index 9f90b373967d..6dae60de0ea5 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -343,6 +343,7 @@ int main(int argc, char *argv[])
>  	if (generate_symbols)
>  		generate_label_tree(dti, "__symbols__", true);
> =20
> +	fixup_phandles(dti, "__fixups__");
>  	local_fixup_phandles(dti, "__local_fixups__");
> =20
>  	if (generate_fixups) {
> diff --git a/dtc.h b/dtc.h
> index d07a583441f6..7231200e5d02 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -342,6 +342,7 @@ void sort_tree(struct dt_info *dti);
>  void generate_labels_from_tree(struct dt_info *dti, const char *name);
>  void generate_label_tree(struct dt_info *dti, const char *name, bool all=
ocph);
>  void generate_fixups_tree(struct dt_info *dti, const char *name);
> +void fixup_phandles(struct dt_info *dti, const char *name);
>  void generate_local_fixups_tree(struct dt_info *dti, const char *name);
>  void local_fixup_phandles(struct dt_info *dti, const char *name);
> =20
> @@ -359,6 +360,8 @@ struct dt_info *dt_from_blob(const char *fname);
> =20
>  /* Tree source */
> =20
> +void property_add_marker(struct property *prop,
> +			 enum markertype type, unsigned int offset, char *ref);
>  void add_phandle_marker(struct dt_info *dti, struct property *prop, unsi=
gned int offset);
>  void dt_to_source(FILE *f, struct dt_info *dti);
>  struct dt_info *dt_from_source(const char *f);
> diff --git a/livetree.c b/livetree.c
> index 3dbef9071017..5d72abceb526 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -1151,6 +1151,102 @@ void generate_fixups_tree(struct dt_info *dti, co=
nst char *name)
>  			name);
>  }
> =20
> +void fixup_phandles(struct dt_info *dti, const char *name)
> +{
> +	struct node *an;
> +	struct property *fp;
> +
> +	an =3D get_subnode(dti->dt, name);
> +	if (!an)
> +		return;
> +
> +	for_each_property(an, fp) {
> +		char *fnext =3D fp->val.val;
> +		char *fv;
> +		unsigned int fl;
> +
> +		while ((fl =3D fp->val.len - (fnext - fp->val.val))) {
> +			char *propname, *soffset;
> +			struct node *n;
> +			struct property *p;
> +			long offset;
> +
> +			fv =3D fnext;
> +			fnext =3D memchr(fv, 0, fl);
> +
> +			if (!fnext) {
> +				if (quiet < 1)
> +					fprintf(stderr, "Warning: Malformed fixup entry for label %s\n",
> +						fp->name);
> +				break;
> +			}
> +			fnext +=3D 1;
> +
> +			propname =3D memchr(fv, ':', fnext - 1 - fv);
> +			if (!propname) {
> +				if (quiet < 1)
> +					fprintf(stderr, "Warning: Malformed fixup entry for label %s\n",
> +						fp->name);
> +				continue;
> +			}
> +			propname++;
> +
> +			soffset =3D memchr(propname, ':', fnext - 1 - propname);
> +			if (!soffset) {
> +				if (quiet < 1)
> +					fprintf(stderr, "Warning: Malformed fixup entry for label %s\n",
> +						fp->name);
> +				continue;
> +			}
> +			soffset++;
> +
> +			/*
> +			 * temporarily modify the property to not have to create
> +			 * a copy for the node path.
> +			 */
> +			*(propname - 1) =3D '\0';
> +
> +			n =3D get_node_by_path(dti->dt, fv);
> +			if (!n && quiet < 1)
> +				fprintf(stderr, "Warning: Label %s references non-existing node %s\n=
",
> +					fp->name, fv);
> +
> +			*(propname - 1) =3D ':';
> +
> +			if (!n)
> +				continue;
> +
> +			/*
> +			 * temporarily modify the property to not have to create
> +			 * a copy for the property name.
> +			 */
> +			*(soffset - 1) =3D '\0';
> +
> +			p =3D get_property(n, propname);
> +
> +			if (!p && quiet < 1)
> +				fprintf(stderr, "Warning: Label %s references non-existing property =
%s in node %s\n",
> +					fp->name, n->fullpath, propname);
> +
> +			*(soffset - 1) =3D ':';
> +
> +			if (!p)
> +				continue;
> +
> +			offset =3D strtol(soffset, NULL, 0);
> +			if (offset < 0 || offset + 4 > p->val.len) {
> +				if (quiet < 1)
> +					fprintf(stderr,
> +						"Warning: Label %s contains invalid offset for property %s in node=
 %s\n",
> +						fp->name, p->name, n->fullpath);
> +				continue;
> +			}
> +
> +			property_add_marker(p, REF_PHANDLE, offset, fp->name);
> +		}
> +	}
> +}
> +
>  void generate_local_fixups_tree(struct dt_info *dti, const char *name)
>  {
>  	if (!any_local_fixup_tree(dti, dti->dt))
> diff --git a/treesource.c b/treesource.c
> index 5b8d7a679519..6cd996f0d17b 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -173,6 +173,12 @@ static struct marker **add_marker(struct marker **mi,
>  	return &nm->next;
>  }
> =20
> +void property_add_marker(struct property *prop,
> +			 enum markertype type, unsigned int offset, char *ref)
> +{
> +	add_marker(&prop->val.markers, type, offset, ref);
> +}
> +
>  static void add_string_markers(struct property *prop, unsigned int offse=
t, int len)
>  {
>  	int l;

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Oom8ingPEc1RAR1m
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmimoSgACgkQzQJF27ox
2GfHihAAlxVe+3m4FZGQGpWZCUa10bXBUFgknYAT637aqEguJOe1zXiPUKih2S83
aS448H4C6UTQOUP+498Vw5Fsj0nahnM24xld/PnDa+BysDv8SlTRieHTCWx7JT3z
EPn5oaYKbOmh6ODYGcci/73JQ5jf/FM0EWz/q4TMKeJLU/17sjOa6drAjtJBdEco
LN80yufIaCHJ+Xx2ZFDh8D+r51PzBboMiSYW9XsuCo4PiJ3xCP9LJrCptNM6Z5wX
b0OBO0/dUJLJKqQm15GRIBEkHPzLqh0k5LvmcEyJ0wTZYseQZDTERzwMIOWFVyy1
QG6x0D8eHibZX5u/28XzpuGhN9Nn+V94KtZr8SOTptWHHIDH1mqKCY1vJRuOgXd3
GY+Es8UH1wEUP0p9ikxJ61HNG9V6ZvAKF+szhhXizu2Jh+xZRm38oLzqULZ5lGmA
eEs27eVMqHU5qlmggSV4B1oBRZoJMTmZoFdiTP37uXBDrZCayAUrodQIR+0M2QWb
pOAcwaIwcCS9iQjNvhaoKGBbd8ENB1chmQ4ozsI2CQfMmJh3TMIxadDDqGhPleQt
ECCx9BEY0XyBlzseznUiYIfi/asonsVxC77P6aoRbxmCBVa8BIiP5aOEalvndXN5
TcXBqp6SeHjBQTY9eUsQ/l5pS8VIG7wiKHbBS+aDchM2umJCXHo=
=pqwf
-----END PGP SIGNATURE-----

--Oom8ingPEc1RAR1m--
