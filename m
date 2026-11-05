Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793901901;
	b=q1Ku5VBvYQeOM7DuwXAwJNUiTvkzOikBixMq1IjMA9zbs5v37Ba4/u5t3Dc0GZhbSkIl
	 +y0kfXqVftEQm7HvC+GWC0yfpqrRMj72X03YVfyPPkziBaa3DoPvQh+hrbRFCGOWG2OWT
	 NEH2SeuLmPE2fyQr9Xjg7rGSggMklmXovEmVy/JMQAnSI/ezXYR/INl/UUDtW9IzN9Zs4
	 3szjN2y5zhKhQgCJmb3+ZL4OW5P50ujap1VzT8CZkPh74tHCoS0mnLvapcEEG0dsNczO4
	 a2/giWUb8UF/ifQssP790TmkPGig9z4KANEodlVEZBKhP1O/YkAcDU1O0KcQdNZDKbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901901;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2TGdj68bMsQj53TBANqIa/W2fgZolBJnQZNJNDm4G40=;
	b=M4WVN/k0C1GdC56lTOdjEVgLLtRVSqHKiFMcfOLTO8yZ72lBLHQ8qY7a2SlLE+8Jw2TM
	 UaULEo3qi/ga7uWY4YmIFxGLb9mSUBRPy/aOmq3PC/R3IzjHCMYSz9mqun4rIGh7U54jt
	 f6ol9OJO646PvxCtK1kvXzy3nxg30fEAzoYmpkMfRuMBwe+kClOi7v0+90wRbkqi3H92J
	 NhKwOGmW385vriRGJ9vyboZvtkmkTgzHWbg0z02EDra8AsC/VHNm/u+XTq2l6hsKr1Pgn
	 CDLCQTRkUZmxALdh515R8sB40fyNMccUsCFs0mzVHkMrWVvsWbEowCG8paqCt5BiNdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qBrsmmXV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.11
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E5606A328
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Nov 2026 18:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA3E5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qBrsmmXV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVXX2KcOxUm8Fwe3NwODyJH8bZaVxFAtDuxwqeBxLdcHJGAGVEoDQDdBTr2C3CdQx8sRwAvP5P5xrX7m1gMoPxHbKiSWSDw4zt2Kz8slWmJIyylSh7Swys1EmvOYfrUNpGdPrfQThhzIxwvXimd0OSL0sF8j7GJH0XOS9sjB+AvuXFJnmLI9VBXWE2waf1bJPrMpTPKEttBuVZVBvr/5uww/dIZoU1kI1y5jVs6778sDBSXrcoZpHA466CsQQMseXYtLvH4HWgqhUHLG2sJIIzsjMWClkUsELDW7s9uOnL2V21hLwEHyJusub7QJLY4hfAsmricDaUyQ7P7DbVUDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TGdj68bMsQj53TBANqIa/W2fgZolBJnQZNJNDm4G40=;
 b=dIpnkqfn1i/f23JHYKFvf8iWlJzMdHbhzK2lpQ4i7T1a4UGgc0LzX9xTgF7ypT4B/oHO5Yl8aN5eqwNlkrYYmgKh41F2UuxyCaRpYSg0ctW2xzw2mNrClgd0Ub3aQyd6ZGXj955X01+vVlTsIwYAeig5oq8wHNUcH+yOJzkopVo3mvh8QmI5vbb/+AD2M2WiGUBerYpJ3lAldDMZIo3fQU1LtHIcOnC5HvBuS3YUmMSSehZaizFo9TA1Hp9pkqH8viRYtfM9e4bs81fmYmHrxhGQVi2HESOnZ5VFWbyTLP3Tg802f1LVwfMUAv3eQR3IOZDYbQi3d7cwUi4EEWowBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TGdj68bMsQj53TBANqIa/W2fgZolBJnQZNJNDm4G40=;
 b=qBrsmmXVhCqxKe+u5zjKzDAWT3Jtw0KdMDG+xNbnoEYVoit7y4ph6vuedw69dUUGs0hOeDt5opDb/XdZuCXgomrFiAEvBzV+P5FA9aRHu8e2N3xS4iLvERFWB8d45dq10loZAzZkpgtx/3VgOMTkltaOs/r9UsY82PqTJEopbHI=
