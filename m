Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793264510;
	b=kkwH7Bp3zrNDK/9Dk08h47+eYZR/rnpbR0d/i3KcYsSsvn+nKwpL0X5QHUDY6+eercqk
	 z83O+Mi5pqeIlhPnBLBKlEru5M1c0oz7zU+QfzwT0hjERSUAq0sLKic6XNySDs6zTgfX2
	 3KoyzokhhDkv5hVDRPpOROu+JB9T48wH18Wbrccasy5qRpgOc11fMBCWMH2VHnXVbg/EP
	 qRTERmXDgV7rk1zJ1AUQPTR/KPw/lOvv6efa8h4tYgTSaQ+EaxekgqneTg2BqbIMzhgRw
	 l9TZO97tT4Mjam/C3TZQlCq2pldD4mvZrWZOcMB5NTvNtipk9QToWvRI8G7OfgsvSWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=MD1PGMOT9Fc44mdUO0My/vHfc++00Jce3ZP47jhMEhw=;
	b=Bifq+2gthOyOiTK6gStM4wV4nRwZLAlgAhsvRJ0AraOu2C/cTsH5GmvvsDZgipgcVRpq
	 PlhAhlnw1EI1nmYU3LGgGJ/7AX5in7fVC7fFjIZ+7TXXzUcUgIeEk6S+yW7OgAjum1TWn
	 zBm9+pvsew6a8tKKdBoiJ50aoy7JBq/lF/zU/9S9e2mWyCT4EYBFFY33InMKdUls7/Cfx
	 4a7ubqCFvJGMjtmVrcRdAhs/y+axz8N6/twLHFBPoITgEo2SheI2oRw1wnFZVynXNWo4R
	 N0/EPjAYVbuTW+doHZBDhjx/8WC8Ww41gD5YNDT+U8lH4CkSXayTx6flwCZTveSL1pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=N9mYXz8n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEC060A2612
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 09:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CEC060A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=N9mYXz8n
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3173677a12.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:01:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793264508; cv=none;
        d=google.com; s=arc-20260327;
        b=UTgreDVo80JxqE08GkiwBmxrF02URb1brcX55yYYTNeT+0nr8mIYa6FCOWw1n6ynZe
         GTKBOrTEM6UuaqJeRo3I5lXgj0LYgN1H21Rd5wnD9BVBvMc5VSVrD1uZYvLnRwdHccsW
         If9aYZXOG1Rmz2aN34KSRToIlFX2wURwkYMggFoOXydb4hXSaOqUMS57pd2nefZYQYha
         mgQiNe/N5HcJQTYSLozrbmVRl28mwBHtQTBx4RTArmNEbksNZdO+SQtRxZGY2RNX/xzt
         mZsXjhkkPRRt1HQXHfGvBlEq7TYofzmrjwtYj11/ZTWHardtcnQ9eguvCtyEBBV/Zl8w
         Qvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MD1PGMOT9Fc44mdUO0My/vHfc++00Jce3ZP47jhMEhw=;
        fh=6uVpMO1Rx509ITfjJ1m8/U1FB11n9fR9E3zQL6G+9pQ=;
        b=OBPr6uuSTczSeesTu6FM3DiztNQd63AJIpSplzd/8P39jv5q33dAaR+BerEyIumKl0
         ROr0WCxzN/Ot0aDdoKSEUS1XdOREsd0wOz6vHaqL90G/V4EVp9OoINyMRZFDxX35IYrX
         qHixeRH3ly2ZJ4Uc5hwvRgZ7oEFsRgrc/uzqnrebVXIveIDH2vNqsIXsrBp57E2Y7xyR
         p4O9oQIO4oe6anxawNRc8EnbXIvXHPNLu11wUblEE1IONkGUH/vPBXUbjKu3nQ6NmGBP
         ls+8kD8op56NoEJ9jU8WyoL+oFMkSHjJksQOTo6V6RjKLxNi43IG7HCUAmeMy+bdzz4u
         96Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793264508; x=1793869308; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MD1PGMOT9Fc44mdUO0My/vHfc++00Jce3ZP47jhMEhw=;
        b=N9mYXz8njn0jxzeIF/YIdfVkEtg5xYi04YJUIEv0eeU6Js7mp3wME3rUj8+Z8ePRuq
         p5mdjE15dDpJmkCvD1q00QY/n8rl8wszKfSu9Va7j+uU0tgt+crYxkjUHKjSbLUbN8N6
         u4n9oL6iDnmtQXbWNAAWmVb8fhQAEA7ccmMtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264508; x=1793869308;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MD1PGMOT9Fc44mdUO0My/vHfc++00Jce3ZP47jhMEhw=;
        b=yja+adD4MT2oWnNA7Kezs9Zq/wdoO+5pbz3nkphO2m7cAotAXI2B9nqSAZhAjoQWPX
         IfkQNalD26CI+5beZ7iDZQ/dNILYUa6dQ4soQ/qQmyx8DiEgV91s99XXTQ22wGsqVW7Y
         YHFd6yNTyvrj8cY06LL+g7ItGJBeRC+z4yZUvpH1tyU53Ns1mv0M8blZgltkQMoFjlnP
         iazlgvFVlb/m4TTUaonECtn6NHIoh0uLBVCIRs9tyGy+saD0aTbwLc4nsqc5RgovpN9A
         YOP+cT6oXfE6NBXTtRBDf8WLjZZZ7LkO9x4XDxOwvc8B0XZLbkpDIaG9DneZ1DQLtoVI
         K6Ww==
