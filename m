Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827108;
	b=n8qGcGsEvPvCyhck0X3R9930lvktmjoK904mSDJUzUckYAwyqJTgm1xWZiU52QuJ/STC
	 YP8Km0OgwTTMtTnLZO75lZwJIVaLZTQFbnu+JA+CsMgwEb/EmwXfiJB/VZOP8IUDqQBmP
	 /53MUHPFVBqnoR9/Gpjk6brnSvxAY2Cn6oJyi3A223z2LxsFf4zeAzR3uQK9wNVvtoIpt
	 qmVXuBuG8LkMXJ0DgJ1rBd9YNeXCZWGHtj4wcH34Zm6yUSBbG5/6r6CRWmjDzoiyrXQyz
	 33NAPsWpZxCYs+sX2DeKcnUIbJN9MuiFl7aSqC3VusKqYPLzFKYGgvMK8scvGOCGfxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bqqdV8xa5JhrtoEdMex9hlMalc8ioyP+Ki6mKLZennU=;
	b=07O9AbixpM/0vNx2dGEcIlqfI5xl4YOrXAaO5Zsua60PlYURQXTnaTKIFqWBcMsWUSjP
	 I7bRTvXJ5PFVV1bR++XHVBuxdfssrIry4Fr5jrjvVirkoVvB6vbHVPh27x2n7mZOELpLW
	 O7s4K6u4wsSjkmaYPR25oQhtR/589zu6sx2AQ/aUVOKPgE5YepB8xSs+adXapzQZk+LYO
	 HPNwu+FeSpcEdYXXQCJvBFTBrsYyB71COFBj9ZtKzk8njOdo8UdUarZRIYd21Y6jM214V
	 Y4Eo3X/nlqCSONTupfPWSdrYZUUPKN3xjm3AgP73/ZltkSGPbATw2MgmH8MVdDxiNqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Ag0SD/AR";
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1065606AE33
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1065606AE33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ag0SD/AR
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so703768fac.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827106; x=1794431906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqqdV8xa5JhrtoEdMex9hlMalc8ioyP+Ki6mKLZennU=;
        b=Ag0SD/AR6jr7IcyENf6nXpXBFV0BuRKCueZjrMT3aNoGFrrZxqXqRs7b10nWMfZbqC
         RpKCFvz+mfiHwY3HVwnRPA6BzhmO4d3nPnkSHf4wfQ5oB1UxE1u0OYpUWbPxWfROT9lQ
         +BGbJ6rjSMLPNq+9prEI9uXDyoqc+hqlOew2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827106; x=1794431906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bqqdV8xa5JhrtoEdMex9hlMalc8ioyP+Ki6mKLZennU=;
        b=MXrrk4nz3k71wBBxtOXFWZVQMgVfnmAF65w5n5h18H28R8AOfMMM/nV1cRxeTObmuz
         hsBg8JkGP2zhRyZ+6aUBf/HmP4SXys+5v8YR//GbijdRwGTKxyS2Z81HJ8Y7AuzIwyYC
         cDsWQnLZvdHlv/4IYrMfcx1TxG4LdexkfSJ5l//txNboTTP3jXMRNrhUYLBogNngbsIt
         nDHf9dkotoVOYsUtjMfpicD85YYxIGp8XP/k1MbF+DgdcN8+wDD55ALOVN9qgJmlA4D8
         ZrDosY+SpG8H+cCvt8c91oevdgCdmJCQeQNUEx4RlPI1i5cKglY91bo7ydMWVWiOoF0x
         TkeA==
X-Gm-Message-State: APuU4Z+no9EQPm64rUNBWme5ZTlLsxA/ayWSqFTHJwdJNKZkqxnVS+b0
	YGWCjYo+z07N1yodf0YNuqgqx0qS1MgDYsPJWjaTC9P018c+qoZ6ZH7Yh5IdodGJJUBsUUVwR+k
	dFHc0lA==
