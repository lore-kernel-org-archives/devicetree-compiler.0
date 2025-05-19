Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDA257AC7
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645883; cv=none; b=A4ZPsJk7l/3cwAjgS+nV/vacKo8XIRiU0NT8TONb6hQoryv4z8SNtv9mNyclfhVdTy8U9xNvCxlEjxvYGzbwZkqnBNrlAB5I3vjgUB6cUwvABn16GWCiV9I3cgkj+w+yQitOxGaDIhTsU34fqt4u+p0mmjyZXfk3VLb1366aXns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645883; c=relaxed/simple;
	bh=pAcBG+CQojaleWzWf/WsAUnxpAbJoyxeUJXxO1cMRao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lx9MVnEPCL6shdLH4+YG3Asgn7NARCFaT9oCRdUd6TZnO3EQpWb5Ak5MuKIRxfGoQJWcrHKEx3K4j0ShCT/UqMUHAaflJKy+0d8QeKgRekP2C5DfvfBRAe7mZY3UtYGLq7xV243/mZhQ56hbNDRVX4l7wTomlNe431TVSNp1x+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oJwFphuO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oJwFphuO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INM0Mp030161;
	Mon, 19 May 2025 09:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P+7LXomkHGs
	1hwtdiuQcw+vghyXQfVjdHXBT/rKhym8=; b=oJwFphuON0F3peNeZxNqY/1kFUP
	phMRkdMeSN8yse4m4LfaZg1oG3e9T/amTj9blgzz9aVoFdgc2LJSX7KEFJZdXu2Y
	E97Hf2ccd+wcrS2/noFnu1elw1dh5mBtV6GPwgK0Zl/qgAb5t+O/xDye4khGxDAN
	/4FBcTghfX2ncGEqKh1879kdKGmcsGTKjpyjdwjJrJTdJgntyrjW0nMZ0DGzbVAF
	5/qGVIE0zobEctFRA33mf0JZ8K7m8YlQDoNmM9U+wHtfSyqKac444AoOSjmv7Ikj
	bTz9et2rtOZgSiysLUhQ0VZb9AOwiWfjdn2ucJhFbpu/gFgzqZta5wCFkCw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9ur7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9AlM0018341;
	Mon, 19 May 2025 09:10:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhkw6dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54J9Alsn018320;
	Mon, 19 May 2025 09:10:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54J9AkmD018317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 09:10:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id D47E15AF; Mon, 19 May 2025 14:40:45 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: devicetree-compiler@vger.kernel.org
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com,
        Srivatsa Vaddagiri <vatsa@codeaurora.org>,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v3 2/4] libfdt: overlay_merge: Rename & copy overlay fragments and their properties
Date: Mon, 19 May 2025 14:40:41 +0530
Message-ID: <20250519091043.621316-3-quic_wasimn@quicinc.com>
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
X-Proofpoint-GUID: IV-HkrBYARNHidoQZ-efosD4hPMCkxcU
X-Proofpoint-ORIG-GUID: IV-HkrBYARNHidoQZ-efosD4hPMCkxcU
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682af59b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=1ksUldtJ8hAOYrn95YgA:9
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4NiBTYWx0ZWRfX3PGUP/MxVGl5
 MXvajsRJ2j/6/P9bDW/L0D8rLA07DuCHr1eoNTelbkNZzPHeNkeK0TbcFhSvCT0uPNd8Jvo2ii/
 H3Tut+WZQZcYMmN6RXGCmr6INs9/VHi0ools3V7JckcRs+x/a7g/WwIQFMnpmgD9APRkPz/sMPj
 xS0nEYBGYYkmuWFx3Ds4ooxD5pWeRYqSHkW9M/nKP4ozW6ZnCpmL0hnW1Hu1cCxY9bmiZKBBsVA
 ogFiTrDqGwMRo8QW7O1CatdB2eX0ElZVX++CKn5u+BF4gHRqlgN4TU39Pst+M7yjCfB3+pXpqXc
 cJ95sZi1BCqaTXJMxOaWEqGFIdFbFv22mSDw39fA+S8eSJmznsF07KhTid+rhI1/AvlguGETWDJ
 hbreovc7mF6X5sEluc60gUb1azgMsXdUZ4Io4YRdzRKcZAEwf6nQRc5HNurNL2y5I8K85Hci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=786 clxscore=1011 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190086

