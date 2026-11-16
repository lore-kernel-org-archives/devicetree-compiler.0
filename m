Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862418;
	b=xDorvKmd5xeZKfCatgL31ioMz/j3hy2UD+ctTzcqVkTJeDY42iJGUfFZW+WQ6e0ca4hW
	 AoHiD+8oj/TonCUgb30ua/gBnbIzCaz6G9M7XSW574nZbGIlkFLhM9xYgwAYFR5uw4can
	 l0F7sosVinZGU+M9L9iWCIdTS/TCSclvuE4rirNgAlsGRKpf/Xo9TPMXzGFVX3y8rt0IX
	 KETbPPL4KmDYmFLDjrNLceJM+0aztWsSH47xmjwY1J/gQGHu8XN71ZROa2twZUptcYjyg
	 xQf6d6ww+cda3ifOiVAU/QJg7zIwlzE5zxzzXjET8FnEyHbElSlCKWXtP+mhaRopTpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JBnzKQZzBT4WyH0+pQkXtO3eXK3ZrINhKYQbrALuTEY=;
	b=d9PwNpZvcxaZYd2+R8mnqTsyOwGzTpGDZyodw4gZG1u/8Y0tKc0cTJg8dbaVh3oNGkhq
	 jg/tBCcc61vMRT9Ok4UR+hNhZhzXv2fUmqOHhOujc+mug6nwNmr9tStdJ/3qir/gKyukx
	 Jd4MIC6mKIppOtlOyG861bOAWsU9Wrxax3goysVM/5BllKqxn80+hUhlsUjjVlbO7NKtK
	 YbaCqinEF+M0Go7WbzMfoNGb5CY4eJ0iL5kCSj34NTzRnkvt5fmM5U/zV5jjf6PSYgahj
	 y/q5mgAxVa9uKo/5ljQIb4nBe5vWgvrCSfVylZaC+TGeefkZy9YU6sAZhCYQFsC2Ifw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=deEhDzMw;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C256606A33A
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C256606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=deEhDzMw
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so10873208eec.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862417; x=1795467217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBnzKQZzBT4WyH0+pQkXtO3eXK3ZrINhKYQbrALuTEY=;
        b=deEhDzMw8mkqzMDHotoO7tdUq4HM4qpNrY2H/iDB8iqRi99H7InpKzckbLq1QOHbkP
         ajOxMhcqfpvUAvx8qCi1/1oJ1A9WODrejNe6gQQhmK4i41WLluJXigQR6D9FrPB0G+X2
         eHYEgosAh/dTUUDqhqCu8ae6b7e5hlJf/kr8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862417; x=1795467217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBnzKQZzBT4WyH0+pQkXtO3eXK3ZrINhKYQbrALuTEY=;
        b=s6N58eAzifwUIOWZuOv22zx/qWF418pOGdG+fKod7JE/+38ZgYEeFVAroYuzOIAq7A
         OTkPwtH6BRpI9aC1txixl/973iKB2vltcj0vVowDDpnYz6bLHRbQGdmWH3Haqo0FSVWR
         e3eGosCQrZugkBUb7lRp8PE9FvoSTgStYe778bIHrPt/Nwm7fUfhE6SomK4ByIJeEGiV
         cXQi3aybWdh1/ZdXDEQssWnmrLv3HKELpq8GqQZYEuWyZZg/20JHI22WzEEHTdO1io+d
         kFZaMwWjupCrPO5AqWQgbIlAR8EjXK3Asj+sdnHHWRHbY9afnwzt06cBTnxNlKhXPUCX
         KBXQ==
X-Gm-Message-State: APuU4Z9s0hpEG7cb3kKfLmNa7p4vxOPt4rVaTLJ/0/D72PjZ/gQ/uUHA
	KY60OFzHUc9xry/pqs2C5bMzo3Jlz92yIAIVFFB9c6xVRQAwlD1gqVF5Z86vDnowQ8XWb1isJmS
	ePqTOaA==
