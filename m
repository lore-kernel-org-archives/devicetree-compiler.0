Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795718013;
	b=n0RoztOuMLWM5e2T2P26wi8eJd7nYsV7wSzxh0+EoM0rgxJlC95oBaVZAGb47qgp/waP
	 hM6C0NTJZNgV+SnkfD5Mo46xGxUlz8Ze8nm7biIybsZw3sHd1IqDWZXhpFvijXbOeKTWX
	 9JhJcBtB4tiW8IKlMRR9k7Z+cZ0hltzH/yj1gNY5VSCyJzYcUY1yOeRgs/HaqeLL699pc
	 3tyOvRJYpDR5e/JqoAeN6sfDRYabdWEeOVB+qbYF38zA3WFB4gUnDD7B07b/BBOh3aRpt
	 /SmnVn8d48HmalEjakCItmrnqHYeVZTVqV/FT14FgclqFNOuWESpiU+sKsKheiSoayw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 from:In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=oQOUTm035J/y6asmWAT81vVSmIvsVz2egn/yt+de/80=;
	b=NS/Rij6M1dhDks3y3u/iwdP1nRxFANOx01RBNqF9bJt7C3DTa0ARDHsSGYf4Nb8u3uN0
	 +zlNdS7kRVzPeyUOVtxb+T6XmvrCDaI4dw2m5Te6wxGi6NXdHACSREhsk/E8OQS+4dDl2
	 re3gMfnadyXSpC2OO45WYVxR+xOjouf98Ztppmqdix6Oe+I/UbPza5B8PLw1l6r/4xrLs
	 SH0XiMKYJaE6iMAyRfq1L/6ab4YVcQDzBEmZ0KDMUZtV4OuFiQFCLk8JP2lT+EwHP3XVD
	 rdA+k92xu0NtoZyMFvNJ4REEFbkoTDv9I9NfXQUu1NgH4e12AdHM2Ujx44YbWGW0yYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SAouTSj8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065C8606A31C
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 065C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SAouTSj8
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so9443333a12.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:33:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795718011; cv=none;
        d=google.com; s=arc-20260327;
        b=BW3kRoJ/ZnwWRva2u0o8sygzFJHJwW6wsch7TxCJLAehQKOPnWAKX/TlRki//UKDLW
         Y5HwzteXLja7TCnWzxHe+4KBUfv/gqOa+TW2aJNFBehNV2VVBBb4EFFM17wwpd542yBA
         BFNWQS40E5/b0KFzmagb7SNpOMqL+tXic+GzGmazj6vqdJS3bN4oakomE6QWiV50vlJH
         MxOUnbriSBHbecGtPAGZvVWsm8//SxB27UYKkXWddJFKdIHl3ZN+Oj5ZukP6kXiQfMiH
         z0my9FxIrZS15njzrtIZG2GycKBR2FKdphvN7UUgc//XPw/M4IU8sTCnN6WKFeqHTMs2
         M0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=oQOUTm035J/y6asmWAT81vVSmIvsVz2egn/yt+de/80=;
        fh=mqQIQk6NAYxyS97NAWCo63T4PX2HDnM54/E1mUMNKCM=;
        b=dVrNNECPSmis9qBH/8+iuXoUAJIXEledt3P+VWGzZ99dqHqssQ2Ay3ivC820X+KUrJ
         v1P0dd7sCAvuANFiBbgZW0xLQzkvuAJRg6vCczn2uwQLHraCYWLz4+9EaUKW8zINwiBw
         FRqZNYCz3IHigoc6L8A94PiCfr5dMhNzF+Sl6pLeAOOeWQiMIJqTamEWwEk/YC58+YAu
         4bQfP9P3TMYeUuKoZ2wPBcGSGIPg+f0SnPZovyhSJRiK5oL9MP5X7WrSAppiuG9jf1+U
         9C7EzTh8Ruh1selguTtmBBSbG+z2k69FEIXn9lXCi84xL9y1sVGF59IPGTvA37nqpNt6
         Ypbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718011; x=1796322811; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQOUTm035J/y6asmWAT81vVSmIvsVz2egn/yt+de/80=;
        b=SAouTSj8EQR871iYwxM8Ydjp8ZAhHcsWTiN62yoUbcYE8J6Oj3UgC67wrQ4WtoOV88
         UzUVYThi5koOXeJ5+C8Mto18mDzQ4U/F/YL/N9wOQqUjoLqGvTUJuJ7xlaBSE57HcAsy
         6CDVUyxq/nM6lBcRUJ0LxQqwbDOS+sGmFAgDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718011; x=1796322811;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oQOUTm035J/y6asmWAT81vVSmIvsVz2egn/yt+de/80=;
        b=sdCUWF68O0Bqj3pmO+xlaWBk21EWFhlXBEh9rxju1oLXop4z/Ms9bQ5sNCWfdTLWl0
         FuRq/MXWPPi2D9Z9yZnv3zPvdZP1ho5ylAN4CDpPe9Zq93MK8xtA18sHCrbk5UZWGYfo
         sCK33wLBEKX2301mHdFFNef9Z5NJxPMQBA5zSrXK9N5PZzycDgY8lpNv0xgWhChygBvo
         IrVn28aNNIRtOL6cv+oDIiXcb63GJC9/OMuUxSA7pZfqejQVkAW+0ZtfT3DyVIECAJj7
         8wF5gEIdA89ywwelYWz5N5ZkkJE+S1qLSoFAPgQ3RBq6sM4uRwKXEdVRoJusk4zbf+1A
         9N1g==
