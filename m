Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994783;
	b=hVnWgNQqO/8XQa1BCuGeW6+Nqnj0jzW+mM5dIK+zdkzyAb3oMjQV1Qnykx3zglSCFoSn
	 rMlP8IH8qyEoDK8hk3eJCy+YX+I1HMPApTzcjE86QmBqW9kJuEuUXH9fgKXd+sKd6tmj7
	 go9hjC4AuSm30L1VuTMv8JYgGd3jUIB/EgH1Gc3PNlkJ1ZwpQcK2P0KoyZN9TuSqEacVY
	 kX1MoNpOFpS3i8daCybm1rqm0TmzOHmFH0EoiLptmMs5Vh3FL7NH4Sz7FNJcUdpq5+9ED
	 tLMF23ZidQg27gxkPxo/T40LDBRLxTBgnEebYc3KDuL6TmO3haILudwAY894JsT+5FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F/ZN1wLUQ5eq+jEtXS0t7C1ZxakTev2AoraDjVRHSWg=;
	b=R6OzQDPtegZcG2aVWGXOBK7bebM2A5JFV643Xn69rJQSInLodALE1PIjMKBNSmXsg9qw
	 YwQpxGgRKh7NJo0hK3HL24Qp4veyMWA8Tq13Zk3+v3KIyyPFbOGD1XHw8Ove/qcdth1Fy
	 FDid7FNr7WGjLrO8GE6uizfaXV/yqeEJ4/akW8RBMNEfqWHS6JDgD361pG9iCblgNDk81
	 ml2HtaewFbBmFr/KJlgEwoVpTmqQ55q9NWQOXAuxjy0WpffV2anupFIH+3eB49UcvKUrH
	 3zVGkd5iKMfAVhajnDy2RYGctpHesMXRCq4lDxy8/ClQdoLdRKt7RfZs6BMjy6kK9sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Z/yyARwH";
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F180606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F180606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z/yyARwH
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-714d57774d8so621449eaf.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994781; x=1794599581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/ZN1wLUQ5eq+jEtXS0t7C1ZxakTev2AoraDjVRHSWg=;
        b=Z/yyARwHyHz6pYqcHmlhQJK9R6Y3WPKHjQyGDCbe3USuIfHx/gsBGidCnzHM/udo/6
         3JPQ549vpoN9lBNkkR2pmItKlgrmyrTcD0lYIX9VRDVybC0/8ovG1O8ZiFfU40+FPiwf
         IrG7phcjnTJfHoOvQDXVLODf18zYJdSoBuN3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994781; x=1794599581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/ZN1wLUQ5eq+jEtXS0t7C1ZxakTev2AoraDjVRHSWg=;
        b=S+PA/GPyyxY+T8u9ZrnD/OEZJ6X29XfuCFdTfsKtqVLNDYlog1vP2DSIUwCVQEwxFk
         ulzZr5RNNrNJYHVAE8Esfe5yJ3DH8wQRLsEeCpAshDjwpqfWQEZ5maECMJO9w7EXmM2K
         xZBxu9dBPoWZzS6fCR7pUEzvG/51ZLa/mhhNQ7W99njXmonQ65xBl1cr5lGbDbHPDJ9A
         zLhlgup9BQfB4qN7FMavwtTA2iblfMDDiUZYVwc9iLxdOxA2GriouQZYV4NRyYqqMj2r
         mFiysJIHvxbPg+gj+Xko5ioyv/N7xCkMD9I81yXDtm3tEJFKylxg2bdKL4uJIk1jEJaK
         Mf7w==
X-Gm-Message-State: APuU4Z+KMjx3j9q0M5SUxVTFwEC/hIWfb1uMHWawEGxUJtzBDdQi/eua
	ZrG0vgaj2McDU402jIXaBKD63XrWxsl1kzFSpvdnEpSU1dePbpGsVDJ4XRq5sZa9rWVWi8psbNr
	iYOBfCg==
