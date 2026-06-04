Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7425334D3B0;
	Thu,  4 Jun 2026 21:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780607099; cv=fail; b=Xpqm2MPxOeNcuPu40xBVGsBQvNeEN51BqSm8o5e93hoKE5Z9vCkCL8VHWIVNtMYF6NnGW+ChdoPZTkhb933l7bmiw1llNz7hi8XnK3at1c/MtNz+fIeHx0LxrSMi0yG2Jc6KWiyZ0a4ysdWA6J+9Dm4UEV4Qhc7XTY0EwYg/ulo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780607099; c=relaxed/simple;
	bh=PSKo26XMdSAxEY4PteTykFor2PjaCuqvpu6d2HFeadE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a273g0iKKp3yPl1SSTmRAf3u1lrTHB8PXl2AOKMo7mabD8vh+k2+4XxMqp7Zb8Q4XsntnlFqPUhsBd2a/HjxxzlatbnmqU2EI1pWNmZ7Au83943CWZ1Ln6rNpbIDLtCAXzyiOxdubZhVhRVgCon2GVW/MlQI1pdyeAct/Tuu7Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nD0ZJcjB; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nD0ZJcjB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOo8/xYbifxk5UGKsWSuNw+JearawNCI/xt34Lkk8HH+sA41muV8log13IHX+RTRq82MWq/Jr0HGLGx2k0tCwLoZAZ0OZvVTGbJMGNOUsSNBecakPVd1Bp53VlGgF8aMqjncyWI9BSvAkHpzxfMrGyYGVSSBRBthA1SgvrSj2qRhktUYhzxNgpqP9YmO8G/gQ/XMDdje9xavipJDtt2NQMdb13lWGj0fhJKT47B9gokSJtovKCnu6uF/cP/gi9uBx5JgiOqlc5sZBze6mjvI/cvP4CDjoz7iNcks2kcBnM+ARGC4G/42ebVk5uM6qrI8oZNGYzE0b/UjPnskYDDf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5tw2RlMUnI1g6iOMkGL8HWE7a1UuiM3LoMC3DmnFmk=;
 b=yXGATGlw5Czg2H1brBuM8R2H4mgwEadEaRijjAtLMzFHsBKAAk0p7k03xFdWhxdQOrjbohGHZMJNLpv25EnvBwKyZEnQjwU0Na9HaB28YgruoFestx+lEbVi+E7cGCOql9V5ASuTnPC5mW2r0z9tlbQh1ziNGfE8geMDBeymP1LFLTKZ96OqiOfjCuxgymKfII5g78/jm69pBD4dWAvKzs/H/6hOk8wtjI6ZWSm/tqQ2qZaelVUR5iUWuQMAnG7UBgR1/eAKJ0TW6gbqkGM7CTNejPHArTmJ/tip1I/a0bHFGXJJHYENTOS/h7RlqqFhs3G6lu3Okz4v3I4zPQLkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5tw2RlMUnI1g6iOMkGL8HWE7a1UuiM3LoMC3DmnFmk=;
 b=nD0ZJcjB8zTS/+jMyD8AkQGH0taCPdUAwYqbzYbQcJe+Q0AMZZnQuNP8+3zSe73pwV0Aes4D5xr1tuQUaFlLcQtoDA/coFpByNEt+iAQ3k3lbM3p1eQcOMvk0mrBvjSn1txkjHOlnXYa7cebtr8wETsH0lfIKJQ0MAi2feLezOWNom2DffL0/ZH5ncASU3WP/TXNckdV1MlDDDvA8GWFlJwh/3W6DeQmnwtSphJcJ/Bj4fEJLCihtMYMU8qySHfWLAr8DSlnK7M3JoeWW2qBxQM4qMzP5mX4xu36g+DvCEfBkVORwaZS28Mp7Z//00HUPRC0zea4p9Up9P34uDHBeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 21:04:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 21:04:53 +0000
