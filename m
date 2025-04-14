Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD344689
	for <devicetree-compiler@vger.kernel.org>; Mon, 14 Apr 2025 06:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612034; cv=none; b=es++vAr3txgeE6pADjSjE5gOhVcnsC2LPkm0IUv8h7xOj8KFn8O4meNCMi+id0NKiIxPFinGB+Mauh6nlh8sC4j3Vd7OPurpng3hu/dF+BQYeoRIHf47Hnj3Hdp4SMQ6igdwQRscPQe8n3Cs7wl3WPr9y5fD6l35l2eAjrK8LYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612034; c=relaxed/simple;
	bh=hCrXM3ioI9f9+C2yOegqPTMCRwq8rjefBbRf708adCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUj118WbEcVKdnValATHATUxxAJLbTLkowNKsG2zb/p9+yctgA/uFxEx/4hNCh+bVlruoF0RdWyIxUYZU6n9MAFvudL5H/wlIdL/wHUygnBibQqyneBDcSN5/2zYjbCmULrJy/70/nePNtTFHQZUzoK44LJLwDlK3RMqPo33wBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=EohU6SHD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="EohU6SHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1744612026;
	bh=PZgAIl9FaLL8aCxjluZ3iLs+5Lpygj+AQubGNEx8SFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EohU6SHD9URPYHYTtL3+dOlzKGnBwKEa6J0ze67+RWeIWfseREfsaJPlHL5UBRM5A
	 M1fWe4UnUwiJxInFqtjykqyKx+hVuNge52gKbnQuX0FDIJMSeOS2S+ZF8QHP0dI56U
	 vOhmm6QxqAAmM4+rdS5nfTCCPPa+A8uEkaerBG0j0eu/++LOQMsQLSuiYbQoOF3rn9
	 /97KjI+xFxhPs3PBz5OXziIDPNL8pMF12b3AghC5jdjeNVVWlARPfygaM+R54bjw4G
	 8BdVQI33QXklWxZ5/WA+StfrdPlF9qmUyNaS6Cp3Oj2oIRy6TACrmVMjVLzKd7gkyC
	 sAvCLxr6RTQXA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ZbclG2N71z4wj2; Mon, 14 Apr 2025 16:27:06 +1000 (AEST)
Date: Mon, 14 Apr 2025 16:24:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Yao Zi <ziyao@disroot.org>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [RESEND PATCH] flattree: Optimize stringtable_insert()
Message-ID: <Z_yqFzoTQ4fpdd8g@zatzit>
References: <20250412100351.9009-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BlED77rMSfRwUF33"
Content-Disposition: inline
In-Reply-To: <20250412100351.9009-2-ziyao@disroot.org>


--BlED77rMSfRwUF33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 10:03:52AM +0000, Yao Zi wrote:
> According to perf result, stringtable_insert() is one of the five hotest
> functions, which is obvious since it depends on a brute-force,
> quadratic-complexity method to deduplicate the string block and is
> called at creation of every property.

Right.  The optimization strategy of dtc and libfdt is pretty much "if
it's slow enough that it bothers someone, then we'll think about it".
Little effort has gone into optimization, in general, because device
trees are generally so small that runtime hasn't really been a
problem, even with very inefficient coding.

> This patch optimizes the function in two ways,
>=20
> - Replace brute-force deduplication with libc-provided memmem(), which
>   is guaranteed to be in linear complexity on both glibc on musl libc.
>   This brings roughly 24.6% reduction in execution time.

That said, this is a substantial improvement for a very simple change.
I'd be happy to apply this change, separated into its own patch.

> - An open-addressing hashtable is maintained to track strings already
>   inserted. As property names are likely to be duplicated, this could
>   filter out many existing strings, avoiding traversing the string
>   block. This reduces another 1.2% of execution time.

Honestly the substantial complexity this adds doesn't seem worth it
for a mere 1.2% improvement.

