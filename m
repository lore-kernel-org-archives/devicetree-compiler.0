Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24FE3B9617;
	Thu, 10 Sep 2026 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026104; cv=none; b=UTAl/euaaFaWCne3bYJwFxoxyXJV3zIKLVWX6+j74ewg8D9848FHqk/4JP3O1+Igl6fNJjISxftEmftxP5vCJmuk2oMaoyIopZCsvDiPKcF/tV8iRuiTddHcSHlwgbZpwvGY7l1MXyvERXeioPoiWU3tQTA7RmU8NFh44+1rWGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026104; c=relaxed/simple;
	bh=s4xzi3/ChXeiGi5vZRgpZuxVbGsK8ogXz7GRWM8ND0s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbA+y271ypMTXp16tt/lisKICwyQBxJ+FmlLRw1kOlgH/ZWcMUCAHAEOLGZ/SjAv7Hx98DrMJ7n4zFmRUAXvHnmQycMpfmpxpscQVGJMB/VZz9CjfwCps9Lq6K33q5vq1Fsot3flFIriiqcsjO4EJGye7KJUgPl8HrZ6N/0KwGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WLgD+O3/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WLgD+O3/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9D9641A1A89;
	Thu, 10 Sep 2026 07:41:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FE21602B8;
	Thu, 10 Sep 2026 07:41:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06D4C11C78279;
	Thu, 10 Sep 2026 09:41:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789026092; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kMPeRTm+aw2EyETunRUKyMK/qtl1oCjDcIMJwGBX7QA=;
	b=WLgD+O3/ZyiuGyaqtS3Or/k/RfHEj3r+T6xSVxf3VeOm6WGIu74WIOVf9lnf85EBbLi3+J
	njr/CbKF2Lg2ZQK+jI3XhbP5MpNMcwF0TGAtkub7brsKL8Br67LJtT6vfGG2P2bawMmtnT
	bJ4hBf7gjPkJWTsEBUea+Dr6x5298mZO91poC/u0Il6Lb1eYUm7vzu7EqRriYDvoZ4k9rV
	xIIilJLaW5D99yOP7ES4TN15KFi7WiynKL5JGXZFn/7tjEm35EF+LHxiXV55/dCkuKzBn0
	XOhrXjGKPiTmhTKLg9NRnoVAL7tynDsx6dP6sLR2PjgTkcz5kI+ChkFjkpsPZQ==
Date: Thu, 10 Sep 2026 09:41:26 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <20260910094126.4bf4cae6@bootlin.com>
In-Reply-To: <aqI3KnnQnUytqkEc@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-7-herve.codina@bootlin.com>
	<aqI3KnnQnUytqkEc@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Thu, 10 Sep 2026 14:51:08 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:37AM +0200, Herve Codina wrote:
> > The goal of structured tag values is to ease the introduction of new
> > tags in future releases with the capability for an already existing
> > release to ignore those structured tags. In order to do that data length
> > related to the unknown tag needs to be identified.
> > 
> > Also add a flag to tell an old release if this tag can be simply skipped
> > or must lead to an error.  
> 
> I suggested/insisted on this in the past, but I've since realised this
> isn't actually useful.  The "structured tag" format is only useful
> because it allows you to skip over unknown tags, which means there's
> no point using it for ags that can't be skipped.  If we need new tags
> that can't be safely skipped, they can be added as old-style tags
> instead.
>
> In which case "old style" versus "new style" is no longer a good
> characterization: they would exist side by side, so the distinction is
> more "skippable" versus "non skippable" tags.  Which suggests that
> "skippable tags" or "metadata tags" might be a better term than
> "structured tags" - that would focus more on the why than the how.

Do you mean that the SKIP_SAFE bit should be removed ?

I like the defined structure with the DATA_LEN_ENCODING part. Even for tags
which are not "skippable".

This ensures a kind of standardized format for all future tags instead of a 
specific definition (related to the length of the data) for each new tag.

For this kind of information related to the length of data, I prefer a global
rule instead of tag-specific rules.

