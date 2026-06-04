Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7363B0AD1;
	Thu,  4 Jun 2026 21:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608658; cv=fail; b=hMKAlF63h8FvZZVvqzaLks/Y69dumQGCfa72cMZXK8DkeMYv9w3drcue/ejlubztruar0RrVCPvZIFK5clPjuSXRA9E1qVThPPfJwsbgyR8fanAA2WI+hDWcOUDGfG2QFCTHnh/Mkzj0QbdNx4T6uYD2u9PgsoeUwf2OWPL6NNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608658; c=relaxed/simple;
	bh=UNuRvTA9bFs/KWN/Oz3+bnDmHFAxGMZtMc9+0Ba/Ldg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fGBc1DhKYZJ+VGozrDQJL8q/smCTzFZFwvjwxL1y8EmLzklRb+eaZj61QrJn1tIkUuPJv0tMAqeZujDOGeUoEFr7Vds9JomBIvN97Ll6gZn+pzGc+tfeW7xIDRr3OOf0m2fkixiOpa5GhTsTWAsySrCSf6tIa/Joz09DIbrgQ0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C+2/gf+l; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C+2/gf+l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydYW8WnmtGSdCpTbMiU6IYQpqyQ3R6ZfOCLdQJS4+OByBIFW4gYb0RfSUA3jQAP4x7uNtCoXkpLW2MaCyxqtW67mg2vECX3CiEqcRqGZcWQs26dNT7sYXRHFw/vFOVWqwhKSDlpNtqfDtXxbiztctf8OLqjCw4AN6BlhWGdoL9D7zkoIuv0BF0+OwU43xh7uS+I/jMmpfpI5V9aMo1LkoG7lL7IMMmUJohuJu1J10F36naPZNhLmO2gpmmwHKDRiOeEwFGXT7Tnruwvee6sGYDT8jGJtWAjdMnwDwN/yLqfeCNnH+C/ZNcQ6muN1bJSdXfs8ndknlnAgpCRgLmgXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98JeFOxzHLJEdqb85h+OJDJ5hbZvNXjAizQ4iKL8NL8=;
 b=wOBkcUf082fsm0u4KR3Hko5L1IbDfE//Us/l+Z7CBghg/qZOq2r0zn5du3sOpwNHzoT1Zuxz/69G1ZWtbUh0U8i3CiH/hdFt2XxtlfmuYXwlb6eMVNPq2PVLKhQ7M7SBB3UPCynwV8cqj6fF6MCQard2SZ3E/G106SlUafhKXuVhp0Q4zxHtaGAw5yyDGwGh0z32pGHvW7lZt4K7HVQfLVWs1s3kfTgieCQaKUspuI5lmeOinfvgy7H7XkKEz4CNVvOhXL6z5AcrBPEJwNlY3KeKnnNnhhjPlDME6Y9T2roWFdWarmTsMUx7kJVzrhzs+Ocsm8upsVFCoykXOOFvWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98JeFOxzHLJEdqb85h+OJDJ5hbZvNXjAizQ4iKL8NL8=;
 b=C+2/gf+lU8okXPZW6ynVKmFPetrQWxqiCrCMCIVOhQ4tjGDsD1oTklstoXv7vFQNsrqokz9frIbTgpBeQkvJh0LTH7KFgdSk7XjAHrUpWZ52qfQGk3DH1G9p2gpGXK7HwjXCws7pOJ2PJ1CMYoUSAwNH5S7vFLyt4IIfc4iX1xT/mMZ4hnp3XjxdJQxER2lJ9xoO70ORR3725r+1XMbI9ZD99ZT4OCzT9wujQws7xnkRosXyqV/Mtz5m2mz0y/H8Kf6K3vwOk2crgMAdjgSS/FwR3qsdOO+vj7XlZI8PHDwAb0smrfxxBmbxgQtR6/N54hLaYY40INDzBOU9pi6Ypg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7866.eurprd04.prod.outlook.com (2603:10a6:10:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:30:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 21:30:53 +0000
Date: Thu, 4 Jun 2026 17:30:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 09/10] libfdt: Handle unknown tags on dtb modifications
Message-ID: <aiHuhzw8dobIndls@lizhi-Precision-Tower-5810>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-10-herve.codina@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409115426.352214-10-herve.codina@bootlin.com>
X-ClientProxiedBy: SA1P222CA0129.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 498b388e-5877-4ae7-dd90-08dec2808e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014|6133799003|22082099003|18002099003|56012099006|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	qEzEM/v9yEq3QJhcrPCLDKajZed7E73JrKf5735bgI+iDVbKG8PbPWGH6GMvBmam2b4iHREZdNz0deF8iRFjIDpfFBm6KdKXfdZuu09Bgei9ynEdelelLRnVC1YKdQagi6KeMpM/uGfWdYUG21vSdvpY+PKXns2AjLXCYpKibhbAcAb+PhxwsCcfcnvjdzYoBnPDZp9+4IkWd4EzyoTL6Zjg2tJUYYyGySRYbQ7XQnEgffQEuGDTytQtlB7py1QF8PmgzBPSvkd9HhCcUAl8aD5fviJUNF5I2wctD9JS2ypB15bTvqOA3bIdIkOPhVTzoSbq0xGhAgUyZ9auLhxre6aHBXnk01Utjq16dUPBvAGztfXsjMqXR5MKACsWI2CRnCOEf59U97E5NVF6zyLumXAWtRljakz5JXLPcPtXq7/VEpbNYqpNlq6kzL2XpP5igZT40O3Z9hRSbsJ6LG0ixwSObXGqLKURA4fU5RidhvnaahRLCnzErDM+ddGpbp/lxiT6K3nFOqvT8texObjrc0sGGLPRiLarz5Y0ImIOOvmIXZOjHXQZmQ66H2VrThKLD6xXeyqF0FxvhBIJyNT4tPVA4My499Il7uOlVXu8izNtK8JecpocR2oeBwCW3APNm4XKSTqj9Okj3teRvJtq7IY9jBMAQJTiRFdlEwBvukSRTKSjrMo00QZAoB2/6/wJosNjk4fsgm1jlNOMUswuTMrouOEWY3KvQCG5mHdQShmJyHcfuZP9Ar2dg9sL8rOp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GlM94O9FU0o1E2PqSFH53OUfLDE6jPFNL008oHBNYXsqTD2x5ACbRabtqXsP?=
 =?us-ascii?Q?rl32YAqgixHtPlTcWzTTGt5nWNXllsiEY9Xw1IY0e8SqpU+Z0+VjYCcx7PqR?=
 =?us-ascii?Q?ch5KCqk6ClOMBFLCsgPhOgD7QhmJeP7Y9r4YwR/VgO1lF0EphfjPpABbVxo6?=
 =?us-ascii?Q?RZY0owP0T7dF4iCveQNkb552QNN/tZd2MI3uhaiIrnRafnCooRbAMFafctqE?=
 =?us-ascii?Q?LVfRu40ZzQtfRoMFrgnpvBkQm8zx2fNZgfV/qWigvJKe50PF5fyPgI5PLTbl?=
 =?us-ascii?Q?h43a5+cjl+kULQTe+jiaJdQoG6b3NWR6UoDZOc7eliRrneEns8GpcIHATpmj?=
 =?us-ascii?Q?A4niGmJ7AFPeaMF+/nusQRp+HKDn1vtZWLeo/5Cd/K4Bt4/EWmKF253iZz6/?=
 =?us-ascii?Q?GgnGNfAtWHNi1GAOKHu/6YczLilrJEWDkzvUOwYHgbjTtdWWk40dBWZG15Hu?=
 =?us-ascii?Q?ozf11PAsDj61JUaAsVDk0Zq6iyG+b6SIISE9H82ILgJR1L3+QtN8YVgJe7+x?=
 =?us-ascii?Q?cYSXT5VE7H0NTNgaJz6QjfVViareucauTtsicDqFckYwGkoEze9gkt7To1jE?=
 =?us-ascii?Q?v+b+H3BQezGLMgn1hAK1mtiyQm6ucd1RNkYRJSRudffrVojDIE5+W5yJsYUH?=
 =?us-ascii?Q?TmOYrCRhPHHCGS3QO29EVq/9nTYLraixw9aDM+EUgEJwqkAdyEqINI9d9RC/?=
 =?us-ascii?Q?EhfwF57Yk+MA5nxVHBe4koWjWZdXMqoGWzjRDCgYrP9xFfq/QNYjis078d0S?=
 =?us-ascii?Q?GW6g0S8S/WCftbuLq8bTqzeQH262CM91oWcJtsQP+aBkcKHy4V3a/pcHvnpw?=
 =?us-ascii?Q?Su3+q7deMbvNg9rxel3p0GoXqVS/d30Pq8JDpC7npvBmFv1zEmxNO0vzjUxp?=
 =?us-ascii?Q?rQd4Nlso0WmDlwcgrNf7M3uby7Oz8gyuB9A3VxcrebSDXxINlA/+K1OimCzo?=
 =?us-ascii?Q?VyvVOeZpwF44h0Yx5efzQljVc5rIqamvLtnNLxnGdFOjQLDU4BZ4ql4TGSaL?=
 =?us-ascii?Q?JqYg68rTn+S4v6MSHzU3pWt5b79YIatCPf+q38lM0pPkbHRuWiuRh3PdJSgh?=
 =?us-ascii?Q?Bv7j5cVvd6Nv1gO40csH8lzOgrHEJaP5daQVViadby10hkXr/TWmCEkV9O4t?=
 =?us-ascii?Q?fcVS5JHmMMgskxt8i6XrsyKFfSIER3zVHW0VH0etMUmXQgp9WjW+gfCm/Dv0?=
 =?us-ascii?Q?B7UgigWiC6MVuOL9CzFU2repP1hVse+xiY+ILC0GrL4vvi103Nn6zLrSOWH4?=
 =?us-ascii?Q?+tUyIaHBaeHw0LPJeqv5ELmoKRCXOk2mlZb7qjprw0+rS2Z5q2kzoBvbL+CV?=
 =?us-ascii?Q?MWA0yRLRlNdXbZlT5T+dtEpLzZRn702qWbpC4bANYubJJC+xs93vsuBqoB5W?=
 =?us-ascii?Q?NvXbcHzpWxfByCC2+0UUO/5pM9j/BC6u2EEx3YQCfjRUQfNwSm1MQ/HCFB4l?=
 =?us-ascii?Q?XSZF6bjgBplO1+tE38pGhVOErW2RemcyuMD2YLr44qQF3M7pMD0PoxZDt44h?=
 =?us-ascii?Q?M3LS2yG0o93dnXPJh7Y0z5Zbx/tBVWAekZusS7IgPwfK6U5QJ+CFUsvTGnBm?=
 =?us-ascii?Q?TOIyB9P8FhC11MExlQMDo1P3xh5y2e13yUNi7j677dMfSbyjz3hPEMdj59Ht?=
 =?us-ascii?Q?eP/YTbub9JbpdboyopIo4f+/q+76OCkXL2gpN+qpi8L6Pop1JbxAqfJdXcCs?=
 =?us-ascii?Q?eE2FEMnl801XpjCB12sdjBl/UBMvGNUb47n9S2OdNtD3tSnFAPwnEsmSd9Cl?=
 =?us-ascii?Q?IVISWvSLuQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498b388e-5877-4ae7-dd90-08dec2808e5a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:30:53.5686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y61RhQNdL1hniBhWuhsBg35DQigSRZCeSC2cpAjYP5EhaP+LzsxmAPzXS0NsPVL4zUD/SWvb0rPZAXWz7FAhyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7866

