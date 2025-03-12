Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D350C258CD0
	for <devicetree-compiler@vger.kernel.org>; Wed, 12 Mar 2025 19:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741808565; cv=none; b=IWDZf1x0mvM1m3Id+yFdIZinRyiEVv+kKxaNNcsEsLihht31qFGwTKVD9rv6uu4krmnEAt5Doeqfps9WAFiTynfoH2asK2MWE9vnuCbadsYjHvS45CNRzyVpDCjZ4zsQlMvjsQq6G4NXCjYmEFrsUvD8aOLa6Zj1/XAEiwNN2j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741808565; c=relaxed/simple;
	bh=EHv6yEUuDfNE5J+g9SNGul96Ea/JRd7kQsnqO6+Foys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlbuIbHodqwh1K/1/a1nt8Ly8tJiMRb8E+g9OFblwnI0fLDg44KajtWElCnFJGdzQfb19s2GTk9ZZgeh0mL8jT4rdgirbEPE73o75lTxfQclUbROTcsfWLzXpIXrUXEoRQKgNmm3rnd/GguZ665lzx824YBqxD4JuVkL0k5/wi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=dvzK9rsd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="dvzK9rsd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2255003f4c6so4770525ad.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 12 Mar 2025 12:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1741808563; x=1742413363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=coUgP/ZEo9Ovy5n0b1RNLteNwUVv4WHCGPxcuYhmY6M=;
        b=dvzK9rsdmpsafwonADYbIIlgfYcZ82QNWL4lMu7T5T8oRCpAgA7F856kW+Rui6bIs9
         0oVpKdgxZqVfoc8eLfdSkNyiGPO2xDGeoEhKrgrfSyO/ifLrJBdfh31uoLV0hZ5LIlez
         cwR05MvzF+fNi3PWSsoxuKhbaEUMxutaJDXrciafU3M9oHkTuTd5ajc2S0AUepaDFUl0
         tQcUI8QJybYs5oDimTuX/zjyVjUVJQTjg4ylaESVvRt6tvBu9KdAJrp+YMkCNZ4Qw4Et
         GPSiCcWT0fXRl7ff0ZULE/4pki/fVZ2RbVQ7ZV33bTCV0B4QMqIZDUgFLIJGD6s9UH8d
         y9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741808563; x=1742413363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=coUgP/ZEo9Ovy5n0b1RNLteNwUVv4WHCGPxcuYhmY6M=;
        b=oqo33dnKpb3uPaSPZSFbMQgCYYVT9n8zef7b2GcsJxmqGxoopWi4hF5lfTD5PHQpIU
         4des7gXcQ4yA8KJxBiA8nWQQ9Fhhplb3HNdFuQVODCTwvBaRcQViElfvS8cx3jOk8Z6v
         Wo0Z3bjKTioNBGVHNA5xZIbMKLxa6d+x4XnRvsLvVkN2c/sUDI83JKi3gh5WUvMDJvsm
         8ZEeY8rk+41ytGPQ1u37BrUXMsFb2DxoD9uEFOebUGIcwC3Bjb5Qk2ohL7VoA2cAx8b9
         dePrmTgKZoCM2qmwWbRNrhf3NPyWvXxKBRbpeKdUJU54zNtdYdYVAhl8DtMhQUiDbGK/
         2VEA==
X-Gm-Message-State: AOJu0YyhpeQMe4kYUGO5ZTz/6Xh6mgeFnwnN9kE4ic9I09rqjCRcp7J8
	xq4egbVPtDrZ4mHW+lQ/B9PRR3OBqy7FP8zdN3oyy9VdO0g3evsASdOzA0ORpg==
X-Gm-Gg: ASbGncuKmMYF6GWHt3Nkh3uttWrMxPVrs7idY6GdrOpmf4aLexypyySV9NSREQnHHOU
	giF3yKj1NiMygCJTe10J1mgaq7jpVbdoqs1bL7Tl5HjwPUvwbd9G2RmK+cqOq8zkI9YE7rjDTM4
	AamS08/Cc6Urn8NS1LPGqYp+Hg6A6b1evnrV9fQ1RClYdkbT6M27sH05S7jSEiqhRRgByCSBYJp
	NhWHVSL850kdb63HwME3xG6rT/xCiubzbFD8cnyxD//ge7s8XXaWNEK8RcfyWf3Afx19w3xqmbX
	yQwSTXyzApt6ycw/xofiByj8jo+o3YC/xKyf3AyOqrVF+s/drds=