> 
> 
> > Structured tag value is defined on 32bit and is defined as follow:
> > 
> >   Bits  | 31 | 30        | 29             28 | 27    0|
> >   ------+----+-----------+-------------------+--------+
> >   Fields| 1  | SKIP_SAFE | DATA_LEN_ENCODING | TAG_ID |
> >   ------+----+-----------+-------------------+--------+
> > 
> > Bit 31 is always set to 1 to identify a structured tag value.
> > 
> > Bit 30 (SKIP_SAFE) is set to 1 if the tag can be safely ignored when its
> > TAG_ID value is not a known value (unknown tag). If the SKIP_SAFE bit is
> > set to 0 this tag must not be ignored and an error should be reported
> > when its TAG_ID value is not a known value (unknown tag).
> > 
> > Bits 29..28 (DATA_LEN_ENCODING) indicates the length of the data related
> > to the tag. Following values are possible:
> >   - 0b00: No data.
> >           The tag is followed by the next tag value.  
> 
> I think "next tag." would be clearer than "next tag value." - "next
> tag value" could be confused as meaning the data that comes after the
> tag.

Ok, will be updated.

> 
> >   - 0b01: 1 cell data
> >           The tag is followed by a 1 cell (u32) data. The next tag is
> >           available after this cell.  
> 
> Remove "available", it doesn't add any information.

Ok, will be updated.

> 
> >   - 0b10: 2 cells data
> >           The tag is followed by a 2 cells (2 * u32) data. The next tag
> >           is available after those two cells.  
> 
> Ditto.

Will be update as well.

> 
> >   - 0b11: Data length encoding
> >           The tag is followed by a cell (u32) indicating the size of the
> >           data. This size is given in bytes. Data are available right
> >           after this cell.
> > 
> >           The next tag is available after the data. Padding is present
> >           after the data in order to have the next tag aligned on 32bits.
> >           This padding is not included in the size of the data.  
> 
> I'm guessing the 1 & 2 cell cases are pretty common so it saves a
> moderate amount of dtb size to have this encoding.  However, it does
> come at the cost of greater code complexity.  Is it worth it?  I'm
> willing to believe it is, but I think the case needs to be made.

In term of code complexity, FDT_PROPDATA_PHANDLE introduced in the addons
series, patch 7/74 [0], is a 1-cell (or 1-fdt32) "structured" tag.

It can be compared with FDT_PROPDATA_PHANDLE_REF, introduced in patch 11/74 [1].
FDT_PROPDATA_PHANDLE_REF is a "Data length encoding" tag.

Modifications in libfdt/fdt.c are pretty similar for both tags.


[0] https://lore.kernel.org/all/20260826094950.1088288-8-herve.codina@bootlin.com/
[1] https://lore.kernel.org/all/20260826094950.1088288-12-herve.codina@bootlin.com/

> 
> I'd also avoid the term "cell" here.  To me a "cell" is specifically a
> term applying to a 32-bit value _within a device tree property_.
> These are 32-bits, but not part of a property.  Plus if Segher
> reappears, he'll complain that in the old days of OF, a cell wasn't
> necessarily 32-bits :).

ok, I will avoid the term "cell" in the next iteration.

> 
> > Bits 27..0 (TAG_ID) is the tag identifier defining a specific tag.
> > 
> > Introduce the structured tag values definition and some specific tags
> > reserved for tests based on this structure definition.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  libfdt/fdt.h | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> > index a07abfcc..f41a355f 100644
> > --- a/libfdt/fdt.h
> > +++ b/libfdt/fdt.h
> > @@ -49,6 +49,7 @@ struct fdt_property {
> >  
> >  #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
> >  #define FDT_TAGSIZE	sizeof(fdt32_t)
> > +#define FDT_CELLSIZE	sizeof(fdt32_t)  
> 
> I'd avoid creating this constant for similar reasons to avoid the term
> "cell" above.

Ok, I will avoid the constant and use sizeof(fdt32_t) directly when needed
in the code.

Also, I will avoid the CELL in all other part of this file.

Best regards,
Hervé
