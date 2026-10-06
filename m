Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDCD2D1931
	for <devicetree-compiler@vger.kernel.org>; Tue,  6 Oct 2026 03:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791255706; cv=none; b=i/Roy8vLBo5Tkfusc9n0h6QGA9hEi1qhFP5wHlDso4nBXJbjYx7KmU4t/pNXdnnXBnSd3Ec4bYJqMudreB0OPdPO1V9nTEbFAILb9PfgAPB2mi+0zf/fOd77LNna111EI0SSATaRMf6+TD8p40iYmAYhDR/t6a5a2Np/8F4rNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791255706; c=relaxed/simple;
	bh=qFsMlmJ8lnYe3kDHWU3QxiXLeRacvVhvsg+7NpxaEXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGcQ5+08y1oGGDohYwTa3HNyPSp+i9NlFgykjYJkf0ITPcU0CJ88phrpw2fXndvOLaeK3AdmRooObyGLRCKtbzOdl367aMdhCjwsj5dlI8O2rR6cnKtOU5AlG8oAsvC6Z3Td/uUC17pQLSYzwZgOu003+Xl4RuK+LONFesltzdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=aAeVQtZi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="aAeVQtZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1791255694;
	bh=5HLb+822F3ecodEVbwR8eJJn9ESUCmhrjOCV7X1f3Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aAeVQtZiFROn363GN8N5lBehj09s+xqsNHOccHlqGNIAjcyeN57Wn5MB56vrUwl/i
	 bNg3gaS03hpQkNP4F4tDXVX3axnC2oh2oxmfylyLedVZSynta6umzL+EgmSnUyqf7Y
	 rIuVj5H6zXr8SBhvg9s9y8+dqSsMiehUeDY8k7SSvLw7JVyyxUf0u48arnLN+3oSGP
	 p2Dt0M8/lb63uVYcQqWVecPo0nLzjoM0bCgrcbu2Z49bd/cRUftsEXMoAMPAtiV3Mq
	 wQPbxUeVGhgX1Qes5ZICRPowHFWdKlsOQPVhjLgby51pwxflyBSTttJg/4n6gttY47
	 3l8Z41gEItW8g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hzLct3Xqnz4wJH; Tue, 06 Oct 2026 14:01:34 +1100 (AEDT)
Date: Tue, 6 Oct 2026 13:59:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] libfdt: Fix fdt_get_path() reading before the start of
 the buffer
Message-ID: <asRkJHpQ_gbAgC1t@gractus.seuss>
References: <20261001121036.2910243-1-ayan.kumar.halder@amd.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xyxt8bffpNUPRV/d"
Content-Disposition: inline
In-Reply-To: <20261001121036.2910243-1-ayan.kumar.halder@amd.com>

--xyxt8bffpNUPRV/d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 01:10:36PM +0100, Ayan Kumar Halder wrote:
> fdt_get_path() walks the tree from the root, appending each node's name
> to the caller's buffer as it goes down and removing the last component
> again as it comes back up.  It keeps the number of components currently
> in the buffer in pdepth, and removes components while pdepth is greater
> than the depth reported by fdt_next_node().
>=20
> fdt_next_node() reports that it has left the tree by taking the depth
> negative, but the offset it returns at that point is the offset of the
> end tag, which is not negative.  The loop only tests the offset, so for a
> nodeoffset at or past the end tag it runs one more time with a negative
> depth.  pdepth still counts the components in the buffer, so the removal
> loop is asked to remove more components than are there: it takes the
> index down to zero and carries on scanning backwards for a '/' that is
> not in the buffer.
>=20
> Stop the walk when the depth shows it has left the tree.  Offsets that
> far along are rejected by the error paths below in any case, so this
> does not change what callers see.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

I think this is a bug in fdt_next_node() rather than in
fdt_get_path().  It should not be returning offsets that are not valid
node offsets (excepting negative error codes, of course).

> ---
>  libfdt/fdt_ro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 11f2e2e..32689c7 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -582,7 +582,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, cha=
r *buf, int buflen)
>  		return -FDT_ERR_NOSPACE;
> =20
>  	for (offset =3D 0, depth =3D 0;
> -	     (offset >=3D 0) && (offset <=3D nodeoffset);
> +	     (offset >=3D 0) && (depth >=3D 0) && (offset <=3D nodeoffset);
>  	     offset =3D fdt_next_node(fdt, offset, &depth)) {
>  		while (pdepth > depth) {
>  			do {
> --=20
> 2.25.1
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--xyxt8bffpNUPRV/d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrEZCQACgkQzQJF27ox
2Gc2rhAAo69uKvLYoIS0TGOl7rZqlHpZIimbh+l6k+oZ0uhnKpinMxm9N/KqSUkX
DqgFoPvVTI4HuNqFRrDSoPea2PMkB1lFuCNDJOCLun5zWtJ/SonQIrUN9j//e2aJ
c3Q2kvhkULqcgglAdmP514LEkTfX2UBWuE3nzXjkrBr7Fj6PoDQiCeBnF0KiU9Th
61Hp3MBhnu5UYlP7VmU8+BuYR8gOnv6huaTQGSYypLyH/pnYXMjPgZF6p6bi6SzF
3r/JHp0ZzSsF+AHPIitSiT9MnL5Gs8qsJaTEGiR7LLIca44s79Q2T4r2A4H7Bf2I
08wsb6qvsUtemiPwrJEmmLa+f4pCak8XfaHHrDWwTux80kdzWwimdTRGzZ2s5nPs
F6zTUped9OKVQDfPNd+tASeW5otehGJuwflXjlkYaI350T529ssqsdM/9FQWz7Qm
gX5xZntTdfHRJgKAltXQZphbHzUI281A7OUw8bZFNokLt6wPgbedO/KdzTV5yolM
OIZPE7BpL4pGQmJrFkhV/ldKUethvTm/Nj/FBkkN8+3FpeJX75Wtxrl0wFEIkKef
SC+Jml0WFT4sHoXzxSf0KJsfiQ+emT7FmAp0UMCBr0sCB6GCxPiRz69JBW2uRln5
r6vevZzMMiki5GbrZ3kIb5WGHz3GRDKpv+K5Y6ymKM6zswb6/n8=
=OwHM
-----END PGP SIGNATURE-----

--xyxt8bffpNUPRV/d--
