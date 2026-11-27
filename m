Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804855;
	b=w87yuUWD47g/H2TTv9ELTiTq/YCfTkTkdH5fmAgK7bgDnK3nD5bZOWF2sQmL0ar0kMxR
	 n9n7GGg4sAT+eAjDzvyEEVOrgSZ4CHeYzqJ+Jun8cPzxuFYwr4vC5c1lsIeqog4EFy6OW
	 QZfdmikP2T7+3FNsSOgwH5QqJuTDqhKPk7sCWA7gksIxvxi1EgjjH5Ts03BikK8aLTkuN
	 IH2NaoRCcR/5gfDV2z0aDHsrmYp28oi55loVWQT617svY7KQQRQWXMyAewM7woniW3rdj
	 lgS50kRAtq1XLzCF8l3qMxD/LbnpdAk3Lr7GNDpXlQ9T3bztamaeIhNv7fk/bRI870Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 from:In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=D5dtmGvaMozTtjUJfe2l1snGKJnoKuBzTguZYTYlqiE=;
	b=kL2kIrjQ6xLfQm+zbybsDZewDfEmtT1Fx2sUsm3wHGwi6J5NVWFwo+S3qFwxfxIP2Ul1
	 wZXZ9guqc7vrVYVfXVjGFp5Hx5NbU+sum9yDqDnX/rMpwQzaRz3IWbVwQBaCNn89oIOup
	 rF+ocBTHq4mzXQar+QLUqb6RUyEN9PZ7LQK3Q3a+2FedUNcpytdzgZNepEK/wy8TUY3hX
	 cDfvMU+mIRvXo1YXEZzQ81MN+VFFdlfaqG0tTIncJrCqPHieqsCPHi4SG1nM9LsD0rUVk
	 pfBNi6KvhJGCQcpDjswT6TqvPP8yBMy0nm+CQsmcQ7SQ3XHVRTtq5K18FhvOj/lcUBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cAnimIN0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D8606A31C
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 18:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cAnimIN0
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so9896819a12.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 10:40:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795804853; cv=none;
        d=google.com; s=arc-20260327;
        b=Qsyg4ojrxypKeVpO8mp5LYOK9gy1WRo8gx1PhBDRyuCOTM6QWL6xSHD2ED+QATMZZ+
         0OqM5rJZBdlDaGyR36Wk3L45aJDx8EF8R+EPF9MlbIGl92tp+Tu+/EEjPpDBc2F7yGhA
         CjmqDsBeByoxMnANJ38IN5gFh2ArHXuZeoEZSqeOwYKpApb7CZEYA7PokEuLF9FXQQXT
         fnDfTaKlD2u9gHNtAk5auzAGnpkysVkuoU69ILhjWru23WwqI0WocI+B5m2iID4WG77x
         I4UmHH3eskFxfTz8LdwwmFQNrRdQ0/I8/NVMwBKs6bmpO7wlWVYTK5RMlnjf6j+hhHUX
         Gpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=D5dtmGvaMozTtjUJfe2l1snGKJnoKuBzTguZYTYlqiE=;
        fh=6uVpMO1Rx509ITfjJ1m8/U1FB11n9fR9E3zQL6G+9pQ=;
        b=Q7O6eEhgifKP6ViI0xq+0wnBULCbvep7ehf6NNLwCbht6NyLQXCGSLsUWnMhzMzl0Y
         e43tfkycEgzO33tqbu4vRGUbqT1E1xvRhC7scvJ+AkEFMiS78atZs27XjePVbf/4ALsu
         PXafN35Pad+b/QqWvCSO6Zyx9AIIt8vQ425zfE6qPjwiAzKlOplXQpV2bcuOXWupiQMT
         8AWXbEtqhHwGvMi2q5GzGUbkglVCGKItdJXHxZxtUStmqek0lRXua9oG8rxVozm6ycZu
         KuMyZyyUThqY5tslrO4ZNnkW7qQppxdQcFkqXCLmvl2ErZPt/4PmNi6y01Jbx4fZHRAt
         INAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795804853; x=1796409653; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5dtmGvaMozTtjUJfe2l1snGKJnoKuBzTguZYTYlqiE=;
        b=cAnimIN0hKhEdzYLKkAN41aQAOkDaOALuGkjmfjPkPfba/ddu0QRvUilHtRHsgf4a3
         8zdAvfPNYUnWaCOqf08Sa68YSp431fSKULVLqPbUjqJ6rr8KOisUz5mJNhQvvkoYAAJ5
         +YCsuOsvfy2yDUnTPctvTAIJscpEqP6wCxOu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804853; x=1796409653;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5dtmGvaMozTtjUJfe2l1snGKJnoKuBzTguZYTYlqiE=;
        b=W0zS560XixR5gf1X56uDzvDghqKWtQHhJLWmftPmZqVpYgmF1sv/ntIwo6zmtWvXLD
         693oj26hgrvreXUCB85wfEJhMaf0l+4L9uklCSGtfpIqB4YKqWdt1oXO6OEOzjy7cFcH
         trl+BGN8uytsTpFhW2B74hlD6BOCRnG2mzOwQkuKOhdB+KHk3MfTKvwJQHZ6kejIVU1I
         J4vZ7IQ9K8US9miCPmBCBApAaXCCgaMzPz7vURXZBBZ7F63j1EfzxBVLHrewW3CoHrQL
         pxtJhHp8CiUcSMjOOq+RgpdB65pjNL6EjtyWTwAuVmSURZ5SNMdyWz9xdTQGyb3JFXsp
         Om9g==
