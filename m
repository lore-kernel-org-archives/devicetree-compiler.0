Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B85E3C2BB9;
	Thu,  4 Jun 2026 20:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780606771; cv=fail; b=ZccH1Ajwi3LanJu1MUxy+gR8RYXWrpB2K13zAeOwSZ7cTtATU0443TtQKQN4+8FQASXHdeKXvf+5q13WAu/COnzhbHFbe5rDbqQIpFw5FtiVAnShIUFwgrPZdyh94RKT49KZnbIGvVgyjo3LZJpminXXw/MVZqywh4PBshYgjIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780606771; c=relaxed/simple;
	bh=jCYEVMjx2dgCf1myqHgXw9KWBKSnhEPzpjYA6rUBTqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=upN+12QYNPkXOweXnM/F8acA7xdSx8GtDCnffxOjk5vK1tt958lQKSrAISpdX8yWuEOwt2iLZ7GxtMJKDvNW43Xz0qZkk+8rwmwXJ9Bq0ZuzPIOnOvywGKAwLhmazXB/MwBXELFhoE624cUuWK7jE5TLD1LKfl5fe4FUjwQWES4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g0H/zF0J; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g0H/zF0J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjJIW8DIgyNBob/zWWTDzPlsHybABlXKdjkDYl9Z3tPdPoJVD3kMAdgGIOyfJKy2gFH3c2N9PBkv9zWRXTelbLrSDia6D3V3Zq4GbMWRzBOpJcx10BPt1xnWDGCCgwsF5CfFRVMbhpKh3gvYMpKmHJogGjfRJ/2b9KKGoelIWlZWfE+GqW6nqPSlJ4Y2jfVsoV4ogbWyQCFz3Uf/JEG96z+/RQ78aOrfLx/cnxq6wJzvTCt5k1qVQS4tDK4gkxp7au1FPAP4FOBWfLnzEnPwj1FvJCkt4GR0eWt85lgzpZEiPSVJ/MXLkOvj2OMANIKfGW6bm88aSn1GKqDR2AuqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsmNUJBO3wIZx0UQhIGZPUl1vtzykbUWxIFIK4joS9A=;
 b=W5QuVrKlqV47RHSZGnuj7VhJEoq0RVNYkjmo3XucD6+Ap/kw86XeNHFG79Xxio2HMnH7oRWJ2FYGy6k+KYMzwywMxGa8UyeXdJ/H4AXb1EjgfxO/CgW1in+3t6Wdzn83Ox5M1jN9/7xkSmuHe1WPNE58bvMEdluC6hXQyJEuWTiaEIzAuYg4VmY2Khp1esc/fMndU4Uk+yWkLE4dKAuO/QqOM7DfRpw4MIxQbM/Rz7OhFrqy+dfB1FtqN3dTRi+FApsUQhj5r0d0l4xNwC1RTCiGfinDLSOkgZiakLoo/RX6uDHKKu2McmGlV7btCNaT5KQ8K6LQj6r/zV/7gmC46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsmNUJBO3wIZx0UQhIGZPUl1vtzykbUWxIFIK4joS9A=;
 b=g0H/zF0JpfUNA0a3RcEwluzDIsffQYdehyS28R5srtkQhOOXwSk2GunWMQc5F2shlBkNb46jsFXFAzz1uuWS+3QZBOFXUH/jBSrvoEboD5guQPJnorS3t5R6wPhphTCgdIuiMrwragA7OFEVOccjhJ5RfMJstUsWivZQOjMxM2mjdvBM60ZvKtQfVpslozjFryAPJ2rXurg8db9VSOl18UI/D85uiIG3oZuLTCBtWdtTGHiZRBOp1pX2H3Bu14x3PcbLQmEAZbvETVY1RgfTL0IIC0R02u2lOLk0/qXxJFpZ6D5mmVy0J1jqCifWGpacWpT67oOuhUW1PfFxKlVlkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 20:59:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 20:59:19 +0000
