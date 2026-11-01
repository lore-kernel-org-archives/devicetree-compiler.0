Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570627;
	b=PG/QbswB7VJmGI9JPpH7lpLt6ztTRTb0IWnsRD1gli65922vVZk6FdpBXlkSp1ht1tfq
	 TiDPM9oXorZ6Cq9WV8lrPCnnPhFFefdd/OYpO/VOb/N4L8MzRG1mtZc5WCd+nCiEGOHXr
	 hbGZa0sH0cV20elt13NsWmt5/CMxPa5OGvs0V2jf3wBXpr2pAArV/L6TzCQ/UhZhnjnbt
	 /voapGFBn7RTifse0Dpe9/pryPR0ABAxF4LH1/YMPgCMPEZyABASuaCq5WAFlQ/N+Gh4Q
	 IM7MdH8ADvUs3Hb7EjttoXvSQtBE68COCyn7dQ2XquO8kF+4VZmRCQr9IByl1omXLJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VkblF9+hoJMz6dpel02wGz0tGUBGpJN2KDMF6wCO9Bs=;
	b=plmRSvnNL3IfpVuhUMl91+IoY/gFnK2QIsLyaMKN7MQIIiyJgGYquf3KGBou30ZwSKlP
	 jHnPfoxKCKmXBztor9vrR5M7WWHm8KwpHo3IGD7QBJBswBevK7AQyNsHlNDnF2UhNKtXS
	 M91rNlAHZpbYUGIcQ896L9guF/9crTjPSPEpj8WGDyUoTS0EKbxb/zt8ozN5yEjEdfSZh
	 9j5koc253OaekjTc19t/gLf6H/IKmmINKbppNrUK2irCbYdBTfK6M20owzD2th84AS2ir
	 ZGHsI3jHmMRFBFkNJZR3IE1sfrX/T9S+57lMU5aue+ojfRjVWINBuHtwILSFm+nzcDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="KWaWKp/g";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C310E606A32C
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C310E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KWaWKp/g
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b1ce85287aso283604c88.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570626; x=1794175426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkblF9+hoJMz6dpel02wGz0tGUBGpJN2KDMF6wCO9Bs=;
        b=KWaWKp/g1f02H64f+Vky1BX7ykbEgRPr6AoXFyf7+kgULvNutsHZdD2SyzChAy/92t
         tN1u2aQaDU6jKxUs2UqvzSqu6opWzNVLiVwNH0jPj+ZEvwG0UwyXJpDJb6R/PRB+lAi3
         n04+y+WoXL6AI4zjFmpYpA+kFySpdqir9VC9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570626; x=1794175426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkblF9+hoJMz6dpel02wGz0tGUBGpJN2KDMF6wCO9Bs=;
        b=wzY2AoZVOLx73oeBmdUFt+AmgQVvkkSiJPtDal75MNrx/nMGDWT8flu9r2CLc+f1rL
         zgyBPjOuHobunBbhjvOa8Qrx1qjDq6SZsWoZ04wcV8/NKkgfLdOJj8ltapI3796u3Omn
         vvIxRqanuZa7IHqKw4eHoDT5EuPLgD+VYApPK4FDdi9BfPkonI/TQnxt0hWe2peyoft4
         ysLBSlzH3g1RpI0z3Ozj3fQMfpxPCGt/Xs28tge0KuW3phrkE4BrMQKWHVbqsDbChJgb
         uN8n9bNjmHLhfqsj0EyJAMCyYMFm0clUG4pEJCceXLcqHIliNXUhc4wZsLsvrngwhZog
         AA8A==
X-Gm-Message-State: AFq9FYIjv1azy8FXH+Fv32g3b7m2Xtt4vBARJSTRsBy4IR7x9eXvpUnc
	hvrIeEsEuiiAn2+xtxNKwazpQcohB2o3c52a/YWNKtyQ0bPauGcKG3PLBc7ifodShxKG99h2sUK
	ejLnXYKcT