Received: from CH0P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::18)
 by DS5PPFEC0C6BDA1.namprd12.prod.outlook.com (2603:10b6:f:fc00::668) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 18:04:46 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::3f) by CH0P221CA0030.outlook.office365.com
 (2603:10b6:610:11d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 18:04:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 18:04:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 12:04:45 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 12:04:43 -0600
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <devicetree-compiler@vger.kernel.org>
CC: David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>, Simon Glass <sjg@chromium.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v3] libfdt: Fix fdt_get_path() reading before the start of the buffer
Date: Thu, 5 Nov 2026 18:04:39 +0000
Message-ID: <20261105180439.955822-1-ayan.kumar.halder@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DS5PPFEC0C6BDA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b2c1c5-89bd-4891-610b-08df3b674650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|261026140227099003|56012099006|11063799006|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261021123027099003|261026121527099003|261028144727099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/89vyQptuHg45HwgkyBGMfz4mqM1tudJ3Pw97V/QVvRN1X3JETsqXrjarSp8Gh5/l3jYNQ3+LSli/EvVyLVnvV6lntgZ7h/Uzcp5z5L1ZTGfc8VPoOPrGpjGB8g7e5GCJZdwPI7YSsw56oWa9trGYxrnEdUh5D1vr3/4MRu1zLK3vu8mM0EaPtlAsmL97N2V5C3a86JZJLSH2PcyDbul/8AEFvWowb2yCewufbZStN2jJ3bkGuMyvcDkpCG4Y/pQMTs4jsF/3SmrqRXTPPtg2FNVinEwfnRhZ70NJ9/bf8MkH9WeFTEBNpKLv0UENxNHCTbdyx5z8/BuRShja7mEMXyqJ6HJLM0j0YT+xFDjdyeFBME5zTGuPcEP6gkCST1h6Ho+m1mkurv1IJarcuYYZSbymYw0B2xxVSyL41hJ36ciCMllFUsjnc0H+iPScfTiJo69nzqYKYgHX9xE9mD/ZXHjMN3YuaYxdDv7c256Ghi7M900UYZVK/Y5kufdo+wiCTyM4JQyeI7fwKppDE4Se+a8Zl+bPZEo5lWtiBCSgkhiDx+Gj0NSdPmPh/MoO30N4H/2EFRYva9LCCAP8bRK3TIWQgT/HxqwgC4nfADdqlzvYofRof1mkhxCA5kmdf0kBSISyaEO2vL7aMGEl4+3T7N+9wtQLyknmt/vy7vgoLQSADpJICtumI+jwohfcQcWtqZhd/5tTBZMzi33VSP9GA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(261026140227099003)(56012099006)(11063799006)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261021123027099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hd+l/+mcpIGfhPL10Zt0/E9Ht6uCDKsSk2MFWwcPav2tWGLvUhufsXqrL/hAbJrw4fWRSNkE0YWSJh926TdHmDs7LkSVRFf3LPpMBiQbtFpT39I/WJDnV7dT0GfkTml0H+EKclCJ09H2D67xB6CifdDxTLSk8lLv2OrQ5qUTR3GriKBP2oG4/AmZjsVyC17Hj1Y4csCEs0GL7uJEZJgTlzl+3Ix6Lv7ure1yNDqy2sbE1m4h99H+kt0It5iYSr9zTiNR5xEG5cbxZtLY8jWwu/V1IhqMSKmm31grxW3GPfsqvdzCwvDxqbq8Y3pEgKoJx+xqDrqO48RtVpb55sbrVbSCXUxcAsXrtk3397Pazz5cE1P4OCJ9UkDj/8ixKP+5zA2iqHNbKrqsk+qO8NKdMYzIQDD2Z86G6+wPNpmyelRb4beeDx+iTmDlvO00bKAi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 18:04:45.6815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b2c1c5-89bd-4891-610b-08df3b674650
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFEC0C6BDA1

