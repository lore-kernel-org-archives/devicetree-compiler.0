Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219688;
	b=yteamO9JMZQzJuTXnE6MlGWwxItABr+96N/q+cO8lnBdoDBct9XE6/8tW7A0bFrnaC8O
	 6T5eqwaR7O1dtABwrcH1wU+Gd/0gPsgf1UCuFqWfGVFraSrdmqmAxleo1JwkqtveVMdEY
	 2cPcpm5qOFo1UjdEGH9TpaWhfJMUNuwQttE0hc23gkSVEKg5lR6nJWT3PNoMVyZzGxUrU
	 c8l57MokKggB4Gn3jVpppmn9SsXudkxTSouos/Nc0br3MMnmDUDEPuYZPxD5Ccv4ai8Qr
	 o2K0BPJAGNwblrAfmR/d1ZLp9SWSCrkpq3ERRdqIjv803adCdiAyy+5OrzGHB+Ti1Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219688;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=v1OZuVM5PbFdN9psdUuw9tlr/h3fdngYHPS/sjcL4UU=;
	b=HW426G7aTVoRa5mgtJq1cDw6BBZFwVW6oXc7RfYQM+ys8iI4ANzqaS+amSDqo08sBtO+
	 DjIHgsT1jnROfe6hjGvJAGKfyYthwtx4+wOy9O7Fdmbo79H22zwUYju937iGR1Ozq6+un
	 y1C4W9VSynROC9aAfVTzOKfGlHVBDjh68MxcktIx4incLJKZCnyWgRE3bKdkWHRaGH2Uz
	 NeVd2jZXXcBHftXnDAaHgPgG3xiu59OusmyPc2TVNqGwE9z073FA5mVZepbpwLRLN1RZs
	 h7/XOAx1NUla936wniZXApfqymwM7ohow3I6PC27rbh+L1wcvj/NLs2r3Q2s79cgTHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nKYijbST;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D14606A320
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 20:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D14606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nKYijbST
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8B3771A137D;
	Wed, 28 Oct 2026 20:34:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4904960769;
	Wed, 28 Oct 2026 20:34:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21D21103290E9;
	Wed, 28 Oct 2026 21:34:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793219683; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v1OZuVM5PbFdN9psdUuw9tlr/h3fdngYHPS/sjcL4UU=;
	b=nKYijbSTfLsKz80TL5u5gaoq0jxsVrzH1rLXPFoSrDXiPJaYh6nFZd/s4KrKruF8c8vup4
	7hXym9N/xK+pCMnEQX3yBNowbZN0vGQEysr4aR7WS82CIzDAMzzUYm59t/WsmJF/H+YY+3
	eOL8x1pxJ5WRSNORVXnxJUwbN4KMxNAMOwp7UvMW8UxN1MsEf+IYdA9DnVD4OBid2Qorva
	VK/vJak4sa368xVRLTknwa8iihHCVlVy5UePjM4HD5QBuDIKhUQE2BGh/vCLcmq+DXphZ5
	N/1LLqwDadbv1+ShlAyLCjQPnTWymd75yf1PgaHAWiEVZR2F6TwfClUs5+AoBQ==
Date: Wed, 28 Oct 2026 21:34:40 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 2/4] fdtput: Follow an alias when creating nodes with
 -p
Message-ID: <20261028213440.24bb20b8@bootlin.com>
In-Reply-To: <20261028073440.3327687-3-sjg@chromium.org>
References: <20261028073440.3327687-1-sjg@chromium.org>
	<20261028073440.3327687-3-sjg@chromium.org>
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

On Wed, 28 Oct 2026 01:34:18 -0600
Simon Glass <sjg@chromium.org> wrote:

> A node path can start with an alias, such as serial0/sub. fdtput allows
> this when writing to an existing node, but -p requires the path to
> start with '/', so it cannot create nodes below an alias:
> 
>    $ fdtput -cp test.dtb serial0/sub
>    Error at 'serial0/sub': FDT_ERR_BADPATH
> 
> When the path does not start with '/', look up its first component as an
> alias and create any missing nodes below the node which the alias points
> to. A path which starts with neither '/' nor an alias is still
> rejected.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 

LGTM.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
