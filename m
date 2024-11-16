Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E9DD515
	for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731769263; cv=none; b=GcWnszEekdEZYYj38OS4wK2//DP+5muyUFAJdXtHwXKotOUVXXmaWapztiKK7tAmNPPj/MTjdGzvWEfLmf0s7/AWS6nlInSlZCNLeC+/DEf7sqbfwewVGij/FcLzIpN8es6RD9BX7qTRZwUFvdqKpMDCmzqGD4k5pnRUdZ0pnEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731769263; c=relaxed/simple;
	bh=RowKpTQ27PW88jR1t4XBUIf1CzHgzRLi5MZ1FycSTYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RwipWX2t/LnZNRzzIJjImI1xqBEuwIFHOEz7CsNVcPolBgn+X/2uRB537dVbA3KJlZhXFHbcMz3x9XjSlEXj2FWhwe0MVDHjZ3zZ48MQtlSomR340HF3+RAlgBea+HjHpOJVu4YMdi4drSjoM/F1yxa6tVSnrLTRUvo/ENG3s8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=L9SKgFfi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="L9SKgFfi"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cf3e36a76so17844935ad.0
        for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731769261; x=1732374061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zS3bpMtS9HqpibElJxIdrT1id7KLTHtvtzCwTJ8xbjo=;
        b=L9SKgFfio43TztUopa4CgGbdowHN3IB+lAv8TJB3kmdNYosZDrFUt7YIC1X2xDOa/i
         NencxCvSZt5GM29eYR6uo9D/5mvyMg+yavUCQ850GYsbK4ISJLXbz1yLtaZIvmS8KZkX
         1Qc0NCpALCWgwNPS0JsbIwjKOkPacimCwYvPiIwtT6kkdVvRvcOcwnUGM8dBIjjj08zT
         +mkS17nJ8qau0kfV7kXwlz70OpJY8upaF78J7OljjvsNLi2YDxnN/Ifdi7A1bbZ4LhCN
         SfftnE/JpQtWocd4X1YXnYe/Q6mLD9UQscoqewNGIxFn/PDgQr0VCBqalDV+PaHOt3o7
         P4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731769261; x=1732374061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS3bpMtS9HqpibElJxIdrT1id7KLTHtvtzCwTJ8xbjo=;
        b=oIT/VVSJtPOOfTptYYDm8hzzIi+odpPM/xjLfdbN0hlzGZ7pTDD9VvfEGErwwppwGM
         i+bVuXTLPMeJsI6ij8r2VWTKLErvha5o4XQR0JR1CN5TM3vSmGNSSuwcgVgtzMiFUq1V
         VTEN54CoEj4QTNg+zwXW4bvBs0/qiq6w6vmXeVQcBMKpG1Lq66QxDPkTJsWgK7deEaG0
         hWFNredJ3+7c7iesBRDwGybUabEV9ijzuOnAMhXJJcqfowIRcghBrTE+y/NjJfnZ6ZQ+
         TcdPjv5OhzP8mAwLqQLXypF/cdJmwKy7HnozRh1Q9T9h/zvhfs+xL5xlxj8MfeaPglEa
         dRUg==
X-Gm-Message-State: AOJu0YztZYDdUIMufHhr/FGTG2fVEzSDYpJfaiDoeZ4L4acmm2OxnBNR
	ZoU5SArdxpVTTA9/oj2hRF5b+JF0/QiqG+RCHEsfsU1U+0N+OkqaJVYFoRFX8w==
X-Google-Smtp-Source: AGHT+IHTwblBQCMzJSeokMjxRhqgWyjSBLSaCz13zpKIhmAF9fJAFr06qfi18mmlYIHyVaVJ+C+vKg==
X-Received: by 2002:a17:902:d4c5:b0:20c:8907:90a with SMTP id d9443c01a7336-211d0d6eaa7mr89621475ad.5.1731769261082;
        Sat, 16 Nov 2024 07:01:01 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f4694bsm28492305ad.196.2024.11.16.07.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 07:01:00 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sat, 16 Nov 2024 20:30:20 +0530
