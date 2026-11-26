Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795716430;
	b=CvM//F4dVBMdKpBrjWKAn3kpODL5p6Adn7+hH3j/RY0w5YnHnxd0niKR67Vt7DfMcuW3
	 wHUnl5zMW4REUc1ro47nEt5xfu+WNAZbxeziUqBexRWTYlr/LR8UteKhUsxyGDf8TeKtM
	 sUTDiq/965wu2cNTaW6iGPMKDfD0v0uNZ919ZlopyNwEAG8DKLat3EdkOnCpz70SaNdvz
	 exs9qSWyhT+jSOa+Wc7YxiBEuShdYS/dRtpYgcK4HZCpEmC1tQYJCuqdIM5zJjDLRcJwT
	 sWxsXk0ZA9PW7ClYJfnVPeS8Bi/25jP37VQioYY4hB4n4bGA/YzSc/6d8nU+/idsNCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=WsZH1HhSYbw+Bpo7Twtv5tzWGPF3R0oGj3Wof3yBtGE=;
	b=tRvIUCJdAD0SD5sAiKxEymJ46LWtXjOkpLGu6DtxGznQLxLQBipfnsTwZL1jv0xqMpG2
	 YJeet1K99YpJQQSJz7eqDJOdunk1NpdpC9pN1o9WSeFVJj70kzpLWj3ja9VkZwcoMDXNn
	 94qterpipVU1ecIfl/qn9QAZ5mp+cvlpeZD/OZw6b43CxR8lUw1WZIKjCdieCzPh+AfAJ
	 Vt31CD3HzaFs0WrGev752sQpUr9xTpbPz11okKWrFlwVABRLYpD1iYO608Y8PqtAKZBj8
	 iLBgO2NCeEOz3tLB/bI1rnS+Cc883CD7dNl5m8AqF2fVKcVvJ4fhiAX4ums/n/2pHJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kB7On9DD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F2D606A31E
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F2D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kB7On9DD
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so9473612a12.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:07:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795716429; cv=none;
        d=google.com; s=arc-20260327;
        b=K4y9fAc9t6hzMskwxY12CH8nqWXljA39dF/yi0Fm9I8Q/CvR2OSNzcfungtlspF/0V
         KJP9EWlx2GXRZf1E3JKKQKaTU8L9o2xj4oNNBHgfS/CThNva+/9j9vIFUwgc2giThnnZ
         utOjLVmuu+4zrOv51y3MsklTr0vZCwambCeiSLCePwPCmSG7t3cuTI3HQoB2L6TccREC
         7nC9rqFOi/hY+Cy4BOeMJjXK3AVgJeOcGYmy5a5PS/Q6nmI6KHBqr34m0buket4Eq3ZN
         6ow8k093m0OTVUjIr/ssbgoGtk+ZpF2BLM6M5uSOeToY/CoRbCDGbmtaeBcPC1cDSNFw
         8YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WsZH1HhSYbw+Bpo7Twtv5tzWGPF3R0oGj3Wof3yBtGE=;
        fh=mqQIQk6NAYxyS97NAWCo63T4PX2HDnM54/E1mUMNKCM=;
        b=bqeSxx6Be8uzQ7WtbclQEzI/he2tbl5ZZVM9d9IMzHowWWigwAYHfJx4dw2TZ9cwgP
         rcAAxSeTXI1VRUsRGGREbyDS44Nbs5XwBS8P758fzXqKSW05qAh6n0A/lfgflEtHy+iy
         bbW2msC463ksujhUhuuaKSBo3V7hbMozNRyh3xmfiC3x0EVpgVJSNWu1F6H05VCQO3y6
         106lv9OL2MfPYfOCKhRZnz3exgzHexyO5ZrwaH8o6ZUkx1WIIKJAKCqgGamb1nosYvEt
         t9acMyY0nj+k8bPgANk7EPGC9TjdqHL3haVzM7cIT6Zmauv4qe5Waa8pqedl0PHZhZp7
         iIEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795716429; x=1796321229; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsZH1HhSYbw+Bpo7Twtv5tzWGPF3R0oGj3Wof3yBtGE=;
        b=kB7On9DDMwCGXnPi2Tt0EC82lp2IhJMlbLJf3VcjAMXgo0l9qy/dzX/ezSB/iJiuja
         iKdTfA1Bwts8twexFvdmGhS5JbS5RjGn2yAns+7KFNq2k8uV1qMPWLsHhMNvg0vrgI97
         y3o4U3NX1le+UHEBQl2loC0SadwNJcmra7YSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716429; x=1796321229;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsZH1HhSYbw+Bpo7Twtv5tzWGPF3R0oGj3Wof3yBtGE=;
        b=pRE84MPcnSmte+56MDyjCnA4/eKpyMH7ew6+VvGqHK9cltwUdqbdo+tJ9OvUwW6aIj
         9wESvVjKcNDFFRZNwl3Y92tQ1dJop/c+SrRnASxGzRUK3n4+mYu4eDmcqjCh3n02LSFR
         efIzntNSBqy+65EA9TckRYUix83jC2qypHBy0x1BmxeNAoQrqt1TotgDIzNrYPYkS43y
         8Q9sQLjXL4mfGSlGU0KcrVNKzo9nazjMYPZLFPku6KUz1kWZR8H6keMz9xNxAZyayDUg
         SGatD7CzZwiMB7ELNVlcLBmhUOE2fQ0Q+ConIQH55t56a83jfkg12kbXPkH39hWbWIYy
         9VXg==