X-Gm-Gg: AZFdTZf0G97I3gR88R7gZ5OQtxXKWmmwlOG5XMWY33VVaDPB//DRRBlACkIKqBf6IsL
	GHZK1A6mj0Tnm8d1+YlWs+2GXnFuRsd3sTGLwHi5IOovzW7r73tvnb6zO4gZ+NpZWd7GuohMy1Z
	KzU/y6oNHHbmKoEFZ7xaKvHIlbybOSTd3ZcANkZJWO/R9IyqHqKuvFpnJQ4nbqOclIN6T8tyqz9
	jYmfbwVHBOMuKlwatp4682vUwM7FgjTQ4+9SHktSAq5d+4eJN5PX0nxR2uzWUYliReMUGwcxM2v
	ljA9lQqjtq3pzHsbnfGkZLq+/ktr5USostV0TrGw7481t/PIRVJvybekvkZr+RHgh8eG832OWUV
	++roPhiLCdw2TM8XRwmSFwTj9SAh83qypqCFCu1sILxU8oDX9JFGfVPTYCDm49XxXREWISKJRPL
	DeynlyOXlxJ8ft6nCG7/QGmWW+ufgfHuMz6FtVBR1hPQBD3F/TARoqp6hgUU07YziOvRLxSSt55
	EkTbBpsQttqhmZpJGCdgX6lH6mrQrmfop7mIoPFxUlubZzk2REZCqYq8OyJCe6BsuHftk/6HK1x
	OiU9x7DCca0Sijp6dXQBB3jnBjBfOJAi1Mlf3uj+iHUAPHyGvvjTRLb18D/rfPjWvxIWxuZ98p7
	r1gpeEdxCMyrpQA==
X-Received: by 2002:a05:7301:a4:b0:378:b1be:2d3e with SMTP id 5a478bee46e88-37967ae558emr12079086eec.32.1794862416514;
        Mon, 16 Nov 2026 12:53:36 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:35 -0800 (PST)
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
Subject: [PATCH v4 02/14] pylibfdt: Make Property a subclass of bytes instead of bytearray
Date: Mon, 16 Nov 2026 12:52:59 -0800
Message-ID: <20261116205320.1621386-3-dianders@chromium.org>
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

`Property` represents a snapshot of a property's name and value read
from a flattened device tree. Making `Property` a subclass of the
immutable `bytes` type instead of mutable `bytearray` prevents callers
from accidentally mutating a `Property` instance in place when sharing
it across data structures (such as `DeviceTree`), makes `Property`
hashable, and allows `Property` instances to be passed directly to
`Fdt.setprop()` without converting to `bytes` first.

Also return `bytes` instead of `bytearray` from the
`fdt_get_property_by_offset()` SWIG typemap and drop the redundant
`bytearray()` conversion in `FdtRo.getprop()`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch making Property a subclass of bytes instead of bytearray
  (David Gibson)

 pylibfdt/libfdt.i       | 17 +++++++++--------
 tests/pylibfdt_tests.py |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index fa5f499ed96d..8a7dfed85f15 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -492,7 +492,7 @@ class FdtRo(object):
 
         Returns:
             Value of property as a Property object (which can be used as a
-               bytearray/string), or -ve error number. On failure, returns an
+               bytes/string), or -ve error number. On failure, returns an
                integer error
 
         Raises:
@@ -502,7 +502,7 @@ class FdtRo(object):
                                quiet)
         if pdata[0] is None:
             return pdata[1]
-        return Property(prop_name, bytearray(pdata[0]))
+        return Property(prop_name, pdata[0])
 
     def hasprop(self, nodeoffset, prop_name, quiet=()):
         """Check if a node has a property
@@ -893,7 +893,7 @@ class Fdt(FdtRo):
         return check_err(fdt_del_node(self._fdt, nodeoffset), quiet)
 
 
-class Property(bytearray):
+class Property(bytes):
     """Holds a device tree property name and value.
 
     This holds a copy of a property taken from the device tree. It does not
@@ -902,11 +902,12 @@ class Property(bytearray):
 
     Properties:
         name: Property name
-        value: Property value as a bytearray
+        value: Property value as bytes
     """
-    def __init__(self, name, value):
-        bytearray.__init__(self, value)
-        self.name = name
+    def __new__(cls, name, value):
+        obj = super().__new__(cls, value)
+        obj.name = name
+        return obj
 
     def __copy__(self):
         return type(self)(self.name, self)
@@ -1275,7 +1276,7 @@ typedef uint32_t fdt32_t;
 	if ($1) {
 		resultobj = PyUnicode_FromString(
 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
-		buff = PyByteArray_FromStringAndSize(
+		buff = PyBytes_FromStringAndSize(
 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
 		resultobj = SWIG_AppendOutput(resultobj, buff);
 	}
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index ae46b29a8f5c..78d8976c0cf3 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -191,6 +191,7 @@ class PyLibfdtBasicTests(unittest.TestCase):
         root = 0
         poffset = self.fdt.first_property_offset(root)
         prop = self.fdt.get_property_by_offset(poffset)
+        self.assertIsInstance(prop, bytes)
         self.assertEqual(prop.name, 'compatible')
         self.assertEqual(prop, b'test_tree1\0')
         for copied in (copy.copy(prop), copy.deepcopy(prop)):
-- 
2.56.0.679.gc527c65306-goog

