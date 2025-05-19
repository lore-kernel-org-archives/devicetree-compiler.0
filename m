Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56BD1F03F2
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747646174; cv=none; b=nRCQzu2X38i1lKsf7BWC/vwUJbAydNjioJafA3Zf2kxYhMJZLpOi/dWNxqGWDmoC1vUiy6Uarp1ooiXBuzJZyg7ipDjFnD6yIpdLcOL5rkC/uXgWl29Bbdrk0iQEeHHI65lUrRz/2hAv/ggNBt1yvvIaT34wtgCL8eilhG57t7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747646174; c=relaxed/simple;
	bh=EK+Rj93O//a2pOQZgys2t8/4UAzHi2YuwHlPaYPayHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y517lX58PB/kX0Ap6fApBgEoextFYI2VO7/sSnjgVvg1SJ6yrPQ6H3LrtUnn5OkNOHzqlN8ucohqpBJJRcGMQgXADs0KdhzCV5MyMOj81/uVFxlHzN4mV8IZgJBNSCZnuuo6XLVOHZdfAFgsxdMYVPm9gaI9Fj1+3Id0jO7CBDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F352UY1V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F352UY1V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INAor7020427;
	Mon, 19 May 2025 09:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g71y9ghYCwQ
	YaqZfIO/9oanl9PCBHHKLXLLygbM+jmg=; b=F352UY1V4MekIeDx2ghIUfJamVp
	fRZkDEzEaqh3Q9hWPFxViccLuDnpUyVthYxV95FSTjnsRsznIBsKPylT0PdS4mkQ
	6VbiBeY75Pq68Z6JHyaG8Fgk34ylYTUdzgrlujYRLxLgzgV7oLkIM6WL7ik5nxbg
	jMHOA9vrtSRbtwOKehYuBlyjEvW5GRXnRb8wojN4kaCs4hZyYnvBLtAUtp6jEr1j
	rBBxinFvU6pUcx5MQ0NnK+jbWXAt9iCzSY3fRKF+zohh9LRMH9IagzHLvWK9Umf2
	pZxzq11lwtIBrTGYNvFb6RmrMZ7QK+yAFHAYT/sO+C3+RK05Xd6uTrc4mug==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyksxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9Alq3018347;
	Mon, 19 May 2025 09:10:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhkw6dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54J9AlY6018322;
	Mon, 19 May 2025 09:10:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54J9Ak2f018315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id D8D575C6; Mon, 19 May 2025 14:40:45 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: devicetree-compiler@vger.kernel.org
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com,
        Srivatsa Vaddagiri <vatsa@codeaurora.org>,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v3 3/4] libfdt: overlay_merge: Update phandles, symbols, fixups & local_fixups
Date: Mon, 19 May 2025 14:40:42 +0530
Message-ID: <20250519091043.621316-4-quic_wasimn@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4NiBTYWx0ZWRfX8toV1mglCMFl
 V+yQPTU+rW0bpdMsKLbaqo4x+BpL1GfFmGJ5Am20vm7DtXieYpyFi0TlQvJs+8hYww/i5HlU8uC
 UO4ThzREZTvuD1N/DBZuFFOK+d+L+QNODWTYD8lZ4439BfojiM3GnEN0bMs/AVI43AmHubPWkax
 NG6TZtdvbcAXO9yBlvHGNUhcBLBhk69Bp0McnywXnqRn9GQ1qBXHRYsxxzemByoNG5KtRO8jSui
 inrdTAcT99iIw94rl4vRnb+ie0u5658BbDAYi33FDKj4mmQcvmNAxTkRtjRCtQKgGDelre8nR6F
 nupV4QRe7mh0Ai+TUWUKatXLk8dpalnjGD9DaU15baRbWyGRPuTsh6v9I3MtEh/8scnGS6JZbWj
 reaV9oTZtSyX9lht2GMks83KtsVOAYzIwMGuFEjfKvQbBrl+iYbCh4WP3EIlu4rN9wbofekf
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682af59b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=eNpVyJSsRK9-re99MZsA:9
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RyHoSSk1SihZzx1r5nJ0ch5LxmrOkMPE
X-Proofpoint-ORIG-GUID: RyHoSSk1SihZzx1r5nJ0ch5LxmrOkMPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=883 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190086

