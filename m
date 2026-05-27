Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C66D45039
	for <devicetree-compiler@vger.kernel.org>; Wed, 27 May 2026 04:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779856887; cv=pass; b=Jr8DxvEohCNdLYIvPwLPsOpkeFo2VIU77S1l7t2+E2LQcv95cS0qd3OraIA+5UubitriWtV8SsK1YBgorzBzzJXw1NBqFsHylybwfroUwjbDVJs0QMHRYaWOItwprrv5mcllQ2fpcEycedLw8Ty/YNM52SOAv/f/PJXuJkWxs7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779856887; c=relaxed/simple;
	bh=tjfJn20moMu/Fkjjy4oDn5jO4KJ0OeV5sIaY7qRpfxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sO5AF4KXpqNF111ssXDwLbyELmXT9LPTE0WdZikhZFzp/sxOo5NU2fBR21+NwkmYdF0s0mOSmZkv7IaGk3rzO4pBIaPM2cuFIpRshe2ZxfXhCS80787GOKhc1Yizo8yWSUU/UI5cf9297d0b6v3khn55OgJtBrSyCHHe2ODaseE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UrGR6Fop; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UrGR6Fop"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd8f6ef4ba6so1696126966b.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 26 May 2026 21:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779856884; cv=none;
        d=google.com; s=arc-20240605;
        b=SPdUP4tXRx1WvE2Qeal+OWQzh1RXZjBBEmFacFJ7hYb+CcPg49y9y8kR5XVCE0FSfg
         /1XTHal0egqHKlUhXEYqZod8bL6H1qeLVFFPpNEJe3AtvGGNoKmU1aN8Fk64Z21LJLKO
         eFSvPWqkEyYl8XAoPXuz52WlfX46k+Zy9JefzipW3vLc9lYZhhVGbZMftPewp2rJG3x/
         ML3KXduhZCqbeQpc6XQ2/e20N8o1n2A5GlgdB3Wb9Slicnca+jvGS//xzDdw7njHxhRd
         LtDPvf/ISZV6y68UR0QfsrU8DHSJfOIV1RvhXc4l/6EvAWNfPpyEbvksrAi/exsn2l2n
         e3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zZR+W+CQ0dBaaK80zKwIey2gFPInt7YveZ2NbZ0yIX4=;
        fh=ecA7m3gpiL38ktwE/useCl2uiUjlBCRI6OPHYmi/4Ws=;
        b=iyEgQH7hMXrIrXU7p4E5eC4BTN9Y2Rb/1F/vYwBuRrPCx92rGchKxVx6PIav9tOASo
         2VYnk09Lue0jOd3n5z8piqM3n28JYy4m+FApdztCwmYmxeVmfQWxHOy4SxPfNoTnALil
         HA+iac/v6/kNfr6dvhdB1Cy76TacHv3co+tE7jUBXWX0vh/9WI7LVZ+nlIqwdGAraisT
         qR0CaAj0dOaGZpf18nXiDY5T0NXTQ2qj7KHCsEOZXI1BQFf02ImsWzK8dhF89stSn1yM
         Ko+Y6RuA9o+fDCQ9ty7FjsYSoRLV4oW/NrHAXaKC1F0N+BKzv4Kwrxw1ojvq0CYfNc4q
         aRNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779856884; x=1780461684; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZR+W+CQ0dBaaK80zKwIey2gFPInt7YveZ2NbZ0yIX4=;
        b=UrGR6FopnB+mx0GWdQu+Zzauuo3q9Tag/h6YAZez1VnCT3yRz3Bhn9ZK4UbOcAUGvB
         Ep2WViNVoJo3fpwcjjf1Jo66bTVU2wAgutAUsjVzffFs4a3Vh6G3eZ1RZp91Vd3GziVt
         3OS+GYlaGUnaySvw3nuHe3t21WvZIG3GIe87s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779856884; x=1780461684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZR+W+CQ0dBaaK80zKwIey2gFPInt7YveZ2NbZ0yIX4=;
        b=XiAYL1c9ezrGJCBjSWoSlmEHZHm4eWm6iar2sj1HkVg5VZJbLSyYFxtgj9wt8QAbxG
         nS5vNdjN0lItz+rYZyE02ph9bxDhrdJfFpY5eM5IhKynQAmsg8f4ulWVkM6WhAvGfkXP
         mFCj8xXiaHz/JQbqXcpXCBqkP+RhDch1qH5GB7aYwRpCwNO+b6jYtD6pxB6DnCgPvrpM
         JcImjYwGNsGx+gyE3Rjp0O4BfoUjqUJWA1JeThtzsTOwWqOqEDcENijGT1zbdSjlCh6j
         E7ZLfRx+YmD4eMcBs6F2xR8J5lrHxYvkILLCWM1B5JGbzRayUFBPWndyffcwZ4oBxNKf
         xXmQ==
