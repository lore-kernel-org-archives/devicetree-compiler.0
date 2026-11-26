Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725775;
	b=w1YiCeMuPF4n8g/4Cv5SeHORDt2NvKjNzM7pCQ/6HcW8rTbDEVbIxY/YNB4yeCYmS7yF
	 Qi0+iRB45SWDi0zyNuVSPAoGtmaWFwaXV8B9PuYltv/WMcp2y/kGyKofCVWCt9cCIcJM3
	 qX4owaEBIVj7vbaCqzh5M5Im/rlfgNxgPgaCOeK6sO7LQGWdKAE+sXYNcEypVvY6CNkQ8
	 ZsVPd7ekkb4eu5S0+z9NqEfoU9tBW87qaavot+UXvtH1nepPNcMgOgC3TixZWf9bPKvAZ
	 jT378l97hnxnkEuk0vP7FrbXLNg5m1YvLSbVEFnTdS9uklNMP1YXB9hdx+8UlM8KaFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725775;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=sTpiZbhElpVQiytXmM/1lU591E+rgKjB/8U/0e9iX7c=;
	b=fJAyRTe+Yqebtt4Oc1jlZxYqlO/AWy0dMxFZqj2jHyziOlGq4KTr6DjpcYyonF0oF93j
	 CjPp/wWYaiPgmRZyODo620kRsEeH2mwhEmXbFVoybqhEsHRCZsPHzok2wNSaHRDhkcbhC
	 jIXmoUVT7Vyb1J1AoZytTQ+TvVIJpECDVfDq8tvnJiq9rNt6sfxGUV+vGppI0edgAYUo+
	 fWOK4G/Uzl07qMwr/V62gjBHt0519mskfXL6mVamc2Aj1SoAVzjTTDO2QDvfvOYcI5ygm
	 UHghY0TabswPeva2wp1YECBBrEf7NT3MsrLK19kxZdrxHU1heLBpLSpAoTnET96Xt4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jFLMGZCX;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6610F606A691
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 20:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6610F606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jFLMGZCX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B8DF84E416A3
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 20:42:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8575760558;
	Thu, 26 Nov 2026 20:42:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3FF311E691CA;
	Thu, 26 Nov 2026 21:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795725769; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sTpiZbhElpVQiytXmM/1lU591E+rgKjB/8U/0e9iX7c=;
	b=jFLMGZCX0mZttWu6g73HEPPHEMyjp6+wNABD4pSr6Xgdr1WCSHmNBSsA3zFL4AxU5fOvS9
	9oENZTULxf1w6nSCuPlCtP7nveOfT2ps40CNGx89FTxxnXQG+ujZMUSSmAlsTwrg++UXHU
	zQsCa9FX8lTFHF0SPzq6R8CzhyteZvKI3pllNHIrKNCsSd8ViRTVEzQoaC6OiSKdyDvnA2
	jRJYCp5yqN7pDbPZz74535kszLd1b5gQ5e/Rccs2JOMhPjOn91tJ74KMsuocHVPz3r/kA6
	S9Y3iVNQ7a3H/RSZT81ZyO/N3U+41OzV1/4KiHyX0lpnYq9miqOX/o5pqfHefA==
Date: Thu, 26 Nov 2026 21:42:47 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 03/10] dtc: Add a struct for the source layers of a
 dts file
Message-ID: <20261126214247.58995869@bootlin.com>
In-Reply-To: <20261126184126.1472738-4-sjg@chromium.org>
References: <20261126184126.1472738-1-sjg@chromium.org>
	<20261126184126.1472738-4-sjg@chromium.org>
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

Hi Simon, David,

On Thu, 26 Nov 2026 11:41:02 -0700
Simon Glass <sjg@chromium.org> wrote:

> A dts file is made up of source layers: the root node, later definitions
> of a node by label or path, and /delete-node/ or /omit-if-no-ref/ with a
> reference. We would like to deal with each source layer on its own
> before it is merged, for example to apply deletes consistently or to run
> some checks on each one, but that requires keeping the source layers
> apart. At present the parser merges each one into the tree as soon as it
> is parsed.

I already mention it previously but could the term "snippet" make sense
instead of "source layer" or "layer"?

> 
> Add a struct source_layer to hold one which refers to a node, with a
> function to build each kind and one to free it.
> 
> These are not used yet.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
> 
> Changes in v5:
> - Use the term 'source layer' rather than 'fragment'
> 

Best regards,
Hervé
