Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010006.outbound.protection.outlook.com [40.93.198.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AB73DA7C4
	for <devicetree-compiler@vger.kernel.org>; Thu,  1 Oct 2026 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856670; cv=fail; b=ZJMzIsvj7r3B9Yw2rsV1hJxn0S2v0xhDcb5qhWVCHXEWpKCn3yk4SOV+vC+a/tYUwDAzecOIVVVmBUplxt2KWi9sABRh7jd5z7rWWBHVhrTlfel3ZSbY2zVt5w8AybOR++ClUcU0rwLnr1xqvliP4TJTaA6ZFHozSj56fRojlHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856670; c=relaxed/simple;
	bh=ku9yOaUHbnEXQtky1ifomrkpFkvNaP1pbEScjSWCvXk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NhQbt/7A8x8D3Gk44PJpeDyxSV9p61s4HBQwou+xsk5M5J1ki6NMdG7FU0+xRsgXUOGggfxyg7yKpvPBZqRy5ShK/W2wQkBfozA8s4d6m5zxsntAK6Di8V+IVc+4lD4VbnoPIriVy+3KG2GByuKjbVCjuYI+aXAxNSfZsDbBycU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MzlCondF; arc=fail smtp.client-ip=40.93.198.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MzlCondF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOdhQiIBhgYxUAaZSYBb0O1b2WRjWTv6DTBTwCtDl/1gh4Yz8q5frul7nnby6Ol5+yh+8iwKSiRZaJplE9PEfuDO1snQOe9i5ktxHYY4/9B9zmbcHa0RbZeb7sTYT0eBnBKDf++DRPBAHGDUWNmWc/OnRzVv7jkIeBz79yqAH1RK/s88utm/eOYfoz34IpJqucnHTDzv0Gr/eJ0iQ+IP/cniga6T/TkZ2G5ehuwt8HtBjpMzNp/RiHYv2Dszu8r7tCCwRP8Nx3hyPnoW2Ic2Ee7GUxFriwQjyRuWHCFMq5NWJabyV3d9dmQSnVRybukobW5sv/4G2Vqlkq8sNNo6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcoAJEoDqkS5klvqbd0QqUCRt6FsLMsIC9B9qDX8xCk=;
 b=RfuRV1UOklg3/o4s++j/KFBMP8bh7mtROi4WxkC0IbnTm+eGyRwuPj4ElNC+HQGLZ9z38Rv3ZHfHGiY8XDBYpaGHbH0RiBBsAHeb6nnFy2YeYvhTNRikpuvsXeMeKGIuHxIIm8rXZGZMBRQSkHJq1ewscKr9pIG2qN1m5+mb8QroNqmcH8P+7g6ZdoiqCldY4U60l0AdPFV4xFDsRwLN6s/pjrkRYhSAe7JszoIcO7L0+yKlQw+wGH8wbQtKNMtMwYFYDGmoYYXJpjB6+1bw4LvVed7yx7nv0juFOiSZpTU+uYjyWl8cb4AN3fN2AU77T83zl8p6SNOFhHprN8Wgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcoAJEoDqkS5klvqbd0QqUCRt6FsLMsIC9B9qDX8xCk=;
 b=MzlCondFfj978AKh8/eslOcvPmAoAr/icY9awE92Z3jikXJ1lIjDa8ppFF3CmJs2+Bv4m+ZsssB8j3Uwty3I6m+xc1zrN2zTaaAiCNeQgP3sFbUZ8TlwLTA2uLL6QO6lfDtGhDHxXNKaDheScenhfq6Fd+qPC+oYLhl6ACoIGTs=
Received: from MW4PR03CA0037.namprd03.prod.outlook.com (2603:10b6:303:8e::12)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:10:43 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::48) by MW4PR03CA0037.outlook.office365.com
 (2603:10b6:303:8e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 12:10:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 12:10:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 07:10:42 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 07:10:41 -0500
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <devicetree-compiler@vger.kernel.org>
CC: David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH] libfdt: Fix fdt_get_path() reading before the start of the buffer
Date: Thu, 1 Oct 2026 13:10:36 +0100
Message-ID: <20261001121036.2910243-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: c1517a4e-4e54-47b7-8cd7-08df1fb50428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xlxn9H+OepUax1jL9zYwPiOewJ1gC6TCYTAt0JI0Cz0XlYEMwpVBGi24R9/VlAAcU0HUP2vLxP/rHBAvqARw9jK6zh5++t80VD6PCjCg6qSAfE0MbqlIlV6PmwXl0toa3+CJqB3n3bUEKqBr/3W/rUyCRPEQEqJ2+BkQI3G/7VmyD989DPoQncLKOFMbyMPaxb2AYAvrfUrzGLjh53Y5W5cPRfQR7T6coeERJkIjdC0x0gnNyWINr9u72s/mNJoiY4HbkjGjhTt4pnqiXKtfjjpqrf4muZLFqWiglswsQ0y3VTi8Enhcl1iwTNEx+cNc56Z8Z27mw9F9G5KEOBDUW/77h9abxx0osaypq65UlDJzdG3Aot8YFqXvJgPvOSOyi+IuYdxaIzAO0xdd62uPFYNeK6qGcteYx0kHbJJWh2OxtmDM7dxEMNNtPSPaCQ/dd3qA0ty5GQBUg1KJBwX8lPE2eIqHnRpUaPJ6aV+/M97QEUGY2FTqrIphcf3aKxREoGbP0vNxHtAFLGFJhhFwv/zkEjbv1szLyCuWQtoeyGZ1gj9ckhDZDZgkpjGrJpFKe7coCngHeuWgFVegV1ArIsQu5RQYuaPk4UIufgU7n1vb9HwTwfj3JgfGwPHs6Nn1Ug6KOkCTa0s6YKz59b4AL/zqoIsXzNOVdDy5NSAI/qzosPhS9o09nPgoBQ5vsOzK0HSXfH1QBxcRH1VlakVNug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wh7sZIal3fVHupJrUkctQeJ6KLHeJyTB5doOWKP6UDliQkV207B19hGWRdqCpwwKcZFitMNbL7OcSOesQtEPrcf1XM93zBpi7dQm8oAWQNq3CkLf9tBj3AkSDEMeKrVRWLsj2q3EEB+4m4z4IN9DS7RdvkzxHx7R26uV0Dft+FzAEq1TSzxR5TjF5gXoqidkzj7piLgZ2o5Xklg3gaP6yV0YrXh1NJeXLUPql6pK28SSJOFDTslEvkRwIo3UauXFtMdMmyp7jO+gFyDXLkNqwBb0/SdFRlsWFHbimzFmKODrtatwQCk1DgKRGAqjsbsKk/D0Bni9KeE4uo8K/FuETWhysFdNOMx4D/LQV8C8vb29aCPszZaFr0eGmXhfgOdaKArNJplmkfEZ9SWgCFotnwFGXmbV1++i3eHOx9K5ERruzEBD/6FetLyK4ZHupygz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:10:42.8111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1517a4e-4e54-47b7-8cd7-08df1fb50428
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530