On Thu, Apr 09, 2026 at 01:54:25PM +0200, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error.
>
> When the dtb is modified those unknown tags have to be taken into
> account.
>
> First, depending on the unknown tag location, the item associated with
> the tag is identified:
>   - An unknown tag located just after a FDT_BEGIN_NODE is related to the
>     node.
>
>   - An unknown tag located just after a FDT_PROP is related to the
>     property.
>
>   - An unknown tag out of any node (i.e located before the first
>     FDT_BEGIN_NODE or after the last FDT_END_NODE) is a global tag
>     related to the dtb itself.
>
> Then, if we are allowed to write a dtb containing unknown tags, the
> following rules are used:
>   - When a property is modified, tags related to this property are
>     removed and the dtb version is downgraded.
>
>   - When a property is removed, tags related to this property are
>     obviously removed. The dtb version is kept unchanged.
>
>   - When a property or a node is added, obviously no unknown tags are
>     added and the dtb version is kept unchanged.
>
>   - When a node is removed, tags related to this node are obviously
>     removed. The dtb version is kept unchanged.
>
>   - Adding, removing or modifying a property is not considered as a node
>     modification and so, those operations have no impacts on unknown
>     tags related to the node. Those node related tags are kept unchanged.
>
>   - The only modification considered as a node modification is setting
>     its name. We consider that this operation has no impact on tags
>     related to the node. Here also, those node related tags and the
>     dtb version are kept unchanged.
>
>   - Global (dtb related) unknown tags are kept unchanged regardless the
>     modification done.
>
> Implement those rules when a dtb is modified.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  libfdt/fdt_rw.c                               | 118 +++++++++++++++++-
>  tests/run_tests.sh                            |  50 ++++++++
>  ...own_tags_can_skip.fdtput.test.dtb.0.expect |  31 +++++
>  ...own_tags_can_skip.fdtput.test.dtb.1.expect |  35 ++++++
>  ...own_tags_can_skip.fdtput.test.dtb.2.expect |  33 +++++
>  ...own_tags_can_skip.fdtput.test.dtb.3.expect |  35 ++++++
>  ...own_tags_can_skip.fdtput.test.dtb.4.expect |  34 +++++
>  ...own_tags_can_skip.fdtput.test.dtb.5.expect |  32 +++++
>  ...own_tags_can_skip.fdtput.test.dtb.6.expect |  27 ++++
>  9 files changed, 394 insertions(+), 1 deletion(-)
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
>
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index f5c28fc..a8f53b4 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -188,6 +188,60 @@ int fdt_del_mem_rsv(void *fdt, int n)
>  	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
>  }
>
> +static void fdt_nopify_area(void *fdt, int start_offset, int next_offset)
> +{
> +	int count = (next_offset - start_offset) / sizeof(fdt32_t);
> +	fdt32_t fdt32_nop = cpu_to_fdt32(FDT_NOP);
> +	fdt32_t *ptr;
> +
> +	ptr = fdt_offset_ptr_w_(fdt, start_offset);
> +	while (count--)
> +		*(ptr++) = fdt32_nop;
> +};
> +
> +static int fdt_property_remove_unknown_tags(void *fdt,
> +					    const struct fdt_property *prop,
> +					    bool downgrade_version)
> +{
> +	int nextoffset, offset;
> +	bool is_unknown;
> +	uint32_t tag;
> +
> +	tag = fdt_next_tag(fdt, fdt_ptr_offset_(fdt, prop), &nextoffset);
> +	if (tag == FDT_END)
> +		return nextoffset;
> +
> +	/*
> +	 * Look at all tags related to the current property. I.e. tags after the
> +	 * current property and before either the next property, a sub-node  or
> +	 * the end of current node
> +	 */
> +	do {
> +		offset = nextoffset;
> +		tag = fdt_next_tag_(fdt, offset, &nextoffset, &is_unknown);
> +		if (tag == FDT_END)
> +			return nextoffset;
> +
> +		/*
> +		 * Unknown tags are returned as NOP. Force FDT_NOP to be really
> +		 * present in the area to remove the unknown tag and its related
> +		 * data. Also, as a tag is removed, downgrade the dtb version
> +		 * if asked for.
> +		 */
> +		if (tag == FDT_NOP) {
> +			if (is_unknown) {
> +				if (downgrade_version)
> +					fdt_downgrade_version(fdt);
> +				fdt_nopify_area(fdt, offset, nextoffset);
> +			}
> +		}
> +
> +	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
> +		 (tag != FDT_END_NODE));
> +
> +	return 0;
> +}
> +
>  static int fdt_resize_property_(void *fdt, int nodeoffset,
>  				const char *name, int namelen,
>  				int len, struct fdt_property **prop)
> @@ -200,6 +254,14 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
>  	if (!*prop)
>  		return oldlen;
>
> +	/*
> +	 * The property is resized. Remove possible unknown tags related to the
> +	 * property downgrading the dtb version.
> +	 */
> +	err = fdt_property_remove_unknown_tags(fdt, *prop, true);
> +	if (err)
> +		return err;
> +
>  	if ((err = fdt_splice_struct_(fdt, (*prop)->data, FDT_TAGALIGN(oldlen),
>  				      FDT_TAGALIGN(len))))
>  		return err;
> @@ -208,6 +270,29 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
>  	return 0;
>  }
>
> +static int fdt_node_skip_unknown_tags(void *fdt, int next)
> +{
> +	int nextoffset = next;
> +	int offset;
> +	uint32_t tag;
> +
> +	/*
> +	 * Skip all tags related to the current node. I.e. tags after the
> +	 * current node and before either the next property, a sub-node or the
> +	 * end of current node.
> +	 */
> +	do {
> +		offset = nextoffset;
> +		tag = fdt_next_tag(fdt, offset, &nextoffset);
> +		if (tag == FDT_END)
> +			return nextoffset;
> +
> +	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
> +		 (tag != FDT_END_NODE));
> +
> +	return offset;
> +}
> +
>  static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
>  			     int namelen, int len, struct fdt_property **prop)
>  {
> @@ -220,6 +305,15 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
>  	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
>  		return nextoffset;
>
> +	/*
> +	 * nextoffset it at the first tag after the node.
> +	 * Skip possible unknown tags related to the node in order to add the
> +	 * property after those tags.
> +	 */
> +	nextoffset = fdt_node_skip_unknown_tags(fdt, nextoffset);
> +	if (nextoffset < 0)
> +		return nextoffset;
> +
>  	namestroff = fdt_find_add_string_(fdt, name, namelen, &allocated);
>  	if (namestroff < 0)
>  		return namestroff;
> @@ -309,6 +403,14 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
>
>  	prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
>  	if (prop) {
> +		/*
> +		 * The property is going to be modified. Remove possible unknown
> +		 * tags related to this property downgrading the dtb version.
> +		 */
> +		err = fdt_property_remove_unknown_tags(fdt, prop, true);
> +		if (err)
> +			return err;
> +
>  		newlen = len + oldlen;
>  		err = fdt_splice_struct_(fdt, prop->data,
>  					 FDT_TAGALIGN(oldlen),
> @@ -331,6 +433,7 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
>  {
>  	struct fdt_property *prop;
>  	int len, proplen;
> +	int err;
>
>  	FDT_RW_PROBE(fdt);
>
> @@ -338,6 +441,14 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
>  	if (!prop)
>  		return len;
>
> +	/*
> +	 * The property is going to be removed. Remove also possible unknown
> +	 * tags related to this property. Keep the dtb version unchanged.
> +	 */
> +	err = fdt_property_remove_unknown_tags(fdt, prop, false);
> +	if (err)
> +		return err;
> +
>  	proplen = sizeof(*prop) + FDT_TAGALIGN(len);
>  	return fdt_splice_struct_(fdt, prop, proplen, 0);
>  }
> @@ -366,7 +477,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
>  	else if (offset != -FDT_ERR_NOTFOUND)
>  		return offset;
>
> -	/* Try to place the new node after the parent's properties */
> +	/*
> +	 * Try to place the new node after the parent's properties and unknown
> +	 * tags related to those properties.
> +	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag.
> +	 * Skipping FDT_NOP tags will correctly skip unknown tags.
> +	 */
>  	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
>  	/* the fdt_subnode_offset_namelen() should ensure this never hits */
>  	if (!can_assume(LIBFDT_FLAWLESS) && (tag != FDT_BEGIN_NODE))
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 48ac6fa..1ba937d 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1043,6 +1043,56 @@ fdtput_tests () {
>      run_wrap_error_test $DTPUT $dtb -d /chosen   non-existent-prop
>
>      # TODO: Add tests for verbose mode?
> +
> +    # Modify a dtb containing some "unknown" tags that can be skipped
> +    dtb=unknown_tags_can_skip.fdtput.test.dtb
> +    cp unknown_tags_can_skip.dtb $dtb
> +    base_run_test wrap_fdtdump $dtb $dtb.0.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> +    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"
> +
> +    run_fdtput_test "vwxyz" $dtb / prop-str -ts "vwxyz"
> +    base_run_test wrap_fdtdump $dtb $dtb.1.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> +    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"
> +
> +    cp unknown_tags_can_skip.dtb $dtb
> +    run_wrap_test $DTPUT $dtb -c /tst-fdtput
> +    base_run_test wrap_fdtdump $dtb $dtb.2.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
> +    base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
> +    run_wrap_test $DTPUT $dtb -c /tst-fdtput/n1 /tst-fdtput/n2 /tst-fdtput/n3
> +    run_wrap_test $DTPUT $dtb -r /tst-fdtput/n1 /tst-fdtput/n3
> +    run_fdtget_test "n2" $dtb -l  /tst-fdtput
> +    base_run_test wrap_fdtdump $dtb $dtb.3.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
> +    base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
> +
> +    cp unknown_tags_can_skip.dtb $dtb
> +    run_wrap_test $DTPUT $dtb -d / prop-str
> +    run_fdtget_test "prop-int" $dtb -p  /
> +    base_run_test wrap_fdtdump $dtb $dtb.4.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.4.out
> +    base_run_test check_diff $dtb.4.out "$SRCDIR/$dtb.4.expect"
> +
> +    cp unknown_tags_can_skip.dtb $dtb
> +    run_wrap_test $DTPUT $dtb /subnode2 prop-tst-fdtput -ts "Test fdtput"
> +    base_run_test wrap_fdtdump $dtb $dtb.5.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.5.out
> +    base_run_test check_diff $dtb.5.out "$SRCDIR/$dtb.5.expect"
> +
> +    cp unknown_tags_can_skip.dtb $dtb
> +    run_wrap_test $DTPUT $dtb -r /subnode2/subsubnode
> +    base_run_test wrap_fdtdump $dtb $dtb.6.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.6.out
> +    base_run_test check_diff $dtb.6.out "$SRCDIR/$dtb.6.expect"
>  }
>
>  utilfdt_tests () {
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
> new file mode 100644
> index 0000000..3cdf448
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
> @@ -0,0 +1,31 @@
> +/dts-v1/;
> +// version:		4294967295
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int = <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str = "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    subnode1 {
> +        prop-int = <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 = <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 = <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
> +            prop-int = <0x00064023 0x00064024>;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> new file mode 100644
> index 0000000..71f2d1c
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> @@ -0,0 +1,35 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int = <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str = "vwxyz";
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    subnode1 {
> +        prop-int = <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 = <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 = <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
> +            prop-int = <0x00064023 0x00064024>;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
> new file mode 100644
> index 0000000..bd3a13b
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
> @@ -0,0 +1,33 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int = <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str = "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    tst-fdtput {
> +    };
> +    subnode1 {
> +        prop-int = <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 = <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 = <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
> +            prop-int = <0x00064023 0x00064024>;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
> new file mode 100644
> index 0000000..237eb95
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
> @@ -0,0 +1,35 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int = <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str = "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    tst-fdtput {
> +        n2 {
> +        };
> +    };
> +    subnode1 {
> +        prop-int = <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 = <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 = <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
> +            prop-int = <0x00064023 0x00064024>;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
> new file mode 100644
> index 0000000..8473040
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
> @@ -0,0 +1,34 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int = <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    subnode1 {
> +        prop-int = <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 = <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 = <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
> +            prop-int = <0x00064023 0x00064024>;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
> new file mode 100644
> index 0000000..f7806f4
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
> @@ -0,0 +1,32 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int = <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str = "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    subnode1 {
> +        prop-int = <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-tst-fdtput = "Test fdtput";
> +        prop-int1 = <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 = <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
> +            prop-int = <0x00064023 0x00064024>;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
> new file mode 100644
> index 0000000..029f3b4
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
> @@ -0,0 +1,27 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int = <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str = "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    subnode1 {
> +        prop-int = <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 = <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 = <0x00032022>;
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> --
> 2.53.0
>
