Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF7053B7
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Oct 2023 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53319129
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Oct 2023 07:29:04 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso1347858a34.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Oct 2023 07:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698416943; x=1699021743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hjJkIIAyRXfc16aHumhuERZhc5mGw7gRDUqjWSv7a0=;
        b=GoNdr5yt43GcwEvb8VhNW1v8zxZldh8pgc6HQ5l6CovRp1wkZP8JsMR7Z6zYpak3Wn
         2WcriXtBdR5lxGps2ksEv7dfwGqrkuohvVmT7mU5yHqg8ZWk8rdWW1wGa2y7jDbf0KBo
         qAg5XPBk85KP8dddv/gjao8gpjy7gZjeDHh+auUkmngpzlQmq0d3AYn2prw05MVZan7c
         SwPRVFMVRfCy1jtrJNKr4zy3qmM9lKaXV01ed8EuyYlQbhnuFS/+kHu3TJnl3/5gm57+
         uopmeQJAaS36WWYrXjSA7ADtvr2xVDD0ZxJdM8Al7WC0yAClpexyyKuegGbqNJ2kxASe
         +Aug==
X-Gm-Message-State: AOJu0YzSWlUBVfeczZqQ8zD/WGdG7x9g25hyNAX6eD/Xe7fd21NoNAxY
	93sf/WJh3tdTu0dBrFO5CqDctl6TSQ==
X-Google-Smtp-Source: AGHT+IGWqx92wGlWyd+fPUrdRNV/6Ljz/1IKc0w/0/RaCmNf7tbrBdaIw6sDNT3Zr6rubf9ihmkxxg==
X-Received: by 2002:a05:6830:18d6:b0:6cd:8c3:5b4c with SMTP id v22-20020a05683018d600b006cd08c35b4cmr2780458ote.16.1698416942932;
        Fri, 27 Oct 2023 07:29:02 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y30-20020a4a9821000000b0054f85f67f31sm377911ooi.46.2023.10.27.07.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 07:29:02 -0700 (PDT)
Received: (nullmailer pid 2536634 invoked by uid 1000);
	Fri, 27 Oct 2023 14:29:01 -0000
From: Rob Herring <robh@kernel.org>
To: devicetree-compiler@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] treesource: Restore string list output when no type markers
Date: Fri, 27 Oct 2023 09:29:01 -0500
Message-ID: <20231027142901.2536622-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the DTS output has no type markers, we have to guess the type. Prior
to commit 32b9c6130762 ("Preserve datatype markers when emitting dts
format"), instances of string lists would be delimited. Since then, a
single string with embedded "\0"s are emitted. An embedded "\0" is valid
for DTS files, but that's a rare exception and lists of strings are the
overwhelming majority. Restore the prior behavior.

stringlist.dts is reused for testing this, but needs a couple of tweaks
in order to match the dts output.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 tests/run_tests.sh   |  4 ++++
 tests/stringlist.dts |  4 ++--
 treesource.c         | 24 ++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index c4f8b9b25577..bb2ec959a6e4 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -634,6 +634,10 @@ dtc_tests () {
     done
 
     # Check -Odts preserving type information
+    run_dtc_test -I dts -O dtb -o stringlist.test.dtb "$SRCDIR/stringlist.dts"
+    run_dtc_test -I dtb -O dts -o stringlist.test.dts stringlist.test.dtb
+    run_wrap_test cmp "$SRCDIR/stringlist.dts" stringlist.test.dts
+
     for tree in type-preservation.dts; do
         run_dtc_test -I dts -O dts -o $tree.test.dts "$SRCDIR/$tree"
         run_dtc_test -I dts -O dts $tree.test.dts
diff --git a/tests/stringlist.dts b/tests/stringlist.dts
index 1e4d3140458f..c06fcd498191 100644
--- a/tests/stringlist.dts
+++ b/tests/stringlist.dts
@@ -2,8 +2,8 @@
 
 / {
 	compatible = "test-strings";
-	#address-cells = <2>;
-	#size-cells = <2>;
+	#address-cells = <0x02>;
+	#size-cells = <0x02>;
 
 	device {
 		compatible = "foo", "bar";
diff --git a/treesource.c b/treesource.c
index 9b17b3768a66..ae15839ba6a5 100644
--- a/treesource.c
+++ b/treesource.c
@@ -139,6 +139,28 @@ static const char *delim_end[] = {
 	[TYPE_STRING] = "",
 };
 
+static void add_string_markers(struct property *prop)
+{
+	int l, len = prop->val.len;
+	const char *p = prop->val.val;
+
+	for (l = strlen(p) + 1; l < len; l += strlen(p + l) + 1) {
+		struct marker *m, **nextp;
+
+		m = xmalloc(sizeof(*m));
+		m->offset = l;
+		m->type = TYPE_STRING;
+		m->ref = NULL;
+		m->next = NULL;
+
+		/* Find the end of the markerlist */
+		nextp = &prop->val.markers;
+		while (*nextp)
+			nextp = &((*nextp)->next);
+		*nextp = m;
+	}
+}
+
 static enum markertype guess_value_type(struct property *prop)
 {
 	int len = prop->val.len;
@@ -164,6 +186,8 @@ static enum markertype guess_value_type(struct property *prop)
 
 	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul <= (len-nnul))
 	    && (nnotstringlbl == 0)) {
+		if (nnul > 1)
+			add_string_markers(prop);
 		return TYPE_STRING;
 	} else if (((len % sizeof(cell_t)) == 0) && (nnotcelllbl == 0)) {
 		return TYPE_UINT32;
-- 
2.42.0

