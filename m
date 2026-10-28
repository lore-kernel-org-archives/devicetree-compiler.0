Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222324;
	b=DrK4QM3+1IKVVlhjF0sruB7UdbEzoH7WxEsmE8GfyO9RA3+HFHFNyvKHJy9MCjSGmbaM
	 7jKCiDaJNrJUA6mqqdiJ0HerSFqtW+LQc8KUPvlWdOyhgF9FJQZAuODuagaMZpzcAOuhu
	 UAfAvhHsA/4Mwyd2HG56D43inebG2iI30Wii0cquuIS0zp7PDRAQCdcWhBlNVG/DWFOGm
	 yhR0BsmnL3wlJlSLK2rK3VG3s68XzG1fYh2w7zsadoJcP/TCtylTRWtR617TkAm4xrxDI
	 dio4Ozhxy4j9HbDdcxHeTLObhFqxiwBi6DFr2HueiEstRCXNCezofZyqePStWZAb4Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222324;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=V1G+XfzdHA44p58r/Nk8GHlVR4f4tk0ZF8spkpztNsw=;
	b=gBvxo9dPHbfnGORCryXM0ErzEaNRfyRFP749O6IcfbCCbfSs+r79ItjTsNx9AaADa24k
	 Jj1QKcQcKkRoPXi1/lARtTaaEx8WA+yusoT9NK0oobG7zTzD1lU508rSJtzuaHHUc/qpq
	 G4vrFAPs6inCenhW/JoDl8hjf2QWHn3YFjradu6wJc6zZQj+v34yyrBCIpSLMOjrMfN8N
	 tWsVkupSicjjIcCkvCBncUvujfXxNl7ehx1bjWnIPoyibNZTw/hV/XaHc+hYbgKugTPkZ
	 CjuRTDzj5lJAbh/b+05+NfytgqQf3hXHOeoUkoTeo9U/qNYl1PiQAcpE9b1rtz0txcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oj03OHAO;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7872606A31A
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7872606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oj03OHAO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3BDEB4E41370;
	Wed, 28 Oct 2026 21:18:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1140160769;
	Wed, 28 Oct 2026 21:18:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 320F7103290D4;
	Wed, 28 Oct 2026 22:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793222315; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V1G+XfzdHA44p58r/Nk8GHlVR4f4tk0ZF8spkpztNsw=;
	b=oj03OHAOxGs0nxkmMes5jYLXGgW7SRp7RDHUpnzhK6QkQ9vouisV+oDITwiKOwZT0NdL9N
	DIF/X5Yxc6ZeAyh2YWSy7lL84O0dBVhyjomd/W8QcYz4bDvOBS2ZvZoiZ8JjnC/yxhu8Ia
	yThSs2drkKQ5eaE6u2e2ev2oY/PUPxvhQIsBI2FRqhZw9JbtP4KrhEzqm9aqsuU8X8P8pb
	P9/Iv3kkJcux5VAyNN2CjgyEjrpr3yYlFmnZwMFEry+w/XhhYZ03+tg09MGwdIz1i0salZ
	nWjXDd5C1QvO92Tlko4yaY6L8URJx7pdV2/rTUTMdrNXJtfsqvoPb27xIHjLBA==
Date: Wed, 28 Oct 2026 22:18:34 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 4/4] fdtput: Name the property when it cannot be
 deleted
Message-ID: <20261028221834.4d69678d@bootlin.com>
In-Reply-To: <20261028073440.3327687-5-sjg@chromium.org>
References: <20261028073440.3327687-1-sjg@chromium.org>
 <20261028073440.3327687-5-sjg@chromium.org>
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

On Wed, 28 Oct 2026 01:34:20 -0600
Simon Glass <sjg@chromium.org> wrote:

> When 'fdtput -d' fails to delete a property, for example because it does
> not exist, the error names the node rather than the property:
> 
>    $ fdtput -d test.dtb /chosen missing
>    Error at '/chosen': FDT_ERR_NOTFOUND
> 
> This suggests that the node is missing, when it is the property that
> is.
> 
> Report the property name as well as the node:
> 
>    $ fdtput -d test.dtb /chosen missing
>    Error at '/chosen', property 'missing': FDT_ERR_NOTFOUND
> 
> Check the message in the existing test for this.
> 
> Fixes: aa719618a8b7 ("fdtput: add delete node and property function")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---

This patch will depends on discussion on previous one.

If test wrappers introduced previously are accepted (IHMO again, they are
good), for this current patch:
Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
