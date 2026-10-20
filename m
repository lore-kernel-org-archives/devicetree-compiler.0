Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510650;
	b=3J7/GHao97aliA9yxtycst9w+XlBJCGBlpdUyU/Ux00mQridNFkYpJHX76VR/xBk4QMw
	 KEyp/00nlRnOEZcRt3839oFJWCy+KhLuku6rcEP51e0Qww9D+5XKqGnz9uB6ZTHi1GZvC
	 6UR1KmwdobXILk51qi9YhC2965KNRQAl0yr1DPaeOW9HxEmHfchLKjfvlHp7InZyi29pm
	 C4+Cr40lMrYWov4PMn63br/FMesf9hBu7gOCsNNVytNVz62objbxQ3V4+Wz1DvRSzxCJ/
	 fmEdlVAM+hM6iyxetptsFWUHjcH6fCCKMcDfmEZdA7fwmqXYuO3G8YJ9RP9M6jraDCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
	b=evZlFTJkQ5viiIT8AF4MK18BOeEQae9Lka7s3Wc67yyDE2vbRaX5xhL2RPlTLhLiGITO
	 PIshMiQor97TGQKXF4keOzDGnQTNgDWbhepfS0OPykUEuj6VsSs9QaZeVM3cAqbxwss/P
	 3mHUofZI9gwvdF2JnzGJcWcUQSUZm8bKoDjpAjNAcHf7MS5JwB6TbneETqEDbRmN+8S7C
	 uU2/oecl8gHIadc8u9qTG/bw+1njw3P7Waw1AZc5E2ZjONQXEAxCT2fV9nuPmuVS0SrLE
	 /B9IJOhsNdNdr9O1VbBwSzZaOSoUGLuN6aXrRtwXd4oIeD74n7h1wfaIFd5UiN5COJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZB0AmpTi;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2B560A262D
	for <Devicetree-compiler@vger.kernel.org>; Tue, 20 Oct 2026 15:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2B560A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZB0AmpTi
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36681e85e87so985968eec.1
        for <Devicetree-compiler@vger.kernel.org>; Tue, 20 Oct 2026 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510649; x=1793115449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=ZB0AmpTiEFpkYXp0+xLjk4W6R0qcTahYVXSVmFDgQXTNrUa4ZAw/D78slYkOG/1pqT
         WKBNuC9DZqypB0b8Rk2Ji9vE0p9+M71yqhsJS8VL89DlXOT/kJhPFZQebjojLdqPK6Ww
         0H9XY3j6gr6XmSqFQ0RJQN77Gy9M93W1ltSps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510649; x=1793115449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=esK5EGBL2u0wVfh8/BGSG5DaCiXLsg3oyN8EcqFFhzYM2ze2le9Lm7KNCt4Mbla5v1
         NsAPIqIz7Sm9iDC4i0AConKzDdzig+6FfYay+1C5IuNklXhM1UZtIg1EotFoSGib/tKk
         AC54lLfdHhqFVC+Fe/uEvew3Xwf572DqD2hcuZFWDh2/rffLeYKz7P8Kcau94dhmEoXY
         /S1YEgV1vDfCejhCdC+wu+66w91KePxKGotw91fsDQTt/AhwLL1sA4s8J/E42kILIQ1x
         GGKnIw+HOJw3SbpFDsHj+YUlg7MTIq08iYVfxAWuH57ldFmvoZDRCZpH2vNh9hDDG1gx
         p5qg==
X-Gm-Message-State: AFq9FYIHq7RiYJqVWKbvr0cjhdvZo8Tdiliq+lpdXtv7I0ssjGkieZ80
	t8IPlJ3i3nC+T2pXF9OmfJdDPq0TrIMEGjeNM+gWG8FzFcOwylEWnUwJPOp2W7hoGig1v/Npbss
	cZjindg==
X-Gm-Gg: AYBFou0pxkSp7F7RzFTH9lTv9Jf7Os56cfCiF0qP6R4avtAsukHh3LqpqawHhZmSWPI
	XJyk56EDVGySeamweR1UN4g8LutTW9FJcoi7E11jhFzCqW/Zi0ZYcIzO4812hFbldaY/4XGUEJB
	6CcG80jHnSKqxzE7WNFexwGMakRycmsI15EPfxjUFT+ZFLW6hplhaxCi5/7kCq9EeYqMgs+6CdK
	x1YpUaMwlNfApFf+/4hBVTiTvSMMRtZoRpGIjWiwPF4o16tLtJj6BdsWSy1tBUb5yXwySUXZtnx
	QIBiQXgN2Lzyc5kzH2mjPATN69KqIG6t24kyw7bgRdDwrUbDHbn9M3FYeXzmqstDoznls6p3kAF
	vtfUzRKUjLi/VllfN/JdMZrixBLesApFqGZWjmIucj1eqy607PKOL1UFuFelj3LvSGj+xiPZal0
	OUHvs8yRM6EVtvFADC7djbQvWXNEp9BQTBETFi7izbm1ABlW2JbWxKqPBkG54VCcPZ6sdHx8IIi
	6FPEEimIZJnB3ZNHCVGmv9VXbh1ktW/pr4jfwv2aaJKvcjfezNGdushp/I=
X-Received: by 2002:a05:693c:6391:20b0:366:e24d:a0f6 with SMTP id 5a478bee46e88-366e24da2d3mr927924eec.29.1792510648703;
        Tue, 20 Oct 2026 08:37:28 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:27 -0700 (PDT)
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
Subject: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
Date: Tue, 20 Oct 2026 08:35:19 -0700
Message-ID: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
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

fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
of update-dtc-source.sh, and were never added to the sync script.

Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
kept in sync with the rest of scripts/dtc/.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/update-dtc-source.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
index 94627541533e..f21da460742e 100755
--- a/scripts/dtc/update-dtc-source.sh
+++ b/scripts/dtc/update-dtc-source.sh
@@ -38,6 +38,8 @@ LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
 		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
 FDTOVERLAY_SOURCE=fdtoverlay.c
+FDTGET_SOURCE=fdtget.c
+FDTPUT_SOURCE=fdtput.c
 
 get_last_dtc_version() {
 	git log --oneline scripts/dtc/ | grep 'upstream' | head -1 | sed -e 's/^.* \(.*\)/\1/'
@@ -55,7 +57,7 @@ dtc_log=$(git log --oneline ${last_dtc_ver}..)
 
 # Copy the files into the Linux tree
 cd $DTC_LINUX_PATH
-for f in $DTC_SOURCE $FDTOVERLAY_SOURCE; do
+for f in $DTC_SOURCE $FDTOVERLAY_SOURCE $FDTGET_SOURCE $FDTPUT_SOURCE; do
 	cp ${DTC_UPSTREAM_PATH}/${f} ${f}
 	git add ${f}
 done
-- 
2.56.0.212.g129ede20d9-goog

