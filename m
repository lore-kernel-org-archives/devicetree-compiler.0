Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDAF33F5A5;
	Thu, 10 Sep 2026 04:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015885; cv=none; b=XeEqrP8QSByC+MotoO6HsGxLgUsVSvGDEebzNiU5XMO9V3BHB/HNEIAx2xrdNwNJS0IPKhqDG5lUtNQezuTL2nAaiaQuo+PgNaXvj0I3Bm2FmVT2hrDK6tAMkPBYiqaOpHqJygDEz0BnuvRbQYI0Ghw/RlBNWgM/F7kKCYcwVSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015885; c=relaxed/simple;
	bh=6EGr0pndE9v3Gm2AgJL+8/w6MjwUCuDONw4iUYy4k48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROc0C9lpdf5wZSfO/cFxpW0hakYoXX52UP/W+aOGUl8BZ3CEKhmJhL73DjFlpINoP9ol/NRlE+XXQk2X5bOEPb84T5FLIyf10blStsyzhPA4WPvZFxOFqpKrsrTKMmrTmGOOjFRBsAPfeADzfma1TtJk7KTq7vGtn/F9T96VORo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=tCexOwsk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="tCexOwsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789015863;
	bh=1U+Szheeb8hBdKfW81mvEE/dQvw3hrkyapGDFYxY+r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCexOwskmN98peAWQoE5s9p8KrJJgtA170oZOEWYw42ZNpZ2AvBFtQ0XNV3K1cJnq
	 /cQ9ZBOombhCU17ZXB2SbRKUX+/nlM8WKhPCdOsFbmU1hhPe71bkoiHNyMYBskA//V
	 jUsmogEowVOG5WZ0NTNUy9YLyuYBtkRxNOuMr9PvmxZP016O7SbVE/dh932DV3HbmR
	 Pk7rhK8rQ92hYJMRtpE/5RqiiVSZU5XXm+Em0DdY5EoGVINXwl3bdfRISzkDz8h7DL
	 iMeOi2G7cI+D8u+G8baSXKPzewH6JAHXkWM8BPxaxgZLc6WGkh3zMhyzP7LT8N6w/D
	 VAgyAfPEH/9bA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hgQHC2SMFz4wL4; Thu, 10 Sep 2026 14:51:03 +1000 (AEST)
Date: Thu, 10 Sep 2026 14:51:08 +1000
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
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <aqI3KnnQnUytqkEc@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ajGarnbizewj7ke"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-7-herve.codina@bootlin.com>

--4ajGarnbizewj7ke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:37AM +0200, Herve Codina wrote:
> The goal of structured tag values is to ease the introduction of new
> tags in future releases with the capability for an already existing
> release to ignore those structured tags. In order to do that data length
> related to the unknown tag needs to be identified.
>=20
> Also add a flag to tell an old release if this tag can be simply skipped
> or must lead to an error.

I suggested/insisted on this in the past, but I've since realised this
isn't actually useful.  The "structured tag" format is only useful
because it allows you to skip over unknown tags, which means there's
no point using it for ags that can't be skipped.  If we need new tags
that can't be safely skipped, they can be added as old-style tags
instead.

In which case "old style" versus "new style" is no longer a good
characterization: they would exist side by side, so the distinction is
more "skippable" versus "non skippable" tags.  Which suggests that
"skippable tags" or "metadata tags" might be a better term than
"structured tags" - that would focus more on the why than the how.


> Structured tag value is defined on 32bit and is defined as follow:
>=20
>   Bits  | 31 | 30        | 29             28 | 27    0|
>   ------+----+-----------+-------------------+--------+
>   Fields| 1  | SKIP_SAFE | DATA_LEN_ENCODING | TAG_ID |
>   ------+----+-----------+-------------------+--------+
>=20
> Bit 31 is always set to 1 to identify a structured tag value.
>=20
> Bit 30 (SKIP_SAFE) is set to 1 if the tag can be safely ignored when its
> TAG_ID value is not a known value (unknown tag). If the SKIP_SAFE bit is
> set to 0 this tag must not be ignored and an error should be reported
> when its TAG_ID value is not a known value (unknown tag).
>=20
> Bits 29..28 (DATA_LEN_ENCODING) indicates the length of the data related
> to the tag. Following values are possible:
>   - 0b00: No data.
>           The tag is followed by the next tag value.

I think "next tag." would be clearer than "next tag value." - "next
tag value" could be confused as meaning the data that comes after the
tag.

>   - 0b01: 1 cell data
>           The tag is followed by a 1 cell (u32) data. The next tag is
>           available after this cell.

Remove "available", it doesn't add any information.

