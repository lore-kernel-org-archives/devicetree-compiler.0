Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34536CDE0
	for <devicetree-compiler@vger.kernel.org>; Thu, 21 Aug 2025 04:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755750708; cv=none; b=NDdn/0OvniJdRH7/7gXe605HTOngwUksUqs/3WgsNCReyXAQbHQCIsoe1PiCz+NnQx828pKv+UB5WiqL4odlBmbQqTe+Uxdtznwq5pY2pWQvOP5mG/VYkJs7l5EFtRyZ2AmPULPZmcXRxqvePPO7hPChcTS718xCqeDvOy6rgYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755750708; c=relaxed/simple;
	bh=0RGexv6loagieUuZjwu6wvKkKW5Ur7gXF/53T/WTURw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICJJYlXhAgoR2qUD3ZqJi5sEoFxWCX9m8lCcqH8G5fwENndM8kVieb8a43IT1rsGpsE9WmSIP5nZDdVClcoWBjN/WaTYIjw8d3HX5lrStkTBUGhRvS4VRw7PLGujn4qSaPEhh4X1MIPfGIY8bvyXFKuSoZITgyMYD5IjTfkrE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=sDpuMQkw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="sDpuMQkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755750703;
	bh=d2KHlx20i9E3JNtxhere7yiH3nlsKUOukBZUP2jJ67k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDpuMQkwCgTMiSv9Gcy8M365NPISmKD4o+cOTTWdNGFY61yffJlgibGxkAX+5sGf6
	 A/eQoMaKIhwFdxmcNvebPvwsDP3FNKt5YPlk9XoWcSAVCZkUgXMulz8e4RxExQ1TnM
	 SG8iuDrvaaK0keb40ymPFy2HBHRhcfHsMbE3yMIV9Is+mjgIcs+6RKM9NJtvhfjPdB
	 ilMZ3ybbcfcbYqFSIHoTuUdjJ7hnxeP7I7s0+Qk0NWeABGm4t9WHnxrmmLsK/WaBaT
	 tu9W83YaU3sLHWkNtZpx/GdhPSX4XfUvm2rMY3wua98bHn0568guBJaiB19qr1PWxA
	 V/YoabpCpwrJw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c6r4b6H19z4xQ1; Thu, 21 Aug 2025 14:31:43 +1000 (AEST)
Date: Thu, 21 Aug 2025 14:25:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 4/6] Restore labels from __symbols__ node
Message-ID: <aKafognYFAUlPS-V@zatzit>
References: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
 <79aef5658c9105c6d6891fcdf930e5a073a06699.1755692822.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1bK2sA6jG2ekOxH"
Content-Disposition: inline
In-Reply-To: <79aef5658c9105c6d6891fcdf930e5a073a06699.1755692822.git.u.kleine-koenig@baylibre.com>


--y1bK2sA6jG2ekOxH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 03:11:30PM +0200, Uwe Kleine-K=F6nig wrote:
> If the input has a __symbols__ node, restore the named labels for the
> respective nodes.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  dtc.c      |  2 ++
>  dtc.h      |  1 +
>  livetree.c | 21 +++++++++++++++++++++
>  3 files changed, 24 insertions(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index b3445b7d6473..63a6c85da5cf 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -338,6 +338,8 @@ int main(int argc, char *argv[])
>  	if (auto_label_aliases)
>  		generate_label_tree(dti, "aliases", false);
> =20
> +	generate_labels_from_tree(dti, "__symbols__");
> +
>  	if (generate_symbols)
>  		generate_label_tree(dti, "__symbols__", true);
> =20
> diff --git a/dtc.h b/dtc.h
> index 3a220b9afc99..f97f3c29e2d4 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -339,6 +339,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  			      struct reserve_info *reservelist,
>  			      struct node *tree, uint32_t boot_cpuid_phys);
>  void sort_tree(struct dt_info *dti);
> +void generate_labels_from_tree(struct dt_info *dti, const char *name);
>  void generate_label_tree(struct dt_info *dti, const char *name, bool all=
ocph);
>  void generate_fixups_tree(struct dt_info *dti, const char *name);
>  void generate_local_fixups_tree(struct dt_info *dti, const char *name);
> diff --git a/livetree.c b/livetree.c
> index f328824c3bc6..8aafc9aa5cd6 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -1112,6 +1112,27 @@ static int generate_local_fixups_tree_internal(str=
uct dt_info *dti,
>  	return ret;
>  }
> =20
> +void generate_labels_from_tree(struct dt_info *dti, const char *name)
> +{
> +	struct node *an;
> +	struct property *p;
> +
> +	an =3D get_subnode(dti->dt, name);
> +	if (!an)
> +		return;
> +
> +	for_each_property(an, p) {
> +		struct node *labeled_node;
> +
> +		labeled_node =3D get_node_by_path(dti->dt, p->val.val);
> +		if (labeled_node)
> +			add_label(&labeled_node->labels, p->name);
> +		else if (quiet < 1)
> +			fprintf(stderr, "Warning: Path %s referenced in property %s/%s missin=
g",
> +				p->val.val, name, p->name);
> +	}
> +}
> +
>  void generate_label_tree(struct dt_info *dti, const char *name, bool all=
ocph)
>  {
>  	if (!any_label_tree(dti, dti->dt))

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--y1bK2sA6jG2ekOxH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmimn6EACgkQzQJF27ox
2GfPBg//aVzgDBPM31xS+T7hODo5b/Ug9fpR7kpwOczx2DrJOhZB9l1Qj5tWCOrU
LgXYbmfVU8R2qQpiTPFj2dZAEfX5HjbYyAZ7b8cg7ipPueUWknXQPZ0+TpV7tWV/
mDoUpe3VAKuPcUxB9vGLidNpyfV5jwmk4V2779yVUswYJcZSkomgTjRo7Rgz21hH
5AuAqIxrpd0atn/bCgTDNimuabbnqqX70XRMdtNG01oq0P+0RnU3c8YkKB1k3c/u
rH4y79k23IVK2/CiBIcsnrtp83JQP5GewE8kAyuWBYZSHZYN+bUdwondg50X7cO2
hIzDhAHY3XAv6A4SEulx9vuuxhppGizkOxoB0dkm0rdAol4YvdJw/MrgSXx0JQVv
ULt8pdqPIS6YEVXVEpmVwY6cPq6YQ4rvtq40vB0fCf9YRmg2gdCQ/zGLJu08XuV0
dPiFhx3cOCpN/LctymmrPRrq5tbE52fDi5ud7q2s3uDiVmwntEkGXJFP37pDU5We
KcYAHJtIXQrhdb58zdc7XLNQprRNvHYa8hNhtMAOJSlisHMpzP29gqp7KuNrIQ8P
tgbr7okHH7XZoyXWe5Kj3bdJf8M6hAhXZH6IYoF5xiBlLi/T28Ooj4njJ4eBQYiJ
wqELGmMLuN4Yigj1iv5p8z4X1vSO8oWkAg+4OMBVnFMeektPdJs=
=sqJN
-----END PGP SIGNATURE-----

--y1bK2sA6jG2ekOxH--