Date: Thu, 4 Jun 2026 17:04:45 -0400
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
Subject: Re: [PATCH v2 02/10] libfdt: Don't assume that a FDT_BEGIN_NODE tag
 is available at offset 0
Message-ID: <aiHobQS1vRYWK5zM@lizhi-Precision-Tower-5810>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409115426.352214-3-herve.codina@bootlin.com>
X-ClientProxiedBy: PH7P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c171cb0-10c6-47db-c22b-08dec27cecbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|52116014|7416014|38350700014|18002099003|22082099003|3023799007|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZvYgA9z1eDpRufUP5aknFwRt3ahbM1aLltjULJp14FWyK0El2VujPY5hAN0elNprRFBg/pML2s35QdD8jJIORud9VoFq+4g4GtAaUHipOY1Y4dcAPz3DDz3zHUg2OueYIAamvhpzEx7LLu0hHfCTRCXu+oLiB37Hjpk+8LUfy7g8VrLCxAVddm4eoNJkH4TwRgZb7mcCv0d+cM6q1kRwzyhn4KQlV2tGSRm8rfNf5pXStgej/OHztYErLl5fYeW4hC2Tx4eLHV2KGIDAWaceNRVAW17L0k+FkRGGlOFRj3GIXn/gEO/J4SY/6tjacIv7N6jgNpkFZ9KWU3Q3U6uTX04agcXBz31lw3vyTL5+FucK+uq/zBH4RSuzEzJPc/yZDaPWwaQYP3Y0g+1sx4D9Dagj9zLnyK7Ee4GXXt4YZEc7sVKkDQjeNV50nFCL09QVvPXqPuiOh69JYL+nto6+b6cSrwKxeec+WUck2xJ4afHOrVV/RR6nx2NxxbM7g5GCJRMdn/2UWa2XQTkUHjOcSx/R9IxeqsI4aufNIHHWBNZboHtiv5+oOeNsNbV9xr3cy6cbWCuqbx+q/p+D7S9JKk/vdZEuLwbFQt+IDNZOjNWdGVlInvxFRHaw4vv5AVljU2kOnclVVGYaDBAiPciTg1S2NVIKIk8KWrQLEJa6p7uYZKmjoEWyoeZZ5KKIaDVTsAr8byTvmmgV8E+g2YLOKYUfJv95VmlJTOzK4HVWeVxK+cz1t7mrukzc5QwFGxdR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(52116014)(7416014)(38350700014)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aE2eF/2TVMLdL3cjiGNVxaWweXmYS5IY6tGz7c3EYk/+AHt48H+MUE/z3uBI?=
 =?us-ascii?Q?sXCjSizAoTWZDoe4MTexjJaREaGse4+9aTXRKHMYeDwVMCCcm169ynpNjh5v?=
 =?us-ascii?Q?br9knNFY5pYzG0/FgDL8SoLj53G113BUVaaBITKxeWtxQstptkkWlE9K28A0?=
 =?us-ascii?Q?0c1fbTWCbWXjhsYU/WvU8x/N6b3LFy4o9pj/zr+WwXXgens6G6V6U0/Pnx31?=
 =?us-ascii?Q?tMpeqNG9xQxI6r6CjSwD/47DZybKp9aRnNkkK9otVOx0CinzNkbuv2mZLBJj?=
 =?us-ascii?Q?+eZbpb+97I/DIL3WEC6UciqU3T3EpYXAD0kvY2bhykuUCozciriSDnco33Av?=
 =?us-ascii?Q?kE4uIANQP43Jjs8Janf+tidDgOj4PgT04bwB6bDwnViLZ0n4Tn02C9kWGA+m?=
 =?us-ascii?Q?GMAlR9bNKYuH004o3vu6RdIgSzXRYN7LqYku+A4fqFIM5CHgFzvm+fTBxbAi?=
 =?us-ascii?Q?IIys2NalAYXG+TDgoUX3DZNdLGdtlQuKqbwRte3WvENy/Y8Gm8ZsLekUaP18?=
 =?us-ascii?Q?HBYeBI2yYYPqIXy6pWWiwqJ3triPHKOJpaVloFLlsIZId6N36SMnqEFkEd+q?=
 =?us-ascii?Q?tNu+vj/B9F2fbUHFJs9lTaDMfQoiTGFHIW0vjuzyZ6s0u4PcZfeaKihNmV5u?=
 =?us-ascii?Q?2zrUwwuwYpiPZfu2Troxp+HToCu1GUiWFLnBG0Vecmraa+DzwNdKr87LRL5D?=
 =?us-ascii?Q?ug6YLxL7NSzYknnsnsdmysvrf3oQVHGDsDY6T7jvfJEigmCwk/a/JmfKX7kO?=
 =?us-ascii?Q?k1AQbIQyE7d33yizJb6WT/c3gGPlS4KJ5GjUPN3EJWkCYmQjoOKk53B3UjGF?=
 =?us-ascii?Q?yaRfMR+d8C3/TWfYbP8Ozm5iLBpWLPU68rWKdgC64DlcilIVjaiuE9yR6iWT?=
 =?us-ascii?Q?V7SKhasO4VKvDZK7DctrwkZmoXIgJicpGC4tHQKZd2CaDnxFGkyJQ13EN8+z?=
 =?us-ascii?Q?CsM9IAnLoqEtXUhjNrobEcm4LHHb9uK4jkZ9PPtt913jyIMN76LnUZQ/RraK?=
 =?us-ascii?Q?nGOCxJZdmuHwX+O8FpGMgZAtHCdRGSzb/yPg75QeMKaF4upOHJbJkZ0ijCfz?=
 =?us-ascii?Q?3Tp3V2HJHeKDKtvkEYcOGhtxrOvb3SO3UNtPR0zYWUyifFBumJDfZtlLYUAC?=
 =?us-ascii?Q?uiDMQyVxmJbm48bA3vzIcmLbGovpnetmGOgnECyigWpWSPuhWtQWdKLvABye?=
 =?us-ascii?Q?5lOoIhKHkR2KeJ26GOC52UZmcJ2BS2LCw7g2esPx2RsXI36SBw3oMBtPgIp1?=
 =?us-ascii?Q?j+cw+ftpGEVCHJARcKFgi+pc3Uruu6+q5bC+lOM0lKuycYJO/rLCRVyLauAW?=
 =?us-ascii?Q?l0PLCYU+CwmnhOSCHxTTTYVzETXuvnTJeBA6flFv+N5Mu0WzUjBwpSJLMMaa?=
 =?us-ascii?Q?wwgzIZP2yOT4IDkXvIx9fl4rIcmd/7iXL0yFTDkqFzozYjKmcTYScuOFDuuE?=
 =?us-ascii?Q?5ZJOMONR7AjU69MGZbyg7N+1IWmb2CXIdZY1UU1jGq9nLND2wP2x0O2PdART?=
 =?us-ascii?Q?y8zBfWmIl1GYEagqqEuWOyr72lot1pRL8nes6oinDZZRWXiyvjjCrVSL4PPg?=
 =?us-ascii?Q?Xuprh7ftTT2LLPIyCVNaNc8H7/zoOta81eNLgI8x5iKqoKGvNuysSBmXjVQS?=
 =?us-ascii?Q?/OApVvQaY5l4AzegqRgyLmufqDa3LxIrM6M8Yk3WhJhefK2oTLnypeT6oLH9?=
 =?us-ascii?Q?HR4E16omeyRVZnpDXDkrMBStCjCm7xp8sTV0asC9SnODg6M5rqUHs1oxWb63?=
 =?us-ascii?Q?mxgH9ZOcag=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c171cb0-10c6-47db-c22b-08dec27cecbd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:04:53.8041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6VqjIkobN6G2gvwjHFYbIlgQCgyw4W5lEtMknWlL444ZmtJVsCW1Nm+rQaGcIDSdITBCleSr9karJlRe5DsqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9644

