Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5289231B832
	for <devicetree-compiler@vger.kernel.org>; Fri, 16 Jan 2026 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554586; cv=none; b=eY6WsZHfAtme25WisI75dPYHCsghro45mdbPV7Li61ZHfBuBiPtvrrK3X3meEPI2BkX01Y8zmIFXK4i4BLnZvcH6XNeg3U9obGPbqUt3wU3eizrPOC9xT6YobZfheZ/xt4K8z+OP1hkeoIOUwAsIJDKgIFw3KrKWexMh6M8be40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554586; c=relaxed/simple;
	bh=hb2FumJHWlW5h/rzVQfxBB4ttWmFQQfBRluhQ9YGtok=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g+wuxpdE/W3tdg90UKjaE1EdFN6SLovxRD6XfDEcwpIy5N2Kg2eVDolNoQ/UCw+nt3EfQVScaRJ27BoIdlN13QMp6qM4MtQc4/tUpjKPXPQke5t8u8aNoEhJwNamwaLNcRngtzikypwD7BaNrrXv0p3r9cwTt3wP74V7gmY7idE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XFqyYgaM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XFqyYgaM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E7A24E42117;
	Fri, 16 Jan 2026 09:09:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73E6260732;
	Fri, 16 Jan 2026 09:09:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 976CC10B68982;
	Fri, 16 Jan 2026 10:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768554580; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pWMTrCM1SrmudP6LkvHk5+yZ5LbMQD+bMHJM6Q97b0A=;
	b=XFqyYgaMopa+2wU/1MC014Pmb1OHxSuNChtpb44BbgiI/deW79TZkcXspzANskOgNmFHxS
	peA2PeAp/ULgSq2bvez0UJ0QxtaDnWGVOwIsTi+yr2DyMWXd0axYgZ/ooNtRUs/rsFtxbs
	PN4+qR3PbCs7OVqnQ+lLmmsFmeJY1QovGpeps8iUsgDFjc7H9HamIl6NxQ+KNk+VRWJt2Y
	32Zk/iFHXnlDOFsXEDyZ9Ufm5NzjQNlZa0ZJ+ijudTeUFKit/25XnYZh3cSw86A5xbiyDp
	ystH1UJHarjFz4Lq83BbekMfpKM7lcqqA9VLOMGExLm5vxTeS2Jv13XS/SRzgw==
Date: Fri, 16 Jan 2026 10:09:34 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 02/77] Introduce v18 dtb version
Message-ID: <20260116100934.7d522b1a@bootlin.com>
In-Reply-To: <aWgxAVfUYMUy9mz1@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-3-herve.codina@bootlin.com>
	<aWgxAVfUYMUy9mz1@zatzit>
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

Hi David,

On Thu, 15 Jan 2026 11:12:49 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:18:52PM +0100, Herve Codina wrote:
> > This v18 version will add support for
> >  - metadata in device-tree blobs in order to have a better handling of
> >    phandles and unresolved references.
> >  - Addon device-tree blob (successor of device-tree overlay)
> >  - Import and export symbols feature
> >  - multiple trees in a addon device-tree blob (i.e. root device tree and
> >    orphan node tree)  
> 
> So, once this patch is applied, the rest of the series pretty much has
> to be applied "atomically" - otherwise a version built in the interim
> will be lying in saying that it supports v18.
> 
> I therefore suggest moving any changes that *can* be moved before this
> patch, should be moved before this patch.  That will assist in
> reviewing and merging the series piecemeal, rather than as a single
> giant blob.
> 
> 
> Regarding the content itself.  It seems like this is a pretty major
> change to the dtb format - maybe that would suggest bumping the
> version by more than one (e.g. like we went from v3 to v16 in the
> past).

I see your point.

Maybe the Rob's idea related to 'unknown tag' and the suggestion I did [1]
related to the generic tag value definition to support those 'unknown tag'
could help here.

As a reminder here, this generic tag value definition consist in:
--- 8< ---
A tag value is on 32bits. We can define the structure of this value.
  - bit 31 (msb):
     - 0: This is not a new kind to tag and so it doesn't follow this definition.
          All existing tags are in this category
     - 1: New kind of tag adopting this definition

  - bits 30..28:
     tag data length encoding
     0b000: No data related to the tag
     0b001: 1 data cell (u32) directly follows the tag
     0b010: 2 data cells (2 u32) directly follow the tag
     ...
     0b110: 6 data cells (6 u32) directly follow the tag
     0b111: Tag is followed by a cell (u32) indicating the size (in bytes)
            of data available just after this cell (including any padding
            if needed).
	    Because this size include some possible padding, its value is a
            multiple of 4 bytes.
            The offset of the tag + 4 + size points to the next tag.
          

  - bit 27..0
     tag specific identifier
--- 8< ---

I mean dtb version v20 could be:

 - New header size with dt_flags added in the header (if this new field is
   kept).

 - Support for the generic tag values and so the notion of 'unknown tag'

With that done, everything else added afterward will have no impact on the
dtb format itself.

Only libfdt and dtc will have versions defined at some point with support for
some new flags or new keyword.

What do you think about this v20 dtb version?

> 
> It would also be nice to have some docs for the new dtb extensions
> before or at the same time as this.

Yes, the generic tag value definition.


[1] https://lore.kernel.org/all/20260114171822.2a44d2a5@bootlin.com/

Best regards
Hervé
