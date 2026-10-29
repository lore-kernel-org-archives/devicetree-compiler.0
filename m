Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272668;
	b=omRDaFej/2SSt7q6BkxV6dtaJQWCCLy06Y/MEby6e3ptBr7gf5bwu1kmL8/cwpRCeQJ6
	 5rJEOJAIPHeeg3PlZ7aVjs3kqAPRHXqXnF+pHTgqUdtDsjEB7Zz8/ijOWowuHlp5C+yvk
	 6NALmhCRH4e8yw0vOkhL3fHHj6gaBBtWVvDLDZZpzok+Hd4dn9cC/5x559Durj4Cb1nWY
	 jl/l5MmFux2i5ce961sYZN4pRfCmfwd5TYUGfvNWtMLkxihr6g3jnonXh087hHedHrNW1
	 HEkKi9D0OuXcGPqlR6am4bKuVlEYzKBDPz+Q3F9g+7m6eD7Zg9PUmITXx3Ijyafq4Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272668;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=69Jx/yPASoobvqukSochA/p2/i7P5yeKbr00g+oXW6s=;
	b=UztIGZUu3cbvTv1ss1Xy35fmXwonOyMK9kWBvXJM6tJnnQnokPiMNhJTzHCTDJK1rZs+
	 N+Dj2YOQKJUPnrCYzvBi45g+pptbNEnKd+RLnMt/mhq0HMbUca76mD+fA7P3H8vXo0g2p
	 6SMOiy9OUcx/Ac2eL5GFdxx5JOxjjTKdx8hZxvXL8+ca/npCbmA+Zuqmj5KnUxnUlFC4j
	 QyXaQWDx5jr8LOBSz5LCWvpIsZzfXi2t4NbqPFNdOXpco3rENN4lA02/N4n3OQNvu/Zya
	 U7peeDSEnfPsC+8kcv9tPGSidHkKTKT0UEw99tI5esMJ0o82qIdj58AXX7SWn/j/6Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0S1oZQqg;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821C2606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 11:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 821C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0S1oZQqg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ED879C49F42;
	Thu, 29 Oct 2026 11:18:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B8CF60360;
	Thu, 29 Oct 2026 11:17:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77FC3103290E0;
	Thu, 29 Oct 2026 12:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793272660; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=69Jx/yPASoobvqukSochA/p2/i7P5yeKbr00g+oXW6s=;
	b=0S1oZQqgZv8IqrdLXiG5gc39bgMS+SO4udHMl++MWZNMl43ACGZevxHH2+0O00pf/RbqRC
	areSslwEJZ2oXcnS/sU5kmocv6AXcyti/IlrgVuvsiVy8E5Jvhp5UGKdTXMlYamEZvESzO
	eZZ6O7kMnQpouxBLFDyGs5yQolLDYdseYLf62urnsQH7AEy8DbQV3k6O00mf3s8k01Mgwd
	eotyuy4xl/uVO8LuD2Xnud55fkcV7bYkh5RV11Hta1c3JOdHqALZ17c4BIb99bgNQ47ui2
	dA3brZ1U8B4UdLOMV9cOev1tv37uMznR6G0emOZiDhZVSHjyyhC1k1LBgKeUpg==
Date: Thu, 29 Oct 2026 12:17:38 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 0/4] dtc: Check fatal error messages and document
 deletes
Message-ID: <20261029121738.4b298023@bootlin.com>
In-Reply-To: <20261029093115.3647778-1-sjg@chromium.org>
References: <20261029093115.3647778-1-sjg@chromium.org>
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

On Thu, 29 Oct 2026 03:30:53 -0600
Simon Glass <sjg@chromium.org> wrote:

> Tests which expect dtc to fail check only its exit status, so they pass
> just as well if dtc fails for some other reason. Also, dts-format.txt
> does not describe how a node defined more than once is merged, nor
> /delete-property/ and /delete-node/, and it wrongly says that dtc
> accepts a file without /dts-v1/ as version 0.

Hum, got the feeling that the two different topics in this series could be
sent in two different series:
 - dts-format.txt update
 - dtc-fatal.sh removal

Except if David applies patches 3 and 4 (dts-format.txt update) from this
iteration.

Best regards,
Hervé