Date: Thu, 4 Jun 2026 16:59:12 -0400
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
Subject: Re: [PATCH v2 01/10] libfdt: Introduce fdt_first_node()
Message-ID: <aiHnIE5uHYq4vcSX@lizhi-Precision-Tower-5810>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260409115426.352214-2-herve.codina@bootlin.com>
X-ClientProxiedBy: PH7PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:510:324::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: db553e5c-a3df-43d2-bfb1-08dec27c25af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|52116014|7416014|38350700014|18002099003|22082099003|11063799006|56012099006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	xRaS7BPB3PZoSKQPBSBGKMP1QKAmwLG/sNd8kF7hCqBeDQUsXluPOdBAsYvJ5CN23fdMRAkYu+ygFj++fkw8qiBxHI69A4I3TRPGF1vXnFTFp0acgDFHkwQEskwajXADNakRnI27R0hTITYRdUhDRPnAQ3SK5iWP8jCcGhlD2tJm1ZCDwfm3aSz1SFu8Yq0CBZtpzOsd5ogMoAS1yhIn0qDFErrT6J5EkCMyzmIDJ8JO82/vg/GEY57RGYdAo68LV6wA874hfwo62kKMhZQY1LSUK86MhsNpwpMHDL7tZ8YCZXXbB0saCeVU1RPYe7W5HTTexSlW/d/fycDor4vp75XD3/jeK8x6MMve9dsstoyUQJHuU69imKKelcK6eW9IuJr3ToDoeUcVPxtSptAxaZRjrVZ12bSvmfH/kcWagPjz5c1f/9HxNQMpP1F4weZ/kRBYiLEBLHAAGlj7gVVt/WWmaKJuGmLmgcUx6MuN55lSfgbQbf6smCsWKzHUwi5ItjslNznbhLRMmzLLPRTjmi2vuID1PrIb5xpZedJR8rnRhYTCGLanPyxzDvdu9UQn9tWsQr5537MDqqxzV3HqRJOYagLJj8p8qA9852EsE33yTOlGqyEKoCEno+GnQMWv+ffF1iFt5JFyHjycHsIJbgp8sj2ob4kNhysMVymxKC+7Rjv0KV+ZykQXm3cG76iNLcxiUbGeEKcibDmcJ5/G82wISx95jolPlnd9rBohgEwwbWPG6oqp7LoBy/rnXRAY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(52116014)(7416014)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjZoWklkLzBPZ0lkYVBEcEc3WmdWZndWNW9PWUhSVUFDRkZCMlBJSEVoUnVo?=
 =?utf-8?B?a203SHhFQmV3VS81bFIzQnplbys2L1FRbkRCcjZ6OXJUWlFabXUxTnJrQ0dZ?=
 =?utf-8?B?aU5pZlg3djhRaGU0M2V2NVgvNFhyaWE2eGNnUFk2YndDY09qTktjd29PVksw?=
 =?utf-8?B?alVwZ3EvSnh4VzBlWjlsWTM4Q2dmSkpOS1k2YTRmcUxRMUhKbTNvZFAxMG9t?=
 =?utf-8?B?dkt6V3FTS0hGWWU1bW42eFY1OUFmSGNlQXdSL2QwY0FRODBtQVIzbEpKUVAr?=
 =?utf-8?B?bVhFZE5VRzJiVFdEandhZVlNOWo0RUNoc0NidVd2R1hHcGllcUNqVGZHYkpp?=
 =?utf-8?B?Z25IcnIwVTllc0ZxOEhRaUpqbEcvVmpIKzZyQWd1Z2ZLdm9oKzhjYnhkV3hB?=
 =?utf-8?B?NFNxZUVaNURQWnNUcUU3Qi9mZWJWYlEvL3NQN2N3czlhWFhtc2ZWWThaWC9l?=
 =?utf-8?B?RnA3NVkrQ0FiRG9PWVNtVjlzUE5qT21vOWpTTzVLWFQxb0NvTFYzN3hCRWZE?=
 =?utf-8?B?M3gyMXhCNG5SYVVGQUh2Q3VOYndxUDluQmhGV2JYMHROdDRVRjc0Q1NsVEhO?=
 =?utf-8?B?M0VteUJaRVFKVFpUbm5qbVpEa3ZCeW91UStMSjl2REc5Z25zek9zUndLWEdo?=
 =?utf-8?B?cE1ocFBBVklFSnFiRHI0RVN1aHJaUkdLN2VBNVljTUNXMmVyQ3krZUs1UTAw?=
 =?utf-8?B?Yyt4dWFrSFgyUWVkTTEzeEZORTVBSEdrUXVRWXVKOThGa3daWmdIN2hxUC9W?=
 =?utf-8?B?Y0NOY0drQ05vR2M2OUtROEpxK1RRZDA2OUszaHc3M1RtUEhKVUdtcW5vREFh?=
 =?utf-8?B?Ulk4OElwNU1LaDRzRkNpNEJCRFluM0QrSVROMVZrUll6VXFVQ2lLbG13ZjVS?=
 =?utf-8?B?U0FtL2FYWXNweXFRU2NhWmZ5eFNHV1pZOUJ0V3RQTW5IWGFhcnlveDlCSEh3?=
 =?utf-8?B?SkliK3JMMzZPODRTTTJJOGxUaFB1Q1ZLQURqZVl1ZEVBaWFxdUdWUXB6ZmM2?=
 =?utf-8?B?WGxsWkR6SE1mQW5NdXM5Vy8rbWErWjVaQUY5aEFLS09GZi9PeXlyWU9YamVQ?=
 =?utf-8?B?T3NzOC9NYnRMTXdma1p2OEZVT0tnRDJCSThNbmNtZkVGQlRJOFJ2ZXVLOHpL?=
 =?utf-8?B?aWxGQWtQTXJNdytLT3Q3OU9KNjhDR2Z2N2IzMzZ4OUpGMjN2VWMwQi9YSVVW?=
 =?utf-8?B?NHBqcE5peDQycnhhL1dmbFhLclFmNGFwV1pLQWw1ckV4RmNqWVNrclkxMHUz?=
 =?utf-8?B?aTBDejRheDJGUGYrcFhJWDdpOUJXc3hOaVplWXVxSGxSL3p0bXpsaWlZNUxq?=
 =?utf-8?B?YUhkSmlXcDh2UU9xSjVNWkVBYlJuMmZPTlJ4a1pJZm5hYmlSZ3V4OEV6ZmxM?=
 =?utf-8?B?OG1CamMzUlRHNHdKVnJYVU5BUWFHNkdrUlFUNkhvSkFiMFdIVE85MUE2NGdS?=
 =?utf-8?B?TnVMQkx4UmUwUWpVWXoxU0NQL0FRekVsQytJaHk5Q21uSm9wRmRYUmJQMHc1?=
 =?utf-8?B?OWx6QS9hcXNPTkVxQ1d2bGptSnRDWVhPMS9Na05tNlI5NEtLRkcvZk5uZThR?=
 =?utf-8?B?SUJtVkZKRElZeGRPYUM1cTVmbEp6NlFDK2FURU94UzFpcWNmbWV2R05lajBy?=
 =?utf-8?B?SUJzeVBXejNxai9hSDlwNU1lWUhoTFNQdW8vbzc0MTMyUHh4T3lhMjB3TGJz?=
 =?utf-8?B?ZEVkVTVsNFV0T0hUSWpqS0VJUWo5djl4cXA4K1RtS20xRHV5bnlWenJRTkh6?=
 =?utf-8?B?aFBBZlBJanplbTlWQ1U3dGlaTnpRdU15aHRud0oybjlFNi8wK1MrUklLek85?=
 =?utf-8?B?L3pNc3h0NHlDOGFPQnJQSVVnYWRDQURTcG9GZ3o4cUp4UUJRZTN3QXdpN2hv?=
 =?utf-8?B?NmNGRnI3RWhEQkY0cm5FRDh0dFBKY2NLNXRwTE91UzR4a1ovYnNCdm1tYWJx?=
 =?utf-8?B?Q0NpQm5kdmNPYUY4RU1GRzduSjhISjBnc0MyRnllakcvTmQ1Nk9pZmNSTFRk?=
 =?utf-8?B?OE1VZnUxbW5DSEVyK0xaaFZTMklOeVVGVGZGcU5HRmJEOFdNSDVyQnZLeEtP?=
 =?utf-8?B?c2V2dy9UdlEva3NlTVF4bk5YelQrUERVUlQvWmZld1c0WnNyaCtic0NTN3pZ?=
 =?utf-8?B?YUJJSTgrbXJ2TnhvOWtTN1lBTXZVYkt1WjdLbnoxRzhaVlU3aTlqOTVqazBZ?=
 =?utf-8?B?aDJzTUNaWnNad3p3ZXVKZzRqQ2F3U0JCU3N6cnBRK2N1QWhRTlpic3R1YjQz?=
 =?utf-8?B?dlBDeXY3ekxvajhYRlVkUUJvSnpWRG1FVC85UVFDZm1NTTdsQldrV2pDWU9K?=
 =?utf-8?B?RzNSOE5QcUlzTXFUMisybGtEdGw0YzNLSkhUVU1ORDF3WXNkWnlidz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db553e5c-a3df-43d2-bfb1-08dec27c25af
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 20:59:19.8435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIJFss26bSke3YRATc66LuLF9ILYdNucGvxHabwSgJnGg+MjtdPswkSNdLN/7eKE3FdDxPsPJ39bZpOADzv2BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9644

