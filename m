Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EC414293
	for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731769673; cv=none; b=r2iWKK5Lsl2vl+wOg5URWMHCCZJI7NfwnRHJhtVZZdCl2RWgVOh+RWDhsf6k8ruCLDF0m4ZsORUarstQ59ADHSKLQX9ejqmenSxotK7VZzEQCsyKQWFsjzcpM3O0asFfATcturwQCdEmlm0ZhhenucZZtoTdV5wmN2TD3F1Wisg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731769673; c=relaxed/simple;
	bh=odSJ8koj0HEND3ytI/gpSN/fVC4xRUgA4kxCBsApd00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoODXWF6WCiler1jYDHHsj6mfFu0CAZm2d59321Quz5+qMrpLLeKScDfpyIFCAUUV/wcVq49bIAnmNTcQr4tf4ZxgpEUrmxrC/pm8jOfItUnN5wG0YMbZoSMFDUU4YWcQ7fRCKliWXE6Pgyi/aHuFlHSQB2gug2479mRghZQ2Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=T9/+kwdX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="T9/+kwdX"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c803787abso22983235ad.0
        for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 07:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731769671; x=1732374471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sp/pYfKZWNuVepAyqaPjd3zrRdmrsXxh/rarEkFdwGM=;
        b=T9/+kwdXzed5RGYM1l3HQCHwxFQuhCfDgr4ZO8P6cQ9MeNfUv69/7Zhn2FBlvQ+6lB
         bJkaFpwbe73EJm3LsIM/FKatNfpcjbZnPOqivqPkDGhC7M4ziLPsroxlJk79X7kZ3mvc
         uqNwQ8usXGYrcKo4jIJCQnq2oNS8p/2MUWYpwhd5EMlGmUW258TWe+q9spRBjNyezKd4
         ltDkNgXsTBIihfVC8aetYJLd/LpxnLMc8iCJNlcmsBOtOwW3QvIlNvFmzfm8+vv9dwGL
         9BirXySgnmLXlGexjqOL9rgINZPaRQKZwyEgsdCGE/pN3qzj39IlTtXcRMVNSuR6nauS
         5dQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731769671; x=1732374471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sp/pYfKZWNuVepAyqaPjd3zrRdmrsXxh/rarEkFdwGM=;
        b=EL9bdXsPzp2to9CC3lvemsf14XRn7Wk7ljZeNercEZamPJSLjlj25k5zulzVz+nQDo
         4/MDMbbyFH8KCrecejVgvpPBbqRwNykqgNbWD4Z47WqFid8t/xCU7D9B9hszuU3SED1d
         2iljKSvaR9BaEAJ0D+RgHn6jA1dkBSS1vCKZMvt+n2Jkrw9uoR2r0rvbub8qR/u7r73p
         LMgq8TXVmVuH0d5RF45N0dD/WLUnFgm80G8f698SxUlFdgLmQYJq4oUUDvyHw6WMNiAE
         NBiRQ52FyhI9M7eaM0njwcE/OVuxl0iqVK6gcm4Gnh2gHEc6yJWh7XzHY3zd4CRvwwAa
         BkeA==
X-Gm-Message-State: AOJu0YwQsoNQREgqLCluUZg10FQ1bVhSUCog8aPG8+JQvU30cTx7SgK7
	IDlLVLrtHnJtV0gckCX8ctOM8dTpK14dcy10kiCyh+gINl1QNpAeNFJEzC4gtA==
X-Google-Smtp-Source: AGHT+IH2gq9Sk3RKCzL5TnVLWcKUZE/B3NlECEwKxI5CgJbBkbCB7hJIuZbq4p+05W6iQjESxhKDvw==
X-Received: by 2002:a17:903:2282:b0:20c:7196:a1e9 with SMTP id d9443c01a7336-211d06f44acmr111040185ad.13.1731769671123;
        Sat, 16 Nov 2024 07:07:51 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f44503sm28943345ad.170.2024.11.16.07.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:07:50 -0800 (PST)
Message-ID: <6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org>
Date: Sat, 16 Nov 2024 20:37:42 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add support for resolving path references in overlays
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/24 20:30, Ayush Singh wrote:

