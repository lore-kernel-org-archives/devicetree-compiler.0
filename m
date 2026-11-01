Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570614;
	b=RBkgQ0NZINQBzwBEII10LEBPMCUBaQA3R8xRCRo16eRhwGw4rm9TRGNYlyMup2ddjQnk
	 3/EFPx3q/gt9KHVhP+wvsKQCMpoahIVbBE65g99PG7aDrwNJyVSPdTD7gmReMKKzgKzd+
	 xIe03Pk9XL0Dx1g27BXIjsHm1zn2NF+3YTScHlSlazpD/jE6KnO/xriP4+fLv8rSUlRgd
	 E1uC7QI1RsqtfJHU9Tb9/z9umal4lDJA2cmdfmQ5nZ5YZ7Me4S+ANLuP5BnU/QbT4oWPl
	 wRGXbSQOlegFq0TqhxClqikiYAhZRYu9Nr2riFp0LT84Jcso1rNXjbrHqG/RZX+7+bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H6oyrULPUMKEvcl/yJFleG9B/xW31TKnvnu3kNvY+DE=;
	b=GzvT8WTmFngvU2/kDsGZx2fL8VlmLKCIwHNA+lraZHvwakk6+cm5WvBZ+QOkw1PVeK5i
	 88Y30k9eTFdigrBsH8RPNziNNIHe/Wp7TuxOoWjxxmN4CmVpiA5dv2W5sGl49kDs1Dzcj
	 Q+IS7ynA9PIpBveRWPGrEsLq3LycacX7HUIoKdlKwUVsfxKN4oT1TI1SJOjZ6kKzwZtBu
	 uxmS/Fp4PbjzQshXTDVCYqPOuLT6CPIdNrvHFYtEwUrm8U6vdhAhsICVJZf8AXz8eP00c
	 CjoWx7E6FqitgljSMRqLPTCOGnPg3SZS3qFWigE7mtfLp/BGBLZ9RTPDGSdLqvQsSNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MdKAWEDC;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E82606A329
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44E82606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MdKAWEDC
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1927328c88.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570613; x=1794175413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6oyrULPUMKEvcl/yJFleG9B/xW31TKnvnu3kNvY+DE=;
        b=MdKAWEDCcS2gf1aRPpXCuW2HhP+CsyqoTGCTIGDlElskl4MjosxEVfaCeln5bv1GMx
         ebAzMmoCLSUTM/8nCT8ij7Qy4duhScepSEtgdWoKzbOs7NpE99HDAm6GxzDduWjku8Kz
         mud45lC8v+zl9yZwQaHIU9pS28fM/WGDTRa98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570613; x=1794175413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6oyrULPUMKEvcl/yJFleG9B/xW31TKnvnu3kNvY+DE=;
        b=uwAOmUXeM7ObMrICDvqRbYf/kjSqVnTrwpTDu6+SP5Nltm9xGA/6dnjAkUlSL8gU0F
         zDKifMyMH5gQCqtQGlv+oANTosUHIpBvj6whVC4TlGEXMB3HkqzGiGvNAoveOiZ5ZISV
         lSrI/iPgbfZ/0cRBLto/Txn9nbDR+TH0lr5EW3yuUDMqjkBiAB9Eo7m6t768V/0fl0zR
         78G8cY/L6QD6oXNLydHoZriMNDKNrupu7DrnQPfhourMJeNHLg3W9kMz3C0YNictLAPE
         VPsYfaXJkYJyqUmu9M0gP9qGtVd01sRYO7aXXh49w1rEuF9+nQ6O4rHeL0Cf57xxOoR8
         WP5Q==
X-Gm-Message-State: AFq9FYIuSAr8oZoSa1716CES+HgKDvC3hPQQJvoaGEWMxuJ7bpvK34yb
	k9zhM3zE9K3TOzoZW8EiUYD77yN+PFnZG+CCFMN0fa/qQUn2zVOArJzsbYrNfzHGe2rVUXQQ0DW
	EoJRzH4YJ