On Thu, Apr 09, 2026 at 01:54:17PM +0200, Herve Codina wrote:
> In several places, libfdt assumes that a FDT_BEGIN_NODE tag is present
> at the offset 0 of the structure block.
>
> This assumption is not correct. Indeed, a FDT_NOP can be present at the
> offset 0 and this is a legit case.
>
> Indeed, the device-tree specification [0] defines the FDT_NOP tag as
> follow:
>
>    The FDT_NOP token will be ignored by any program parsing the device
>    tree. This token has no extra data; so it is followed immediately by
>    the next token, which can be any valid token. A property or node
>    definition in the tree can be overwritten with FDT_NOP tokens to
>    remove it from the tree without needing to move other sections of
>    the tree’s representation in the devicetree blob.
>
> Nothing refers to any location for this tag and it has to be simply
> ignored. Having this tag at offset 0 doesn't make an exception, the tag
> has to be ignored.
>
> Introduce fdt_first_node() in order to get the offset of the first node
> (first FDT_BEGIN_NODE tag) available in a fdt blob taking care of
> FDT_NOP tags.
>
> [0] https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter5-flattened-format.rst?plain=1#L317
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  libfdt/fdt.c             | 25 +++++++++++++++++++++++++
>  libfdt/libfdt_internal.h |  1 +
>  2 files changed, 26 insertions(+)
>
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 56d4dcb..676c7d7 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -252,6 +252,31 @@ int fdt_check_prop_offset_(const void *fdt, int offset)
>  	return offset;
>  }
>
> +int fdt_first_node(const void *fdt)
> +{
> +	int nextoffset = 0;
> +	int offset;
> +	uint32_t tag;
> +
> +	do {
> +		offset = nextoffset;
> +		tag = fdt_next_tag(fdt, offset, &nextoffset);
> +		switch (tag) {
> +		case FDT_END_NODE:
> +		case FDT_PROP:
> +			return -FDT_ERR_BADSTRUCTURE;
> +
> +		case FDT_BEGIN_NODE:
> +			return offset;
> +
> +		default:
> +			break;
> +		}
> +	} while (tag != FDT_END);
> +
> +	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND;
> +}
> +
>  int fdt_next_node(const void *fdt, int offset, int *depth)
>  {
>  	int nextoffset = 0;
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 0e103ca..4c15264 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -32,6 +32,7 @@ static inline const char *fdt_find_string_(const char *strtab, int tabsize,
>  }
>
>  int fdt_node_end_offset_(void *fdt, int nodeoffset);
> +int fdt_first_node(const void *fdt);
>
>  static inline const void *fdt_offset_ptr_(const void *fdt, int offset)
>  {
> --
> 2.53.0
>
