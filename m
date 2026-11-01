Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570620;
	b=wmTfGqVHEaZs9SAWHV+XK7UZLm9//j5uOZcqAFBS8vgUTmPK5TD5ZJUypz+BVjUB33Kr
	 u+brrb/ecW7gkz0wZGWyXusQrpX0sCZgzMS26bHCDA1afNAjhaT3NSdt5M5/0LBdbYkI5
	 BVJsxqaxl2+mF8BlYleFPhQcxDvGQsRDtj0Qp9rJ95FpX4kjQ5fEsdSgN62vyjtg5Gu68
	 ztM51llsqY0ne9DvkqclX5xScWwAF67ZG/ByXKqzJooWEeh2rquyAlBu6M7RgFkHNwDn9
	 yf58Q1owuTrtJRye/PyzqRbl4YbAQsiRTlCJCsj0NbPum7kX/Aec8zrP3mnIfqH71Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oX2lY0B1d+Uk+y09UrHk78EQVJf4wVNg8JWwEXhX1hg=;
	b=i1eGHHMw+y215hHhA6yNI9XEZbUIiqn2kdxEYsFf9HRjSuXmDRA0DAKhtMrdro21WVfC
	 4BFelBMQkbrsEJShCp7ZD+zhm3ppOHAn91wIj6c1CnytzVgIfRSiqECRjVMu8eYTPS+yn
	 9ccljncCJy1U21D4NvigXw0vL9Y7xiQLq59snY0NX9jETXtk7RdgaT8kBxwCVeCYl+cRq
	 OvT8LwQ+NAxghQ7R8cvqOK3FDuegn6SmgHA45ewRXhw3Uo/qx+X3FRdcF/jkmMhhpWxGg
	 mJ9u1rfJlhyx9y+/DuWDoAIQs/7uQ0gV+UqWXgvHMg1Dd0h2fl2egSpOmDD8m6xJI0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hAfr3Fei;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E6E606A32D
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E6E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hAfr3Fei
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14394530ec6so2900982c88.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570619; x=1794175419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oX2lY0B1d+Uk+y09UrHk78EQVJf4wVNg8JWwEXhX1hg=;
        b=hAfr3FeijYYJxYYlH/8f9HVj0okG6peROjzlYSkDbyC2M1z0gnfPaVQplVuef6eE3T
         t/vhHt2MR8BF4UwsEB2IEEtnuGmh9NM2FB7vjMiAYGZ5cmxGDmJvZhLJbh6yPrzl1pCS
         fTXdOBvE5Ec/JxB4W3qtKUMLRpF0jWxQXB6aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570619; x=1794175419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oX2lY0B1d+Uk+y09UrHk78EQVJf4wVNg8JWwEXhX1hg=;
        b=Q1vsHS6Q/nUMCTiIOXCXLvR1hSOq/B00nR+HC3M2LE9LOSYU3Vbp6oQTeGG3+iEwtt
         4q0SpJ6W10n8grK3z5KjPnf9DTXZj63DuYCu13sVPOW0310cXXVcoQ97gHA5LXj8vbFr
         0MOhjjAURu/VuBSU0Pait9x/3Iy/6u49YxZi2R+/K9KEqkVcV4ivSQST3Qtvt5zcCq3F
         xGLWsood4s2PVEOzm82yLGcHD/M/IUUF0VyC1BQl1WpS0QJEqM9yVIIsQifvAq2XxhE4
         RxzH9XLVVXj8tPvYG9E5EiUBQJQlTh6FxcRuiaBNjhSu1SzaaxB75McBpOihrGlrBjm0
         MAug==
X-Gm-Message-State: AFq9FYJGQ+ipEISKpkB0MGA4yWem36zeFEW8jk2O3BN4TAmbavCZu6xZ
	B8cl/dfd9+qj0hXAhKnfY7LDt+YvdKsOehgLdCH76TGJm5C3lQtlCgiEl3ITE122pxG0Pzkn91L
	CRvHVkINr
