Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172900;
	b=4HhlcIzXQPU8T6Gb2lFBs0SAG/o6J26VcrDVoO1IvlA0C4fpPvb5eVIaagjkg1pjEcum
	 c3RWTZ/XrdUF62v06mdRXtuM4VNuWoZ0kyP6SJ4mze0ocF4qTZyesyFfnfAiVPyfG+3Oz
	 q3SpctH7Ua6RPQ2KCAqS7U6BSl+2Op+fyI1wzWifCtDknZY3ErZAEmTrdBGVqerUz7KrV
	 Uabss+oWCLFmhmLGsB/SxOfABrEi0ZScB8tu8jb17t70OrWzb4jV2f6qOft/05PGo2D01
	 CPZxZLSKBKnrKXpgcfhcv7MYR2VSQiRHMVpfuOVYJi6gDy0S7oISzd5uGtAF3mysoJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=thMDYFjJrkKMyWQaqEIPlLC09COhztt1n2c6HEO2Ssg=;
	b=uNohfXApolMQRf6zvwUheA1t3pt18hjkzpoCA+IFS3I/RHt8b+mez/dgmeHdQLeYs/vn
	 Lbs7lHmoUqlryPmp91PkCqZxd/zq2AwQLLzVMTI9hjQcLkOQqvLAz80Q/VSh+mXHQk5SI
	 sq0meWeC2Wv2z3Y6m6e/klsFRShJ2/UJXtpi/pu7wO8/1f/ulwQp/u8YNrvzjZ2XQsWZ4
	 TzCfXdkLdpAu3NMyQ/tcRY9CAAlE0g/KX6zZp9YwVYEC1DjqF5Vk4+I1vtSlj+/Wg9Alp
	 8Vbteg9isYC7U02IqEWlpgZ39sl9+MziYtBwYdLPKOFufCiYdMm8eODV7I5hfV14kow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kglL86ap;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223ED606A320
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 07:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 223ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kglL86ap
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-854b6e2e41fso318984a34.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 00:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793172899; x=1793777699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thMDYFjJrkKMyWQaqEIPlLC09COhztt1n2c6HEO2Ssg=;
        b=kglL86ap/BeHQLxXXOws1vQc7N0pne+5mJEFqocIKb1BT2yQMsDhtQAk1xwIeO/8lU
         VjxwJHeWmTk7DaQxb12LCXGlc6vuCzXsZPEKpDQ0DAjL0ZzC6D8Vt1OS9GGRBgjqjg6Y
         ZGbXcmohxZjG1Bu8dq+DRPMHI0XjoOPyVUWzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172899; x=1793777699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=thMDYFjJrkKMyWQaqEIPlLC09COhztt1n2c6HEO2Ssg=;
        b=B15CT3f3IFKNpKgyQyn1EVxz9jVJPOML58QaU9T0qYhzzQPKBzX7ySJH0sd0dUvXh2
         sQYFwmrjgrDqbPWFR2/XKznq8FC76hZAMeaHRJthWumDZmxfRE970wPHAegeHF3d1/bm
         N0Fpw5d+5iP+JFPB2og6AjaJb4ucJRtqZbzSOG2sC6D0nQPLYlLz7q22XvhbNNpLvZmx
         VeHyioOV+OXJa5lrn9gs9p6Lm6gB8Yk0FDL8cykx03te3vR9gCugSix7SvsVmHwxhCjF
         8K8ca/BJH4WzIQGkRnJ0apUwnpyqz0xMIOYbPfvs0uKdzirX8d1MT+OY1qBOTihb2S0Z
         7FcQ==
X-Gm-Message-State: AFq9FYIhDqSfdyjjiIlIog6jlMw2hMyjiaRx3CCZ6eymkNgJC/6BCZM8
	ZwczHFdVFWG7ngRfkUpQ3grx3yNYBn9uF+7GBamwLEJx3yLaU5tYOQ0kRzQdQy3fr0+Z0ChTj6B
	gZZrDbA==
