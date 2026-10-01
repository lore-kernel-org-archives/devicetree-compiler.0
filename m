Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F963A48E9
	for <devicetree-compiler@vger.kernel.org>; Thu,  1 Oct 2026 15:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867422; cv=none; b=iqpvy28ElOrk+6uYPMeRPWBr27s1KZCAYLnQL+Xag8kB01xGAt0U91ISYSfkG33Yee6DdgNdiRRmgIjrKsOSKmW3tcdOhEEJcF/sB2hi25pe29X8sTYpCFuzr/RIs8JgkygMmPURXAXt8H+0lxx8pCfE9ZGfrJDShfoM1xvNFEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867422; c=relaxed/simple;
	bh=Zo1yzoTID+jvOTqcfXQWOGUcWhDYVI5wDim3vMGpqk4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MFQyGT50t9ga2R+zcOuuyQxQnhC0DEb6O5B2OKTlTM855rySI1zqbWfe17AW51T+Juu3aCOd4olvlFJbsulf1p6clSMywzBg/Jf68Ysamsw2zNMl91Oo5u4jmAJjXjP+9px2vmvcVfzN+hR7xvkKmYf9/g/RUF8Z8AVctjPN6E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YQ1McEw3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YQ1McEw3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9ABDC1A1D3B;
	Thu,  1 Oct 2026 15:10:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E43D60341;
	Thu,  1 Oct 2026 15:10:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D76910328262;
	Thu,  1 Oct 2026 17:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790867416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2WC530DAwZPwr2o55YDYJntr+WuUzMzp3QNuev3ghp4=;
	b=YQ1McEw3irujcHuCVpKqGY4P3l8ZQrGZ8wzNLKyYhHE/RlUPWHaQUCKT2uv4vS/U+TtGUu
	dHXvTpYcERgsVulqvSM1aN2ujZxkFZkXmazZd4XvvUQ1Tdym3HnO4QPjWe8mfmVv7Mdkjn
	XgLeuswXymkRisY38DfB/ZxBlKe4+XTPIUEEzlp46q6X3PCqjIUGy+wI3XhTT/g/6MY/TT
	jAV1H9KekYrinMSv38FyAhcv6fwk5KKoN9zr7h1h/WaBhKgS8Yhm73HRS2jpk35bLEgymS
	AXBLwpZD+hUR4q+veBbdruMweDTgdCdX7wKaBwau4PB/vVc8qY6RGe6ZNRW7zw==
Date: Thu, 1 Oct 2026 17:10:10 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
 <michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] libfdt: Fix fdt_get_path() reading before the start of
 the buffer
Message-ID: <20261001171010.3715b028@bootlin.com>
In-Reply-To: <20261001121036.2910243-1-ayan.kumar.halder@amd.com>
References: <20261001121036.2910243-1-ayan.kumar.halder@amd.com>
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

Hi Ayan,

On Thu, 1 Oct 2026 13:10:36 +0100
Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:

> fdt_get_path() walks the tree from the root, appending each node's name
> to the caller's buffer as it goes down and removing the last component
> again as it comes back up.  It keeps the number of components currently
> in the buffer in pdepth, and removes components while pdepth is greater
> than the depth reported by fdt_next_node().
> 
> fdt_next_node() reports that it has left the tree by taking the depth
> negative, but the offset it returns at that point is the offset of the
> end tag, which is not negative.  The loop only tests the offset, so for a

fdt_next_node() returns an error (-FDT_ERR_NOTFOUND) when it reaches the
FDT_END tag [1].

I don't understand your point. Maybe I've missed something.
Can you clarify?

[1] https://github.com/dgibson/dtc/blob/7a1e017926004ecff5fce62d62d42ce9f3e00082/libfdt/fdt.c#L283

> nodeoffset at or past the end tag it runs one more time with a negative
> depth.  pdepth still counts the components in the buffer, so the removal
> loop is asked to remove more components than are there: it takes the
> index down to zero and carries on scanning backwards for a '/' that is
> not in the buffer.
> 
> Stop the walk when the depth shows it has left the tree.  Offsets that
> far along are rejected by the error paths below in any case, so this
> does not change what callers see.

If fdt_next_node() can return an offset (positive value) which is not pointing
to a node without any errors (negative returned value), fdt_next_node() has
to be fixed not callers.

Can you give details leading fdt_next_node() returning a valid offset which
doesn't point to a node?

Best regards,
Hervé

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  libfdt/fdt_ro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 11f2e2e..32689c7 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -582,7 +582,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
>  		return -FDT_ERR_NOSPACE;
>  
>  	for (offset = 0, depth = 0;
> -	     (offset >= 0) && (offset <= nodeoffset);
> +	     (offset >= 0) && (depth >= 0) && (offset <= nodeoffset);
>  	     offset = fdt_next_node(fdt, offset, &depth)) {
>  		while (pdepth > depth) {
>  			do {
