Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA9C31C567;
	Thu, 10 Sep 2026 05:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789017921; cv=none; b=ciEX5ytRX5DPUsX21FML85HD0Hn6w8RYt89hVyrWnwHm/ZPhkBMsYukxilJutBq6lhzbQUu1VUZWpuykcN6PwK1skH/6fUE+JGMAz66RXBtkhpY+uKTB1vqnGwoCIJUrfP7wYcK2j5/sFrHFd2H++WHuDe2pLZS3QlzyL12RiME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789017921; c=relaxed/simple;
	bh=uZ+ssNGzeWn88XPZBM3YsBmV0LDaX6yeh90MmKOv5Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAVLKuTIQn2BaUi3jx+27qIzyiE7+h8J1pUdh14JKvQ60hyT83E4W1Ra97Zv4duiMn3fb9RgivgQKJa+n7moEBB9UYsSY1VNrlLaH3kMo2yAmei5qaH9r88WYTo8CtRmJPzBgbeiCfZ+ioq4xc8giPR74TLwWDB0MMmO4tVr/0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=tzj8/bIy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="tzj8/bIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789017905;
	bh=JR2Q4OdCncZTd7kV/GRzEYc5v6YjxwiMVH0HTM9z8k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tzj8/bIyc01oRLQ5TCRuEFV7f2B1avVY0NuWkrfcxp/9nSrIvw7E3sYb2WjHYmKy4
	 /yw+IkI9vOmjKwLladBuhuCHQkN0nwbzJSrx2ZKpWjK3fraWDtMYyEn9P5rWvMZcsV
	 vfZEDEcpUL7IfP1quUK5n7Mgq2IwHYbtWhZrB+UVaZNI4sy455CeSBTagDYjfzN3zv
	 vnhMAaDr9BfrE2s51Ha3S6lRMXq8+FR2+vPSd9NU2inV6PBjvd8s7Q6/DhqLM+Rfme
	 Gl7vX5lvAzj/QhQggiEZrwTiWXEvt6YMgPLuDYwuPTTLaGPdXqNtCuJxxfWFsR4Krf
	 sMwCVcYqvqPMQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hgR2T6v40z4wKv; Thu, 10 Sep 2026 15:25:05 +1000 (AEST)
Date: Thu, 10 Sep 2026 15:25:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 07/15] fdtdump: Handle unknown tags
Message-ID: <aqI_KDZS9Kb6fwIG@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-8-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1XNe0gd8oWdHUCb+"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-8-herve.codina@bootlin.com>

--1XNe0gd8oWdHUCb+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:38AM +0200, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error when they are read.
>=20
> Add support for those structured tags in fdtdump and introduce a command
> line option to dump unknown tags that should be ignored.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  fdtdump.c                              |  45 ++++++-
>  tests/Makefile.tests                   |   3 +-
>  tests/meson.build                      |   2 +
>  tests/run_tests.sh                     |  41 +++++++
>  tests/treegen.c                        | 162 +++++++++++++++++++++++++
>  tests/unknown_tags_can_skip.dtb.expect |  29 +++++
>  6 files changed, 278 insertions(+), 4 deletions(-)
>  create mode 100644 tests/unknown_tags_can_skip.dtb.expect
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index 0e7a2659..7a8b2784 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -44,7 +44,7 @@ static const char *tagname(uint32_t tag)
>  #define dumpf(fmt, args...) \
>  	do { if (debug) printf("// " fmt, ## args); } while (0)
> =20
> -static void dump_blob(void *blob, bool debug)
> +static void dump_blob(void *blob, bool debug, int dump_unknown)
>  {
>  	uintptr_t blob_off =3D (uintptr_t)blob;
>  	struct fdt_header *bph =3D blob;
> @@ -146,20 +146,55 @@ static void dump_blob(void *blob, bool debug)
>  			continue;
>  		}
> =20
> +		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
> +			sz =3D 0;
> +			switch (tag & FDT_TAG_DATA_MASK) {
> +			case FDT_TAG_DATA_NONE:
> +				break;
> +			case FDT_TAG_DATA_1CELL:
> +				sz =3D FDT_CELLSIZE;
> +				break;
> +			case FDT_TAG_DATA_2CELLS:
> +				sz =3D 2 * FDT_CELLSIZE;
> +				break;
> +			case FDT_TAG_DATA_VARLEN:
> +				/* Get the length */
> +				sz =3D fdt32_to_cpu(GET_CELL(p));
> +				break;
> +			}
> +
> +			if (dump_unknown) {

I'd do this unconditionally: fdtdump is specifically for low-level and
debug dumping of a tree.  If you want pretty printing, dtc -Odts is
the thing to use.

> +				printf("%*s// Unknown tag ignored: 0x%08"PRIx32", data len %d",
> +				       depth * shift, "", tag, sz);

"Unknown" seems redundant.  "ignored" is not really true - you're
dumping its contents, which is all that fdtdump could be asked to do
with it.  So I'd just say:

	// Tag 0x<tag>: <data>

Or maybe "Metadata tag" / "skippable tag" if we go with one of those
terms as I suggested on an earlier patch.


The rest of this LGTM, except for things that will need to change
based on suggestions about the earlier patches in the series.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--1XNe0gd8oWdHUCb+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqiPygACgkQzQJF27ox
2GfoTQ//QOA/J4PlE8TBaJBxop6H1+sK3fYClmCzrm5Qt3Y9GZWouqW9wQoUHNuj
3pzrHIpgthVl6z3QSv8q/m/jBP0hyLLCw3B83cy5I0Xu97Vf87hZhig04Ak5hJEw
CBNN6InGpVcEyCr0pp8M07SXA6+btveYv1n2y9a78ljzAkL9N29xyJcg2jvcKyHi
JpcpCfWu31C2bf5YUVQI1dXjr16KWir8HLBuN49QESqq69JdeCMYcVsvQnt2kT8U
znjfz5vc87FahKKZyATxRWD1WKdxcvMmxa2Tdpthbi9REhJdaN5zXV1Y3Hvs9Amq
8sdk/+e3B5eBrUJ34l8Fs0y3TH/pYftNt/mARB7nSq41XJcKJDuTMimbGIugU4lJ
HSGheNY+qN1CJHEedo/n/aGUIF49Ueqhn/TsB6UYFZAbaYs9jj1yctNgtD5Klei4
9WBTy0M6gzFeGUaUJB7EjTuHKmIYKxj1l1N/tlyDO5cbEe//7lI6VpBsYwQ2+x0I
XWET4rlVT3zQLYiq0864E1zNQG8mjOT+BrzXnvbtPX+Mso1Qsax0es6YFIJmYGjo
9phsSZP3MftRpBuGtozvBOU9ziO4P9p6xeyn325UWAtxKM/BVe2wYX/rJdjHEg47
bynOQQmEBv0zSxWSA2vugkZYoPVYMI8+PK/tjdPUIDGiMBix1sc=
=N2f9
-----END PGP SIGNATURE-----

--1XNe0gd8oWdHUCb+--
