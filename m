Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211437;
	b=YB9zWMEFkD+uNyM36clliRPOxox4dwkBjqFwoM8VXLrd2euHKtcdIHEBVFB9YzfQnkTt
	 cEek2Z7eJCB+sWkKnhY63UEEskZH1pT0hNPZaoIAy8bplofx8+IA5mpBPXInEXQ3Ax1ls
	 rO9Cz9yTRCmnddeWQykodrdAvXq98ONEiMjJLBKXio1eAk0QNHGPmZNTRwIlXy9rGXMvC
	 OfgTQQSdkfSLHyEdnKhfJTgBg479v0fUzlnKA66eeJzIEEibFhEAGxvAAfIZpCe6KAL3N
	 RRXg0/3FpCWFae+Upg0LPupLUWK4pLqmyLWpsxgwHbLOIdlqc//XSfibI6scA61iz7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211437;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=Z/Ge1NfmXwbdEJDuHZkMpMTAS3oM4BJfxuxkwot9UjU=;
	b=ZnJVm2Lssda1Tnj15C1B+L1Cwj5dyj5QbKZgmEFAS0dFagjxmu3xflvcL40EX4hZ2lbS
	 4nFdkfOIp1/fU3WMAl5vJTqKlJG62nPJwNN6ey+m8fiM+GJ+7lszx8XTCEGQQXAAE1bz5
	 tcuS8Ra6tlJb/ED3PYj9D3V0OM57kk6Jv3xsO6v6QfhesAj7+gTJ1lvu9am66NPhZp6LW
	 uo0ZavkQTjYC1rf5hd6IOaJDUkZm6ImRLSsy7eaCeYhud5b0ak6SKgbuQMxJGmBWuIao4
	 j0nofSfOQSEVNTibw5fxCtvUq7L8st625lUxWyShg7zp0I6wcS5g/BdKsSg7pKC45MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rLOKzmtM;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B64606A325
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 18:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B64606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rLOKzmtM
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6758A1A137B;
	Wed, 28 Oct 2026 18:17:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 302D260769;
	Wed, 28 Oct 2026 18:17:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49F97103290EE;
	Wed, 28 Oct 2026 19:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793211432; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z/Ge1NfmXwbdEJDuHZkMpMTAS3oM4BJfxuxkwot9UjU=;
	b=rLOKzmtM4AxbEQKToYiN/UkZuXjSM4K5I4m0iYf1KWBgJuEVGR7UqsqQ5/jabsQpYv45Uw
	xiHLYjC/ieoDBd5dH/dxcxblo5nInIyYPItkzYuUvh9qHuCbZgDqY8JcFMxj3Ae83omR86
	LOvlVMPmEPyB8qRVh49TEhu18SgRq4yEdTlJJyHJWgKauXFlPyP37o+xMBHBCO1fLcEn5C
	kUwiWCRG2cr5VteWXm1+AUf8C1Nr7cfd32xKYXLAJDnNJW5+9KDV75f1g75Z5xT/Q1inzh
	tBGtqp0X9lzqtlRIKLdgph5cYtq2lRd50qGn2yZJ6fBSI5PFa90ZA3AS/qQfRA==
Date: Wed, 28 Oct 2026 19:17:09 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 5/6] dtc: Report an error for a delete in an overlay
 fragment
Message-ID: <20261028191709.0a304dd8@bootlin.com>
In-Reply-To: <20261028093620.3705074-6-sjg@chromium.org>
References: <20261028093620.3705074-1-sjg@chromium.org>
	<20261028093620.3705074-6-sjg@chromium.org>
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

On Wed, 28 Oct 2026 03:36:12 -0600
Simon Glass <sjg@chromium.org> wrote:

> An overlay cannot encode a /delete-property/ or /delete-node/, since
> applying an overlay only adds or updates nodes and properties. So a
> delete in an overlay fragment has no effect on the base tree, yet dtc
> drops it without complaint, which suggests that it works. A delete which
> removes something earlier in the same fragment is fine, since the
> fragment is compiled without it.
> 
> Report an error for a /delete-property/ or /delete-node/ in a fragment
> which does not delete anything within the fragment, naming it. Record in
> apply_deletes() which placeholders delete something, and add
> find_unapplied_delete() to look for one which does not. Do this for each
> of the three ways in which a plugin creates a fragment.
> 
> Drop the deletes with nothing to delete from the overlay test, and add
> tests which check for the error, one for each way of creating a
> fragment.
> 
> Note: This breaks the build of two overlays in Linux v7.3-rc7, whose
> deletes have never taken effect:
> 
>    imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
>    imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
> 
> Linux needs to remove these deletes. Where the result matters, the base
> dts must change instead, e.g. by moving the property or node to the
> boards which need it, so that the overlay only adds to the tree.
> 
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 

/delete-node/ &label;

We can probably delete a node defined in the overlay but in an other
fragment.

Is than handled ?

Best regards,
Hervé
