Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C92F2566DA
	for <devicetree-compiler@vger.kernel.org>; Wed, 12 Mar 2025 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741808559; cv=none; b=Vg44it1IxGjFnH1x9SwDZ3g7EE/uft9nII3PurFkd9PbQrl7TWT3kOIXxaeqJDogpoycHvBa173zGTfi+OHpVI3JiAOsg6/BAIIG1x37ckzOyQ1cuwOffX3aipxZ3w2Db1qeONAL3uG3rEevIggr12WgT8arlFlsqc+4lPbL4B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741808559; c=relaxed/simple;
	bh=/EN/Z9KMvUfOX3Xc2p0W93/2UpN+rgkaKrljV99WZ24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5JC7dC1GoN+q4zC6ZSgReao8hs5ulp0/IzbE22AVrxD3MUTYM8HAWeI4Rn0QGYVpCOhlt3IW/m2olSRZD1Y2tIkbxidQs1dB61gNq67nzLQqrYE9nPeBr6rznt8Asw0JcjKqWjoKgfZYjv0hQZa6UArMT+WISrz3r8N4kKIOa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=uqYT7aaN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="uqYT7aaN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22398e09e39so4292585ad.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 12 Mar 2025 12:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1741808557; x=1742413357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQPXO18tGmqjnB5Z92B1WU1rsoBBmvoN4U9VjfnJh4s=;
        b=uqYT7aaNf9Wz0V8WY8ncfRCjcz0TR+QVVsqpD6KDBrX/6Uvgb8QJEcmew+q2nZN3s1
         vBHr7iwQBJ2lLJ8e6zLwhqsGwwv0dnQoTVTAzS6lXB4Y9WiXXTGWi39/VpBL5ABnP6JB
         vEkZMVFDr90bRCUH5R90TKUBp2ue72JcjehfvAd6vffJ04USW2gTONq3mHxkxrUtDaTE
         xEsfK8t1SomyCVHhTa3emvqh2jSq66k1Qqp/eikrOAiz8EtsEJKibeN2yzfbDuGiOIXn
         cRL7jkwbey7JhStVF2vzIdV37MeB/I+tAnTaoD0+JXrN05vqDWZ5BlTf1bfSmaMqtvXT
         bpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741808557; x=1742413357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQPXO18tGmqjnB5Z92B1WU1rsoBBmvoN4U9VjfnJh4s=;
        b=iEIOaIl5aaooJ+MW2CJ620c4MIHn/L+ReU76vbV5mmqwXcHS+Qja05xmeLWzz6bKJv
         U2dGON6JAe9YtRWI6DTb+/Q8ZKCwl1Tk4OlbqBvKNcHXoc4EM9oWDBBhkWPOOV6izRXT
         qYONuQvg+kVege8/rdeYvPwrRjthBFfI6zW8ppO86b+RypE1qV7dy+sq0hzVc09tKkc3
         UGSRxSWPG06MQDSmdHCA19hnVtThQ47RFk33OrenwTVaXDDU5RtkLp9xj8Fqx0QKngXI
         CgAlEbugPv3xiLCwcvEOHh76TaTX8CkiSA8p2WdV9BQzfYueRUp/iIJyp/RIYJ3al1i8
         K5sQ==
X-Gm-Message-State: AOJu0YxtcfTFPqGt/pqi+I3NZd8TXAaUjo5xlHLx+V2X0LSoJ0Jyk8gC
	jyFEM9juSeMZ2HhroioavLBaUXfhAULI3SUoT+6X8O9X6fgALjsit1zIeTK0Gw==
X-Gm-Gg: ASbGncuD+1QPI+AZpUBkZaEAM6z2RlI1VDw1RUmALQztdZxmwgK7t5vFc8h4Q0e/Kov
	lQPc8WCWOrRosZTsCB/b8qcw0LTRDxV3Si6MfGVjTwKP3Gy3ThVvjlA0sznVwgQonn4B+H6ADrW
	sg7MFYN2EF01HIlK8LWuxfgUc0xromQXrtvgy5oJQ/qB0FtD4H2hnOolIu0MYys1fPLET0Y5VP1
	KqKcrJVdl6M4NevIhNjquT9yYQr40A22tknMFE4/HJCQJXhoiGIrkPIG+LUNgynkALYTLtU2jxF
	UuiNQJ4y6EoLGIV+XSLSIusWKZCZkyRgQ0iVSb0ew2Jwm0Q6M7+lSFdMrgC7hA==
X-Google-Smtp-Source: AGHT+IFL2fLR6Wj/kavx4EgIPVyUREtaO2BvMQQ19gQcxDC17FHFbWAAuVCNd092coYlsVaQmRwiLA==
X-Received: by 2002:aa7:88d1:0:b0:736:51a6:78af with SMTP id d2e1a72fcca58-736aaa5d8f1mr32542307b3a.12.1741808557394;
        Wed, 12 Mar 2025 12:42:37 -0700 (PDT)