Asking fdt_get_path() for an offset past the root node's FDT_END_NODE
tag makes it read before the start of the caller's buffer. Such an
offset is not a node offset, so fdt_get_path() should return
-FDT_ERR_BADOFFSET.

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
Changes in v3:
 - Reworded the opening sentence to say fdt_get_path() should return
   -FDT_ERR_BADOFFSET (Simon).
 - tests/get_path.c: allocate the buffer with xmalloc() so valgrind sees
   the read before the start of the block, rather than only when the scan
   runs past the stack pointer (Simon).
 - tests/get_path.c: accept only -FDT_ERR_BADOFFSET, since the up-front
   fdt_check_node_offset_() makes -FDT_ERR_BADSTRUCTURE unreachable for
   these offsets (Simon).

Changes in v2:
 - Reworded the commit message: say FDT_END_NODE rather than "end tag",
   state the problem first, and make clear it needs a bad nodeoffset
   (Simon, David).
 - Referenced commit ce4d9c0f ("libfdt: Rework fdt_next_node()") for why
   fdt_next_node() returns that offset (David).
 - Also reject the offset up front with fdt_check_node_offset_(), under
   can_assume(VALID_INPUT) (Simon, David).
 - Added a bad-offset case to tests/get_path.c (Simon, David).

 libfdt/fdt_ro.c  |  8 ++++++--
 tests/get_path.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index fed2f9f..05903e3 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -583,7 +583,7 @@ const char *fdt_get_symbol(const void *fdt, const char *name)
 int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 {
 	int pdepth = 0, p = 0;
-	int offset, depth, namelen;
+	int offset, depth, namelen, err;
 	const char *name;
 
 	FDT_RO_PROBE(fdt);
@@ -591,8 +591,12 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
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
index 7349898..da8b26a 100644
--- a/tests/get_path.c
+++ b/tests/get_path.c
@@ -63,6 +63,36 @@ static void check_path(void *fdt, const char *path)
 	check_path_buf(fdt, path, pathlen, 2);
 }
 
+/*
+ * An offset past the root node's FDT_END_NODE tag is not a node offset,
+ * but fdt_next_node() still returns it rather than an error (see commit
+ * ce4d9c0f "libfdt: Rework fdt_next_node()"), so fdt_get_path() has to
+ * recognise it from the depth going negative.  Before it did, the path
+ * trimming scanned back past the start of the buffer for such an offset.
+ */
+static void check_path_bad_offset(void *fdt)
+{
+	int offset, depth = 0, badoffset = 0;
+	int buflen = 64;
+	char *buf = xmalloc(buflen);
+	int len, i;
+
+	/* The offset fdt_next_node() reports once it has left the tree. */
+	for (offset = 0; offset >= 0; offset = fdt_next_node(fdt, offset, &depth))
+		badoffset = offset;
+
+	for (i = 0; i < 8; i++) {
+		memset(buf, POISON, buflen);
+
+		len = fdt_get_path(fdt, badoffset + i, buf, buflen);
+		if (len != -FDT_ERR_BADOFFSET)
+			FAIL("fdt_get_path(%d) returns %d instead of "
+			     "-FDT_ERR_BADOFFSET", badoffset + i, len);
+	}
+
+	free(buf);
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt;
@@ -76,5 +106,7 @@ int main(int argc, char *argv[])
 	check_path(fdt, "/subnode@1/subsubnode");
 	check_path(fdt, "/subnode@2/subsubnode@0");
 
+	check_path_bad_offset(fdt);
+
 	PASS();
 }
-- 
2.25.1