X-Gm-Message-State: APuU4Z/sUbkYZuWKnBQSegrpVEh4koXRWUi091W4wnyuEt9/NhbtOzsH
	sBScEt9F+9HW4YOiNvSn92GYh5CMAjzqHqvJ/6/op1uZqdfCRQ07+RwXoLYKPmPPiAr/fRW8pdA
	m4J/YDQKBVki54CkpwzKHgZR+DN9TXembfZpCPk22efFnCgokPUp6Vg==
X-Gm-Gg: AZFdTZfNHASr0tVABBkj6EmNQrQ0iS71zW5oUBZm+Iew3OKESyEskP71TrKvvuoXIn3
	tb6uTcW9+9jT/Ft54eYPoUwez3RG9hoQKpOO31u2KY/yEK/TNMY9EBvhGprKx09yznmMJ1uKruB
	jVO4USQCXUP6nAGxHMw+dMPAT3g/E5vIPcsPLH02o6lBUTw2LNYUGVvig2vR/2wqV17VJJBlHJF
	wNa/zX+oBpDxHumSemDsrVMTvgUp7k67GW556aqdSREv6wxF1Lk5uUQE2z7lR3OWWBbJRYaJoHl
	+L5Sku03kilPfcBsaNLQA9cglgbORXoA80a2ZOt3d1q4KHwkX/s5zwmaoMdCBct6ixWidM/OPvd
	iw7WWtg1EIF7fHOvdBQadAnFJOxzTRU/ruB9nhrsHn2pgunLWz5Jq0qPlgmDkckh6zVIyp0k=
X-Received: by 2002:a05:6402:2b98:b0:6b8:a2d3:afe with SMTP id
 4fb4d7f45d1cf-6ba37ede994mr17622414a12.40.1795804853597; Fri, 27 Nov 2026
 10:40:53 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 13:40:52 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 13:40:51 -0500
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
In-Reply-To: <20261126214247.58995869@bootlin.com>
References: <20261126184126.1472738-1-sjg@chromium.org> <20261126184126.1472738-4-sjg@chromium.org>
 <20261126214247.58995869@bootlin.com>
Date: Fri, 27 Nov 2026 13:40:52 -0500
X-Gm-Features: Aa3M54qAr-MYSI4wla5-u_8LGzc_KdQOpSNKJkSJEuoxvj3SNFdF_1qy5kjhS3g
Message-ID: <CAFLszTh9kM-A-zsFd2=6VEnSxmAFYt1CR-g8QnDo-d6ygmRRiw@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] dtc: Add a struct for the source layers of a dts file
To: Herve Codina <herve.codina@bootlin.com>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Herve,

On 2026-11-26T20:42:47, Herve Codina <herve.codina@bootlin.com> wrote:

> I already mention it previously but could the term "snippet" make sense
> instead of "source layer" or "layer"?

David chose 'source layer' after the v4 discussion and this patch is now
applied with that name, so I would like to stay with it.

Regards,
Simon