Subject: [PATCH 2/5] libfdt: Add namelen variants for setprop
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-overlay-path-v1-2-ac3e121359e9@beagleboard.org>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
In-Reply-To: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4875; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=RowKpTQ27PW88jR1t4XBUIf1CzHgzRLi5MZ1FycSTYw=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnOLOhSITH6jI3L76XvS8hABctxstTcY4dDmsql
 UqmI5eTVK6JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZzizoQAKCRAFzvXHieVa
 dGkCEADiBxYK7QgqwpNSVEzyK++UvIuPJWevf71N1FCoYbmLJkfMdSdZeTKjQJmf3AguZPTm5rG
 KZe2FFnPKU5zcWZybP5kdiW0rUWUi5JcsGfyatifh3X90ceShV+DChikuwPxb2vzgCwnf4HNpgJ
 k9PkekKdkaPp/Vy7d8lcfW9wy8RsrIiT8ty33vDR+IzM0mOLdLgG7oyV5n2mnBDjBFL+WEIs79V
 gx5X+lvxzfZtrMBETPzEITjI+tisuSWrHD2aMWN8tC0zfXpxhhg3Rpoj+ypBVIbn77FEyvLjCzO
 6z5abKumuMGnqj2WKiYshLH8PVIIXKNNy9nnttIAHHRwG9Q4Ji7X6z7BFaSdALtVHcrEUV7P2dY
 Wc4YJ/861Ue9AMopqui4h6pBaUybYg9wvRRHcuoJq+2mUxlkeBynU++vdJqez8RHOikuDyQ5Akq
 DDMqF+aMWFAifFkbcGYis0fr9xitV5Ikydg1nOy5Go0+JL5HgknDPGfsmRKqvlbNWp2ijKJiETH
 xTGQl7tCO4FHYSZhP1NGZQqazMaDIVXwCvVv3w90F8bEUbjTkMbcffxNAffLJ87+t8LhFXSJ9Wr
 EruGYGZptPviSOIRTQu1twAxguqlvcNwrtfkx70mMbLMfTRNLMlyONRH7PKqh4PHPFF8cJdv23g
 Jxvnil5PuPPTaPg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Helper functions to setproperty with length of property name similar to
getprop_namelen variants.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 libfdt/fdt_rw.c | 19 +++++++++++++++++
 libfdt/libfdt.h | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 util.h          |  1 +
 3 files changed, 83 insertions(+)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 3621d3651d3f4bd82b7af66c60d023e3139add03..9e66c2332bf4d3868c1388c294a195b152b6aefd 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -7,6 +7,8 @@
 
 #include <fdt.h>
 #include <libfdt.h>
+#include "../util.h"
+#include <assert.h>
 
 #include "libfdt_internal.h"
 
@@ -288,6 +290,23 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
 	return 0;
 }
 
+int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
+			size_t namelen, const void *val, int len)
+{
+	int ret;
+	char *name_temp = xmalloc(namelen + 1);
+
+	assert(namelen <= strlen(name));
+
+	memcpy(name_temp, name, namelen);
+	name_temp[namelen] = '\0';
+	ret = fdt_setprop(fdt, nodeoffset, name_temp, val, len);
+
+	free(name_temp);
+
+	return ret;
+}
+
 int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 		   const void *val, int len)
 {
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 96782bc57b8412d73dff92d6e0ad494ec0a23909..999b3800dff5c001b9c1babf370d45024c81a9aa 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1690,6 +1690,38 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name);
 int fdt_setprop(void *fdt, int nodeoffset, const char *name,
 		const void *val, int len);
 
+/**
+ * fdt_setprop_namelen - create or change a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @namelen: length of the name
+ * @val: pointer to data to set the property value to
+ * @len: length of the property value
+ *
+ * fdt_setprop_namelen() sets the value of the named property in the given
+ * node to the given value and length, creating the property if it
+ * does not already exist.
+ *
+ * This function may insert or delete data from the blob, and will
+ * therefore change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
+			size_t namelen, const void *val, int len);
+
 /**
  * fdt_setprop_placeholder - allocate space for a property
  * @fdt: pointer to the device tree blob
@@ -1839,6 +1871,37 @@ static inline int fdt_setprop_cell(void *fdt, int nodeoffset, const char *name,
 #define fdt_setprop_string(fdt, nodeoffset, name, str) \
 	fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
 
+/**
+ * fdt_setprop_namelen_string - set a property to a string value
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @str: string value for the property
+ *
+ * fdt_setprop_namelen_string() sets the value of the named property in the
+ * given node to the given string value (using the length of the
+ * string to determine the new length of the property), or creates a
+ * new property with that value if it does not already exist.
+ *
+ * This function may insert or delete data from the blob, and will
+ * therefore change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+#define fdt_setprop_namelen_string(fdt, nodeoffset, name, namelen, str)    \
+	fdt_setprop_namelen((fdt), (nodeoffset), (name), (namelen), (str), \
+			    strlen(str) + 1)
 
 /**
  * fdt_setprop_empty - set a property to an empty value
diff --git a/util.h b/util.h
index 800f2e2c55b150d3c30101d1e1f1daaa0e4e3264..3e2ebaabe1e8c7e9ad6821ac2ca17a72e7f4f57d 100644
--- a/util.h
+++ b/util.h
@@ -6,6 +6,7 @@
 #include <stdarg.h>
 #include <stdbool.h>
 #include <getopt.h>
+#include <stdio.h>
 
 /*
  * Copyright 2011 The Chromium Authors, All Rights Reserved.

-- 
2.47.0

