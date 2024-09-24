Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2092.outbound.protection.outlook.com [40.107.21.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780C81A7249
	for <devicetree-compiler@vger.kernel.org>; Tue, 24 Sep 2024 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189649; cv=fail; b=DWpMN0/nvsMr9qUgUUNCIZMZ1pYHDFiYP0rrvohhfKlUyLMSCEQqqAncPj4NrKZeqttIIrggHFLptVDBO2I1W3IA3yFMg2aq6DUHA1sDnyxS1nm1hYsHY1btcJtba6yjyCqPyBG10ml0qOadIsLHQpCvkE2p6oGK3o8HaZT9dR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189649; c=relaxed/simple;
	bh=l/XU5UMQ241S+ZkXrK9R7j9X2UlcRtHHB8qRlb10PiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Go2p3VgfUjh6yMVTfAFsY1TQLXZ/9y8LKrBumYBaVSloHxlgJVpZL79B7L1Fnqw3YGEzbz5fyhETBZw9sYWxOU5Wkn5l+wbc416Ls6cu4JAsF4HKqM9ns9tI/5JH8QXsDFuRDnylLqr8jUIaRtg1WJpKROBNYXxZvt49wGQpleE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=itu+3Ahn; arc=fail smtp.client-ip=40.107.21.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="itu+3Ahn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+cjZ9b6vUzXOYJWhqzaZuDPHisJsl8NF0QhgG9tfPhKgZbAC7FaMxGpvmiTvxnvYZRWPlKv0+djv2TYAFBzD6rID3we7cV5vTz6OX6Z/5htYmgQdAtqBvTYjtDh/Jh7iB6FpTuYwUEKic8yV4nTdGQc/RbcsHABO7hRA0QnPGkcj+jEtp3BV+eQKpxALlCJAxL+z04Kuu0Iwma1ANEG8nskxcctHB+XKsMloZo41vqdgIACc6FCfhrAywSZcQI8933uWbxjJVQVJDeA82/u0ig4VzumPDSCv7mXHrG+veIQrYSi86aSOB1G4A3ePYJ1XQ/sgPBF6AQnBe7+CzcJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/G4hUf82gujNUoXBnD07Wy9OsmPy/ycm2CnhK3xya8=;
 b=lsKWeGm8QUBjMVy9YtBY9xixBUKK2avdzY9UNmFrrJ7GnXSxQ6gFoihaUWvu7bqRN2l1V+Mdv235Rnkvd9jVKwadBoaVMQWf3s5KLl5rJtkTNc5MkHqevA6xIMs4M4ENaUc/RuPqfW9F6GROZ938lFt5H7fzMAqW0NDtSiOug52BU9Bwg5PxEb+0tXb7JoMjOxkTlt9jY0sKg/iOl9/hyy8rEKbkBMtVdVGc06NdixBPu5ruY4kzgxyTTisHIiYt4RnDcHI4Z4XZcPbHxLvx1mYHylI8qVmygHcGx9d0ua0CQPpW1gKjpaNMwUhBO0NwEpjIRZmVQBn/TuSdtj7T9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/G4hUf82gujNUoXBnD07Wy9OsmPy/ycm2CnhK3xya8=;
 b=itu+3Ahnykeo5VYqDegrKKvxropasppSSovAANMdZsdxTxwsAf5Ti4ZYe9h/LHgVCt4yih/lXH93Ue3WEYrfo2BS33NwDC876pNg53LFbH5ZUxvzFOWF6YiUCOca4uegbTVx7Wi0065L8HXjHsJlCX55re+O9zDAPY/hnnwBgPeqGpi7dlB+5VQ8J0g38f7bWqZ8LoGz1nIrZsokLv8XsDTPhQdoH2fEwpoxeyx49YS27PhFyXXeEFzNwo9GhruyC43YDzNhUSTrcxqxSAHLCbUHqL/YzEc6ie2KLs3rhbspH0780maJSCwS3xjwz2nHOctyQdRBQw6+xQagPn71og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com (2603:10a6:10:303::14)
 by AM8PR08MB5569.eurprd08.prod.outlook.com (2603:10a6:20b:1de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.7; Tue, 24 Sep
 2024 14:53:54 +0000
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6]) by DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6%5]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 14:53:54 +0000
From: Andreas Gnau <andreas.gnau@iopsys.eu>
To: devicetree-compiler@vger.kernel.org
Cc: andreas.gnau@iopsys.eu
Subject: [PATCH v1 2/2] util: Once size is known, allocate fdt_totalsize
Date: Tue, 24 Sep 2024 16:50:52 +0200
Message-ID: <20240924145320.613246-3-andreas.gnau@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 31da9700-6c72-4a2f-64bd-08dcdca8b1b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9sWdQ32adN5V4Vnrp3AeY4VeAVLeEqvAknXuxcyALDjZ1z2IeIHVXW52v8uI?=
 =?us-ascii?Q?4YVhGw/urwQARwbPdNV6Hq1gB8LSZZugzOAyVaFSdHAInEJyh/8uW0tNWO4i?=
 =?us-ascii?Q?j4qojrkbNhCYYmDqPtwYq2SW2vvJlSB+zzqjHFUXiwal8u43f7mMeOM2MOqL?=
 =?us-ascii?Q?kyF2tdCZEuLWB1WuP7hjDXp3NcEJpTKiaveGkYi86qlCVKS1GX6zfKn4+CXd?=
 =?us-ascii?Q?9jHDJEBCPc3RWql3PIh4P8C4wXZ+Nz8+8WFGB/9POpVSMQQCF/a0IX0VjeKL?=
 =?us-ascii?Q?xiFKeGXx/mva+RSVlxt2+0Hug8rtaoOHZpQmAOlTKAWz3NF34cILj4V9qblA?=
 =?us-ascii?Q?ZVwKrD1IUKsavRqO+uEeWJo6WKZt1Ee0AkMarlN0Eg1xTHs82gLhFLfbtuYB?=
 =?us-ascii?Q?Rj80+nAOCrjShPizpzDwa7X3yDkmOo0z87V3PNMsU0XxmcHjabLEEOA2TrcJ?=
 =?us-ascii?Q?xyfi60BQeOHA1nqR2Il2RYzJBGKr52KojHEHDF8JYfxGfbwGasFpBmQg13qS?=
 =?us-ascii?Q?3y+cxzvkK0DJu7Orsx8wk+XlqtyZjviYD+jTys3yhDtWFJz+6Hk3ZzWpG66O?=
 =?us-ascii?Q?y4vYtFwhytgKFKnQFTH9VNzEr2RDuVLNxKFWF2MavCYGFypGG1mKgedEBmb+?=
 =?us-ascii?Q?JcwsaO4sX+J5MydQCo9vYy94t6JOO0Exwb7NtzVAh4CEmL85VyHaafiRZegu?=
 =?us-ascii?Q?QMuLrfYpUgmJvCT/nyTxVYHITX2RSGanRl0rTW1IUmfZ2FI6F5m22pxeSLfb?=
 =?us-ascii?Q?r14DNifcsBD8UMU6O8OOVxP9jMbgbbwfkpWIaCbuJ9/9DruPhHPWdAR0fvo+?=
 =?us-ascii?Q?mSz8kobKVa7uh99fE6IZXFDY0jmiAFur40BEvQqHuC218YuZsxGNY8qjIPWz?=
 =?us-ascii?Q?7qsuA70M3AHqU07AYIMG8fS52QKU4UWZHecq1janRgF6RtxTIrRIHHbBPPYr?=
 =?us-ascii?Q?/Sab4gMPMJx00x7sJILVzf2cSqOtx/fV/iEEckGRjEIrHOk8TlOs/Op89fFx?=
 =?us-ascii?Q?QVVA6+H54eJrDFmIQ+nLRoG8uOCy3Gy4Nr8QK83EZkkugGyQKpkz5lXWJSj6?=
 =?us-ascii?Q?hr9iRsgEeWrptsbut9XOD4Uj8QzUEyulhEYcvElG8HDsztTK7YdfnKznY1SL?=
 =?us-ascii?Q?B7Wd0OmhGC4KTJ02pmyhYj+2TTT8zWeoL1MLfnXP65Sk27PXxYnnJyaKof17?=
 =?us-ascii?Q?Ip6PXmBPW5XUXb3IyeMDnmmywYMpwJ42mF4KJUyDb5apvbEh+ypadEUVGCsk?=
 =?us-ascii?Q?2t9k88eEOSpdNZrESv4g7OWgumJN/l4VOoSvjTTRyTzD9/XgPANx+kdkJXsI?=
 =?us-ascii?Q?J2I7sHDMUEhLJjOO6pcfskHHRDaeCKu5KlRxPltRdUNp1wRYy/XAGKFrz0p1?=
 =?us-ascii?Q?YjdYIqLD9MwT5bWIP6PY8KaJnCTuRHYRgYp1+GVkUXox9AC1Cw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7512.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W2hVwSMxOudXGKeWxBzXAQd4P4DcP3l7FwZDxrCOAWOUWWaPT2kQbexxf92f?=
 =?us-ascii?Q?FUduJji1zC9o18058ZGXCYqoMy9W0D62Jent48fI/rP5Qp3642Jvy7mYS9vZ?=
 =?us-ascii?Q?iEbkMG7xn2Pet4oxJ2wgqR4oHsemr4CMNGzk4fIB2bIW4UfXmQUi9/xtd9fD?=
 =?us-ascii?Q?vkEvO6ZmFpn7Vr3yGjnXIb647KUvHyZkBtTipfeQI3S7jJMdQXejkyoPLb+a?=
 =?us-ascii?Q?zYCIt3fXPn544e972u+yIqXjvic9V9tP8d+KbyySXRbCA6nFhEjy+o8VxTNW?=
 =?us-ascii?Q?zwnlNDVNbjHUrGM/EKmywYgal/q6YOlZCYZyqpmI6xy7mQYkIgxpAszjEJVm?=
 =?us-ascii?Q?jdhXaN3csCG4bxK8XsnN20FulZIKVRPphDu14WGI+DhHWtUZikrCUrSCmveD?=
 =?us-ascii?Q?DnTVajlZ7j46BbDh3SrMpy64R8VXel8g4w4GK/a6ll6zl4hxoGbfkw5igCas?=
 =?us-ascii?Q?ZOrj3KDS2YBYaE1QuhRHQ+0Q1Ai5GYMMhIqqQdGRbiS6nBbip6qkAc7yDid0?=
 =?us-ascii?Q?y3Zh2fwF5nr4qKOcS5atP2FadtlVicbNLAeh80GcRvoH0V+HFzhPv3Cn6Eb2?=
 =?us-ascii?Q?cCfteXMaHOZI4BWfvKthXNYtemj2sBMtB1zBcihl3GdydifZDz4/rS6lW0wZ?=
 =?us-ascii?Q?bbtPeD2OkSyQJJSPj+J8F+w9KZqpnUTKn0ekl1EnlID8+DC8+EqZEYNlj1iP?=
 =?us-ascii?Q?u30AujmSreDxufD9Y9Cd/axUIGCzgOJEn4hb/g9gDHJtPcBlcU1+W4HGa3Ou?=
 =?us-ascii?Q?cd0m7szd48T5PPvS+zyL/Vf3p+G+jh0c4KJPnAlxGR247K2iIG8LWxsLX1my?=
 =?us-ascii?Q?yPemnU3cOTjGvz8Qaot3yIuRVaYYtZOVoDLUyVvH/vOXdIjDe1bQGDS4N8Dx?=
 =?us-ascii?Q?UbGhRpTlA2G/SB7bqYjdaf00JVLZT29JtO+ESEdL6nGhdmgZ+8Pc5BmURXhK?=
 =?us-ascii?Q?YIgS4pugOynEiQ35DFSpyxhBQQBa6DIXL112i07pJjidLxI83JBWGpnFNnOE?=
 =?us-ascii?Q?PftjgLpRQvfCeTp9vZkLFbgHSNJ6llPWFRI0GOhV+gFIoLbohURR48Jdp51/?=
 =?us-ascii?Q?ZsIL0D45KBN4gQcEflBRj7MLetPXhOaazHHomIj8jHvCIOVQre9YDEr0YRvQ?=
 =?us-ascii?Q?5r7kHtz9ArYfMsNmfTielBAJ6VXuco5Jr5YyJk11LZrOSmqj/3W8+Z6Fi+7S?=
 =?us-ascii?Q?N+i5WBeddxYYaYyfhk98GC4YRIyw43rgxX3jofOLXN2hEVte9OdjCXvH9D1C?=
 =?us-ascii?Q?Il2nBgMQoQ5eKlKOo1dsBKWkrGKULfyydhCb1FzvMxBdJ3sPaq7xm4rusmmB?=
 =?us-ascii?Q?5pSak69yDcSs5ky79+o8+QUf+S0Ykk7dF0UwAX5z8Mv4HYYh7xu4xw0dU9qC?=
 =?us-ascii?Q?6gs+PSK9rMKZMnhQFTX3jyX9Ed3nqZo5SrPdhM2w8j09CznGud46vlyemMz/?=
 =?us-ascii?Q?UP280iy902RORlzPuxDF1xaeczzvhd1JtAb3sOgEieOagT+/wdVILjIUxJyd?=
 =?us-ascii?Q?0XVO0SWiDzPjWS4E6y5GeKgGurGvhKjd/reN7GMTy7XBTOGrRE9BxEYszi/Y?=
 =?us-ascii?Q?uQG0otZxXl4f7vUwZcaJXijInP5uTX5uEBwSrHf+eDQ+6RUpcwkdRnar0woD?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 31da9700-6c72-4a2f-64bd-08dcdca8b1b7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7512.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 14:53:47.5586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrPoqjTn48kk7W2DMEbO/XrKG6pZCdKum9XzuXUoqS+VCR+ZyTbg+2ut1DXcHwzwUc+2AwBRUQUmTfUX6ZScZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5569

Instead of growing the buffer when reading a file by a factor of 2,
try to allocate the whole size of the FDT once the size is known after
having read the header. While the size is not known, use the existing
strategy of doubling the buffer's size.

Since the initial buffer size is 1024, which is greater than
FDT_V1_SIZE (and any later version header sizes such as FDT_V17_SIZE),
this reduces the number of allocations to two (one for the initial
buffer and one additional one for the full size of the FDT. The total
size of the buffer will be reduced as well by up to
(fdt_totalsize / 2) - 1 bytes.

Signed-off-by: Andreas Gnau <andreas.gnau@iopsys.eu>
---
 util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util.c b/util.c
index 093303078d5f..c5873e91608e 100644
--- a/util.c
+++ b/util.c
@@ -263,7 +263,7 @@ int utilfdt_read_err(const char *filename, char **buffp, size_t *len)
 	do {
 		/* Expand the buffer to hold the next chunk */
 		if (offset == bufsize) {
-			bufsize *= 2;
+			bufsize = (totalsize != UINT32_MAX) ? totalsize : 2 * bufsize;
 			buf = xrealloc(buf, bufsize);
 		}
 
-- 
2.46.1