From: Srivatsa Vaddagiri <vatsa@codeaurora.org>

fdt_overlay_merge(), like fdt_overlay_apply(), has to perform similar
operations on DT blobs.

First operation is going through external symbol references specified
in __fixups__ node of overlay DT blob and resolving them in base DT blob (as
performed by overlay_fixups_update()).

Another operation is going through __local_fixups__ of overlay DT blob
and resolving them in base DT blob (as performed by
overlay_local_fixups_update()).

Unlike overlay case though, in case of merging two overlay blobs, its quite
normal that some of the external references specified in __fixups__ node are
not found in base blob. Modify overlay_fixup_phandles() to understand this
possibility.

Similarly while merging two blobs, the __symbol__ path needs to be
updated based on the possibility that target is available in base DT
or not. Modify overlay_symbol_update() to understand this possibility.

Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 libfdt/fdt_overlay.c | 582 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 568 insertions(+), 14 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 03c88b05be72..aa85774b6f54 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -14,6 +14,8 @@

 #define MAX_BUF_SIZE	256

+static bool find_node_str(const char *path_str, const char *node);
+
 /**
  * overlay_get_target_phandle - retrieves the target phandle of a fragment
  * @fdto: pointer to the device tree overlay blob
@@ -396,11 +398,11 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 	symbol_path = fdt_getprop(fdt, symbols_off, label, &prop_len);
 	if (!symbol_path)
 		return prop_len;
-
+
 	symbol_off = fdt_path_offset(fdt, symbol_path);
 	if (symbol_off < 0)
 		return symbol_off;
-
+
 	phandle = fdt_get_phandle(fdt, symbol_off);
 	if (!phandle)
 		return -FDT_ERR_NOTFOUND;
@@ -459,6 +461,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
  *                          device tree
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
+ * @merge_olay_max_phdl: Pointer to max phandle value for merged blobs,
+ *     Both input blobs are overlay blobs that are being merged
  *
  * overlay_fixup_phandles() resolves all the overlay phandles pointing
  * to nodes in the base device tree.
@@ -471,7 +475,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_phandles(void *fdt, void *fdto)
+static int overlay_fixup_phandles(void *fdt, void *fdto,
+				  uint32_t merge_olay_max_phdl)
 {
 	int fixups_off, symbols_off;
 	int property;
@@ -492,7 +497,7 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 		int ret;

 		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
-		if (ret)
+		if (ret && (!merge_olay_max_phdl || ret != -FDT_ERR_NOTFOUND))
 			return ret;
 	}

@@ -1106,6 +1111,7 @@ static int overlay_merge(void *fdt, void *fdto, uint32_t *merge_olay_max_phdl)

 	return 0;
 }
+
 static int get_path_len(const void *fdt, int nodeoffset)
 {
 	int len = 0, namelen;
@@ -1138,6 +1144,8 @@ static int get_path_len(const void *fdt, int nodeoffset)
  * overlay_symbol_update - Update the symbols of base tree after a merge
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
+ * @merge_olay_max_phdl: Pointer to max phandle value for merged blobs,
+ *         Both input blobs are overlay blobs that are being merged
  *
  * overlay_symbol_update() updates the symbols of the base tree with the
  * symbols of the applied overlay
@@ -1150,15 +1158,16 @@ static int get_path_len(const void *fdt, int nodeoffset)
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_symbol_update(void *fdt, void *fdto)
+static int overlay_symbol_update(void *fdt, void *fdto,
+				 uint32_t merge_olay_max_phdl)
 {
-	int root_sym, ov_sym, prop, path_len, fragment, target;
-	int len, frag_name_len, ret, rel_path_len;
+	int root_sym, ov_sym, prop, next_prop, path_len, fragment, target;
+	int len, frag_name_len, ret, rel_path_len, rel_path_len_olay = 0;
 	const char *s, *e;
 	const char *path;
 	const char *name;
 	const char *frag_name;
-	const char *rel_path;
+	const char *rel_path, *rel_path_olay = NULL;
 	const char *target_path;
 	char *buf;
 	void *p;
@@ -1180,7 +1189,11 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		return root_sym;

 	/* iterate over each overlay symbol */