X-Gm-Gg: AYBFou1OuQ79coWpPiQwLzGIEiEf7NbGdtbA2ViWr2531KKUEeeCUuwndRfUGZUIy1W
	R1leV4HxHDCSGXzhRM3IrzOjks1j1dBK+rXYEdzZG/pOSzjbykzB5+1M4c/T/+dKEF7DIhB1Ob6
	q+qyo3GTjJiZNnv0v+2xEDfQeP1olxsQIWJZtUhYovdw04lEjpCY7RtNaghbrZK/HDP2qwn7zq4
	74l39xEnzC/H3EfTwRUR/d7oZ+moRRhhIJntFv69urRZFQneJwQURF5Xbb//N+tBi2vosCQn0Vd
	Ye1sgo77olVhVDd1D/Wvpd07ceVzeK4H4QH7YBxLBg49+FNjJzlziD1ZptUmj13AASGXuINlvZ5
	/42+pwozO75i2HKSFr14BoOX2TDAXWrnq/dd1N80yhbjwVHG4ebaOMm3dRMjo/Lrml9kW0UoCON
	DNDLcgTuXWhajxakzxd2n1IFuk3OFO8SzdMSJteoCwr1kVNnnkocBGeDwOt1aF8Jt9kdmfnfd8y
	HXLZv3w+NXeGHvayKzfXbiWZu92rua/m9roa7PTVAFpyJREFwh5ED4Eji2p5Z0slVyRu7fnrLyx
	XKxelHJq7UmjR5VollXNoYRIEMbYrMacAwKaCYCf1TTsrZJtTmwBqOqbIB/FpTWK4FoukiS6EHc
	P5AGILUwMJvxqaktw+xmnw6YzqqudC5wiFrU=
X-Received: by 2002:a05:7022:3f0a:b0:151:6e80:ba7e with SMTP id a92af1059eb24-1ac56c9ff26mr13705215c88.4.1793570625752;
        Sun, 01 Nov 2026 14:03:45 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:40 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 05/15] pylibfdt: Add Fdt.set_boot_cpuid_phys()
Date: Sun,  1 Nov 2026 14:01:12 -0800
Message-ID: <20261101220224.1436242-6-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
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

`FdtRo` exposes `boot_cpuid_phys()` to read the physical boot CPU ID
from the FDT header, and SWIG already wraps the underlying C function
`fdt_set_boot_cpuid_phys()`, but `class Fdt` lacked a corresponding
`set_boot_cpuid_phys()` method.

Add `Fdt.set_boot_cpuid_phys()` and test it in
`tests/pylibfdt_tests.py`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New patch adding Fdt.set_boot_cpuid_phys() to pylibfdt (Simon Glass)

 pylibfdt/libfdt.i       | 8 ++++++++
 tests/pylibfdt_tests.py | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index eb14312986ea..51db9535bd39 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -684,6 +684,14 @@ class Fdt(FdtRo):
         del self._fdt[self.totalsize():]
         return err
 
+    def set_boot_cpuid_phys(self, boot_cpuid_phys):
+        """Set the physical boot CPU ID
+
+        Args:
+            boot_cpuid_phys: Physical boot CPU ID
+        """
+        fdt_set_boot_cpuid_phys(self._fdt, boot_cpuid_phys)
+
     def add_mem_rsv(self, addr, size, quiet=()):
         """Add a memory reserve-map record
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 20741d8f2df0..18730965bd02 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -300,6 +300,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(self.fdt.version(), 17)
         self.assertEqual(self.fdt.last_comp_version(), 16)
         self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
+        self.fdt.set_boot_cpuid_phys(0x42)
+        self.assertEqual(self.fdt.boot_cpuid_phys(), 0x42)
+        self.fdt.set_boot_cpuid_phys(0)
         self.assertEqual(self.fdt.size_dt_strings(), 105)
         self.assertEqual(self.fdt.size_dt_struct(), 564)
 
-- 
2.56.0.317.g454f8302e1-goog

