Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD15674E
	for <devicetree-compiler@vger.kernel.org>; Wed,  9 Oct 2024 01:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728439056; cv=none; b=SaWyIBo2b8WtT/SGS4mU/pj4l1SXvns8al7uzsduGqegLX2SBjCnqCcWk5t9qHTj2i/WTsbjlnU//wftIokBn8FC/ctAHBRrbK0W4Xq0sgXGG5Z53kR/4JxQa3lOH3gY+PKsyKtz4Maj4Is/4C9/1ygn0F4I5oETOfi6VVdu2Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728439056; c=relaxed/simple;
	bh=DL1DsjT30lJ3jT4sP7jEdSugRGaw4ZhRhEbmNV2wgM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baDmi12E8VgwF1CzwglxmbjwmSat9FVxBgTYj6cXsq8CaJunxrtuzGaDECl0dSooffF4QMXk/nfaVd/kkvZo11rmeg4QhDVd4Vx66WK4V0/Lr5Ig6vAL3Je7U+L1YD7K+vTl9o3X5Ik4JYrb+/dvoxCXhWNzvSRH+gTiFFeAokY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=McnUoWlt; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="McnUoWlt"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cb2aac40faso3266866d6.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 08 Oct 2024 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728439054; x=1729043854; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8pz3qej46U2u3S34caNzieNg3IqBXtPknnYYSM7Or2s=;
        b=McnUoWltvBTd78/y1gCMBS0QwbDTrah+3IqHBpiXJcRml/PMMP44MGbHPBpAJituQh
         kN09G+mfouZs0dvnsomtyYXD21kgOVN7vrhaiHpNjW6anAymRyOPQ94kx1gb5Bf00ejE
         06hs0CCFW7E28FvKvXIHPRb4M+0sgTN151EaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728439054; x=1729043854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pz3qej46U2u3S34caNzieNg3IqBXtPknnYYSM7Or2s=;
        b=p5XUM5SKyTIiSOQB1dvLOcnp0katmLQaC7x5x3Hn5DL2tLsH6P5lnQwRiaC5nw+qfv
         Io8ybmM8rpCpXHvkfRZSgp/JUb4sfjMhz62vPfUa9cw0io+0px4TjlL3JVs1xyFQ7P3A
         U8Jxh3Yb2TeeKxseBDtlOczBBNNkRngz69Hi6HkkFjVArzLsLFm7YhiAi/DhJlpauXUK
         ltF13mT3pvBMKTPuoZt3D/Q8Rg0pDqyiQM0L9PLkW/Wp8MRCaoH/2Cnus3Hu6DgvY1NZ
         CkAui5LWbsmTCtm+JnLHFAww2FhY8C31UO4TnbrQrTx+TOjzYvaAByZWF8p5QQP8Vkmk
         hlkA==
X-Gm-Message-State: AOJu0Ywa1Bq2GqCq/C/wTnjSh6933uDFjsh2Q+bITj+DTW2for5Cuhgh
	ZoPlR1MIctEGnSRuU3aVK1Kl3bpxGycGdJ/hxcgZd0vfgxQUCmf+T5SSmruL7gbwkrIk59njPp9
	3n5dFmuN4xNRHCotHzP9V28UJ9UWWqu0T24RlKSUUKZhKVdhldg==
X-Google-Smtp-Source: AGHT+IFNleYqMN9KnzkO7AhNKPrRZM9UnLCgl8nusTPKBnFZxy5LjZCOnN6tTqF7Nv2TYG7GujmlB06EIwTP6pRiU04=
X-Received: by 2002:ad4:5cef:0:b0:6c3:6477:16e7 with SMTP id
 6a1803df08f44-6cbba94be1bmr98276156d6.11.1728439054374; Tue, 08 Oct 2024
 18:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008214134.171436-1-mmayer@broadcom.com> <20241008214134.171436-2-mmayer@broadcom.com>
In-Reply-To: <20241008214134.171436-2-mmayer@broadcom.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 8 Oct 2024 19:57:23 -0600
Message-ID: <CAFLszTg6dapEB3vwu9CicFs==NUCHgpGGbH91kJ-zKCWUcMo6g@mail.gmail.com>
Subject: Re: [PATCH 1/1] Makefile: only use compiler flags when supported
To: Markus Mayer <mmayer@broadcom.com>
Cc: DTC Mailing List <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

On Tue, 8 Oct 2024 at 15:42, Markus Mayer <mmayer@broadcom.com> wrote:
>
> We need to check if some compiler flags are supported as not all
> compilers may do so. For instance, "-Wsuggest-attribute=format" is
> supported by gcc but not by clang.
>
> Using a compiler option that is not supported will most likely cause the
> build to fail, since we are building with "-Werror" and the compiler will
> issue a warning about the unknown option.
>
> As a result, we only use the option if the compiler understands it.
>
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  Makefile | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index f1f0ab368cd3..febdca5742c5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -3,6 +3,26 @@
>  # Device Tree Compiler
>  #
>
> +# try-run and cc-option were stolen from the Linux kernel
> +TMPOUT = .tmp_$$$$
> +# try-run
> +# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> +# Exit code chooses option. "$$TMP" serves as a temporary file and is
> +# automatically cleaned up.
> +try-run = $(shell set -e;              \
> +       TMP=$(TMPOUT)/tmp;              \
> +       mkdir -p $(TMPOUT);             \
> +       trap "rm -rf $(TMPOUT)" EXIT;   \
> +       if ($(1)) >/dev/null 2>&1;      \
> +       then echo "$(2)";               \
> +       else echo "$(3)";               \
> +       fi)
> +
> +# cc-option
> +# Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
> +cc-option = $(call try-run, \
> +       $(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> +
>  #
>  # Version information will be constructed in this order:
>  # DTC_VERSION release version as MAJOR.MINOR.PATCH
> @@ -18,9 +38,12 @@ CONFIG_LOCALVERSION =
>  ASSUME_MASK ?= 0
>
>  CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
> +# Warnings where we need to check they are supported
> +OPT_WARNINGS = $(call cc-option,-Wsuggest-attribute=format)

This is fine, but you should be able to use the existing cc-option in U-Boot

> +# Regular warnings
>  WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs -Wsign-compare \
>         -Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow \
> -       -Wsuggest-attribute=format -Wwrite-strings
> +       -Wwrite-strings $(OPT_WARNINGS)
>  CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
>
>  BISON = bison
> --
> 2.46.0
>
>

Regards,
Simon
