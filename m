Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2092.outbound.protection.outlook.com [40.107.21.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E721A7249
	for <devicetree-compiler@vger.kernel.org>; Tue, 24 Sep 2024 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189647; cv=fail; b=QQy3VBFNBvlcbupyplZ2DhQfhmzNbp9I9odwz1zSUrJKxWqIeE4Qz4jVuXqF/H3+pALpguGhktwyDT//KxwUey5koH+2YNeE4fzgvJfh5PcGP9/Dix6+GpL3M5dGDPuy0IpUtSDnMNDANhvUBu8fbJAc8yLY39+0nI+xR153LGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189647; c=relaxed/simple;
	bh=+iL6K0H0btpB4t/EDhSKpCnl+TlRaphxYxjpLHGw5YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pq//Wa06TxB1YcI1t9whAbSaRyrAKZ3pYv/W7UZ01gKIlO8rEMWaBy6jFIO0tTJnMALb393Ky8BSsiIWq4hKdJR/Q91EUy8poncHKKSHoMMF0PUnMz8S6oxsD9hrd/9kzwYZQ65X16YBlk45xhzN4gvrFTctfX7zqh23b0JZoXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=GdbMhmhQ; arc=fail smtp.client-ip=40.107.21.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="GdbMhmhQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JasPJAgpMbHGyphVWbkkyTnRK8uO1zVIgoSUElHtqMpUsznKkopQa2ZvYp07bGTvmPzHJHJ+nFrXtEUQ05EQkzXBG4JtioF3GPjA4A5uxGlvScaR2rtUifoHDdJzutV4vxmHViA4NlmEhz1hV3W+cYJz2NHUCiXjTLlQEbR/19SaLKVzfxrNkvx6ODyrb5MSC5KO6KYhHqajhhFu3g7XCv9ARISRFRlVWYnh2szKzKx62v/MqncU5bYOMXKYyARK49ZeUepa3NBx2rZuTsAGLaqthsZBRHlGlBcAP5SRZ//kyMUejn5ljpKNonSQzjLtWnKmRVuY38Hy4V0z1MTOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HRlo9uNKMWe8Tzr+errVv7JKImfRg4HDJjyLQgIJBM=;
 b=b32sij7cdzMLcfAk/Ug1YaWMLOIQFQjSwjYJsvZMIdtpcR7QupvVbABjqU7GsUAY553zVGeqYwBIXoIZen6XNl+D5Saptrm+41MmQCSBVAZ3RILDrQscQQd9o0A0rEL+zHAcdVq0X8xsIGWZTcL1z44taAzoa+RuTJc8t7f6zyrsuZM3WIjOCWpK5e1JMPmnszeFMC8kiyiM5dGPfUx0v6qXKqI3vaw83j7hg+MH8+Kio4nCaS0G+jiCrJiKcmbJupK1v14JOzZ7VYQOLeDxWpCEK73nvTo1eGRi2hMhlVnsf3OIZHGFrK2fYEs9tWegsab7YR+ra9cfA93D93Grpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HRlo9uNKMWe8Tzr+errVv7JKImfRg4HDJjyLQgIJBM=;
 b=GdbMhmhQzilJpFLpkUCKbZ9EBuqXdBxrSIlNbY5ISHAYsgUdIwPmD7O2pykMjgFLXHqwDAzJLOqwjRGqOamiG9Q/jyYYXFCl0MiGT0VfdgXM+/UomyzzIEpmuJmGEpZzt6eRLB2e34PfO0rUKwe19MC1tklxcLiDyfD8CqdwyOqe/FpEjb/AeyQrDlv95dVrXm1et7RpU08tIMx28dBuK+Gi8kOL7mN6qJgHmB51oAG50r6ufujsiMCyOS7d/Dzl3t/6poF+o4R5uXr++5oeJ1YjG2akzGeTBoKKdbFsNPWAnT1dFXU0xYeyhrcjvofoqVBnOM4ZMfHEBv+aL5TEMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com (2603:10a6:10:303::14)
 by AM8PR08MB5569.eurprd08.prod.outlook.com (2603:10a6:20b:1de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.7; Tue, 24 Sep
 2024 14:53:53 +0000
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6]) by DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6%5]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 14:53:53 +0000
From: Andreas Gnau <andreas.gnau@iopsys.eu>
To: devicetree-compiler@vger.kernel.org
Cc: andreas.gnau@iopsys.eu
Subject: [PATCH v1 1/2] util: Only read files until fdt_totalsize
Date: Tue, 24 Sep 2024 16:50:51 +0200
Message-ID: <20240924145320.613246-2-andreas.gnau@iopsys.eu>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240924145320.613246-1-andreas.gnau@iopsys.eu>
References: <20240924145320.613246-1-andreas.gnau@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0000ED80.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:3:0:f) To DB9PR08MB7512.eurprd08.prod.outlook.com
 (2603:10a6:10:303::14)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB7512:EE_|AM8PR08MB5569:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd7fac8-28ca-400f-dd09-08dcdca8b178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?au13FdCKKY0abUCuYUIjOd2dZpUtUTrzJ6wv+f5JvR52WLd7b2AnwKMjLtVw?=
 =?us-ascii?Q?rmGVm+W6HjEJgjwRYUd8EbsiJoPMV+QsTJcvFDarBFJA/H/FcR0joQajbz+X?=
 =?us-ascii?Q?CsvbG6lsvNcqylsawuSrMF3ElLaVJSFkket0E5a0Juk8eT1fRLFP9NTTr+GO?=
 =?us-ascii?Q?YHZgMFS0LC+DUW2Bi+4b8+fkbh7H4KriT+aafKz3q+I0cAGg1jPc/1y39FOW?=
 =?us-ascii?Q?OJi3kpJIRwZsHeBiAvZZRINVBwqKzgUM5KucoXw5AJ9OuHeEMwklQuUMglL4?=
 =?us-ascii?Q?acvNiI/hjTHYfrg/g1OzlAdtyN6RhlWIiNyD8SNcZbXsDYwbV/XgYgfo2rF1?=
 =?us-ascii?Q?Sapx+nWb8kjSa6T9PNUTcNQEb47kejeOObaLjBH64JHX+3wU2aH8VBuPRVor?=
 =?us-ascii?Q?pkVc6grx1WmEnq2lrHJTl/85wylmtTKTMLVZjNvf38ObVtfQVkZl8lPEMd5G?=
 =?us-ascii?Q?Ppoy1xyci0dIoSNXPoaCBk+MoyYNQPD6peguOb8Jn2HI3xO8T47OuIfP7K1G?=
 =?us-ascii?Q?u8tspyKJj3eAJbRXLoHwO3TQ6qoeuEIBZ1Buq0BwDwnVOyaxeNSDR8wPmvFl?=
 =?us-ascii?Q?sHHjerzVua0gyBUvpCmJZpWoOt3vVSKUhgGKDsYO+fzowUM9H3wmySGTpUv5?=
 =?us-ascii?Q?TaQ6A26HZT2Z6pcjislau0elHY3WeuNazSuz/x8a99dhKtZaemb0iLFboYzr?=
 =?us-ascii?Q?XtAyt7Pb60wpyKUhuzhLhzfTJwrzTjH45s6ilw8aZKJvnI+VwGLD+HVp3b22?=
 =?us-ascii?Q?I7nCdOuhtlB+wwgX5pYypHeLwIcZKdWftfukg3MtTeuhqXG8t50aItq1Zyl4?=
 =?us-ascii?Q?fFFGicwOuxi58SgOWTwjGvXGRq+VslqFV9Ulck72QmG64GI3p/5NFUInLfn4?=
 =?us-ascii?Q?K5tHt0udng2NykXHxRhpm2Qzh0e11EH4NuCMB+ZbRuEHmaGODNuSr0TqG+Rd?=
 =?us-ascii?Q?vz4zRiAZkkb3du5yOHdL+hLUqH6r5W8nXMlAxFQj/cRNBmWp3GR1+uhltM9v?=
 =?us-ascii?Q?MWznBxSZWJOSfKB/fd5bNZ8HMS1RPMuHYMWXkoUMgJc6EXesamWz2oEiRZeg?=
 =?us-ascii?Q?KCqHYaVdsrZtOXk5CSG+vM3qRxQxEIRaylrwSXiEj73x0p/NRao6MD5u+viA?=
 =?us-ascii?Q?7qvjyVP1Q+yduwXnDQyaHAYgMq2vUNf0UM2oayhTtcHUlnPWvEzesFod/Tm1?=
 =?us-ascii?Q?yn4eS2BlT3mm3zRJycCr+ekmd/UEYTb++3VL00bc7/a6W64ARzuGfN57Bd9/?=
 =?us-ascii?Q?eWiJvXbcnXNk3G1Q1q41XrHe9Nb/Jf1BD0+0iZQ639Vw2OXpnNhS6kDAsmym?=
 =?us-ascii?Q?d4RX1Og1qTXNsGXEwimowLDwPQ/WkqTHITHD3IErmNBbuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7512.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PJMS2vv6QcJyfrRlBVQ+Ugv5eHI0xUDSTc/rbtbMmvqlIPu8f3u2Y3abfMqa?=
 =?us-ascii?Q?BjbNdU2Z/mshLShT4h7qO2TczMj8oKCmEYHkexx7SipwI+EIhuQMaaWfCL6q?=
 =?us-ascii?Q?cnLYH8wG7J7m3cOeNqQfMtavlD3DXA9isBvB94ZcNWd2qErAjMWnGyqdGvj/?=
 =?us-ascii?Q?m8Q+llFh95xxFK3BhIRJkvQLYW3NFqJNmVVMS+CZ/cqjxF3tcVsTHx/KnJcT?=
 =?us-ascii?Q?ZunH5yl/H55m7hqd5RAV2iMG1OwFULEbSgNpru7aHPzBvPEA5enCKPYFx5ta?=
 =?us-ascii?Q?s/5Le0uDm2zijFgNSqLxjw2eiIIuVLyPnfolGOZBi73xcacRvw5fQqmgsdnZ?=
 =?us-ascii?Q?F34/HIBOnF/gEWyXomnoYdctcB6MOF2Kri25nParwzAmOySpqW4V/IQnGQ7r?=
 =?us-ascii?Q?mzSrJz4ITRXQK5+4At9t/8qPGDKiYmKiGNVJTjmyfWqAK46QKrVdzdXB0+Vz?=
 =?us-ascii?Q?RanG4v4HxnUB1Ckg27Vmj6LWAlP6sy1J612ylRw+zxh1POm4Sce32Fo0JmRV?=
 =?us-ascii?Q?1q+RrPBNm3KCE+PBjNrDlyL065cy8AIHxmnhP6abGtFLSX1SJDaguRPi47Bn?=
 =?us-ascii?Q?7EM5k9nZYBOc52BguX9qf1RguafN76ikpBdPev4SN/Cmwsh1/lbSK8nYqjWt?=
 =?us-ascii?Q?GFdlbVhMLkSyF4iKbPE1xqtxiPEYNONv61k7ssjC826PbReL+d5Tz8NCHESV?=
 =?us-ascii?Q?EPFhquDPYAdkHTqVfFbkdIndDOJ186lgqWOdUT0qex2jDGjBMhjKdHo6+MmN?=
 =?us-ascii?Q?bmJaCv171rFAbPDJ0uj5LyDFrMUct9vZKKkEjfoH8XwzZipPuVdYTNm9VwcB?=
 =?us-ascii?Q?Ymgly/lX2Qv+C+5U537C9gdWXNE8t6WzgRQ75Vyk3Nij2qODHSJD6os3SdgH?=
 =?us-ascii?Q?2cHYt3pJ1ieCo4pM/wwyzUtJebSzPq2GbhM4uBMWz+tHNe6UQtoKQ09Ir3mQ?=
 =?us-ascii?Q?1w5LkWb+JCYgvp4n7Ubq9ZksCxUGip6dVN/YR4xRFfGz3Nfba7Hi63+LB1Ni?=
 =?us-ascii?Q?k/y8u1WmEEhk1WOfWyImfTdhR2XuL4WYqRS/zcq9oFzNXfuYzarmQ0P00GxP?=
 =?us-ascii?Q?ox3eZkd8Crijjxgs/HgmaAGjpwwIpls/R7R6anGnPDOi+AUQYZnMoZHk1FFT?=
 =?us-ascii?Q?Alna1aXdlPKG3xFNPaCfAVEas3OoiR+MsMXCUJ7f3NedxLl/7rYC7DHJv+I1?=
 =?us-ascii?Q?lRyz2fbIG2ZMMfe4vxcb2Naqd2haOEtvTxzgBhk2DANyFpigX0bRyGtcQQKe?=
 =?us-ascii?Q?WMmAuDKmUPTQ/jvsjk4WS88sdpC15edupnZquVNvK3bnUdeWpofFdmzO732O?=
 =?us-ascii?Q?FraLZLLMlWaIi1xx5KoWcDCg+x2EtzHaCcbdTGXu1w8vJbQH2pYwkQk1Lo1E?=
 =?us-ascii?Q?dJf7YJoI4bo4CO9tTJo4B1Ybid5LGcewouXkkNzSZz5elb6U6EDXCvXZFOuB?=
 =?us-ascii?Q?86Wy8n+UoBcf/EeSasiwtaONRoBO6OHNGbJ2U86vWXlpoVs9UOPYQ2wx30X3?=
 =?us-ascii?Q?yQ5TlEqZKTUIgf/O5n/iNK/IDfVh0u0kJ21/Gs/hCXj/cJEw/NLhlt2FL7vT?=
 =?us-ascii?Q?D2i4TKvAWqRDtFa0NzOaQiUB1sDaVp6ah/uS+2o6V5v/AsG8pZ1pg99ST5B2?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd7fac8-28ca-400f-dd09-08dcdca8b178
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7512.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 14:53:47.0842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEWhovU8BNT3nft/6BAg1te8aGVwgfXQ9KyqdI2uqAfSUZbPJPK0tnGMdQW28RESz7v5JvQ19u3pjyAQ6wOP4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5569

