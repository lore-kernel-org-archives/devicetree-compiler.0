Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102530;
	b=eK9QjhFPiaS92DA5/EGmwnEQVQyRkvuh8HY+A7SE4uOkpXpgB3qw1493z3u/qTVfvjZM
	 ZZM7UJRlsQOFualcBuQqHtJ/yFx8mItFf0o44UHA2YZuMIJZ3ws0jbwJE6PKgKrFWXCrZ
	 WlGed6iGDUoV9EilbzxPGg8Z17uZWe+gktm7Jn0yeKFlsjdrJsfHAk8nQ8mRiV/vVuJJU
	 /NLu6dAr5WBd99a2HSRE/M0/ICrMvjVIik4VNSKkWR9YoiR+ZWTkiRcp1q93FqwK1/gn1
	 sZs1SjuqjhCZw1L39Gaf/1LZlnTH8YMq+EehKffEIAAeG1pBEKrRQlCbxiC5BuUWT1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bo8k9tt0PZ5upluylsD/OI3SBebQOymu50VcW2ub0iA=;
	b=2NDsErbaWO8wPZ25t38hZkVZzp3Sg6/P1kMXOFQ06ZBt+U03D5BwyI/+5gcc7rT6iqkN
	 TCY5e2HR4yLEI/4ZtTjo0pNIhaJ7OfykqtQWBpnW194C2St7lGW8coJJ1HwGjjkTnYei1
	 wAje92yZEELttwE8+pCb06zJOQbayXcUtAWsjRXHm3BYeuvrbtSaIew7nYm9uq3vyIg+m
	 ybtiupF+FG8FGHBBjMrvMLwV+Hs5JfHXuk0iMx6EcSz3/iON4cIjJ2m27M/3d7of9WpJ6
	 K85woic5Ri2P6mfSkAYCjvCHJHjm8jQIsImC7myNMF3gbECMwu87OE9eAeH/O23W1qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dh8pBu+A;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D95C606A332
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 12:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D95C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dh8pBu+A
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-70b875f6f1fso2299016eaf.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793102528; x=1793707328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bo8k9tt0PZ5upluylsD/OI3SBebQOymu50VcW2ub0iA=;
        b=dh8pBu+ALDor8YlIlkvMjUghdkaIZuuGi789fs6ScZuh3MzPUpew8Q+q4IZ6rBlFBU
         6aPY3uFrdYon+669eLqLvgEQxkla4WxAfQbVRZcsTaRtmcuiFPTOywxp7YSN2Md7j6Eo
         c+B8deDFdevzYFIIP/Uyz8CAtr5yY8h0pOSPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102528; x=1793707328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bo8k9tt0PZ5upluylsD/OI3SBebQOymu50VcW2ub0iA=;
        b=fSbUrQleTxLuFZQwSHtp+Kgyad3Mo5LF8PR1jNxij/PzQPTFQUAM/fSTwTwV5XzbnZ
         cz+jOGhYV2wRRmY3FnuAcGhrVtry9lhQL65DO5WwuYewlsFUduyEzZKSbirgEY+pZgUc
         PZwMojdk6mqXrd2dZXX54LFMSSVe20IH7pJx10FuARcyx3iiQOaYm1MwJ0oGAOUzQN+z
         nLXZSRgcuNyrlWeM2x4VyAK7PF/av71wElt/CVni44p3KYJd9+Oz25MJtgt+RzLxSErE
         uzFuWb6LxwbUkXO2ZFPiWDcipg/oTJL8u5m4OJVoOqZhVYF6IitjuXXMk2MlmzAvq3ou
         FvaA==
X-Gm-Message-State: AFq9FYKbPOa9qJLbdmBktgPGtBkmF+BwObG7+A0EODYOLMFNdYctEEjo
	a+7+qyu8sJ5EZdF69CPc7y/ymBVgaAKFdSWqbyYAB6gCmhmZONo6hGB3zutNrwcedzFBa6Zl0SV
	kBLVmUg==