On Thu, Apr 09, 2026 at 01:54:18PM +0200, Herve Codina wrote:
> In several places, libfdt assumes that a FDT_BEGIN_NODE tag is present
> at the offset 0 of the structure block.
>
> This assumption is not correct. Indeed, a FDT_NOP can be present at the
> offset 0 and this is a legit case.
>
> fdt_first_node() has been introduced recently to get the offset of the
> first node (first FDT_BEGIN_NODE) in a fdt blob.
>
> Use this function to get the first node offset instead of looking for
> this node at offset 0.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  libfdt/fdt.c    | 14 ++++++++++++--
>  libfdt/fdt_ro.c | 16 +++++++++++++---
>  libfdt/fdt_rw.c |  6 ++++++
>  3 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 676c7d7..fb4faba 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -279,11 +279,21 @@ int fdt_first_node(const void *fdt)
>
>  int fdt_next_node(const void *fdt, int offset, int *depth)
>  {
> -	int nextoffset = 0;
> +	int nextoffset = offset;
>  	uint32_t tag;
>
> +	/*
> +	 * Get the first node if asked for next node from the first node
> +	 * (offset == 0) or if the given offset is not valid (negative).
> +	 */
> +	if (offset <= 0) {
> +		nextoffset = fdt_first_node(fdt);
> +		if (nextoffset < 0)
> +			return nextoffset;
> +	}
> +
>  	if (offset >= 0)
> -		if ((nextoffset = fdt_check_node_offset_(fdt, offset)) < 0)
> +		if ((nextoffset = fdt_check_node_offset_(fdt, nextoffset)) < 0)
>  			return nextoffset;
>
>  	do {
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 63494fb..8e1db7d 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -229,6 +229,12 @@ int fdt_subnode_offset_namelen(const void *fdt, int offset,
>
>  	FDT_RO_PROBE(fdt);
>
> +	if (!offset) {

I am no sure if corrrect, but previous block, you use if (offset <= 0),
same below fdt_add_subnode_namelen()

Frank

> +		offset = fdt_first_node(fdt);
> +		if (offset < 0)
> +			return offset;
> +	}
> +
>  	for (depth = 0;
>  	     (offset >= 0) && (depth >= 0);
>  	     offset = fdt_next_node(fdt, offset, &depth))
> @@ -251,13 +257,17 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
>  {
>  	const char *end = path + namelen;
>  	const char *p = path;
> -	int offset = 0;
> +	int offset;
>
>  	FDT_RO_PROBE(fdt);
>
>  	if (!can_assume(VALID_INPUT) && namelen <= 0)
>  		return -FDT_ERR_BADPATH;
>
> +	offset = fdt_first_node(fdt);
> +	if (offset < 0)
> +		return offset;
> +
>  	/* see if we have an alias */
>  	if (*path != '/') {
>  		const char *q = memchr(path, '/', end - p);
> @@ -579,7 +589,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
>  	if (buflen < 2)
>  		return -FDT_ERR_NOSPACE;
>
> -	for (offset = 0, depth = 0;
> +	for (offset = fdt_first_node(fdt), depth = 0;
>  	     (offset >= 0) && (offset <= nodeoffset);
>  	     offset = fdt_next_node(fdt, offset, &depth)) {
>  		while (pdepth > depth) {
> @@ -617,7 +627,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
>  	else if (offset == -FDT_ERR_BADOFFSET)
>  		return -FDT_ERR_BADSTRUCTURE;
>
> -	return offset; /* error from fdt_next_node() */
> +	return offset; /* error from fdt_next_node() or fdt_first_node() */
>  }
>
>  int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 90ea14e..f5c28fc 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -354,6 +354,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
>
>  	FDT_RW_PROBE(fdt);
>
> +	if (!parentoffset) {
> +		parentoffset = fdt_first_node(fdt);
> +		if (parentoffset < 0)
> +			return parentoffset;
> +	}
> +
>  	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
>  	if (offset >= 0)
>  		return -FDT_ERR_EXISTS;
> --
> 2.53.0
>
