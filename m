Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C121A3ACA5F;
	Mon, 14 Sep 2026 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374248; cv=none; b=tIsTH9LSnYydiC5SZe7YgyY6Za7XCU0uBaOIN4uIpkjlMP9uUbRzpgRftedKVLb1FhFkalipe3C65n0OGL4oYQkRVk0LCeSJPD5zp01p6IefodwFWRlxa3GpnA/Lhd3Z/HErz5ym2ju7iBedQTX7ja75IISSN68+tw2mRWz8aW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374248; c=relaxed/simple;
	bh=1EN0sfTP2jV+BTBHVUUZe3HcMSI08EFSlZ/aDPeVgmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ9ZaFMCk8vPF1EqqqUr6oN1OFySBc5ysx90GMuHK6d6LLXT6bQOP+plFMu6akISbN0vd0BigXQd2GekvdgPHvKoiJe8aeGEHy5NXJk27OiObqLOh7eMKbTf4WklDjt6JxSGsA2MJKRxeWli+AwJamju0HJpLu1n7r0MQEmor8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=heP9bc6G; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="heP9bc6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789374221;
	bh=MbZiupoKOkxDjxRAIZy0yrt2WskEO7oB9f/3ZPHaREc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=heP9bc6GI1qWb5drkow+Uy5xe5th16hFIlY6y1Ikxhd7YLXLMDw39yKrwHnjA9nny
	 0S0XadkWHmQyocdwH1EsP/PBnaKjNwJl6BRWK1w+DDsOZrcpY7bWR1WfmWzEJxnqxv
	 f3TdIYY9IeXdT8P0KkHA6WpZs7+gurrgktkUU9gJzcDE67jUGSQOBHMS/bhTuVjzmo
	 +foA78LdWGEGbh7DG5lo2V9raVQyQXoOTwIBZwC7wSsyvSGYfBqZBloLsOav/BudsH
	 cg/DZtDPs2stB4e/xqDb+ffX3w2/ywnJDBtaiviYdfJj6NcDVDcIPgEuJfDRA4kIga
	 Y2p+ffncLDHiQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hjypj51Mpz4wFC; Mon, 14 Sep 2026 18:23:41 +1000 (AEST)
Date: Mon, 14 Sep 2026 18:23:49 +1000
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
Subject: Re: [PATCH v3 08/15] flattree: Handle unknown tags
Message-ID: <aqevEJ_VlBxYUp81@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qW7FTkCa9t5Gj7Ua"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-9-herve.codina@bootlin.com>

