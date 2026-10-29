Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258490;
	b=yBaB8VxvCTccxIQ/0mymPu3hQYWbdse0TjswB68C/JZH6Qi079q030w6KMYJ3ymxe212
	 tXxVY2F9Qx0Zgf42twwR3g40sNQLvQdZUqGf4XRrDpp06rJr6ZO3M84i0/VkTgBLoLJI7
	 Rymd4lK+Kl8n0kodPzRNK/unjJxgJUJM5oo5I7QqTmkq41OFtmbtMrf86PSJatjSQIWqb
	 cUVZd4i1lJSH34alzabp3pbtcgYGJoIuDItgWUXlP1O+KKppqGqqPti3jXYxEUQeRdw7D
	 ZeSUAmCJfF779lIQYmJfKTi95UAmZ5D4n/cKpcKnM0ZufHCa44Bl9NHVGNcrRXD8vkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258490;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=4RGcZYFea7Luabuy6XqixezQTIF6WwExqKR3+GhzMzg=;
	b=JLs/+gVdeZkdiS7d/MBrbtgWpLiYsCg0z27bCklyTrEVBURNJUchgLZOEJ6m/vv9Fy8w
	 WCQU1N1O27VyfOvEO2KvEMsyNYFpMipY1RW4t6Zd1rQp8xYOF9BHpCvAlNv+CsrphHZe7
	 23udG8aLLSAsmX/CyysGAu4cbKRti7KcbjyBn5eA2Agx+NlhyE0qhjUIi7x8VDiUcL1Tb
	 MquOtFbhlL+Z4Ewfej/uhDtfd8fZ/Y+/8N93hOsjUUNUEIDo7puMSJ1RrIagf0KugsTQ1
	 F9aCK0DAukwqGyhoEwC3L9IfrCA9guzNTwqyk4fXUpYrQMNU2GBVdoDsNmyaCtfFC7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ti4S4qiP;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33C606A31C
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 07:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB33C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ti4S4qiP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C94954E41383
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 07:21:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8089160360;
	Thu, 29 Oct 2026 07:21:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D81FD1032900F;
	Thu, 29 Oct 2026 08:21:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793258483; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4RGcZYFea7Luabuy6XqixezQTIF6WwExqKR3+GhzMzg=;
	b=Ti4S4qiPtvQggZy7LkmnT8tPLVRuruGhgQFlDV2JGKYr0J2b2ZvwvW1bOnDaUiXayruWVQ
	fIZdfalA4/J1mlDc2QjYb2FIxE+by937TeKuKKyQuqgHG7EFiqHauA5xFkazDwsAdycTjX
	lPYIozt7p0H5JDSudIv6MuPwvTBFWktrj015UmfPp4bLfHYm7PaemCu+qyOj934t+DG83K
	CSlmU6FEQMEmT5OPid2Viawhwnn9XRtqNnujmosdaAPCJvppVgV40W2Fw7+WvTR5UYOI+D
	O82nbaR6LrC+F+dCXhMF/3hAqKlNs9/JpD/8hGsHd6lQc/wFudUA3KYdvwVRHQ==
Date: Thu, 29 Oct 2026 08:21:16 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 4/6] tests: Allow dtc-fatal.sh to check the error
 message
Message-ID: <20261029082116.20418e67@bootlin.com>
In-Reply-To: <20261028093620.3705074-5-sjg@chromium.org>
References: <20261028093620.3705074-1-sjg@chromium.org>
	<20261028093620.3705074-5-sjg@chromium.org>
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

On Wed, 28 Oct 2026 03:36:11 -0600
Simon Glass <sjg@chromium.org> wrote:

> dtc-fatal.sh only checks that dtc exits with status 1, so a test which
> expects a particular error passes just as well if dtc fails for some
> other reason, such as a mistake in the test's dts file.
> 
> Add a -m option which also checks that dtc's output contains a given
> message. Use it for the nonexist-node-ref2 test.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 

On an other series which has been applied [1], new wrappers wrap_error_msg()
and run_wrap_error_msg_test() [2].

Those wrappers allow to check error messages.

It would be nice to have dtc-fatal.sh feature benefit of those wrappers
probably even removing the dtc-fatal.sh script itself.

[1]: https://lore.kernel.org/devicetree-compiler/auKqGJdeg-SZS_tp@gractus.seuss/
[2]: https://lore.kernel.org/devicetree-compiler/auKpLvtbaWufFMSr@gractus.seuss/

Best regards,
Hervé