X-Google-Smtp-Source: AGHT+IFitz+8dYVIHa+V7Y2Cp0vZMs97iarzpqeWOl95qQ6HqxdY/6/s8Hl0mt8vflDzJG5SzzSNtA==
X-Received: by 2002:a05:6a21:6194:b0:1f3:3690:bf32 with SMTP id adf61e73a8af0-1f58cb25b1amr13900604637.18.1741808563152;
        Wed, 12 Mar 2025 12:42:43 -0700 (PDT)
Received: from [172.16.118.31] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736cd220c5fsm7781782b3a.55.2025.03.12.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:42:42 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 13 Mar 2025 01:12:01 +0530
Subject: [PATCH 2/3] fdtoverlay: Add target option
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-fdtoverlay-target-v1-2-dd5924e12bd3@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12416;
 i=ayush@beagleboard.org; h=from:subject:message-id;
 bh=EHv6yEUuDfNE5J+g9SNGul96Ea/JRd7kQsnqO6+Foys=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBn0eOcm3rjGVoWSahUDJdOEtlM/HJ6jcWFjEywM
 vncyVmDL/OJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ9HjnAAKCRAFzvXHieVa
 dIxEEADI/d7uSkQKNSOu64W/1t4P6Q8/rN3KPprHj8UhU0vNP/d5yOS0xY5uxm2W7kJIYzedxzi
 7akgIUNBikylXcAXqq9o67iguE7gsed61naj2wFwq4qe61oEmankXeLke5V5Olu0mrNliHhdG3f
 jwRdESSg7zxsYT3y5oGueXkMA46LNEl3bfZauZ9LsDbC+5UvGVbdpSHKEEdaGvFTh/RUld7IN5s
 HVoCzCix+zJaBYbLtBrYfUpdCzHUHcVDMf3ghvNDhw1oZfZRbFkvZNM1gFgQEwUJmQqi47Lw23c
 vlC2MNxYMou8Q7Jof6s4ufLKY4jlu3m5DlE74igoW9ClN61od0J3sBL3y41V1Kccjb4bYZwz71k
 jhjJDSIe+1FkwHWN37xsRYiDcygpbfi9kQ4FB4uNkeYNkmlJqxEgHLbCy7nLkS7svtXnCAF0zEP
 9Y1aXcdWppcZg1REErlxnPx8urhI8rnMhi876+SM45w0ldf5tNaHQrXkAT1jP8Hlffa+OR6Fz8x
 voQkml7WKZiCkN93BORp/Rch72VOA3g0shESKHoggcVyOKuFgvEPqJH7joz8aD+ABmMgZ7uLjPo
 wOkBORKi5TciEkirBxrIeGg7devycHY+JIrxC5ceG5EefVL6YBiBNs2RvdjEboxtkCG/fPJbBFp
 sjELtvrFG19gwcQ==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Linux kernel supports applying overlays to a specific node. This is to
allow kernel drivers to use devicetree for device hotplugging usecases
such as connector + addon-board setups.

The overlays designed in such cases will not work with fdtoverlay
without modification since there is currently no way to specify target
nodes in fdtoverlay.

This functionality is required to allow using the same overlays that can
be used by drivers by providing the target node using program argument.

It is important to note that this only works with `target-path`
fragments. It does not have any effect on phandle target.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 fdtoverlay.c         | 33 +++++++++++++++-------------
 libfdt/fdt_overlay.c | 62 +++++++++++++++++++++++++++++++++++++++-------------
 libfdt/libfdt.h      | 52 +++++++++++++++++++++++++++++++++++++++++++
 libfdt/version.lds   |  2 ++
 4 files changed, 119 insertions(+), 30 deletions(-)

