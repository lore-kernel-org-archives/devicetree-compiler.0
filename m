Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810530;
	b=z61qS8no4SVrpImJ1d/1j0K6/cHT17Dd2DErwvUFQLqZxqSK7qwA9DaWE/FVTIktpMV+
	 zb8U0ILAFiNksat8M/JYR7J2tjsrK7WlEx3kMAlo3m0w2P07/38AhiZUXjTDWwPrXXwbM
	 ztMeQ+5h2nJbR7JyE/OqmPoZuCackW8dDmf3t7HKmw5qCojM46pcRmiG3ck3pFjpWYMfv
	 YXdh7x5l1XxyHqBaB313cMXg8Ol2cYXhmMKtuLD/xNjdQGOb5rqgKSnBUb/zO90cE1Va1
	 AZbbOCT2DK43xdg8xcA1Ze5NbzgtvUYX3LybFlg9u5Pkb8AWTxKrzAaHS7KSPVXcxyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sKaZF3uw2KgQvxWRvC7ariMXLiWEEJ1bKc7jYv216/A=;
	b=Psi7yWnHh2lwseiCjs3l64Bu7un+mdtKvsLvthobhtdOAeJvNLzUV42vqi5OXcqqcYZm
	 VqRVbPBCdNDwWbKqoUdb9SkG7ovyj/AjxPN7d8Ox5dwHIQV85+su79cgIJHvXpiC4jww6
	 WKwLsS1NqI5FIX9IVwo0MRC0eI6IWUkeepwi7lDQnvGc62Hv2D+nga+J8vSfJj6ukn4y4
	 u1NW4jXtxA1s0JfzZAM57uYAn/yQj8hvPX1TwamlpnaKRTPpP98HtguYFSlKLlw40jKtN
	 f7I+cvEt6HJmeBPrXlBvkt8Vx6VZwztCeAnu07vbGsq4LWWrKQuqUpSy2BTQnrS+o6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g0UzPM+N;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C01606A31E
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 20:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C01606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g0UzPM+N
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-85a5455bd3cso4612417a34.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 12:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795810529; x=1796415329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKaZF3uw2KgQvxWRvC7ariMXLiWEEJ1bKc7jYv216/A=;
        b=g0UzPM+NSmX8yBxdRhPfiAsvTMh5huFNAQbcJvRchVow6YKreLJ4Syhe+T7QqTuN6v
         1E/0VJ6R+JDu88XFYmRd//QRP3WJeJl4x79d/pg2JcZ7H2SZnLGQauZtEl4VggzItzAR
         pbKCFr7wkBDX71/yHbqFJXXxVsov/V/QE/D30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810529; x=1796415329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKaZF3uw2KgQvxWRvC7ariMXLiWEEJ1bKc7jYv216/A=;
        b=OUKyhjhwmrFYcPPh3CulMcvq7knYP9MrLgVn/Rcs5fFKjX3EOQanpg/HVHdwI6aK10
         iCLuevQbdpq2EWLqkxuPI5CMCt80lEaYrf0ZHyveds2JG8WZj+77W1X4+MhyUIM/rzMF
         A6mCTYFj7GrIuK+9j9c007LLoBiKdbQ3y5Md0TGu7tpTj8/VP/KadccoSZ+IdRM3bFAH
         7kwU2FA9Q7eFhybFF6R5P/TcOSnLTlpbxTZsoPm2RLw7xFkPFqpPj/waCDXBlVy5iFPF
         d/c/pPzOyVm6hPSoWELc9nmx+pL7lTHWzdR/DxZCus+PCnGcmzUCgEHSEFSUX45rKEMg
         9SJQ==
X-Gm-Message-State: APuU4Z8HbyvW5wDkmTEuGh94RR5uQDE0OwN8lVNm++Kguf7LxKmfjG0l
	qpdwyhLbgZCw1YvKxTzM7TSJ75+LEoLuKah5TJjojg8XeZTWYUPR2Jm7V66wqjOD4YqdMLFYiLd
	OwNLiBw==
