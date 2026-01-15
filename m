Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A04E2C3257;
	Thu, 15 Jan 2026 06:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768457468; cv=none; b=BK14Fc0T1gub87tHaOCdyKVHiRt+QnetZJ76owk67bo+ftPAEZ8I4SN/wCXmFvCYBXwNy0dVMdhzPSFA6YYkxtBriCcgvVatUvOPgPnHfkX+jqp9aG6Mg7wejbBRjDaj3z1LCy1AAUQ8xjSE0IUgSiIu6Ku6FC6voVY1t37Rl0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768457468; c=relaxed/simple;
	bh=glcMICtqt+B7cdJfS+E+vP9Pa4YCi/31JxpYj4kq44w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVyPEOKavIL5JebRXOfyFVfV5sNj936WyltrFDq0URlNleFw05aQD2yyw/kigJHzXBPS42T9WFHCw2F+/qsoXjRUaUiYHWXJSb+2xJwCzdtPuVWMeHayZkjhNMPbFJkrTWR+8cHnv0sfH/UVUr5LW9QOUec1oj++ron2ChVIfEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ScpOFGSr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ScpOFGSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768457464;
	bh=L0wwIxKRszoDqYhPs4eFpNpFIjyCkS8wJOTj34HWTvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ScpOFGSr73K2gt/+/7diUhDSWNmI2UVq6OtphCBDU/lIPkC75NLuxGAIDMsois3wd
	 Laa2dlygf4FIt4TKS7EbNIeaSJnYVdrmbnFNrQKQl63da++8l0rNzp/s3koDfyjyFZ
	 RO0cO2lg1sUyfqgyMwxBb6MJ981mOaS4fVxO3bBjMEjOP80/EHF5f7IJUG8hrTWxB6
	 csuSb8gfnUx5Qyvfhp+vNKuIAhkljlVYuK+MUdKKpPIGENNhFZ7DayexE4+7NJ7hCx
	 orNd9NNG29J1bBpZulBMHdtCUGaljxt0e7tLIvpFLbzy9oQvFwynVVOtpbZT79THm6
	 gld1ywEzZtMuw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsCKN5F0nz4wGT; Thu, 15 Jan 2026 17:11:04 +1100 (AEDT)
Date: Thu, 15 Jan 2026 17:01:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 23/77] dtc: Introduce mark_local_exports()
Message-ID: <aWiCz7yZyAvJwPNU@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-24-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SuuU+yuO6h96zu8L"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-24-herve.codina@bootlin.com>


--SuuU+yuO6h96zu8L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:13PM +0100, Herve Codina wrote:
> In order to have correct tags set in dtb, an export symbol has to
> be identified as a "local" export symbol when it references a local
> node.
>=20
> This is done for phandles used by properties in mark_local_phandles().
>=20
> The same operation is needed for export symbols. This is the purpose of
> mark_local_exports().

Again, I don't like caching this information.  Can you determine this
just at the time you specifically use it?

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc.c      |  2 ++
>  dtc.h      |  2 ++
>  livetree.c | 23 +++++++++++++++++++++++
>  3 files changed, 27 insertions(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index fe8e8e4..030bfa2 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -336,6 +336,8 @@ int main(int argc, char *argv[])
>  	update_phandles_ref(dti);
>  	mark_local_phandles(dti);
> =20
> +	mark_local_exports(dti);
> +
>  	/*
>  	 * With FDT_REF_PHANDLE added in dtbs, we need to identified
>  	 * if some unresolved phandle references are allowed in the dtb
> diff --git a/dtc.h b/dtc.h
> index 0bf5ba5..ea073c2 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -368,6 +368,8 @@ void generate_local_fixups_tree(struct dt_info *dti, =
const char *name);
>  void update_phandles_ref(struct dt_info *dti);
>  void mark_local_phandles(struct dt_info *dti);
> =20
> +void mark_local_exports(struct dt_info *dti);
> +
>  /* Checks */
> =20
>  void parse_checks_option(bool warn, bool error, const char *arg);
> diff --git a/livetree.c b/livetree.c
> index 4458437..0e756b8 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -1303,3 +1303,26 @@ void mark_local_phandles(struct dt_info *dti)
>  {
>  	mark_local_phandles_internal(dti, dti->dt);
>  }
> +
> +static void mark_local_exports_internal(struct dt_info *dti,
> +					struct node *node)
> +{
> +	struct node *c;
> +	struct symbol *exportsym;
> +	struct node *refnode;
> +
> +	for_each_symbol(node->exportsymlist, exportsym) {
> +		refnode =3D get_node_by_ref(dti->dt, exportsym->ref);
> +		if (refnode)
> +			exportsym->is_local =3D true;
> +	}
> +
> +	for_each_child(node, c)
> +		mark_local_exports_internal(dti, c);
> +}
> +
> +void mark_local_exports(struct dt_info *dti)
> +{
> +	mark_local_exports_internal(dti, dti->dt);
> +
> +}
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--SuuU+yuO6h96zu8L
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlogs4ACgkQzQJF27ox
2Ge3cw/7BWqeTby3qpFeRWudt/kMXwyPjsntxT8XIrH+hogk5z4IqWNCtEKN6vnR
QCwb28M40qIntLxxDafH4U2C8rgdXuOQMudLdv/9lTpGsAIco1k9OQ+j2ARbHoMY
ugigo2jNUENWvnhUs5/vvZsNVHYCWOHzwSSlKWgyDLbzJuBq8s9vNMZSLj6E+ZCc
cJ/EjP/2jiNibFhH9Lf7u3hMi5jaiSJVwEt8HfrYMhSct7GUsizGyShOK1DNre2U
vPNnCDNufjXBRgDOBnbGngmlxlxGdHSmT1xbpX7SoPtEjbUMm5N8WB8SUdoptfKI
lu6GiX6t3e7D8Br6HoN5kFVwlITYl0bXy6vIMLC+OI8uZoBP9epttn1suDbSq+Fq
FCke4Q8vQD6YmQAKjnAAXchRSbYFUiuPUPhW8iFeJk4nFuTIIGX5ylmWn3OLgg1d
QNEShKgB1pBHsy17onuVbYdKcIZld4/wHl9whzXzLSOnFHHbnp/ctW4SKdcSY6xV
AgGS3jKmm5G+TQPq5OLe28MDbHCsPRs66Cl+NqGlr42R7toCvBcApMOQFG0yNcyr
AObvbAF3z79Uik+v17HwbSN66Q4AJlXE9pKXCZ2wKAn9Za4GGZkh6mjv2e00j/oN
es/n5DEXr1Pxt39myjULQxIFdTIxSzyQARt9W5EAj3JZNWg0L0w=
=758D
-----END PGP SIGNATURE-----

--SuuU+yuO6h96zu8L--