> dts allows references both in integer context:
> 	foo = <&bar>;
> in which case it resolves to a phandle, but also in string/bytestring
> context:
> 	foo = &bar;
> In which case it resolves to a path.
>
> Runtime overlays, only support the former, but not the latter. The
> following patch attempts to solve this asymmetry.
>
> Additionally, `__symbols__` does not support phandles, which
> makes overlays modifying `__symbols__` rather limiting. More context
> regarding this patch can be found here[0].
>
> Implementation
> **************
>
> Overlay
> =======
>
> Properties to path references in overlays are left empty in the compiled
> binary blob. Only `__fixups__` entry is generated for such properties.
> This makes it simple to distinguish between phandles and paths when
> applying the overlay (and also makes overlays small).
>
> Application
> ===========
>
> I have divided the overlay application into 2 stages.
>
> 1. Overlay prepare (`fdt_overlay_prepare`)
>
> This step prepares the overlay for merging with the base device tree. In
> At this stage, the base device tree is passed as read-only and only the
> overlay is modified and resized.
>
> Additionally, since any resizing will invalidate the offsets and
> property references, I am creating a read-only copy of the table while
> resolving the path references.
>
> 2. Overlay application (`fdt_overlay_apply`)
>
> Performs the actual merging to base tree. The overlay is read-only at this
> stage.
>
> Limitations
> ***********
>
> 1. Local Path references
>
> Currently, this patch series only implements path references to base
> devicetree. This means local path references are still broken. I am
> working on adding support for that using `__local_fixups__` but it is
> not ready yet.
>
> 2. Breaking change for utilities
>
> This is a breaking change for any utilities using `fdt_overlay_apply`
> since I have moved some of it's functionality to `fdt_overlay_prepare`.
> Not really sure how important this is.
>
> If it is not desirable, I do have 2 ways to avoid it.
>
>    a. Just expand both overlay and base device tree when `FDT_ERR_NOSPACE`
>       is returned. A bit wasteful, but probably not a big deal.
>
>    b. Add new error variant `FDT_ERR_OVERLAY_NOSPACE`.
>
> Alternatives
> ************
>
> Some alternative approaches that were considered:
>
> 1. Using aliases.
>
> Currently, it is not possible to update aliases in device tree overlays.
> I sent a patch a few weeks ago to add this support [1]. However, as was
> outlined by Rob, this can break existing drivers that used the unused
> indexes for devices not present in the aliases list.
>
> 2. Add support for phandles in `__symbols__`
>
> This has been discussed in the following patch series [2]. However,
> since there is no way to distinguish between strings and phandles in
> devicetree (everything is bytestring), the type guessing is awkward.
>
> [0]: https://lore.kernel.org/devicetree-compiler/44bfc9b3-8282-4cc7-8d9a-7292cac663ef@ti.com/T/#mf0f6ae4db0848f725ec6e2fb625291fa0d4eec71
> [1]: https://lore.kernel.org/all/20241110-of-alias-v2-0-16da9844a93e@beagleboard.org/T/#t
> [2]: https://lore.kernel.org/devicetree-compiler/44bfc9b3-8282-4cc7-8d9a-7292cac663ef@ti.com/T/#mbbc181b0ef394b85b76b2024d7e209ebe70f7003
>
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>
> ---
> Ayush Singh (5):
>        dtc: Allow path fixups in overlays
>        libfdt: Add namelen variants for setprop
>        fdtoverlay: Implement resolving path references
>        tests: Fix overlay tests
>        tests: Add path tests for overlay
>
>   checks.c                                |   6 +-
>   fdtoverlay.c                            |  34 +++++--
>   libfdt/fdt_overlay.c                    | 174 +++++++++++++++++++-------------
>   libfdt/fdt_rw.c                         |  19 ++++
>   libfdt/libfdt.h                         |  93 ++++++++++++++++-
>   libfdt/version.lds                      |   1 +
>   livetree.c                              |  19 +++-
>   tests/overlay.c                         |   1 +
>   tests/overlay_bad_fixup.c               |   2 +-
>   tests/overlay_overlay.dts               |  11 ++
>   tests/overlay_overlay_manual_fixups.dts |  26 ++++-
>   tests/overlay_overlay_nosugar.dts       |  19 ++++
>   util.h                                  |   1 +
>   13 files changed, 321 insertions(+), 85 deletions(-)
> ---
> base-commit: 2d10aa2afe35527728db30b35ec491ecb6959e5c
> change-id: 20241114-overlay-path-d9980477f76a
>
> Best regards,


cc David Gibson <david@gibson.dropbear.id.au>


Sorry for missing the maintainer of dtc and fdt in the initial patches.


Ayush Singh

