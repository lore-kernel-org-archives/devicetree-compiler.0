Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D697378D84;
	Thu,  4 Jun 2026 21:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608134; cv=fail; b=Doacm986vc/KI0D2laMaezlpjMDFmuH0QaVjpiSDKgVDEsDIwbXi8IYlz6HsRLfJckLFLLaEiZfYeo65H/ZKtz+djFnTQBPDoRE7Kfj4v05geyOZdoEg8BAcS1t0PrNLnqTq72pmyHiUl7E5q3hkPlNRA6tIlwil1m5Z5A3/xvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608134; c=relaxed/simple;
	bh=QdAGD2KAd7mJJBmxzsopJxE61boZ0Z1hNnRUNg3YqMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R5UzNwa6CK3C4wjg99dNK3eLEjBd8Xk8TwJ/NmxxajcdSS7nO8F+FtvflgyrytzFZ5eyB/WrF9zaJeBehPfoVqqzinwf0t+BBAehTrwoCSAMBkQE2F+Bgz9GRs+12VWYsZ5kjTlTvAMkFbnxBx0Ie1lYakIspuQk8dqarGk6zjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gynNTBjX; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gynNTBjX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egmnSNNo5hWQEKCwXm+fpVWo0cLv33CJyU7/SZalWQ8Yx7OzGx44SPxByy0m+0r9D/2BtL1ztqYNpxvdx4K8EV6i/v36zwWkkwEG27XPmoBlKJgWcagS5G39EWSdRJj05Mc5rAHbT6KMMtyD5gyf9XesafpiScsxlvBzXDVxwUeax+tL0HT6fatyKTvjMyeT7H3eNbbd3l6YzTlyIan+oJN2GWVhwPBsT/sHn23wwqcX17WIvpTV+cOd+4MJEssZBBqOgwbhmO3sNhOP658+Xtb5KRF0VZuyQsZAcwqCvy2XlJAQ9jAoouGryOiRU4Zof46kKmuAuNdSBKjNZkoSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDscSxIuZOiEUGpDKH3E/gSXix4+lBXNPx3tI4lsf9k=;
 b=Lp+NGj9srVuPeqVcn6iUjynejQvjHkMkIfuzo1Ol7zCSAtiDWdTuC6o+OFlBOuUMQs1yUau0aVUdWfl5GYAAfXiqhSvzZpgd6dSrFveepYHCoIWS1vp1xWUWXMtuphG6J2xMQChBgUKsPdjf2b9cfrnDy6KOuX8nxHulh3vNRes8f6Oz0ipU38kusKw+mJ8sCN0Y5qAaiDfwYHLJRI1/WGcR1s4k94fkFZNmlT4ka9ilh0W/5GcC4FSFB9ZWTuJv77szzlDJBGY1OE8fXGbKBUteiBTYaus5FFwT0eLurd3rXbVNkiNbonDQMt/MiCS/3rRfq4+O/IDsNcxey6JaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDscSxIuZOiEUGpDKH3E/gSXix4+lBXNPx3tI4lsf9k=;
 b=gynNTBjXoHZ7yM5rDLj1WrN9fmCFRQOFFQy04KgazLp2gTZ/jWLGywSMtzSJV08AWIvh6eClE2ZtEIGxt0ULKuiUptAGcQpyRGUkcG6bzlJ+OQt9CH5w8ezXqTuMrHr9wDq3GJVtHkeDLjYRnej/OaL/461lxQyLpm8qk7xMkQWZ9dgZcvNt5w2GGYrtGpcoMTNyTDVu0K/uKTmy91hvfcxujdNuQlDm/gBd29AwV3hHBlqLiWn2UdLJJ1MZrEfynxutNzLhCihXRioHgEn9EmLOaKEQf79hfxxkVV/+iWqfGoPwSdPmIg3YLtvBoiofkx59BupsIu54x+AE6fzCwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7866.eurprd04.prod.outlook.com (2603:10a6:10:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:22:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 21:22:09 +0000
Date: Thu, 4 Jun 2026 17:22:01 -0400
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
Subject: Re: [PATCH v2 06/10] flattree: Handle unknown tags
Message-ID: <aiHseUpjVpSI4DW3@lizhi-Precision-Tower-5810>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-7-herve.codina@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409115426.352214-7-herve.codina@bootlin.com>
X-ClientProxiedBy: PH1PEPF00013301.namprd07.prod.outlook.com
 (2603:10b6:518:1::f) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: f7101f36-2547-4353-c3d9-08dec27f5609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|52116014|19092799006|38350700014|4143699003|5023799004|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	dCRtTEbJWEaSmWB3rOzY/EM0AkvU9LJHsWAKfYu0NzPQWf3DO9b8BIqIzgSeTu+b8YR7IAPRvkHzHT+tgsNsb3bqjw3J1xIH6JQyRyxQRdy60nfZEMKoBfWDuRiGacg7jZr1OpsAzMsLQxEttQXEZvYuX8E6RzV4fhWByJK7XBJMa3YdYadyVskZmtgrHK9eEfZbFCxoOu7AtnDrlRAojci1IFKJfaIDzp9QcsztEqfroPABOGH+trzcoYsjIeIuexTBoOMzv9sdOW9DeODFSGWU0LLCwL0VCOXNbQ83ApRp6UVV2oILbRNuvy7glj/IYpiu81jzHgp6hypT7sB6Th4TCp0Vqdlox2sUAxinzRwsCL/CtU7GPGBOd1iRRLCJ89KP5Woc3pV2ggSUnNZ5mwLXdGFE5dBHmDkZAkNMNBqb00HWmqHD031W0YI3LndfJvOyWWoNjOEWnXVUlPFsio9VySh21QO/lbFPpFif3iAEFdeqbjiImzUyOBZii8FBmleKhE8vHnYeNPxhd3kJQi0MOMEU9ZqtWZ4LRo78PkUHzOIa5f4JjmA03pP7k8KgN/cDai+nMQPdaDSajEg1lTAgQ8bigRymW8yOgaD2VphsxROKtsLcq81OTBO/ZF4aEO/iuaN5Qh8D0sOzIoqWqFN9g0I7Noq9QdJNPxJ/Ev8pl5+Qtpp4/XAMPPHPxx39SecjDqR54PrxmBW3932+IJTVMP2EIA9VLwbV+bri6xF2LWO+aVn3BhDYnksipj09
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(19092799006)(38350700014)(4143699003)(5023799004)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+tSf/aejvg8j9akTFgokYr3I+CkLk9Y4TyJ+iBSgWDMAhkWh7QVFtMLYZw4j?=
 =?us-ascii?Q?6GFXWUBywsiOWG0v+c4mhNtPRu0x/jwCqxRdxQpgI0xMFmscx6YeMOkVdhbW?=
 =?us-ascii?Q?l+2C0UEisIRs3fNUzbaMg4esxN1MAQJzz0ZoImd3i/cfVPV1ehzR42uLrjgv?=
 =?us-ascii?Q?amzOr/1jOXeQTCnRndorv5BPi+SNAHjgPgqvAT8FS+XbVfN3tbQhiTgvp9F/?=
 =?us-ascii?Q?ThvAlC3mM3fIdtKSdy3csLs0e3hXBFujZwzHHVR7PlHOjxgFZOulpU4dVN85?=
 =?us-ascii?Q?mYEieRYHTZ9Oh+dp9UfO5hJOMh4cvNRaFf9RVHuGACAyGtd5OM1RICiHSsIQ?=
 =?us-ascii?Q?WK7hJC46ZTKsjFsIMNksfTwtiVNZyDfKEeyjT2mxXgSA4qGAr7m4lSLGkRlQ?=
 =?us-ascii?Q?/p++zK2hOhUxvL1XpVeDc0oXKifmTL3e3LoM2+cfWCP7eIaFGLiHGI5Uw2Oi?=
 =?us-ascii?Q?BKSeotBqWxkjVJ3yyQyEO74ojcl1lkmdYVZRvrDqdPIdU849xasC7DDp1QIp?=
 =?us-ascii?Q?5x0Z6+MOSAZ6qT6qPNKKld5CSYPY/vRCxaqrq3xsngvGVjCoQXtas7yVgEFP?=
 =?us-ascii?Q?rlvk2L6s8rxJ5bFgryqLlXJPQVkKryU+FJd3IkuUiS6CoQXHJZXWKCbRyykB?=
 =?us-ascii?Q?9I8TAbzs+TSU8dyGkiBRFCdZkU/TxwdUMbpoK5Wj9cTAkRS6PSem0oCjxdnn?=
 =?us-ascii?Q?Gg5BAvY+uIzxl54C9Cs29t4P8UGjcMqIqsRxP6XH0DFjh7w1cY8Cen0sz0DS?=
 =?us-ascii?Q?YI5KzAY/SCieat6dtrID4PgtwP/86m0X5lSojl0B7qCzxeEdWkmvOARPXlo0?=
 =?us-ascii?Q?icfcEcqgPPurJqRBRZfYVgMKY8WZneSOfLavLhc+C5lOsx+leTcpVWQuFhg3?=
 =?us-ascii?Q?uIYf48bD/2WdICGOFK20TcVFMXYKURpp2zjU/Qo65CQEWVnpomMRBM0BtZKQ?=
 =?us-ascii?Q?CaEjIdaGA5zOxNWlFHURReWK0za351vgdf6mej8QwF1E5O9O3zBN3WfLXtnt?=
 =?us-ascii?Q?vyRXiTkvDF6Y04KmHsO66ruxgZdAO6K/cNXJ+nEadWxsvuteiL26YpkMthfl?=
 =?us-ascii?Q?lj75dGqim9vu71uqMJBuO+UIJGPUUL+Ulf3cOyHo7KPnGH0M1M2e1JcHoPgR?=
 =?us-ascii?Q?XUKrwG09uzSp/g7EaW7tDwKS6+ENMJaY5+R4GUdP7o7h8QCeMUzEiJLwyQdo?=
 =?us-ascii?Q?sLldXnhhwhPOxfL/FUhyPfoRbt6O9L0CPBds4BJ/d7jfVrJdl8AcZimszopv?=
 =?us-ascii?Q?TUU2wddHtALx3/lkAo1bJbWKR0NSqmTR3fIzPnly1xN2d1G/VxpG2yU78La1?=
 =?us-ascii?Q?Aj9kxFG/AnUjcfCDuOX+t6+OdiRB0f5QpopoGpvX0fOjwvVHz7NhDbegPqqy?=
 =?us-ascii?Q?ZROGu3/rk7rNcsOv7RJZRwIvexKuUK+3L1bRADRp4y3gmxh6hAk7ef26wa6O?=
 =?us-ascii?Q?vNJW6HtbUYFhi4+HJdnmajVuWrcImL8cZHYMO7c3L0Gs5fj2gDMNKsKjKo9v?=
 =?us-ascii?Q?hPdStXcS1fDKxFxgKhG9418zym4HvXRz4Bs55944dyf+c5ciZxH7ZF+MxcoW?=
 =?us-ascii?Q?WqPaUn64y4Mtl8rIrNq7G18VK/BzYcvagxL0qAs438GwDAF3kW81Y0EnB5MR?=
 =?us-ascii?Q?yarKUJLyJl01Esp1MUbwFnCECkfM8YVpEbHvA8mRj6LGl5Kwof9CSuNEgkh5?=
 =?us-ascii?Q?M7iUjRjQsY2SaeD9UaNg/sOx1DRX5p4SUdSSfeoj/hVJu/4+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7101f36-2547-4353-c3d9-08dec27f5609
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:22:09.4784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vh31yJRHgviCOgIhtp8wFW2TQ3GOX2eRcwxv3gOYSDU99N3qYlpcV7bnkfvVrdNv1TPUvI+S0HWPz+NYFgcJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7866

On Thu, Apr 09, 2026 at 01:54:22PM +0200, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error when they are read.
>
> Handle those structured tag.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  flattree.c                                 | 65 ++++++++++++++++++++--
>  tests/run_tests.sh                         |  5 ++
>  tests/unknown_tags_can_skip.dtb.dts.expect | 19 +++++++
>  3 files changed, 84 insertions(+), 5 deletions(-)
>  create mode 100644 tests/unknown_tags_can_skip.dtb.dts.expect
>
> diff --git a/flattree.c b/flattree.c
> index f3b698c..88dbfa7 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -579,7 +579,8 @@ static void flat_read_chunk(struct inbuf *inb, void *p, int len)
>  	if ((inb->ptr + len) > inb->limit)
>  		die("Premature end of data parsing flat device tree\n");
>
> -	memcpy(p, inb->ptr, len);
> +	if (p)
> +		memcpy(p, inb->ptr, len);
>
>  	inb->ptr += len;
>  }
> @@ -604,6 +605,61 @@ static void flat_realign(struct inbuf *inb, int align)
>  		die("Premature end of data parsing flat device tree\n");
>  }
>
> +static bool flat_skip_unknown_tag(struct inbuf *inb, uint32_t tag)
> +{
> +	uint32_t lng;
> +
> +	if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
> +		return false;
> +
> +	switch (tag & FDT_TAG_DATA_MASK) {
> +	case FDT_TAG_DATA_NONE:
> +		break;
> +
> +	case FDT_TAG_DATA_1CELL:
> +		flat_read_word(inb);
> +		break;
> +
> +	case FDT_TAG_DATA_2CELLS:
> +		flat_read_word(inb);
> +		flat_read_word(inb);
> +		break;
> +
> +	case FDT_TAG_DATA_VARLEN:
> +		/* Get the length */
> +		lng = flat_read_word(inb);
> +
> +		/* Skip the following length bytes */
> +		flat_read_chunk(inb, NULL, lng);
> +
> +		flat_realign(inb, sizeof(uint32_t));
> +		break;
> +	}
> +
> +	return true;
> +}
> +
> +static uint32_t flat_read_tag(struct inbuf *inb)
> +{
> +	uint32_t tag;
> +
> +	do {
> +		tag = flat_read_word(inb);
> +		switch (tag) {
> +		case FDT_BEGIN_NODE:
> +		case FDT_END_NODE:
> +		case FDT_PROP:
> +		case FDT_NOP:
> +		case FDT_END:
> +			return tag;
> +		default:
> +			break;
> +		}
> +	} while (flat_skip_unknown_tag(inb, tag));
> +
> +	die("Cannot skip unknown tag 0x%08x\n", tag);
> +}
> +
>  static const char *flat_read_string(struct inbuf *inb)
>  {
>  	int len = 0;
> @@ -750,7 +806,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
>  		struct property *prop;
>  		struct node *child;
>
> -		val = flat_read_word(dtbuf);
> +		val = flat_read_tag(dtbuf);
>  		switch (val) {
>  		case FDT_PROP:
>  			if (node->children)
> @@ -905,14 +961,13 @@ struct dt_info *dt_from_blob(const char *fname)
>
>  	reservelist = flat_read_mem_reserve(&memresvbuf);
>
> -	val = flat_read_word(&dtbuf);
> -
> +	val = flat_read_tag(&dtbuf);
>  	if (val != FDT_BEGIN_NODE)
>  		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
>
>  	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);
>
> -	val = flat_read_word(&dtbuf);
> +	val = flat_read_tag(&dtbuf);
>  	if (val != FDT_END)
>  		die("Device tree blob doesn't end with FDT_END\n");
>
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index f2855dd..d147011 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -881,6 +881,11 @@ dtc_tests () {
>
>      # Tests for overlay/plugin generation
>      dtc_overlay_tests
> +
> +    # Tests with "unknown tags"
> +    run_dtc_test -I dtb -O dts -o unknown_tags_can_skip.dtb.dts unknown_tags_can_skip.dtb
> +    base_run_test check_diff unknown_tags_can_skip.dtb.dts "$SRCDIR/unknown_tags_can_skip.dtb.dts.expect"
> +    run_wrap_error_test $DTC -I dtb -O dts -o unknown_tags_no_skip.dtb.dts unknown_tags_no_skip.dtb
>  }
>
>  cmp_tests () {
> diff --git a/tests/unknown_tags_can_skip.dtb.dts.expect b/tests/unknown_tags_can_skip.dtb.dts.expect
> new file mode 100644
> index 0000000..a11ee57
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.dtb.dts.expect
> @@ -0,0 +1,19 @@
> +/dts-v1/;
> +
> +/ {
> +	prop-int = <0x3201>;
> +	prop-str = "abcd";
> +
> +	subnode1 {
> +		prop-int = <0x6401 0x6402>;
> +	};
> +
> +	subnode2 {
> +		prop-int1 = <0x64020 0x64021>;
> +		prop-int2 = <0x32022>;
> +
> +		subsubnode {
> +			prop-int = <0x64023 0x64024>;
> +		};
> +	};
> +};
> --
> 2.53.0
>