X-Gm-Gg: AZFdTZdYg7+nTgSLvZTyu6gQF9vW9wJxGstldqRoVOOduEj3VIavuRPvxvLZp/VIG8X
	CdWK54HEsfnp1YSt2pg+T6YoRQtHs8GNt/n3ORcezPSRXLDVaaFY91iZsA4p1N35uP5MzlxfHwA
	ZhjSKX6ef2L+gpup+cYsVJ0g+X5xtksIj+Icnd0+jW248S8h0jSojG68eML4UAOlNuZdgRMF7lG
	MpRPsiVT/4Is6A5e0YEYB28E6IfIq4fQ1phTZPyNYntEfja/P/QrfhpWeOoj+94yw6MU5mLoukZ
	IueK5+uI9b2HQ17gx+wNDwHK6BJW5xwKj8e3lHqGqcqj4ZvoJlCvrCeFUDMmG6dFXh0M9wfvBp6
	Lv+E38bEwThJnx5radU5y+prsZgW/IqWtjzeIxEJbY6WkMvYOArM4Ny/sbFFuXrDArqC/saI21f
	utYopzgPqo0tT3THtWDzD0bH88aCjdPbP24shLuCPCJJz8CYEL5ZHYAlajdaEX8zzm7IMQBJCGE
	RjO/Jj97j0CdRzn0ap/w9ftLMWbeSJS5Nq7Olw4+U3UmoAYlQwrdrao8QaCYdzQXGHj6ovy4cHR
	GCYinYpVVkCxJBCLwa2+3algO0kWRxqYX20AygZPg+L51gJqI1orUln5gd4/twmipukp9XeH9qC
	FoORGA69ZbxffAfoOfcIT
X-Received: by 2002:a05:6808:1783:b0:571:76cb:b4c5 with SMTP id 5614622812f47-57a06b25c93mr26446685b6e.2.1795810529017;
        Fri, 27 Nov 2026 12:15:29 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm18881561b6e.16.2026.11.27.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:27 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 5/6] dtc: Allow a label on a reference to the base tree
Date: Fri, 27 Nov 2026 13:14:48 -0700
Message-ID: <20261127201457.1837712-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127201457.1837712-1-sjg@chromium.org>
References: <20261127201457.1837712-1-sjg@chromium.org>
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

In a plugin, label: &ref { ... }; gives an error unless ref is a node in
the plugin itself. But an overlay can add a label to a node in the base
tree, by putting the label on the __overlay__ node of its fragment@N
node, which libfdt supports.

Make an overlay fragment for such a source layer, as when it has no
label, and add the label to its __overlay__ node.

A path now always refers to the base tree, even with a label, so
label: &{/node} { ... }; no longer adds the label to a /node in the
plugin.

With -@, dtc gives each labelled node a phandle, including an
__overlay__ node, and libfdt copies this to the target when it applies
the overlay. This leaves two problems to deal with later:

- If two source layers label the same node in the base tree, each
  __overlay__ node has its own phandle and the second replaces the
  first, so a reference to the first label within the overlay is left
  dangling
- libfdt before v1.7.1 fails to apply the overlay if the target is given
  by a label and already has a phandle

One option is to give an __overlay__ node a phandle only when something
refers to it.

Rename merge-labelled-missing.dts to merge-labelled-base.dts, add a
second label on the same node and check the symbols, both in the plugin
and after fdtoverlay applies it to a base tree.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v6:
- Add new patch to allow a label on a reference to the base tree

 livetree.c                         |  9 +++++----
 tests/merge-labelled-base-tree.dts |  9 +++++++++
 tests/merge-labelled-base.dts      | 19 +++++++++++++++++++
 tests/merge-labelled-missing.dts   | 14 --------------
 tests/run_tests.sh                 | 29 +++++++++++++++++++++++++----
 5 files changed, 58 insertions(+), 22 deletions(-)
 create mode 100644 tests/merge-labelled-base-tree.dts
 create mode 100644 tests/merge-labelled-base.dts
 delete mode 100644 tests/merge-labelled-missing.dts

diff --git a/livetree.c b/livetree.c
index 6389dfc..7ade91e 100644
--- a/livetree.c
+++ b/livetree.c
@@ -577,9 +577,8 @@ bool merge_first_ref(struct node **dtp, struct source_layer *layer,
  * to, adding any label in the source layer to that node.
  *
  * In a plugin, a path always refers to the base tree and a label may do so, if
- * it is not found. In both cases, the source layer becomes an overlay fragment.
- * A source layer which adds a label is not handled in this way: it must refer
- * to a node in the plugin, or it is an error.
+ * it is not found. In both cases, the source layer becomes an overlay fragment,
+ * with any label on its __overlay__ node.
  *
  * Returns true on success, false on an error, which has been reported.
  */
@@ -596,8 +595,10 @@ bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin)
 				     layer->ref);
 			ok = false;
 		}