X-Gm-Gg: AYBFou23x8dXzuJNK8WivMv3RGsWHlDPaBWsrRgIu6pzbgNkGpZzSVJOD3xrhv+hzZg
	2FMG2d57yagr29xDBZuzOuirhLi7xF/Fl1BhmmJwTdLRc7MMLq0vAFq+Syu8VX9j3C1SXs4UivB
	JOsePAp23LccurO3Cl3GOOp/0Hv6Pr5culq7pNvqJSuEjDBKNaAbBQzaIBpYhARCAlHvE6By32w
	Jj0R0lmtZ1u6q7PhNWIYLssNqJazL/7ZpSNu2Yg3D3B1v2s/OY8OtDwmQ5pEuIWJ3ltwMCbmi70
	PRAaP5avTt3s4pgLpnmh6uhE/v8t9homLhop9JqX+ctfF4i4KQNI7j44kiqNowUXRQJxp+YkWJG
	UNLmUADRnTeS7tzxyOobhzymyqX4QG3cJNqMivUqQVC3GJPcncivnjIGoajJeT3bCHCWek1Q4X+
	yrzJFgfRgHO/x+5aaPIf3n1JNx8iGT82c5qmop7b56Z2yqKE5ufVvhiUv7WzvOOLfW8W8MpTIb7
	9AL+q0JHua9Y+dt/XLh5RPh+8ONMchqAaBchP10ipJzlkMbT/1IDC7qXNKZn70wHl6SRLRytfS6
	X3GkA1Feiocm
X-Received: by 2002:a05:6820:3382:20b0:703:4766:16e with SMTP id 006d021491bc7-70ba0ec9f17mr4269473eaf.56.1793102528529;
        Tue, 27 Oct 2026 05:02:08 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431c012esm7133755fac.11.2026.10.27.05.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:02:03 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 3/5] fdtput: Suggest -p when a node is missing
Date: Tue, 27 Oct 2026 06:01:17 -0600
Message-ID: <20261027120126.2613353-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027120126.2613353-1-sjg@chromium.org>
References: <20261027120126.2613353-1-sjg@chromium.org>
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

When the node being written to does not exist, fdtput just prints
FDT_ERR_NOTFOUND - nothing points to -p, which creates missing nodes, so
it is easy to conclude that fdtput cannot add nodes at all.

When creating a node with -c, the error also names the full path, even
though it is the parent which is missing.

Add a hint to use -p when a node is missing, both when writing a
property and when creating a node. Report the parent path when it is
the parent which is missing.

Add tests that writing a property or creating a node fails when a parent
node is missing and -p is not given.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 fdtput.c           | 20 ++++++++++++++++++--
 tests/run_tests.sh |  4 ++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index 4094015..c9973d5 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -47,6 +47,22 @@ static void report_error(const char *name, int namelen, int err)
 		fdt_strerror(err));
 }
 
+/**
+ * Report an error looking up a node which must exist before writing to it.
+ *
+ * If the node is missing, suggest -p, since it creates missing nodes.
+ *
+ * @param name		Node name to report error on
+ * @param namelen	Length of node name, or -1 to use entire string
+ * @param err		Error number to report (-FDT_ERR_...)
+ */
+static void report_node_error(const char *name, int namelen, int err)
+{
+	report_error(name, namelen, err);
+	if (err == -FDT_ERR_NOTFOUND)
+		fprintf(stderr, "Use -p to create missing nodes\n");
+}
+
 /**
  * Encode a series of arguments in a property value.
  *
@@ -182,7 +198,7 @@ static int store_key_value(char **blob, const char *node_name,
 
 	node = fdt_path_offset(*blob, node_name);
 	if (node < 0) {
-		report_error(node_name, -1, node);
+		report_node_error(node_name, -1, node);
 		return -1;
 	}
 
@@ -284,7 +300,7 @@ static int create_node(char **blob, const char *node_name)
 		node = fdt_path_offset(*blob, path);
 		free(path);
 		if (node < 0) {
-			report_error(node_name, -1, node);
+			report_node_error(node_name, p - node_name, node);
 			return -1;
 		}
 	}
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 77f0a81..7254e53 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -962,6 +962,10 @@ fdtput_tests () {
     run_wrap_error_test $DTPUT $dtb -c /chosen
     run_wrap_error_test $DTPUT $dtb -c /chosen/son
 
+    # Missing nodes are not created without -p
+    run_wrap_error_test $DTPUT $dtb -c /blackadder/the-second
+    run_wrap_error_test $DTPUT $dtb /blackadder/the-second cost -ts high
+
     # Automatic node creation
     run_wrap_test $DTPUT $dtb -cp /blackadder/the-second/turnip \
 	/blackadder/the-second/potato
-- 
2.43.0

