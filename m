Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570628;
	b=XfKpSf8sdUk083uknLwUTWyQmwLFqT954rGrs+TuDKv9n0SEu7C4wy3IW7TbSp+LR/Yi
	 l8sB4H34JSkGITStRg094yXF4QQ5nG3d0a2hhfR9iA+hB5GgV5x7yYm7NEO0l/UWC79ZT
	 7dK08yijcCvtbC9XHpqmgGsdkuiJ5gFnd5vsavzNNGAD9fOl23Eubu5+Vi6QkA1V9TGLe
	 UZwhrRN4Tw/UUNVrnUHh8cewMwBCShaNRwz7JNjAlJjMVejDiLNB4IritB/Olm914LOKY
	 NaQ37b5ndbQtOxvG1PjWFGLuE7oJjXGmfWRCkdtnsumBKyo0INNmEy7nlWc+gvKYMTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PKCTTttSXS/mV308tUM8IvVjrohPmFSHkzxQ9oTcAQ4=;
	b=ufUYbL2jN2kqIyg8az5SHvKnrFyu03IjdsNrIba/UNruoFwusd5vku2hSM9eFNz4htuP
	 fGZ+5NXqshW4uxa76pHsKJF+xoF493kwyZqIUuSn1dNM0nBbnFgKsOx0PtON72LWZfSQg
	 uKsJqQARfh0YbjDMq1Gp1BDAGUcLx7cJK+MTTHIjiIFaX0S2JcYsvYkfql3J7HMf+cKEg
	 TDk2PzGjUtH3SBz6kd2SerOCZtJn5A4EQdwmqE1MIh4X6DOLHXfH8KowpFQbhscAetX3n
	 aZ8PC3DhcnXeTyloViVuZ46RQq2XKIc3HU9AANjtXpah5JWsvLDGb7XCxpEPAohW4Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="hJC/96vu";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D2B606A32C
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D2B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hJC/96vu
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35829219da8so4051158eec.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570627; x=1794175427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKCTTttSXS/mV308tUM8IvVjrohPmFSHkzxQ9oTcAQ4=;
        b=hJC/96vuzBD1EpCBPOAQry3o9JiLg28elGkbta5rCWjfP40KXzCA5h9qcYWqBAGIbI
         7STrNFFSOFzvzCA6EPLBi6JRKXnhpORtsWcWTjPxIXD7m9ySOCFFAnmsWDKNCKlD/vLe
         IlpQ/XUGvvyYEByAsF2UtBEAoejgD3dKTXJeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570627; x=1794175427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKCTTttSXS/mV308tUM8IvVjrohPmFSHkzxQ9oTcAQ4=;
        b=QqsmnVX93euYUOtpdbfkmfqP/LP04/lZJB/HivAb3SAzCKm5B5hgZyEbHShr/KeVqG
         Q+eAmPd8Onaz4ZRYYGr/dU9+ab+QmeokPHefqpfruyjVbYCGZ3LgRU2VngBnl7p1Ba1v
         ljc+PJXWaWUUKUZIAR/cbLM8Hj4+ADe+eDXz7KENOPyjNwuR39d7F9Vt0BbEUJXdoNSq
         mR4Hydri+1dDczPBrgx4l6kRJCQ5oblua8n3g39DJN7AqrnS7Loho9YeH3xGnV9cCyWR
         lHIq2zrmweB4AwTCszNtQG6l+pnht1RiCCRFJ+w27U58ys7q5DMkDLlzlj2IsylLCREf
         5tzw==
X-Gm-Message-State: AFq9FYKaoW/YH9F+SO1bzZk7hl7kU0FquRyY+ZxK18RtV2oqacuz1zNu
	AusphgxOLP0keVWAnDmMgfQUZEgdQx1BHH0RJM9cO7f5CqdgYbV8+sYSoK4SOZY0ugnRvHF3caW
	nxnzPmbHD
