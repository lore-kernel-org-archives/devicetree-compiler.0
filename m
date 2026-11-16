Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862422;
	b=hkKnIWUdUok6r4nGIcAww1RzgbuR25IQ1Up26LBo5jwCGivMO5DQD5q0I49Tvvhi4KrL
	 QaE/laW/SmvwggDrAFiGU0ow18Ajp3NTclcbWVrq3R/FkktrC11DMRV92a67gsldCgQ6w
	 Kn7R9xNnLEe6WlMT/k6AP2A+FpL41/BsVJ5QzNrrW+l61OyB/SglIEsmBwgEWpliU7HKk
	 P3d/70/SVekt7AraxI9ZwKyzqmf037rkHetC81FqUCKfPI4QTRfPiLnkS+GnHfmrkJ+ss
	 3n21jdFa5D9sITA7WWalnjRdEtNy1MfPqWLIwmoTf3N6OHlT1DFPC5clS54ZfE+V09Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jvVNvu1S6dbncJSuthsRoeoeI4Q+KNIALnJGA2kItSE=;
	b=Hi+q4RzXR+el+Ra+fIuyVuvo3pBbq30lDgpgBXn9Cw4smRbrTJKACtTXiSb6s4Y2Q1vb
	 5604lgo76dx2hU2ChU4VvI8B0vWVghrdKncxqa1uAix70ipWucFG1sDdlNh9ivDx8ue2+
	 01h9dhpumgrDPfbjyngNIN2d9+DVkonYDQ3E6AQBCtm16pA8ey7P0FPk9pPfL9pwO3D8Q
	 i8OYO0r9uALfVuZ0ziFkurt11e7tcM7JqoqwfAaFGbqe5n7TqGyv2vg/lMDfuJOEdkTsJ
	 BbvXDVz7CWuxTSCVuKWsr78F9WK6kFvW4q8Dp7wvQZy8j/99czrxxlNuM93UnJIjyfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=guJzdrk7;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E359606A332
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E359606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=guJzdrk7
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so253837eec.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862420; x=1795467220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvVNvu1S6dbncJSuthsRoeoeI4Q+KNIALnJGA2kItSE=;
        b=guJzdrk7VmvoXy4eRvWyqWXKP6t5/9dN94YSAHbzWYcmW+bS1TUFisS4TWEUTJw2Uf
         8vi81Cupj7meIi04/HsZgrorewGhpJ90tRztofu3vFKrg2iAUXr4SEasGJMvyZyzrtqO
         fXRn76HH2M+gcq2QT9Ht7q5p49QmMm9g8eUaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862420; x=1795467220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvVNvu1S6dbncJSuthsRoeoeI4Q+KNIALnJGA2kItSE=;
        b=Saku+tEhMnEKkY/FuYEmw+sGKMVDVEQzgKibFLYVckA+irH5FOj7vF2sFmNwHvBnw5
         yGdJ1LhlWY4mNJy2koflaIYCwX0QjEg+UEN/HkpgmSqf20vdTPiQFjwfRjXocb5K+PPq
         jgeVQwbRPI9g4QgqQu6Fm8TpJvPtkSf9Bf6kPFRLdtqmGoZXh1rQszt1YDB26uCFS5Nc
         NHYnhF/XyMSeE9P5CrVscpn1qmtVPVp8+jOGLwLdTdRBuu4d8RU4QQ+gWNq9KedsdyzP
         ziPzQv+2wA7vgw13SloP+2l55VlaqQoAwP3UdV1UwX+tydyLUe5bBvuN/yo63o3+UzWU
         S8RQ==
X-Gm-Message-State: APuU4Z85yB4F3OtdDGWDqwJF55U0IA/jbHi4/oRiDVmZrlOpYr+lP+FW
	FKukQ1L9zzXqnmq85NLCz8s6E2SEp/VkgGfKbMD1K0I01JPiwg0mRJdU3Mrt1JOwisfPAkSV1KL
	mpvdRbg==
