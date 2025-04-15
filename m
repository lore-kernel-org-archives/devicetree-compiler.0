Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194DE2DFA5B
	for <devicetree-compiler@vger.kernel.org>; Tue, 15 Apr 2025 04:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744689799; cv=none; b=VCqKOrGIl146u5RulyemTitAQv9GDR8plL++mKr5wNNX3l00oOUy6Mav9v+ig0cxLgeIM2G7axUthCXyUOGd5Kxuum2HrzOk9X7ilp0/qz/UdaCYBKRtV+9JVQSmqYPXLv+4GrnB1A243bFVj3YOYAesH5SgVV+S1D0gyhQ8S6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744689799; c=relaxed/simple;
	bh=qghY3Q63wlbiOp2xaoqPs+ASXzEZ6WE5IN9CPJW601g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejzd0eavXORZf8UR9PxSdeIZPeKeOFWKnZ5KmUSyoySBxo3ogO9nCRj4rFEXychf0u+5he6zJzN56k1t2WHkZLuemMa9SmbH139pJBTsNr4w5Rj8dcmbigA4wUatZGaR5CUsbHc6Fa0lu9i9k+EIpjNEvCFCBGsWuIYuc9HlhmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Ji2SQVyP; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Ji2SQVyP"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C443A25C28;
	Tue, 15 Apr 2025 06:03:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i47edZjCi7gj; Tue, 15 Apr 2025 06:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744689791; bh=qghY3Q63wlbiOp2xaoqPs+ASXzEZ6WE5IN9CPJW601g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ji2SQVyPX74uhW4nzx2gTUfEnQ14bhJ8iRCovvUvoFsfyebI38qdHfWeEbfq6ZZ3v
	 0ZjxtQAJTY7KZtPH+ssMndJuYPtSr7vdUqI3cAPHS6kphugIyx5iJQLSpjBWoP9tBO
	 Ba3GCaLnsRbYo8GL3YYLtEVMsAVKVQlFHZurAuxFL4VP3KlcX1yiu6l2TUFTYtNmec
	 2MpGIgStiKmCJcAp07h5v58DHbZckcYsOn5kEbGislDO//yg3OHgR7lTzvuALeE+o2
	 FLyS8VZi8nkIjEoXTk817if5s5YemP4C6214p4lzeCA8IbOweEAVTpwAMGssnhLGLb
	 8Zm2LtQNGLD2A==
Date: Tue, 15 Apr 2025 04:03:03 +0000
From: Yao Zi <ziyao@disroot.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [RESEND PATCH] flattree: Optimize stringtable_insert()
Message-ID: <Z_3ad93ItWdxxNBk@pie>
References: <20250412100351.9009-2-ziyao@disroot.org>
 <Z_yqFzoTQ4fpdd8g@zatzit>
 <Z_z7IUsK1zbikIp2@pie>
 <Z_24t5n2WnmsqXAg@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_24t5n2WnmsqXAg@zatzit>

On Tue, Apr 15, 2025 at 11:39:03AM +1000, David Gibson wrote:
> On Mon, Apr 14, 2025 at 12:10:09PM +0000, Yao Zi wrote:
> > On Mon, Apr 14, 2025 at 04:24:23PM +1000, David Gibson wrote:
> > > On Sat, Apr 12, 2025 at 10:03:52AM +0000, Yao Zi wrote:
> > > > According to perf result, stringtable_insert() is one of the five hotest
> > > > functions, which is obvious since it depends on a brute-force,
> > > > quadratic-complexity method to deduplicate the string block and is
> > > > called at creation of every property.
> > > 
> > > Right.  The optimization strategy of dtc and libfdt is pretty much "if
> > > it's slow enough that it bothers someone, then we'll think about it".
> > > Little effort has gone into optimization, in general, because device
> > > trees are generally so small that runtime hasn't really been a
> > > problem, even with very inefficient coding.
> > > 
> > > > This patch optimizes the function in two ways,
> > > > 
> > > > - Replace brute-force deduplication with libc-provided memmem(), which
> > > >   is guaranteed to be in linear complexity on both glibc on musl libc.
> > > >   This brings roughly 24.6% reduction in execution time.
> > > 
> > > That said, this is a substantial improvement for a very simple change.
> > > I'd be happy to apply this change, separated into its own patch.
> > > 
> > > > - An open-addressing hashtable is maintained to track strings already
> > > >   inserted. As property names are likely to be duplicated, this could
> > > >   filter out many existing strings, avoiding traversing the string
> > > >   block. This reduces another 1.2% of execution time.
> > > 
> > > Honestly the substantial complexity this adds doesn't seem worth it
> > > for a mere 1.2% improvement.
> > 
> > Thanks for the feedback. At first I'm only interested in improving the
> > deduplication with a hashtable -- but later it's found that reusing
> > subsequences is also necessary and memmem() itself surprisingly brings a
> > huge improvement.
> > 
> > I'm preparing for v2 where the hashtable is split out and also used for
> > optimizing get_node_by_label(). Although the changes are not ready for
> > reviewing now, the new optimization reduces executation by another
> > 6.4%. Do you think it's a reason strong enough to keep the the code?
> 
> Probably not, unless you can convince me there's a use case where the
> performance is a pressing practical problem.

Okay, I'll keep only the memmem() change in v2.

> > Here's a summary of the changes,
> > 
> > 	Makefile.dtc |   1 +
> > 	checks.c     |   4 --
> > 	dtc-parser.y |   4 +-
> > 	dtc.c        |   4 ++
> > 	dtc.h        |  19 +++++++
> > 	flattree.c   |  68 +++++++++++++++++++------
> > 	hashtable.c  | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++
> > 	livetree.c   |  35 +++++++++++--
> > 	8 files changed, 251 insertions(+), 25 deletions(-)
> > 
> > ...
> > 
> > 
> > Best regards,
> > Yao Zi
> > 
> 
> -- 
> David Gibson (he or they)	| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
> 				| around.
> http://www.ozlabs.org/~dgibson

Thanks,
Yao Zi
