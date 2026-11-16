Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873510;
	b=z7DI+clXqOq679WPsWOMdlZNL+ICti0xiZKrtkWzAnlbCQy9kkBYRdrj3V4BIGTE5DoE
	 co1EQpc1Cxk8Md7CC9/9+wEw/1FXyA6NctZ6Mahd0OUwZHMfrOqreRTAgdc6+pOntWvf+
	 Nr+rhpqj8Bi21TDvjzNX/M6sen4SJyAhhC5/ELdvyubabjb1Rr378pm2OHtDqKyS5drBq
	 svnhMGj2RtLq284mUR9ZlQzartlsC0fOpKYaD8SVyOhuaFfmTU/YfXI/ClKMPFkYU6atL
	 3ZU/Yv3TFslYQoSPqrWlgTw/g8cFqTJjXJb9tZHbSJRd4sAtvSxGVg7jyE6lwiGv96g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W0QDotKeDFyOnEZ+mmUwt40AShRElDy1Ds+LYUvoHIY=;
	b=0WakSBRt5pQ8xRlJ0Gq+hiEfzS/YrwHVawlVtCIkSDWikg99xiTWIipAhshEnpsqUZAB
	 a0b8uAX4WXF+czkvcESn8tg02cC3P2PigSmFzH7U25BS1NgtSyD/FH18JP/6FY0OT+Lmd
	 Q1SyhZMGty8NORRWod9PBGq/McDva3um/Kyop9PDMa/tZsBJkSy1uzHfg2wMyDbe+weJV
	 I482IqwwLY15qJZV/+5MVsdOjPZ2Qq0bsgDuYrUfYVu6Ihrfy7W1aj7gRLAxHgHw1gM/i
	 yxuhkP7zc9E+7EP4uFBA6W4Au5JC6ga8OS6wJ88CPtLeS2CSimv5EoZUB1T002HhE1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cTfLV2zi;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87145606A323
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87145606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cTfLV2zi
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-70059e4dab6so2900623eaf.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873508; x=1795478308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0QDotKeDFyOnEZ+mmUwt40AShRElDy1Ds+LYUvoHIY=;
        b=cTfLV2ziWpiTehDecibAtsWVg93S/urNbGKRTQILgBbLi2SjAUYW2F/3gydy3ikyEW
         0qXEzlHzRQTz1KXxMKoekw37jPLVd5XQzL99uZAXzttsyh7IchGOyPzTCOj++PGyg6E0
         Dn74lQzNjZcsM7AlF3w4SBT7vneMdx7Okk3nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873508; x=1795478308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0QDotKeDFyOnEZ+mmUwt40AShRElDy1Ds+LYUvoHIY=;
        b=ChbpyqGCyWPYoh/jrGuaMmU49pFQRCQVPy+RGHbOoB8aatxGSim+AIWGPz5r/xX6VU
         54OzR1E2Yvq+fmpnfcUf7T6a4bvidk8z7JyiW/14EaC8clOvUdgMCWKmmx6YkjnTOQRp
         GjGwkm1RmDxixx3S//OPn/q2p97DSNzfdW+FunTONQROuAsvwo8aceZTRd4KMZo1fhAb
         TYN8Q8xrMORlSCSWOAQMnDatc1KDHSnqmCq3R1eMie2u+d6R4as04Z+mQbvQOfcYvt45
         GUWI4AHhC0h0/GTvqmPBoWK3Kp2fNkFpMN0fK+UGqPyNjZp5hxsoeq0OGLBxSm3rrOir
         sxzw==
X-Gm-Message-State: APuU4Z/FaPWlpETFNITJKhA2rhJDqjvsehln8GMirGYRdh7WNCisEE/B
	/eee/kiMZjBoXPCkjen9xEm1IPIkA5rm1cXYHpB4iywWoNL2d7yMiXgjTPIYSwY2/sRt01qrZzc
	TEdQ6Lg==
X-Gm-Gg: AYBFou22thMP7Thd7YVIVWwcJcTPJZz0hlpzJKRGf8Ees9b5/zbEpRWYpXNz+4dK7zf
	gPwi2R47C2KkGM1JxhtZA0I0bxifUrhtO0IjaEClkLvpXaB46uEH85mJyvqQfLxFsnQ0p97Orm6
	W4rlUgQeRpOws2RJiVhPmhLmAohi0VbyTC9LSSkP0L4KTK9rhmygnw+uwYKDAiiUCB3dgGucAtP
	3HUing9lUz29AbOCYlLmcUVZvNZdy2hgguVIh48A8RqMekHsfsJ93+fucMg1RG3fPY51UhHQhGx
	kGuOH7zcFy8EIZF9bWHvnqc7iWy33d7eb9BAOi6FBzT+pXpmDNw/bQORbRq6B7wkb9agvvjUV6t
	bWnWoHShHAZPOjWYcGjQeu89TvXY/n4tGYG0l7no70o0KsF3Vazp9uBwAnq86L+ph6jaxjUmHSs
	zp3RUMYEyhUa5lzTJbs5Qu5YiVZmx2Jo0vFzjOSPzUMwkzoZ+C/KjpwWGGB7gMFO5cAv+SzBCcM
	wFW57rZt58pQWcU3m99hrWZNC7vkI3oeU0CpGc1qf7gOC2FeWFKpxW7wW3NcBdvN+fM8LqAYogV
	KoRDMwVnDeDKYqO90itfGbBGmJ09pUX8L149ukAhXj8wigzTXt367tg0n7eKV5UtiPCb3N0We5E
	/tUhThQ/W8twiD/hB6snzBzzXETGEt62MR6ni/+90AGI=
