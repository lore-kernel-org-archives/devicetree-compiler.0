Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793901979;
	b=zAAiggm8DCSC5Xb3QO3Mk3JOKxEON4DIH67vyJN9oGg/XRpbFpRoQONNuKqdXFL3LOim
	 ovj0L/2u0/YB72IkG7R9WNueIMsYLHC6t0qAgX8ZDaA2TWQaeKxt9dOVbET1G9hayvyjq
	 UN/r5uXeuGl/zEVQT0/gYG5vZy9ZsWDKSfwJibhIu8VwepvtZ9MD/rVgmUJNgOmQAk6a7
	 arg1U3sHEeVgwW3j4k/SQM/S9KJoqWVb1ndls/uKfc2JMtAhi17S0STYzn9LYeDjQxexH
	 SWe9CYkg0xnxvgw88rcEJU91bnfOrUSm5UtmP13JRCqnQYd8AWlEPtt+zXToGfaedow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901979;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
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
	bh=aDowTbKVDZpL2bqPHt468Xwq57i3mZf3pVMdCHcuuoQ=;
	b=tbHKFLKlo+QT+KO4nmqqHgorzsuAr6P5c+Hsxa6TWAq2xd5sWii9nnEjT8E7UbMbTDEz
	 am/tI8YELzbZB9TeXoklMht+rDBYPVqm/HtAfcE2g90rOJa2opJGPF2u/kkQ/36pHJq1n
	 QKOR1GbYrX+sk8RebkD8eBb9d89zV6sx40PIBUoyETIkPdqHczqBuRHo3wJWUDwp2GxSY
	 8gNVUOzd01O1Ar4kQFy9FSV6boHg/exgWpjcw/r5ISMWQsb0e3XoStL/m7UQy9I6Cx0h2
	 HQFnTPcgFzj+Pym3jnzphbZvc2bYnGzK/X+pWfQtBZPueYpcQgilMuNATU6zmxPKT/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WkIJjyh2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.48
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A50606A326
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Nov 2026 18:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A50606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WkIJjyh2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKCI+DtXmAfxZWTlK8fAFV869xF0n7wajO50bcP5Gj8Au4UzROk+BTitobgyABJGP5Wb3rLOhRCPzavDCIHcL+GWybQssdn/gM7Z/rwI268LM7Gw2ppqng4dee//z4OqLJ8ebiC4umsb8T08L+ENhhVj1RQKt94t60SYdql83bSsHXDnu8L1fVDapyFxLjkOoV3gucwdl+wqhvcWLV0YQOM8JF7FzRJSLk5GDP7erQ+12chm3GadbK9VERVTNkamlhBgHFplmmH5MtKS19AHSK2wU2P4mlSHAK3wRLLzyJSEQzDqgcENJDOVEYIkm9GN3qiCJJwoyCRs3JemZbKTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDowTbKVDZpL2bqPHt468Xwq57i3mZf3pVMdCHcuuoQ=;
 b=EYXEU+0BodYbSWXt0/20k+QEFzB9bugaOF7bdqOVQagh/azE+S6qC9/+47njrUwhsMHEQeRPO/sdHn2u+t8Kx0WZdk5Kox1vHvElNYCoq3lFOma9iz2t5T1Iasa9qportE2c5SLOh9s6d87BZFy7sEarwDkA+xXSWovwU8n6wZnzQsPo/eqKHmXwdop8uZnjvWy8Xzhz01+nvVTr92PYmPdmaBNm7AMK/JYTNIap4whQMbi4QkISiMWr4Uo7LQSQ0hTMGXaWwpEq67jwBtGt0OZy/yA8u0kjtBNksC/u8mTXl7Nc/ViiXteKk29cVoyrQN0S3lAjekHqjmueqztFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDowTbKVDZpL2bqPHt468Xwq57i3mZf3pVMdCHcuuoQ=;
 b=WkIJjyh27cHZ8wVM0Xera6R1smr7ob5HlYcDdWIOJLJr5Gqer+Tkd79Ebd+CA1Kq8vAP3B2GIwXu92UTV7iDrhxzz9ri/zrCc5JmhQZdPBWdbQIsncHmcUkxZ6kh2Nkv4E1EQPhThFv0Rs1M0E/bw2/TE7zl8F6tGAGieSrNxtg=