>   - 0b10: 2 cells data
>           The tag is followed by a 2 cells (2 * u32) data. The next tag
>           is available after those two cells.

Ditto.

>   - 0b11: Data length encoding
>           The tag is followed by a cell (u32) indicating the size of the
>           data. This size is given in bytes. Data are available right
>           after this cell.
>=20
>           The next tag is available after the data. Padding is present
>           after the data in order to have the next tag aligned on 32bits.
>           This padding is not included in the size of the data.

I'm guessing the 1 & 2 cell cases are pretty common so it saves a
moderate amount of dtb size to have this encoding.  However, it does
come at the cost of greater code complexity.  Is it worth it?  I'm
willing to believe it is, but I think the case needs to be made.

I'd also avoid the term "cell" here.  To me a "cell" is specifically a
term applying to a 32-bit value _within a device tree property_.
These are 32-bits, but not part of a property.  Plus if Segher
reappears, he'll complain that in the old days of OF, a cell wasn't
necessarily 32-bits :).

> Bits 27..0 (TAG_ID) is the tag identifier defining a specific tag.
>=20
> Introduce the structured tag values definition and some specific tags
> reserved for tests based on this structure definition.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  libfdt/fdt.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index a07abfcc..f41a355f 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -49,6 +49,7 @@ struct fdt_property {
> =20
>  #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
>  #define FDT_TAGSIZE	sizeof(fdt32_t)
> +#define FDT_CELLSIZE	sizeof(fdt32_t)

I'd avoid creating this constant for similar reasons to avoid the term
"cell" above.

>  #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
>  #define FDT_END_NODE	0x2		/* End node */
> @@ -57,6 +58,28 @@ struct fdt_property {
>  #define FDT_NOP		0x4		/* nop */
>  #define FDT_END		0x9
> =20
> +/* Tag values flags */
> +#define FDT_TAG_STRUCTURED	(1U<<31)
> +#define FDT_TAG_SKIP_SAFE	(1U<<30)
> +#define FDT_TAG_DATA_MASK	(3U<<28)
> +#define FDT_TAG_DATA_NONE	(0U<<28)
> +#define FDT_TAG_DATA_1CELL	(1U<<28)
> +#define FDT_TAG_DATA_2CELLS	(2U<<28)
> +#define FDT_TAG_DATA_VARLEN	(3U<<28)
> +
> +#define FDT_TAG_NO_SKIP(tag_data, tag_id) \
> +		(FDT_TAG_STRUCTURED | tag_data | tag_id)
> +
> +#define FDT_TAG_CAN_SKIP(tag_data, tag_id) \
> +		(FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE | tag_data | tag_id)
> +
> +/* Tests reserved tags */
> +#define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NONE, 0)
> +#define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0)
> +#define FDT_TEST_2CELLS_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_2CELLS, 0)
> +#define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0)
> +#define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)
> +
>  #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
>  #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
>  #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--4ajGarnbizewj7ke
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqiNyoACgkQzQJF27ox
2GerKBAAkWui4yxqUCx1Fe6C/hzsFQ9MyJhSEAKgBScq7lyuSMOYZQEwkfqRb1WQ
JgL09DAvbeQxNVrGCQ6I7ZRcKCLFq7IfTTB43v7TFKlmWqLg8/JgUbJ4GiFT8yqv
1JbZZvSgaEzakiR5kXT9wr/sOilefN3qULPWMQizqgjUMVFWMWRduV5gECn42XHe
6GhmmOKHAPdFfLxsQ5GOcMNsQknJjGNJimMLKIBtb5kkL1iU2jEItngsupL5fpcS
4k6ZnpSBqHbGFTYLfIzxl+SABmVckECdtVpYFWerFTvtbEW9c8HidWBMF0slM4O2
5U4Q9N/npn17Z5OcMf6s1Plx2hj12ECJM+PxjLrDRLI9cfi79givxuzMUAzzs5ai
F9+16BSMgqignTGZIXnXP+COKjryUYWfR5v+lbdYLuR2XsnK2Z0MQS4vO+xSOMTY
72wD02AgWDEmZnnQJa3yEaYDwzTpllQdDl0j8UpakF+RmyADNyAN8BSayRrw7xxj
rkY+gDh9g9nHEVPSqLPrKwy8wd0iT45juDYujsFBvb+D+tJsdVSmFUXytgI6QXga
OpcynKowL0NF2u+5Yykek8I1jLIUZGo950n6VmtIOZBz8hobg7NkrtOvPnZT46My
FfwxIUQxkSeyGucLES2VfL6bpRP1ub1mWUYJYnXyzrOyXir+Tfw=
=qd/b
-----END PGP SIGNATURE-----

--4ajGarnbizewj7ke--