-		if (!layer->label && (layer->ref[0] == '/' || !target)) {
+		if (layer->ref[0] == '/' || !target) {
 			/* Add a fragment@N node for the reference */
+			if (layer->label)
+				add_label(&layer->node->labels, layer->label);
 			add_orphan_node(dt, layer->node, layer->ref);
 			return ok;
 		}
diff --git a/tests/merge-labelled-base-tree.dts b/tests/merge-labelled-base-tree.dts
new file mode 100644
index 0000000..47fad61
--- /dev/null
+++ b/tests/merge-labelled-base-tree.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+
+/ {
+	baselabel: node {
+	};
+
+	basenode {
+	};
+};
diff --git a/tests/merge-labelled-base.dts b/tests/merge-labelled-base.dts
new file mode 100644
index 0000000..76fcb83
--- /dev/null
+++ b/tests/merge-labelled-base.dts
@@ -0,0 +1,19 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+};
+
+/* A label on a node in the base tree goes on the __overlay__ node */
+newlabel1: &baselabel {
+	prop1;
+};
+
+newlabel2: &{/basenode} {
+	prop2;
+};
+
+/* Each source layer has its own overlay fragment, even for the same node */
+newlabel3: &baselabel {
+	prop3;
+};
diff --git a/tests/merge-labelled-missing.dts b/tests/merge-labelled-missing.dts
deleted file mode 100644
index 232872b..0000000
--- a/tests/merge-labelled-missing.dts
+++ /dev/null
@@ -1,14 +0,0 @@
-/dts-v1/;
-/plugin/;
-
-/ {
-};
-
-/* A label can only be added to a node in the plugin */
-newlabel1: &nosuchnode {
-	prop;
-};
-
-newlabel2: &{/nosuchnode} {
-	prop;
-};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 54f2efb..14a35db 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -798,10 +798,6 @@ dtc_tests () {
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
     run_wrap_error_msg_test "merge-errors.dts:14.18-30 Label or path nosuchnode3 not found" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
-    run_wrap_error_msg_test "merge-labelled-missing.dts:8.12-23 Label or path nosuchnode not found" \
-	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-missing.dts"
-    run_wrap_error_msg_test "merge-labelled-missing.dts:12.12-26 Label or path /nosuchnode not found" \
-	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-missing.dts"
 
     # A labelled reference to a node in a plugin adds the label to it
     run_dtc_test -@ -I dts -O dtb -o merge-labelled-plugin.test.dtb \
@@ -809,6 +805,16 @@ dtc_tests () {
     run_fdtget_test "/node" merge-labelled-plugin.test.dtb /__symbols__ newlabel
     run_fdtget_test "value" merge-labelled-plugin.test.dtb /node prop
 
+    # A labelled reference to the base tree labels the __overlay__ node
+    run_dtc_test -@ -I dts -O dtb -o merge-labelled-base.test.dtb \
+	"$SRCDIR/merge-labelled-base.dts"
+    run_fdtget_test "/fragment@0/__overlay__" merge-labelled-base.test.dtb \
+	/__symbols__ newlabel1
+    run_fdtget_test "/fragment@1/__overlay__" merge-labelled-base.test.dtb \
+	/__symbols__ newlabel2
+    run_fdtget_test "/fragment@2/__overlay__" merge-labelled-base.test.dtb \
+	/__symbols__ newlabel3
+
     # In a plugin, &{label} is the same as &label
     run_dtc_test -I dts -O dtb -o merge-label-braces.test.dtb \
 	"$SRCDIR/merge-label-braces.dts"
@@ -1199,6 +1205,21 @@ fdtoverlay_tests() {
     run_fdtoverlay_test "/rootnode" "/__symbols__" "rootsub" "-ts" ${stacked_basedtb} ${stacked_symbols_targetdtb} ${stacked_symbolsdtb}
     run_fdtoverlay_test "/foonode" "/__symbols__" "phfoo" "-ts" ${stacked_basedtb} ${stacked_symbols_targetdtb} ${stacked_symbolsdtb}
 
+    # test adding a label to a node in the base tree
+    run_dtc_test -@ -I dts -O dtb -o merge-labelled-base-tree.test.dtb \
+	"$SRCDIR/merge-labelled-base-tree.dts"
+    run_dtc_test -@ -I dts -O dtb -o merge-labelled-base.test.dtb \
+	"$SRCDIR/merge-labelled-base.dts"
+    run_fdtoverlay_test "/node" "/__symbols__" "newlabel1" "-ts" \
+	merge-labelled-base-tree.test.dtb merge-labelled-target.test.dtb \
+	merge-labelled-base.test.dtb
+    run_fdtoverlay_test "/basenode" "/__symbols__" "newlabel2" "-ts" \
+	merge-labelled-base-tree.test.dtb merge-labelled-target.test.dtb \
+	merge-labelled-base.test.dtb
+    run_fdtoverlay_test "/node" "/__symbols__" "newlabel3" "-ts" \
+	merge-labelled-base-tree.test.dtb merge-labelled-target.test.dtb \
+	merge-labelled-base.test.dtb
+
     # verify that phandles are not overwritten
     run_dtc_test -@ -I dts -O dtb -o overlay_base_phandle.test.dtb "$SRCDIR/overlay_base_phandle.dts"
     run_dtc_test -@ -I dts -O dtb -o overlay_overlay_phandle.test.dtb "$SRCDIR/overlay_overlay_phandle.dts"
-- 
2.43.0