Received: from MN2PR15CA0051.namprd15.prod.outlook.com (2603:10b6:208:237::20)
 by BL1PR12MB5970.namprd12.prod.outlook.com (2603:10b6:208:399::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 18:06:08 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::69) by MN2PR15CA0051.outlook.office365.com
 (2603:10b6:208:237::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 18:06:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 18:06:07 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 12:06:07 -0600
Received: from [192.168.1.21] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 12:06:05 -0600
Message-ID: <64db946f-4ae8-44b7-ab79-33e2509af387@amd.com>
Date: Thu, 5 Nov 2026 18:06:00 +0000
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] libfdt: Fix fdt_get_path() reading before the start of
 the buffer
To: Simon Glass <sjg@chromium.org>, <ayan.kumar.halder@amd.com>
CC: <devicetree-compiler@vger.kernel.org>, David Gibson
	<david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>, Herve Codina
	<herve.codina@bootlin.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
References: <20261030170602.2142997-1-ayan.kumar.halder@amd.com>
 <CAFLszTjFZ9x-O2S6AxixSC3ub_qKv+sON=2Bd=iriKc9021bzw@mail.gmail.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <CAFLszTjFZ9x-O2S6AxixSC3ub_qKv+sON=2Bd=iriKc9021bzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|BL1PR12MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8011a6-4890-4519-d3ae-08df3b67771b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|7416014|376014|22082099003|18002099003|10067099003|56012099006|4143699003|11063799006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261102123227099003|261021121427099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	BfyxlSQanu8KaRLV1lfgQrmseusZhD1otg/H3Z5WYNPfbuMCSqzrUzs5fzvsLOZAk8WeSkdttATv2ir8xAK1M8c17jXgxYIoL7gGlROCWYHW2Odj01jt77deqR9qfQqD8+15cpwsA8sUrWV+9KOU4haBfCc46JDf+WPP+oD/SWvJPx+qT/NeeuWUQaLtUksA0jxGMhk6Wz/7/CzbzBZn4Ny990csmPOEruvc2fiEYkQKDYDKcULDT7CbTFeyfsCaDr5VX6x1YehrqrnMDNjzMHpjnueFOgazRGMghnfunAS2t94NEfLGCWbBjGfpzLpALLrCaIjPmR8jSGIvsvsM8BEUWcAjyS5lMEOh+hd5QBbye4hWLiKVKR+pdKBBNuh0sQRCrUcJhhvG0yXftt+9agdqiwrZSBlWKvoaJulPYvr8KD00m/O5/3jp1PIF+sas+ZBNuboi4uQhnNlLuHp1wqbG1LVK4NVzr2GeeU/CiE2NpwWla3UWnqE4EaAtN06rYZDJaRlzk/l9k3CIdEe1LJxj4kNTD9gMlas3M3IAvVqL0NbLMoax0/BEET/hP7Ql6BlVLMF0EgA9H2+mXaP3GnkkteDcaTh8pF7RX/RoetuB4NPlRzjQ8Ums/8WH7Q1WxGbo1XWNkZFhD5NYV3KAa7/lqeX37+a/0ztqkAo4sO+9gPSc/EQg8c0wn8NthVFezqKNOkgNyBWDbkjYKXdn8g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261102123227099003)(261021121427099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4S/vpgOjGqWjZaegqghFiovYR/D8mcgLwpjl/CnG5PrviXEsAn3Y2VMTxa6MYKcNnKGKlauQq222WfED9FS1TSL4vjPrGID0svv2n3d+kC/mLIKH4F3/Fy4FGZgPncVrp9Q/uCou0RF6uSAQVRqj7YbTXO8Uf/Kajgbm1M8aI47VgXvi6Pq0UXFwo4GUhOArJ+uDa82rotpGJQKYmA56rP5bzSvnuTaB9vRCixz4nVhFXR9GMJ2ZHtQEhMZuipuLRawDFjWNgFeXi6UMN8W/VKxuVZsKNog4nvwNfuJFd7GYR02QG8wW3WYzDrUPRSjsUxKAr6xwxjioUJY1a61996x6ZY1/xpgqpFgR9FsiPaGgSJmhQBbRfJ3UI7kEeG3h83JC6hJAWasuAbkv1IBas6MrxIsUCsDfiuz8p4zQ6e9xBLSwYNWJ1U2RCbXJ2oDL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 18:06:07.5438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8011a6-4890-4519-d3ae-08df3b67771b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5970


On 01/11/2026 18:25, Simon Glass wrote:
> Hi Ayan,
Hi Simon,
>
> On 2026-10-30T17:06:02, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>> libfdt: Fix fdt_get_path() reading before the start of the buffer
>>
>> Asking fdt_get_path() for an offset past the root node's FDT_END_NODE
>> tag makes it read before the start of the caller's buffer. Such an
>> offset is not a node offset, so this needs a bad nodeoffset.
> The last sentence reads oddly. Perhaps: 'Such an offset is not a node
> offset, so fdt_get_path() should return -FDT_ERR_BADOFFSET'
>
>> fdt_get_path() trims a component off the buffer for each level the walk
>> comes back up, comparing the components it has against the depth from
>> fdt_next_node(). On leaving the root node, fdt_next_node() takes the
>> depth negative and returns the offset just past that tag rather than an
>> error, as commit ce4d9c0f ("libfdt: Rework fdt_next_node()") intended so
>> that fdt_node_end_offset_() can find where a node ends. The loop only
>> tests the offset, so it runs once more and tries to trim a component
>> that is not there, scanning back past the start of the buffer.
>>
>> Stop the walk once the depth goes negative, as
>> fdt_subnode_offset_namelen() and fdt_node_end_offset_() already do, and
>> reject the offset up front with fdt_check_node_offset_() where input is
>> not assumed valid. Add a bad-offset case to tests/get_path.c; run it
>> under valgrind (tests/run_tests.sh -m) to catch the read.
>> [...]
>>
>>   libfdt/fdt_ro.c  |  8 ++++++--
>>   tests/get_path.c | 30 ++++++++++++++++++++++++++++++
>>   2 files changed, 36 insertions(+), 2 deletions(-)
>> diff --git a/tests/get_path.c b/tests/get_path.c
>> @@ -63,6 +63,34 @@ static void check_path(void *fdt, const char *path)
>> +static void check_path_bad_offset(void *fdt)
>> +{
>> +	int offset, depth = 0, badoffset = 0;
>> +	char buf[64];
>> +	int len, i;
> I tried this test against the old fdt_get_path(), i.e. with this
> patch's fix in libfdt/fdt_ro.c removed (both the up-front
> fdt_check_node_offset_() call and the 'depth >= 0' loop condition),
> keeping only the new test. A plain run still passes, since
> fdt_get_name() fails on the FDT_END tag and the function returns
> -FDT_ERR_BADOFFSET anyway. Valgrind catches it, but only because the
> stray read happens to land below the stack pointer ('129 bytes below
> stack pointer'), which depends on the frame layout. Please can you
> allocate the buffer with xmalloc() so that valgrind (or ASan) reliably
> sees the read before the start of the block?
>
>> diff --git a/tests/get_path.c b/tests/get_path.c
>> @@ -63,6 +63,34 @@ static void check_path(void *fdt, const char *path)
>> +		len = fdt_get_path(fdt, badoffset + i, buf, sizeof(buf));
>> +		if (len != -FDT_ERR_BADOFFSET && len != -FDT_ERR_BADSTRUCTURE)
>> +			FAIL("fdt_get_path(%d) returns %d instead of an error",
>> +			     badoffset + i, len);
> With the up-front fdt_check_node_offset_() call, all of these offsets
> (misaligned, the FDT_END tag and past the end of the struct block) get
> -FDT_ERR_BADOFFSET, so I don't think -FDT_ERR_BADSTRUCTURE needs to be
> accepted. Checking only for -FDT_ERR_BADOFFSET would make the test
> stricter.

I fixed the patch as per your comments.

Please have a look at "[PATCH v3] libfdt: Fix fdt_get_path() reading 
before the start of the buffer"

- Ayan

