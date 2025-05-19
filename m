Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622201F03F2
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747646183; cv=none; b=CySA8dI31v0YkkPkwbwNirnMZhO5hAe4uW42s5elsAZGu6ew8tXdeo2axsndLRuLlji0xdU46kguvmUXfHSCjIDlsfTdHbhciqsVlpExEfIkuXfcgrt6+RZwsuKZHlAzS4ubs4V5bi3FQnR0DOqBFXRaFETTczvWXfpx99blFoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747646183; c=relaxed/simple;
	bh=GThYXLyLXWfe7omULO0Nw+37bsCSrFMYzUHD9Oq4MTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgrqUCjuy/Yl+lEm4F7Bw3NI1h1fnYpjt5/l5+8s+mLhHgO391RgewcGxVO+CZeb3Ya1cjZVA0aEWv07lyxR7klrDM4g/30412ji20ZE10wLAd6Jbm/OCP6sCby67Tm74lNUJWPayxcshmdjG1GaAAZhdx6nZyh474JcFGKN0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aPpjSOY9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aPpjSOY9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IMt427023770;
	Mon, 19 May 2025 09:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M5USUhWYwKZ
	6FFlSFz+Gdl0xgmBzFdYbx0lAykv0rBQ=; b=aPpjSOY9Wv+E5pYWhs8Oo3qW90J
	dVIZAQN8aaLiX5H4Aa3o1Kkm8lwM5k0qBV16p60andrg50zeEewvcfASeAeXLTu3
	hNiPoI4nubHoc2NJq6f7zPgMsNh1LnEc4xn6tCklh99GIvPPqW4ZfWjdjBp4V29Y
	T5YP5aX9jKofD4ZzBfxYrPGTRPcS06EQPsDECptmZlmjVQ5qKn2bgm6+B+r65uCH
	TW3pkX7c3J0zmz8GJAr82bGpcIxYDFY5H6/doiT554+grqWZVvlWkXwR2gzqtAaU
	CepSekRc3xklW+/F+OPXO5cWqUq8ool0+T7kRYyIKHTvPPMxmgdLo0uvJrQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyksxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9Alqf018344;
	Mon, 19 May 2025 09:10:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhkw6dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54J9Al0V018321;
	Mon, 19 May 2025 09:10:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54J9Ak5e018316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id DCACA5C7; Mon, 19 May 2025 14:40:45 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: devicetree-compiler@vger.kernel.org
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com,
        Srivatsa Vaddagiri <vatsa@codeaurora.org>,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v3 4/4] fdtoverlaymerge: A tool that merges overlays
Date: Mon, 19 May 2025 14:40:43 +0530
Message-ID: <20250519091043.621316-5-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519091043.621316-1-quic_wasimn@quicinc.com>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4NiBTYWx0ZWRfXw4TTqwd4A6Fx
 iJKyqZTmqPK4SA7wyKroYn5x/wp3fSrRsb07o4HTvjZia5eXGARpXwk6HoYvNpUKdF586GMjIkq
 03r7AFEtFX6M89XW63HQBP9JykoIjKTTIsrKgSDJAqD6Do6yXXe0lZqEPv0Z1/iFQdympcfRbdD
 g2hVQbXQGrl/moBsi6ihM95X9WdtDZRaDFVN9IYo6Rser39sO/SoqI/pm/Dqz3fDGRhZZiVMNhe
 rvrh7LDUcREcwu7Y7znFfXvCeKZyGQr+9sEnbu1uSKKboJIRd/VCtlqs9A4SzbScgPfTuWvvVoq
 n676JEToezPQiNWP652R/IKrLhUEssFS/AuvB0NsIbIhZSj5gTezZR9uznMFs0uHcWjBtMLqca4
 TSEk4fbSUyc5bFuemf3o/2qXbapsHcc9wUOlcY5vAyuuRYNxVYd7gXRRQwaOaYyxYpy4B8+c
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682af59b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=nWxPR9bBoaYwm1wEAY0A:9
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uUA3yj3oz7yK5XlKlgjAsl2dd1Pfgbmy
X-Proofpoint-ORIG-GUID: uUA3yj3oz7yK5XlKlgjAsl2dd1Pfgbmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190086

From: Srivatsa Vaddagiri <vatsa@codeaurora.org>

Add a new command-line tool, fdtoverlaymerge, that merges two or more
overlay blobs using the fdt_overlay_merge() API. This tool is necessary
to simplify the process of combining multiple overlays into a single blob.

Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 .gitignore         |   1 +
 Makefile           |   4 +
 Makefile.utils     |   6 ++
 fdtoverlaymerge.c  | 223 +++++++++++++++++++++++++++++++++++++++++++++
 libfdt/version.lds |   1 +
 meson.build        |   2 +-
 6 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 fdtoverlaymerge.c