diff --git a/fdtoverlay.c b/fdtoverlay.c
index ee1eb8f3ad28b14762aca9ab5c8a4e36aac967d8..94c6b089e7ab6054a5ed8794fb183eb69c9a6b89 100644
--- a/fdtoverlay.c
+++ b/fdtoverlay.c
@@ -24,24 +24,23 @@
 static const char usage_synopsis[] =
 	"apply a number of overlays to a base blob\n"
 	"	fdtoverlay <options> [<overlay.dtbo> [<overlay.dtbo>]]";
-static const char usage_short_opts[] = "i:o:v" USAGE_COMMON_SHORT_OPTS;
+static const char usage_short_opts[] = "i:o:t:v" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
-	{"input",            required_argument, NULL, 'i'},
-	{"output",	     required_argument, NULL, 'o'},
-	{"verbose",	           no_argument, NULL, 'v'},
+	{ "input", required_argument, NULL, 'i' },
+	{ "output", required_argument, NULL, 'o' },
+	{ "target", optional_argument, NULL, 't' },
+	{ "verbose", no_argument, NULL, 'v' },
 	USAGE_COMMON_LONG_OPTS,
 };
-static const char * const usage_opts_help[] = {
-	"Input base DT blob",
-	"Output DT blob",
-	"Verbose messages",
-	USAGE_COMMON_OPTS_HELP
-};
+static const char *const usage_opts_help[] = { "Input base DT blob",
+					       "Output DT blob", "Target node",
+					       "Verbose messages",
+					       USAGE_COMMON_OPTS_HELP };
 
 int verbose = 0;
 
 static void *apply_one(char *base, const char *overlay, size_t *buf_len,
-		       const char *name)
+		       const char *name, const char *target)
 {
 	char *tmp = NULL;
 	char *tmpo;
@@ -68,7 +67,7 @@ static void *apply_one(char *base, const char *overlay, size_t *buf_len,
 
 		memcpy(tmpo, overlay, fdt_totalsize(overlay));
 
-		ret = fdt_overlay_apply(tmp, tmpo);
+		ret = fdt_overlay_apply_with_target(tmp, tmpo, target);
 		if (ret == -FDT_ERR_NOSPACE) {
 			*buf_len += BUF_INCREMENT;
 		}
@@ -97,7 +96,7 @@ fail:
 	return NULL;
 }
 static int do_fdtoverlay(const char *input_filename,
-			 const char *output_filename,
+			 const char *output_filename, const char *target,
 			 int argc, char *argv[])
 {
 	char *blob = NULL;
@@ -142,7 +141,7 @@ static int do_fdtoverlay(const char *input_filename,
 
 	/* apply the overlays in sequence */
 	for (i = 0; i < argc; i++) {
-		blob = apply_one(blob, ovblob[i], &buf_len, argv[i]);
+		blob = apply_one(blob, ovblob[i], &buf_len, argv[i], target);
 		if (!blob)
 			goto out_err;
 	}
@@ -171,6 +170,7 @@ int main(int argc, char *argv[])
 	int opt, i;
 	char *input_filename = NULL;
 	char *output_filename = NULL;
+	const char *target = NULL;
 
 	while ((opt = util_getopt_long()) != EOF) {
 		switch (opt) {
@@ -185,6 +185,9 @@ int main(int argc, char *argv[])
 		case 'v':
 			verbose = 1;
 			break;
+		case 't':
+			target = optarg;
+			break;
 		}
 	}
 
@@ -207,7 +210,7 @@ int main(int argc, char *argv[])
 			printf("overlay[%d] = %s\n", i, argv[i]);
 	}
 
-	if (do_fdtoverlay(input_filename, output_filename, argc, argv))
+	if (do_fdtoverlay(input_filename, output_filename, target, argc, argv))
 		return 1;
 
 	return 0;
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index e6b9eb6439585364ff4e84eecacea7a61bcc67eb..b8df3a9d69949d73f61b4f8644e20cebe44c444b 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -40,8 +40,9 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
 	return fdt32_to_cpu(*val);
 }
 
-int fdt_overlay_target_offset(const void *fdt, const void *fdto,
-			      int fragment_offset, char const **pathp)
+int fdt_overlay_target_offset_v2(const void *fdt, const void *fdto,
+				 int fragment_offset, char const **pathp,
+				 const char *target)
 {
 	uint32_t phandle;
 	const char *path = NULL;
@@ -56,10 +57,24 @@ int fdt_overlay_target_offset(const void *fdt, const void *fdto,
 	if (!phandle) {
 		/* And then a path based lookup */
 		path = fdt_getprop(fdto, fragment_offset, "target-path", &path_len);
-		if (path)
-			ret = fdt_path_offset(fdt, path);
-		else
+		if (path) {
+			/* Either target or path should be non-null */
+			if (target == NULL && strlen(path) == 0)
+				return -FDT_ERR_BADPATH;
+
+			ret = 0;
+			if (target) {
+				ret = fdt_path_offset(fdt, target);
+
+				if (ret < 0)
+					return ret;
+			}
+
+			if (strlen(path) > 0)
+				ret = fdt_relative_path_offset(fdt, path, ret);
+		} else {
 			ret = path_len;
+		}
 	} else
 		ret = fdt_node_offset_by_phandle(fdt, phandle);
 
@@ -84,6 +99,13 @@ int fdt_overlay_target_offset(const void *fdt, const void *fdto,
 	return ret;
 }
 
+int fdt_overlay_target_offset(const void *fdt, const void *fdto,
+			      int fragment_offset, char const **pathp)
+{
+	return fdt_overlay_target_offset_v2(fdt, fdto, fragment_offset, pathp,
+					    NULL);
+}
+
 /**
  * overlay_phandle_add_offset - Increases a phandle by an offset
  * @fdt: Base device tree blob
@@ -710,7 +732,8 @@ static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
+static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto,
+					     const char *target_path)
 {
 	int fragment;
 
@@ -726,7 +749,8 @@ static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
 		if (overlay < 0)
 			return overlay;
 
-		target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
+		target = fdt_overlay_target_offset_v2(fdt, fdto, fragment, NULL,
+						      target_path);
 		if (target == -FDT_ERR_NOTFOUND)
 			/*
 			 * The subtree doesn't exist in the base, so nothing
@@ -826,7 +850,7 @@ static int overlay_apply_node(void *fdt, int target,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_merge(void *fdt, void *fdto)
+static int overlay_merge(void *fdt, void *fdto, const char *target_path)
 {
 	int fragment;
 
@@ -846,7 +870,8 @@ static int overlay_merge(void *fdt, void *fdto)
 		if (overlay < 0)
 			return overlay;
 
-		target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
+		target = fdt_overlay_target_offset_v2(fdt, fdto, fragment, NULL,
+						      target_path);
 		if (target < 0)
 			return target;
 
@@ -902,7 +927,7 @@ static int get_path_len(const void *fdt, int nodeoffset)
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_symbol_update(void *fdt, void *fdto)
+static int overlay_symbol_update(void *fdt, void *fdto, const char *target_p)
 {
 	int root_sym, ov_sym, prop, path_len, fragment, target;
 	int len, frag_name_len, ret, rel_path_len;
@@ -989,7 +1014,8 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 			return -FDT_ERR_BADOVERLAY;
 
 		/* get the target of the fragment */
-		ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
+		ret = fdt_overlay_target_offset_v2(fdt, fdto, fragment,
+						   &target_path, target_p);
 		if (ret < 0)
 			return ret;
 		target = ret;
@@ -1011,7 +1037,8 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 
 		if (!target_path) {
 			/* again in case setprop_placeholder changed it */
-			ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
+			ret = fdt_overlay_target_offset_v2(fdt, fdto, fragment,
+							   &target_path, NULL);
 			if (ret < 0)
 				return ret;
 			target = ret;
@@ -1038,6 +1065,11 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 }
 
 int fdt_overlay_apply(void *fdt, void *fdto)
+{
+	return fdt_overlay_apply_with_target(fdt, fdto, NULL);
+}
+
+int fdt_overlay_apply_with_target(void *fdt, void *fdto, const char *target)
 {
 	uint32_t delta;
 	int ret;
@@ -1065,15 +1097,15 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 		goto err;
 
 	/* Don't overwrite phandles in fdt */
-	ret = overlay_prevent_phandle_overwrite(fdt, fdto);
+	ret = overlay_prevent_phandle_overwrite(fdt, fdto, target);
 	if (ret)
 		goto err;
 
-	ret = overlay_merge(fdt, fdto);
+	ret = overlay_merge(fdt, fdto, target);
 	if (ret)
 		goto err;
 
-	ret = overlay_symbol_update(fdt, fdto);
+	ret = overlay_symbol_update(fdt, fdto, target);
 	if (ret)
 		goto err;
 
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 9b61215ecd11c8990128c0b523443b83f84b1013..7a8d3903188487890a88920394e715bc23e11784 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -2317,6 +2317,38 @@ int fdt_add_subnode(void *fdt, int parentoffset, const char *name);
  */
 int fdt_del_node(void *fdt, int nodeoffset);
 
+/**
+ * fdt_overlay_apply_with_target - Applies a DT overlay on a base DT
+ * @fdt: pointer to the base device tree blob
+ * @fdto: pointer to the device tree overlay blob
+ * @target: target node path
+ *
+ * fdt_overlay_apply_with_target() will apply the given device tree overlay
+ * on the given node in base device tree.
+ *
+ * Expect the base device tree to be modified, even if the function
+ * returns an error.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there's not enough space in the base device tree
+ *	-FDT_ERR_NOTFOUND, the overlay points to some nonexistent nodes or
+ *		properties in the base DT
+ *	-FDT_ERR_BADPHANDLE,
+ *	-FDT_ERR_BADOVERLAY,
+ *	-FDT_ERR_NOPHANDLES,
+ *	-FDT_ERR_INTERNAL,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADOFFSET,
+ *	-FDT_ERR_BADPATH,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_overlay_apply_with_target(void *fdt, void *fdto, const char *target);
+
 /**
  * fdt_overlay_apply - Applies a DT overlay on a base DT
  * @fdt: pointer to the base device tree blob
@@ -2348,6 +2380,26 @@ int fdt_del_node(void *fdt, int nodeoffset);
  */
 int fdt_overlay_apply(void *fdt, void *fdto);
 
+/**
+ * fdt_overlay_target_offset_v2 - retrieves the offset of a fragment's target
+ * @fdt: Base device tree blob
+ * @fdto: Device tree overlay blob
+ * @fragment_offset: node offset of the fragment in the overlay
+ * @pathp: pointer which receives the path of the target (or NULL)
+ * @path_prefix: prefix added to any target-path property
+ *
+ * fdt_overlay_target_offset_v2() retrieves the target offset in the base
+ * device tree of a fragment, no matter how the actual targeting is
+ * done (through a phandle or a path)
+ *
+ * returns:
+ *      the targeted node offset in the base device tree
+ *      Negative error code on error
+ */
+int fdt_overlay_target_offset_v2(const void *fdt, const void *fdto,
+				 int fragment_offset, char const **pathp,
+				 const char *path_prefix);
+
 /**
  * fdt_overlay_target_offset - retrieves the offset of a fragment's target
  * @fdt: Base device tree blob
diff --git a/libfdt/version.lds b/libfdt/version.lds
index cbfef546de6c7dd2b26a5298be46687be9779233..f9351042ec4ffcabbc14076ddf69115eccde5d9a 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -68,6 +68,7 @@ LIBFDT_1.2 {
 		fdt_stringlist_get;
 		fdt_resize;
 		fdt_overlay_apply;
+		fdt_overlay_apply_with_target;
 		fdt_get_string;
 		fdt_find_max_phandle;
 		fdt_generate_phandle;
@@ -80,6 +81,7 @@ LIBFDT_1.2 {
 		fdt_setprop_inplace_namelen_partial;
 		fdt_create_with_flags;
 		fdt_overlay_target_offset;
+		fdt_overlay_target_offset_v2;
 		fdt_get_symbol;
 		fdt_get_symbol_namelen;
 	local:

-- 
2.48.1