-	fdt_for_each_property_offset(prop, fdto, ov_sym) {
+	/* Safeguard against property being possibly deleted in this loop */
+	prop = fdt_first_property_offset(fdto, ov_sym);
+	while (prop >= 0) {
+		next_prop = fdt_next_property_offset(fdto, prop);
+
 		path = fdt_getprop_by_offset(fdto, prop, &name, &path_len);
 		if (!path)
 			return path_len;
@@ -1212,6 +1225,11 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 			/* /<fragment-name>/__overlay__/<relative-subnode-path> */
 			rel_path = s + len;
 			rel_path_len = e - rel_path - 1;
+
+			if (merge_olay_max_phdl != 0) {
+				rel_path_olay = s + 1;
+				rel_path_len_olay = e - rel_path_olay - 1;
+			}
 		} else if ((e - s) == len
 			   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
 			/* /<fragment-name>/__overlay__ */
@@ -1240,8 +1258,24 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
 		if (ret < 0)
 			return ret;
+
 		target = ret;

+		/* Before proceeding further, check if you need to update
+		 * rel_path for dtbo-dtbo merging case
+		 */
+		if (rel_path_olay) {
+			uint32_t phandle =
+			    overlay_get_target_phandle(fdto, fragment);
+			int base_symbol_found = (phandle < merge_olay_max_phdl);
+
+			/* For new nodes we need the overlay string in path */
+			if (!base_symbol_found) {
+				rel_path = rel_path_olay;
+				rel_path_len = rel_path_len_olay;
+			}
+		}
+
 		/* if we have a target path use */
 		if (!target_path) {
 			ret = get_path_len(fdt, target);
@@ -1280,6 +1314,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		buf[len] = '/';
 		memcpy(buf + len + 1, rel_path, rel_path_len);
 		buf[len + 1 + rel_path_len] = '\0';
+		prop = next_prop;
 	}

 	return 0;
@@ -1308,7 +1343,7 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 		goto err;

 	/* Update fdto's phandles using symbols from fdt */
-	ret = overlay_fixup_phandles(fdt, fdto);
+	ret = overlay_fixup_phandles(fdt, fdto, 0);
 	if (ret)
 		goto err;

@@ -1321,7 +1356,7 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;

-	ret = overlay_symbol_update(fdt, fdto);
+	ret = overlay_symbol_update(fdt, fdto, 0);
 	if (ret)
 		goto err;

@@ -1347,6 +1382,514 @@ err:
 	return ret;
 }

+static int find_add_subnode(void *fdt, int parent_off, const char *node_name)
+{
+	int offset;
+
+	offset = fdt_subnode_offset(fdt, parent_off, node_name);
+
+	if (offset < 0)
+		offset = fdt_add_subnode(fdt, parent_off, node_name);
+
+	return offset;
+}
+
+static int prop_exists_in_node(void *fdt, const char *path, const char *prop_name)
+{
+	int offset;
+	const void *val;
+
+	offset = fdt_path_offset(fdt, path);
+	if (offset < 0)
+		return 0;
+
+	val = fdt_getprop(fdt, offset, prop_name, NULL);
+
+	return val != NULL;
+}
+
+static void *get_next_component(const char **p, int *len, char sep)
+{
+	char *q;
+	int consumed;
+
+	q = memchr(*p, sep, *len);
+	if (!q)
+		return NULL;
+
+	/* 1 for ':' */
+	q++;
+
+	consumed = (q - *p);
+	if (*len <= consumed)
+		return NULL;
+
+	*len -= consumed;
+	*p = q;
+
+	return q;
+}
+
+static int lookup_target_path(void *fdt, void *fdto, const char *fragment,
+			      int frag_name_len, char *buf, int buf_len,
+			      int *target_off, int *root_path)
+{
+	int offset, ret, target, len;
+	const char *target_path;
+	static const char fragstr[] = "fragment@";
+	int fragstrlen = sizeof(fragstr) - 1;
+
+	memset(buf, 0, buf_len);
+
+	/* Check fdto-fragment has fragment string */
+	if (frag_name_len < fragstrlen || memcmp(fragment, fragstr, fragstrlen))
+		return -FDT_ERR_BADOVERLAY;
+
+	/* find the fragment index in which the symbol lies */
+	ret = fdt_subnode_offset_namelen(fdto, 0, fragment, frag_name_len);
+	/* not found? */
+	if (ret < 0)
+		return -FDT_ERR_BADOVERLAY;
+
+	offset = ret;
+
+	/* an __overlay__ subnode must exist */
+	ret = fdt_subnode_offset(fdto, offset, "__overlay__");
+	if (ret < 0)
+		return -FDT_ERR_BADOVERLAY;
+
+	/* get the target of the fragment */
+	ret = fdt_overlay_target_offset(fdt, fdto, offset, &target_path);
+	if (ret < 0)
+		return ret;
+
+	target = ret;
+	if (target_off)
+		*target_off = ret;
+
+	/* if we have a target path use */
+	if (!target_path) {
+		ret = get_path_len(fdt, target);
+		if (ret < 0)
+			return ret;
+		len = ret;
+	} else {
+		len = strlen(target_path);
+	}
+	if (len >= buf_len)
+		return -FDT_ERR_INTERNAL;
+
+	if (len > 1) {		/* target is not root */
+		if (!target_path) {
+			ret = fdt_get_path(fdt, target, buf, len + 1);
+			if (ret < 0)
+				return ret;
+		} else
+			memcpy(buf, target_path, len + 1);
+
+	}
+
+	/* Check fdt-path is having fragments or it part of root path */
+	if (root_path && find_node_str(buf, fragstr))
+		*root_path = 0;
+	else
+		*root_path = 1;
+
+	return 0;
+}
+
+static int fixup_snippet_update(void *fdt, void *fdto, const char *snippet,
+				int snippet_len, char *buf, int buflen,
+				int *ignore, int base_symbol_found,
+				uint32_t merge_olay_max_phdl)
+{
+	const char *snippet_o = snippet;
+	const char *path, *fragment, *prop_name, *prop_val, *rel_path;
+	char *sep;
+	int snippet_len_o = snippet_len, fragment_len, rel_path_len;
+	unsigned long int prop_len, path_len;
+	int rem, ret;
+	static const char tprop[] = "target";
+	static const char frag[] = "/fragment";
+	static const char olay[] = "/__overlay__";
+	int root_path = 0;
+
+	/* Validate format:
+	 *      path_to_node : prop_name : prop_offset
+	 */
+	path = snippet;
+	prop_name = get_next_component(&snippet, &snippet_len, ':');
+	if (!prop_name)
+		return -FDT_ERR_BADOVERLAY;
+
+	prop_val = get_next_component(&snippet, &snippet_len, ':');
+	if (!prop_val)
+		return -FDT_ERR_BADOVERLAY;
+
+	path_len = prop_name - path - 1;	/* -1 for ':' */
+	prop_len = prop_val - prop_name - 1;	/* -1 for ':' */
+
+	if (path_len < sizeof(frag) - 1 || memcmp(path, frag, sizeof(frag) - 1))
+		return -FDT_ERR_BADOVERLAY;
+
+	if (base_symbol_found && prop_len == sizeof(tprop) - 1
+	    && !memcmp(prop_name, tprop, sizeof(tprop) - 1)) {
+		*ignore = 1;
+		return 0;
+	}
+
+	fragment = path;
+	/* check if there is a '/' besides the first one in node_path */
+	sep = memchr(fragment + 1, '/', path_len - 1);
+	if (sep) {
+		fragment_len = sep - fragment;
+		path_len -= (sep - fragment);
+		if (path_len < sizeof(olay) - 1
+		    || memcmp(sep, olay, sizeof(olay) - 1))
+			return -FDT_ERR_BADOVERLAY;
+
+		{
+			int frag_offset;
+
+			frag_offset =
+			    fdt_subnode_offset_namelen(fdto, 0, fragment + 1,
+						       fragment_len - 1);
+			if (frag_offset < 0)
+				return -FDT_ERR_BADOVERLAY;
+
+			/* an __overlay__ subnode must exist */
+			ret =
+			    fdt_subnode_offset(fdto, frag_offset,
+					       "__overlay__");
+			if (ret < 0)
+				return -FDT_ERR_BADOVERLAY;
+		}
+		rel_path = sep;
+	} else {
+		rel_path = fragment + path_len;
+		fragment_len = path_len;
+	}
+	rel_path_len = snippet_len_o - (rel_path - snippet_o);
+
+	if (rel_path_len <= 0 || fragment_len >= buflen)
+		return -FDT_ERR_INTERNAL;
+
+	ret =
+	    lookup_target_path(fdt, fdto, fragment + 1, fragment_len - 1, buf,
+			       buflen, NULL, &root_path);
+	if (ret)
+		return ret;
+
+	/* Only single overlay should be present in path */
+	if (find_node_str(buf, "__overlay__")
+	    && find_node_str(rel_path, "__overlay__")) {
+		if (sep)
+			rel_path = sep + sizeof(olay) - 1;
+	}
+
+	rem = buflen - strlen(buf);
+	if (rel_path_len >= rem)
+		return -FDT_ERR_INTERNAL;
+
+	sep = buf + strlen(buf);
+	memcpy(sep, rel_path, rel_path_len);
+
+	return 0;
+}
+
+static const char *next_snippet(const char **prop,
+				int *prop_len, int *snippet_len)
+{
+	const char *next = *prop;
+	const char *tmp;
+	int len;
+
+	if (*prop_len <= 0)
+		return NULL;
+
+	tmp = memchr(next, '\0', *prop_len);
+	if (!tmp)
+		return NULL;
+
+	tmp++;
+
+	len = tmp - next;
+	*snippet_len = len;
+	*prop += len;
+	*prop_len -= len;
+
+	return next;
+}
+
+static int add_to_fixups(void *fdt, char *v, const char *label)
+{
+	const char *val;
+	char *p;
+	int vlen = strlen(v) + 1;	/* +1 for NULL */
+	int len, ret;
+	int root_fixup;
+
+	root_fixup = fdt_subnode_offset(fdt, 0, "__fixups__");
+	if (root_fixup == -FDT_ERR_NOTFOUND)
+		root_fixup = fdt_add_subnode(fdt, 0, "__fixups__");
+
+	if (root_fixup < 0)
+		return root_fixup;
+
+	val = fdt_getprop(fdt, root_fixup, label, &len);
+	if (val)
+		vlen += len;
+
+	ret = fdt_setprop_placeholder(fdt, root_fixup, label,
+				      vlen, (void **)&p);
+	if (ret)
+		return ret;
+
+	if (val) {
+		p += len;
+		vlen -= len;
+	}
+	memcpy(p, v, vlen);
+
+	return 0;
+}
+
+static int fdt_find_add_node(void *fdt, int parent_off, const char *node)
+{
+	int offset;
+
+	offset = fdt_subnode_offset(fdt, parent_off, node);
+	if (offset < 0)
+		offset = fdt_add_subnode(fdt, parent_off, node);
+
+	return offset;
+}
+
+/* path => /abc/def/ghi */
+static const char *next_node(const char **path, int *path_len, int *node_len)
+{
+	const char *sep = *path, *node;
+
+	if (*sep != '/' || *path_len <= 0)
+		return NULL;
+
+	*path = *path + 1;
+	node = *path;
+	*path_len = *path_len - 1;
+
+	sep = memchr(node, '/', *path_len);
+	if (sep)
+		*node_len = sep - node;
+	else
+		*node_len = *path_len;
+
+	*path_len -= *node_len;
+	*path += *node_len;
+
+	return node;
+}
+
+static bool find_node_str(const char *path_str, const char *ip_str)
+{
+	const char *path, *node_str;
+	int path_len = 0, node_len = 0, ip_str_len = 0;
+
+	path = path_str;
+	path_len = strlen(path);
+	ip_str_len = strlen(ip_str);
+
+	while ((node_str = next_node(&path, &path_len, &node_len))) {
+		if (node_len >= ip_str_len
+		    && !memcmp(node_str, ip_str, ip_str_len)) {
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static int convert_to_u32(const char *p, uint32_t *val)
+{
+	char *endptr;
+	unsigned long prop_val;
+
+	prop_val = strtoul(p, &endptr, 10);
+	if ((*endptr != '\0') || (endptr <= p))
+		return -FDT_ERR_BADOVERLAY;
+
+	*val = prop_val;	/* size mis-match? */
+
+	return 0;
+}
+
+static int add_to_local_fixups(void *fdt, const char *snippet)
+{
+	const char *path, *prop_name, *prop_val, *node;
+	unsigned long int prop_len = 0;
+	int path_len, node_len;
+	int parent, ret;
+	int snippet_len = strlen(snippet);
+	uint32_t val = 0;
+	char buf[MAX_BUF_SIZE];
+
+	/* Validate format:
+	 *      path_to_node : prop_name : prop_offset
+	 *      OR
+	 *      path_to_node
+	 */
+	path = snippet;
+	prop_name = get_next_component(&snippet, &snippet_len, ':');
+
+	if (prop_name) {
+		prop_val = get_next_component(&snippet, &snippet_len, ':');
+		if (!prop_val)
+			return -FDT_ERR_BADOVERLAY;
+
+		path_len = prop_name - path - 1;	/* -1 for ':' */
+		prop_len = prop_val - prop_name - 1;	/* -1 for ':' */
+
+		ret = convert_to_u32(prop_val, &val);
+		if (ret)
+			return ret;
+	} else
+		path_len = strlen(snippet);
+
+	parent = fdt_find_add_node(fdt, 0, "__local_fixups__");
+	if (parent < 0)
+		return parent;
+
+	while ((node = next_node(&path, &path_len, &node_len))) {
+		int offset;
+
+		offset =
+		    fdt_subnode_offset_namelen(fdt, parent, node, node_len);
+		if (offset < 0) {
+			offset =
+			    fdt_add_subnode_namelen(fdt, parent, node,
+						    node_len);
+		}
+		if (offset < 0)
+			return offset;
+		parent = offset;
+	}
+
+	if (!prop_name)
+		return parent;
+
+	if (prop_len >= sizeof(buf))
+		return -FDT_ERR_INTERNAL;
+	memcpy(buf, prop_name, prop_len);
+	buf[prop_len] = 0;
+
+	return fdt_appendprop_u32(fdt, parent, buf, val);
+}
+
+static int overlay_fixups_update(void *fdt, void *fdto,
+				 uint32_t merge_olay_max_phdl)
+{
+	int ov_fixup, root_fixup, prop;
+
+	ov_fixup = fdt_subnode_offset(fdto, 0, "__fixups__");
+	if (ov_fixup < 0)
+		return 0;
+
+	root_fixup = find_add_subnode(fdt, 0, "__fixups__");
+	if (root_fixup < 0)
+		return root_fixup;
+
+	fdt_for_each_property_offset(prop, fdto, ov_fixup) {
+		int snippet_len, prop_len, base_symbol_found;
+		const char *label, *snippet, *prop_val;
+
+		prop_val = fdt_getprop_by_offset(fdto, prop, &label, &prop_len);
+		if (prop_val == NULL)
+			return -FDT_ERR_BADOVERLAY;
+
+		base_symbol_found =
+		    prop_exists_in_node(fdt, "/__symbols__", label);
+
+		while ((snippet =
+			next_snippet(&prop_val, &prop_len, &snippet_len))) {
+			char new_val[MAX_BUF_SIZE];
+			int ignore = 0, ret;
+
+			ret =
+			    fixup_snippet_update(fdt, fdto, snippet,
+						 snippet_len, new_val,
+						 sizeof(new_val), &ignore,
+						 base_symbol_found,
+						 merge_olay_max_phdl);
+			if (ret)
+				return ret;
+
+			if (ignore)
+				continue;
+
+			if (!base_symbol_found) {
+				ret = add_to_fixups(fdt, new_val, label);
+			} else {
+				ret = add_to_local_fixups(fdt, new_val);
+			}
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int overlay_local_fixups_update(void *fdt, void *fdto,
+				       uint32_t merge_olay_max_phdl)
+{
+	int ov_lfixups, root_lfixups, node, ret;
+	int root_path = 0;
+
+	ov_lfixups = fdt_subnode_offset(fdto, 0, "__local_fixups__");
+	if (ov_lfixups == -FDT_ERR_NOTFOUND)
+		return 0;
+
+	root_lfixups = fdt_subnode_offset(fdt, 0, "__local_fixups__");
+	if (root_lfixups == -FDT_ERR_NOTFOUND)
+		root_lfixups = fdt_add_subnode(fdt, 0, "__local_fixups__");
+
+	if (root_lfixups < 0)
+		return root_lfixups;
+
+	fdt_for_each_subnode(node, fdto, ov_lfixups) {
+		int len, child_node, parent_node;
+		int skip_fdto_child = 0;
+		const char *name = fdt_get_name(fdto, node, &len);
+		char buf[MAX_BUF_SIZE];
+
+		ret = lookup_target_path(fdt, fdto, name, strlen(name),
+					 buf, sizeof(buf), NULL, &root_path);
+		if (ret)
+			return ret;
+
+		/* We want to skip dtbo overlay child in two cases
+		 * i.e When target path doesn't have fragment@ or __overlay__
+		 * strings
+		 */
+		if (root_path || find_node_str(buf, "__overlay__"))
+			skip_fdto_child = 1;
+
+		parent_node = add_to_local_fixups(fdt, buf);
+		if (parent_node < 0)
+			return parent_node;
+
+		child_node = fdt_subnode_offset(fdto, node, "__overlay__");
+		if (child_node < 0)
+			return -FDT_ERR_BADOVERLAY;
+
+		ret = copy_node(fdt, fdto, parent_node, child_node,
+				NULL, skip_fdto_child);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
 {
 	uint32_t delta = fdt_get_max_phandle(fdt);
@@ -1377,18 +1920,29 @@ int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
 		goto err;
 	}

-	ret = overlay_fixup_phandles(fdt, fdto);
-	if (ret)
+	ret = overlay_fixup_phandles(fdt, fdto, max_phandle);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
 		goto err;

 	ret = overlay_merge(fdt, fdto, &max_phandle);
 	if (ret)
 		goto err;

-	ret = overlay_symbol_update(fdt, fdto);
+	max_phandle = delta + delta0 + 1;
+	ret = overlay_symbol_update(fdt, fdto, max_phandle);
 	if (ret)
 		goto err;

+	/* fixups node is optional */
+	ret = overlay_fixups_update(fdt, fdto, max_phandle);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		goto err;
+
+	/* local_fixups node is optional */
+	ret = overlay_local_fixups_update(fdt, fdto, max_phandle);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		goto err;
+
 	/*
 	 * The overlay has been damaged, erase its magic.
 	 */
--
2.49.0

