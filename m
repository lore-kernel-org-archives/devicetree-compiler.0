Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086922;
	b=qys8480/J90Ks1RiJDKl2gBCdPCIA7xnCPDpmhFTuwwarvPLsMY+FSdWZ6rt253A0Bz8
	 2bDTX1KS0UoK0VyqsOW5qZ8BdjZRHqnsEKN3WiGmJn3iOzPxiqOhqHjofsOX1nRO+dii6
	 c02192OYu4DyykEP+UU6fPbF88wOmof7D4PDCN9gEQ+pVVVa9S6EgdM90Toml+m8cYovQ
	 LqpyrqVdrmUUgumNb+S4r+AI1o5NpgYcuYZIC00HUcbOLrV4LxfJIif5S8+F5sNGkdloM
	 O3ANtKT57UyAbMt/JpopAhDxiuXVzEHPlYZfu+g8eXnGVDomNTnxSh14Gc+BpVn+gsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086922;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=cV0NZU4/9TF2hTeeBr6Ou20/TLaQvCR7sg2DNBRtrSU=;
	b=W7SJQQGreSUH8HWMohHlmnkUBhnXmxQAgs8eg8JFX8RPt/9NpyhfeCUiumxJg0SjqWZ3
	 5SA/iLIo5Y9+//znvJ8GFjkGNMXORrb6r874IQegZuB7DwltJZ8+1Tf3L46AwxKoK5tbq
	 0VD7LCiGdduTp6HlFRUpe1EUiHMD4QQsg44VqpKSUW1aA3xOp7q2dp3lrmarbcLubV5Lk
	 2t/aG6Uin2OpzIGAf1cviIkoarQAyR6/5VVqoeQUwlRVaZKpsculhlyA8wk74CU7zHfbF
	 gOHy2FJzkhTV4UxpBZB/ktxbEopOLgn5JIPWR9CtlcvWWxzro+3zE0rMXLM+KtcZgOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QvIO6KHJ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB8A606A31A
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 07:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB8A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QvIO6KHJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 452FF4E41331;
	Tue, 27 Oct 2026 07:41:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1152E603BD;
	Tue, 27 Oct 2026 07:41:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAB7310329039;
	Tue, 27 Oct 2026 08:41:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793086916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cV0NZU4/9TF2hTeeBr6Ou20/TLaQvCR7sg2DNBRtrSU=;
	b=QvIO6KHJ9DBTKRs80Gc0OmC8ZS3MdCgyBu310mL6cmZWoOMXbl+7A1+18wLf+ONLB4y/2D
	7n5W7JzlvKBMSq0jpovyWgw3MtZa/vnMF57n8S5A8lvo8uuSAPqnQcj6XLzX/WUDCk+fev
	7joWRtCqRSZDGN8VYflW5cLYOiWSpZemfo3L30Mc0u9A/Hb3uX1HlPpbVp3xZgZPPg3zq5
	O+3f9Ev4ECdGdnUJFa9v7B7JS6TBitw0j6fxmxnUOOXGxIgVMI86U4qcJIa2vuiqzub+8r
	ma2vVhJl0PLONxyNhGBcXVrFQwQo4qqyHccViED+JRGszg9gJ7mouVaEmU6HZw==
Date: Tue, 27 Oct 2026 08:41:51 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/2] dtc: Apply deletes in the section which has them
Message-ID: <20261027084151.4c3100a2@bootlin.com>
In-Reply-To: <20261026173529.3080952-2-sjg@chromium.org>
References: <20261026173529.3080952-1-sjg@chromium.org>
	<20261026173529.3080952-2-sjg@chromium.org>
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

On Mon, 26 Oct 2026 11:35:19 -0600
Simon Glass <sjg@chromium.org> wrote:

> The parser holds each /delete-property/ and /delete-node/ as a
> placeholder entry, flagged as deleted, among the node's properties or
> children. It only takes effect when merge_nodes() merges its section
> into an earlier one. In the first section of a dts it is ignored, so
> 'a; /delete-property/ a;' leaves 'a' in the tree. The same happens in
> any node which a later section adds, since merge_nodes() attaches a new
> child as it is. An ignored /delete-node/ also leaves its placeholder in
> the tree, which then shows up as '(null): Duplicate node name'
> 
> Apply each delete when its node is built, by dropping the earlier
> entries of the same name from that node. Nothing can refer to the node
> yet, so they can be unlinked rather than flagged as deleted. Keep the
> placeholder, so that merging the node into an earlier definition still
> deletes there too.
> 
> When a node joins the tree without being merged, as the first section,
> as a new child in merge_nodes() or as an overlay fragment, drop its
> placeholders, since there is nothing earlier for them to delete. This
> keeps placeholders and entries deleted within a section out of the tree,
> so that nothing which walks the tree has to skip them.
> 
> Duplicate entries within a section are still reported as errors, since
> nothing is merged.
> 
> Closes: https://github.com/dgibson/dtc/issues/37
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 

LGTM.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
