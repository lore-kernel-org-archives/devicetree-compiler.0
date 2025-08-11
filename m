Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221CB29BDA7
	for <devicetree-compiler@vger.kernel.org>; Mon, 11 Aug 2025 19:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754942240; cv=none; b=fwb4mHR1dHcO/xP35PvmUnpOd4ZHPAA5sRiyUGsi/aksZcyq6NgilGXJjBCr/brv7lXKgjH40DYA++N9W5gnamVaGMVjRC6PjTf29J26iiBjC9QZ3C6gBKyo2X80c8W7Ew/OzzqUZzmKOW4EBnQe7dmrMdH0gOoZlSqIP3i355Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754942240; c=relaxed/simple;
	bh=eDNwy0aANeIAYSIFgywmnHFwJV8QxrPXdkYxWh75hK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbPl4OAQN2hW0300F6wqRBcEM9ukjIdW3he82bDkeg7iWkdKh1VRvwrjrRM/RY0BLdQeZbadP+01PIEkyVQAy8ANBIoQ8O4PdS9mykgjUZ0++seOFfS53lK125VGbp5ae+s6FyX8u49nh7pqg3hq3TCuw05QZ7uM8WZoQ59tjrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xf1ugJTB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xf1ugJTB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6157b5d0cc2so6668483a12.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 11 Aug 2025 12:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754942237; x=1755547037; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rUepwTnD+Rp5OZdBFBwJ4szfnJ4pcarIpuQXZuOlTD8=;
        b=Xf1ugJTBWwEbWnnXh9r1vptIpSk/lJkIE3lzxLTuHfG+DMlMzP4aqq2zDc2HzZ47tG
         NpZ/LqXWIGdyDUDzUKr+DcY9gHDxJRvl8IqP2grsB7vK8/7SBq3/bpkH7XXx52H2KG8t
         N1/rtus7jE4zvFyQlEKP7rdr+OEapH9wF6NZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754942237; x=1755547037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUepwTnD+Rp5OZdBFBwJ4szfnJ4pcarIpuQXZuOlTD8=;
        b=jJY2WOIpZKnWooLTLH0FNiDEwBJDU88m2aJbLTQuVk1UXBQnvxXb2H44qH3ID3v6XR
         KlVCLWw1q3QpetvABt9MzvcSYgfSSBv+/R+2R2xFdrNug9A08AmL0kQjPrO9U4tRg3mW
         3fGz/VQCnpEflV4WugNQ/XF3bcbqXRHcXoG9mA2wAdE+9aCuW5844YP25prCSLo902Il
         JWecO9b1XuDzXiUS+H257Cs5XkWuKxZuORhFDPx2ZvTCJXcAs/HZE/Mz1qJCBMkP+fci
         iEJT8adfFWJ/PcstnvDhSvtAIzOi/W77pcqJ3SFZKyB3ZpV7nIU0UII0uvqeWUtD7xdv
         X8sw==
X-Forwarded-Encrypted: i=1; AJvYcCX+qmD950/CaRkeF6WXPFnpoQT1mNKwgtpZ3qpLwzNGn4gIxpfjoXN66ggzyQC9V3JZAZUZLG9oJbSaJHw6WgkrYluw@vger.kernel.org
X-Gm-Message-State: AOJu0YzoB4ETTltEeSahRau8Memx+bpVkrlig2IJVwoX5tlgHRp25bJf
	Ve9CiCVW2lJQjcuXRcXVjOt+E2GjzZq8Zbv4OFcfSo0e20XaEeWWGMAPwXkh47TeZFH3Uyo1b7s
	TscNvxI9Xw+dnLfu2wAG8Qi3PzrTj3b+RLsCRkY7AJQVC1Lf/SuBP6w==
X-Gm-Gg: ASbGncu4CxbGqbLVfiW2pVkfLgKS1GHrnv7T7lf8DcMOaOi08UGCmEVj+z6LgYC+VMn
	BMkb3GogHP2f/zIPRZDXLywTW6Q9OBplZLSOtfliDOpeUwp9XMrkXextvMsE8CGNIbetuW1QyC5
	rJtLybiv8hOd/4EIzEI/pPMA6EIeuNF2aDCro0IhC3w/mmJ6Z/kwqG8DT89teFA+SgLeaWL6Xth
	2UPGJFy
X-Google-Smtp-Source: AGHT+IH77E6Oept9A+Ag1V7RcpDyGoYno4LhFdoizHUEszct7WQE08qAha6KZR4hWNcsF80YSy2hH85EXoyt8ODPQrM=
X-Received: by 2002:a05:6402:51c7:b0:618:47a0:3ba2 with SMTP id
 4fb4d7f45d1cf-61847a040e8mr1976424a12.24.1754942236933; Mon, 11 Aug 2025
 12:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811130416.2653959-1-robh@kernel.org>
In-Reply-To: <20250811130416.2653959-1-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 11 Aug 2025 13:57:04 -0600
X-Gm-Features: Ac12FXyvLtjxzBxyuoQSKkKP-tn7Gkx8iML15m558YHc4sq0JTYe7q38wLsXsLw
Message-ID: <CAFLszTiSrqHVsLmsokRKZ-bc7Kb6dHjA_SfoiSkETH8PXxkUNw@mail.gmail.com>
Subject: Re: [PATCH] libfdt: Drop including string.h from libfdt_internal.h
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, devicetree-compiler@vger.kernel.org, 
	Ayush Singh <ayush@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Aug 2025 at 07:05, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Commit 0f69cedc08fc ("libfdt_internal: fdt_find_string_len_()") added a
> string.h include to libfdt_internal.h which introduces a libc dependency
> which cannot be overridden. Environments without libc (e.g. Linux
> kernel) use a custom libfdt_env.h. string.h is already indirectly
> included in libfdt_env.h, so it can be dropped from libfdt_internal.h.
>
> Fixes: 0f69cedc08fc ("libfdt_internal: fdt_find_string_len_()")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  libfdt/libfdt_internal.h | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

>
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 773bba87bc6e..b60b5456f596 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -6,7 +6,6 @@
>   * Copyright (C) 2006 David Gibson, IBM Corporation.
>   */
>  #include <fdt.h>
> -#include <string.h>
>
>  #define FDT_ALIGN(x, a)                (((x) + (a) - 1) & ~((a) - 1))
>  #define FDT_TAGALIGN(x)                (FDT_ALIGN((x), FDT_TAGSIZE))
> --
> 2.47.2
>
>
