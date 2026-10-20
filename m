Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510657;
	b=bRCCuppRKIMUFhmqYr1St9zV2Bi8nqDHiCBXjeg2CvEalPWVGxw05rb3vfbbv2J6t85F
	 JGECS0ptRVrhDARMIsahNWxzGIkyQ4hM7iwJOqNaqlMVTjWopXQQAYOpgmhq0arqj/RVs
	 E+QtE/5zIFvRjdz4z5DNTLQbDP2kxqjpth8nr/zWC8YDTiMiazRwxa3fdgejaKs0/OR9Q
	 k7MLteQ9Z5RffSIw/GVFlm9oGyMbilcOudZF97q/8Cfcj3Xnmf+gP5DCMDd8yeju+et+0
	 vQ1umMw915ap2Y/7PIbSFbfScnIK0/uf9A/kL7jPUl5z/Zs3mCSD6a2DLSt/0NOQvqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
	b=septekpBAkaYKYhByyNU+7o3sAeXQ5xHzCFi0a1QJWpngYbRS5qTqX+WdFcoFxTFhL8T
	 2rkB135AexjTPn53f/rVpclNsBrNTVh1oPWBA/jq+yrd+qjI1dXwo1couCKqnXE3rg1bx
	 nPR/DQQZkQaq7+pr/7JL0ebAcoZTR9J24/EhtwUYNRSVwC47BYr/Er4xOGcnnoaHIgjN3
	 Z+xyYJ+f6G0mJ3/jeogLZku18EBbjS/BwITHQzsFdZGg/uTVIabVfMkS+VTTu7y2TJDsA
	 jimFcDlrVvGd/oChp7338iXgMJgXMLHrZiPGizULdB45j5iOUPFVIlXBrapUnNpxvJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEWFjXdY;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6B160A3826
	for <Devicetree-compiler@vger.kernel.org>; Tue, 20 Oct 2026 15:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6B160A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEWFjXdY
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-366421dc8ebso1152810eec.1
        for <Devicetree-compiler@vger.kernel.org>; Tue, 20 Oct 2026 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510656; x=1793115456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=IEWFjXdYPvHf1GX8A4uK2ABfWGSlVp/WQdtFWAFPb9xPpTeDY0wm5hQzqHNR0CGNyG
         gw52LIeiYhC9IHIn6FIdkvW2vBm4vC3ehHqZJblz1xfrlYYx/RYysnM2pQ/Y4+etxin0
         IzpXTkMh6gCy2nqoHlR5KxsNg1/pU5B6tIaMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510656; x=1793115456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=B5GUbxmRcFLRT0vU8Qs6wnbu3ehDVitIwyQmV4my3O1pnrClckX4qSQ1GHOKD+4zLR
         6++NT8NE/6XngZ3/UqxPQf6V6BAaJSYIsTESzZCNKPeg9yv1VXqwl5rdCCBU+SmOelZp
         VqTFywyoPLorvBhCvMcd6I577IS2a2ENZGC3Pn+te/1EOVi9Fmua2GDbhUc9UyWp42qE
         BVSNCT6HcfIpkjYfZvbe7oz7rfy+wXl43TfTd+qfSOO3DF58dc+VIpI4WI6oNEQ5vS5X
         e0ciWYar+ulTq+t3+Ywx/DnvnWAn9nLrvsi00MdmfXw6KVm50m6zyamvvjxhUcejVLPO
         dZnA==
X-Gm-Message-State: AFq9FYJjwwcT3zbnddrXDonzM8wOjIUDzqBILZlFK0Om3n0hasxrVdvo
	0m8FJWlXGDRvZciSkmhsY7D1WdeF898eqbz3aMOs4ndYE/Q8+pbz3sLejnworYWjNhTN7O4rjjo
	Qdeafcg==
X-Gm-Gg: AYBFou2865voMq5akNFByJmu16dWRq7z3bHX7H+o63Mzf3+kuY1oF11rTR8sR0mLyja
	8pQdBGbFlQjcZit3cQg1VEmjqYiD+Q2gR9Cs8BnHKS+aH6o63Rt6L0h4UjSioVvK7LhyieksJ/U
	524xM/xq+XKQmag8SofPRxT/LQ6QdyltJhR0qV3N1AR662NNNTRoBi10P/xm5GMisRsiuJ3eEts
	a41V5dZxo5V2PlXYSYa9Afkcen5lOZdMRi2FTb5YVwqN0YXfLuXwA3HYfJRU7Z/Q4/sWUCZ4ozS
	TYpCal8gRGtpVDDPXW7GYbyvwmnz505b1u8fY3K0HoZlCXdGP+DdfabxHr9y4YbCWqA0zZQCzgL
	pxENdg06QrIrbQgmh23c2+DK308Yk9x/wZKJOgT66cjbCk7IG6GBFWCfPU6Ey7wfjWekgYiwQhm
	GGwlVJzSiGR1FOt8CVJm5+ZgX+quN3zF8K9dBIqOtwcqaZV8JiqMcgcz4xhbsxBnd46PjOtjI5X
	+f/B1dl39OTnb9ADRi6wZmEJSV0/yhw5n813bjLbimZUZpnTVav8MEdqww=
X-Received: by 2002:a05:7301:1408:b0:353:ba38:789d with SMTP id 5a478bee46e88-365f53e0019mr2964076eec.0.1792510655681;
        Tue, 20 Oct 2026 08:37:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
Date: Tue, 20 Oct 2026 08:35:21 -0700
Message-ID: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
`CONFIG_DTC` is enabled so Kbuild rules can query and update properties
in compiled device tree / FIT blobs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/.gitignore | 2 ++
 scripts/dtc/Makefile   | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/.gitignore b/scripts/dtc/.gitignore
index e0b5c1d2464a..24357adc8896 100644
--- a/scripts/dtc/.gitignore
+++ b/scripts/dtc/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /dtc
 /fdtoverlay
+/fdtget
+/fdtput
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index b47f4daa4515..6bce3542d8a9 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -2,7 +2,7 @@
 # scripts/dtc makefile
 
 # *** Also keep .gitignore in sync when changing ***
-hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay
+hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay fdtget fdtput
 hostprogs-always-$(CHECK_DTBS)		+= dtc
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
@@ -10,10 +10,12 @@ dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 
 # The upstream project builds libfdt as a separate library.  We are choosing to
-# instead directly link the libfdt object files into fdtoverlay.
+# instead directly link the libfdt object files into the host tools.
 libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
 libfdt		= $(addprefix libfdt/,$(libfdt-objs))
 fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
+fdtget-objs	:= $(libfdt) fdtget.o util.o
+fdtput-objs	:= $(libfdt) fdtput.o util.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(src)/libfdt
-- 
2.56.0.212.g129ede20d9-goog

