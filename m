Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551095;
	b=UzYIN5EjsHhHWwudHZkE+LIF1hlyaKOdjQR+OigvQr5T6u8zjvkQCK0w95RyagSFGrUn
	 hZqeBMVuusZIWDtq50nFl9btI+yQZ1uNvvyqr2iLkSnpU9NqqhbjwGFoOFirMdSnMa3kI
	 KJYDcegW2hHu9hQW452Yk64zp8+155xqajH8lPddQIQPymgCHzid6mHPG0OOKcjy2/8s6
	 kP4X1TR0F6urY6e3FP1BdbftsV3pfheslTlBmbMNFQnrs7Rddx2t2dhKevdIRZXUk2Dwr
	 eySVpZ0OfjapB3gE3qIH49fPSQMmZE5gW3El9fuY74q9dBX5WM4MKof1jKHVghVB2Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9GU3quKD3Xq0n+m/uAqLp3jdr5HXv7zUK9JlNNLff1o=;
	b=b+aT8xzafgLhQiBGAw6SUD1fULVeXMvEkzSTCF0yrNLdcKOcxgUqFs2v/BFaSewzK9Sv
	 Aojk062Q1dSV5kJadxo9J6tbmCWjzbIldPBPnhAaj1aSllWfhfXW+FClCF0vscaA49Nyv
	 LZtpOd4ouX2fcAjDef+tKQzGG7t3uYbSycZ7D5OFlsmKGbQRTFs8Z3b/gAIpRyN7aNQl0
	 3u3fjuFQvE2X0/9e3kI4atU1PV6sYIUtfpMGUO1eJAXs76Wd4718fXS2GtIXaWD3F8xPH
	 E/SskFb4p0ai3iR79auexi4pNJfQd4ifMNM9oq49WIA4Y2obxpchTxibwliyWAkj5RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H0JV6OQn;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AF4606A324
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AF4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H0JV6OQn
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-846566246e8so2309742a34.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551094; x=1794155894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GU3quKD3Xq0n+m/uAqLp3jdr5HXv7zUK9JlNNLff1o=;
        b=H0JV6OQnjEtoZTy12SDFS349PZFFlKexHNxFGg2faIRlxWb7ts8jNfYokHUzP3e8hF
         Nh1YSlPwtXj0ewRlox9YmVb7Pv/aCIE6P8UXvWRKisnlR6jeTFsnd1JcYqStfyQdrRIW
         bRcFG0nOoHcYhKXpmGLotZ6wE5puM+dwkUSis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551094; x=1794155894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GU3quKD3Xq0n+m/uAqLp3jdr5HXv7zUK9JlNNLff1o=;
        b=IvikeK21Oy8WAP9WAUZpeyaM6k1+UCB+mzz+Q0sTg3y5m+3Tv/pNS/OoipR+iE3RZj
         9q/Zb9nk1aqlA3X2CzKFE+5KCZvoeGJnlOsVB2zWSM40vCGlb33Cu7ucx5auJUjJZPno
         jTdya8JZ3GQl9/QrNvYlqFmB+21sJpoQzprKdd9gDFLpZ9o+OhP63J17iNm4l2dXsCMr
         p8OaVUCykI7v/30jrIsIWWzbwnbwdEHNwlAUN9lfNIbG3TcwmbMOhvmpkdsGKAXS9uhQ
         VNA+T66eamaoDm80rjOVXUPZSHdbXZaiLENJtCMQW0ReV0UznqDJ3yH+cmZo2zImOwWU
         +1tw==
X-Gm-Message-State: AFq9FYLIpl6EejTjUSluWajkrYtToGdsBmqrv+e9pdAdr5emctUKSR9T
	ABHwXYQPkN3Vk6nUp1Z2nXXFwPsKiIaC+leIHPCV+lf3PpNzMDTRFJs/qzXV348/KFyP0+9dL+M
	0zJeQJg6H