X-Gm-Gg: AYBFou0w3tHismeYtWzAmOPTUD8xkSq/ImyPUtk9y/38JAYhfVYXm8dnwyuhxThnKGC
	MR8RL6c4pNc61HbFuk6oCeIq0An5Db+4tbOBzVFnoz7qCLFjQDJXxTNDS/S3pQCWFyVLXSbw8pp
	X+bKAxD3JY15EDw3Li1ofQFh23e0kIYdRzafV8v5ZsrS7IkTeDGna46vTkbyT9ffir10uW9QtLH
	qD9iQbmN9KLM45QtcDVKxB7LaQiS7e3+ZLZpHrhJDszybI9vIWWhwT5VVGdq+3QRLIptWZ8y+rG
	CPOBcAPxdzNYwIhPdvM28g/3cTIIBpBPKEJ+FM286v1DJ9rr6qbVnkCd9KHWjkeYlHqyjakPnlp
	2p8oN4SmssA+YQxKlyiMfwx5vOXK4qzN2l3DTof9TSDJ5h8Rf2HEy2ZEbGF5YcZUfYxpGzFS+6F
	QV39hYvMj8l163gtcrHNuDkhRVCO/ciM7x+b4Qntza9Xdx0yodQNCEAwVa6VAbOUPi6hdOy6TZ2
	bFM9WO35EZ9VspeCAtj0eRqTI8TQj+fvx45giF3wSdmQ4cB2xSzg/FJbcx05dMJof8vawKc4Odq
	zKauFBT66t38hL7EAqdQcBGD2QuYgnABfeCeOzczXFKMIMKM+w41oO3YUCj8x9Q3SrshBc0QYa7
	jg6HJ23Hifgrsyg==
X-Received: by 2002:a05:7022:1588:b0:1a3:d292:f696 with SMTP id a92af1059eb24-1a949f6c426mr17161036c88.16.1793570627439;
        Sun, 01 Nov 2026 14:03:47 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:47 -0800 (PST)
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
Subject: [PATCH v3 06/15] pylibfdt: Support copy.copy() and copy.deepcopy() on Property
Date: Sun,  1 Nov 2026 14:01:13 -0800
Message-ID: <20261101220224.1436242-7-dianders@chromium.org>
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

`libfdt.Property` subclasses `bytearray` and has a two-argument
`__init__(self, name, value)` constructor. Because `bytearray`'s default
copy/reduce protocol passes only the raw byte buffer to the constructor
(and does not copy instance attributes), calling `copy.copy()` or
`copy.deepcopy()` on a `Property` fails with `TypeError:
Property.__init__() missing 1 required positional argument: 'value'`.

Implement `__copy__()` and `__deepcopy__()` on `Property` so shallow and
deep copies preserve both `name` and the byte contents, and add a unit
test in `tests/pylibfdt_tests.py`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New patch in v3 to support copying Property instances in DeviceTree
  (Simon Glass)

 pylibfdt/libfdt.i       | 6 ++++++
 tests/pylibfdt_tests.py | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 51db9535bd39..fa5f499ed96d 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -908,6 +908,12 @@ class Property(bytearray):
         bytearray.__init__(self, value)
         self.name = name
 
+    def __copy__(self):
+        return type(self)(self.name, self)
+
+    def __deepcopy__(self, memo):
+        return type(self)(self.name, self)
+
     def as_cell(self, fmt):
         return struct.unpack('>' + fmt, self)[0]
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 18730965bd02..ae46b29a8f5c 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -4,6 +4,7 @@
 # Written by Simon Glass <sjg@chromium.org>
 #
 
+import copy
 import struct
 import sys
 import types
@@ -192,6 +193,11 @@ class PyLibfdtBasicTests(unittest.TestCase):
         prop = self.fdt.get_property_by_offset(poffset)
         self.assertEqual(prop.name, 'compatible')
         self.assertEqual(prop, b'test_tree1\0')
+        for copied in (copy.copy(prop), copy.deepcopy(prop)):
+            self.assertIsInstance(copied, libfdt.Property)
+            self.assertIsNot(copied, prop)
+            self.assertEqual(copied.name, 'compatible')
+            self.assertEqual(copied, b'test_tree1\0')
 
         with self.assertRaises(FdtException) as e:
             self.fdt.get_property_by_offset(-2)
-- 
2.56.0.317.g454f8302e1-goog