diff --git a/.gitignore b/.gitignore
index 8e1e0c05d427..8d032d80a8d0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -17,6 +17,7 @@ lex.yy.c
 /fdtget
 /fdtput
 /fdtoverlay
+/fdtoverlaymerge
 /patches
 /.pc

diff --git a/Makefile b/Makefile
index a00123d78b1b..d7c1fc4eb5f5 100644
--- a/Makefile
+++ b/Makefile
@@ -149,6 +149,7 @@ BIN += fdtdump
 BIN += fdtget
 BIN += fdtput
 BIN += fdtoverlay
+BIN += fdtoverlaymerge

 SCRIPTS = dtdiff

@@ -185,6 +186,7 @@ ifneq ($(MAKECMDGOALS),libfdt)
 -include $(FDTGET_OBJS:%.o=%.d)
 -include $(FDTPUT_OBJS:%.o=%.d)
 -include $(FDTOVERLAY_OBJS:%.o=%.d)
+-include $(FDTOVERLAYMERGE_OBJS:%.o=%.d)
 endif
 endif

@@ -276,6 +278,8 @@ fdtput:	$(FDTPUT_OBJS) $(LIBFDT_dep)

 fdtoverlay: $(FDTOVERLAY_OBJS) $(LIBFDT_dep)

+fdtoverlaymerge: $(FDTOVERLAYMERGE_OBJS) $(LIBFDT_dep)
+
 dist:
 	git archive --format=tar --prefix=dtc-$(dtc_version)/ HEAD \
 		> ../dtc-$(dtc_version).tar
diff --git a/Makefile.utils b/Makefile.utils
index 9436b34d791f..e24a8abc3b8b 100644
--- a/Makefile.utils
+++ b/Makefile.utils
@@ -29,3 +29,9 @@ FDTOVERLAY_SRCS = \
 	util.c

 FDTOVERLAY_OBJS = $(FDTOVERLAY_SRCS:%.c=%.o)
