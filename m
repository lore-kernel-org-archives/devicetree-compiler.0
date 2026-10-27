Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102521;
	b=WN9IYwmKBKiATJFK0O1HUgw6wgOX132BVDz2ID0wMkOKK85BqOOUV145LsJt2F7RONHf
	 MaLKIln3eC4+ZIBoVx/BH8mQumkIl/KlfCmnv9bZ2RrFPqhTlVKy2xq9FpZPAEIVto6V4
	 KoUCy7RJm2m1OEMYqShHa2mc/dEoXJUk8nggNi0ORG/vbd/5LEENFXo11qWUIvI7YElNR
	 96ERjHsPSnaYOBB2m1o3f5aMwryKL2exz2Af6o2N1eh+b78JfdieHmfQBAt9XjOtuAwtJ
	 elSW5H0dqTCwFJtzJ6p7ERLiEZ/CkT4aCpYYSyzLHI8NQmRBbHi9RVJ4Yr9kM+5Yuog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cI8W1w8qCgq4kHQNBiJd3I95s/EXLlTA7ALE3m9xGQ4=;
	b=Ah8laQ8cfZVGYZVkjfAR4dxL73HujoQY8wBV02xZWlq1XwG+EjHs3izw4YOrH/uuXQ02
	 Po5TMMSVIazW/xci5L8t568JoFCkdKowNApFK6GOzeMjKsToGefbqv096HeOHLTkT1dlc
	 SplazoH19BhdsfnHAtTg6DpsaDspXF3wJarNDpzOjN2exMPVQ28/RDNW2x115jIbZH2Ge
	 jgBRG5OIVA4U+Qx40P/ODE6PM+L0MquI/fuu1eOYTyJoVgVlQ48aCGl2gHPLBT2Wz44Sw
	 bIOVkqbd7fsYjEG5db+x1rc/UWOgN2WTzb40QXfu3JU0JBMIDg/GVtCrgnUg+986RJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ROuooxW8;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FB606A338
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 12:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005FB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ROuooxW8
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4877837890fso2014826fac.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 05:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793102520; x=1793707320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cI8W1w8qCgq4kHQNBiJd3I95s/EXLlTA7ALE3m9xGQ4=;
        b=ROuooxW83Z1ubZaDHwckvISfP22c9XAfLcMK53SXJXNsJacMQ6UEswO4YV0y8OPLAZ
         dCVGDa5wQV346DiqkkzqDnviViqDZSixrOpW8BxzEQvhajqoGJBGl+NHs/7XSFm42+91
         xIQD1YBx9xyVkKLN3FFa6k2cT9hNg64IWHWt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102520; x=1793707320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cI8W1w8qCgq4kHQNBiJd3I95s/EXLlTA7ALE3m9xGQ4=;
        b=mT6stP3lRoNfJNSZGZuuy6paBb9ViY+atqS3MlyAwevjhYNUHgVEzKA0jmEhSj+oB9
         bridzOQhKAUTsxX8ALAQVK+vnIWYpt9KMNqYnosQ0c7nw8rgEBqV2Cm79MShJMFp/AtZ
         p8Iw5MxzNEUs9y2VpboK5UB0GHoMERY5j42CxQ7OC+oxHIe2fmlxB9f10fSv7LcRttVH
         ArbkRoXY+TF6KsKa43Zi9oFHFNGa7dSAbbQ0G5waPwH8G605gcI3CKMu1ZdHy5/Gm8Ep
         P4aMptDRYvjZsBFFarUUEehVkZcFutgNEX2GeoLeuJYkR/O3gbpOb8e3WKczZwR2nlwJ
         BNIg==
X-Gm-Message-State: AFq9FYIsSysxYuiZ9cr05+QERKgKmYPJMq4S6dHA6UEbMXJA9s1xkpfD
	bxybtUXExCX+Tld9kSsVePZ0spRAMKpb6xN6HNFnM2/kyehwRTmLTw0zXQWUIBu4GGIKJrJG519
	wr/UtpQ==