X-Gm-Message-State: APuU4Z/3InrNAPRbWO/waFpqAz5Ez2vXoDOEdoZJzy5n/WGa+LS9AYoM
	ZczQsOlDw6J2hThHESkXOj3cnzvy0NRh6O6K620+Ow69NQgLdMVMNKUaYzp6ccZ9zBX7IDyVuKX
	WNzKbTqEObeg5zBEC9h1JHacgse7yvYw/fcMAmwxH
X-Gm-Gg: AZFdTZfvBA3tDTr7Enp/qBp8drzLuWJqudWemrJzSmMmmLF0o2BtGgCxdlXlcTwsLD4
	v+DNnL70jVu+01/NbwFYCwx1wC4O+2owi0zfqI7vzRzA1XiT3bl49B5Ovb6FNpsHJydHiqRjxCx
	41zsC2fJDTakyCoCQ4Ke9NsBbbDcs7YiiPM6ZyiE6MIpJiaWYq358q/ZJUo2bnYfaYVkQiUyf1T
	+V+jKOryqQ1kU3BYn4xIFCedqdG6L4UaoZDT6U/4UlihETp0vpfZvtAH7HZv07FZXth2n86eKek
	axaunBS7XyzcWixFPbdA6TrLYcmYkJ4j07KXmxjhIs8sjumaKrmeA+pjRhydKk4PbH1kqpe5Fn1
	RSCaw4uNemBezGzFi3BF64dS7QzkLXbzefFwYDhxIW4jNtFeRdaE2MS8i1p+iuAW3D+No9Rg=
X-Received: by 2002:a05:6402:2743:b0:6b4:be3f:51b3 with SMTP id
 4fb4d7f45d1cf-6ba37d17d1dmr16695103a12.12.1795716428747; Thu, 26 Nov 2026
 10:07:08 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116235813.935070-1-sjg@chromium.org> <20261116235813.935070-2-sjg@chromium.org>
 <awYtBTUE2zhepJU2@gractus.seuss>
In-Reply-To: <awYtBTUE2zhepJU2@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 26 Nov 2026 11:06:57 -0700
X-Gm-Features: Aa3M54p3qUbACmu0AGte9OWoVBEK5MIaUPIo3I6wgyfHX6javQQ94MB31x91CAg
Message-ID: <CAFLszTgEukoCt1PKtfA8F+1efPirY4hUZCwg2q3+nei5KpKwLQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] tests: Check how the fragments of a dts file are merged
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 24 Nov 2026 at 17:34, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Mon, Nov 16, 2026 at 04:57:55PM -0700, Simon Glass wrote:
> > When the parser merges the top-level fragments of a dts file, it can
> > report that a label or path is not found, or that a label-relative
> > reference is not supported in a plugin. Most of these errors are not
> > covered by any test, and the two tests which do reach them only check
> > that dtc fails, not the message or where it is reported. The merge
> > logic is about to move out of the grammar, so this needs better tests.
> >
> > Add a test file for each error which is not covered, and check the
> > message and its position for all of them, including the two existing
> > ones. Also check that merging carries on after an error, so that later
> > errors are reported too, that a labelled reference within a plugin adds
> > the label, that / { ... } and &{/} { ... } differ in a plugin, and that
> > a label in a plugin becomes an overlay fragment if it is not found,
> > since nothing covers these either.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
>
> I've tentatively merged this (not in 'main' for now, but I plan to put
> it there if no additional problems appear), because I think it's
> useful enough.  There are a couple of warts that would be nice to
> address in a follow up.

OK let's drop the redundant tests as part of the next series.

[..]

Regards,
Simon