Received: from [172.16.118.31] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736cd220c5fsm7781782b3a.55.2025.03.12.12.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:42:36 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 13 Mar 2025 01:12:00 +0530
Subject: [PATCH 1/3] libfdt: Add fdt_relative_path_offset
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-fdtoverlay-target-v1-1-dd5924e12bd3@beagleboard.org>
References: <20250313-fdtoverlay-target-v1-0-dd5924e12bd3@beagleboard.org>
In-Reply-To: <20250313-fdtoverlay-target-v1-0-dd5924e12bd3@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4397; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=/EN/Z9KMvUfOX3Xc2p0W93/2UpN+rgkaKrljV99WZ24=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBn0eOcPdpDfYi6uiyJrzfWtttwjOhA59jqdWG6f
 SBgZ+3XmcaJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ9HjnAAKCRAFzvXHieVa
 dD7xEACf37DGisenzTaZyBng+H6kFERWMksJJU3sc368o9CIi+JN43LR0C04Q4yfZFWOf0S8SH3
 fIhIwigdAH3RFFnCNh92OPb32rn5SQ/AoCXqlaUlGe94azq4r0N1Pawh6IAjfhk91uX5A+m2rf0
 0b0qw11HQ+eoUka+0sPX7em/tuKpln8XdM7YIVPxccKImBy9V9OKwaGPYRCeGhi6R/wvYpA7hH/
 1jVu+mPY6Cn9zIGuIjGbqR8yjnAHZvFjZ4/VwYudup1u4R7LAXCc8++RvC2eIglfPAnbn5POMPy
 lgyMBoEBc87zwny1w01KO810EqnX2jo2OZslPiDN55pCpMZ4l4UTOdcF2OPGkb1og0c9qt5PD65
 npeQWWhuEwB08LdkQo9ZV7qVEPaZUNeO6ltzhir6xYJrgAzHjdIbhV5HZs+nNSg11Aia2MBrQXJ
 7SLMnA0Mwp4bU2AKY0+xBUG1pYbzm7yrIx3cQHVZOyhRl7HC6errn4HKGpjg8CwhxVp2vQqRJSw
 LUGoNS5ithf3IW6IS6E+XvIGfmcU27EWlsJPXXsWlJTVZc9Dh9CzRwsuJEgvFYYg1zt+wDspm8L
 0GqmS4d3mXfKVLtTKThH5ruk2JbwDPW5ss8Ow4w7emeWCMjAWtFLk1rJHuomeOZwGJYdmHEco0j
 WrRNSyCi4HawGlg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add helper to allow searching for subnode path given a base node offset.
Behaves the same as fdt_path_offset when offset = 0.

Aliases are only allowed when offset == 0.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 libfdt/fdt_ro.c | 17 ++++++++++++++---
 libfdt/libfdt.h | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index b78c4e48f1cb351504af4d861513b47f375262f5..f426183651cff746b67ebfe86e5809325cad4fec 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -247,11 +247,11 @@ int fdt_subnode_offset(const void *fdt, int parentoffset,
 	return fdt_subnode_offset_namelen(fdt, parentoffset, name, strlen(name));
 }
 
-int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
+static int fdt_relative_path_offset_namelen(const void *fdt, const char *path,
+					    int namelen, size_t offset)
 {
 	const char *end = path + namelen;
 	const char *p = path;
-	int offset = 0;
 
 	FDT_RO_PROBE(fdt);
 
@@ -259,7 +259,7 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 		return -FDT_ERR_BADPATH;
 
 	/* see if we have an alias */
-	if (*path != '/') {
+	if (*path != '/' && offset == 0) {
 		const char *q = memchr(path, '/', end - p);
 
 		if (!q)
@@ -295,11 +295,22 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 	return offset;
 }
 
+int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
+{
+	return fdt_relative_path_offset_namelen(fdt, path, namelen, 0);
+}
+
 int fdt_path_offset(const void *fdt, const char *path)
 {
 	return fdt_path_offset_namelen(fdt, path, strlen(path));
 }
 
+int fdt_relative_path_offset(const void *fdt, const char *path, size_t offset)
+{
+	return fdt_relative_path_offset_namelen(fdt, path, strlen(path),
+						offset);
+}
+
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
 	const struct fdt_node_header *nh = fdt_offset_ptr_(fdt, nodeoffset);
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index f2675b12f674b2221273d666d51b8e31f9b4dfbe..9b61215ecd11c8990128c0b523443b83f84b1013 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -562,6 +562,59 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
  */
 int fdt_path_offset(const void *fdt, const char *path);
 
+/**
+ * fdt_relative_path_offset - find a tree node by its relative path
+ * @fdt: pointer to the device tree blob
+ * @path: full path of the node to locate
+ * @offset: Offset of starting node
+ *
+ * fdt_relative_path_offset() finds a node of a given path in the device
+ * tree relative to a prior node.
+ *
+ * Each path component may omit the unit address portion, but the
+ * results of this are undefined if any such path component is
+ * ambiguous (that is if there are multiple nodes at the relevant
+ * level matching the given component, differentiated only by unit
+ * address).
+ *
+ * If the path is not absolute (i.e. does not begin with '/') and the
+ * starting offset is not 0, the first component is treated as an alias.
+ * That is, the property by that name is looked up in the /aliases node,
+ * and the value of that property used in place of that first component.
+ *
+ * For example, for this small fragment
+ *
+ * / {
+ *     aliases {
+ *         i2c2 = &foo; // RHS compiles to "/soc@0/i2c@30a40000/eeprom@52"
+ *     };
+ *     soc@0 {
+ *         foo: i2c@30a40000 {
+ *             bar: eeprom@52 {
+ *             };
+ *         };
+ *     };
+ * };
+ *
+ * these would be equivalent:
+ *
+ *   /soc@0/i2c@30a40000/eeprom@52
+ *   i2c2/eeprom@52
+ *
+ * returns:
+ *	structure block offset of the node with the requested path (>=0), on
+ *		success
+ *	-FDT_ERR_BADPATH, given path does not begin with '/' and the first
+ *		component is not a valid alias
+ *	-FDT_ERR_NOTFOUND, if the requested node does not exist
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings.
+ */
+int fdt_relative_path_offset(const void *fdt, const char *path, size_t offset);
+
 /**
  * fdt_get_name - retrieve the name of a given node
  * @fdt: pointer to the device tree blob

-- 
2.48.1

