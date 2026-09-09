Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB503B993F;
	Wed,  9 Sep 2026 06:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937124; cv=none; b=ZR1qXvnLAzbeDdBemgJ0sjiDlpSX7RAHhJMjU22Y/Gd9SEGL18Mgw+uurGkWpNlUW6qv/6uFwfa+m/AaSWB53Ly9VGhnjl0tnlKk5G8/3AMBDtsPCWE0m+V7TR9Uso7L/dCe6yV9V1FysLUx7DQSn+gsd1elS286EGiewm4LhN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937124; c=relaxed/simple;
	bh=WqFQLn1fBdxcWPYKNeWQbLupTcIautaxDv/54vnL72o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOWzo+05zGe+K1193ATJ5MRSZD5oH7QnuOniYNcjrIfj+aFhwAWjNJKkGhDbr83BtK0pzo9FRIqGuBznQm65arxsCnOYiNDENjWY1CK/JN6ASs6f9iyCA1nP5kN8MVMe13eJsP/CY24uDClZeXFK4XldERGuYsQWKcyZLtdiiB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M2GvyRD1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M2GvyRD1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01A831A1A6D;
	Wed,  9 Sep 2026 06:58:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C20F860448;
	Wed,  9 Sep 2026 06:58:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A479811C7AF25;
	Wed,  9 Sep 2026 08:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788937117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=71Kygo8jHNvkAe6mZQB3IStEodnXo2McMHYgNMuc4Y4=;
	b=M2GvyRD18G1XAuTrgIasAuMI4PftT6Wk0ZB0xpLx/1Rkuvtafe/onTePsN0CRfXvA3nEeL
	MXt6UafWDiQUBL2H/FebqolSLmKYbZZXOnpTmi9XayZ3vXfo5n/yfblZj0EVXDv8pu/yqb
	cRRdcI4abSPoLDwvTAAs7vqRip8y5vl4Vf5nIua+9Q1s+cq0IatTHmShN6bXM+sjaeMBSp
	QG5pdc5HKj7wcFj2auBMmM78WcRfGd/8ouJlv/FIuVxvuZi7REdIoRAXD8CA9f+e0tdW88
	2GpRC3SSjI4gdgj0HLxfJU99R1hITaxN2DIkqGKA27eq1Pg+XSwB3wVqocUS9g==
Date: Wed, 9 Sep 2026 08:58:26 +0200
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
Subject: Re: [PATCH v3 02/15] libfdt: Don't assume the root node is
 available at offset 0
Message-ID: <20260909085826.1f80a45b@bootlin.com>
In-Reply-To: <aqD6LcbwtrZkk28m@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-3-herve.codina@bootlin.com>
	<apOhk-NQusFgV5Sx@gractus.seuss>
	<20260831140119.1f14b420@bootlin.com>
	<apaBuQ8kn2bOzYcI@gractus.seuss>
	<20260901141826.49b1a1b7@bootlin.com>
	<apfKx_u3v3GBfzOz@gractus.seuss>
	<20260907184641.537cfa49@bootlin.com>
	<ap-t8qMg5VMwh-T9@gractus.seuss>
	<20260908100823.1f474894@bootlin.com>
	<aqD6LcbwtrZkk28m@gractus.seuss>
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

On Wed, 9 Sep 2026 16:18:22 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> > 
> > Having a fdt_root_offset() stop at either FDT_BEGIN_NODE_REF or FDT_BEGIN_NODE
> > is "fdt_first_node_offset()".  
> 
> > Let me introduce the internal fdt_first_node_offset_()
> > - fdt_root_offset()
> >   It calls fdt_first_node_offset_() and check that this node is a
> >   FDT_BEGIN_NODE node.
> > 
> > - fdt_check_node_offset_()
> >   if the offset == 0, it updates the value with the offset returned by
> >   fdt_first_node_offset_()  
> 
> Right, that's exactly what I'd suggest.
> 
> A possible tweak would be to have fdt_check_node_offset_() only apply
> special case 0 handling if the _actual_ offset 0 doesn't look like a
> valid node offset.  Not sure if that will make things messier or
> cleaner.
> 
> > And so, a node offset 0 doesn't means the root node but the first node
> > in the dtb (root or orphan). I am totally fine with this definition.  
> 
> Right.  If you don't want that behaviour for addon dtbs, then I think
> the way to go would be to explicitly avoid all special case handling
> of 0 if the header flags an addon.  Handling addons requires new code,
> so we don't have to maintain backwards compatibliity for things that
> used 0 assuming it meant root node.
> 
> > At some point, maybe users of the API (when addon are involved) will have to
> > take care of that and perform something like:
> >   root = fdt_root_offset();
> >   fdt_get_property(fdt, root, "prop", NULL);
> > 
> > Or
> >   fdt_for_each_orphan(orphan, fdt) {
> >      fdt_get_property(fdt, orphan, "prop", NULL);
> >      ...
> >   }
> > 
> > Here also, I am totally fine with that an I already use this kind of sequence
> > in libfdt/fdt_addon.c to apply an addon on a base dtb.
> > 
> > I will introduce fdt_first_node_offset_() but let me know if you prefer
> > having fdt_first_node_offset_() introduced right now in this "structure
> > tags" series or later in the addon series.  
> 
> Either is fine; do whichever results in less code churn.
> 

Ok, I will do that.

Do you want to have an early version of that or having it in the next iteration
of the series is fine on you side ?

Of course, before sending a new iteration of the series, I am waiting for your feedback on
the "structured tags" part. This part is not going to be impacted by the "offset 0 vs real
root offset" we have discussed here and so what is available in this current series is still
valid.

Best regards,
Hervé



