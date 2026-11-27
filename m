Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805174;
	b=pua5l+0+wU8B/DdpgTVkhMwz5BLeFnz+PIsOVuqbAcRQSh3q7KiRYhJ2YikMSPa+eJTe
	 39Wx3e6plPSlR7BqqjbBO8+0Xz5939//KwmEWjEfLmSJrghfImi5ckGrGadDEETnlK1MG
	 vOzQeBtLIYvl7r2qwXqiFRw+BBKxzE5cggtNJzpmVsF6a7nGYub4pZfGr8jsexMylhOEU
	 hHsnQWU3D/wV7gKp6sFh9pT6X6jlGX+p7PLU8W77q8s23L5pvCGc6PHBzuQFAqFLXAxGS
	 cmX09aBZuxNdBCY78mo/5NSJ/d5QwmkxdGZbe8eyvwHbqEhCFc1Xv+y6Ihk3V95qGRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 from:In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=+vu2ZkQXK6JL84AYIfDnHnL8NqciMAP24DfcKwevW44=;
	b=LtcrRMvrLM854sahVI3xtQcXr/DC6YbKIozL6EEZEcUotDDBc1wr2amp7/MF9QYps+gL
	 hItK9Qjd3hz4pFsjdudte3DYW4Snp9pwD2S4a5O4zhe7KhPmARzG8+/vlpc/kroXcWSR5
	 0cIsDO2yYw5pYWFbVmNGOvXON9yuVtAZBCeH9cqRz3Ni2ntB41ruJC80hlKgL5IXJJHl1
	 idXmqAaK6wfKIVXiOIKXlUpXL5zBP62/dcavHSEV6vEQZnXQ+x3b5/ptb358/yeQOQ/2r
	 Hg3UEu3Wb2HsgznWYDmoNDBhoSPQWWHWJykF8CpyLcMhu2/zbgofGU/1H5G0TQK0G3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m847pE6X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE765606A321
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 18:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE765606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m847pE6X
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so2626142a12.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 10:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795805172; cv=none;
        d=google.com; s=arc-20260327;
        b=Re/LgUxIiO4Nby3R5t9c2GZG6zohpChvig8fbeNL3JcGZxz+rcpyPrBFTm2yyO+cV4
         CJmWTsHWWIjgPd1SBXVB6vl+oJVDLcj1UIUBgxi2IyGIjiukl/Ytaw0X96csPgRCCYM2
         jD1uwWTxlSBiZsSi/U+1rLH4GqnNU8mCPIUEwb2owpV2pAJnzqEMBfYNKIZK6FqGcskX
         7pg5Q8WbtzVlbAFPBcd6wRODBXCJmJv+BeWNCgUcp8axw9xc3A13uBVCLIJmdJizTPIf
         OrzYdhIcZeba+HqsrtY0Cv6lOUBfLmSVcXFqJuL/qazX3xpc0ruF2j8mqEUQu3EjQodt
         Q9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=+vu2ZkQXK6JL84AYIfDnHnL8NqciMAP24DfcKwevW44=;
        fh=mqQIQk6NAYxyS97NAWCo63T4PX2HDnM54/E1mUMNKCM=;
        b=WfNfQ60LysVgmUbpodmJKE+8UJbKrV6rnOCb2WbWH9s3QpiKIO1r1zW7UKGRXon1zb
         IxMhnHEqdHSYAULlGa0LoM5WwVywKbhnlwQmeut+hYcffnHKCqMtXoEKww9Ktxti8tHt
         F0ClvPbX9WMU8vKVPkxPCd9UdycuvxZJOH+Z9yRGsNMhuaVZdnrzrkp/n7d+c9zFtbTw
         Yl7k+xpafzBHGOr4nN4cNhWZ1n+lrDX6ZhOASXPRemMEE21e1ZjgyZawj6uw4t5p3Rx2
         EyYghD87rJSqpGnXzx6EIoKIVus2cpexYfSh2eWi4UksvEWIu/r7nkJ2sX8TvsBVf6xG
         tPyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795805172; x=1796409972; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vu2ZkQXK6JL84AYIfDnHnL8NqciMAP24DfcKwevW44=;
        b=m847pE6X4DrNBhdnDLh/LfgUWzuOZSmDy/Oppz3CGe5JhfMKTNlfcxhbSr8IkawI6f
         8rP1yuwSQ0lAWpapbA5X8fXAsujtm8iqBO/3bqj3edwkQq4BX2pNxPDaVIRs3Ulgrm3/
         vD02PTAeLGicS2+EY9mDaeTcZidsIJAra6T8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805172; x=1796409972;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+vu2ZkQXK6JL84AYIfDnHnL8NqciMAP24DfcKwevW44=;
        b=a3s56PHzFo200YiFSInsQWHngHQiz8F7fbSneSUyNRnNyozYo6myk9dZsFG4WWoYT9
         iEQHHk7/4teL6Hw3tHuIpHkVv+fKUZk67Wf8O+9nbkjmt/Rf0yvUa16Ph/ZPtkcc/Oc4
         08DgAFv4ajrReP1jjGpT7rqBqGFNKIyomQmH95Bs4M8FH9GoBc7GfNHCRfmK0dQuWR9U
         FP39Jb1aF41O6W6ImQ4Wb8BjKjR3sWCH1Ael2+sHTtUA+CjnU5ETIWfCtXlbip26RFhi
         2lo6IUfWAlSvIq5WQ+h5HEmLeIfJDmS/v0clqKTHQgUluAQNtPJPqa3y3dl441mvxm/f
         b2yg==
