Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD43A1D05;
	Tue,  7 Apr 2026 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570637; cv=none; b=msebqBew5VsArJHX4DFAWoTrKCuSaKTaG2ORccRp2EE7LXfC10gHPDvlDzKNPkYp9zsuqcvMHmhoO6ZKSsArkLG38lb/Yl9PfLP+5iDmFvAq5EhPbAejEo7x0ghKV9V56bXKq8In53owA/lf4tteO7kVFn6IxJqlbj+YPCRtFBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570637; c=relaxed/simple;
	bh=uufKVRvMlEpZHXsntz4dPc6SBr1Y2DyuZLdesNAbBBs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y9Hpy8oS/ut6CFhM4OFli1EYXIKZKVc95AUtrNiZvm55urDm8+E+zS9d1Gz6CIXSg9XJ8TXSzxW8yjUyX5fgmKJvpPS0H20uZVEPykWhRi/WiNyZEauSlPXLuBrihwDz1uB1r+FH5TAYl3ioxnAfDjRisIP9LlKte6kzFhEhezA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yBMLw+Ed; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yBMLw+Ed"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1B3B51A31BC;
	Tue,  7 Apr 2026 14:03:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC5CB603C7;
	Tue,  7 Apr 2026 14:03:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 237821045020E;
	Tue,  7 Apr 2026 16:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775570632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KpCo1LAi7Aovv63DF+tZ3x7wmQpT7DwaJ9r0rQe7mW0=;
	b=yBMLw+EdqrKTvAH75k1ZKF4CHS73DcSQbrekU+LTbNs4xm/FSbUfaaA+POq09RO65Wfd0l
	fBO4jcZmEG5Wcw84CnJNHxcUBK6fjQqItdtj8CzWV1bza1f4E0L2xPa+MXx5b/2iUOCmu3
	e4AC91nZr9mJc1m8S9vaPA9UZqRm272YJoal0ZNGdhesIQmqLqEWe9JZcc54Rw3ebzirwL
	3Qa37+OdfTE05uG4ebpaeu6XXvPc8qr8phEW21LZA2IV5Q9M4SWb1TME4LBwLv9X9oqmJn
	zTMwN+O1btqeiG7wbPkDoWOoI3B2EO3l5Ku8dvXAUX9NhBGf5H3dQoKKSYQo/w==
Date: Tue, 7 Apr 2026 16:03:45 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "David Gibson" <david@gibson.dropbear.id.au>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Ayush Singh" <ayush@beagleboard.org>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>,
 <devicetree-compiler@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree-spec@vger.kernel.org>, "Hui Pu"
 <hui.pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 10/15] fdtdump: Handle unknown tags
Message-ID: <20260407160345.5adad916@bootlin.com>
In-Reply-To: <DHHX0MU38SMV.1NAWHIZ7STHW4@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
	<20260210173349.636766-11-herve.codina@bootlin.com>
	<DHHX0MU38SMV.1NAWHIZ7STHW4@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Luca,

On Wed, 01 Apr 2026 17:15:09 +0200
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> > The structured tag value definition introduced recently gives the
> > ability to ignore unknown tags without any error when they are read.
> >
> > Handle those structured tag.  
> 
> How? This sentence is vague, what about:
> 
>   Allow dumping the unknown tags or not based on a command line flag.

Hum indeed but I don't fully agree with your proposal.

The patch adds support for structured tag in fdtdump and introduce the '-u'
option to dump unknown tags which can be safely ignored.

What do you think about:

    The structured tag value definition introduced recently gives the
    ability to ignore unknown tags without any error when they are read.

    Add support for those structured tags in fdtdump and introduce a
    command line option to dump unknown tags that should be ignored.

