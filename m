Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320BE3DDAE6;
	Thu, 10 Sep 2026 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028850; cv=none; b=Ku9s5SPbqQykirraeLi8+0GRcZ+wIzk+EUfEaLXggPxVbHkm4g+jrJlw5jDy4HkQ/tAFfLfkdnCRISgPkdtRr2/3sR5CmEY5BsPgteRYO/W74bwr5WQfpZbGsdTmaTfeI//keVqRBx8+5YcTmW/U4ks44E8FOOj9/d6YWwrZWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028850; c=relaxed/simple;
	bh=xhn7CmoSGVXKLnLj7PjMERwPz/RLeNICsoMfS7OIgR4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQOmCHJtROoV3rFzlAhvu8ijTNd6si13UEwq063bD2/8QKRetnCXRSu8DuKsSW77tMMmt7DF6L1vvBsnAebuZXYmMP1O4bE3OM+V6XRn1NQVC9GWzPSvTiXBQtZy8SCWFtQq4MA8DAlGejBgqVCjs+MS4DEDxgv6n0edwrGjWuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k0OdZqiA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k0OdZqiA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BD3FA4E415C0;
	Thu, 10 Sep 2026 08:27:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 876EC602B8;
	Thu, 10 Sep 2026 08:27:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C139511C78279;
	Thu, 10 Sep 2026 10:27:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789028839; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jACcRN4L5LH06EzCesgqYF/TiJYddTf1eF5yoFPnPlI=;
	b=k0OdZqiAaYIthtG4DuZ14cn1P00/LYtHygSkSAjaNESDRpiXpGV2TMMzxs1tcEFWPLWJNc
	+6odVSc9pf9iilLa1PdbShyuwuVC+paFnJpHqr+cC84W7RGOs7BhbpZuOW6GTbieoJd7CA
	tmA9Q7vxpFxDWOTzfiq8qYt82BAMPmM4ZNonoY0VpNO2UDSpBmXqlHKOqwVUXLvzB3BSGu
	WKFaKW8Z/LrWuSH0poMRynVO4S80hffHSWiAN61+Cn+wfTWgkY8VC14LJ1NiwDebPRMftY
	s/RhNdq3DAYQCxU+HSE0WR1LuhMypbZ+zl8KwylRns5sSHhumTuMgOTFSmGeKg==
Date: Thu, 10 Sep 2026 10:27:11 +0200
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
Subject: Re: [PATCH v3 07/15] fdtdump: Handle unknown tags
Message-ID: <20260910102711.07499464@bootlin.com>
In-Reply-To: <aqI_KDZS9Kb6fwIG@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-8-herve.codina@bootlin.com>
	<aqI_KDZS9Kb6fwIG@gractus.seuss>
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

On Thu, 10 Sep 2026 15:25:06 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:38AM +0200, Herve Codina wrote:
> > The structured tag value definition introduced recently gives the
> > ability to ignore unknown tags without any error when they are read.
> > 
> > Add support for those structured tags in fdtdump and introduce a command
> > line option to dump unknown tags that should be ignored.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  fdtdump.c                              |  45 ++++++-
> >  tests/Makefile.tests                   |   3 +-
> >  tests/meson.build                      |   2 +
> >  tests/run_tests.sh                     |  41 +++++++
> >  tests/treegen.c                        | 162 +++++++++++++++++++++++++
> >  tests/unknown_tags_can_skip.dtb.expect |  29 +++++
> >  6 files changed, 278 insertions(+), 4 deletions(-)
> >  create mode 100644 tests/unknown_tags_can_skip.dtb.expect
> > 
> > diff --git a/fdtdump.c b/fdtdump.c
> > index 0e7a2659..7a8b2784 100644
> > --- a/fdtdump.c
> > +++ b/fdtdump.c
> > @@ -44,7 +44,7 @@ static const char *tagname(uint32_t tag)
> >  #define dumpf(fmt, args...) \
> >  	do { if (debug) printf("// " fmt, ## args); } while (0)
> >  
> > -static void dump_blob(void *blob, bool debug)
> > +static void dump_blob(void *blob, bool debug, int dump_unknown)
> >  {
> >  	uintptr_t blob_off = (uintptr_t)blob;
> >  	struct fdt_header *bph = blob;
> > @@ -146,20 +146,55 @@ static void dump_blob(void *blob, bool debug)
> >  			continue;
> >  		}
> >  
> > +		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
> > +			sz = 0;
> > +			switch (tag & FDT_TAG_DATA_MASK) {
> > +			case FDT_TAG_DATA_NONE:
> > +				break;
> > +			case FDT_TAG_DATA_1CELL:
> > +				sz = FDT_CELLSIZE;
> > +				break;
> > +			case FDT_TAG_DATA_2CELLS:
> > +				sz = 2 * FDT_CELLSIZE;
> > +				break;
> > +			case FDT_TAG_DATA_VARLEN:
> > +				/* Get the length */
> > +				sz = fdt32_to_cpu(GET_CELL(p));
> > +				break;
> > +			}
> > +
> > +			if (dump_unknown) {  
> 
> I'd do this unconditionally: fdtdump is specifically for low-level and
> debug dumping of a tree.  If you want pretty printing, dtc -Odts is
> the thing to use.

Ok, will do it unconditionally.

> 
> > +				printf("%*s// Unknown tag ignored: 0x%08"PRIx32", data len %d",
> > +				       depth * shift, "", tag, sz);  
> 
> "Unknown" seems redundant.  "ignored" is not really true - you're
> dumping its contents, which is all that fdtdump could be asked to do
> with it.  So I'd just say:
> 
> 	// Tag 0x<tag>: <data>
> 
> Or maybe "Metadata tag" / "skippable tag" if we go with one of those
> terms as I suggested on an earlier patch.

I am fine with 
  // Tag 0x<tag>: <data>

I will use that.

Best regards,
Hervé