X-Gm-Gg: AYBFou0CwbUZqyQPKDmquT5PlxXUhYnkxCVoeT/OS1nnU32GAMFnFSu0HDj+qbGI+G/
	xGSfNxJzpfLhd73gnAJQnlIZVOna36j6toWCBhF80P195rRwVJLJ51S5FEjD57eyC6frmRUnP3v
	O9qpinXmuh68JzEILr9ZdJYxFquNba80jxYQwhV1tKKAcmILEtOIbhxvY7mkWs/QiMEU+r1CtW/
	CJwK1BiaMIedJ3nu/ZOyoi3/firzInowDPhqvBCZFcuCpIp6Vv1O7KHptZEIGi+zaQHrf9b6nrh
	cmA5Rie5QKghes8npFZX7raWMOW3waUazLdU84qq0K59Cga3XJJ1ck/70DGDx9i33eC+CP9tajW
	4ahhXsix2cpdctctjoRblEX/Kww7QQvOQZeCGYbdunSta2OsQjBDk++p8rxqOig310Jq9hHq2rf
	qN9YATUm1T8XpeM+lTyZsgV6v3QMPdAg2nvnNnTkrn55mdndx3kxDEV+CCC4M/sv8SmB7Zd1rkA
	CW7LQe75Dj9CjmAmyTAVFETM6GoBSu/kZKkn5HKfhccECMFefFdvhdJRRVRgYmmHewC6myPNhkn
	69Af1+q4BXBRSMAZVkFp5jSNaYNhNLQqegQkc11E2Ztikc7iwoxcyYcPGPTjhE+nEWo4Xb9yNFZ
	VOzuheltrwrkRLtQqFp16gA==
X-Received: by 2002:a05:6870:4208:b0:4a7:54c0:b2fe with SMTP id 586e51a60fabf-4a907821f90mr10512776fac.50.1793827106173;
        Wed, 04 Nov 2026 13:18:26 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:25 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 01/15] tests: Check each error when merging a dts file
Date: Wed,  4 Nov 2026 14:17:40 -0700
Message-ID: <20261104211807.972610-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104211807.972610-1-sjg@chromium.org>
References: <20261104211807.972610-1-sjg@chromium.org>
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

When the parser merges the top-level fragments of a dts file, it can
report that a label or path is not found, or that a label-relative
reference is not supported in a plugin. Most of these errors are not
covered by any test, and the two tests which do reach them only check
that dtc fails, not the message or where it is reported. The merge
logic is about to move out of the grammar, so this needs better tests.

Add a test file for each error which is not covered, and check the
message and its position for all of them, including the two existing
ones. Also check that merging carries on after an error, so that later
errors are reported too, that a reference error is still reported when
the parser finds another error, that a labelled reference within a
plugin adds the label, that / { ... } and &{/} { ... } differ in a
plugin, and that a label in a plugin becomes an overlay fragment if it
is not found or is written as &{label}, which applies after any local
merges, since nothing covers these either.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Reword four comments in the test files
- Add merge-root-plugin.dts to check / { ... } against &{/} { ... }
- Add merge-label-base.dts to check a label which is not in the plugin
- Add merge-label-braces.dts to check &{label} in a plugin
- Add merge-label-order.dts to check the order of &{label} and &label

 tests/merge-delete-missing.dts     |  9 ++++
 tests/merge-errors.dts             | 14 +++++++
 tests/merge-first-ref-relative.dts | 10 +++++
 tests/merge-first-ref.dts          |  9 ++++
 tests/merge-label-base.dts         | 10 +++++
 tests/merge-label-braces.dts       | 12 ++++++
 tests/merge-label-order.dts        | 17 ++++++++
 tests/merge-labelled-plugin.dts    | 12 ++++++
 tests/merge-labelled-relative.dts  | 14 +++++++
 tests/merge-omit-missing.dts       |  9 ++++
 tests/merge-parse-error.dts        | 17 ++++++++
 tests/merge-path-ref-missing.dts   | 11 +++++
 tests/merge-path-relative.dts      | 12 ++++++
 tests/merge-root-plugin.dts        | 12 ++++++
 tests/run_tests.sh                 | 67 ++++++++++++++++++++++++++++++
 15 files changed, 235 insertions(+)
 create mode 100644 tests/merge-delete-missing.dts
 create mode 100644 tests/merge-errors.dts
 create mode 100644 tests/merge-first-ref-relative.dts
 create mode 100644 tests/merge-first-ref.dts
 create mode 100644 tests/merge-label-base.dts
 create mode 100644 tests/merge-label-braces.dts
 create mode 100644 tests/merge-label-order.dts
 create mode 100644 tests/merge-labelled-plugin.dts
 create mode 100644 tests/merge-labelled-relative.dts
 create mode 100644 tests/merge-omit-missing.dts
 create mode 100644 tests/merge-parse-error.dts
 create mode 100644 tests/merge-path-ref-missing.dts
 create mode 100644 tests/merge-path-relative.dts
 create mode 100644 tests/merge-root-plugin.dts