X-Gm-Gg: AYBFou3mpMCBFqUE03hyLDxjCbRkxlHn1pmJIAAzzOYDxs3bEST8FY7F1LVwpsoyFSt
	jwDWV3iTINTvsqkflerl/hfeh9PHGHAuhsNXwnuieiOqGlzI2W/0IGe+CeW2qQ1eWlFseVE3Vjz
	6mNaP1NIkPxyxp22iNXk0kNcPJBUGN07ALUtuUIclwwKa/S1NXPfV84f0XmhDNpS7Rn3LFaiPlg
	0Ia+WMYSVXgDRMZtNrahWxbo/5ADa6ODWP+aUwjRNinkzKscXwFTl07fB+ilOspKXKJZVhRWgPi
	qsZ9wRMTJ1ZD0SEFKhFclP5GELM85Pru5bv2jbLboX/HEeP/tcvnHw0tNcYv+nL83Hxz8h1sA/I
	GLWSN4yC3iVrXxsS2cT8gRogoZJIfjy2fmFdNP562aTKP8npza+8RoXvjE4KQY1+p2owpT5Jsc0
	eFln9RZz25gF0TynZX1HkNe1caZdfRkNfRrNyv2eVVOnaQ3u+Zp9iRsi0/o7pALdeY/oVVmHOQ4
	1k7pwXZEIUZKVRgdHqbyuekMknUBQ5HYnaKhYhE2tw8loQpUKh5UKnNhCinqiSA2VpSqjK0N65G
	V4yCRIMpmrbK3hf0ZnYVBIldZE8Rapi426JE6UXAlc+QC1/5WNgtTdxNUr23tHQFfuCregOt0A6
	AZm3nhZXiDJB1oVzoQQ3PVRfFFwB4nrP6vEsIkFrHBYU=
X-Received: by 2002:a05:6830:b13:b0:84a:2db7:dbc1 with SMTP id 46e09a7af769-85c2316fcacmr5850494a34.36.1793551093988;
        Sun, 01 Nov 2026 08:38:13 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:12 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 01/13] tests: Check each error when merging a dts file
Date: Sun,  1 Nov 2026 09:36:55 -0700
Message-ID: <20261101163721.2458982-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101163721.2458982-1-sjg@chromium.org>
References: <20261101163721.2458982-1-sjg@chromium.org>
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
the parser finds another error, and that a labelled reference within a
plugin adds the label, since nothing covers these either.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 tests/merge-delete-missing.dts     |  9 +++++++
 tests/merge-errors.dts             | 14 ++++++++++
 tests/merge-first-ref-relative.dts | 10 ++++++++
 tests/merge-first-ref.dts          |  9 +++++++
 tests/merge-labelled-plugin.dts    | 12 +++++++++
 tests/merge-labelled-relative.dts  | 14 ++++++++++
 tests/merge-omit-missing.dts       |  9 +++++++
 tests/merge-parse-error.dts        | 17 +++++++++++++
 tests/merge-path-ref-missing.dts   | 11 ++++++++
 tests/merge-path-relative.dts      | 12 +++++++++
 tests/run_tests.sh                 | 41 ++++++++++++++++++++++++++++++
 11 files changed, 158 insertions(+)
 create mode 100644 tests/merge-delete-missing.dts
 create mode 100644 tests/merge-errors.dts
 create mode 100644 tests/merge-first-ref-relative.dts
 create mode 100644 tests/merge-first-ref.dts
 create mode 100644 tests/merge-labelled-plugin.dts
 create mode 100644 tests/merge-labelled-relative.dts
 create mode 100644 tests/merge-omit-missing.dts
 create mode 100644 tests/merge-parse-error.dts
 create mode 100644 tests/merge-path-ref-missing.dts
 create mode 100644 tests/merge-path-relative.dts

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
index 0000000..6d3969f
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
+/* Each error is reported, not just the first */
+&nosuchnode1 {
+	prop;
+};
+
+/delete-node/ &nosuchnode2;
+/omit-if-no-ref/ &nosuchnode3;
diff --git a/tests/merge-first-ref-relative.dts b/tests/merge-first-ref-relative.dts
new file mode 100644
index 0000000..103cd1f
--- /dev/null
+++ b/tests/merge-first-ref-relative.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+/plugin/;
+
+/* A plugin cannot start with a label-relative reference */
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
index 0000000..00369e3
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
+/* A plugin cannot use a label-relative reference, even if it is found */
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
index 0000000..94a0b38
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
+/* A plugin cannot use a label-relative path reference */
+&{label/node} {
+	prop;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5bc7817..e0504c0 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -765,6 +765,47 @@ dtc_tests () {
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-node-ref.dts"
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-label-ref.dts"
     run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
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
     check_tests "$SRCDIR/bad-name-property.dts" name_properties
 
     check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cells_is_cell interrupts_extended_is_cell
-- 
2.43.0