X-Gm-Gg: AYBFou2AjPJt31Ie+BckUNQVpPW2+TyDOpk9DvQ4/n4oAH11jXELXN0U+Ypojo0qXBB
	OdoMPaSy3UUVs+oJY4eBMh1+6Rza6wKpvcdzuDg4tXcygMPTOvwXRVilUFXBPgCNvu7ZQzQWVdU
	0AKwpcanX9DizhhR2LePZT1x8FKKMWj4kKDcv6SdXienm4546GdaIZ4OSepX8zfv/6nwgPtkSTv
	2DLSa6AU4boIUDjwWFjgfY9aSlFBUu4h1RYg7n6gj/B9sTPdtf6IEvBoPigs+yROHeDX81+NHkW
	/FFMmO/cRSgFB3oRyBc/OSpIWPWCbV2X3DSjWDHFW4q0eldsuDS+dHS2bgDOmaXYXykl6tL4sEI
	qzaH8OPOdkLmf530KGif91aOYgRYnlZe7WGj421KvS07kjpfs8r0dQZUmWSnrOrsKUCrj5Onh7g
	+/u9SCIsdQThAmpJVdiGLdAepgu24sWlOncMZDcJRqDwkz2OfE7BecVeVgpM36VtAvNaSKdHPlL
	VREDf925PfbfnvvUmo5pePTueFqWMqc2H/p1y61tSe9UjIzN0zwPL8mYz+/yhkxQs25s20gywQG
	hwtSwJEIrY8mNmXJimIH3A2FoFPeGXy9xs3bEpsM4cZtS6albVjkemYAfYkOptVaV0po1HGFiD4
	zt11jyj5VgRg6IwSR6IYY
X-Received: by 2002:a05:6820:428a:b0:716:d1ff:2c68 with SMTP id 006d021491bc7-716e78a2bf2mr1810680eaf.22.1793994781233;
        Fri, 06 Nov 2026 11:53:01 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:00 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 01/18] tests: Check how the fragments of a dts file are merged
Date: Fri,  6 Nov 2026 12:51:28 -0700
Message-ID: <20261106195159.2623314-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106195159.2623314-1-sjg@chromium.org>
References: <20261106195159.2623314-1-sjg@chromium.org>
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
merges, since nothing covers these either. Also check that a node in an
overlay fragment can be deleted by its label, and where the overlay
fragment goes among the plugin's own nodes.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Change the subject, since the tests are not only for errors
- Add merge-overlay-order.dts to check deletes and order with fragments

Changes in v2:
- Reword four comments in the test files
- Add merge-root-plugin.dts to check / { ... } against &{/} { ... }
- Add merge-label-base.dts to check a label which is not in the plugin
- Add merge-label-braces.dts to check &{label} in a plugin
- Add merge-label-order.dts to check the order of &{label} and &label

 tests/merge-delete-missing.dts     |  9 ++++
 tests/merge-errors.dts             | 14 ++++++
 tests/merge-first-ref-relative.dts | 10 ++++
 tests/merge-first-ref.dts          |  9 ++++
 tests/merge-label-base.dts         | 10 ++++
 tests/merge-label-braces.dts       | 12 +++++
 tests/merge-label-order.dts        | 17 +++++++
 tests/merge-labelled-plugin.dts    | 12 +++++
 tests/merge-labelled-relative.dts  | 14 ++++++
 tests/merge-omit-missing.dts       |  9 ++++
 tests/merge-overlay-order.dts      | 19 ++++++++
 tests/merge-parse-error.dts        | 17 +++++++
 tests/merge-path-ref-missing.dts   | 11 +++++
 tests/merge-path-relative.dts      | 12 +++++
 tests/merge-root-plugin.dts        | 12 +++++
 tests/run_tests.sh                 | 74 ++++++++++++++++++++++++++++++
 16 files changed, 261 insertions(+)
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
 create mode 100644 tests/merge-overlay-order.dts
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
diff --git a/tests/merge-overlay-order.dts b/tests/merge-overlay-order.dts
new file mode 100644
index 0000000..2490157
--- /dev/null
+++ b/tests/merge-overlay-order.dts
@@ -0,0 +1,19 @@
+/dts-v1/;
+/plugin/;
+
+&basenode {
+	label: foo {
+	};
+
+	bar {
+	};
+};
+
+/* A node in the plugin itself, after the overlay fragment */
+/ {
+	node {
+	};
+};
+
+/* A label in an overlay fragment can be referred to */
+/delete-node/ &label;
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
index f750faa..2d392e2 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -770,6 +770,80 @@ dtc_tests () {
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
+    # In a plugin, a node in an overlay fragment can be deleted by its label,
+    # and the overlay fragment comes before the later node in the plugin
+    run_dtc_test -I dts -O dtb -o merge-overlay-order.test.dtb \
+	"$SRCDIR/merge-overlay-order.dts"
+    run_fdtget_test "fragment@0\nnode\n__fixups__" merge-overlay-order.test.dtb -l /
+    run_fdtget_test "bar" merge-overlay-order.test.dtb -l /fragment@0/__overlay__
+
     check_tests "$SRCDIR/bad-name-property.dts" name_properties
 
     check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cells_is_cell interrupts_extended_is_cell
-- 
2.43.0

