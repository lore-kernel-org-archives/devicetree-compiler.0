Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C74226D1D
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645883; cv=none; b=DiGQVYKkNj0uL7pTtIWhHw+7EBoanQNBv834iy/izak81b5td0ewJBRIb6yO8arBtwUjjguH5s7sSskdnuBbbpLsLezsMc6styh4tsCQ4et+08jWvhgfP84M1CPkaoNjQsdapskVzFV0PrzR3zyQrfGbloPShGHirw3NOoEqlC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645883; c=relaxed/simple;
	bh=xOx2YujSSbeTc4LHSM8dVPS7gDV9ZSHyol3trdgHC/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKdknlqFIzwz6fpTc6R5bPAWVShtonGnO83e9ggJaz10NMgnSG5ofVjm5isOodsbtN9x7CM3ILD5PZYwZAZVG9RdONWYNhW2lt/NpFvYsNjHVsx3r0wxQS4bDREtWnnbxePDhIjC4t2skZsNk4D2HUm4bnvdxehtuv9EJ9eIavU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yv1ZT128; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yv1ZT128"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILZ25l006225;
	Mon, 19 May 2025 09:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RlM2pB8JKJE
	iraT4QeBQch8pIQ7kXhILUl/XxQ9rl58=; b=Yv1ZT128D0qinObtu/VKysiO4Gh
	uz2FSTAL7iy+RjAj0K123C3F7a85XGsAGkg+qleP36R2lfrb0woGxrHVK5dcBy2h
	9e6uOZQbQz+n/vzCiSYvIobmQOlohHTLJ/sDi9EmvID1vqdTr1Db3FgNzSUbjqVY
	xkHx0HfFlXEGb+c0n/EL5JshH2uSSGrL0PZojDIYDvL9hnzSWRAGt8AZs06xRNyb
	52BBR5SrgYy9wAxtqYJDOOx1lu+eO4gQxotjuFfYs02YhNDNutMVu8pKzNEh+Sft
	W2YjQ/ePyHFQ4JTvJ4k78hPPWGOnjuCwi6RfeNdE85iTqau+Zm06xpSZVhg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4kr7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54J963Rg014043;
	Mon, 19 May 2025 09:10:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhkw6dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54J9AlY8018322;
	Mon, 19 May 2025 09:10:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54J9AkWr018314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id D0E7D4F1; Mon, 19 May 2025 14:40:45 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: devicetree-compiler@vger.kernel.org
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com,
        Srivatsa Vaddagiri <vatsa@codeaurora.org>,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v3 1/4] libfdt: overlay_merge: Introduce fdt_overlay_merge()
Date: Mon, 19 May 2025 14:40:40 +0530
Message-ID: <20250519091043.621316-2-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: KmZmoBGZ42DZBsxY9auoIsX0evCyYzdD
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682af59c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=bFKUGiIpNDaTEoA8gh4A:9
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KmZmoBGZ42DZBsxY9auoIsX0evCyYzdD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4NiBTYWx0ZWRfX0j7fK1HCpqSo
 VmtkHueQmct+idbD6phSrt9c1haHgi4aoHYw6Ng7laGum0bkhX+6NPcqyoZubOEuvpCgMwl4PdS
 scnY4wdj6XszljFz6VHdCbLzjrGT2KujXYIcS+Ayr3+iUNBuGqpHzZn95R/R785AzYQTuJJWVfg
 ov1T0+dVj2RgLI3fKMNN/Lq+TBoo4mgS8dDc5zasM9doZFq9p5J32SolCXepNYXcYEcX/qS+zxI
 5OJsP2+x5559zkmQEc4Kze638P2h50WfgX6/+Ua6ClCqKCmwlh2elz5l9O9bpvApmGAWjSN+Zr3
 jlqW1xg+K3eVqZu4rr+ntATU3kKd6PbllMRwf/ogXt/dWNUeFECpccLw8VtarysOccEaOhzVL+W
 HthmxxNo3Jqs3Amei6xtoPaRlyX6wHxbmI1ntp+cFKQ0gwds4kRoum4X7EEr/cWnvVo0t8de
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=511 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190086

From: Srivatsa Vaddagiri <vatsa@codeaurora.org>

fdt_overlay_merge() merges two overlay blobs. It is largely expected to be
used offline on a build machine to combine two or more overlay blobs into one.

It is intended to help maintain device-tree overlay code in
multiple source repositories, but merge their binary forms (overlay blobs)
into one so that bootloader's task of searching for all relevant overlay blobs
is simplified.

Introduce fdt_overlay_merge() which is identical to fdt_overlay_apply().
Subsequent patches will introduce required changes to merge overlay blobs.

Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 libfdt/fdt_overlay.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h      | 18 ++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index e6b9eb643958..8690ed55c8f6 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -1098,3 +1098,62 @@ err:

 	return ret;
 }
+
+int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
+{
+	uint32_t delta = fdt_get_max_phandle(fdt);
+	int ret;
+
+	FDT_RO_PROBE(fdt);
+	FDT_RO_PROBE(fdto);
+
+	*fdto_nospace = 0;
+
+	ret = overlay_adjust_local_phandles(fdto, delta);
+	if (ret) {
+		if (ret == -FDT_ERR_NOSPACE)
+			*fdto_nospace = 1;
+		goto err;
+	}
+
+	ret = overlay_update_local_references(fdto, delta);
+	if (ret) {
+		if (ret == -FDT_ERR_NOSPACE)
+			*fdto_nospace = 1;
+		goto err;
+	}
+
+	ret = overlay_fixup_phandles(fdt, fdto);
+	if (ret)
+		goto err;
+
+	ret = overlay_merge(fdt, fdto);
+	if (ret)
+		goto err;
+
+	ret = overlay_symbol_update(fdt, fdto);
+	if (ret)
+		goto err;
+
+	/*
+	 * The overlay has been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	return 0;
+
+err:
+	/*
+	 * The overlay might have been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	/*
+	 * The base device tree might have been damaged, erase its
+	 * magic.
+	 */
+	if (!*fdto_nospace)
+		fdt_set_magic(fdt, ~0);
+
+	return ret;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index b5e72001d115..664b141d5334 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -2313,6 +2313,24 @@ int fdt_overlay_apply(void *fdt, void *fdto);
 int fdt_overlay_target_offset(const void *fdt, const void *fdto,
 			      int fragment_offset, char const **pathp);

+/**
+ * fdt_overlay_merge - Merge two overlays into one
+ * @fdt: pointer to the first device tree overlay blob
+ * @fdto: pointer to the second device tree overlay blob
+ * @fdto_nospace: indicates if FDT_ERR_NOSPACE error code applies to @fdto
+ *
+ * fdt_overlay_merge() will merge second overlay blob into first overlay blob.
+ *
+ * Expect the first device tree to be modified, even if the function
+ * returns an error.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there's not enough space in first device tree blob
+ *	-FDT_ERR_BADVALUE
+ */
+int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace);
+
 /**********************************************************************/
 /* Debugging / informational functions                                */
 /**********************************************************************/
--
2.49.0

