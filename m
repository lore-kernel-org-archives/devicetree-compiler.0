Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20868D515
	for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731769255; cv=none; b=WlRxUNXynLLKuyxSCqTh3s8S25SFUkt5LW84ki1ZMxo8acd23woabUvA1GqRhiLEMB/Szuc6P0WOhxIB+n9sUCIKUTtc2qykI8E/Qfx/sJg1qePGJxPa1KbnR0hdpNDM7dnThLKMNbrTp6GAQ8dSE/eC//oEPLEAQ2VedPsrKbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731769255; c=relaxed/simple;
	bh=YUeuiobWKf8ZxTvy8nIX8Ja48VjtCe1gamRjiXem8EI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jm0D8cjdvklSUqj4u9hHHrTJ8YbX03zQb+J7kQGw8235xZp6ZnBSBawIqk6LLh4lsHdzdRvhTlmhXBrNW9WYHQUtY3l8QtL8mJIA16A6tZzo9YdW1FshvUyhV/t29zy1Kth2biWkzir+GlSW57xa+Pwom2g48wWr+5LwauotpW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=fb+vc8VV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="fb+vc8VV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20ce5e3b116so3851415ad.1
        for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 07:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731769253; x=1732374053; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OxZeK73kxLOTzaU2KuUdhWwLav718TmZP6cLuWoddbE=;
        b=fb+vc8VVuxCDXIQTB6MxLajcsKISCb+RDJZA2S8B/u0G8LGmq2WuI0j06pLWwzZI82
         0l08bRIqcNmZv1yGfZd6c0WKR3jpX8FGDzFahc4J7U/7rQKgM4a4esDjwtAfH83Rn+S9
         vUtUjqmQhY2lrXz/ifrnhbjRIyp/7BlbRE5O2EQwgI/16eE89bRSM/Gzll84BnxQRnAt
         CvOcoDmTixMt3aWpS/9V4UscLeBJpwisRENvQ758MGYn0Mcc/8S4YuUKS9BBNOyJJuiP
         AjNbK3B3yBJcsW4XhmJ8WjoVM0f5KQ8koCk6/hMn73Hjo6LDIMe4cw2JzgJSUeE6RY90
         4KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731769253; x=1732374053;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxZeK73kxLOTzaU2KuUdhWwLav718TmZP6cLuWoddbE=;
        b=wF01Vc9Ihl6jqSS9n/NSsGTVSjH6AYhI5DLh3ui2BW/izATjq6kXGNku2c732Dan1q
         P9X3s/XzZoHDMpT7x2u9njp0jnk3lKQMnBYryD/bzw35u4S/XUkh8VgrX4SiCzpr8g2k
         eNJPM4b4NDLeXWelY7bzugvftqave91FiXFHDHrXyaKlT6jUqMF/ENxmqrC0JGecPzuq
         iRuQO0JvS/FehyqXHOZ2yFzWMTVwukB78dgZLOLOma16Yms8hfvF6zXmKIVEajfLm9Ow
         LSbPlMnW/TNfHyb76nvVS3bU8mliDQosG2aA3zanslP+ZoBx4oGWf1waj7aEpmZW5hY5
         Xwtw==
X-Gm-Message-State: AOJu0Yx7lGJJAyGfLmJuiELLlHPxZLwQQsCoS9nAwmHTnEAZ10NpNKe4
	SN80k9KYbM2ZAcbNWTXl6paxk0VOYKwgx5b38YprdWXmhn9pNfb/Qt1om3WI2A==
X-Google-Smtp-Source: AGHT+IH9hC60ajkh6ov7pKkKY5i1IXDivzIfpXZ44b3iGzlUfKUitCH855/lObA5wh93QOqqpnnJyw==
X-Received: by 2002:a17:902:cecc:b0:20f:c292:6662 with SMTP id d9443c01a7336-211d0ed22aamr83237195ad.51.1731769253353;
        Sat, 16 Nov 2024 07:00:53 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f4694bsm28492305ad.196.2024.11.16.07.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 07:00:52 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH 0/5] Add support for resolving path references in overlays
Date: Sat, 16 Nov 2024 20:30:18 +0530
Message-Id: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKzOGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0MT3fyy1KKcxErdgsSSDN0US0sLAxNz8zRzs0QloJaCotS0zAqwcdG
 xtbUAQJLaLV4AAAA=
