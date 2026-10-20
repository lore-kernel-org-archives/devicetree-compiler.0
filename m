Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510669;
	b=drejrxLVdVLEwPfCsHIUqWzxMjlYuC3JKzw2iZ59S9kozR8VI7j61m64q+mzwK7BGmpe
	 a6fr5UZaZMoXjY7JS0pGKoiNcDOSTzZC+sfcjE+gBTp0gS5V9U5aFAR9FinVnpVmLVQwH
	 RSAy+5DW+TI5VQdxfQbo9VTpePb5G1oGxScNEtI8FQzlqRBggjbVPlNnA4mWbcAUVAqJ/
	 0O0ciQe1lz1oHX9NM9JelI5kvovOOtJeUgwVwgBMXD0nIbizHX9wZHCvZdwVhn5hQEsZ7
	 WBqF6flw2BZcmIn2780UAlBYAFLU4e0XXZAXxMMNpMDGP2lUgVBS5be0mxTEtmOIsbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=pEhsrPmovlqFhqyaT3oTm4Fh1ZVngCl2/NoPnSq3l5A=;
	b=I3Gjb9DUCLKS0T2aWZBAi9fgp0/nSrRxpAZO710fEA5JI0qINhlTNeBt9O6uTiiZ5T4+
	 hv2NCJYyKMRYeBcbIpoH0Mju8ctDpIk9MUZn/gB9b3+JGox2lPEHhe9MfbWDDC5GkjT0s
	 ueuAA90/GTGDJUFDcXg//3CXyV6SuKF1Nt80A8nQ2zW4bSGq+eE+n8b/trk670GTkVke9
	 WYtmia4ZSX3EKMnJKr1Hnpx4lO1/VlvegxAb2i3fIHR1PVHAHswpBLgq8CUh31s7T6Zji
	 ofpzT7uHhuluga/f2M2JkcwzgtfFKYftz/FZt4rl3u2TMM5XawDJ20gaf794ruVNMbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e2he3ntK;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465060A4AEF
	for <Devicetree-compiler@vger.kernel.org>; Tue, 20 Oct 2026 15:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7465060A4AEF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e2he3ntK
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-354ba08cfd1so6118728eec.1
        for <Devicetree-compiler@vger.kernel.org>; Tue, 20 Oct 2026 08:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510668; x=1793115468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pEhsrPmovlqFhqyaT3oTm4Fh1ZVngCl2/NoPnSq3l5A=;
        b=e2he3ntKMdsitxFNgYNDH2KDtjT8SdoDD7kf2YzzKijEjtZurMVzswa+aZbKNL5uGm
         17OTHiwqGo/Nxc6JdBmRcph0RqvrCYjNejHxlatn3WgJ6M8hKqqroMMwyHGrGOHpyEWm
         iz+o22iwugbB6vjf7oDOITU8ifXxFLZNx7C1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510668; x=1793115468;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEhsrPmovlqFhqyaT3oTm4Fh1ZVngCl2/NoPnSq3l5A=;
        b=2GUzhzzuL+KwLKHXeTsfi481IzxB4DUofMMdCRe6YNlWCdZkAlBP6PxfJbJBJ9sBCD
         z3rNgM8dZADreNqOp+S4FRHwFKwdGxBikBfcx4UAwquSHDu863R8qM+qEFBRJ3J8IbT4
         EJlF4dxLK11VKg011AdU7c1zcI1fG9el8OhLnKrhCE9U7GZJKbt6s07ZJzn5dmZlx+nS
         15oZf2uxx8uw43olBO630rACtdoBtwrf58fIobEly9fDp+WNnZMWnhjOdgoE2q0lW+Xr
         sXGpsf5Izbg4JKlwCkh+65HEQWk79n8MUqirL2V3z1KfKQTFtDHoPotTJZw4580tvK5M
         w75g==
X-Gm-Message-State: AFq9FYJPTBzz5gTkMkrtQZAq3GZk8yT4J1AZjyF+sQsINW5t8OcKUYz0
	TnOEjQS2xW+iPj71OL1naTUD81QRQPp+TUb51rwvO2ZdSmuI8kYOcjEeeAfnl9fNg1wHHHD7Oip
	vZV/XDA==
