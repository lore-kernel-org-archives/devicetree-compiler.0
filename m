Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793379977;
	b=gNsJchSg9SJl4aMj5DXFg9CTOOO6RLtOerO/bPKpu0dq+BnpsH/dm6edq399tBB5nS1u
	 SvZ+0BJ7YXNIvLqYuTpcA1ZrGJmJZvCn6qRRcRSjbwnkNDb+YLkqXXEVs6j7kAT+9Ilq5
	 vJX2bsgLheyweBNAm9J8HVpyJvPolP0VP84OwMBoZi5tNM+LZm91ouFZG9X4HR6tj86nl
	 CNa6/1g9rfwnTu1JNYDhDAFyRjASnHKjTovxOiK9iqFm9jnhwsDvPcV8RwmvKfKhR7brX
	 YEmk8wZ/DElsraOwTJCZtdZy8L2Ew9toQ4hXxVQSHA1NmEKe8GdorxbHYXp8sS6PH8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379977;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZgDF1OF8uEvjG5JQxHq8FdItENStNilvkZiEkSefsrU=;
	b=xElsnRnG6HSsBSny69Y4pYN83mgfPIT7EZNoPaBCJs5kMTLfBHAfc0iAI9bgqfVChnyv
	 biBLIsM1fw17NWUKpqPBBptP1JrIlAqTnno2ZLKB4yLl8DNe9CCUZRDjvQjySZnwgXmpA
	 Q98r4zxzbBf4Cqo4CvbJgLUgbC0HVJywod4HkoV9+pnOXoGTTjsyxII8Dq/a7xyalE3re
	 VkjGyEEfecRI9wvWO3Xjzp/pSzvnZaqhauy6mlBUDTjwpH8WgEVrGOUT68xizzkxCtFgk
	 vIo6P+BhQiwdWpof3m0wKGvGFz7/UAIKpGexpKW6OsQKezyMiqiiHRDis4t9MuEpmmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=31jgCXzf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.44
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010044.outbound.protection.outlook.com [52.101.201.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F46606A31A
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 17:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F46606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=31jgCXzf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF60SierD5RQEtR4NmvS5UgUQPw2XUbMXamEW+dcyjjqMoZcK11yExS7YwLUP9zm8K1GUTUxxdb1eUCQ/+9rthIaIOLp0X3V8cW5IYUay4mbP9HS+GIulGZFp1L2t59cadoRgxB/0nre+Aw4UeClG4YbT/Cib1Lj0LVrBNCBEDnAdH6pPAIkbOANYYC2icekumFH6VzQjJNlLsNyaWTm34hOE3JYvHw1RKDjt0vSBL44gDzrWOoO3KhPB9MZL2VLgOrT8+QrBuGezVv53BujzeCV8pGAscQ3Fnw03f1BrfwTlzcOriRdqmTvD+QuM1/hnm2eO83Jlrkt3f4Uf7F4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgDF1OF8uEvjG5JQxHq8FdItENStNilvkZiEkSefsrU=;
 b=jk1YgWTPGqY9TrGZqpxtur6DLPsP/GldHlac0cxe6BOwPqoKviEU6U9bsg25ZrD/XHgBUnccl+9QumlKCM2HJjzB5JqF6i6w/atD9l0XmFWlcydnIrLV7gPXmzUIocXrFbAALVqfy/mFnvxV8upMZO9WDBCo6BQ2H4rgtvcyv/TlEnwzAtgdCU4xG1aPvPVqHuFYPRbhSA2dqevbWMokEbec5t2Yjq7g7Ik0brAi8Up5HkrgjP/LjYFDc8uRVz0jwzVDUgUb67ou9MItGvWksVChlQOJpgCZ6lwXqRxo5OlkLzTzo7X29KOuqBsxSdgDzulPpYT4MeEHfFqWNPHe4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgDF1OF8uEvjG5JQxHq8FdItENStNilvkZiEkSefsrU=;
 b=31jgCXzfOLF6WE28xeM3YJX5AftDRp9t36hjJ9xUcFbeP2mw1U3ZIrISV3FsUZW+BCcqHG3cihgfdQOIN+rgzzmhqxc3VtW6DzlNOa+G4PDescR9nhqODRBhWM7TUoM8vY8wS4Mqxo0ZtRg1TYxOZqNdjS19sFSVNh1sP7WICDk=
Received: from DS7P220CA0077.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::8) by
 MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 17:06:09 +0000
