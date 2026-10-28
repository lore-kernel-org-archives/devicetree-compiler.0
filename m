Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210186;
	b=pzUhoAYAn/uKUauBa0+6RaJFiEJoWseYzCjE+Lxt+QfICSPbM/j9C/8/lqgqorM8xFCs
	 yD059t+w5on90PS2+Z/whkKvEVxo7z95Tdu/eLAXqnQy+2TKEjc1qL+oahl5H1OYyCVM8
	 OquNt+isBPqF6PBZuyY/iKx39bF4/Mq21eyT9hoMCxVYD2WdBOEfHfanxy4rDg3Q+Kozu
	 1VLFTGglrYTZqq+4fjDmVTYo9jnM1D+FwE0+n2/Ysu5ad5vZ0SHQZcIS9OjMzVwYxZXLc
	 ZzIGYGR3zXSWeXSsShb/2JQR3tu7C5UPKGpBm/ZbAR5Ra2X12p6fu2JShYsFLCISyVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210186;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=cFZoEdntl34b4mZh1UsnY4+UlDsGwY0C3194kblVhgY=;
	b=moHuwigoN8TZnyFQ+10WTdPxwnvW6+FoJP4KK4UWWXR16EvjI6zijqAOHtKdo0zNgQm6
	 sycmT/X+jjcN/YW3oBgZv3gft5hZfa3Sk7ANPEGv9d5OvqTYToc4QwK/yb5sQGCjYxvzN
	 q28G8mX4YjQVMyEf8ISBTdJ+1gzfzTteUj2s8tnjGc4tcVlNTyO6jRRKp+Q3+8CUF+a0y
	 4125lIUXSaq34WMx/9IZ0TWdl4jvXHxJ1nz3Px1ucbpqjvxejO2Qoc+MTPLAPQHX87esm
	 WLOQHqMvkFUn7UwdcoKoy91/g6INvYCyrqWh3W1jwIJkNF2/P1MnfkVOZEwHJyoh9Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QCx3nVLG;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21EA60A3811
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 17:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B21EA60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QCx3nVLG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1E0F84E41367;
	Wed, 28 Oct 2026 17:56:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA37160769;
	Wed, 28 Oct 2026 17:56:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A15F103290D0;
	Wed, 28 Oct 2026 18:56:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793210181; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cFZoEdntl34b4mZh1UsnY4+UlDsGwY0C3194kblVhgY=;
	b=QCx3nVLGaMjahW5Gu17Dx/avMYugN3RZb8CAbICkiUMkAYZKs1AFFi8EBR/21ZLDokOqwA
	iYI8HBLX4QhjTExPm3b+SWXlAoPMvlIRuqgkvQ8UveKXatS2kYMBoiSmw4bHTf1e7vHimm
	SxufFkox+23smgvKyAbQ8/ykpQ8vMTHkjvtd/Bcj8/G76SgRqhLar2C+gMAhYryV2kz6T3
	J1qHVowpnh4wUPxH6MwOQ/zog4mqiTNt9mBvb+2eBrM08rSiRTGcM5ijEKv1te1bwTUuF+
	OFeMwVNHDTCLx65hpUrnUre8Bb3xg1B1ACZgu+4d4hdU8TGCP5yjmgD/IdjqgQ==
Date: Wed, 28 Oct 2026 18:56:17 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 3/6] dtc: Clarify when delete placeholders are
 dropped
Message-ID: <20261028185617.12859066@bootlin.com>
In-Reply-To: <20261028093620.3705074-4-sjg@chromium.org>
References: <20261028093620.3705074-1-sjg@chromium.org>
	<20261028093620.3705074-4-sjg@chromium.org>
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

Hi Simon,

On Wed, 28 Oct 2026 03:36:10 -0600
Simon Glass <sjg@chromium.org> wrote:

> The comment on drop_delete_placeholders() does not make clear which
> subtrees it is for. The call in merge_nodes() also relies on sections
> being merged in source order, since it drops the child's placeholders on
> the basis that nothing earlier remains to be merged, but nothing there
> says so.
> 
> Say that drop_delete_placeholders() is for the first definition of a
> node, i.e. the first in the list of definitions which are merged
> together. Explain at the call in merge_nodes() why the child is the
> first definition, and that merging is not associative.
> 
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Add new patch to clarify the comments
> 
>  livetree.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/livetree.c b/livetree.c
> index 6609e4e..b7a5161 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -122,8 +122,10 @@ static void apply_deletes(struct node *node)
>  
>  /*
>   * Drop the /delete-property/ and /delete-node/ placeholders from a subtree
> - * which joins the tree without being merged, since there is nothing earlier
> - * for them to delete
> + * which is the first definition of its node, i.e. the first in the list of
> + * definitions which are merged together. apply_deletes() has already dropped
> + * what they delete within the subtree, and there is nothing earlier for them
> + * to delete
>   */
>  void drop_delete_placeholders(struct node *node)
>  {
> @@ -273,6 +275,14 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
>  
>  		/* if no collision occurred, add child to the old node. */
>  		if (new_child) {
> +			/*
> +			 * This is the first definition of the child, since
> +			 * sections are merged in source order, so its
> +			 * placeholders have nothing to delete. This is
> +			 * important since dropping them makes merging not
> +			 * associative: merging later sections together first
> +			 * would lose their deletes
> +			 */
>  			drop_delete_placeholders(new_child);
>  			add_child(old_node, new_child);
>  		}

drop_delete_placeholders() has been added in patch 1.

Why those both modification related to comment here in patch 3
Worth noting that patch 2 is only related to tests.

IHMO, this patch should be squashed in patch 1.

Best regards,
Hervé 
