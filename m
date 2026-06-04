Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8353F54A4;
	Thu,  4 Jun 2026 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780607680; cv=fail; b=pwfvFvcPm6RnJZVlqaiUQXa43iuxyuux/MDYaoyp2JD2w1C67EvfAtotaru4Zh9G0U1JxDswHl47k+nBOCzyK2aFsorlVFynIJWMq1RdnzOVO+7OGJYwZEfst3i4FV3Hrrh3XQEvQFOliVfCWmIGtdZfgoZpqK/5c0UoFPJviiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780607680; c=relaxed/simple;
	bh=7/bJb7cze3EV+B7dir60JvWda232dm1Vp2zXxrlGuVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mP/iSYQcrzIUV7bRv5jNIc/VqmyUCbuIgm1W6J+lZBdkHaI/qLXVTI/eB9odUn/2sfWbXWS7BO3ByOUe/Rkc6SQLZ2TwglczthtcLbSMiz3HDbq4DBmhRAv2ukViszTVafK9/RNE/TwWANLH/7pTor8dZxPYB+yGiEQzaIR0GM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nUdUVzHI; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nUdUVzHI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6+F3y2Y32sCvWEAbMcmphIyym3AjAxokA06/db5dDk/lw8jwwhsfqw5AKUXS509Nl1h3fslmAY7Ec13Gl26a30p1QXSVz2P2WqjEqFas/f2aTtz4jIl98rtko+MvqkKWpJZL/AlzgCCHZervGtKg/nevCve0wF1lChILJ6iHEtK7QfgeIS2QfdMfKu4+gF84LjNLbfu5uDD4QsiWq33ccFeuMOTDAOspbxGTclLMzThTPSpuqbUqm1OdlXT582wiKIL9WZzcMW3xXthEOGsdcj0m36XUD+zV3McOrbFh8cwx/bgXnafr3H6Z5POjBKhUqhyF3j9Pfscvm4vH+TC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSYmhfOAuB9sq3i9nOtCxSgr1RBoXMFQdI8rr1TJVDU=;
 b=qxUSzUuD3Z97a+7XF5Vy/pUrtOOeHDDiWPcvR7PLhXrdpdIznecwdh2epkNepb9FaiyM2IrvMw1D+DrXQqqI99ahmx6m1iWWyfwHnIFEFjPqc9le8S+gIPmzzl7XawoDvPUmDRyeiLs0T34cA0yB3gEaUNotUjQuYsWBSq5xic8OTuPPlPIF6D/zUnQ7q7ngtR+eIqPXxnwLlHLr19mIBgFjUwtKd99JPsd9OYVXqBHsZAiiaLivAprzfXht56RlU5qy4rZpT6bxsZgZmS0jjIcxGQn645KzGUcz7UjxLpG8pkjJhoqQ7X3kuhnk5yWNh7j4hx5hyI77450F7lsyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSYmhfOAuB9sq3i9nOtCxSgr1RBoXMFQdI8rr1TJVDU=;
 b=nUdUVzHI6Vxsfdf1mPVjUxmbjmAS9l5vMgd5u8HFtHfFMpUxNBXx9Tk2RKXbsoiJuQ489uLbioGTuiqNhp0I/pVUyhXW3yZR/NUOIrX74oGFDs3iPEsieiXtDUl3vic0oarrO7ZPX4jHNPQcbFYl8uQMtQpIHL23B+x1+527qBJXXgUzvDaDY5dcellPYTD5yrngjyra5MybPjy8q0XRpimk8eQW+Q0ygldthEi+DH7aenf1ORibY+k+6y3FlXeber7cs2E86ixV7SCZBCuckjTR0ahzwepYCkJ6hcwiG26tuvo7kBczDY0XoTEvWxf2fpJx86PvzBwNeH2rmGPcIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7408.eurprd04.prod.outlook.com (2603:10a6:800:1b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 4 Jun 2026
 21:14:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 21:14:34 +0000
Date: Thu, 4 Jun 2026 17:14:27 -0400
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
Subject: Re: [PATCH v2 04/10] Introduce structured tag value definition
Message-ID: <aiHqs4tFAK3vR4yd@lizhi-Precision-Tower-5810>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-5-herve.codina@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409115426.352214-5-herve.codina@bootlin.com>
X-ClientProxiedBy: SA9PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:806:a7::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: b06b056d-4c56-474c-2bb9-08dec27e46d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|1800799024|366016|4143699003|11063799006|22082099003|18002099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	IjLKygoC9ABFR1STSP50p+dUEupHI/UdL8IOOP4e04C0itLFJ7MoG6tl+QPIiRKrlB/q2S80d2elUIYUGKsdKx/9dyUBgDWTRsq0nq43L00fIqL8WS8JMsxZlU5KHMv/ilteQtJAuZN8iTtrVpWWE0L7HEJkTNco1OWbsmBsJo1qQ2ism4phyPsHS81ZHiqKIu2ZETrXiVCW7/CI3gTv1H2EJTr6OlXB48fblMXAyDrslB0iH75hf77AIyhz5hKL9NB4O/fHR1m7SKEA2yswOhyhYL8Bxjgijx2rVYND94P8sDHMUApHXI8ndzSz9KjyYmwXKv1v4uo9IIjP+YtayJWEPs3ih3Dxw0zlLizFJNZTjTYsa9VngmdsS8dBTl0R6Zo5BUrEwgIx+sGunDyIF58JEXuGORPPbvswL8OMnQMszA4eKlSU/+xE5WPBEvp+rVA+pDiED3nj0y8oCwdIoxv0nekt8Qub4Qhsf68tPwmM8zXQPoLEM+Z1FSddtHaaOWel2vTHI5N7MTSq9PM4ln1wRx0wRVo3O+FtPahoRYoB9yJbC+V/+Vd7p8BU2GbS89JXH5QzrpyR4haLJMdnY21mf4hBxCvhogW2i9ZCGENkpzumMVbQWN3NSwW1BjkGWhVDAXUecDp0pyq29u8INERPMro0XZnKQ2G2FHbQEy10Uz96tSlrft95sOIFnXwiL/Hmh7q2lU2dp1GFAW/ppU5i4zModFKswg16RkHsl/fZllv05oQE+0tf2D3lvJCr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(1800799024)(366016)(4143699003)(11063799006)(22082099003)(18002099003)(38350700014)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FeEMkc1kivn3CdaJjkAmwlr/jYbYBXyg3doBNKIe6uQysN07c1yu/6sFulZ2?=
 =?us-ascii?Q?MOjuBZkuPbKvX3yIcePvsN7pWYniNvzfmr1pPRHsvE13XDJMt1YKChSFR/YK?=
 =?us-ascii?Q?2zCoH0jjLUHcNV4wdHgSUUgYn07dbb+PCHn/doYamyuEqeWy2QQeJElTFXOz?=
 =?us-ascii?Q?sjEcV6vTGJ8BE346lDE39dJ+O5r4iSxQKspKlMAuK86EFkSkS3U+6RArdJ08?=
 =?us-ascii?Q?wKe1bQqiMhMUtFW2hqrhGgBeCAscK5mDZwm6MmnSBwcyXZ82y+YK22N69vJR?=
 =?us-ascii?Q?oBfEAeXs6vEEYBsfGghWZigWELiLkUZluYwfvmJ5hCjND65TVg7b8rKZ3I8F?=
 =?us-ascii?Q?nx90ae1X8I1lJgTGvGncQkacoSwKQaEK7fKXFfT2kxq0bXBzye8UAoOYG412?=
 =?us-ascii?Q?E/GWOqvir9M46fgWgI5GsC+QlPVFnt1R8CgzsWO0yp8mdBdvHyFJuP2cLKY2?=
 =?us-ascii?Q?8ss+BvCa2Ow4e1TXi93h1VebkGbesXTQ0PHl10fmXZNdLL1z08dWvLLGO8IT?=
 =?us-ascii?Q?XIpP+eZohs+Ai/HMtUP+YUtHpG7PZdddfmDYlsCByCDaeWwbUWfPF54J/Qp5?=
 =?us-ascii?Q?UzkV+Uq0qCc+0hjH4ldi/jizgXGBTbtPkSbA94mVz+sZy2arsKh7qhPvhoja?=
 =?us-ascii?Q?zMHnJe2b9LpIaKMAur+WZXjMgU+aBb0ELI8wibmfJHc+bj8qsy5PvgfOSxz3?=
 =?us-ascii?Q?v4ZR/ea+GtRcoPRtmcoNNAYAno5pl5MohTiQASDhc1k2gPiA6da6K+eF1wCS?=
 =?us-ascii?Q?LpmYR3DkhTETbscv7kQPp+rZJNUDkP7/Z4kx1oZEGH05jXtb3XwsjpfjQUdN?=
 =?us-ascii?Q?N+q6CyiLh6S0hVIbRC9nXEegX3rxjE9ZXPNLdjUbagDLL6Bf97qaDDpCfVK9?=
 =?us-ascii?Q?rlvSTF8RDflxbVnjrtFwkeSvC0/iwv4rHoZ4FXOxb9rIzzZ4DlcbkmHQBdi7?=
 =?us-ascii?Q?fYAuxtdvI42AwRzvmTTQtFOpLJBcxB4rd+vkXWipeWIkd0VI2xRkFa8IW9A7?=
 =?us-ascii?Q?0uYEvhhE/rdGBf1yk9IKAlc8dBkAMOKoJb8HkbHPvS1pxiWdXoyXq4Gf9vpZ?=
 =?us-ascii?Q?fnuoIUc53h0+I/owhNF78Ya81eVo1umHbuKvt2fMWcwhIDDuaqFS+QPqF1R+?=
 =?us-ascii?Q?VO1VaTURCxnXJ1RbPJI7aYPfE9vG9DIRFcv0/B7fPFHUBkH8Bi96mS87wDmN?=
 =?us-ascii?Q?RdjQNpOxvuxsWJJgZKovJuwjoL7lh+F3dvMiOzaj1mSm8HCRBPo4NV7e/9pf?=
 =?us-ascii?Q?wagMrZgT7sW3K/CXsvH+A/uBpZZiRdSEll7bdXjLpn5nJHwH2Ze3C2/Y8hql?=
 =?us-ascii?Q?cuVRg/18mG0YtRRSqLy1w+Fag+EM8txQE1sNrygY8uecyTgGmaCGlT9H7+9q?=
 =?us-ascii?Q?bFuzLQ2EedDcVPyZrhH/bstHRLyp33sY82QOiD2zdH7dTR58Vw6CLOHLawxv?=
 =?us-ascii?Q?8kjjHMgjnesecHFZyBdMJU9eStmm/IzyNXvSWY0BnT6loWSsneTnfGhxGXES?=
 =?us-ascii?Q?/UdFJremmUnomjKVupwecI2SEnXwJxKodALpGZXwW/EhTlBAVES+EKkouWAT?=
 =?us-ascii?Q?cRwO3VCF6IgJqr/dqZIR5g2vnSH75CSCX7h6Z7SHmiwBWswuPxbl340pu4N3?=
 =?us-ascii?Q?QaizGoGFg/KpB+AG4MVrLeT6i1vf2Gk4J4osCygr8z9RvkaHd5daM7tItxv0?=
 =?us-ascii?Q?tuQQ9zn1rS+Vol+DducqWoBZmF7oP/ej6Bo9VDhluHTHztAx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06b056d-4c56-474c-2bb9-08dec27e46d6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:14:34.5019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSH9XV5s+wGtgGmaNzE25SvjyXD1obwfGuurujiYQi4nFshvFwXERKyQzaAt1uVjf0nRig/Z6R3YiLQx19HjHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7408

On Thu, Apr 09, 2026 at 01:54:20PM +0200, Herve Codina wrote:
> The goal of structured tag values is to ease the introduction of new
> tags in future releases with the capability for an already existing
> release to ignore those structured tags. In order to do that data length
> related to the unknown tag needs to be identified.
>
> Also add a flag to tell an old release if this tag can be simply skipped
> or must lead to an error.
>
> Structured tag value is defined on 32bit and is defined as follow:
>
>   Bits  | 31 | 30        | 29             28 | 27    0|
>   ------+----+-----------+-------------------+--------+
>   Fields| 1  | SKIP_SAFE | DATA_LEN_ENCODING | TAG_ID |
>   ------+----+-----------+-------------------+--------+
>
> Bit 31 is always set to 1 to identify a structured tag value.
>
> Bit 30 (SKIP_SAFE) is set to 1 if the tag can be safely ignored when its
> TAG_ID value is not a known value (unknown tag). If the SKIP_SAFE bit is
> set to 0 this tag must not be ignored and an error should be reported
> when its TAG_ID value is not a known value (unknown tag).
>
> Bits 29..28 (DATA_LEN_ENCODING) indicates the length of the data related
> to the tag. Following values are possible:
>   - 0b00: No data.
>           The tag is followed by the next tag value.
>
>   - 0b01: 1 cell data
>           The tag is followed by a 1 cell (u32) data. The next tag is
>           available after this cell.
>
>   - 0b10: 2 cells data
>           The tag is followed by a 2 cells (2 * u32) data. The next tag
>           is available after those two cells.
>
>   - 0b11: Data length encoding
>           The tag is followed by a cell (u32) indicating the size of the
>           data. This size is given in bytes. Data are available right
>           after this cell.
>
>           The next tag is available after the data. Padding is present
>           after the data in order to have the next tag aligned on 32bits.
>           This padding is not included in the size of the data.
>
> Bits 27..0 (TAG_ID) is the tag identifier defining a specific tag.
>
> Introduce the structured tag values definition and some specific tags
> reserved for tests based on this structure definition.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  libfdt/fdt.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index a07abfc..e6f75e7 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -49,6 +49,7 @@ struct fdt_property {
>
>  #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
>  #define FDT_TAGSIZE	sizeof(fdt32_t)
> +#define FDT_CELLSIZE	sizeof(fdt32_t)
>
>  #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
>  #define FDT_END_NODE	0x2		/* End node */
> @@ -57,6 +58,28 @@ struct fdt_property {
>  #define FDT_NOP		0x4		/* nop */
>  #define FDT_END		0x9
>
> +/* Tag values flags */
> +#define FDT_TAG_STRUCTURED	(1<<31)
> +#define FDT_TAG_SKIP_SAFE	(1<<30)
> +#define FDT_TAG_DATA_MASK	(3<<28)
> +#define FDT_TAG_DATA_NONE	(0<<28)
> +#define FDT_TAG_DATA_1CELL	(1<<28)
> +#define FDT_TAG_DATA_2CELLS	(2<<28)
> +#define FDT_TAG_DATA_VARLEN	(3<<28)
> +
> +#define FDT_TAG_NO_SKIP(tag_data, tag_id) \
> +		(FDT_TAG_STRUCTURED | tag_data | tag_id)
> +
> +#define FDT_TAG_CAN_SKIP(tag_data, tag_id) \
> +		(FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE | tag_data | tag_id)
> +
> +/* Tests reserved tags */
> +#define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NONE, 0)
> +#define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0)
> +#define FDT_TEST_2CELLS_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_2CELLS, 0)
> +#define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0)
> +#define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)
> +
>  #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
>  #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
>  #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
> --
> 2.53.0
>
