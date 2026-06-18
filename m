Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2DA2EDD40;
	Thu, 18 Jun 2026 19:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781810293; cv=none; b=m/QsbnNxDdKiJnA5j3d6HvxM4fkrZcPickx5mgLduZlemiEqW9nwaUgjoUysHMQ2MiZhhmo5mFzD3ItoFOpKliS/8MvxW1YS+yyyZUuHBqLFrmEfp31PXyHPRVrp8lVQJc0BOQNSR/F7K7fOfYDgGmtarrwEaFFaIo6BpG9Ttzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781810293; c=relaxed/simple;
	bh=MNIb+YEmDBtIWCpYeTzDslh1jQiRsYCuZ7kVA7Iyg+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U6YeeCUWA/lTZYedBevwcodDySrUSm7HRGXoep7/qYwiS58peX42YmsWCURAmgB/ZpEEdHZyX1zH9fq+nZfGsFp3nQd+WEdbwBugvKHAHVLZaYNDvk/mXe74IZX3imEG09I3fks43q5ie3b+gvkS33KT5WvkD0SUk7/hdgWmH9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rSHTdPGh; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rSHTdPGh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 66FFC4E42FB1;
	Thu, 18 Jun 2026 19:18:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F079601AC;
	Thu, 18 Jun 2026 19:18:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4472D106C820F;
	Thu, 18 Jun 2026 21:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781810285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xm1w6jVGSmCFteRRtw99tFkP43DJCVQ6f37Byyi1jeg=;
	b=rSHTdPGhHM0cHntyxYYShg54gsHgBjyZ+y3LKPOh6ZJ3skSH5aTiVPN+tb5+DEplCmqDi/
	8pvApkfioWW2VitVfmA4Ak+w4s2RtFfM29nHmCW84K+kZySAS0x3W+y/i1xRt5BwMpp1Th
	O8omkYqaQcr2sKJbWlArpxy7Ip+g5AGp+Vhb1eXodLOO71LZg0EcwIFzQ7wbwi3YPo7frp
	hxKUHtt6WoMushRwbYu4LRNp/Yo8ktN34G2ENd8VHE7z70+7L62npX/KRlcoGf9KK4B3G1
	P/xJX6/ggsbS3yjwewVHWtIqklwQ2DqNPJuOLiKcH7zzG/eY20xj89VmvjzAXg==
Date: Thu, 18 Jun 2026 21:17:59 +0200
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
Subject: Re: [PATCH v2 02/10] libfdt: Don't assume that a FDT_BEGIN_NODE tag
 is available at offset 0
Message-ID: <20260618211759.4db53611@bootlin.com>
In-Reply-To: <ajPE5eGcOwWMAeiN@zatzit>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-3-herve.codina@bootlin.com>
 <ajPE5eGcOwWMAeiN@zatzit>
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

On Thu, 18 Jun 2026 20:13:57 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Thu, Apr 09, 2026 at 01:54:18PM +0200, Herve Codina wrote:
> > In several places, libfdt assumes that a FDT_BEGIN_NODE tag is present
> > at the offset 0 of the structure block.
> > 
> > This assumption is not correct. Indeed, a FDT_NOP can be present at the
> > offset 0 and this is a legit case.
> > 
> > fdt_first_node() has been introduced recently to get the offset of the
> > first node (first FDT_BEGIN_NODE) in a fdt blob.
> > 
> > Use this function to get the first node offset instead of looking for
> > this node at offset 0.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> The problem is real, of course.  But this approach to solving it with
> a special case just for the root node is really ugly.
> 
> Granted, it's a problem of my own making - I chose not to create an
> fdt_root_offset() function in the first place, instead making it part
> of the API that offset 0 means the root node.  Nonetheless, here we
> are and the question is whether we can do better.
> 
> # Straightforward things first
> 
>  - This patch should be folded with 1/10, they're both harder to
>    understand without the context of the other.

Ok, I will squash, no problem.

> 
>  - If it must exist, the function should be fdt_root_offset(), not
>    fdt_first_node(), for at least three reasons:
>     * "first" in what sense?
>     * "first" amongst what set of nodes?
>     * We have a strong convention to always explicitly say "offset",
>       not just referring to offset values as "node" or "property".
>       This is deliberate: it's an attempt to discourage the otherwise
>       likely misunderstanding that a function getting a "node" gives
>       you some sort of persistent handle.  "offset" makes it clearer
>       that the value will no longer be valid after a modification to
>       the tree.

Make sense. I will rename to fdt_root_offset()

> 
>  - The situation described is subtle enough that this *really* needs a
>    testcase.  It shouldn't be that hard: change the existing
>    'nopulate' test tool to add an FDT_NOP before the first tag, not
>    just after

Yes, will add a test.


> 
> # Is FDT_NOP before the root node actually legitimate?
> 
> Arguably the simplest solution here would be to explicitly ban this.
> Yes, it would be a slightly odd restriction in the spec.  However,
> avoiding the mess in the library might be worth it.  Note that this
> situation can never arise from fdt_nop_node(), unless you apply it to
> the root node, in which case there's no tree left.

We tried to have something robust for future addition (structured tags).
Maybe a future tag will be nopified by some future tools before being
processed by libfdt.

IMHO, we should have support for FDT_NOP before the root node.

> 
> # Less special casery
> 
> Even if we accept the need for FDT_NOP before the root node, I think
> we can do better.  The below implements this as a special case, just
> for offset 0.  Instead, we could allow all node operations on a
> FDT_NOP offset, automatically advancing to the next FDT_BEGIN_NODE
> tag.  We may be able to do that in check_node_offset_() minimising
> code duplication.
> 

IHMO, check_node_offset_() should only check that the given offset is a
node and not trying to find the next node available after possible FDT_NOP.
Got the feeling that having this kind of search in check_node_offset_() is
error prone.

I am not sure that a lot of code duplication will be present. On some entry
points, we have this kind of code:
   --- 8< ---
   if (offset == 0) {
	offset = fdt_root_offset(fdt);
	if (offset < 0)
		return offset;
   }
   --- 8< ---

It has the benefit to keep things clear and is needed only on some entry
points (API function). Internal function should receive an offset pointing
to a node. For those internal function check_node_offset_() should not
automatically skip FDT_NOP tags but should really return an error if such a
tag is encountered.

For offsets other than offset 0, FDT_NOP is handled without any extra cost in
current code implementation.

Best regards,
Hervé