X-Gm-Gg: AYBFou3z3PpX9tkqJfzGUKrgZlwicaKXlw341EkmdBr68ckCWgGU/H0QteEg/axWPgl
	KQf+x1NHwvvxHC3QTdlK6oHg0shpJnY2hpjnyWqwSUXDpc/gwc09JeG/pCdQVHK1yw1bP26OnHW
	P4H4AxAmI2+figqhbguWj7rDFZM79HUoHF+iisgkNFvua0dbrtYmDWL/vhvjDkYETovPfuGVRKq
	LkTyQSmDYiSSo5aFJWh0HN0aorJxHE45VkN9c1TL2OJCRt5kRSH2lJp4oOO85N8/6xJyzGVmV0L
	64+DgVUiZQtqHxWT8HkWfDnYfBTfTslJ+vnkBSQFgimAYeQcBfPHXxyd87ZAvW4t5mNn2RI6HnD
	za3DwMK4+cMnaIwVOM7DbaIKjTD6MYQ6syWkZyCeD7sbgbreONtcZmGkNJscb20rxCI2gKhOARg
	gqlzapgLqTY+gb2utDeyf/sQ/twKCYo650/T5thdQ0mlkC2bNOgWfw++YHJ6BHfKOChTYlsRCX5
	pMt6MXEe56O+l7kL8yEMgsnNmMcSju0rXcl9+yiHixuCDwP3E+QAZOscIuC8mYnVEL3UkYXIWtz
	LW8CCF5hLM4f7YEJMXl7jumOKpajUI7D8HPOZzPIyxw6PK1HOJFEKJg+XQozjPFk0EMvusvRKQQ
	27F46NRIst1tsPQ==
X-Received: by 2002:a05:7022:3c87:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1aea05f4bcfmr6889873c88.38.1793570618814;
        Sun, 01 Nov 2026 14:03:38 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:35 -0800 (PST)
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
Subject: [PATCH v3 04/15] pylibfdt: Handle empty properties in as_str() and as_stringlist()
Date: Sun,  1 Nov 2026 14:01:11 -0800
Message-ID: <20261101220224.1436242-5-dianders@chromium.org>
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

Currently, calling `Property.as_str()` or `Property.as_stringlist()` on
an empty `Property` (`b''`) raises `IndexError: bytearray index out of
range` when indexing `self[-1]`.

Update `Property.as_str()` to raise `ValueError('Property lacks nul
termination')` on an empty property, and update
`Property.as_stringlist()` to return `[]` on an empty property. Add unit
tests in `tests/pylibfdt_tests.py`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split Property.as_str() and Property.as_stringlist() empty-property
  handling into a standalone patch and add direct Property unit tests
  (Simon Glass, David Gibson)

 pylibfdt/libfdt.i       | 4 +++-
 tests/pylibfdt_tests.py | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 5c8859b37df3..eb14312986ea 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -932,7 +932,7 @@ class Property(bytearray):
 
     def as_str(self):
         """Unicode is supported by decoding from UTF-8"""
-        if self[-1] != 0:
+        if not self or self[-1] != 0:
             raise ValueError('Property lacks nul termination')
         if 0 in self[:-1]:
             raise ValueError('Property contains embedded nul characters')
@@ -940,6 +940,8 @@ class Property(bytearray):
 
     def as_stringlist(self):
         """Unicode is supported by decoding from UTF-8"""
+        if not self:
+            return []
         if self[-1] != 0:
             raise ValueError('Property lacks nul termination')
         parts = self[:-1].split(b'\x00')
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 93408745c575..20741d8f2df0 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -423,6 +423,10 @@ class PyLibfdtBasicTests(unittest.TestCase):
                          self.fdt.getprop(node, "compatible").as_stringlist())
         self.assertEqual(["this is a placeholder string", "string2"],
                          self.fdt.getprop(node, "placeholder").as_stringlist())
+        self.assertEqual([], libfdt.Property('empty', b'').as_stringlist())
+        with self.assertRaises(ValueError) as e:
+            libfdt.Property('bad', b'no-nul').as_stringlist()
+        self.assertIn('lacks nul termination', str(e.exception))
 
     def testReserveMap(self):
         """Test that we can access the memory reserve map"""
@@ -523,6 +527,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
         with self.assertRaises(ValueError) as e:
             self.fdt.getprop(node, 'prop-int').as_str()
         self.assertIn('lacks nul termination', str(e.exception))
+        with self.assertRaises(ValueError) as e:
+            libfdt.Property('empty', b'').as_str()
+        self.assertIn('lacks nul termination', str(e.exception))
 
         node2 = self.fdt.path_offset('/subnode@1/subsubnode')
         with self.assertRaises(ValueError) as e:
-- 
2.56.0.317.g454f8302e1-goog

