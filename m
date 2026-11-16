Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862433;
	b=jXeJkjKDni2zdgAoBemfyZCJ7CjlmaX3ScQlvXoNA9ZelZ83mH5yZMaDNfY2eLKfE+DZ
	 VgjkKo49dyXiHzZz5InVeGpFiem1HFGIqdL5sjOAWXbCLinpJPZyoemRk/A7oJ59AVaws
	 uCU+OBj71rqPC1pWyPAqHIlauo6k2JsdRTXcVXtCwMJlAeb11Xk9sd4idKnCXQkW74kPC
	 p4ECjeeSHf7xdquwbVhZkv2S+M6m5eP9EvPPPEyzvi3qcZJCx+qaOnHY0qyszmUDPn3x8
	 RigD7mX6iMiAL0sxbi5536Q3VWkwudqR8Q83DUObfQ4heUtcy14F1bLX6lft3Vq/5sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jPlGNQGUllWqmUH4lzVRty7A7FRP7Ti1jD8lLs2t1TU=;
	b=yplC7cj2ppOXXySt3t/kiTORuRXm3AxwNUxfrE4vZsd5keKZVQNfpU4fX+1l6tVM2HAS
	 qXrg/eUF0nseTJ3CMM2uuiEk8o9VIceRjVMMFi8dtezeQSHjTDw+od3yFLkOQ1jkhf1kR
	 B8Kggk7NV3xGZo4HND/pULtf7FxHjZgAmkjZtH8ykG7kxLfahd0AVqlkJtjgymXVOMAPG
	 z/FKBIiAoCf8eh7CCYcws7G3EW2kqtsQpSr+InxuX0ChmopFy9QdkIn7YAetgnQQfsc8t
	 yXyBEbuNRD5nlv03fK2LjP1izeJyUaImu+4APOPDTWO2phAdqXJLzcn3Hl5R2aAQ1bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WJdIBema;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19BD606A31C
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C19BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WJdIBema
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so2761563c88.1
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862432; x=1795467232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPlGNQGUllWqmUH4lzVRty7A7FRP7Ti1jD8lLs2t1TU=;
        b=WJdIBema9Fy0VVb2yMJm4K2vvVv1owxU35L0eJP8xf4aP6rtPSqyG9uFfIavMdPzli
         wpiqVTFcecByqRNwNTHoVoPvmW2xsCFgmJpreSvaxrIDlGlmLDSsRNcQdLKFRi+rnJvB
         b2gk2YPIZerYWu0J/quwLqJD0nVi6rREk6HfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862432; x=1795467232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPlGNQGUllWqmUH4lzVRty7A7FRP7Ti1jD8lLs2t1TU=;
        b=2Nca86T6dAs5buHbGZrakIuhltj7mO5kGI5aRbUyZ4H2yxe8tFUDkw9TmFOix7rv+I
         EBNfBDlcKrMjSeSQdENjsXiVb4MfVahI7ylm0VAEM9XNBooAzuzvURGLl6SMkzXF5Lvj
         pRpqVHbzgJNFk0h8cGsBQNoSUqDyZsXHwpfhDTec+RSUwJiGnhf/ptZSQP/a4rejxtJ3
         usjPVvRiXLw3GEbo8jLLSePzTpK0cLDf3H85UHqi1ZF/PoyR19uPfcabGURen59FLvOf
         WKrPkTw29BgDztjcO4e2oWEyOtzLmWzaZX/p8Cog+tG6N/S6pel+tr/O45/Iovg2PDIf
         rg5Q==
X-Gm-Message-State: APuU4Z+QxydMFsDvNjVpolDXe9rb2hb0mdP4qTpGxnyEBC0rAi7e00zS
	eBVkGgZG69uQ1UAX8ONLe0V+Q62O0H2wJlap2YPmMxC1k4ZH683DcPJONDgAHicT9nsD4CEaxsO
	hkyqGBw==
X-Gm-Gg: AZFdTZd/BlCc5EFIT7V01T3NI7SP9IdN6qbJsoK5OlXjKS8328TkLcUOo5bpN64cPBb
	QeyEEcdYIkaL0Q1Ym1t+qmclEMYu+/Pxf3r2gFhQJDEc+otaGz6RdjJ8gzx3szsJQQS512H+75S
	r4sumzDMmZQhXBykdhRpJMY2UQbgcA5sEuTTmAhZnjOyqAlNwc7PcRApfg5uxJdBR+rBpwu7to/
	VzzIp9bd0fOIu2E7d5q20EktHt39doMVrkTz+XfLS8I1p3xO31RZEjRKMvObL603v7MKJDBscHV
	tmQKcbW0qTYsUV+2Af2QqFkYaJoT9WnHi19IqJL4LvpCqE4is1jBFQ4JM/JXG44PiT5weUMB1z3
	k/MIXD1mxEeJZbxWkBWo25E4JP4ieQlZaa5520tsP80MDbpAtFxxforfSPp6Z0XorTzAqpjsFfp
	dnnfnYchezTw8d/XgLpUBouaC8J/GinPFwoktjB+V5xsfuWilrogDXOvYe39iLyahsXxX6Sybso
	LsljFQT1q9bGyQxGlatnxSniU0f5L2qfGnz3CT3Qu29pk6wu1/9OJi2k/BSYtuuaO7qNenQl3m6
	JyvBAvuT52Vboq5Sy8Q5RvU7+02fuH+kCrNGp+Y2R3t3XEmYpvmPgy19ycHH0/zDDlHh509Vl5d
	ebuVnaJYqLDS9EBsV1+vbpsQfao3dLYq7yFU=