+
+FDTOVERLAYMERGE_SRCS = \
+	fdtoverlaymerge.c \
+	util.c
+
+FDTOVERLAYMERGE_OBJS = $(FDTOVERLAYMERGE_SRCS:%.c=%.o)
diff --git a/fdtoverlaymerge.c b/fdtoverlaymerge.c
new file mode 100644
index 000000000000..eaf3e97e0983
--- /dev/null
+++ b/fdtoverlaymerge.c
@@ -0,0 +1,223 @@
+/* Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <assert.h>
+#include <ctype.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <inttypes.h>
+
+#include <libfdt.h>
+
+#include "util.h"
+
+/* Usage related data. */
+static const char usage_synopsis[] =
+	"merge a number of overlays\n"
+	"	fdtoverlaymerge <options> [<overlay.dtbo> [<overlay.dtbo>]]\n"
+	"\n"
+	USAGE_TYPE_MSG;
+static const char usage_short_opts[] = "i:o:v" USAGE_COMMON_SHORT_OPTS;
+static struct option const usage_long_opts[] = {
+	{"input",            required_argument, NULL, 'i'},
+	{"output",	     required_argument, NULL, 'o'},
+	{"verbose",	           no_argument, NULL, 'v'},
+	USAGE_COMMON_LONG_OPTS,
+};
+static const char * const usage_opts_help[] = {
+	"Input base overlay DT blob",
+	"Output DT blob",
+	"Verbose messages",
+	USAGE_COMMON_OPTS_HELP
+};
+
+int verbose = 0;
+
+static void grow_blob(char **blob, off_t extra_len)
+{
+	int blob_len;
+
+	if (!extra_len)
+		return;
+
+	blob_len = fdt_totalsize(*blob) + extra_len;
+	*blob = xrealloc(*blob, blob_len);
+	fdt_open_into(*blob, *blob, blob_len);
+}
+
+static int reload_blob(char *filename, char **blob, off_t extra_len)
+{
+	size_t len;
+
+	free(*blob);
+	*blob = utilfdt_read(filename, &len);
+	if (!*blob) {
+		fprintf(stderr, "Failed to reload blob %s\n", filename);
+		return -1;
+	}
+
+	grow_blob(blob, extra_len);
+
+	return 0;
+}
+
+static int do_fdtoverlay_merge(const char *input_filename,
+			 const char *output_filename,
+			 int argc, char *argv[])
+{
+	char *blob = NULL;
+	char **ovblob = NULL;
+	size_t ov_len, blob_len, total_len, extra_blob_len = 0;
+	off_t *extra_ov_len;
+	int i, ret = -1;
+
+	/* allocate blob pointer array */
+	ovblob = xmalloc(sizeof(*ovblob) * argc);
+	memset(ovblob, 0, sizeof(*ovblob) * argc);
+
+	extra_ov_len = xmalloc(sizeof(*extra_ov_len) * argc);
+	memset(extra_ov_len, 0, sizeof(*extra_ov_len) * argc);
+
+reload_all_blobs:
+	/* Free existing buffer first */
+	free(blob);
+	blob = utilfdt_read(input_filename, &blob_len);
+	if (!blob) {
+		fprintf(stderr, "\nFailed to read base blob %s\n",
+				input_filename);
+		goto out_err;
+	}
+	if (fdt_totalsize(blob) > blob_len) {
+		fprintf(stderr,
+		 "\nBase blob is incomplete (%lu / %" PRIu32 " bytes read)\n",
+			(unsigned long)blob_len, fdt_totalsize(blob));
+		goto out_err;
+	}
+	ret = 0;
+
+	/* read and keep track of the overlay blobs */
+	total_len = extra_blob_len;
+	for (i = 0; i < argc; i++) {
+		/* Free existing buffer first */
+		free(ovblob[i]);
+		ovblob[i] = utilfdt_read(argv[i], &ov_len);
+		if (!ovblob[i]) {
+			fprintf(stderr, "\nFailed to read overlay %s\n",
+					argv[i]);
+			goto out_err;
+		}
+		grow_blob(&ovblob[i], extra_ov_len[i]);
+		total_len += ov_len + extra_ov_len[i];
+	}
+
+	/* grow the blob to worst case */
+	grow_blob(&blob, total_len);
+
+	/* apply the overlays in sequence */
+	for (i = 0; i < argc; i++) {
+		do {
+			int fdto_nospace;
+
+			fprintf(stderr, "Merging overlay blob %s\n", argv[i]);
+			ret = fdt_overlay_merge(blob, ovblob[i], &fdto_nospace);
+			if (ret && ret == -FDT_ERR_NOSPACE) {
+				if (fdto_nospace) {
+					extra_ov_len[i] += 512;
+					fprintf(stderr, "Reloading overlay blob %s\n", argv[i]);
+					ret = reload_blob(argv[i], &ovblob[i], extra_ov_len[i]);
+					if (!ret)
+						continue;
+				} else {
+					extra_blob_len += 512;
+					fprintf(stderr, "Reloading all blobs\n");
+					goto reload_all_blobs;
+				}
+			}
+
+			if (!ret)
+				break;
+
+			if (ret) {
+				fprintf(stderr, "\nFailed to merge %s (%d)\n",
+						argv[i], ret);
+				goto out_err;
+			}
+		} while (1);
+	}
+
+	fdt_pack(blob);
+	ret = utilfdt_write(output_filename, blob);
+	if (ret)
+		fprintf(stderr, "\nFailed to write output blob %s\n",
+				output_filename);
+
+out_err:
+	if (ovblob) {
+		for (i = 0; i < argc; i++) {
+			if (ovblob[i])
+				free(ovblob[i]);
+		}
+		free(ovblob);
+	}
+	free(blob);
+
+	return ret;
+}
+
+int main(int argc, char *argv[])
+{
+	int opt, i;
+	char *input_filename = NULL;
+	char *output_filename = NULL;
+
+	while ((opt = util_getopt_long()) != EOF) {
+		switch (opt) {
+		case_USAGE_COMMON_FLAGS
+
+		case 'i':
+			input_filename = optarg;
+			break;
+		case 'o':
+			output_filename = optarg;
+			break;
+		case 'v':
+			verbose = 1;
+			break;
+		}
+	}
+
+	if (!input_filename)
+		usage("missing input file");
+
+	if (!output_filename)
+		usage("missing output file");
+
+	argv += optind;
+	argc -= optind;
+
+	if (argc <= 0)
+		usage("missing overlay file(s)");
+
+	if (verbose) {
+		printf("input  = %s\n", input_filename);
+		printf("output = %s\n", output_filename);
+		for (i = 0; i < argc; i++)
+			printf("overlay[%d] = %s\n", i, argv[i]);
+	}
+
+	if (do_fdtoverlay_merge(input_filename, output_filename, argc, argv))
+		return 1;
+
+	return 0;
+}
diff --git a/libfdt/version.lds b/libfdt/version.lds
index cbfef546de6c..942be3f4417c 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -82,6 +82,7 @@ LIBFDT_1.2 {
 		fdt_overlay_target_offset;
 		fdt_get_symbol;
 		fdt_get_symbol_namelen;
+		fdt_overlay_merge;
 	local:
 		*;
 };
diff --git a/meson.build b/meson.build
index 3026f88d895a..8def38851247 100644
--- a/meson.build
+++ b/meson.build
@@ -106,7 +106,7 @@ if get_option('tools')
     install: true,
   )

-  foreach e: ['fdtdump', 'fdtget', 'fdtput', 'fdtoverlay']
+  foreach e: ['fdtdump', 'fdtget', 'fdtput', 'fdtoverlay', 'fdtoverlaymerge']
     dtc_tools += executable(e, files(e + '.c'), dependencies: util_dep, install: true)
   endforeach

--
2.49.0