diff --git a/tests/merge-delete-missing.dts b/tests/merge-delete-missing.dts
new file mode 100644
index 0000000..b36e39e
--- /dev/null
+++ b/tests/merge-delete-missing.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+
+/ {
+	label: node {
+	};
+};
+
+/* Try to delete a node using a non-existent label */
+/delete-node/ &nosuchnode;
diff --git a/tests/merge-errors.dts b/tests/merge-errors.dts
new file mode 100644
index 0000000..1e97088
--- /dev/null
+++ b/tests/merge-errors.dts
@@ -0,0 +1,14 @@
+/dts-v1/;
+
+/ {
+	label: node {
+	};
+};
+
+/* All three of the references below are bad, and each one is reported */
+&nosuchnode1 {
+	prop;
+};
+
+/delete-node/ &nosuchnode2;
+/omit-if-no-ref/ &nosuchnode3;
diff --git a/tests/merge-first-ref-relative.dts b/tests/merge-first-ref-relative.dts
new file mode 100644
index 0000000..eece7a7
--- /dev/null
+++ b/tests/merge-first-ref-relative.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+/plugin/;
+
+/* A plugin cannot define a node using a label-relative reference */
+&{label/node} {
+	prop;
+};
+
+/* Later fragments are still merged */
+/delete-node/ &nosuchnode;
diff --git a/tests/merge-first-ref.dts b/tests/merge-first-ref.dts
new file mode 100644
index 0000000..8f23a44
--- /dev/null
+++ b/tests/merge-first-ref.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+
+/* Only a plugin can start with a reference */
+&nosuchnode {
+	prop;
+};
+
+/* Later fragments are still merged */
+/delete-node/ &nosuchnode2;
diff --git a/tests/merge-label-base.dts b/tests/merge-label-base.dts
new file mode 100644
index 0000000..1a0a8bb
--- /dev/null
+++ b/tests/merge-label-base.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+};
+
+/* A label which is not in the plugin may be in the base tree */
+&{baselabel} {
+	prop;
+};
diff --git a/tests/merge-label-braces.dts b/tests/merge-label-braces.dts
new file mode 100644
index 0000000..d5f8d0f
--- /dev/null
+++ b/tests/merge-label-braces.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	label: node {
+	};
+};
+
+/* This becomes an overlay fragment, even though the label is in the plugin */
+&{label} {
+	prop;
+};
diff --git a/tests/merge-label-order.dts b/tests/merge-label-order.dts
new file mode 100644
index 0000000..f7923a0
--- /dev/null
+++ b/tests/merge-label-order.dts
@@ -0,0 +1,17 @@
+/dts-v1/;
+/plugin/;
+
+&basenode {
+	label: foo {
+		p = "first";
+	};
+};
+
+/* The fragment for &{label} is applied last, so "second" wins */
+&{label} {
+	p = "second";
+};
+
+&label {
+	p = "third";
+};
diff --git a/tests/merge-labelled-plugin.dts b/tests/merge-labelled-plugin.dts
new file mode 100644
index 0000000..3849cc5
--- /dev/null
+++ b/tests/merge-labelled-plugin.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	label: node {
+	};
+};
+
+/* Add a label to a node defined in the plugin itself */
+newlabel: &label {
+	prop = "value";
+};
diff --git a/tests/merge-labelled-relative.dts b/tests/merge-labelled-relative.dts
new file mode 100644
index 0000000..9bedfd9
--- /dev/null
+++ b/tests/merge-labelled-relative.dts
@@ -0,0 +1,14 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	label: node {
+		subnode {
+		};
+	};
+};
+
+/* Not allowed even though the reference is found */
+newlabel: &{label/subnode} {
+	prop;
+};
diff --git a/tests/merge-omit-missing.dts b/tests/merge-omit-missing.dts
new file mode 100644
index 0000000..0357648
--- /dev/null
+++ b/tests/merge-omit-missing.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+
+/ {
+	label: node {
+	};
+};
+
+/* Try to mark a node using a non-existent path */
+/omit-if-no-ref/ &{/nosuchnode};
diff --git a/tests/merge-parse-error.dts b/tests/merge-parse-error.dts
new file mode 100644
index 0000000..c39318b
--- /dev/null
+++ b/tests/merge-parse-error.dts
@@ -0,0 +1,17 @@
+/dts-v1/;
+
+/ {
+	label: node {
+	};
+};
+
+/* Reported even though the parser finds another error below */
+&nosuchnode {
+	prop;
+};
+
+/ {
+	node {
+		prop = <(1/0)>;
+	};
+};
diff --git a/tests/merge-path-ref-missing.dts b/tests/merge-path-ref-missing.dts
new file mode 100644
index 0000000..ad2e35e
--- /dev/null
+++ b/tests/merge-path-ref-missing.dts
@@ -0,0 +1,11 @@
+/dts-v1/;
+
+/ {
+	node {
+	};
+};
+
+/* Try to redefine a node using a non-existent path */
+&{/nosuchnode} {
+	prop;
+};
diff --git a/tests/merge-path-relative.dts b/tests/merge-path-relative.dts
new file mode 100644
index 0000000..c4e00a4
--- /dev/null
+++ b/tests/merge-path-relative.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	label: node {
+	};
+};
+
+/* A plugin cannot define a node using a label-relative path reference */
+&{label/node} {
+	prop;
+};
diff --git a/tests/merge-root-plugin.dts b/tests/merge-root-plugin.dts
new file mode 100644
index 0000000..f67355e
--- /dev/null
+++ b/tests/merge-root-plugin.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+/plugin/;
+
+/* This is in the root node of the plugin */
+/ {
+	prop1;
+};
+
+/* This is an overlay fragment for the root node of the base tree */
+&{/} {
+	prop2;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f750faa..7beb6ae 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -770,6 +770,73 @@ dtc_tests () {
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-label-ref.dts"
     run_sh_test "$SRCDIR/dtc-fatal.sh" -m "Label or path nosuchnode not found" \
 	-I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
+
+    # Check each error when merging the fragments of a dts file, with its
+    # position
+    run_wrap_error_msg_test "test_label_ref.dts:7.8-15 Label or path handle not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/test_label_ref.dts"
+    run_wrap_error_msg_test "nonexist-node-ref2.dts:9.1-12 Label or path nosuchnode not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/nonexist-node-ref2.dts"
+    run_wrap_error_msg_test "merge-first-ref.dts:4.13-6.3 Label or path nosuchnode not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref.dts"
+    run_wrap_error_msg_test "merge-first-ref.dts:9.15-27 Label or path nosuchnode2 not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref.dts"
+    run_wrap_error_msg_test "merge-first-ref-relative.dts:5.15-7.3 Label-relative reference label/node not supported in plugin" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref-relative.dts"
+    run_wrap_error_msg_test "merge-first-ref-relative.dts:10.15-26 Label or path nosuchnode not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref-relative.dts"
+    run_wrap_error_msg_test "merge-labelled-relative.dts:12.1-10 Label-relative reference label/subnode not supported in plugin" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-relative.dts"
+    run_wrap_error_msg_test "merge-path-relative.dts:10.1-14 Label-relative reference label/node not supported in plugin" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-path-relative.dts"
+    run_wrap_error_msg_test "merge-path-ref-missing.dts:9.1-15 Label or path /nosuchnode not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-path-ref-missing.dts"
+    run_wrap_error_msg_test "merge-delete-missing.dts:9.15-26 Label or path nosuchnode not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-delete-missing.dts"
+    run_wrap_error_msg_test "merge-omit-missing.dts:9.18-32 Label or path /nosuchnode not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-omit-missing.dts"
+    run_wrap_error_msg_test "merge-errors.dts:9.1-13 Label or path nosuchnode1 not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
+    run_wrap_error_msg_test "merge-errors.dts:13.15-27 Label or path nosuchnode2 not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
+    run_wrap_error_msg_test "merge-errors.dts:14.18-30 Label or path nosuchnode3 not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
+    run_wrap_error_msg_test "merge-parse-error.dts:9.1-12 Label or path nosuchnode not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-parse-error.dts"
+    run_wrap_error_msg_test "merge-parse-error.dts:15.12-15 Division by zero" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-parse-error.dts"
+
+    # A labelled reference to a node in a plugin adds the label to it
+    run_dtc_test -@ -I dts -O dtb -o merge-labelled-plugin.test.dtb \
+	"$SRCDIR/merge-labelled-plugin.dts"
+    run_fdtget_test "/node" merge-labelled-plugin.test.dtb /__symbols__ newlabel
+    run_fdtget_test "value" merge-labelled-plugin.test.dtb /node prop
+
+    # In a plugin, &{label} becomes an overlay fragment, even if it is found
+    run_dtc_test -I dts -O dtb -o merge-label-braces.test.dtb \
+	"$SRCDIR/merge-label-braces.dts"
+    run_fdtget_test "" merge-label-braces.test.dtb /fragment@0/__overlay__ prop
+    run_fdtget_test "node\nfragment@0\n__local_fixups__" merge-label-braces.test.dtb -l /
+
+    # The fragment for &{label} is applied after any local merges
+    run_dtc_test -I dts -O dtb -o merge-label-order.test.dtb \
+	"$SRCDIR/merge-label-order.dts"
+    run_fdtget_test "third" merge-label-order.test.dtb /fragment@0/__overlay__/foo p
+    run_fdtget_test "second" merge-label-order.test.dtb /fragment@1/__overlay__ p
+
+    # In a plugin, / { ... } and &{/} { ... } are not the same thing
+    run_dtc_test -I dts -O dtb -o merge-root-plugin.test.dtb \
+	"$SRCDIR/merge-root-plugin.dts"
+    run_fdtget_test "" merge-root-plugin.test.dtb / prop1
+    run_fdtget_test "/" merge-root-plugin.test.dtb /fragment@0 target-path
+    run_fdtget_test "" merge-root-plugin.test.dtb /fragment@0/__overlay__ prop2
+
+    # In a plugin, a label which is not found becomes an overlay fragment
+    run_dtc_test -I dts -O dtb -o merge-label-base.test.dtb \
+	"$SRCDIR/merge-label-base.dts"
+    run_fdtget_test "" merge-label-base.test.dtb /fragment@0/__overlay__ prop
+    run_fdtget_test "/fragment@0:target:0" merge-label-base.test.dtb /__fixups__ baselabel
+
     check_tests "$SRCDIR/bad-name-property.dts" name_properties
 
     check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cells_is_cell interrupts_extended_is_cell
-- 
2.43.0

