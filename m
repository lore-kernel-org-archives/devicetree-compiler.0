Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601966;
	b=2+DwwexXByB33sHsrSQbnHNxqzSFrBieFCbaDl3wGPWRG2UF7rP4juPuxZsGz2HaHE4L
	 JSysIPYA6oi7De+ImA4p+nGrU2LAfdw/uEzuuY2B7/moMpuCcNXTf2jQLJeb0XMMYl0tR
	 Zr8NunLzFvUknTPMnZ/tyLiE1oHaX5iwZkAyJq6Or0ATaw/3T7AQUzjugZvFqjRaMptSO
	 vJMFwbxgueb0xjjEY44yx1IUFpAKpIrgtKcC2Z/O2+VSDK32fSpRbh6pLsR9pGwLKSRlN
	 HrsUNA83rb2zMo0Vbad3zivnEVinkIRCsCyeovDC/fgFXVqIZ/LRNQWe27beeukHrMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
	b=gpZpl7pJXLL1IF7NRYEbTSKOA8TpWCodnmrEPs4NgY+RibNnBF7eHl29TxNvUd9Pgxd3
	 VM7emrONlx4ieHydmdBJNPI0hL38IjTpeVilLvCPj+f/1pN2UKqTQdXtkW88iKC2nSbEm
	 pwcMk5QXmKUUo4wO2j7XEE/PdRadrX97pnXZt1xxo47UgOdhdTAYfMwqLjrsAoqEOhoJI
	 x7BQdNtvsdyYKfFo6VbD0pZWwvsEsoVqFyDdSFpam8Hu21h4M8MzvvBpnv5s6r1OHphvS
	 fuQb8BZnF7lTsqUxaAzQABuEQRDbTjspglmGV7M6il0vL4jU9xhf7MbVxikFdZitLPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JJgNTtnx;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011F606A330
	for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 20:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4011F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JJgNTtnx
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5067a2411bso266664066b.2
        for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 12:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794601965; x=1795206765; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=JJgNTtnx4CNz0G3vI8nrbMwhZXEnDD1L1BvlE8xJTnM8ve30TbWdyckvn9Z39svl3L
         Ku0fNSF1qZ+I2zb93gzXwblVHGF17aJG/q2hXMNcM7dPKasfuGKRUG4tTuxKFbiAi08F
         WsuhdKorcOmVw/Y85ihCnWTklx7g5Ww+RZc9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601965; x=1795206765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=GGldTs2z/fKDSv3mfoEOakJPgiQAoeCGq1I/JBY8RONjSlEOcVOEX9Sf9kGHYlzqQD
         Bov/Ed8g240ZcOutHUZ5h43d04nyx83twUdOqWggg2IjyXviUA6OLS39bvT4f8mnFlng
         eis5rOEC5N6LhFQP6Va8kryjoyH4luiiCPj37qo5lSlRrC3Mflus61EOPNdtmvThYu7+
         +yyTrKY8HTyhIP/5OoomPGHdK6YPcgC/m+ZC7bOS0ZMOI/z21BDamVSD+9Ah4D/h85C1
         yDfYN42TxVcyOB2SS3YmHQ7K8bOwn7qgTE9ZsG0Up/RjXsZRdWsDvbs81lSR8/qWKm8Y
         mWjA==
X-Gm-Message-State: APuU4Z8AZgIul3yS0D/gGQJuEfnCa3Ncj7AbWLKedVmFG7E7JfCJ0qkZ
	/v8Qe8YjUk1vSpDHIo5uzKaJ58s3KEaVd8GRL6kC5gki+JV+ydpUcgEcKNf6B3mom5o+yx8dsax
	IE75kAHVt
X-Gm-Gg: AYBFou02QJf97VG5BXt/G3ynE2oe6PLVmRg+nRPkJL7WrwE05++srwb4B2qCP6u7uGF
	iTebeIUMj2yrcBMKECqb5rvEE+NtcoECXsFRsSCd6Z4tcGsByBLlyCBo6omFWetfPuFmSPY9gU0
	PD71wiw+eX/3NnT239qlo4EQRb0PANGj5UMyGvO7r5kf7OgOO0HljF7fzhM3oZ8Zaxg6oHE8ZAx
	KxKhxS7ApayOxYlo0MqHpVY0I6rmwKxrJcZSw4mSFD/3XimKSrRn2mWwk9jWgrwZDoIjrAwBlxt
	Vh1UXgOow9Vs+nEaNozjGYR6syOeCLzagCI2KcvQmDGNQPsGjrn7/IlUK2X1CLGStfLoACd1pZF
	JO+lqt4jL+yMB2uByREyTtPvTUG6u1KcHnqKIOUjoZGChByyd4pre3aKtxR10+qWOWIX0DwzE7i
	8CHM3a7mc3k46B44a2VtedG4GvwwY9VF5NyrQHmMejyPugIVXXLuqcBgysRAG7+hQQWzJDfeXsk
	InoSS1THFoqoDzphn/Uo1bQfypgscSo+UFJRIVdh/5ylOXVE9HOVbWfTphBY48bzyNmCdv4a1FL
	XgQH29tokhnpQI8aUPHIZ/eSAb6cG3LcUih5GdUBgo89cd83ygu/RDxGHNdHeGMPaShf
X-Received: by 2002:a17:907:6d06:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c50963dc6aemr328844766b.10.1794601964685;
        Fri, 13 Nov 2026 12:32:44 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23708sm136975166b.24.2026.11.13.12.32.38
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:32:40 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so20983175e9.3
        for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 12:32:38 -0800 (PST)
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id
 5b1f17b1804b1-4bb55a99ed0mr76502555e9.24.1794601957270; Fri, 13 Nov 2026
 12:32:37 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
 <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com> <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
In-Reply-To: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 12:32:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
X-Gm-Features: AclHuK8SHFgoyjCXNJrs3RjG85XKuoNtkqoClolncw8zp41l0jasiLh2oN-rCLw
Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Following up on one piece of my earlier reply:

> The idea is that fdtfactor and the overlay fixes will all land in the
> upstream dtc project. Then as part of this series we will bring both
> in, so we should be all good.

Thinking about this more, we won't actually be able to sync and run
`fdtfactor` itself from `scripts/dtc/`. `fdtfactor` is a Python script
that relies on `pylibfdt` (similar to `scripts/make_fit.py`), and the
upstream kernel maintainers have pushed back against building `pylibfdt`
from the kernel tree's copy of `dtc`. Since `fdtfactor` needs a matching
`pylibfdt` installed on the host anyway, `fdtfactor` will simply remain
an optional external host dependency when `FIT_FACTOR_DTBS=1` is used.

By contrast, `fdtoverlay` is a C host tool already built in
`scripts/dtc/`, so we _will_ still sync the `libfdt` overlay
`/__local_fixups__` updates into `scripts/dtc/libfdt/` once they land
upstream, meaning composite DTBs built by kbuild are still covered.

In v2 I've documented the optional `fdtfactor` external dependency in
`Documentation/process/changes.rst` and
`Documentation/kbuild/kbuild.rst` (as well as in the commit message).

-Doug