X-Gm-Gg: AZFdTZf7IWpXnuq/3Cma6c3XzL59of0pgtc6QOCAkVvaTCwyAmtuPITEEtdx4ustj+5
	F9idNHSRSFH28sRm4N1ytGGy9XffGyhlQwey+iwjynYOfGTOV9TZ9sv83O4sfM7B6LCua+a7A6n
	ph309wUw1SO/jmJQQTE94w2SO2zxlYXuUpht7CTh3sR+IZM1Mq3XQl59Gd1iGol20SbHhmryz6q
	9PGU6ZB5/plb8KHSRgPUHF02jhJgxRz/Ux7Yk6A9KHueTJjd1XHc11jXpdSkWkuFtqFV9fovfZu
	CvwD2soyPk1uErUH6bY/va8AfC85p1GmeH8JeoQLSQ28x02ycc4IPP9b6vy2mFQJyqumA7CP09l
	/vUT+8vmEOzEOtHS4q+pDS6Q0F4wKQOlOZwxXXVBSFLuBChsqFXzWagKlcM0OwDi7ToxF0Jyw+c
	i9yXgugMnx1wn6JJ4bbG/XUlvjohP1bh3AHZS5Vtb1GhWcXFo7rSonou5ygLYWXl5Q6eO3vyHuX
	YIpveehs7qoq0rZwOkjpthbmXr5wJVH57Ik9vv/kK+MdOVApj0Mz/2MEaFzhaVMmbjQQxV4S0VQ
	KiVubdD68GOeaC9pwsbsY0MZh8bD5GNnTKX94rtTnBhfFUmRNaqaDoO05gkBpwq/XdtH1tSbYx9
	93bk120c80leegA==
X-Received: by 2002:a05:7300:1895:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3810cd4c1bdmr660553eec.10.1794862420309;
        Mon, 16 Nov 2026 12:53:40 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:37 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 03/14] pylibfdt: Trim Fdt bytearray to totalsize() in FdtSw.as_fdt()
Date: Mon, 16 Nov 2026 12:53:00 -0800
Message-ID: <20261116205320.1621386-4-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
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

`fdt_finish()` relocates the string table directly after the structure
block and updates the FDT header `totalsize` to the packed size, but
`FdtSw.as_fdt()` left the backing Python `bytearray` at the
pre-allocated `FdtSw` buffer size (with trailing zero bytes beyond
`totalsize()`), forcing callers that serialize `fdt.as_bytearray()` to
call `fdt.pack()` just to truncate `_fdt`.

Truncate `fdtsw` to `fdt_totalsize(fdtsw)` in `FdtSw.as_fdt()` (matching
`Fdt.pack()`) so the returned `Fdt`'s `as_bytearray()` length matches
its `totalsize()` immediately.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch trimming the returned Fdt bytearray in FdtSw.as_fdt() so
  DeviceTree.flatten() does not need to call fdt.pack() (David Gibson)

 pylibfdt/libfdt.i       | 1 +
 tests/pylibfdt_tests.py | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 8a7dfed85f15..68f22e316ece 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -1026,6 +1026,7 @@ class FdtSw(FdtRo):
         fdtsw = bytearray(self._fdt)
         while self.check_space(fdt_finish(fdtsw)):
             fdtsw = bytearray(self._fdt)
+        del fdtsw[fdt_totalsize(fdtsw):]
         return Fdt(fdtsw)
 
     def check_space(self, val):
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 78d8976c0cf3..26915a015ccb 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -684,6 +684,7 @@ class PyLibfdtSwTests(unittest.TestCase):
 
         # Make sure we did at least two resizes
         self.assertTrue(len(fdt.as_bytearray()) > FdtSw.INC_SIZE * 2)
+        self.assertEqual(fdt.totalsize(), len(fdt.as_bytearray()))
 
         # Check that as_fdt() resizes when fewer than 4 bytes remain for FDT_END
         sw_exact = FdtSw(76)
@@ -692,6 +693,7 @@ class PyLibfdtSwTests(unittest.TestCase):
         sw_exact.end_node()
         fdt_exact = sw_exact.as_fdt()
         self.assertEqual(80, fdt_exact.totalsize())
+        self.assertEqual(80, len(fdt_exact.as_bytearray()))
 
 
 class PyLibfdtRoTests(unittest.TestCase):
-- 
2.56.0.679.gc527c65306-goog

