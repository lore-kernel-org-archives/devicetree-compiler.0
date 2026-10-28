Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217151;
	b=OVJQbYw8uVxdVNmKauS2bHak5XPAm5dMbqJiDMG+Tb6M4oMDA4JSGizxmKKoi0+HIWCF
	 ycumSsauSCKLdCvznDnI1/jp0S5Oi/J+Od8gEG1vlRnoTBRiy597BTzPmYdC/nFLwiEZb
	 Pay/NN1tP1K4J8MIviFEvwgiW1qP7Dk4nmtOzisSHDGb8g7M6f2hkPB68py/lyp+SEJZp
	 CsFmP6dFdXJGDNAuXN9vay5c82F1rUcLSGQocppUl+bYhovSy8r6F1bbrSynztFSS6REl
	 qtU47RPbI/rPvmupOE4DHAlYDlg0mi0E0Gz8+uxjAImfHxPsbITsgJ1MlU0t8iuD0lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217151;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=r/c9gtdxVXH0MGy+KsXLXNWYy7yMf7qfY9TgKgKDEu8=;
	b=0cCum1EtPqcOt3RCu8TresDgUoCci/FNsj8Zd9gRvqC2hVURIJ6yzk7IR1y6urBaZb/X
	 WDPam81g1wmc/2fjAWW+EJDjcMRPABdfXfyqZyKAcxJsUrLb7g8HHdVstImo/ugqnh0mg
	 IUWeFenLwj2LmaB4fk2PdAwTwnVPASdxIaw8tTWvuzWXg4+3S4+UwWCr92o8mUXpZATD3
	 VkLuMXRg9MCZbpzTpfID4tFbsYgZYF3SwLA8kFsl8g4oBBn25msoBc7VQrLuvntRYqOw3
	 0DWuuDbBgP6J8lxtJf/YOZ5W/uNG3O4FIkWT4H/wa9LFdg31k3TR7bNVkKdQDqjbNOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LAY5O8X4;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6008606A31A
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 19:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6008606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LAY5O8X4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8667C4FED5
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 19:53:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93E3860769;
	Wed, 28 Oct 2026 19:52:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7642A103290D4;
	Wed, 28 Oct 2026 20:52:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793217146; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r/c9gtdxVXH0MGy+KsXLXNWYy7yMf7qfY9TgKgKDEu8=;
	b=LAY5O8X4q3gpRXneW+T+RbCNuRWbAm2LsgzYC+EhRVLRo7XRE7ppF7rJ/JkhkcHsjtAX2Q
	WDk/DA0WLZIgH5F9X2ze3pEePRkPPdangeCbqb2iffN1ZBcl3e++pypGRny/tUmndQ+FAb
	mQ89C7OCB8n5UdUJDJJhjaM+IgC2lMk3aqJnqTk/XL+0/Fx4ydt6WFm0oLAaVQys57NVHC
	IZM4YL/NYT3DEXR/66/9x6glYDG4ko6vAzLh2COIpxlwk4x59NsxK90HccMK8lswkQyWfm
	2Eh2nxkvbr5UeWR5gd51+Hg56czspY3D6i+6PDdfqY/1Yb6D51IqGCy5q23B5A==
Date: Wed, 28 Oct 2026 20:52:21 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/2] README: Explain how to build with meson
Message-ID: <20261028205221.62aa35f4@bootlin.com>
In-Reply-To: <20261028112007.3980089-1-sjg@chromium.org>
References: <20261028112007.3980089-1-sjg@chromium.org>
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

On Wed, 28 Oct 2026 05:20:01 -0600
Simon Glass <sjg@chromium.org> wrote:

> Building with make is deprecated in favour of meson, but README.md only
> gives instructions for make, in its Python section, and CONTRIBUTING.md
> says to use 'make check'. The meson commands only appear in the warning
> which the Makefile prints.
> 
> Add a short Building section to README.md with the meson commands for
> building, testing and installing, pointing to the Meson quick guide and
> to scripts/install-deps.sh. Use meson for running the tests in
> CONTRIBUTING.md too.
> 
> Closes: https://github.com/dgibson/dtc/issues/83
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  CONTRIBUTING.md |  4 ++--
>  README.md       | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 

Thanks for having improved those documents.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