--qW7FTkCa9t5Gj7Ua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:39AM +0200, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error when they are read.
>=20
> Handle those structured tag.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  flattree.c                                 | 65 ++++++++++++++++++++--
>  tests/run_tests.sh                         |  5 ++
>  tests/unknown_tags_can_skip.dtb.dts.expect | 19 +++++++
>  3 files changed, 84 insertions(+), 5 deletions(-)
>  create mode 100644 tests/unknown_tags_can_skip.dtb.dts.expect
>=20
> diff --git a/flattree.c b/flattree.c
> index f3b698c1..88dbfa7e 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -579,7 +579,8 @@ static void flat_read_chunk(struct inbuf *inb, void *=
p, int len)
>  	if ((inb->ptr + len) > inb->limit)
>  		die("Premature end of data parsing flat device tree\n");
> =20
> -	memcpy(p, inb->ptr, len);
> +	if (p)
> +		memcpy(p, inb->ptr, len);
> =20
>  	inb->ptr +=3D len;
>  }
> @@ -604,6 +605,61 @@ static void flat_realign(struct inbuf *inb, int alig=
n)
>  		die("Premature end of data parsing flat device tree\n");
>  }
> =20
> +static bool flat_skip_unknown_tag(struct inbuf *inb, uint32_t tag)
> +{
> +	uint32_t lng;
> +
> +	if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
> +		return false;
> +
> +	switch (tag & FDT_TAG_DATA_MASK) {
> +	case FDT_TAG_DATA_NONE:
> +		break;
> +
> +	case FDT_TAG_DATA_1CELL:
> +		flat_read_word(inb);
> +		break;
> +
> +	case FDT_TAG_DATA_2CELLS:
> +		flat_read_word(inb);
> +		flat_read_word(inb);
> +		break;
> +
> +	case FDT_TAG_DATA_VARLEN:
> +		/* Get the length */
> +		lng =3D flat_read_word(inb);

I think it would be more natural to get the length as a single value,
then have a common flat_read_chunk() and flat_realign() to consume it.
That's for two reasons:
 * Assuming we keep this length encoding, getting the final tag size
   seems like it would make a useful helper function anyway.
 * Using flat_read_word() is misleading - it implies it's integer data
   where endianness matters.  In this case it's not - it's just some
   bytes we're skipping over, we don't know the internal structure.

> +
> +		/* Skip the following length bytes */
> +		flat_read_chunk(inb, NULL, lng);
> +
> +		flat_realign(inb, sizeof(uint32_t));
> +		break;
> +	}
> +
> +	return true;
> +}
> +
> +static uint32_t flat_read_tag(struct inbuf *inb)
> +{
> +	uint32_t tag;
> +
> +	do {
> +		tag =3D flat_read_word(inb);
> +		switch (tag) {
> +		case FDT_BEGIN_NODE:
> +		case FDT_END_NODE:
> +		case FDT_PROP:
> +		case FDT_NOP:
> +		case FDT_END:
> +			return tag;
> +		default:
> +			break;
> +		}
> +	} while (flat_skip_unknown_tag(inb, tag));

Having this as a separate function seems odd to me...

> +	die("Cannot skip unknown tag 0x%08x\n", tag);
> +}
> +
>  static const char *flat_read_string(struct inbuf *inb)
>  {
>  	int len =3D 0;
> @@ -750,7 +806,7 @@ static struct node *unflatten_tree(struct inbuf *dtbu=
f,
>  		struct property *prop;
>  		struct node *child;
> =20
> -		val =3D flat_read_word(dtbuf);
> +		val =3D flat_read_tag(dtbuf);
>  		switch (val) {


=2E. rather than having handling unknown tags as part of the default:
case here.

>  		case FDT_PROP:
>  			if (node->children)
> @@ -905,14 +961,13 @@ struct dt_info *dt_from_blob(const char *fname)
> =20
>  	reservelist =3D flat_read_mem_reserve(&memresvbuf);
> =20
> -	val =3D flat_read_word(&dtbuf);
> -
> +	val =3D flat_read_tag(&dtbuf);
>  	if (val !=3D FDT_BEGIN_NODE)
>  		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0=
x%08x)\n", val);

Hmm.. doesn't this already need to be fixed to handle NOP tags before
the root node?  Logically that change would go before this one.

> =20
>  	tree =3D unflatten_tree(&dtbuf, &strbuf, "", flags);
> =20
> -	val =3D flat_read_word(&dtbuf);
> +	val =3D flat_read_tag(&dtbuf);
>  	if (val !=3D FDT_END)
>  		die("Device tree blob doesn't end with FDT_END\n");

Likewise here for that matter, a NOP should be valid between the last
FDT_END_NODE and the FDT_END.

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index f3647e63..8fc23cb7 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -882,6 +882,11 @@ dtc_tests () {
> =20
>      # Tests for overlay/plugin generation
>      dtc_overlay_tests
> +
> +    # Tests with "unknown tags"
> +    run_dtc_test -I dtb -O dts -o unknown_tags_can_skip.dtb.dts unknown_=
tags_can_skip.dtb
> +    base_run_test check_diff unknown_tags_can_skip.dtb.dts "$SRCDIR/unkn=
own_tags_can_skip.dtb.dts.expect"

It's best to avoid tests based on -O dts output unless we're
explicitly checking -O dts behaviour: because there are multiple ways
to format property values, the exact output isn't really guaranteed.

What I'd suggest instead is to adjust treegen to generate two dtbs
that are identical _except_ for the skippable tag.  Then you can use
dtc -I dtb -O dtb, and compare the dtc output (which should strip the
tag) against the dtb which was constructed without it in the first
place.

Or, rather than explicitly creating two new trees, you could make your
skippable tag example identical to test_tree1, except for the
additional tag, and re-use one of the other instances of test_tree1 as
the "tagless" version.


> +    run_wrap_error_test $DTC -I dtb -O dts -o unknown_tags_no_skip.dtb.d=
ts unknown_tags_no_skip.dtb
>  }
> =20
>  cmp_tests () {
> diff --git a/tests/unknown_tags_can_skip.dtb.dts.expect b/tests/unknown_t=
ags_can_skip.dtb.dts.expect
> new file mode 100644
> index 00000000..2194025b
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.dtb.dts.expect
> @@ -0,0 +1,19 @@
> +/dts-v1/;
> +
> +/ {
> +	prop-int =3D <0x3201>;
> +	prop-str =3D "abcd";
> +
> +	subnode1 {
> +		prop-int =3D <0x6401 0x6402>;
> +	};
> +
> +	subnode2 {
> +		prop-int1 =3D <0x64020 0x64021>;
> +		prop-int2 =3D <0x32022>;
> +
> +		subsubnode {
> +			prop-bool;
> +		};
> +	};
> +};
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--qW7FTkCa9t5Gj7Ua
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqnrxAACgkQzQJF27ox
2GdKSQ/+N49AYOl3m2eYQD0cuhHrLVWv6qh0oIHnlZbWk+BaY9oEz7MGylOoYelG
xgGTLQPaMjn74q9fnNJ8jZQ156OTpjB0TSNze0RLgytbZFkNTHClbCs0iumc58jj
S03Ks1wYltXhpgB+E/uawslp0BNVEO7Iztdrf5jmE/lVX9kWuG81JttzhVvO5mzB
Dz7/JLEoYcMOzLZEAq1XLrhB6YO4HuWjWScbZyGx6ayJHo2MLlBkRpfzUqrziOvO
4gALO9Sq/yc0aY7aq3EuP0HbO82pvde+dSKHnTqpQO+Qf4t18eCLCuI9LbhJJ59S
KGQAwpmGB7GBB8rbmEC0hV/AQayPEeoBVfLyK2/91aADpbNaNrsm+Lw8Y2D9G3+D
ILJrGf1DeEdvG4NGxm/YMPDPQB+2Z8Qwt72WF6UGLjWKZzQA//+tSQ0hWwh9sN+u
ctVAcQWcWUVsFgupqvFe1Ohv4jETpXBHVf9XLbAonhYEPAgyidit8P+zGMT5HRAE
Gm4VlOZITfnIUSS8uJsZcreaKu2RDeN+NYMLDhKU934gndtkCeFTmF3udZACbW1L
UHmMbzSi5BFgLekbKCmP2N3bQgBMvolSJpS0ZqnBzK7CdfvyF/Lyoi/+IB8JNBgm
2Znm0yvaqznzGxAGnUkiEBRsnDMfTRhW0YdFxTsTxncRalJldqU=
=wLEW
-----END PGP SIGNATURE-----

--qW7FTkCa9t5Gj7Ua--
