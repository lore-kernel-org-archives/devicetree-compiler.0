Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862426;
	b=1biTNNHXPKHlCQCM7RQNFdCvwaRB3GnKXc12KzLbJJ5uXlbU7/oJ9otCVT9ANLFczhn4
	 /Jv1lwW/vDGXxALnc+BJa4lcIA0p9RXDZZf3pY/8AjHzLNBW7n2e1jdodGDOFB/4sg+dM
	 ThsUQA6s0ZjEJYdtEra1wQ0NFhfAFd/kmd8Dt5fAnpByzozTR9cKZGF8Ttd66dfbgojAp
	 vqK1jiz5cNXiUVLlMNrQ/x4IdnFKCpktEfE1QB2Zi1zw7FiqeMQYbWHnKEfbm4EAXhRT1
	 Qsx/Skw8yi75J+dfXB+BdSO7mR+7uPzAxRvKVTe9L/ODBFmY8L+l4euENyF4zdptXuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zKhcQqCObW2np3+GZxG/Vi/lnV5TvzNl3cN+yw2JRFw=;
	b=YTEBYzIOE88p3g3qu7EjMc/OSeqbXJeZbTDG1/adhnvSEHKHNp4pG8BOA1pcvbsm+6Y5
	 Vjm+Y0M6ciDtw5W4yOu8B1tuSd+ZrhlcotU8Q02dRZdNd3p3LkkSDmdq81RrTUcYN5JSw
	 JnvT+iH3Q1Bsih2JSKEUVzzt22gwJRguNy0kZ4bCnmr/3TVoJ0RtNIycoGkF09DWUQ8Ly
	 DaY5OELgivD3sJagoqhXlQcjnx//7mcK63COe/q7OY5oNQKGgBB+Ztpz0W36g9CBer2wz
	 kJoZcJbiM2hUnhhYxQ0W7bvQq37cpI7dmz+FHH7bs3EShaZR+oSjq9mu6WJ2XQNOHVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wy3lwnyD;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94669606A32C
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94669606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wy3lwnyD
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so10193870eec.1
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862425; x=1795467225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKhcQqCObW2np3+GZxG/Vi/lnV5TvzNl3cN+yw2JRFw=;
        b=Wy3lwnyDZ6zg6JvnqVw+Q/KYJREuy2Q3beiqnUTSYCrndQpeCc8rH221h4OKOy2ROo
         Pdg2opaFsrwFCCzWU6FuOLum2O/Pjbn8L5vFnhCK8eMS87eJlGHP47DcwyPy1EMJa77/
         9TXaubiHuLlXfwDME7+tGH2EVSAU5IQ/NowgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862425; x=1795467225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKhcQqCObW2np3+GZxG/Vi/lnV5TvzNl3cN+yw2JRFw=;
        b=voJ5Y7JPeP4JF96YF1MDewmoUIib2R3ma8MHJpGYip+fxbAz4X++5U+6oC+yyEI10G
         KZ5lUAUx6tZNqADl6yQxH7784nRPx6Y/cAabn0N2kBw58+0zNhT9IlM2jeIGFIq1a+2q
         HEst0vAdyffszYW9oImwO8WKTOjoCSfGyyNjIvFR1i71C3DdrnPdODWQcGD8gCdHkqQ2
         kkwivhCtcCYtxDMYcQZqkn+B/LK7XgXGBtjcSy2NBF3xegcs12wrKcKDC3ElljzpneEw
         jnQ3e4/3k4Ke4kRBsYkvdYG52mJrm5zmJafbQ1OVfgD3kBmliv48MvVZQEGWSMbHcKrd
         qKPw==
X-Gm-Message-State: APuU4Z8vJV3rK6uf+vlQ7+c3ND4T37XGgfwPBLOi2tfaiUx7kyNmto7b
	xSNqKsOncVj907IV8tVr4xqVHUrsEi4idQ1s53w+4CK+I/aRZM3lcdVHYtCGmf1DX86jJSVV0U/
	ylBflJw==
