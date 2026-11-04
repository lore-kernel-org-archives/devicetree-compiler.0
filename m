Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805266;
	b=Qm2ZWzn4jb26sGgb9HprivpLjpt9L2s5YB1WD8FreB4HhJGUkSqdOOwD0qIEyqIWgAnx
	 +LFApDAhrvk4azYixdTk3frL1iVVLHU40ZPQTNEtnp50bpgjRSgP55PnihoZpylPS6rVK
	 b6cmo40B8tFkHZzZ8+BqlkS4pUCR6KoYLMadiYpsV3l84gtipC3rPs6AtE1MFiKLAjxjr
	 J3kVQ0Q8uH51T8pPFo+C9F6tbc4kzxdUkNaKoFJ9IyejoxG4fYFMpH6jv5qGImpbA4dgz
	 wyJm1L9hwfCLgoBeOiYzWPG32NygPBl43aScIo1Uq2vg+McuXspi2DZ5xiraARWJi2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
	b=Rd+/hYvNl09VTOxNqOUY3zql1Xhtpl5Yb66Vr5QI32SJYV9ympZGVQJU2CNfXn5tFVNQ
	 l1zbaGXOqG397CETdg3KuoFg35Xi7mB1scfW1MsMd7zuomF1l7ncEPSni3yjjLTjTpNlI
	 vObI53c5QOQM+L05564/5cvyvaYj82vqsafLtcAOyMofDo556QP55n2gx1mK2NHjBr1uv
	 KuLKdUE8vrRTxvbdb2VoONpfzuNOOOR1iE1/24b6fWXGHiUhLgA8Co09sl4rH7yDUDpN2
	 79lliH5rEQfRon/3nc4kFCYmv3Egh7viCuwy9dEA7JfOJBdV2eyrQiW2DlHdLhXGLIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jIyQGiA3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F412B606A334
	for <Devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F412B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jIyQGiA3
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b561b60b78so895782a12.1
        for <Devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805263; cv=none;
        d=google.com; s=arc-20260327;
        b=AzCwYXnGcH4uTbKdw+IlWtD2uf6Cb3+239oSkowEnN4oWQ4ugml5SZ1f7dshKVpBla
         g4S7jIlDBnBm4pur7ovUaIFFxnB9yxqsFH6CI3WEHu4LaG8qnQKTrFNqzozIxzSNlBju
         OFl4Y/1fDeneDWbI/QRG+wxNBDSE//nJAgNt+d7G44xyoYbaNLO+J2LOJhvM//XjFU7d
         sjUlh5SqDnok7YJYbNKX1zbpmVVgvdB+lqsFeCbPi9f4iDfib1fbv7HXrGmmJspY1wHh
         Te0GH93QDcQmFTWhLgTEB7tytk5el/6rD7WrM1BsAMsyOXwMf1IsnUPkVuz/wPVapXC7
         8s8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
        fh=4BA7Iq9H0VSWaCP4Je+uW1rc04Fmu9gG6jldUSQQ6Y0=;
        b=OePi94MZf0OGfCmjJrMb1X4hYQ8tA7c7bmAjCyhQdTjrvtW3pbPANtCPgIoixj0mGq
         sIhr+7eijEPk/m4nWUHdYslMV6Yq4irRS4Xzn6qDrEfG+gPyHk1FuppJkXb4/M42CaxG
         jf34cc1nLmdrwrbm1s0EfZnzqU15JFwj5GAAAPKPCvgL9aTIw6Bse4EUT2iD7Wq6N+0d
         b/HAIziEDMbLhwQq7yYC4PM6h75PBjES1cw9OJJ+mYC32gQDDqSwM7ArjmDUAwmqQdJJ
         kNJfJS1COJu5eR2AUp6O7gbLunbCCk+euA8TxvD/TuO1cgmxmrpnjrZuUsuMghk/Tyf6
         2Pdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805263; x=1794410063; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
        b=jIyQGiA30ggNY/gePK9uAOpdjZdjmmpf2PywAnfTbXxFbYkCteIj7r2oPuvoZxleFF
         ZO+tsaqgMRQlICWQVBxB8SH6FvY0uij7Eaq7FEtjjhp/CQrmlpsj05TdfwqvyPNIdleK
         5c2qtd2XkN51j3OvcGjx+HEh73YxAytA0K8mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805263; x=1794410063;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
        b=t2ztLcNamM2zsrxiBV460SyjoLXiCelxGe3FzMT1B9BJGzpuo1F7S42/mOhVVLkhQS
         yojaQjtOZGMKoo9PVMQdhqXsf4eAYWFGX+o/f7YdFCU3ZLjqiW/xlhUoru7pI0LWtRXB
         BwLGuEFJSrIC3MGlWJ/Ur1Hhj7ibb8csF8Tcrz5zxl9YF9U0i9943TOhRRxeU26eQfjF
         LnBKTPXoIKaoXGOt9DKchwhJPmovpHGUZvM8GxTIJ9CYjLtmKYQLrvdunxqBOaWLZK05
         MfOBF4ixSRdhPf82zBqz/PMemoRWQks6sFnzawYMPuWhONTXR+c5akmqeDoW64Ilug0Z
         AI6Q==
