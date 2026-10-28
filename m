Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224593;
	b=rxk9lnESDogX/b5LFgie9Dzep4Cw+xJQpi1XopiYsUWy+VoFe+T5m1pVtw7+m95B9Uqk
	 ggCyBniX5yiVp+pFOqwDzDyJokTkB6w4rfmXUNuD7RUaO0bx29AhhX10z2bUeBqfA+8lE
	 bnSkmUomNT9A85hr/+HujxSv2zmAnbP4gCNcU5Ytu32kQal/jnXS+0Wm893t89vB0TXNJ
	 SDn7xny53RO39NC2EdTLnx8mv3YAJUOlI9BrjMIhucDZE7dvHioheyv1QVtHhab+tixOn
	 X32hzZBnvYYRocKyz7ps2Qhk3+qUWvNvOX6Lnu1V8aRZqrLYzYdGTvDoxHjKYL0nULA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MM0KvfFyAbh8VWSliCEimGsM/uJay/dgVTHB3JwFRmU=;
	b=fCNja7zFCGyYrkitW6ctDAsZKFw/JXpdmDxqQqNVG1OfYM3gPQ2CakwJbbZbtltDDzNa
	 coBg/kK71bfrDujFh3YSwYMlH1B0VvK/EKu2jFTvuA/0URHK9vflwprcu2v3OB321tb3Z
	 qCYHk5mmBoL2Ri/UHE7AMLX5Lo7tYjJwErfgTUGbdgh1+yaxm3R21kaT2tEO1JVleoopP
	 F9iS4SKJ6Kjn2uufG8liY4bgSmD9WxWni8ZyVHXdRzaWaE9z9tfFRd2LjfRWQ0l8CNY51
	 rKuVLT99GpSfVFUAzHKQOZP3XoeBY+OWp29x9XGfk4zeT7dzHJPWXzp915nf4srJapQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PnLT18oH;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C5D606A33F
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C5D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PnLT18oH
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535a54bed9so2139024eec.1
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224589; x=1793829389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MM0KvfFyAbh8VWSliCEimGsM/uJay/dgVTHB3JwFRmU=;
        b=PnLT18oHCXAMfz3A6UxJ7+6+7m4vVBG6m1yn3t9WOYzXb6GHmVOe8Pgz6xzkh7aT1E
         wcqDZjHqJBN4M/+f7MTso6YoWzpfSjAGNm40BRQU0ASkPH1Vf582AmC8ItEPS02eE6pq
         AvZg9tyonmALfffiWK90CkcnUfrzKuaNLfxPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224589; x=1793829389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MM0KvfFyAbh8VWSliCEimGsM/uJay/dgVTHB3JwFRmU=;
        b=0KQ8nY7dpf4kieFWzPQjuZj4Got3VWFy7jHrnihy2EGsT88aLqtSThsbaz5e5FfLMB
         v1XbOUCSICRB/pF/JoCpFVGkqpu0GBVu3+/ENyjsfLfkDZT8v3H3p7zteVVrjdSCpJl4
         7Uy96a9evdt+y4SFGZoyfNF8lIU81VKCTEG+DF6EV/O7zdinU8JTa2DV4goJ2sIhPB+E
         sH2VxXb71lovBkIuUmH1uiXvl7mY8DJOI+co+uJFob+PbXPSs4l0ohTyKbEzAI6kiUbV
         rq/A3NqeTuxAjkjIuiHjJBifkPQ+Ke25I0eMnIrA8UQgclGApYC9WR/g96idF7/K+DEK
         52yQ==
X-Gm-Message-State: AFq9FYIAAgNm9VK3D+jfieo9qOak2ovcnZmq/2t4UXoFYRG7x8P6PQDt
	v9dEFQdzQq6r1oXLuqMJvcAlC6TRcVkgzwosvMWk4Ln/XmzpEF788/uYGBMqf3waFSgN0rmd+GW
	opRJDwFsJ