From: Srivatsa Vaddagiri <vatsa@codeaurora.org>

When merging two overlay blobs, fragment whose target node can't be found
in base blob would need to be retained as-is (including the fragment names)
in the combined blob. Such unresolved symbols will also need to be listed
in __fixups__ section of combined blob. This could lead to name comflicts
in combined blob (two nodes with same name/path such as /fragment@0).

To avoid such name conflicts in combined blob, rename all fragment@xyz in
overlay blob as fragment@xyz+delta, where delta is the maximum count of
fragment nodes found in base blob.

Another case is where fragment has target node in base blob, then it needs
to be overlaid within the target node.

Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 libfdt/fdt_overlay.c | 270 +++++++++++++++++++++++++++++++++++++++++--
 libfdt/fdt_rw.c      |  14 ++-
 2 files changed, 270 insertions(+), 14 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 8690ed55c8f6..03c88b05be72 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -8,9 +8,12 @@

 #include <fdt.h>
 #include <libfdt.h>
+#include <stdio.h>

 #include "libfdt_internal.h"

+#define MAX_BUF_SIZE	256
+
 /**
  * overlay_get_target_phandle - retrieves the target phandle of a fragment
  * @fdto: pointer to the device tree overlay blob
@@ -811,10 +814,229 @@ static int overlay_apply_node(void *fdt, int target,
 	return 0;
 }

+/**
+ * copy_node - copy a node hierarchically
+ * @fdt - pointer to base device tree
+ * @fdto - pointer to overlay device tree
+ * @fdto_child - offset of node in overlay device tree which needs to be copied
+ * @fdt_parent - offset of parent node in base tree under which @fdto_child
+ *		need to be copied
+ * @name - if not NULL, (new) name of the child in base device tree
+ * @skip_fdto_child - if set, skips creation of @fdto_child under @fdt_parent.
+ *      Instead copies everything under @fdto_child to @fdt_parent.
+ *
+ * This function copies a node in overlay tree along with its child-nodes and
+ * their properties, under a given parent node in base tree.
+ */
+static int copy_node(void *fdt, void *fdto, int fdt_parent,
+		     int fdto_child, const char *name, int skip_fdto_child)
+{
+	int len, prop, parent, child;
+
+	if (!skip_fdto_child) {
+		if (!name) {
+			name = fdt_get_name(fdto, fdto_child, &len);
+			if (!name)
+				return len;
+		}
+
+		parent = fdt_subnode_offset(fdt, fdt_parent, name);
+		if (parent < 0) {
+			parent = fdt_add_subnode(fdt, fdt_parent, name);
+		}
+
+		if (parent < 0)
+			return parent;
+	} else {
+		parent = fdt_parent;
+	}
+
+	fdt_for_each_property_offset(prop, fdto, fdto_child) {
+		int ret;
+		const char *value, *pname;
+		void *p;
+
+		value = fdt_getprop_by_offset(fdto, prop, &pname, &len);
+		if (!value)
+			return len;
+
+		ret = fdt_setprop_placeholder(fdt, parent, pname, len, &p);
+		if (ret)
+			return ret;
+
+		memcpy(p, value, len);
+	}
+
+	fdt_for_each_subnode(child, fdto, fdto_child) {
+		int ret;
+
+		ret = copy_node(fdt, fdto, parent, child, NULL, 0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int get_fragment_name(void *fdto, int fragment, char *name, int namelen)
+{
+	int len;
+	const char *nname;
+	int size = sizeof("fragment@") - 1;
+
+	nname = fdt_get_name(fdto, fragment, &len);
+	if (!nname)
+		return len;
+
+	if (len < size || len >= namelen || memcmp(nname, "fragment@", size))
+		return -FDT_ERR_BADVALUE;
+
+	memcpy(name, nname, len);
+	name[len] = 0;
+
+	return 0;
+}
+
+static int get_fragment_index(char *name, unsigned long *idxp)
+{
+	char *idx;
+	int size = sizeof("fragment@") - 1;
+	int len = strlen(name);
+	char *stop;
+	unsigned long index;
+
+	if (len < size)
+		return -FDT_ERR_BADVALUE;
+
+	idx = name + size;
+	index = strtoul(idx, &stop, 10);
+	if (*stop != '\0' || stop <= idx)
+		return -FDT_ERR_BADVALUE;
+
+	*idxp = index;
+
+	return 0;
+}
+
+static int set_new_fragment_name(char *name, int namelen,
+				 unsigned long base_fragment_count)
+{
+	unsigned long index;
+	int ret;
+
+	ret = get_fragment_index(name, &index);
+	if (ret)
+		return ret;
+
+	if (ULONG_MAX - base_fragment_count < index)
+		return -FDT_ERR_INTERNAL;
+
+	index += base_fragment_count;
+
+	ret = snprintf(name, namelen, "fragment@%lu", index);
+
+	return ret >= namelen ? -FDT_ERR_INTERNAL : 0;
+}
+
+static int add_phandle(void *fdt, char *node_name, uint32_t phandle)
+{
+	int offset;
+
+	offset = fdt_subnode_offset(fdt, 0, node_name);
+	if (offset < 0)
+		return offset;
+
+	return fdt_setprop_u32(fdt, offset, "phandle", phandle);
+}
+
+static int copy_fragment_to_base(void *fdt, void *fdto,
+				 int fragment, uint32_t *merge_olay_max_phdl,
+				 unsigned long *base_fragment_count)
+{
+	char name[MAX_BUF_SIZE];
+	int ret;
+	uint32_t target_phandle = *merge_olay_max_phdl;
+
+	if (merge_olay_max_phdl == NULL)
+		return -FDT_ERR_BADPHANDLE;
+
+	ret = get_fragment_name(fdto, fragment, name, sizeof(name));
+	if (ret)
+		return ret;
+
+	ret = set_new_fragment_name(name, sizeof(name), *base_fragment_count);
+	if (ret)
+		return ret;
+
+	ret = copy_node(fdt, fdto, 0, fragment, name, 0);
+	if (ret)
+		return ret;
+
+	ret = add_phandle(fdt, name, target_phandle);
+	if (ret)
+		return ret;
+
+	/* Fix target to point to new node in base */
+	ret = fdt_setprop_inplace_u32(fdto, fragment, "target", target_phandle);
+	if (ret)
+		return ret;
+
+	return (++(*merge_olay_max_phdl) == UINT32_MAX ||
+		++(*base_fragment_count) == ULONG_MAX) ?
+	    -FDT_ERR_BADOVERLAY : 0;
+}
+
+/* Return maximum count of overlay fragments */
+static int count_fragments(void *fdt, unsigned long *max_base_fragments)
+{
+	int offset = -1, child_offset, child_len, len, found = 0;
+	const char *name, *child_name, *idx;
+	char *stop;
+	unsigned long index, max = 0;
+
+	offset = fdt_first_subnode(fdt, 0);
+	while (offset >= 0) {
+		name = fdt_get_name(fdt, offset, &len);
+		if (!name)
+			return len;
+
+		if (len < 9 || memcmp(name, "fragment@", 9))
+			goto next_node;
+
+		child_offset = fdt_first_subnode(fdt, offset);
+		if (child_offset < 0)
+			return child_offset;
+
+		child_name = fdt_get_name(fdt, child_offset, &child_len);
+		if (!child_name)
+			return child_len;
+
+		if (child_len < 11 || memcmp(child_name, "__overlay__", 11))
+			goto next_node;
+
+		found = 1;
+		idx = name + 9;
+		index = strtoul(idx, &stop, 10);
+		if (index > max)
+			max = index;
+next_node:
+		offset = fdt_next_subnode(fdt, offset);
+	}
+
+	if (!found)
+		return -FDT_ERR_NOTFOUND;
+
+	*max_base_fragments = max;
+
+	return 0;
+}
+
 /**
  * overlay_merge - Merge an overlay into its base device tree
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
+ * @merge_olay_max_phdl: Pointer to max phandle value for merged blobs,
+ *     Both input blobs are overlay blobs that are being merged
  *
  * overlay_merge() merges an overlay into its base device tree.
  *
@@ -826,14 +1048,23 @@ static int overlay_apply_node(void *fdt, int target,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_merge(void *fdt, void *fdto)
+static int overlay_merge(void *fdt, void *fdto, uint32_t *merge_olay_max_phdl)
 {
-	int fragment;
+	int fragment, ret;
+	unsigned long base_fragment_count = 0;
+
+	if (merge_olay_max_phdl) {
+		ret = count_fragments(fdt, &base_fragment_count);
+		/* no fragments in base dtb? then nothing to rename */
+		if (ret && ret != -FDT_ERR_NOTFOUND)
+			return ret;
+
+		base_fragment_count++;
+	}

 	fdt_for_each_subnode(fragment, fdto, 0) {
 		int overlay;
 		int target;
-		int ret;

 		/*
 		 * Each fragments will have an __overlay__ node. If
@@ -847,8 +1078,26 @@ static int overlay_merge(void *fdt, void *fdto)
 			return overlay;

 		target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
-		if (target < 0)
-			return target;
+		if (target < 0) {
+			if (!merge_olay_max_phdl
+			    || target != -FDT_ERR_BADPHANDLE)
+				return target;
+
+			/*
+			 * No target found which is acceptable situation in case
+			 * of merging two overlay blobs. Copy this fragment to
+			 * base/combined blob, so that it can be considered for
+			 * overlay during a subsequent overlay operation of
+			 * combined blob on another base blob.
+			 */
+			ret = copy_fragment_to_base(fdt, fdto, fragment,
+						    merge_olay_max_phdl,
+						    &base_fragment_count);
+			if (ret)
+				return ret;
+
+			continue;
+		}

 		ret = overlay_apply_node(fdt, target, fdto, overlay);
 		if (ret)
@@ -857,7 +1106,6 @@ static int overlay_merge(void *fdt, void *fdto)

 	return 0;
 }
-
 static int get_path_len(const void *fdt, int nodeoffset)
 {
 	int len = 0, namelen;
@@ -1069,7 +1317,7 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;

-	ret = overlay_merge(fdt, fdto);
+	ret = overlay_merge(fdt, fdto, NULL);
 	if (ret)
 		goto err;

@@ -1102,6 +1350,8 @@ err:
 int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
 {
 	uint32_t delta = fdt_get_max_phandle(fdt);
+	uint32_t delta0 = fdt_get_max_phandle(fdto);
+	uint32_t max_phandle;
 	int ret;

 	FDT_RO_PROBE(fdt);
@@ -1109,6 +1359,10 @@ int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)

 	*fdto_nospace = 0;

+	if (UINT32_MAX - delta < delta0)
+		return -FDT_ERR_BADOVERLAY;
+	max_phandle = delta + delta0 + 1;
+
 	ret = overlay_adjust_local_phandles(fdto, delta);
 	if (ret) {
 		if (ret == -FDT_ERR_NOSPACE)
@@ -1127,7 +1381,7 @@ int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
 	if (ret)
 		goto err;

-	ret = overlay_merge(fdt, fdto);
+	ret = overlay_merge(fdt, fdto, &max_phandle);
 	if (ret)
 		goto err;

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 7475cafce071..ca7abb296ce2 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -346,6 +346,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	int err;
 	uint32_t tag;
 	fdt32_t *endtag;
+	int depth = 0;

 	FDT_RW_PROBE(fdt);

@@ -355,15 +356,16 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	else if (offset != -FDT_ERR_NOTFOUND)
 		return offset;

-	/* Try to place the new node after the parent's properties */
-	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
-	/* the fdt_subnode_offset_namelen() should ensure this never hits */
-	if (!can_assume(LIBFDT_FLAWLESS) && (tag != FDT_BEGIN_NODE))
-		return -FDT_ERR_INTERNAL;
+	/* Try to place the new node at the end of the parent */
+	nextoffset = parentoffset;
 	do {
 		offset = nextoffset;
 		tag = fdt_next_tag(fdt, offset, &nextoffset);
-	} while ((tag == FDT_PROP) || (tag == FDT_NOP));
+		if (tag == FDT_BEGIN_NODE)
+			depth++;
+		else if (tag == FDT_END_NODE)
+			depth--;
+	} while (depth > 0);

 	nh = fdt_offset_ptr_w_(fdt, offset);
 	nodelen = sizeof(*nh) + FDT_TAGALIGN(namelen+1) + FDT_TAGSIZE;
--
2.49.0