X-Change-ID: 20241114-overlay-path-d9980477f76a
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4450; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=YUeuiobWKf8ZxTvy8nIX8Ja48VjtCe1gamRjiXem8EI=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnOLOg7D3S2ST94U/Kwbo7nrgfCVwajNTKI4pga
 T7sLem8EyCJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZzizoAAKCRAFzvXHieVa
 dN9bD/9bgJ2ursmhHRYj6VmdSz7GpuIZEkDaYauvgZrQ6N86HL0FSzZdcR4ixKveLWU7nwcYcSU
 rPzyViNyk2qsNfEMzGejaHr9DRSIIw2fQtn58X/uFLq/ctr+TVTajSnBwgfHAbC3JogYU/0YdGE
 EsbW7BwfAYZ+jF7Uwdf1ekVNu9j2lKDsEsp0PryMvynHu3EQSbGOueAqI7B4U/81pYCQUw9yLpa
 H/nk0OqFF0tu2WFm0ApC7lXu5BsRkh8vfi/S7lSp6C9vKkICeHsG4SMy8cBAjc4yaC6lZiA/Xml
 gWK7598qKL/EJsYFbWVycLLu762h+UEfO3mrKFwV37eeWYqIEjGUKXTOitOIXuFaWkFP5ntI/6d
 37l5STV4KU4KA/SI/K2EwqQAV+yVCgZumYYs+5Q1gVjEAJyO0qCbmv6evK9puBjMVUU3jIT59nk
 8+FDe84X+cgMSXdEPbMRw/wZcE7hZQRz0BG5CSjGuyywvNNhw568c/dQt96joIW62jz9+xEhNld
 KMnfVE7z4zWCnLbCDWsc3Nz8jnz+MKR1C30Ym+wS2nGbudcmlb52+17xtOGXpu/CqLKXfbvC30p
 geHrJG5msYQ5KcdCqnlln+0efGXGcYYUPyMyWKH6CLjIiIgLN+4fpGHvSpnh8VaktTjY03WdCcF
 gjeuEufqGaNg0rA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

dts allows references both in integer context:
	foo = <&bar>;
in which case it resolves to a phandle, but also in string/bytestring
context:
	foo = &bar;
In which case it resolves to a path.

Runtime overlays, only support the former, but not the latter. The
following patch attempts to solve this asymmetry.

Additionally, `__symbols__` does not support phandles, which
makes overlays modifying `__symbols__` rather limiting. More context
regarding this patch can be found here[0].

Implementation
**************

Overlay
=======

Properties to path references in overlays are left empty in the compiled
binary blob. Only `__fixups__` entry is generated for such properties.
This makes it simple to distinguish between phandles and paths when
applying the overlay (and also makes overlays small).

Application
===========

I have divided the overlay application into 2 stages.

1. Overlay prepare (`fdt_overlay_prepare`)

This step prepares the overlay for merging with the base device tree. In
At this stage, the base device tree is passed as read-only and only the
overlay is modified and resized.

Additionally, since any resizing will invalidate the offsets and
property references, I am creating a read-only copy of the table while
resolving the path references.

2. Overlay application (`fdt_overlay_apply`)

Performs the actual merging to base tree. The overlay is read-only at this
stage.

Limitations
***********

1. Local Path references

Currently, this patch series only implements path references to base
devicetree. This means local path references are still broken. I am
working on adding support for that using `__local_fixups__` but it is
not ready yet.

2. Breaking change for utilities

This is a breaking change for any utilities using `fdt_overlay_apply`
since I have moved some of it's functionality to `fdt_overlay_prepare`.
Not really sure how important this is.

If it is not desirable, I do have 2 ways to avoid it.

  a. Just expand both overlay and base device tree when `FDT_ERR_NOSPACE`
     is returned. A bit wasteful, but probably not a big deal.

  b. Add new error variant `FDT_ERR_OVERLAY_NOSPACE`.

Alternatives
************

Some alternative approaches that were considered:

1. Using aliases.

Currently, it is not possible to update aliases in device tree overlays.
I sent a patch a few weeks ago to add this support [1]. However, as was
outlined by Rob, this can break existing drivers that used the unused
indexes for devices not present in the aliases list.

2. Add support for phandles in `__symbols__`

This has been discussed in the following patch series [2]. However,
since there is no way to distinguish between strings and phandles in
devicetree (everything is bytestring), the type guessing is awkward.

[0]: https://lore.kernel.org/devicetree-compiler/44bfc9b3-8282-4cc7-8d9a-7292cac663ef@ti.com/T/#mf0f6ae4db0848f725ec6e2fb625291fa0d4eec71
[1]: https://lore.kernel.org/all/20241110-of-alias-v2-0-16da9844a93e@beagleboard.org/T/#t
[2]: https://lore.kernel.org/devicetree-compiler/44bfc9b3-8282-4cc7-8d9a-7292cac663ef@ti.com/T/#mbbc181b0ef394b85b76b2024d7e209ebe70f7003

Signed-off-by: Ayush Singh <ayush@beagleboard.org>

---
Ayush Singh (5):
      dtc: Allow path fixups in overlays
      libfdt: Add namelen variants for setprop
      fdtoverlay: Implement resolving path references
      tests: Fix overlay tests
      tests: Add path tests for overlay

 checks.c                                |   6 +-
 fdtoverlay.c                            |  34 +++++--
 libfdt/fdt_overlay.c                    | 174 +++++++++++++++++++-------------
 libfdt/fdt_rw.c                         |  19 ++++
 libfdt/libfdt.h                         |  93 ++++++++++++++++-
 libfdt/version.lds                      |   1 +
 livetree.c                              |  19 +++-
 tests/overlay.c                         |   1 +
 tests/overlay_bad_fixup.c               |   2 +-
 tests/overlay_overlay.dts               |  11 ++
 tests/overlay_overlay_manual_fixups.dts |  26 ++++-
 tests/overlay_overlay_nosugar.dts       |  19 ++++
 util.h                                  |   1 +
 13 files changed, 321 insertions(+), 85 deletions(-)
---
base-commit: 2d10aa2afe35527728db30b35ec491ecb6959e5c
change-id: 20241114-overlay-path-d9980477f76a

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