X-Gm-Gg: AYBFou3JzgwCU5sq0CAecWIsGB/INOb6047j0U35cJwjVW/8DfN07BVhKcN/uKCqmbA
	QiUez3v12kvxaabaSLAhVvwTJp5/Oehl7liHaLAmPRj4iCXJjnrvzhpQb6hv4bf+ZEtk58oP/Fk
	Mfzdpa68aGdT8NGMjW3f+bRM9BzJHsVme50u/0NPm9Dk9quxtpW0Remj/NzbyVGkqbE1qvhB0br
	JLopmTiuWbB0RxuXbk6uF66zeVb81o99aUxtc3SepBa0eiQ6IHavHq1ZWEHNjq2qpnNmLxRj1De
	+Sh9cQXCZKu4GgTEC1oyijOlpPGTY52urcQTtFGq1izgmEuM3BGNGE4MbaeWAMxhzMtDFRhCTbL
	94HJYDTTPW1klKtvLTbG21ot2KqS05DgvCXb6pDJA1hbZVCMurMt7XYWmz27FmWkFLe9E6MGR3N
	mP/WowCpMTYcJJn/O/1P8o6KREljLm0Qe4roXOp5Yy516Tl51uFQjV0UcSz93dy/1qLpJDLMxOb
	uO4hvzFYZaSTOj1UIUDV2gRM60W/n6/WA5qkmhP60aZcdm12FfHKGp9hthBIa5gDMeQsWlpydcf
	WzJAz+y9DP01uY93zRPxKlnDQqqq8e0hYt5+GwgnLtSJQtRdlO5Hbq4FGZ6nUBnkH6NIzm2O4dr
	K0QN/WeIc8WUXIw==
X-Received: by 2002:a05:7023:90b:b0:14c:8461:b3ef with SMTP id a92af1059eb24-1ac5e6f5132mr15587123c88.24.1793570613180;
        Sun, 01 Nov 2026 14:03:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:28 -0800 (PST)
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
Subject: [PATCH v3 03/15] pylibfdt: Clarify iterator docstrings and test negative offsets
Date: Sun,  1 Nov 2026 14:01:10 -0800
Message-ID: <20261101220224.1436242-4-dianders@chromium.org>
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

Follow-up improvements to commit 6b0371afc532 ("pylibfdt: Add
subnode/property iterators and get_mem_rsv_list()"):

- Document in `FdtRo.subnodes()` and `FdtRo.properties()` that the
  device tree must not be modified while iterating, as node or property
  offsets may shift.
- Remove the inaccurate `Raises:` section from `FdtRo.subnodes()`, as
  `fdt_first_subnode()` and `fdt_next_subnode()` map all negative
  returns from `fdt_next_node()` to `-FDT_ERR_NOTFOUND` (which
  `subnodes()` quiets).
- Add a test case in `tests/pylibfdt_tests.py` verifying that passing a
  negative offset (`-1`) to `properties()` raises `FdtException` with
  `-libfdt.BADOFFSET`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New follow-up patch for already-applied commit 6b0371afc532
  ("pylibfdt: Add subnode/property iterators and get_mem_rsv_list()")
  clarifying iterator docstrings and testing negative offsets (Simon
  Glass, David Gibson)

 pylibfdt/libfdt.i       | 9 ++++++---
 tests/pylibfdt_tests.py | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 0db7110b4a38..5c8859b37df3 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -204,14 +204,14 @@ class FdtRo(object):
     def subnodes(self, nodeoffset):
         """Iterate over the subnodes of a node
 
+        The device tree must not be modified while iterating, as node offsets
+        may shift.
+
         Args:
             nodeoffset: Offset of parent node to check
 
         Yields:
             Node offset of each direct subnode in order
-
-        Raises:
-            FdtException on error (e.g. invalid nodeoffset)
         """
         soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
         while soff >= 0:
@@ -465,6 +465,9 @@ class FdtRo(object):
     def properties(self, nodeoffset):
         """Iterate over the properties of a node
 
+        The device tree must not be modified while iterating, as property
+        offsets may shift.
+
         Args:
             nodeoffset: Offset of node to check
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 2a0509c7802e..93408745c575 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -171,6 +171,10 @@ class PyLibfdtBasicTests(unittest.TestCase):
             self.fdt.first_property_offset(node)
         self.assertEqual(e.exception.err, -libfdt.NOTFOUND)
 
+        with self.assertRaises(FdtException) as e:
+            list(self.fdt.properties(-1))
+        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
+
     def testGetName(self):
         """Check that we can get the name of a node"""
         self.assertEqual(self.fdt.get_name(0), '')
-- 
2.56.0.317.g454f8302e1-goog

