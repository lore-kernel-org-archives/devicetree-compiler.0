Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ADC370D7C;
	Wed,  1 Apr 2026 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056300; cv=none; b=sHQJHS9gdAus0FL45u9KAmjD8SMFJYOOV5ar5DNgbLwbJ2phM61GWmZl+ghXnNKkLcQMUdaUdROqU7XxTzITKi2OWRcq8lqk6sND88ntDCkl7iTVzB6eH+hH3uNuM6lj32U2ahq1bRi2Il0ytU/NbmehKrilAl1kn8IdeADPJv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056300; c=relaxed/simple;
	bh=cKIfDOUWbBsrybprOAsGROjGbK4Y84gvaNhqScNZQK4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=oVOLqggiPQeZ7+rfQNXabPC69p3v5FV8BeU3KtWc49ZA5Fi/6Wzxcqd8ps70gjtoTqaM633zeWPwlL2yqgoQMi3VgZCYsm0zDbshFcxpIw14UfF5XG3zW7vtaFWiFt2nMf2TCEI1sU3tZBNkmgpXjiIG7fy3LLbzJDbrPyV1Dxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SDIUN68v; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SDIUN68v"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D52641A309F;
	Wed,  1 Apr 2026 15:11:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A053A602BF;
	Wed,  1 Apr 2026 15:11:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DF6110450346;
	Wed,  1 Apr 2026 17:11:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775056296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jm+DFzw2+IHBIt/jYt2bq8VN/6ByxcD2SYWG6Iwk9Hw=;
	b=SDIUN68vMgi12KLrofW7DOuZgVXMkdYwtwrAiI+SPJM7SCAXyCE7UIzJgEqErLTATDP8VR
	04T2LjLw4q3z+fECo0kZ3Hv4jVzOWqkMZYI9JzaQz5IIFdI+5Unb2+zC+XNjyK6OIhTn9k
	JGfo6GDXFSsOv+Trag7yH/JaGGhoUDMVu0iF8RahNgU9VZxSGjAw3AeSYRIJMLt++wTx1A
	d91D96tr9YXD6Rs7dLGan2yDLVQNQfWvpLS9qJy9yaZZHH4WbLbYhXE7vTCbLu7Icqi29V
	oOCxi0ofALuqltF+YGcjugfIqI++jRT03Sxm4gGkxo16EKdDQTTj8Khw/9ytxQ==
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 17:11:35 +0200
Message-Id: <DHHWXWJD78XO.5RNDZHYZE0U4@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [RFC PATCH 09/15] Introduce structured tag value definition
Cc: "Ayush Singh" <ayush@beagleboard.org>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, <devicetree-compiler@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree-spec@vger.kernel.org>, "Hui Pu" <hui.pu@gehealthcare.com>, "Ian
 Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>, "David Gibson"
 <david@gibson.dropbear.id.au>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.1
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-10-herve.codina@bootlin.com>
In-Reply-To: <20260210173349.636766-10-herve.codina@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> The goal of structured tag values is to ease the introduction of new
> tags in future releases with the capability for an already existing
> release to ignore those structured tags. In order to do that data length
> related to the unknown tag needs to be identify.
                                         ^
					 identified

> Also a flag is present
 "Also add a flag"

> to tell an old release if this tag can be simply skipped or must lead to
> an error.
>
> Structured tag value is defined on 32bit and is defined as follow:
>
> Bits  | 31 | 30       | 29             28 | 27    0|
> ------+----+----------+-------------------+--------+
> Fields| 1  | CAN_SKIP | DATA_LNG_ENCODING | TAG_ID |
> ------+----+----------+-------------------+--------+
>
> Bit 31 is always set to 1 to identified a structured tag value.
                               ^
			       identify

> Bit 30 (CAN_SKIP) is set to 1 if the tag can be safely ignore when its
                                                         ^
							 ignored


> TAG_ID value is not a known value (unknown tag). If the CAN_SKIP bit is
> set to 0 this tag must not be ignored and an error should be reported
> when its TAG_ID value is not a known value (unknown tag).
>
> Bits 29..28 (DATA_LNG_ENCODING) indicates the length of the data related

I think "LEN" is more common than "LNG".

> to the tag. Following values are possible:
>   - 0b00: No data.
>           The tag is followed by the next tag value.
>
>   - 0b01: 1 cell data
>           The tag is followed by a 1 cell (u32) data. The next tag is
>           available after this cell.
>
>   - 0b10: 2 cells data
>           The tag is followed by a 2 cells (2 * u32) data. The next tag
>           is available after those two cells.
>
>   - 0b11: Data length encoding
>           The tag is followed by a cell (u32) indicating the size of the
>           data. This size is given in bytes. Data are available right
>           after this cell.
>
>           The next tag is available after the data. Padding is present
>           after the data in order to have the next tag aligned on 32bits.
>           This padding is not included in the size of the data.
>
> Bits 27..0 (TAG_ID) is the tag identifier defining a specific tag.
>
> Introduce the structured tag values definition and some specific tags
> reserved for tests based on this structure definition.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  libfdt/fdt.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index a07abfc..2e07599 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -49,6 +49,7 @@ struct fdt_property {
>
>  #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
>  #define FDT_TAGSIZE	sizeof(fdt32_t)
> +#define FDT_CELLSIZE	sizeof(fdt32_t)
>
>  #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
>  #define FDT_END_NODE	0x2		/* End node */
> @@ -57,6 +58,28 @@ struct fdt_property {
>  #define FDT_NOP		0x4		/* nop */
>  #define FDT_END		0x9
>
> +/* Tag values flags */
> +#define FDT_TAG_STRUCTURED	(1<<31)
> +#define FDT_TAG_SKIP_SAFE	(1<<30)

This is called CAN_SKIP in the commit message and SKIP_SAFE here. Using a
consistent name would be better IMO.

> +#define FDT_TAG_DATA_MASK	(3<<28)
> +#define FDT_TAG_DATA_NONE	(0<<28)
> +#define FDT_TAG_DATA_1CELL	(1<<28)
> +#define FDT_TAG_DATA_2CELLS	(2<<28)
> +#define FDT_TAG_DATA_LNG	(3<<28)

I find _LNG (or _LEN) misleading: this is not the length, but rather an
enum value telling you the length is stored in the next cell. What about
FDT_TAG_DATA_VARLEN?

Otherwise looks good.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