fdt_get_path() walks the tree from the root, appending each node's name
to the caller's buffer as it goes down and removing the last component
again as it comes back up.  It keeps the number of components currently
in the buffer in pdepth, and removes components while pdepth is greater
than the depth reported by fdt_next_node().

fdt_next_node() reports that it has left the tree by taking the depth
negative, but the offset it returns at that point is the offset of the
end tag, which is not negative.  The loop only tests the offset, so for a
nodeoffset at or past the end tag it runs one more time with a negative
depth.  pdepth still counts the components in the buffer, so the removal
loop is asked to remove more components than are there: it takes the
index down to zero and carries on scanning backwards for a '/' that is
not in the buffer.

Stop the walk when the depth shows it has left the tree.  Offsets that
far along are rejected by the error paths below in any case, so this
does not change what callers see.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 libfdt/fdt_ro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 11f2e2e..32689c7 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -582,7 +582,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 		return -FDT_ERR_NOSPACE;
 
 	for (offset = 0, depth = 0;
-	     (offset >= 0) && (offset <= nodeoffset);
+	     (offset >= 0) && (depth >= 0) && (offset <= nodeoffset);
 	     offset = fdt_next_node(fdt, offset, &depth)) {
 		while (pdepth > depth) {
 			do {
-- 
2.25.1

