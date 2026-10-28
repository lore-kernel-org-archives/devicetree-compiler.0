Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218499;
	b=nZfF/yR6OeUmGfp8NHNUgo6gv/OKcF6GcjzUVaEgP4NJBWgceMqcD3BjEq87mNbzS6uY
	 LSI9GyrbE2Vaon4D2TfOkbMRxY5M2adyNtC2QkRnH5O5sZ9t0JT7YeOi3HqSzC7URRwlJ
	 +YfFS5MjhTEaUrryZs5fJ2bKYTQw+cw5dKxF950nKkvC0xtfyw/axuqNAuhuAYVYT52e/
	 jp/HJ5ph1pA2wudEfTTN9hL9EuJJ/RVq9ZqH8eC2SswRpBgA0U7UzEFqFYvuIngBbpfEF
	 WpoVHwA+N11riod1e24K11Q/56YFu3+9ttxtTkLDhlQGF3o0Ff/oyAzOiYK/vg1OIHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218499;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=/WpJcg3eRhhvm+8OKJNUmMwkzX/48kbkN45SdxbPvXM=;
	b=JShwCWfA60EiMW++V0fw0mxKJn4R24E5f4EgGIDEwWcKmV51dH6pyldOPHWW1pKvMYqp
	 Gng+SmsPvrlnFigaQchUH5rVaZTcdwtM44WS3uj5cAo4kUr8Vg/vAmfmKwdUNAqs29n4b
	 Ez2GNjzdtsz96RgYsZv8cd1yh1l4Da1EVD7g9Dv9U5chmpbALHXQDOVRZrW+juGDdz2cV
	 e84oYk3C+84o7Z9mXldmOKrcULgPxN63Gb5o9/f+hm1jgnlPnoLuvQv94RSbr6dfUKHeF
	 JIakYZH8ahV4CKWdrv0khnYVD0BeaG89H+/FFnn/J7fduO4nt1zTz2xnT8jPYtS3SJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uWYYxXxC;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F52D606A31F
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 20:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F52D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uWYYxXxC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 775C0C4FED6
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 20:15:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 616EF60769;
	Wed, 28 Oct 2026 20:14:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D47B103290E9;
	Wed, 28 Oct 2026 21:14:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793218492; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/WpJcg3eRhhvm+8OKJNUmMwkzX/48kbkN45SdxbPvXM=;
	b=uWYYxXxCHFSxIji9kKxO4oytCQro6PrQk53ILIC/la3tyCCVzLG/J/aFeRiQ2yOCq4o3YP
	Iu2U+aTGLvhatVxlmdQsTJKj1OpsMLbdo7PkdGglClKDp1RCFR2ViB5OrocrpraOh54dwo
	MbK5dJzQ/tzz/sQ5wi+kj0riH9RGsSdjJTvXWyKH/q6SY65YEUaBvH4udItQA+WpBxa+3i
	smxBt1vIFyp3IMgvxLDxjp00TQ1bHcGg+/5InByx+LDCtYi6ejRbh99ppk0ytxSntCZJNM
	VyP3AFjf6m87TtW9tH+mYI+zNgTRluCjfIh/Sp9ENCVSb9RoHuQOfYleB0SqbQ==
Date: Wed, 28 Oct 2026 21:14:49 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 1/4] fdtput: Require a leading '/' with -p
Message-ID: <20261028211449.261fadb5@bootlin.com>
In-Reply-To: <20261028073440.3327687-2-sjg@chromium.org>
References: <20261028073440.3327687-1-sjg@chromium.org>
	<20261028073440.3327687-2-sjg@chromium.org>
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

On Wed, 28 Oct 2026 01:34:17 -0600
Simon Glass <sjg@chromium.org> wrote:

> With -p, a path which does not start with '/' is created from the root,
> so a mistyped path silently adds nodes at the top level:
> 
>    $ fdtput -cp test.dtb foo/bar
> 
> This creates /foo/bar. The same happens for a path which starts with an
> alias, such as serial0/sub, which creates /serial0/sub rather than
> adding to the node which the alias points to.
> 
> Without -p, fdtput rejects such a path, since fdt_path_offset() treats a
> path without a leading '/' as starting with an alias:
> 
>    $ fdtput -c test.dtb foo/bar
>    Error at 'foo': FDT_ERR_BADPATH
> 
> Report an error with -p too. The next patch allows such a path to start
> with an alias.

I would reword "The next patch allows" using "A future patch could allow" or
I would simply remove the whole sentence ("The next patch ...");

Indeed, this current patch can be applied without the next one.

Other than that:
Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

> 
> This changes the behaviour of -p, so a script which relies on creating
> nodes this way must add a leading '/'. Do this for the existing test
> which relies on it, and add a test for the error.
> 
> Fixes: f807af192828 ("fdtput: Add -p option to create subnodes along entire path")
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
