Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEFD474245
	for <devicetree-compiler@vger.kernel.org>; Fri,  2 Oct 2026 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933315; cv=none; b=OK21hbd6qBHBYL1/k/877lBs7WfAW4KoovtfdQSF6ZEw94/mPVJM45tbGviG+UcaFTvWx6htfIsLN8kG4EVMrIJiusK649pB+RZVbQKiqv3rfgk+Oudz+ocU7oS+LL1mjxZRP6O+t3qdWwbuaoomj5Jp7RRrQtMxiLIW8K/nSTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933315; c=relaxed/simple;
	bh=nSiSiBlX+cjSgOHJBaVpZxsYc7k9Qd2K1aOKTk1T/7k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqNzvYSdo3dNeTxLxfP6pm8xCfsq4569NBqjQBSedcByZSd3/hAf96YkGR6+fRtzeXNx4pVVm+39nP901huW5IZ0fDdy2U4M1A1le1ZOCgxBJFjME+r1e1OOSCqXFLZpccDna+t2dLPm2YACK9hBOW2SxxE6eJIU2SQoAYngWuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mb3mslYR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mb3mslYR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 145024E41104;
	Fri,  2 Oct 2026 09:28:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C71CF603DC;
	Fri,  2 Oct 2026 09:28:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F0221032813A;
	Fri,  2 Oct 2026 11:28:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790933307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Di0hIo7f3Rs20GkbikD4drpsw35J1TVJ5K8uu69G1Sk=;
	b=mb3mslYRoshJnQc/GgGLkQ523KiOY2jvRy/bUWuIgksdKhju1KtUgg0LXtG5Kfhs0wcUmM
	Yf+uiHlUwNku9LDAibhy9pvfn/C+QPdkbHfmiDw536uBITKJK+DmTCac3ZT6noJOrZIdZn
	CdA/jJZnjKGNLMem44B8ldPRmzuM4Nb6wAh10xhMydPbWqbx+VJ7HzODnxkXf1ZWxkRNZJ
	dOfneJGLdkUrP/Y17bUMiFx/Bm3q8w0qiMZP3thrEkyoPUdRga8Pso1PYVaTyyeSZmMMI1
	/pTliMotGCYin0CzSqA3p4WVGiuW2ccYuCVS9zxp2SgLbSn04vieL1H9RLpNbg==
Date: Fri, 2 Oct 2026 11:28:20 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Halder, Ayan Kumar" <ayankuma@amd.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
 <michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] libfdt: Fix fdt_get_path() reading before the start of
 the buffer
Message-ID: <20261002112820.4d591aa0@bootlin.com>
In-Reply-To: <8ec742e7-677a-46af-89e9-a581375e6f1f@amd.com>
References: <20261001121036.2910243-1-ayan.kumar.halder@amd.com>
	<20261001171010.3715b028@bootlin.com>
	<8ec742e7-677a-46af-89e9-a581375e6f1f@amd.com>
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

On Thu, 1 Oct 2026 18:18:54 +0100
"Halder, Ayan Kumar" <ayankuma@amd.com> wrote:

> On 01/10/2026 16:10, Herve Codina wrote:
> > Hi Ayan,  
> 
> Hi Herve,
> 
> Thanks for the review.
> 
> >
> > On Thu, 1 Oct 2026 13:10:36 +0100
> > Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
> >  
> >> fdt_get_path() walks the tree from the root, appending each node's name
> >> to the caller's buffer as it goes down and removing the last component
> >> again as it comes back up.  It keeps the number of components currently
> >> in the buffer in pdepth, and removes components while pdepth is greater
> >> than the depth reported by fdt_next_node().
> >>
> >> fdt_next_node() reports that it has left the tree by taking the depth
> >> negative, but the offset it returns at that point is the offset of the
> >> end tag, which is not negative.  The loop only tests the offset, so for a  
> > fdt_next_node() returns an error (-FDT_ERR_NOTFOUND) when it reaches the
> > FDT_END tag [1].
> >
> > I don't understand your point. Maybe I've missed something.
> > Can you clarify?  
> Sorry, my wording was wrong.  I meant the FDT_END_NODE case, just above
> the one you linked:
> 
>      case FDT_END_NODE:
>          if (depth && ((--(*depth)) < 0))
>              return nextoffset;
> 
> Leaving the root node is an FDT_END_NODE tag, so --(*depth) takes the
> depth from 0 to -1 and fdt_next_node() returns nextoffset, which is not
> negative.  FDT_END is only reached on the next call.

Ok

> 
> >
> > [1] https://github.com/dgibson/dtc/blob/7a1e017926004ecff5fce62d62d42ce9f3e00082/libfdt/fdt.c#L283
> >  
> >> nodeoffset at or past the end tag it runs one more time with a negative
> >> depth.  pdepth still counts the components in the buffer, so the removal
> >> loop is asked to remove more components than are there: it takes the
> >> index down to zero and carries on scanning backwards for a '/' that is
> >> not in the buffer.
> >>
> >> Stop the walk when the depth shows it has left the tree.  Offsets that
> >> far along are rejected by the error paths below in any case, so this
> >> does not change what callers see.  
> > If fdt_next_node() can return an offset (positive value) which is not pointing
> > to a node without any errors (negative returned value), fdt_next_node() has
> > to be fixed not callers.
> >
> > Can you give details leading fdt_next_node() returning a valid offset which
> > doesn't point to a node?  
> The offset is the one past root's FDT_END_NODE tag, so on
> tests/test_tree1.dtb:
> 
>    offset   depth
>    540      2
>    560      -1    <- FDT_END_NODE: offset >= 0, depth < 0
>    -4       -1    <- FDT_ERR_BADOFFSET, from the next call
> 
> Does it make sense ?

It could but I still don't see where the issue is.

I mean, in the fdt_get_path() we have the following loop:

	for (offset = 0, depth = 0;
	     (offset >= 0) && (offset <= nodeoffset);
	     offset = fdt_next_node(fdt, offset, &depth)) {
		...
	}

fdt_next_node() returns an offset past the root's FDT_END_NODE tag.

In that case, how the 'offset <= nodeoffset' condition can be true in order
to continue the loop?

nodeoffset is an offset to a node. It is either the root node or a node
inside the root tree. And so this offset points to something before the
root's FDT_END_NODE tag offset.

Do I miss something?

Best regards,
Hervé