X-Gm-Gg: AYBFou2DNtn8rs0unBwyyhMRRUCnTOZegZRgLLi5ZZFsxlwT/067qZd7q/fG5uJnSD1
	2u52Q9E6vw8xBiwb/uH0Vxe9tXKRQZ1BpguN2j4/YAEOxtdM7jHCcsxRpsc7FN2ZdHQnCcLJ+5L
	yVYPfrZcZXZsQs8am1DU/SnX5Pohzlt0MoHyRIL4SbypzDGmnj/t/x4p4yk8lPeuK/r+T2guAgL
	Qxq8aGEXSSmdXhY+4vlEGPrnskMW+fT00wav7mWQzL6Re5b2NpoOj9uAtKIfxBHvw9/ZZUFeW1R
	ywzIT3Xl+LqMt7V2I1p3hytekKzF6GCjOCd1s5HgL5x/Mn1TucMBUz71ITz+RcDs+gfGO26IfTY
	tUMl/3fclIROBO81FrQiP/QEjOAhkNgUrwmVsRhwkRz43OPhjZr6kFk3BDy5VdP5PcJVyFPEyjy
	NaYXZoLPpRfdzQqpUQ1CEjr9YAMruu885smBoaDE8vmumZAhbCgxNvzPzmIAiRgn8rvGk4JQhuh
	TWs0iPn8uMdsYF9h0d4N0E7bHuewlx9wZ3+0j8UY2GR4dQe+FrWFBRhHptXpe0JI8yzDKwLHbZm
	a7JcPvwHsbm1MF8YsvbkOPL0HXs/SnII/87N7BFe
X-Received: by 2002:a05:7300:10d:b0:351:1e89:66ab with SMTP id 5a478bee46e88-361a0e85fc5mr16049994eec.7.1792510667340;
        Tue, 20 Oct 2026 08:37:47 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:46 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image script
Date: Tue, 20 Oct 2026 08:35:24 -0700
Message-ID: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an Image Tree Source (`lga.its`) describing the FIT image for Google
Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
`lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
metadata in the configuration descriptions, allowing the LGA FIT image
to be built with:

  make \
    FIT_ITS=google/lga.its \
    FIT_FACTOR_DTBS=1 \
    FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
    image.fit

NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
image. However, packaging scripts will be able to take an image as
built above and convert it into a format that the bootloader can
handle.

It should also be noted that the "description" of the various
configurations here is expected to be parsed to help figure out which
configuration to use on which board. This idea came out of discussions
at Linux Plumbers Conference 2026 and means we don't need "loader"
info polluting device trees. Having a structured (and upstream) place
to store this data is part of the motivation for landing this FIT
image.

Side note: at the moment, the Pixel bootloader can't handle picking
overlays based on the soc_id and soc_rev (it only uses those to pick
base dtb files), so for now we won't be able to support boards that
might have different SoCs. I've included the soc_id and soc_rev in
this FIT image in the hopes that we can improve the bootloader in the
future, though.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Note that building `image.fit` with `lga.its` requires the Pixel 10
(`lga-blazer.dtb`, `lga-frankel.dtb`, and `lga-mustang.dtb`) device
trees, which are currently in linux-next and not yet in mainline.

 arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga.its

diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
new file mode 100644
index 000000000000..5ba19c0b5411
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga.its
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/dts-v1/;
+
+/ {
+	description = "Google Tensor G5 (LGA) kernel and device trees";
+	#address-cells = <1>;
+
+	images {
+		kernel-1 {
+			description = "Linux kernel";
+			data = /incbin/("arch/arm64/boot/Image");
+			type = "kernel_noload";
+			arch = "arm64";
+			os = "linux";
+			compression = "none";
+			load = <0>;
+			entry = <0>;
+		};
+		fdt-1 {
+			description = "lga-blazer.dtb";
+			data = /incbin/("arch/arm64/boot/dts/google/lga-blazer.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-2 {
+			description = "lga-frankel.dtb";
+			data = /incbin/("arch/arm64/boot/dts/google/lga-frankel.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-3 {
+			description = "lga-mustang.dtb";
+			data = /incbin/("arch/arm64/boot/dts/google/lga-mustang.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		conf-1 {
+			description = "Blazer (board_id=0x070406,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";
+			kernel = "kernel-1";
+			fdt = "fdt-1";
+		};
+		conf-2 {
+			description = "Frankel (board_id=0x070306,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";
+			kernel = "kernel-1";
+			fdt = "fdt-2";
+		};
+		conf-3 {
+			description = "Mustang (board_id=0x070506,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";
+			kernel = "kernel-1";
+			fdt = "fdt-3";
+		};
+	};
+};
-- 
2.56.0.212.g129ede20d9-goog