> On an i7-7200U Linux system with musl-libc, building the "dtbs" target
> in Linux 6.11's arm64 port takes 19.8s less in average, achieving 25.8%
> speed up.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>=20
> This patch was originally created as GitHub PR[1] and closed by myself
> later as I found more opportunities to optimize (mostly about
> get_property_by_*). Failing to do so with some trial, I decide to send
> it as is now.
>=20
> [1]: https://github.com/dgibson/dtc/pull/164
>=20
>  flattree.c | 143 +++++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 129 insertions(+), 14 deletions(-)
>=20
> diff --git a/flattree.c b/flattree.c
> index 30e6de2..afca1f2 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -218,23 +218,134 @@ static struct emitter asm_emitter =3D {
>  	.property =3D asm_emit_property,
>  };
> =20
> -static int stringtable_insert(struct data *d, const char *str)
> +struct stringtable {
> +	unsigned int len, cap;
> +	struct data data;
> +	int *slots;
> +};
> +
> +/*
> + * Must be 2^n to ensure stringtable.cap - 1 correctly masks hash into t=
he
> + * index of slots
> + */
> +#define stringtable_initcap		256
> +
> +static unsigned int stringtable_hash(const char *str, size_t len)
> +{
> +	unsigned int hash =3D (unsigned int)len;
> +
> +	for (; len > 0; len--)
> +		hash ^=3D (hash << 5) + (hash >> 2) + str[len - 1];
> +
> +	return hash;
> +}
> +
> +static void stringtable_init(struct stringtable *strtab)
>  {
>  	unsigned int i;
> =20
> -	/* FIXME: do this more efficiently? */
> +	*strtab =3D (struct stringtable) {
> +			.len	=3D 0,
> +			.cap	=3D stringtable_initcap,
> +			.data	=3D empty_data,
> +			.slots	=3D xmalloc(sizeof(int) * stringtable_initcap),
> +		  };
> =20
> -	for (i =3D 0; i < d->len; i++) {
> -		if (streq(str, d->val + i))
> -			return i;
> -	}
> +	for (i =3D 0; i < strtab->cap; i++)
> +		strtab->slots[i] =3D -1;
> +}
> +
> +/*
> + * Return the internal data and let the caller owns it.
> + */
> +static struct data stringtable_data(struct stringtable *strtab)
> +{
> +	free(strtab->slots);
> +	strtab->slots =3D NULL;
> +
> +	return strtab->data;
> +}
> +
> +static void stringtable_free(struct stringtable *strtab)
> +{
> +	free(strtab->slots);
> +	strtab->slots =3D NULL;
> +
> +	data_free(strtab->data);
> +}
> +
> +static unsigned int stringtable_findslot(int *slots, unsigned int cap,
> +					 unsigned int hash)
> +{
> +	unsigned int i, mask;
> +
> +	mask =3D cap - 1;
> +
> +	for (i =3D hash & mask; slots[i] !=3D -1; i =3D (i + 1) & mask) ;
> =20
> -	*d =3D data_append_data(*d, str, strlen(str)+1);
>  	return i;
>  }
> =20
> +static void stringtable_grow(struct stringtable *strtab)
> +{
> +	unsigned int newcap =3D strtab->cap * 2;
> +	int *newslots =3D xmalloc(newcap * sizeof(int));
> +	unsigned int i;
> +
> +	for (i =3D 0; i < newcap; i++)
> +		newslots[i] =3D -1;
> +
> +	for (i =3D 0; i < strtab->cap; i++) {
> +		int off =3D strtab->slots[i];
> +		const char *str =3D strtab->data.val + off;
> +		unsigned int hash =3D stringtable_hash(str, strlen(str));
> +		int newslot =3D stringtable_findslot(newslots, newcap, hash);
> +
> +		newslots[newslot] =3D off;
> +	}
> +
> +	strtab->cap	=3D newcap;
> +	strtab->slots	=3D newslots;
> +}
> +
> +static int stringtable_insert(struct stringtable *strtab, const char *st=
r)
> +{
> +	unsigned int hash, i, mask;
> +	int *slots, *slot;
> +	const char *dup;
> +	size_t len;
> +
> +	if (strtab->cap < strtab->len * 2)
> +		stringtable_grow(strtab);
> +
> +	len	=3D strlen(str);
> +	mask	=3D strtab->cap - 1;
> +	hash	=3D stringtable_hash(str, len);
> +	slots	=3D strtab->slots;
> +
> +	for (i =3D hash & mask; *(slot =3D &slots[i]) !=3D -1; i =3D (i + 1) & =
mask) {
> +		const char *oldstr =3D strtab->data.val + *slot;
> +
> +		if (streq(str, oldstr))
> +			return *slot;
> +	}
> +
> +	/* Try to match a subsequence */
> +	dup =3D memmem(strtab->data.val, strtab->data.len, str, len + 1);
> +	if (dup) {
> +		*slot =3D dup - strtab->data.val;
> +	} else {
> +		*slot =3D strtab->data.len;
> +		strtab->data =3D data_append_data(strtab->data, str, len + 1);
> +	}
> +
> +	strtab->len++;
> +
> +	return *slot;
> +}
> +
>  static void flatten_tree(struct node *tree, struct emitter *emit,
> -			 void *etarget, struct data *strbuf,
> +			 void *etarget, struct stringtable *strbuf,
>  			 struct version_info *vi)
>  {
>  	struct property *prop;
> @@ -350,10 +461,12 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int v=
ersion)
>  	struct data blob       =3D empty_data;
>  	struct data reservebuf =3D empty_data;
>  	struct data dtbuf      =3D empty_data;
> -	struct data strbuf     =3D empty_data;
> +	struct stringtable strbuf;
>  	struct fdt_header fdt;
>  	int padlen =3D 0;
> =20
> +	stringtable_init(&strbuf);
> +
>  	for (i =3D 0; i < ARRAY_SIZE(version_table); i++) {
>  		if (version_table[i].version =3D=3D version)
>  			vi =3D &version_table[i];
> @@ -367,7 +480,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int ver=
sion)
>  	reservebuf =3D flatten_reserve_list(dti->reservelist, vi);
> =20
>  	/* Make header */
> -	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
> +	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.data.len,
>  			dti->boot_cpuid_phys);
> =20
>  	/*
> @@ -407,7 +520,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int ver=
sion)
>  	blob =3D data_merge(blob, reservebuf);
>  	blob =3D data_append_zeroes(blob, sizeof(struct fdt_reserve_entry));
>  	blob =3D data_merge(blob, dtbuf);
> -	blob =3D data_merge(blob, strbuf);
> +	blob =3D data_merge(blob, stringtable_data(&strbuf));
> =20
>  	/*
>  	 * If the user asked for more space than is used, pad out the blob.
> @@ -448,10 +561,12 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int ve=
rsion)
>  {
>  	struct version_info *vi =3D NULL;
>  	unsigned int i;
> -	struct data strbuf =3D empty_data;
> +	struct stringtable strbuf;
>  	struct reserve_info *re;
>  	const char *symprefix =3D "dt";
> =20
> +	stringtable_init(&strbuf);
> +
>  	for (i =3D 0; i < ARRAY_SIZE(version_table); i++) {
>  		if (version_table[i].version =3D=3D version)
>  			vi =3D &version_table[i];
> @@ -541,7 +656,7 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int vers=
ion)
>  	emit_label(f, symprefix, "struct_end");
> =20
>  	emit_label(f, symprefix, "strings_start");
> -	dump_stringtable_asm(f, strbuf);
> +	dump_stringtable_asm(f, strbuf.data);
>  	emit_label(f, symprefix, "strings_end");
> =20
>  	emit_label(f, symprefix, "blob_end");
> @@ -560,7 +675,7 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int vers=
ion)
>  		asm_emit_align(f, alignsize);
>  	emit_label(f, symprefix, "blob_abs_end");
> =20
> -	data_free(strbuf);
> +	stringtable_free(&strbuf);
>  }
> =20
>  struct inbuf {

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--BlED77rMSfRwUF33
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmf8qggACgkQzQJF27ox
2GeuIA/+KK8MC8mP39hmh9wgD60tpUM2zhIQ7rCdMPNaPvMv5asHtyi11Pu5Qje5
6Yo/MXwDzn07IN4PzbHkOHfSWFsuCzvzOZkt8PCCo7hBXrefHnWW/SLhzmLy21YV
AHUfwmZe0dkAoh/VeUFgzSnVOKqOc2haD+osxhiM1LS6aND7mCNltXEXCmtayTXx
RZ4DBuNbCQ1JKJYiQF1ir2edUBD2a2p5rvRGMnMCcNfGPpkOY6mOdSc5kxi1dpLm
LyVHeW7N4oPTX/3u9BHy5A66ijlTovQ652yAy0n966oSihF8MV59vx5C/092SEgr
YpjoQMZSPnJ3pinznCWQfjwwp6h2qGgD1BO7ueEkXYWA+i9nNH352HGcM+Jj6dVc
AdR8b5gl4QIwUpKpO2jQ/dbyqoOeMvPyPW2OTu7sY6f/seBhpJ0uRmG+Rel9ZMrK
Xwumc8pFbvpE6M6YW13bPnoFaVVwnDCOpcPtyKE2mwfDhrlT40VFUXhqGBH16Yzs
TC3Q+KQa6CqTB68p8S+enur/xvZPPO7ez1BN4xpqGg1V3rOI3bOLT2CZOf9nQz4H
OfDJ5qEbBlNOciHmVnrgEB1H9H22OBtXQSoE9+jOko+NzSaMXXNvAdIj1R//TOiV
ijprdZOUGqTLo5CnuQe4tG/pivlluuqM5yV9zVYIuUsp++CWhxU=
=0l1f
-----END PGP SIGNATURE-----

--BlED77rMSfRwUF33--