X-Received: by 2002:a05:6820:618:b0:71a:efbe:ef42 with SMTP id 006d021491bc7-71aefbef614mr3763488eaf.33.1794873508435;
        Mon, 16 Nov 2026 15:58:28 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:26 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 01/10] tests: Check how the fragments of a dts file are merged
Date: Mon, 16 Nov 2026 16:57:55 -0700
Message-ID: <20261116235813.935070-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116235813.935070-1-sjg@chromium.org>
References: <20261116235813.935070-1-sjg@chromium.org>
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
errors are reported too, that a labelled reference within a plugin adds
the label, that / { ... } and &{/} { ... } differ in a plugin, and that
a label in a plugin becomes an overlay fragment if it is not found,
since nothing covers these either.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v4:
- Drop merge-parse-error.dts and merge-overlay-order.dts
- Drop the checks that later fragments are merged after an error
- Move the &{label} tests to the patch which changes its behaviour
- Use a label outside the plugin in the label-relative tests

Changes in v3:
- Add merge-overlay-order.dts to check deletes and order with fragments
- Change the subject, since the tests are not only for errors

Changes in v2:
- Add merge-label-base.dts to check a label which is not in the plugin
- Add merge-label-braces.dts to check &{label} in a plugin
- Add merge-label-order.dts to check the order of &{label} and &label
- Add merge-root-plugin.dts to check / { ... } against &{/} { ... }
- Reword four comments in the test files

 tests/merge-delete-missing.dts     |  9 ++++++
 tests/merge-errors.dts             | 14 +++++++++
 tests/merge-first-ref-relative.dts |  7 +++++
 tests/merge-first-ref.dts          |  6 ++++
 tests/merge-label-base.dts         | 10 +++++++
 tests/merge-labelled-plugin.dts    | 12 ++++++++
 tests/merge-labelled-relative.dts  | 10 +++++++
 tests/merge-omit-missing.dts       |  9 ++++++
 tests/merge-path-ref-missing.dts   | 11 +++++++
 tests/merge-path-relative.dts      | 10 +++++++
 tests/merge-root-plugin.dts        | 12 ++++++++
 tests/run_tests.sh                 | 47 ++++++++++++++++++++++++++++++
 12 files changed, 157 insertions(+)
 create mode 100644 tests/merge-delete-missing.dts
 create mode 100644 tests/merge-errors.dts
 create mode 100644 tests/merge-first-ref-relative.dts
 create mode 100644 tests/merge-first-ref.dts
 create mode 100644 tests/merge-label-base.dts
 create mode 100644 tests/merge-labelled-plugin.dts
 create mode 100644 tests/merge-labelled-relative.dts
 create mode 100644 tests/merge-omit-missing.dts
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
index 0000000..f828e86
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
+/* Each fragment below refers to a missing node, and each is reported */
+&nosuchnode1 {
+	prop;
+};
+
+/delete-node/ &nosuchnode2;
+/omit-if-no-ref/ &nosuchnode3;
diff --git a/tests/merge-first-ref-relative.dts b/tests/merge-first-ref-relative.dts
new file mode 100644
index 0000000..fe4cf9b
--- /dev/null
+++ b/tests/merge-first-ref-relative.dts
@@ -0,0 +1,7 @@
+/dts-v1/;
+/plugin/;
+
+/* A plugin cannot define a node using a label-relative reference */
+&{label/node} {
+	prop;
+};
diff --git a/tests/merge-first-ref.dts b/tests/merge-first-ref.dts
new file mode 100644
index 0000000..2f585d6
--- /dev/null
+++ b/tests/merge-first-ref.dts
@@ -0,0 +1,6 @@
+/dts-v1/;
+
+/* Only a plugin can start with a reference */
+&nosuchnode {
+	prop;
+};
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
index 0000000..8faaf5e
--- /dev/null
+++ b/tests/merge-labelled-relative.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+};
+
+/* A label outside the plugin cannot be used in a label-relative reference */
+newlabel: &{baselabel/subnode} {
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
index 0000000..0a79379
--- /dev/null
+++ b/tests/merge-path-relative.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+};
+
+/* A label outside the plugin cannot be used in a label-relative reference */
+&{baselabel/node} {
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
index 5775e0c..146d288 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -770,6 +770,53 @@ dtc_tests () {
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
+    run_wrap_error_msg_test "merge-first-ref-relative.dts:5.15-7.3 Label-relative reference label/node not supported in plugin" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref-relative.dts"
+    run_wrap_error_msg_test "merge-labelled-relative.dts:8.1-10 Label-relative reference baselabel/subnode not supported in plugin" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-relative.dts"
+    run_wrap_error_msg_test "merge-path-relative.dts:8.1-18 Label-relative reference baselabel/node not supported in plugin" \
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
+
+    # A labelled reference to a node in a plugin adds the label to it
+    run_dtc_test -@ -I dts -O dtb -o merge-labelled-plugin.test.dtb \
+	"$SRCDIR/merge-labelled-plugin.dts"
+    run_fdtget_test "/node" merge-labelled-plugin.test.dtb /__symbols__ newlabel
+    run_fdtget_test "value" merge-labelled-plugin.test.dtb /node prop
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

