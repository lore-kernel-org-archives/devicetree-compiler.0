Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725692;
	b=AukXdBNgpk7GehIVttrt/pfHJB0GYlmQTKmQtdN4rxRFmb48RSlnlsh7EjKbLTWNnE9P
	 MDqw6ykBfmW8iiDSl82TSbcdKII5auKgckg3St+uk/LxtipjwA6zFvCn5s9LbDsCgEmyW
	 /m6dRTEKdENwVmdV/rHTkZnTHBuaVjc8LwOFbzF4yckPi7mFjqkFJssl963n62PzQoOtq
	 3jNz3Vv4lpXkMXfSYdiijeFvCRCY9J0q9GpVVNIL8WY6oEIAvWQN0Jblpcpjnx8hRh+qW
	 ZbQw33FMUzKwq2//lDOV8Rn/JWR8GO62gt30vMISEwgKoCaOu02YFe/pZKVupqfimxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725692;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=Dlb/l5s9bFwFDfhku/bzjmQFb6pHxkM8z4d3OTSp8DI=;
	b=brO5sKSEPkDb2U9ZSPeU3+HtA0M6zVM5i20iw8IT1MFB9dkUSeojY6fg+3qhkZxIU51Y
	 83isqRXIEcIcBCNgeiFwJEsypEbgbpTO65w+hLwQFeTiSKTO1KzqTMZokVfIVjUi7YOzE
	 89HoE+YP/fzY2x7JRuwzNZZRJ8w7HlMcnboerohrnSH9S/zOC7N+W+c2hrn5uYPuKKZg/
	 9tQZPSZpwOqhfdECSRfX1/FT9REMKX5fWvKuX8AeR5C4qGbOpFmB6kC1gD4r7yEAt/g67
	 aPurmQ/CXkBIU5HP20XCmuaCtWcahk1KMAnLJNuQwW5rkGvsdTnWl/O2U16g6LdOqew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TcHPuqT0;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AD0606A324
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 17:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AD0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TcHPuqT0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2EA961A1430
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 17:08:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 033736046C;
	Tue,  3 Nov 2026 17:08:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2576E1032914F;
	Tue,  3 Nov 2026 18:08:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793725684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Dlb/l5s9bFwFDfhku/bzjmQFb6pHxkM8z4d3OTSp8DI=;
	b=TcHPuqT0jRrOwbaYFQ3UP8rwFBwYV7IjAmb5nhRaOYCvWNluCnybUxZ9Ff3OBgr0Et4LjJ
	LNzoGkNYsV44UdhxlcMPVlaktSxxdIKgt5gebCzhCIWPU7ovsbBfyW4kxiog/tV4D83ABP
	ZrIY3H6GrB6Qcw4kpfr7kiSERhe87cOxkYGpyxJ0CFoKRo3MWLYOTrxeMAnNaiEZpVkvyL
	8aJzav5D3K6zlglyzhmJFtrxhOahRt6SexPf5ChSVctU37qClul4Qoi1Xdd8mERcgNW/f3
	tte5bAElrt69A7LBIEhUjohJnVhZk3Hsi/JhsofpYc6J+aICMzp4JHvWiJ0G3A==
Date: Tue, 3 Nov 2026 18:08:03 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 13/13] dtc: Merge the fragments of a dts file in main()
Message-ID: <20261103180803.416e25c7@bootlin.com>
In-Reply-To: <20261101163721.2458982-14-sjg@chromium.org>
References: <20261101163721.2458982-1-sjg@chromium.org>
	<20261101163721.2458982-14-sjg@chromium.org>
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

On Sun,  1 Nov 2026 09:37:07 -0700
Simon Glass <sjg@chromium.org> wrote:

> We would like to run checks on each fragment of a dts file before it is
> merged, but that requires dt_from_source() to return the fragments
> unmerged, so that main() can decide what to do with them. At present
> they are merged at the end of the parse.

Why running checks on each fragment instead of the dt where fragments are
merged ?

> 
> Call merge_fragments() from main() instead, once the input is read. It
> does nothing for dtb or fs input, which has no fragments.
> 
> When a reference cannot be resolved, dtc now reports 'Unable to merge
> input tree' rather than 'Syntax error parsing input tree', since the
> file was parsed successfully. Check for this message with
> test_label_ref.dts, since no test checks it at present.
> 
> If the parser reports an error, dt_from_source() gives up before main()
> can merge the fragments. Merge them first in that case, so that any
> errors in the fragments are still reported.

Merge fragments in build_dt_info() to avoid two calls two calls to
merge_fragments(), one in main() and one in dt_from_source().

Best regards,
Hervé