X-Gm-Gg: AZFdTZfbIkRfuZW8pHQRN7ZLYAcrSSxVtTEwR9oa4+Iy87IhfCDviL/hZCbZh8VqaVo
	yoSsFXiokGjUqrWTBonklxJ46qyDCPVyZMbn5kdz5f4nxSlei30VbZH6I0YMFmZvqDW8JA6sHo9
	XBVRH1GZpNHZHglD/khhmLKXa1SizRAqHgsvLwGM0KGT0BCopRzK4tfcutqIXZsqvdwP8XZTnTK
	4CJbvja0WaMQG5kahERplqv4dVWdx25vfge7LcHY6eCJqKluUoHndT3KqbL7NIawoq/7xHpSvoe
	vgN0FQxxn1XjYWIA+YWdsUKTj9BLxrGMifNZiTyRL3O/VFEBLfg+2eOUoxP5g4XO5+1AxdmhqJ8
	2riI+MUEuaB9Wn5tXGZm/EWo3mdyKwx0z7NOB8L4IeTG7d+nm7Yzeq8MtqKrHCQF0141EwWQDgh
	9QVXqnFss9iN7zcnD8Sv4jdu0hc4D1FWEpvomR5Enkv7eI6CYC2z8ZAyYyEjK3L/NPGhqeSJbLB
	aMNqgBPlGtFGFInNkcCg0jPVDZfRy7gLQ5oJD+0SIsYjz5iSfPd8WDah2ceh0wLUgGemXuuntYD
	epq80xHd9atuixhPzeTSDckIsVhm99W6+Ufrc5a2ADwpJJg58rCsvIwjmPJo57rhZXBsSj3HvPC
	KL4zIRm03L19Sgg==
X-Received: by 2002:a05:7301:a4:b0:378:b1be:2d3e with SMTP id 5a478bee46e88-37967ae558emr12079365eec.32.1794862424700;
        Mon, 16 Nov 2026 12:53:44 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:42 -0800 (PST)
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
Subject: [PATCH v4 04/14] pylibfdt: Add Property.from_*() creation methods
Date: Mon, 16 Nov 2026 12:53:01 -0800
Message-ID: <20261116205320.1621386-5-dianders@chromium.org>
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

`libfdt.Property` provides `as_*()` methods (`as_cell`, `as_uint32`,
`as_int32`, `as_uint64`, `as_int64`, `as_list`, `as_uint32_list`,
`as_int32_list`, `as_uint64_list`, `as_int64_list`, `as_str`, and
`as_stringlist`) to decode typed values from a `Property`, but lacks the
corresponding creation methods to construct a `Property` from typed
values.

Add `from_*()` classmethods mirroring each `as_*()` method so callers
(such as `DeviceTree` users) can construct typed `Property` instances
directly without duplicating encoding helpers on `DeviceTree`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch adding Property.from_*() creation classmethods so
  DeviceTree does not need its own get_*/set_* wrapper methods (David
  Gibson)

 pylibfdt/libfdt.i       | 56 +++++++++++++++++++++++++++++++++++++++++
 tests/pylibfdt_tests.py | 49 ++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 68f22e316ece..ff9210d123cb 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -962,6 +962,62 @@ class Property(bytes):
         parts = self[:-1].split(b'\x00')
         return list(map(lambda x: x.decode('utf-8'), parts))
 