X-Received: by 2002:a05:693c:2a0a:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-37965daa77cmr10150232eec.8.1794862431716;
        Mon, 16 Nov 2026 12:53:51 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:50 -0800 (PST)
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
Subject: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
Date: Mon, 16 Nov 2026 12:53:03 -0800
Message-ID: <20261116205320.1621386-7-dianders@chromium.org>
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

Iterating over a node's properties via `FdtRo.properties()` currently
crosses the Python/SWIG boundary `1 + 2 * num_props` times per node
(`first_property_offset()`, `get_property_by_offset()`, and
`next_property_offset()`, along with their Python `check_err()` and
`check_err_null()` wrappers). When walking every property across large
device trees from Python, those per-property SWIG round-trips dominate
runtime.

Add a C helper `fdt_node_properties_stub()` in `pylibfdt/libfdt.i`
backing `FdtRo.properties()` so all `Property` objects for a node are
collected in a single C call per node, interning property name strings
via `PyUnicode_InternFromString()`. Also add an invalid-offset exception
check to `testPropertiesIterator` in `tests/pylibfdt_tests.py`.

On one stress test (walking all ~573k nodes and ~2.06M properties across
438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
~1.8x.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch speeding up FdtRo.properties() with a C helper

 pylibfdt/libfdt.i       | 64 ++++++++++++++++++++++++++++++++++++++---
 tests/pylibfdt_tests.py |  3 ++
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index e4a9357d278a..333a25f27946 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -24,6 +24,61 @@ static int fdt_property_stub(void *fdt, const char *name, const void *val,
     return fdt_property(fdt, name, val, len);
 }
 
+static PyObject *fdt_node_properties_stub(const void *fdt, int nodeoffset,
+                                          PyObject *prop_cls)
+{
+    PyObject *list = PyList_New(0);
+    int poff;
+
+    if (!list)
+        return NULL;
+
+    poff = fdt_first_property_offset(fdt, nodeoffset);
+    while (poff >= 0) {
+        const char *pname;
+        int len;
+        const void *val = fdt_getprop_by_offset(fdt, poff, &pname, &len);
+        PyObject *name_obj, *val_obj, *prop_obj;
+        int rc;
+
+        if (!val) {
+            Py_DECREF(list);
+            return PyLong_FromLong(len);
+        }
+        name_obj = PyUnicode_InternFromString(pname);
+        if (!name_obj) {
+            Py_DECREF(list);
+            return NULL;
+        }
+        val_obj = PyBytes_FromStringAndSize((const char *)val, len);
+        if (!val_obj) {
+            Py_DECREF(name_obj);
+            Py_DECREF(list);
+            return NULL;
+        }
+        prop_obj = PyObject_CallFunctionObjArgs(prop_cls, name_obj, val_obj,
+                                                NULL);
+        Py_DECREF(name_obj);
+        Py_DECREF(val_obj);
+        if (!prop_obj) {
+            Py_DECREF(list);
+            return NULL;
+        }
+        rc = PyList_Append(list, prop_obj);
+        Py_DECREF(prop_obj);
+        if (rc < 0) {
+            Py_DECREF(list);
+            return NULL;
+        }
+        poff = fdt_next_property_offset(fdt, poff);
+    }
+    if (poff != -FDT_ERR_NOTFOUND) {
+        Py_DECREF(list);
+        return PyLong_FromLong(poff);
+    }
+    return list;
+}
+
 %}
 
 %pythoncode %{
@@ -477,10 +532,9 @@ class FdtRo(object):
         Raises:
             FdtException on error (e.g. invalid nodeoffset)
         """
-        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
-        while poff >= 0:
-            yield self.get_property_by_offset(poff)
-            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
+        return iter(check_err(
+            fdt_node_properties_stub(self._fdt, nodeoffset, Property)
+        ))
 
     def getprop(self, nodeoffset, prop_name, quiet=()):
         """Get a property from a node
@@ -1420,5 +1474,7 @@ int fdt_property_cell(void *fdt, const char *name, uint32_t val);
   * function and a struct, which confuses SWIG.
  */
 int fdt_property_stub(void *fdt, const char *name, const void *val, int len);
+PyObject *fdt_node_properties_stub(const void *fdt, int nodeoffset,
+                                   PyObject *prop_cls);
 
 %include <libfdt.h>
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index e2f9c6d5afe4..9c0104bfbabb 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -270,6 +270,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(props[0], b'subnode1\0')
         leaf = self.fdt.path_offset('/subnode@1/ss1')
         self.assertEqual(list(self.fdt.properties(leaf)), [])
+        with self.assertRaises(FdtException) as e:
+            list(self.fdt.properties(-1))
+        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
 
     def testFirstNextSubnodeOffsetExceptions(self):
         """Check except handling for first/next subnode functions"""
-- 
2.56.0.679.gc527c65306-goog