X-Gm-Gg: AYBFou1VvA6iWOnZTR2b6fq2pbugsXm3jES+PAJib23Y3lExGJ1W2s49cqkQrv3oApN
	jyRpOGoV1AzKHSqoPGJ36Wr0rtNlckcN33oHI4qBaxPPWwjYwWsaIja4X/wttXJWqB9z6nl8UFk
	MPgjWPeh1FZ5CuNkrCiyN2PaQyIu9MFC+tdRLkQqSeckshlLPZGONM8Cz+0oRwrufHItW6KlKOW
	4tKeMusKHNZw4osjWGtYberbXEqQH3vUOmBsdCAuxvXmI/aCdSVnUrk78JAkm1eqRLcpLFZnXKo
	BV5gRqOfp8WzP5zmDuuDc1DgmBjHC4lgMDtfwSaXf3kXtLUs3RC9kSp18GPhctzeM/TUHD0xUlu
	o7Ikouak3PEU1GXrfRbzP33sDOzrVBY39siwgh+MdAbj4h6/pqnZmLfG+YnzY5NgoZgaO6Uc50w
	9+ZGXiNsCEQslSYrNh/WgudtMmqsy/ntltFlhB1snh+FpgzZWdUxTf8AS84CvkP3sKpY+lCdVhX
	4cFgWvSO/7TUOv09TVxtI9y0hjDoILQlvGvMh7DrkENddwqP4T6texo2a97UnTlXTCxZuozwwj8
	A6aJahEnY6iiUkAHLjXMtEmYf9W+4OZmGvHzm5Op1Q8y0FMztlkK0W4PgmlxCQ==
X-Received: by 2002:a05:6830:310f:b0:845:3cfe:60a with SMTP id 46e09a7af769-85abcd3c17cmr1951017a34.10.1793172899112;
        Wed, 28 Oct 2026 00:34:59 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b20219dc4sm928838a34.22.2026.10.28.00.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:34:57 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 2/4] fdtput: Follow an alias when creating nodes with -p
Date: Wed, 28 Oct 2026 01:34:18 -0600
Message-ID: <20261028073440.3327687-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028073440.3327687-1-sjg@chromium.org>
References: <20261028073440.3327687-1-sjg@chromium.org>
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

A node path can start with an alias, such as serial0/sub. fdtput allows
this when writing to an existing node, but -p requires the path to
start with '/', so it cannot create nodes below an alias:

   $ fdtput -cp test.dtb serial0/sub
   Error at 'serial0/sub': FDT_ERR_BADPATH

When the path does not start with '/', look up its first component as an
alias and create any missing nodes below the node which the alias points
to. A path which starts with neither '/' nor an alias is still
rejected.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Rework on top of the new patch which requires a leading '/'
- Drop the Fixes tag, since the new patch fixes the bug

 fdtput.c           | 17 +++++++++++++----
 tests/run_tests.sh |  9 ++++++++-
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index d0f8420..3c6cc98 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -201,8 +201,9 @@ static int store_key_value(char **blob, const char *node_name,
 /**
  * Create paths as needed for all components of a path
  *
- * Any components of the path that do not exist are created. The path
- * must start with '/'. Errors are reported.
+ * Any components of the path that do not exist are created. If the path
+ * starts with an alias, they are created below the node which the alias
+ * points to. Otherwise the path must start with '/'. Errors are reported.
  *
  * @param blob		FDT blob to write into
  * @param in_path	Path to process
@@ -214,9 +215,17 @@ static int create_paths(char **blob, const char *in_path)
 	const char *sep;
 	int node, offset = 0;
 
+	/* a path which does not start with '/' must start with an alias */
 	if (*path != '/') {
-		report_error(path, -1, -FDT_ERR_BADPATH);
-		return -1;
+		sep = strchr(path, '/');
+		if (!sep)
+			sep = path + strlen(path);
+		offset = fdt_path_offset_namelen(*blob, path, sep - path);
+		if (offset < 0) {
+			report_error(path, -1, offset);
+			return -1;
+		}
+		path = sep;
 	}
 
 	/* skip leading '/' */
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 644c405..b3d3f3a 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -970,7 +970,14 @@ fdtput_tests () {
 	"-ts" "fine wine"
     run_wrap_test $DTPUT $dtb -p /you/are/drunk/sir/winston slurp -ts twice
 
-    # A path must start with '/'
+    # Automatic node creation below an alias
+    run_wrap_test $DTPUT $dtb -p /aliases second -ts /blackadder/the-second
+    run_wrap_test $DTPUT $dtb -cp second/carrot
+    run_fdtput_test "orange" $dtb second/carrot colour -ts "orange"
+    run_fdtget_test "orange" $dtb /blackadder/the-second/carrot colour
+    run_wrap_error_test $DTGET $dtb -l /second
+
+    # A path must start with '/' or an alias
     run_wrap_error_test $DTPUT $dtb -cp baldrick/turnip
     run_wrap_error_test $DTGET $dtb -l /baldrick
 
-- 
2.43.0

