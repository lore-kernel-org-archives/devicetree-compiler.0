Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358098;
	b=tG0LUBfwvZW3Cb4uw1fGqKX3hHYdVBlTFOzDY3FpK4zaHCVEUtlRHFg11sgxVp1DdyzE
	 mTYbqXZYHL51XqcQRyRdut43pB8ilzUvnMIbkqW172rTubYHYc7tHMuge9tN6g3L7sdkP
	 VK1LXDras0xnTc2E5Tc3B1Jk2Blm8CPvLo/8CEd5MC0wQ9Qh0qr4+mE5UGbFBH16Fi1dF
	 Vtxj1InmtZkmaY7l9J0sa26M4PZWQ1DGpZz4SbS4R2rvyLdeFGh4tY8SJMI+zxMn3rEHs
	 JDpOj+wpWQYWR3Fzk6q/FdRZ93o/71ruh5U5QbDoW/dmpqXiYuBdFIUaTG7CwTRnV4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358098;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=H4ZfNsk9j3Dbhdk5NoBi1lzbeDkmeOoyVamC2lamXMg=;
	b=ybNirD28iFQdgsmuDYEHwbXxTcQGyPmj/R2bnt/cMw8cOOaED/lkfLDelYlHfr02Nrnj
	 lS6IZuI0CdMbm0vNNwc/o1fpXKSyWtFbfg1D0HzIoE1PgfEtE0ZSgO+nKU7XHZrUJzrHf
	 1EA2jiYEeSpruuOQ500fshQs+SulPFlRlLnNU50iRctGLsLu5aOLXirHemE7LkuFcHGaj
	 QrhY31nYBxEasrqlIYDvBwdRo39ePjXVAIC6XGkVrdViKFuNy8f91qn9ic79+4euqACN8
	 oXjnDdcqu00uFA+Fs2M7Ic1IrVe0aVhN63n1jIVRxDdmUrk2bYK7p7QhNazvaTHXlDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="wKFY/uXl";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18276606A330;
	Fri, 30 Oct 2026 11:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18276606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wKFY/uXl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CDC381A13C1;
	Fri, 30 Oct 2026 11:01:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99FCA603C2;
	Fri, 30 Oct 2026 11:01:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A0B8103290F8;
	Fri, 30 Oct 2026 12:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793358087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H4ZfNsk9j3Dbhdk5NoBi1lzbeDkmeOoyVamC2lamXMg=;
	b=wKFY/uXlDXfSKwWPZKUDJM/gMgOh9qFwfBfU78zDe+xq4T7cAP3/3yd62SLCH3I27HlYli
	71OgEo/tbr9t2yx2NqWJRqL/ZSMEieQxSgd60xdxbt0roDMMGm9DEDKLKX5+MrdyaqpNAm
	GodRbxqD8ece33A9qOgi4YBGchyXl+7Zowy4E7zQlp/78kKt/6i8JxEI3rgKYKbuTz8WS5
	j2BVe5/SIiKKiDel5WFqo/9KXZKC26zxgT4mXuzHDZj851+IG245uQVcoKH9PG8dFlc2R5
	RFqyP3/goQwyVnqRvdvv+coKnpY41qKWPF4U8CFzBTnIHdQpeXM88/SUREet4w==
Date: Fri, 30 Oct 2026 12:01:17 +0100
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 10/74] tests: Add basic metadata tests
Message-ID: <20261030120117.24afadf7@bootlin.com>
In-Reply-To: <auQqI8WEOVeDRZM_@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-11-herve.codina@bootlin.com>
	<auQqI8WEOVeDRZM_@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 30 Oct 2026 16:24:52 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 11:48:39AM +0200, Herve Codina wrote:
> > This first test is related to local phandle references used in
> > properties (FDT_PROPDATA_PHANDLE dtb tag).
> > 
> > The test pattern used is
> >   - Generate a dts (xxx.dts.dts) from an input dts
> >   - Check this generated dts against expected contents
> >   - Generate a dtb (xxx.dtb) from the same input dts
> >   - Check this generated dtb against expected contents
> >   - Generate a dts (xxx.dtb.dts) from the generated dtb
> >   - Check this generated dts against expected contents
> >   - Generate a dtb (xxx.dtb.dts.dtb) from the generated dts
> >   - Check this generated dtb, expect the same contents as for xxx.dtb
> > 
> > Even if only one meta-data feature is currently tested in this tests
> > introduction, use a loop in order to ease future addition consisting in
> > adding new input dts as soon as new meta-data feature are supported.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> As noted elsewhere, I'd prefer to see new helper tools for comparing
> metadata in binary rather than using text comparisons.

Right, be ready to see treegen.c growing a lot.

Indeed, to compare in binary, I need to generate the expected binary (I don't
want to store it directly in git).

I already plan to split the treegen.c file in several files. Indeed, with
unknown "structured" tags, a bunch of expected dtbs (instead to text files)
are going to be generated.

The plan is then to have one .c files per expected dtbs set and so the
concept of dtbs harnesses.

The problem I see here with known meta-data, is that we:
  1) Need to keep consistency between the dts file (input source use in test)
     and the treegen source file (which generate the expected dtb).

  2) If new meta-data tags are added in the future, treegen source files
     will need an update. This update will be more complex than looking at
     expected text files (fdtdump or other), and commiting the new expected
     files if the diff is explained.

I've proposed 'fdtanalyze' as a new tool [1] to convert a dtb to a "friendly"
text file. The output of 'fdtanalyze' could be something like that:
--- 8< ---
  (0x1-FDT_BEGIN_NODE): "my_node"
    (0x3-FDT_PROP): ...
    (0x3-FDT_PROP): ...
  (0x2-FDT_END_NODE)
  ...
  (0x9-FDT_END)
--- 8< ---

No complex analysis but you don't seem to like it neither.

Without fdtanalyze, fdtdump nor other ideas, I will use treegen and
dtbs_equal_ordered to perform tests.

[1] https://lore.kernel.org/all/20260925144003.61f72c0e@bootlin.com/

Best regards,
Hervé