> 
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
> > +			case FDT_TAG_DATA_LNG:
> > +				/* Get the length */
> > +				sz = fdt32_to_cpu(GET_CELL(p));
> > +				break;
> > +			}
> > +
> > +			if (dump_unknown) {
> > +				printf("%*s// Unknown tag ignored: 0x%08"PRIx32", data lng %d",  
> 
> As before, I'd use "len" instead of "lng".

I will change in the next iteration.

> 
> > +				       depth * shift, "", tag, sz);
> > +				if (dump_unknown > 1 && sz != 0) {
> > +					printf(" ");
> > +					for (i = 0; i < sz; i++)
> > +						printf("%02hhx", *(p + i));
> > +				}
> > +				printf("\n");
> > +			}
> > +
> > +			/* Skip the data bytes */
> > +			p = PALIGN(p + sz, 4);
> > +			continue;
> > +		}
> > +
> >  		die("** Unknown tag 0x%08"PRIx32"\n", tag);
> >  	}
> >  }
> >
> >  /* Usage related data. */
> >  static const char usage_synopsis[] = "fdtdump [options] <file>";
> > -static const char usage_short_opts[] = "ds" USAGE_COMMON_SHORT_OPTS;
> > +static const char usage_short_opts[] = "dus" USAGE_COMMON_SHORT_OPTS;
> >  static struct option const usage_long_opts[] = {
> >  	{"debug",            no_argument, NULL, 'd'},
> > +	{"unknown",          no_argument, NULL, 'u'},
> >  	{"scan",             no_argument, NULL, 's'},
> >  	USAGE_COMMON_LONG_OPTS
> >  };
> >  static const char * const usage_opts_help[] = {
> >  	"Dump debug information while decoding the file",
> > +	"Dump unknown tags information while decoding the file (-uu to have data)",  
>                                                                        ^
> 								       dump

Will be fixed in the next iteration.

> 
> > --- a/tests/trees.S
> > +++ b/tests/trees.S
> > @@ -328,3 +328,113 @@ named_root_strings:
> >  named_root_strings_end:
> >
> >  named_root_end:
> > +
> > +
> > +	/* Tree with "unknown" tags that can be skipped
> > +	 * Use a really future dtb version to check version downgrade on
> > +	 * modification.
> > +	 */
> > +	treehdr_vers	unknown_tags_can_skip 0xffffffff 0x10
> > +	empty_rsvmap	unknown_tags_can_skip
> > +
> > +unknown_tags_can_skip_struct:
> > +	fdtlong	FDT_TEST_1CELL_CAN_SKIP
> > +	fdtlong	0x1
> > +
> > +	beginn	""
> > +		fdtlong	FDT_TEST_NONE_CAN_SKIP
> > +
> > +		propu32	unknown_tags_can_skip, prop_int, 1
> > +
> > +		fdtlong	FDT_TEST_1CELL_CAN_SKIP
> > +		fdtlong	0x11
> > +
> > +		propstr	unknown_tags_can_skip, prop_str, "abcd"
> > +
> > +		fdtlong	FDT_TEST_2CELLS_CAN_SKIP
> > +		fdtlong	0x12
> > +		fdtlong	0x12  
> 
> Can you use different values here, just to make the test slightly more
> robust? Just in case parsing ends up on the wrong cell, as unlikely as it
> can be.

Yes indeed, good proposal. I will update patterns.

> 
> Same in various places below.
> 
> > +
> > +		fdtlong	FDT_TEST_LNG_CAN_SKIP
> > +		fdtlong	3
> > +		.byte 0x13
> > +		.byte 0x13
> > +		.byte 0x13
> > +		.byte 0 /* padding */
> > +
> > +		beginn	"subnode1"
> > +			propu64	unknown_tags_can_skip, prop_int, 1, 2
> > +			fdtlong	FDT_TEST_NONE_CAN_SKIP
> > +		endn
> > +
> > +		beginn	"subnode2"
> > +			fdtlong	FDT_TEST_1CELL_CAN_SKIP
> > +			fdtlong	0x121
> > +			propu64	unknown_tags_can_skip, prop_int1, 1, 2
> > +			fdtlong	FDT_TEST_1CELL_CAN_SKIP
> > +			fdtlong	0x122
> > +			propu64	unknown_tags_can_skip, prop_int2, 1, 2
> > +			beginn	"subsubnode"
> > +				fdtlong	FDT_TEST_1CELL_CAN_SKIP
> > +				fdtlong	0x123
> > +				propu64	unknown_tags_can_skip, prop_int, 1, 2  
> 
> As before, you are using values 1 and 2 for all the properties, I'd use
> different values, and possibly even with different amounts of cells in
> properties.

I will update too.

Best regards,
Hervé