Received: from CH1PEPF0005BD60.namprd02.prod.outlook.com
 (2603:10b6:8:259:cafe::8a) by DS7P220CA0077.outlook.office365.com
 (2603:10b6:8:259::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Fri,
 30 Oct 2026 17:06:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0005BD60.mail.protection.outlook.com (10.167.244.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 30 Oct 2026 17:06:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 12:06:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 12:06:07 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 30 Oct 2026 12:06:06 -0500
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <devicetree-compiler@vger.kernel.org>
CC: David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>, Simon Glass <sjg@chromium.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v2] libfdt: Fix fdt_get_path() reading before the start of the buffer
Date: Fri, 30 Oct 2026 17:06:02 +0000
Message-ID: <20261030170602.2142997-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD60:EE_|MW4PR12MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6df4ac-f254-40f9-f0d6-08df36a81782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|23010399003|36860700016|1800799024|261026121527099003|11063799006|56012099006|10067099003|261021121427099003|261022105027099003|261009223027099003|261021123027099003|18002099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	zMB0dr+mpWkwSk5nF+NuPXYx40KkhEarH+bjCiPuRoQ+muwckre6cD9MzPjX1QZyCSlGDAHKx+qGM//S5y+ARs/imnXOfA/x1DWTqIcApzCwUzj3JXM5qTYzqQTjzNKoQat0p2HU+R68mb8rAQ7U/Y4G+a9HIKwEdSFh0/KkiDG4wKt9WAtg6ToKxLFjNi+3IRAoVMn7KQBjN4YPEqUKA5KKzsskyaJPCK7NkUHtVL9KQRktHI0HdVmXuIOvTM4SAoaCvDYWGPUVd8+e8egS+1lYe+Pm0pZspFhrI+JwELO5FT6sN48bQD66DPmTp+rIMyHWyuXZHZfhO3SxokCM12Clw7S15FiuQIRwF/59R4MDMJ0s+qUkm/7+X3WhMtWruDxRZXTWstaR1LzdnY7OZH04EbewdnXbkQixSERiBh+C7Dm1ikoxIFYpuMxuxHf2/UXPjT0u64aAzwInB6WG6XLpe0AJCyZYH2N+9cj2GqvxgMXyIqYfOM4ar5+WiftGO3btKS+lDCrkO0bt6FYwV5SBA90jsJUlqGeiEidhqyGd0GQM8oPoJ9OiPNuVQm8z/1/ZGGVz0b1eUEXvmmjmuMBnCgxQNFK+Q0ta5arEru04n2ngLLHrOTPZ3pM9lVofpC+TiXvRsQ7vBOMn1R+SkMvov+CUJQlbtj+Nq2M5oVF1JYduzvp+FqN6Hm6bSpRZKWzUgQQJZBGCoRYhifHP8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(261026121527099003)(11063799006)(56012099006)(10067099003)(261021121427099003)(261022105027099003)(261009223027099003)(261021123027099003)(18002099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OZgbKpX6FaAPVf8mo8RtcFkwMEZItHAGK8d46HpIfOdTr4N+oC+j7P4nzcXdSny9ulqoHnPvs2K3ShjkyS4vPGkm5DH/4FNOyPvcx7L26biJCDS8vu9gSxzj60RctEEDx6PuQV3Z7Kbl77LkKaJNYHUQV2kt/5EY8BHDET84iDslJ6RFNXbpnw995QOVpOy4kHRlnKlZHRj/COEMZkudY21sVWWIEQZle8SSq/y1ORBfVXod27Dh+mZPsynkapAJlgjF9xSHG3IAcfL8yV62k0WEjy0dBTNYYMs7WxJ1PsTaGfRgB91MGg/n/IUlABKGeGaxsB6PMUp6r4L9kbAb4+yOaK3B1sfKqw/rtHyxjd21ZYoqNIwsIFy+2UErRJISbI7v34jF70bk6ZteqDKcxXmPV41irQKSZZdwF+eGSkMCeeXYe07YoQw0aihqAX/e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:06:08.6210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6df4ac-f254-40f9-f0d6-08df36a81782
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0005BD60.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5668

Asking fdt_get_path() for an offset past the root node's FDT_END_NODE
tag makes it read before the start of the caller's buffer. Such an
offset is not a node offset, so this needs a bad nodeoffset.

fdt_get_path() trims a component off the buffer for each level the walk
comes back up, comparing the components it has against the depth from
fdt_next_node(). On leaving the root node, fdt_next_node() takes the
depth negative and returns the offset just past that tag rather than an
error, as commit ce4d9c0f ("libfdt: Rework fdt_next_node()") intended so
that fdt_node_end_offset_() can find where a node ends. The loop only
tests the offset, so it runs once more and tries to trim a component
that is not there, scanning back past the start of the buffer.

Stop the walk once the depth goes negative, as
fdt_subnode_offset_namelen() and fdt_node_end_offset_() already do, and
reject the offset up front with fdt_check_node_offset_() where input is
not assumed valid. Add a bad-offset case to tests/get_path.c; run it
under valgrind (tests/run_tests.sh -m) to catch the read.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes in v2:
 - Reworded the commit message: say FDT_END_NODE rather than "end tag",
   state the problem first, and make clear it needs a bad nodeoffset
   (Simon, David).
 - Referenced commit ce4d9c0f ("libfdt: Rework fdt_next_node()") for why
   fdt_next_node() returns that offset (David).
 - Also reject the offset up front with fdt_check_node_offset_(), under
   can_assume(VALID_INPUT) (Simon, David).
 - Added a bad-offset case to tests/get_path.c (Simon, David).

v1: Message-ID <20261001121036.2910243-1-ayan.kumar.halder@amd.com>

 libfdt/fdt_ro.c  |  8 ++++++--
 tests/get_path.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 11f2e2e..555bba0 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -573,7 +573,7 @@ const char *fdt_get_symbol(const void *fdt, const char *name)
 int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 {
 	int pdepth = 0, p = 0;
-	int offset, depth, namelen;
+	int offset, depth, namelen, err;
 	const char *name;
 
 	FDT_RO_PROBE(fdt);
@@ -581,8 +581,12 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 	if (buflen < 2)
 		return -FDT_ERR_NOSPACE;
 
+	if (!can_assume(VALID_INPUT)
+	    && ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0))
+		return err;
+
 	for (offset = 0, depth = 0;
-	     (offset >= 0) && (offset <= nodeoffset);
+	     (offset >= 0) && (depth >= 0) && (offset <= nodeoffset);
 	     offset = fdt_next_node(fdt, offset, &depth)) {
 		while (pdepth > depth) {
 			do {
diff --git a/tests/get_path.c b/tests/get_path.c
index 7349898..1681747 100644
--- a/tests/get_path.c
+++ b/tests/get_path.c
@@ -63,6 +63,34 @@ static void check_path(void *fdt, const char *path)
 	check_path_buf(fdt, path, pathlen, 2);
 }
 
+/*
+ * An offset past the root node's FDT_END_NODE tag is not a node offset,
+ * but fdt_next_node() still returns it rather than an error (see commit
+ * ce4d9c0f "libfdt: Rework fdt_next_node()"), so fdt_get_path() has to
+ * recognise it from the depth going negative.  Before it did, the path
+ * trimming scanned back past the start of the buffer for such an offset.
+ * Run under valgrind (run_tests.sh -m) to catch that read.
+ */
+static void check_path_bad_offset(void *fdt)
+{
+	int offset, depth = 0, badoffset = 0;
+	char buf[64];
+	int len, i;
+
+	/* The offset fdt_next_node() reports once it has left the tree. */
+	for (offset = 0; offset >= 0; offset = fdt_next_node(fdt, offset, &depth))
+		badoffset = offset;
+
+	for (i = 0; i < 8; i++) {
+		memset(buf, POISON, sizeof(buf));
+
+		len = fdt_get_path(fdt, badoffset + i, buf, sizeof(buf));
+		if (len != -FDT_ERR_BADOFFSET && len != -FDT_ERR_BADSTRUCTURE)
+			FAIL("fdt_get_path(%d) returns %d instead of an error",
+			     badoffset + i, len);
+	}
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt;
@@ -76,5 +104,7 @@ int main(int argc, char *argv[])
 	check_path(fdt, "/subnode@1/subsubnode");
 	check_path(fdt, "/subnode@2/subsubnode@0");
 
+	check_path_bad_offset(fdt);
+
 	PASS();
 }
-- 
2.25.1