X-Gm-Message-State: AOJu0Yz+aCuGqJ/ZbZYZMbl+GMpOaZvG4IFNVMs4dX3z9teCPNrfTD+C
	FECmpIslnH8bVEprc08Vi1tGWxdhzmPTd3MIYZi/eYNiqKEc4yZWvXS5+vqnr8FeI3HxfJs1kse
	WXlmj6uTtpQQiWH0CMTCZzOFRQqlhgu/1L0rUV1NJmlDQ5RoyS4DC+xXB5pWk8A==
X-Gm-Gg: Acq92OHxvMGvSPH4vrWwIT2lBbXLDWQDuDcUg2/Lf2949fk79Si+uvOP43rjUnBSqDD
	HhKggWVQQk4W4pmfbbkPuqHix7J1ilzdCSnQobmR5SkggujHHWYMas4Oy3iHgJq9eZ2plX3k2rk
	OdZ8YdfkjPbQSB7eUfxRq8QN/9erD45KW04zNtk9HH8DHVY3gBJOZ2ospGhL8b/BWxlVvzc+ccS
	rgQCbMRPwtIC+8EzNEn+qwg1Wv9lHn5OyjHrB7wreJ1LXbwvxVgcfwRPp+V6DQrj8pPIaceFNaz
	Td1BFKFqrs8JECjF
X-Received: by 2002:a17:907:72d3:b0:bdc:ac75:73b9 with SMTP id
 a640c23a62f3a-bdd266bc8e8mr1297109766b.43.1779856883941; Tue, 26 May 2026
 21:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526203022.4006434-1-trini@konsulko.com>
In-Reply-To: <20260526203022.4006434-1-trini@konsulko.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 26 May 2026 23:41:10 -0500
X-Gm-Features: AVHnY4LUn1lQoazFbiO0fP-1mQEwSz8BP8ddr65ArgInZpJFwAhUKVYO9lSy1R4
Message-ID: <CAFLszTg661QLq3mDdckGChnM_g0s-06nHvEJpnM8QAYh5gVQ1w@mail.gmail.com>
Subject: Re: [PATCH] libfdt: fdt_check_full: Add can_assume(PERFECT) check
To: Tom Rini <trini@konsulko.com>
Cc: devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 May 2026 at 14:30, Tom Rini <trini@konsulko.com> wrote:
>
> In this function from fdt_check.c we have (reasonably and as the name
> implies) a number of checks on the DTB. However, there are cases where
> we may wish to assume that we have been given a perfect DTB already and
> do nothing here. Add a test for can_assume(PERFECT) as the first check
> in this function and if true, perform no checks.
>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> Along the lines of the patches I posted back in December, in U-Boot SPL
> we just don't have the space for this check much of the time and so have
> always omitted it (going back to at least when Simon posted the initial
> patch to make libfdt/fdt_check.c here). This is another case where it's
> a noticeable size win for us. I had missed this change in particular
> because we had in turn missed catching up on fdt_check_full being moved
> out of fdt_ro.c and in to fdt_check.c.
> ---
>  libfdt/fdt_check.c | 2 ++
>  1 file changed, 2 insertions(+)

This does honour the flags so...

Reviewed-by: Simon Glass <sjg@chromium.org>


>
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index cca052353213..2fd5b61d016a 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -21,6 +21,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>         const char *propname;
>         bool expect_end = false;
>
> +       if (can_assume(PERFECT))
> +               return 0;
>         if (bufsize < FDT_V1_SIZE)
>                 return -FDT_ERR_TRUNCATED;
>         if (bufsize < fdt_header_size(fdt))
> --
> 2.43.0
>
>