X-Gm-Message-State: AFq9FYLtKOlFXgTECAbZH1DK5BwJ7WgB7pXzP0xBV7iidfxx94UMpZ57
	KT2cYEnMm0f/irhpUGyIjJK5Z60eToZGOsUyHdLnGkioe+DI+ozoWW7XoiRDn3FqNr7KS6sBck/
	YvL1VgtPqbGm30E3yffMmZrUeSo/HXVU2BtYul99L
X-Gm-Gg: AYBFou2nmMYUcuklAja8rI8inm4tbpK/mtaDwCc9W/+rvTOPasTSHsnixQv0w/OkOXP
	Vs1cZzEl2NZaCZFN97rO9Xk0mamq8ld0qNjdQTiwY6+XHY9KExhPTnT00aE8oGBIRahxPPl2jNr
	j7VTwn7fb4FXVeXMrDYXdJweIyyoY+X7Cm/Husk1fs/1lHgZ/s3CrG8BnEmIGRcOl14Decv9DBN
	dawwn5XO0insy4CLJwNFJqk08ivyrWSGPa7jonybMbaIhSUEbmCAvhG2UeD9EAfSzrVhDhCAgY0
	nKLmLJmPgWZGWVd65DJh99hz8afBZQQ22jCnmLz8gt9+jECca0HidWkQpBTHfk7d4cv3d012KGn
	g45HvpiimMQDJA5sLPmIgpQs22JN0piDsgEp3vrqPTMb3ARnLn9EkmG0SQOWtjNrD5ZTlNTQ=
X-Received: by 2002:a05:6402:c42:b0:6b1:abe7:8276 with SMTP id
 4fb4d7f45d1cf-6b49cb54fb1mr3271186a12.2.1793264508053; Thu, 29 Oct 2026
 02:01:48 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028093620.3705074-1-sjg@chromium.org> <20261028093620.3705074-5-sjg@chromium.org>
 <20261029082116.20418e67@bootlin.com>
In-Reply-To: <20261029082116.20418e67@bootlin.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Oct 2026 09:01:35 +0000
X-Gm-Features: AclHuK8YcJNcq_HEfiYssjfzAVM4prHZkNqp_OBrVm2frTZmkh-3aFEpzg2ygRc
Message-ID: <CAFLszTg7zWBVKQdVeiEGhKvfZMibpf+dq4ANgzH1goWm_3FF_w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] tests: Allow dtc-fatal.sh to check the error message
To: Herve Codina <herve.codina@bootlin.com>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Herve,

On Thu, 29 Oct 2026 at 07:21, Herve Codina <herve.codina@bootlin.com> wrote:
>
> Hi Simon,
>
> On Wed, 28 Oct 2026 03:36:11 -0600
> Simon Glass <sjg@chromium.org> wrote:
>
> > dtc-fatal.sh only checks that dtc exits with status 1, so a test which
> > expects a particular error passes just as well if dtc fails for some
> > other reason, such as a mistake in the test's dts file.
> >
> > Add a -m option which also checks that dtc's output contains a given
> > message. Use it for the nonexist-node-ref2 test.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
>
> On an other series which has been applied [1], new wrappers wrap_error_msg()
> and run_wrap_error_msg_test() [2].
>
> Those wrappers allow to check error messages.
>
> It would be nice to have dtc-fatal.sh feature benefit of those wrappers
> probably even removing the dtc-fatal.sh script itself.

Good idea. I'm going to send a v3 with just these improvements.

Regards,
Simon

>
> [1]: https://lore.kernel.org/devicetree-compiler/auKqGJdeg-SZS_tp@gractus.seuss/
> [2]: https://lore.kernel.org/devicetree-compiler/auKpLvtbaWufFMSr@gractus.seuss/