X-Gm-Message-State: APuU4Z/t7r/okZRvOnxFaarKvAEexhm5BOVLIUNowOp69ZkPop/WKI8+
	Ha1y+bAG5I+beUizTaczBYKuy63KmmilpqlcF5I7hqOtcVOwPJozYRrWLhnsXTpydWTguRV5Vao
	jWrD9UAunWgPrrfucwIuH91DDQXensxK9Qu2gBwdm
X-Gm-Gg: AZFdTZc+ja/W5YgZGx+57Vrtobp/yY6x/on5nsyf4uKzsoXeNW5anW3ZwhvYc1ritWM
	xnWHrmQvC6qi17noSirCzc3nbqxeW5jnpMMG/H2R6h+FJAnXh1DeBO4U1sP7TJH0e6UP13HyM2+
	pX/sf8F8pA4ODiBLccAVM7poAznrv68tcCmSdSp7NoNw7sqwsf71GZ5qsy5wpXU9iNl7QKpqcae
	Qb5X0bUlmfk/tysMn7BMCQz37Iu+ojSOlZ7ONrFH8c+Jt8ju4kTH4BigJGVtXJD+tNrsIVkWpAk
	CKjkpdLiufTPN9MT5q9TEuqkbFw/cXSFgCKcH4O/9AcVweWj8kwmgiwgIiFa/F9Pdl4bQOfGzxO
	z/4QWZXbCClh5i/xLRroYyB0T4luCcvyN4R+5DRDAfM9TJFoRWKxcibAOp+DciZS53JqJ0EomDj
	fFouAwM+ydF5m6E8+h
X-Received: by 2002:a05:6402:569a:b0:6b7:5712:b6c1 with SMTP id
 4fb4d7f45d1cf-6ba37ac6db2mr10851568a12.0.1795718011318; Thu, 26 Nov 2026
 10:33:31 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 12:33:29 -0600
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 10:33:28 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <awZ-fxjHSD-ITpug@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org> <20261116235813.935070-10-sjg@chromium.org>
 <awZ-fxjHSD-ITpug@gractus.seuss>
Date: Thu, 26 Nov 2026 12:33:29 -0600
X-Gm-Features: Aa3M54rlUKwqN83Mg0CtNW5bziiZW-zYFdxR8nMxUZ1Hc0t-p53GVoQpiXxU_Ak
Message-ID: <CAFLszTgCr73DwJdmKjXTj9tXrPyPHCbGPE+d0vpcPOTgVYa-bQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] dtc: Move labelled-reference handling out of the grammar
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On 2026-11-25T06:21:52, David Gibson <david@gibson.dropbear.id.au> wrote:

> > + * it is not found. In both cases, the fragment becomes an overlay fragment,
> > + * unless it adds a label, since dtc cannot put a label on the target of an
> > + * overlay fragment.
>
> This doesn't seem quite right.  It looks like we ignore the label in
> that case, whereas we should throw an error, since we can't create a
> dtbo which does what was requested.

The label isn't ignored. A source layer which adds a label is merged
into the plugin's own tree, so if the node is not there, dtc reports an
error. For example, in a plugin:

    newlabel: &nosuchnode { ... };

gives 'Label or path nosuchnode not found', and the same for a path.
But the comment gave the wrong impression, so I'll change it to say
that this is an error, with a new patch adds a test for both cases.

Regards,
Simon