+    @classmethod
+    def from_cell(cls, name, fmt, val):
+        return cls(name, struct.pack('>' + fmt, val))
+
+    @classmethod
+    def from_uint32(cls, name, val):
+        return cls.from_cell(name, 'L', val)
+
+    @classmethod
+    def from_int32(cls, name, val):
+        return cls.from_cell(name, 'l', val)
+
+    @classmethod
+    def from_uint64(cls, name, val):
+        return cls.from_cell(name, 'Q', val)
+
+    @classmethod
+    def from_int64(cls, name, val):
+        return cls.from_cell(name, 'q', val)
+
+    @classmethod
+    def from_list(cls, name, fmt, vals):
+        vals = list(vals)
+        return cls(name, struct.pack(f'>{len(vals)}{fmt}', *vals))
+
+    @classmethod
+    def from_uint32_list(cls, name, vals):
+        return cls.from_list(name, 'L', vals)
+
+    @classmethod
+    def from_int32_list(cls, name, vals):
+        return cls.from_list(name, 'l', vals)
+
+    @classmethod
+    def from_uint64_list(cls, name, vals):
+        return cls.from_list(name, 'Q', vals)
+
+    @classmethod
+    def from_int64_list(cls, name, vals):
+        return cls.from_list(name, 'q', vals)
+
+    @classmethod
+    def from_str(cls, name, val):
+        """Unicode is supported by encoding to UTF-8"""
+        if '\x00' in val:
+            raise ValueError('String value contains embedded nul characters')
+        return cls(name, val.encode('utf-8') + b'\x00')
+
+    @classmethod
+    def from_stringlist(cls, name, vals):
+        """Unicode is supported by encoding to UTF-8"""
+        vals = list(vals)
+        if any('\x00' in v for v in vals):
+            raise ValueError('String value contains embedded nul characters')
+        return cls(name, b''.join(v.encode('utf-8') + b'\x00' for v in vals))
+
 
 class FdtSw(FdtRo):
     """Software interface to create a device tree from scratch
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 26915a015ccb..e2f9c6d5afe4 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -414,6 +414,16 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(9223372036854775807,
                           self.get_prop("prop-uint64").as_uint64())
         self.assertEqual(-2, self.get_prop("prop-int64").as_int64())
+        self.assertEqual(self.get_prop("prop-hex32"),
+                          libfdt.Property.from_uint32("prop-hex32", 0xdeadbeef))
+        self.assertEqual(self.get_prop("prop-int32"),
+                          libfdt.Property.from_int32("prop-int32", -2))
+        self.assertEqual(
+            self.get_prop("prop-uint64"),
+            libfdt.Property.from_uint64("prop-uint64", 9223372036854775807),
+        )
+        self.assertEqual(self.get_prop("prop-int64"),
+                          libfdt.Property.from_int64("prop-int64", -2))
 
     def testGetIntListProperties(self):
         """Test that we can access properties as integer lists"""
@@ -425,6 +435,28 @@ class PyLibfdtBasicTests(unittest.TestCase):
                          self.get_prop("prop-int64-array").as_int64_list())
         self.assertEqual([0x100000000, 0x1],
                          self.get_prop("prop-uint64-array").as_uint64_list())
+        self.assertEqual(
+            self.get_prop("prop-int32-array"),
+            libfdt.Property.from_int32_list("prop-int32-array", [128, -16, -2]),
+        )
+        self.assertEqual(
+            self.get_prop("prop-uint32-array"),
+            libfdt.Property.from_uint32_list(
+                "prop-uint32-array", [0x1, 0x98765432, 0xdeadbeef]
+            ),
+        )
+        self.assertEqual(
+            self.get_prop("prop-int64-array"),
+            libfdt.Property.from_int64_list(
+                "prop-int64-array", [0x100000000, -2]
+            ),
+        )
+        self.assertEqual(
+            self.get_prop("prop-uint64-array"),
+            libfdt.Property.from_uint64_list(
+                "prop-uint64-array", [0x100000000, 0x1]
+            ),
+        )
 
     def testGetStringlistProperties(self):
         """Test that we can access properties as string list"""
@@ -434,6 +466,17 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(["this is a placeholder string", "string2"],
                          self.fdt.getprop(node, "placeholder").as_stringlist())
         self.assertEqual([], libfdt.Property('empty', b'').as_stringlist())
+        self.assertEqual(
+            self.fdt.getprop(node, "compatible"),
+            libfdt.Property.from_stringlist(
+                "compatible", ["subsubnode1", "subsubnode"]
+            ),
+        )
+        self.assertEqual(
+            b'', libfdt.Property.from_stringlist("empty", [])
+        )
+        with self.assertRaises(ValueError):
+            libfdt.Property.from_stringlist("bad", ["embedded\x00nul"])
         with self.assertRaises(ValueError) as e:
             libfdt.Property('bad', b'no-nul').as_stringlist()
         self.assertIn('lacks nul termination', str(e.exception))
@@ -552,6 +595,12 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.fdt.setprop_str(node, prop, TEST_STRING_3)
         self.assertEqual(TEST_STRING_3,
                           self.fdt.getprop(node, prop).as_str())
+        self.assertEqual(
+            self.fdt.getprop(node, prop),
+            libfdt.Property.from_str(prop, TEST_STRING_3),
+        )
+        with self.assertRaises(ValueError):
+            libfdt.Property.from_str(prop, 'embedded\x00nul')
 
     def testHasProp(self):
         """Test that we can check if a node has a property"""
-- 
2.56.0.679.gc527c65306-goog

