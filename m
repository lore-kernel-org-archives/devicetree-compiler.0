Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9211CCEEC
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Dec 2024 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733318969; cv=none; b=cusZi4qMKbh7SUU4ptEfHTiPB7WkY7RBMNI6TnMT9urenSYRiSm+Abwf19q0MvPOvfkIOcpTKOK18cJQUjBUn08Ic20rAK9dIHpEk2BvDXnz5MicS4A7tuAyeH/oOOpiraPQOVkpiowXBt4/G92XtHOpiUNcnsSxaOmi58rXX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733318969; c=relaxed/simple;
	bh=vvfSJXD1QLbIxSKWu4kD1uXWg+pdf513aDEjaw3dn0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7pyMX/IdTmAtfbOAqd2FxqZfYn6jlKKrjw5szkO2sNDBbsQkvyXXR+iCfkIWjNnSokwrWxWhjOYRjwz5rEfF4pziFb6d9ZU5xg28UxfDVQNEfrEFb36V0M417+hSbDGUbliscOHYaNhbo2EnBDFweY/haYi3/hTkIqVJP7BY48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=W9rw/ASP; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="W9rw/ASP"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7fcc00285a9so3555888a12.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Dec 2024 05:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733318967; x=1733923767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5eCwjaPflYmsIiNiheuZuYlYJACZE2xQXVC0Eo/Asg=;
        b=W9rw/ASPg56NfIkWkHV9ZXSsrYwUa5QKkd9ZlLNTkoH8j93zgjVp4dUPlciND/+HtO
         ulOGlJCcwCRjJVfEfb4xK9RO7ONlmoVQtmUKf5svDfCPWQMMikoCJclcq+S4XIFsPZdt
         dFUf/HkTVo4ZAeF8uPvgf72CbfJE6UgudHiAKFaL0t08KokCSieDzJPtEKkJXxQbajHS
         HiFOlZ7jBWvaR5dPUlEeFgEhwIlCb15o7rarGuxAolpCitSTVFhSUOv3RlNEV0IbgzqY
         ssXL97dvt1vCNc2AHN9G04fmRbF4UfnXo85uEALeg2p14mfntx9859R3VBdYB658/HOW
         ArXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733318967; x=1733923767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5eCwjaPflYmsIiNiheuZuYlYJACZE2xQXVC0Eo/Asg=;
        b=tqAZOukZTcb5Fn9Mu4IkabFAGGEIFNyCVwH9qLPXmBpEUXrWIo8yQe3qnvIks7VLhT
         JiEuVEg0KwnnJcX1Q/Jf+FmHozDF9NkmaNJBVGSdM3CCYYYpiIydLM8eUYHY7Sf6g/2T
         ZmMK7xlyH6WWb7WETWznBVv5LlP12muhjgzp/BGwYWcMqFPbQgu4k0hCaJlia7IjzMup
         g6deRRipM3wNsS/eH360T0C69U0kmRit/YocCNXWIH2uuj9pvp94PlM4kirYCMO+rOh1
         sDJjJCv0fkOqMekolG+k8nJlgCpXL8Ngy2335gTx0wsYNyJWWxHHHck6m4eKR2RrZOSr
         5bSw==
X-Gm-Message-State: AOJu0YxT9u7k7IzDq9VanwmEAZ8NMf0xYNMeTAvWKxRyeT5NpT+7nCyu
	FgaXS8DIZbwlXbuiZ9ZI48vNQEvdsXi++g96tt79yv13sjwC7EddZmfLBAEzNQ==
X-Gm-Gg: ASbGncuta4eUhbBiq+0jstOMrEoKfsf7BvuZuAlz/FVLncLcEUFNuIhIa93DXIROYVA
	4IryriJyATm/KwVlFiY4O/y814FDTXfJoFhEYSkIHWxQ9IpGSEX0PpV+6VLDVZF5oAvfjl7ukE5
	aCZImz14w2hVUaXPT6vefPT19sk17UlOh1fjC/3ndUxiRAw0/l+mZTRO+OqEtzroBiOgVjJRwQn
	DHzXvyrtme6aR6RghI/2kPtn1R6wPIz3Tqn8L8DoYe3SBnAHT35Cs6aVg==
X-Google-Smtp-Source: AGHT+IEGmLXGt6F+utjBbFxTdc+54//qColATnXNgmj2lcHJdgKbmOOFzlTUnDzBpA24pFMsNTF4vg==
X-Received: by 2002:a05:6a21:78a0:b0:1d9:1af6:94ba with SMTP id adf61e73a8af0-1e1653bb668mr8860190637.14.1733318967055;
        Wed, 04 Dec 2024 05:29:27 -0800 (PST)
Received: from [172.16.117.191] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254184943csm12292953b3a.191.2024.12.04.05.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 05:29:26 -0800 (PST)
Message-ID: <c913e957-1dfd-4d81-948f-a93d1dd16249@beagleboard.org>
Date: Wed, 4 Dec 2024 18:59:20 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add capability to append to property
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/24 15:24, Ayush Singh wrote:
> Allow appending values to a property instead of overriding the previous
> values of property.
> 
> Currently, we have /delete-node/ and /delete-property/, but lack
> /append-property/. Hence we end up having to repeat all existing values
> when appending to a property (e.g. see [1] appending to clocks from
> [2]).
> 
> This functionality is also important for creating a device tree based
> implementation to support different types of addon-boards such as
> mikroBUS, Grove [3], etc.
> 
> In practice, it looks as follows:
> 
> ```
> dts-v1/;
> 
> / {
> 	str-prop = "0";
> };
> 
> / {
> 	/append-property/ str-prop = "1";
> };
> ```
> 
> Open items
> - Appending to non-existent property:
> 
>    I think it is better to create a new property if the property does not
>    exist instead of giving an error.
>    If the default is an error, then the condition, "create a property if
>    it does not exist, else append" cannot be expressed. I think this
>    behaviour is desirable with more complex overlays required for
>    supporting addon boards using devicetree.
> 
> [3] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
> [2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts#L39
> [1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L3334
> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> 
> ---
> Changes in v3:
> - Add support for annotations. Works similar to nodes (since they
>    already append by default).
> - Link to v2: https://lore.kernel.org/r/20240830-append-v2-0-ec1e03f110ad@beagleboard.org
> 
> Changes in v2:
> - Add comment for append struct member.
> - Small code improvements
> - Improve test
> - Link to v1: https://lore.kernel.org/r/20240827-append-v1-0-d7a126ef1be3@beagleboard.org
> 
> ---
> Ayush Singh (2):
>        dtc: Add /append-property/
>        tests: Add test for append-property
> 
>   dtc-lexer.l           |  7 +++++++
>   dtc-parser.y          |  6 ++++++
>   dtc.h                 |  5 +++++
>   livetree.c            | 36 +++++++++++++++++++++++++++++-------
>   tests/append_prop.dts | 21 +++++++++++++++++++++
>   tests/run_tests.sh    |  7 +++++++
>   6 files changed, 75 insertions(+), 7 deletions(-)
> ---
> base-commit: 99031e3a4a6e479466ae795790b44727434ca27d
> change-id: 20240827-append-f614fe3261f9
> 
> Best regards,

cc David Gibson <david@gibson.dropbear.id.au>

Sorry, forgot to tag you in this patch as well.


Ayush Singh
