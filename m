Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6CC24A049
	for <devicetree-compiler@vger.kernel.org>; Wed, 10 Dec 2025 02:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765333212; cv=none; b=MoRetzOcFInsG5mpkQ4+tgKtfYdzvOPUJ3uUY0e3j38+BcMyCgrqOC++A0R949H3hxEMBy+yeM7Onf/b9hRiBvyeAaXaKwfFln/IiIq7J68AIpa84zugo4KvW49XFa32CPItqc6jm2Awc1J8V4rKiwAq9gIQoLJvM8YjvDOCaYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765333212; c=relaxed/simple;
	bh=HP6U/Ft46d48VSHSYo8fEmJPErx303qPPp3xUaox130=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Wi4R2POuc2bTSlA9faqS9PBatz1fUfVRCDjOGa/IfcCTsNhzb7fA4G6+9ctr1QLkb++9NFXBKLGcLAW3FSnY3037GeI1It+PpAzLRfzUYs39KvCIQu9GjvQKHRVqzSExH3M1L4CCbHWt7s0PO3V5lPhDXsoSQZ/M4aVBAg9y7Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=IlIFMcx9; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="IlIFMcx9"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-450b5338459so3804427b6e.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 09 Dec 2025 18:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1765333208; x=1765938008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yh1iCvGeYrg6wn7n2iZagydNVfSoHhiypbfPT3Iz2Ww=;
        b=IlIFMcx9uisgiDzfbTvcHlNSNQkMSQs8gyYnM0PYZF1SK+aESki4uK70URDtmCiPdN
         jLUzgd3tWECLiynQYWW4FVP4THPrcYPYkRChZ1P7Iqi/G+gY4zQoxWl185V8+pTPyEzG
         uXdRS7xRz/gvSh+2SFiFtjJzL4gd2J5VlAPSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765333208; x=1765938008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yh1iCvGeYrg6wn7n2iZagydNVfSoHhiypbfPT3Iz2Ww=;
        b=V9z+tlUPqI7/XT9r5Iz9HJIxi3+V9ziAJU0QIb2luQj6K/eWADgXbRljsd9100PQqY
         kFBWYaZn9ZwIRZgU2XNudBHd9UcRdbjbhRJkvHIc4yb7cpRwb9gRZWjLRelJ4vrjNZgv
         HDG+KtF+X5fgWFYXe+gnKuV8fy7xRVKjxFCXjesR/AlXGb2qZDeYf+ArA1ky/muIbnPb
         YFYjQOTQi8yie+2zoaH9b/jFZHNklmaOJzxvUzsHcD4mlcJiIYoIHh41cb40l2ar0cUv
         AyHwMKPydYStU7cTMgPjk+yfj2l6GD02bqwQsOHZ6HasUH733iobzpN867mNvHLMEswa
         eeCA==
X-Gm-Message-State: AOJu0Yx3fW5RC3dSyHSFXbftaGDZs2/ernfmzRvKKUAu+NC/QAgW+BpJ
	OnY0qSI8g5RDCJBqFPafw3764otNFikuo1jbe7hkOdB21hLqBtXgc8IMdEfZkjgNRJpIzAiKU2n
	2JnwDDkg=
X-Gm-Gg: ASbGncvu2HSiNEYuxbVQFT9uG1YcJeKc7C5PGGD7CfWiYtmVn5YDcZjXi6DA8lKWVr2
	vEIuAe1rwuFW/PvS1WPx6tnIxYPbleBZ3vgUmRz2509QF4SaF5UjwFRRwi2v673RyjgZUBd54ZF
	pc9JFQzKU9DWCn53w3NuVBbaNGthQP0wQECLK2/cIn4INe525+FGqopl0AQUX0LfUS1Bre6DF/1
	3x18To1pQmTnveMKQE0acuEZrKxvgD9JG2qlyYMsZIz2du0JrZk1krDklf0xtGLW8RNyXkbF147
	OeNm0HEPSlBxfAF6J1S19yCUFbpIJxPIoFXL80shKbq9pPdSDZsSvMA22CQTWy3DfqYI8VxpHEh
	+LyVIZj+qJg8kz/nKdfqs8ej19fj07fGoqIXzJlEqLnDhbYF5xIQIhRKuk24X2deh66JqlTu8XJ
	UXPJiRXUD1ugOTz9NEF2oOl2R+RTorC+UyF3h1uD2JGALjWd/0D4uE
X-Google-Smtp-Source: AGHT+IE1pi1ELb3YuzJIOD6orhpF97sz8tw8csxYBSUKAlptbb7xpYxo6RSQT7dHajXVugXMVdVvIA==
X-Received: by 2002:a05:6808:2210:b0:450:2854:405a with SMTP id 5614622812f47-45586702c7cmr718118b6e.45.1765333208589;
        Tue, 09 Dec 2025 18:20:08 -0800 (PST)
Received: from bill-the-cat.. (fixed-189-203-103-235.totalplay.net. [189.203.103.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45587ae2dbcsm386346b6e.13.2025.12.09.18.20.07
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 18:20:07 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 0/3] libfdt: A few more size improvements
Date: Tue,  9 Dec 2025 15:50:50 -0600
Message-ID: <20251210022002.3004223-1-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey all,

Over on the U-Boot list we're talking about re-syncing our copy of
libfdt with the Linux Kernel again (and so with upstream dtc)[1][2].
While we've worked out most of the size increase with the upgrade, there
are still a few places we can do more. This series is three patches. The
first patch fixes a comment from back when Simon was iterating on the
whole assume framework and one spot wasn't updated. The second patch
updates the FDT_RO_PROBE macro to optimize out quicker when we assume a
valid DTB and the third patch brings in one more assume check that
U-Boot has had for ages, but wasn't upstreamed. I did not see if there
was old discussion about it, but it's something U-Boot really needs.

The end result of this series, when applied on top of [2] and some other
fixes U-Boot itself needed is that our SPL size shrinks by 12 bytes on
aarch64 without LTO.

I've run a meson build and test cycle in dtc and everything continues to
pass. I've also thrown all of this through U-Boot and things are fine
there as well.

[1]: https://lore.kernel.org/u-boot/20251113122145.949112-1-marek.vasut+renesas@mailbox.org/
[2]: https://lore.kernel.org/u-boot/20251202193310.149861-1-marek.vasut+renesas@mailbox.org/
-- 
Tom