When reading files, it is actually only necessary to read the amount of
bytes specified in the FDT header. Any trailing data that is not part of
the FDT is not relevant to the operation of any of the utilities and is
discarded anyways. Stop reading when reaching either fdt_totalsize bytes
or end-of-file.

Stopping reading before end-of-file saves a considerable amount of
memory when using FIT (Flattened Image Tree) [1] images with "external
data" which are used by bootloaders such as Das U-Boot. In case of FIT
images, the FDT is a few kilobytes, while the actual file can be several
megabytes, which is quite a significant difference in memory usage.

[1] https://fitspec.osfw.foundation/

Signed-off-by: Andreas Gnau <andreas.gnau@iopsys.eu>
---
 util.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/util.c b/util.c
index 507f0120cd13..093303078d5f 100644
--- a/util.c
+++ b/util.c
@@ -249,6 +249,7 @@ int utilfdt_read_err(const char *filename, char **buffp, size_t *len)
 	char *buf = NULL;
 	size_t bufsize = 1024, offset = 0;
 	int ret = 0;
+	uint32_t totalsize = UINT32_MAX;
 
 	*buffp = NULL;
 	if (strcmp(filename, "-") != 0) {
@@ -257,7 +258,7 @@ int utilfdt_read_err(const char *filename, char **buffp, size_t *len)
 			return errno;
 	}
 
-	/* Loop until we have read everything */
+	/* Loop until we have read until the end of file or end of FDT */
 	buf = xmalloc(bufsize);
 	do {
 		/* Expand the buffer to hold the next chunk */
@@ -272,14 +273,24 @@ int utilfdt_read_err(const char *filename, char **buffp, size_t *len)
 			break;
 		}
 		offset += ret;
-	} while (ret != 0);
+
+		/* assumes that the size is always stored in V1 part */
+		if (totalsize == UINT32_MAX && offset >= FDT_V1_SIZE) {
+			totalsize = fdt_totalsize(buf);
+			if (totalsize <= 0)
+				/* read file up to INT32_MAX in case of errors */
+				totalsize = UINT32_MAX;
+		}
+	} while (ret != 0 && offset < totalsize);
 
 	/* Clean up, including closing stdin; return errno on error */
 	close(fd);
-	if (ret)
+	if (ret <= 0)
 		free(buf);
-	else
+	else {
 		*buffp = buf;
+		ret = 0;
+	}
 	if (len)
 		*len = bufsize;
 	return ret;
-- 
2.46.1

