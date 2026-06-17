Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09DD1DE4F1
	for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jun 2026 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781739352; cv=none; b=NEdzqx9wsGZsOO0ZFKtTgKxCLHwamK3hyntsB5yeBlw3/xsa1Ho1BJQQ3LNcfzhJHg3NhrpivUT3kA5INJ0WWN+YSlRaaA3Sd1DKRIZJw75PV7Z9wJnRl0j8r/KpjLjtxKGMSThsynA7QI9vGogU4XgQPeAzRdeHWBoB6RWMHY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781739352; c=relaxed/simple;
	bh=uNwpDB15j6Q+/GQUCaKN7z60il0lDDiCMPMtUQaP9lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYCcJxJpVkQeBt4u9Y72Q1IyQ7QdKM0Inkt8QCwXVtn9z8opiKTd3KZUkS/SHC8K+8CQ1bCwfX0/EmKjJ4K31VQcsuPKW7Ao3W9kSa+UIhvbMtN0uxPxtAN9ssXvYXneb8pBBqGatdd/sCEe22qpbhHJ8ftL7j0SkfctHzpKW2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QxmDUvV/; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QxmDUvV/"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1384ebe7a10so745824c88.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jun 2026 16:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781739350; x=1782344150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uNwpDB15j6Q+/GQUCaKN7z60il0lDDiCMPMtUQaP9lY=;
        b=QxmDUvV/QI/+fdpZxNYu89/XOhkIDA0u7MjBat7OLJL4D1Ohfm1PJH3cH3YCDxRw1F
         KPSJCRwmCLHpKJEuF8KqhWpERzkuILyO9OVXTfqDDCuFhTSZCHIcgaw1DyElg35DzrNO
         G2Plli/KsZzXm8vrxr2Jwt8LlQ2JeWdzrh868=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781739350; x=1782344150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNwpDB15j6Q+/GQUCaKN7z60il0lDDiCMPMtUQaP9lY=;
        b=LK11EsvTm6nsZfCFOVvU+7HDapQDZmp22vurf+QSaQu8GKRu8M3UlvMLcH4vIVgd5G
         yWN8AzX9uSG9Hgglp2CfV+U5/0rRgIz+HA2C2/4EvsNRJnWX92lAChv5VAPOAQny1UWI
         XDJe0xUo8/iylTbFGcrxo7iAirKf2zLjtuamzIf2WfL+aWbhwWi2+1PpK95aRz5cZXyC
         CexAw+wqTjiRcXkM+0uT853eB7EqRh8RRpgfC9M/8gfjQtnzqx+reaBZUDvsDH3zv98Y
         Pdv529KPKhHGvep1RE3xlk+ljmxsHh5idZpbUH/pjLrON8g7A3vMmv5Ds99yYh4fTFEt
         hwfQ==
X-Gm-Message-State: AOJu0Yzj+cW/5dAs/SN84vcfgf9huxhUtj9BXKlEHdSFKUIm3hCqw6GV
	+TFPkVTtw92nFGz1nCeOcPcFwoqygtLEKHwCo1ulQhaqLmZ5DWk1B4Ct0fARKZTv7A==
X-Gm-Gg: Acq92OGo7GWE4kfuJYj5e7BGiv94UrFhcj0U9wTYIWAC3HBtXlbVDFbdgqa4n6aMAV8
	aVF0gNSvu1FWWI+V5HHACMWlHSrmMMIfrYvizlMry0JavqOn1lazmlEv+DUVqUH4OfXqoMYeMvz
	7fFcwwrUSaoU962+mUat3RjNdALvZbOidQQpi0dGT+Lp65aceTcSN2hqvMu044NQrVSafZf8mnk
	GBQhOQQMc9+lv0QKC5l/jzw6wTvh1NVhD1KYV9pU9ttJQ+6R4haBctM17KusosuMitros9LTPSk
	1Z6dNue9hlfIGPrbbNffxT+u6noqAeImNXjtHLMHtE1Xxgf03VS4wEoeo7enUA7L7xz1WLwcaAP
	6gsTLeJw9KIFD1Ua7J0gwloFpcPwjHxPVke3NV014zTL94bMvDrkr+4gWYUIpFWv5G4NW1xWmdU
	HpVotYa8i2weR1+orC+jc7pcxt8nkIJLtwfP1hS5nJs4eMY7oUp9c=
X-Received: by 2002:a05:7022:fe05:b0:137:f58c:3cb5 with SMTP id a92af1059eb24-1398f6dd9dcmr3276074c88.26.1781739349869;
        Wed, 17 Jun 2026 16:35:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:2a7e:b696:e1bd:476c])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3081ea43b80sm22814315eec.21.2026.06.17.16.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 16:35:49 -0700 (PDT)
Date: Wed, 17 Jun 2026 16:35:47 -0700
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Avoid warnings for reg override in __overlay__
Message-ID: <ajMvU-U-cdnlXykM@google.com>
References: <20260617204401.2275738-1-briannorris@chromium.org>
 <CAL_Jsq++ERWJ19BcVXHKTzq1PN7tpJm=rm6e08UCH_gcp6ncHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq++ERWJ19BcVXHKTzq1PN7tpJm=rm6e08UCH_gcp6ncHg@mail.gmail.com>

Hi Rob,

On Wed, Jun 17, 2026 at 05:54:42PM -0500, Rob Herring wrote:
> I would argue (and did the last time this came up IIRC) the overlay

I gave a quick look for prior art, but didn't go far enough. I see this
was a similar conversation:

[PATCH v2] checks: Suppress warnings on overlay fragments
https://lore.kernel.org/all/20230308091539.11178-1-qun-wei.lin@mediatek.com/

I don't think it had a satisfying conclusion though.

> should target the parent node instead and then you can put in
> #address-cells and #size-cells in the overlay to make it pass checks
> (and make 'reg' parsable without applying the overlay).

This implies we can't actually target the appropriate node via phandle
any more, and so we lose the ergonomics that phandles provide. Where
previouly an overlay could be resilient to node renaming and other sorts
of incompatibilities between a dtb and a dtbo (the overlay wouldn't
apply if &foo isn't found), now we'd have to open-code the node name and
maybe even its parent node name in the overlay. If either of those were
wrong ... we wouldn't notice at all, unless there's an obvious
functional breakage as a result.

I acknowledge that it's difficult to parse and validate dtbos when they
are low on context. But I don't see why we should emit false warnings
for the possibly-correct, and more ergnomic approach.

Brian