X-Gm-Message-State: APuU4Z+EWmGazv7mzPpEFAE3WTk3LoRtPzIpXextbIL2DwEjWLsmEAtm
	eIrGVTkdL4Iikp2QNFGFcr8WryrQe1SrqMCLywpkHAgCO86vbZJsVOF1j0JG/1474jbN4hMDJMW
	KOXtYxD81jYjWwU5PkBk4gMN0QpRctJGxcURLNcrS
X-Gm-Gg: AYBFou3vNcJjls9nkIjkAJRPEe6uyTeu2Vq9dqlKKdE6knYfsjLfu9aj+wfYNQEAD5V
	YZjiuQDQ+J34BtjazRA6wStIvFzH5x7GtnCY0nMCS10/QzVpQ9iIkojzYXiBZNahPwgFemkXAHJ
	y+V/8dj4LZGbl9wRXVNC+9oV7bbLNF/zq6Mp8xrslgcHTA2YP33GNpDxdtOL0poESFJAUzzr/xy
	+gJxj7Z5XlL+CMTIHnRjZoYyJ2QD8riS4ksFOgE+/OPWHCFSnFOBobVdDq2gdajzK/0qZZSRJLa
	qzFxFN+lVmY2zgXDWr+JgTAxIqLzwldjrIeTVMcR/NjBdQxIdJR9llU4bemKPuwh85POrVZbr59
	bomY2uCT64vg4NlJVAYc3WrE/BIqrSKtH5Pz7lP6IQd8cvjBlQTSjbE4hiVHi/TdErpp2dFQ=
X-Received: by 2002:a05:6402:a6d3:10b0:6b1:e072:763b with SMTP id
 4fb4d7f45d1cf-6b4b0b821f0mr10620274a12.5.1793805263475; Wed, 04 Nov 2026
 07:14:23 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:20 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Nov 2026 06:16:54 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-14-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-14-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:20 -0800
X-Gm-Features: AclHuK8NWGTzSKUvVKtQyz5aMNFmdu9T2RyI_tRUYr7JqriTGegWmwNChaR-jTk
Message-ID: <CAFLszTjBv_oQ_hPY=rzwuiP3sZTHPzBGoo1zcBgktxYO8Va1jw@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] fdtfactor: Add -S/--strip-local-fixups option
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add -S/--strip-local-fixups option
>
> By default, `fdtfactor` preserves `/__local_fixups__` on `base.dtb` so
> that when `fdt_overlay_apply()` merges a `.dtbo` overlay, the
> reconstructed device tree retains full `/__local_fixups__` information
> (for instance, if an OS kernel wants to know which property cells
> contain phandles at runtime).
>
> When `-L` was passed to `dtc` solely to help `fdtfactor` locate phandle
> cells at build time and `/__local_fixups__` is not needed at runtime,
> retaining `/__local_fixups__` in `base.dtb` wastes space.
>
> Add `-S` / `--strip-local-fixups` to omit `/__local_fixups__` from
> `base.dtb` (and therefore from the merged device trees produced by
> `fdt_overlay_apply()`). On a set of 47 Qualcomm SC7180 Trogdor
> Chromebook board DTBs, `fdtfactor` without `-S` reduces total
> uncompressed size from 7.69 MB to 932 KB (88.2% savings), while
> `fdtfactor -S` reduces it to 634 KB (91.8% savings, saving an additional
> 298 KB by omitting `/__local_fixups__` from `base.dtb`).
>
> Add a test case in `tests/run_tests.sh` verifying that `fdtfactor -S`
> followed by `fdtoverlay` reproduces DTBs compiled with `-@` (without
> `-L`) via `dtbs_equal_unordered`.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  README.md          |  9 +++++++++
>  fdtfactor          | 34 ++++++++++++++++++++++++++--------
>  tests/run_tests.sh | 18 ++++++++++++++++++
>  3 files changed, 53 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
