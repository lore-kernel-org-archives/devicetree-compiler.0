Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BBB36309C
	for <devicetree-compiler@vger.kernel.org>; Wed,  1 Apr 2026 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056517; cv=none; b=c7DPjA++o1MKUrp++2qXqTNmFzMv16EobUBjthUKbZa4QO+OttTZhNJzaiu1cFezXtwO2DvlolrtCrSWIRyiEkODkZ13nzIT2h5Bx3qQf6eg820sf0skiwPOIbehjjy8NymTqcfP8ZWQkTCNKa4YMMuRYC2TMYr9sgU33DKfeOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056517; c=relaxed/simple;
	bh=h1bAV1hr6YgCzq4oPdVdCqInAjJ01QtWiYFz28DI+Hg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ESVGoh7yP4rGXBcCxIwykrfVMPsxbOHHPsg0YVDM+ovZgmgd754GBZ9kyuWR2WHWHs7U6yqbmrpNDiSDLLWy8SxW5SZ8IwdWTznCMmFLJJjXWt+Ypx7ESynv7Oxdcrpn9aXvH0lWBJ5Qz1DA11tSaoUTw7X1ent0e7qqZNsU96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aNn4xR0x; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aNn4xR0x"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CC10FC5996B;
	Wed,  1 Apr 2026 15:15:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B00E4602BF;
	Wed,  1 Apr 2026 15:15:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70BF21045030B;
	Wed,  1 Apr 2026 17:15:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775056510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LyQgOelUHk2NRcwZHxexr9o331ggNhAkR7mGIXD9keo=;
	b=aNn4xR0xclegzoHuZkjvkhSSR/H86cQBVG86bx2XFZvop+T10cAMlPZFBPx3sTGXrcW+6C
	vEVzT/UPIxcI3D9AM9pdxSo6dpDdVIJPxpllnRjhalAMZdJvh7ipZQpF9vSf1ppKzMVptG
	Mk863+zzAt7ks1ApettpWrV+QsKWdoNzlkZanke69ET5CrB3dXBi5iRtXkabuCVkR4JTVZ
	uOXh13GdooivtAminQT0Zdfyz5l2IiMu2VaRgN7jEuZqbctWkvT0wM1mlDtl6UD/vnOv11
	E4KR+w2N/IJPKQf0gYzPEeriNPk8nP8sIGZxtc+hsojKzWp+nhKQ4WUF34t+Hg==
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 17:15:09 +0200
Message-Id: <DHHX0MU38SMV.1NAWHIZ7STHW4@bootlin.com>
Subject: Re: [RFC PATCH 10/15] fdtdump: Handle unknown tags
Cc: "Ayush Singh" <ayush@beagleboard.org>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, <devicetree-compiler@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree-spec@vger.kernel.org>, "Hui Pu" <hui.pu@gehealthcare.com>, "Ian
 Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>, "David Gibson"
 <david@gibson.dropbear.id.au>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-11-herve.codina@bootlin.com>
In-Reply-To: <20260210173349.636766-11-herve.codina@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error when they are read.
>
> Handle those structured tag.

How? This sentence is vague, what about:

  Allow dumping the unknown tags or not based on a command line flag.

> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -44,7 +44,7 @@ static const char *tagname(uint32_t tag)
>  #define dumpf(fmt, args...) \
>  	do { if (debug) printf("// " fmt, ## args); } while (0)
>
> -static void dump_blob(void *blob, bool debug)
> +static void dump_blob(void *blob, bool debug, int dump_unknown)
>  {
>  	uintptr_t blob_off =3D (uintptr_t)blob;
>  	struct fdt_header *bph =3D blob;
> @@ -146,20 +146,55 @@ static void dump_blob(void *blob, bool debug)
>  			continue;
>  		}
>
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
> +			case FDT_TAG_DATA_LNG:
> +				/* Get the length */
> +				sz =3D fdt32_to_cpu(GET_CELL(p));
> +				break;
> +			}
> +
> +			if (dump_unknown) {
> +				printf("%*s// Unknown tag ignored: 0x%08"PRIx32", data lng %d",

As before, I'd use "len" instead of "lng".

> +				       depth * shift, "", tag, sz);
> +				if (dump_unknown > 1 && sz !=3D 0) {
> +					printf(" ");
> +					for (i =3D 0; i < sz; i++)
> +						printf("%02hhx", *(p + i));
> +				}
> +				printf("\n");
> +			}
> +
> +			/* Skip the data bytes */
> +			p =3D PALIGN(p + sz, 4);
> +			continue;
> +		}
> +
>  		die("** Unknown tag 0x%08"PRIx32"\n", tag);
>  	}
>  }
>
>  /* Usage related data. */
>  static const char usage_synopsis[] =3D "fdtdump [options] <file>";
> -static const char usage_short_opts[] =3D "ds" USAGE_COMMON_SHORT_OPTS;
> +static const char usage_short_opts[] =3D "dus" USAGE_COMMON_SHORT_OPTS;
>  static struct option const usage_long_opts[] =3D {
>  	{"debug",            no_argument, NULL, 'd'},
> +	{"unknown",          no_argument, NULL, 'u'},
>  	{"scan",             no_argument, NULL, 's'},
>  	USAGE_COMMON_LONG_OPTS
>  };
>  static const char * const usage_opts_help[] =3D {
>  	"Dump debug information while decoding the file",
> +	"Dump unknown tags information while decoding the file (-uu to have dat=
a)",
                                                                       ^
								       dump

> --- a/tests/trees.S
> +++ b/tests/trees.S
> @@ -328,3 +328,113 @@ named_root_strings:
>  named_root_strings_end:
>
>  named_root_end:
> +
> +
> +	/* Tree with "unknown" tags that can be skipped
> +	 * Use a really future dtb version to check version downgrade on
> +	 * modification.
> +	 */
> +	treehdr_vers	unknown_tags_can_skip 0xffffffff 0x10
> +	empty_rsvmap	unknown_tags_can_skip
> +
> +unknown_tags_can_skip_struct:
> +	fdtlong	FDT_TEST_1CELL_CAN_SKIP
> +	fdtlong	0x1
> +
> +	beginn	""
> +		fdtlong	FDT_TEST_NONE_CAN_SKIP
> +
> +		propu32	unknown_tags_can_skip, prop_int, 1
> +
> +		fdtlong	FDT_TEST_1CELL_CAN_SKIP
> +		fdtlong	0x11
> +
> +		propstr	unknown_tags_can_skip, prop_str, "abcd"
> +
> +		fdtlong	FDT_TEST_2CELLS_CAN_SKIP
> +		fdtlong	0x12
> +		fdtlong	0x12

Can you use different values here, just to make the test slightly more
robust? Just in case parsing ends up on the wrong cell, as unlikely as it
can be.

Same in various places below.

> +
> +		fdtlong	FDT_TEST_LNG_CAN_SKIP
> +		fdtlong	3
> +		.byte 0x13
> +		.byte 0x13
> +		.byte 0x13
> +		.byte 0 /* padding */
> +
> +		beginn	"subnode1"
> +			propu64	unknown_tags_can_skip, prop_int, 1, 2
> +			fdtlong	FDT_TEST_NONE_CAN_SKIP
> +		endn
> +
> +		beginn	"subnode2"
> +			fdtlong	FDT_TEST_1CELL_CAN_SKIP
> +			fdtlong	0x121
> +			propu64	unknown_tags_can_skip, prop_int1, 1, 2
> +			fdtlong	FDT_TEST_1CELL_CAN_SKIP
> +			fdtlong	0x122
> +			propu64	unknown_tags_can_skip, prop_int2, 1, 2
> +			beginn	"subsubnode"
> +				fdtlong	FDT_TEST_1CELL_CAN_SKIP
> +				fdtlong	0x123
> +				propu64	unknown_tags_can_skip, prop_int, 1, 2

As before, you are using values 1 and 2 for all the properties, I'd use
different values, and possibly even with different amounts of cells in
properties.

Other than these two minor nits, this patch looks very good to me.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