X-Gm-Message-State: APuU4Z9YsKqSvejrcm+uIjQo9g1s+eSCzBnnb92bti3Ft8EHno24vWgT
	xVe1yBQJWCEp6i4czsebJ36Js3e1zKFaKbpIte+EoQAo2PAuSySK3l/bbQ9WXiNoAy3R8dfwYZ8
	96gDnw0xc0YswdxL5uF7LbUiV91EEth+Wm+WWtiYT
X-Gm-Gg: AZFdTZezFsFUercN7bdn9G8QyfN1rYubeBiQcA1DBSYojbBmafIsn63mUOLse5bAH5s
	wfHBVFJ6bfEnu6Unl2BoEVUGz0LQFbECjoAGjaFeTtAtyKpozmQsivDtYd4s7sdFp5kuzg+vslN
	oIdFje8ep3MJSJl7bMlby50xUXJ1QGUXShupBuB9DcIOtZP5qMUIfZs4WXKH1sjAYQHvHK0lbG/
	yEGOQrVr+trcONdSPrgauc+bLH2qxLitHCXHuN+yJ4DgFTWjcCvFB/mpfLb4qOPR4yPRODjczvf
	zOKp2XnxkYN2TMTszl8YgMpfg9O7s7xUb/Yt6kYLLW8/lZ6EfSZToSXFhW1M9wx9DqrWWRVwplV
	/wffkbEgtbc2YcU2G3imH1u1rH9ozRd2b0cTjt0mOkJtWeVUezN3vc4gHS5jaGwTi++7yhbI=
X-Received: by 2002:a05:6402:210d:b0:6ac:c1fc:8a98 with SMTP id
 4fb4d7f45d1cf-6ba37ec77e3mr20851432a12.42.1795805172325; Fri, 27 Nov 2026
 10:46:12 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 13:46:10 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 13:46:09 -0500
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
In-Reply-To: <awj91V_VRaV9Mw6B@gractus.seuss>
References: <20261126184126.1472738-1-sjg@chromium.org> <20261126184126.1472738-11-sjg@chromium.org>
 <awj91V_VRaV9Mw6B@gractus.seuss>
Date: Fri, 27 Nov 2026 13:46:10 -0500
X-Gm-Features: Aa3M54rlMjC6bl5pTTsKcCi8zjesPQ4Si-Wei5yuQojQs9ZghHGx6-4FsoYepQ0
Message-ID: <CAFLszTjXJZ+0s6dt=yvU=BcynQxEvd0oqj9PvjDVHPQ7vxQxoA@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] dtc: Move first-reference handling out of the grammar
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On 2026-11-27T03:49:57, David Gibson <david@gibson.dropbear.id.au> wrote:

> Though as noted, I don't see this as the final step.

Yes, once this is fully in, the next series will update the parser to
return the list of source layers, which should make it easier to
handle the first one like the others.

Regards,
Simon