X-Gm-Gg: AYBFou389oAbXozKWqEBN3nxbfkOxg2C4z/3fx5cUHMVz3/ROounPeSYHoQwI7feTBt
	5bWNxv5hqGl3H064JuUw/oopZTdLJWqD610BJIF3ZR6bwLdcrg/smsryZpuK5Mn1RVf5j2QmVKc
	DP3LGxRU5O5/H5E6jPiKW12tsLe+OQ29bVu36siHulf3pniH3iX8if+WiltVcA+Yptd874kZZ61
	cQmkkN4LAWYlxiqQMMy7f/u6gbGnQHXCa32bZ0uqBel0c99wRfPaM4rHcIxHXLM4F37aKVZWemO
	P2venc0APMiDLpKFaYJHjatmsqXjeauxC7Y5m8jUm3gJY6E1kuJzAtaDK2BHrvnNSaj4SCaxihO
	ZHwwZwt3P5SFi36hg5EWkFFDImirQ4A4B0tp9jsM1QQaREk1OXj+uq8C/KSm+qmk/TCCsLdFySG
	Enot8ef3zZillqHjeRTx3A1bf2txly1UQ8AJxESURyXCugWJ/JGBYi56nV2tpOeREm1+JS7o6Ns
	KqtErdpMJzcaSocCdVG0b97A3JmJHoGgME6tChjW29rEU5ko75ILqtRWXmUmKIElKdAvdTZ2GE5
	D2zIgkQxnTZ/uzQ+kz5WBb6edCS02HYetxpO+79CXO6Hf8GUoyrcajvS7h5x/9DwlgNpxMmO8R+
	WdWXNMYZZEiiK
X-Received: by 2002:a05:7301:1708:b0:369:987f:d15e with SMTP id 5a478bee46e88-36a202871c0mr4715544eec.2.1793224589274;
        Wed, 28 Oct 2026 14:56:29 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 01/10] pylibfdt: Fix FdtSw.as_fdt() when buffer is nearly full
Date: Wed, 28 Oct 2026 14:46:50 -0700
Message-ID: <20261028215600.1713475-2-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
In-Reply-To: <20261028215600.1713475-1-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org>
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

`FdtSw.as_fdt()` calls `fdt_finish()` on a copy of `self._fdt` without
using `self.check_space()`. Because `fdt_finish()` appends the 4-byte
`FDT_END` token, `as_fdt()` raises `FdtException(FDT_ERR_NOSPACE)` if
fewer than 4 bytes of free space remain in `self._fdt` after the final
`end_node()`.

Wrap `fdt_finish()` in a `while self.check_space(fdt_finish(fdtsw)):`
loop so `FdtSw.as_fdt()` automatically resizes the buffer when needed,
matching the rest of `FdtSw`'s methods.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch fixing FdtSw.as_fdt() buffer resize when < 4 bytes remain

 pylibfdt/libfdt.i       | 3 ++-
 tests/pylibfdt_tests.py | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index b41c03f4932a..46f28f67290d 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -959,7 +959,8 @@ class FdtSw(FdtRo):
             Fdt object allowing access to the newly created device tree
         """
         fdtsw = bytearray(self._fdt)
-        check_err(fdt_finish(fdtsw))
+        while self.check_space(fdt_finish(fdtsw)):
+            fdtsw = bytearray(self._fdt)
         return Fdt(fdtsw)
 
     def check_space(self, val):
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 0e1660753477..1b65961491bf 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -646,6 +646,14 @@ class PyLibfdtSwTests(unittest.TestCase):
         # Make sure we did at least two resizes
         self.assertTrue(len(fdt.as_bytearray()) > FdtSw.INC_SIZE * 2)
 
+        # Check that as_fdt() resizes when fewer than 4 bytes remain for FDT_END
+        sw_exact = FdtSw(76)
+        sw_exact.finish_reservemap()
+        sw_exact.begin_node('')
+        sw_exact.end_node()
+        fdt_exact = sw_exact.as_fdt()
+        self.assertEqual(80, fdt_exact.totalsize())
+
 
 class PyLibfdtRoTests(unittest.TestCase):
     """Test class for read-only pylibfdt access functions
-- 
2.56.0.313.g2479322e68-goog