X-Gm-Gg: AYBFou08nY6ELE8HV57Ew3VPTDBtb6duFbIVElBnEVaEGFc/SwFBsr4Rmk0T6u+Ijau
	A+u4Fq5s1uNP4gakpNLEba8f9WFHjvX1VPHpryErhLaG/v4Mr6xZTjT7lWcs61on15/W7Z4DkWr
	FMpW8eU85c6zyK5pBGcxF+nJE3G68Xo74vAZA98UX9x4lg8TVeK7VWBnbq25jsc3UJ5fS3pIlPR
	7qOCd0POOkEGCPUydKMHJanbs5llhd1pMw4RJcYFsRpO4nL6evxgRLU0sFvTwBtuNTT7A734Tx8
	6PKhFBMhDlJ1SNoM/TKaQFcaLgwCaP2mEpwwWxwzEEr3Y8c4hREwED03kZuKfPGVlbGctORFSn6
	sjhMvrq88M6X7Z1kckzic9UdhE3pGU/eYV9jeTEAw3WBpFHtQkaZO04n+FdCii6T9knL+lfPL98
	cJsB05ywVmrf2jIpX/fd9A+5Hf06lY1qAOZBHai37mSENadmYzv88AWjkX7RaA1E/gRPl675ou+
	vGCXovGywwAG88XEtR6v1Bbl7MaWp3QqJvJ/aforuJbSAHSmuH37hR2a890lc2rPrNztJUtCzh7
	WJHqrTfzT4U/
X-Received: by 2002:a05:6870:9f10:b0:49d:c3f6:418d with SMTP id 586e51a60fabf-4a83f42ef77mr5369428fac.11.1793102519543;
        Tue, 27 Oct 2026 05:01:59 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431c012esm7133755fac.11.2026.10.27.05.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:58 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 1/5] fdtput: Explain how to create nodes
Date: Tue, 27 Oct 2026 06:01:15 -0600
Message-ID: <20261027120126.2613353-2-sjg@chromium.org>
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

fdtput can create nodes, with -c and -p, but this is easy to miss. A
user has asked for a way to create nodes, not realising that one exists.

The manual also claims that -c creates nodes "if they don't already
exist" and that -r and -d delete things "if they already exist",
suggesting that these are silently skipped otherwise. In fact each of
these fails. The help for -d says the same.

Mention -p in the usage message. Correct the option descriptions in the
manual, describe when each operation fails, and add some examples
showing how to create and delete nodes and properties.

Closes: https://github.com/dgibson/dtc/issues/49
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/manual.txt | 34 +++++++++++++++++++++++++++++++---
 fdtput.c                 |  3 ++-
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 598c6e6..00e361b 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -755,9 +755,9 @@ Options are:
         Optional modifier prefix:
             hh or b=byte, h=2 byte, l=4 byte (default)
 
-    -c, --create     Create nodes if they don't already exist
-    -r, --remove     Delete nodes (and any subnodes) if they already exist
-    -d, --delete     Delete properties if they already exist
+    -c, --create     Create nodes
+    -r, --remove     Delete nodes (and any subnodes)
+    -d, --delete     Delete properties
     -p, --auto-path  Automatically create nodes as needed for the node path
     -t, --type <arg> Type of data
     -v, --verbose    Display each value decoded from command line
@@ -771,3 +771,31 @@ create/delete nodes and delete properties.
 For the first usage, the command line arguments are joined together into a
 single value which is written to the property. The -t option is required so
 that fdtput knows how to decode its arguments.
+
+When writing a property, the node must already exist unless -p is given, in
+which case fdtput creates any missing nodes along the node path.
+
+With -c, fdtput creates each node given. This fails if the node already exists
+or its parent does not. Adding -p creates any missing parents as well, and
+does not complain about nodes which already exist.
+
+With -r, it is an error if a node does not exist. With -d, it is an error if a
+property does not exist.
+
+Examples:
+
+    # Add a node to an existing parent
+    fdtput -c test.dtb /soc/serial@1000
+
+    # Add a node, along with any missing parents
+    fdtput -cp test.dtb /soc/bus/serial@2000
+
+    # Write a string property, creating the node if needed
+    fdtput -p -ts test.dtb /soc/i2c@3000 compatible vendor,i2c
+
+    # Write a property with two cells, given in hex
+    fdtput -tx test.dtb /soc/serial@1000 reg 1000 100
+
+    # Delete a property, then a node and its subnodes
+    fdtput -d test.dtb /soc/i2c@3000 compatible
+    fdtput -r test.dtb /soc/bus
diff --git a/fdtput.c b/fdtput.c
index fdb581a..c139de1 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -403,6 +403,7 @@ static const char usage_synopsis[] =
 	"	fdtput -d <options> <dt file> <node> [<property>...]\n"
 	"\n"
 	"The command line arguments are joined together into a single value.\n"
+	"Use -p to create any missing nodes in the node path.\n"
 	USAGE_TYPE_MSG;
 static const char usage_short_opts[] = "crdpt:v" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
@@ -417,7 +418,7 @@ static struct option const usage_long_opts[] = {
 static const char * const usage_opts_help[] = {
 	"Create nodes",
 	"Delete nodes (and any subnodes)",
-	"Delete properties if they already exist",
+	"Delete properties",
 	"Automatically create nodes as needed for the node path",
 	"Type of data",
 	"Display each value decoded from command line",
-- 
2.43.0

