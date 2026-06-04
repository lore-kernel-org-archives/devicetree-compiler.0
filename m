Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837593FCC;
	Thu,  4 Jun 2026 21:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780607993; cv=fail; b=IlBa4qOD+nr82Q+LuQey60YEAETmiUjonT1ZK4cSxX5sTuFUJWsWtB8Is/5nQUHeT3G8OJHtgDfUtPLvaRLVse6MiJPjupBlKD8LrB0Bfh3PvH+m6HLhmT2tV6zIiWJ2Von8qsQrS5NMh70GzhB+EaUCcbPt4IhE0HPgtGUcAb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780607993; c=relaxed/simple;
	bh=VCyz1+dd6aXdiPba98T/OR5VmJH098XIDCVv2r90Y6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fr9heiXKlWPrrLbvC1CunCk9f3RcOSfOMM4ngoF36s5I0SQdYyThn81urS8mZyRx9bDR95g6VB1wwSDh5E/G4jeXtnfKPoFTfB4TOZYg2Q21z3ihokNx/kTVx246VJ26FjgORJAr2hagm85FcTlo7Ulr6f33wxy5p5DpPnd+wlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nxjweJ9P; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nxjweJ9P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fG/vRZdoksLK+awc1P3j+Ggq6cF/csGjw+wE95H1OX3fz2xZHY2c/AiGJjDu3gE8R2T/InuNAQzjX0kJCM64mxoyjfOAH5BOguguBW1u6nBLYNR85RQod8vRHoFMsd4obO0Up7CJu4AvxZtaCkm9F1X962D1T753xYh2xnvY2pCinmXlp1GT96UH2KVLcpX+fo2DGZDuPaWOBSnc5FkGviJuIrv7RmCtbyLflehLGd7XjAiEHItABe6qsOtulbdbsBClQyl40+mJDtWxu9T9wJmE0CGWCKCC1dMRTRlnMhGXxIErDZsRo+ErwWhMCvyk0930HQJkK1mBaRLJjutBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alDJOpnhSQ9VFOHRaltlrPcMAuPdT2rVOq6IUD3oe5k=;
 b=Z31QjcBTuDyRc7OIyPGgxTLDIRCFxVMvBpz6N8mYbPjvDgy8OKdu5zwAReZzX9lVtSzOruaVwwN2AIOWDOg7OW/OSNcMU1jwdkyzbkXc6f7tw870Ih/8b5fZHjcWKmpxjuR3xLAdYtDCXxJxOINbA+gDbxL6FUEiw++o8+o8YZboixxo2Tj3jgmKVo026qz0PINICWbW9fkrrCgj3lmdjuAmncZWSE6TioSklYRqOiYvMfNjz7sozqUglVEIoHGzLBNzuBdGVWrXUZgFEVdqj7rIHSrSzqnrCJn818O/XkVqeGkGfa72drjiNDo3Z8NyytqjFiNC49snup8AOCjybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alDJOpnhSQ9VFOHRaltlrPcMAuPdT2rVOq6IUD3oe5k=;
 b=nxjweJ9P79aV5tzLDmsGzPNQ29xosHkSxrD1IexFG1opNOw0vLNjnap7B5sw3k2Po1AxpR6ks2ttvbazcNdWUucrl9RPIm3YYF3zRqj2W5cXwrKrhKkoRMfPrwjbuHCuxSDbLiuYiHvXVJ2814NHoISnTvCHMqn9KWOqefhv5tRCMlg3YZ77Pvd5lRExDJkIfZijQb8EL9OpdYXyb8K2uEvaSuadzymOaIRM1tGgjg/T6sqVVzyDLigIV7sNPDvGn4/guZ0cKFYpksCvxnzWev0bm702aYos9u4CR7vbm+poeh6Fqyv+uz+5p6VgSxo7ZNJEWPZ+HctUn9XczFS9ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7408.eurprd04.prod.outlook.com (2603:10a6:800:1b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 4 Jun 2026
 21:19:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 21:19:49 +0000
Date: Thu, 4 Jun 2026 17:19:42 -0400
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
Subject: Re: [PATCH v2 05/10] fdtdump: Handle unknown tags
Message-ID: <aiHr7l0CsJjRem1S@lizhi-Precision-Tower-5810>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-6-herve.codina@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409115426.352214-6-herve.codina@bootlin.com>
X-ClientProxiedBy: SN7PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:806:126::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9816d6-8ddb-42e1-d0e2-08dec27f0270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|1800799024|366016|5023799004|6133799003|4143699003|11063799006|22082099003|18002099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	s1LUebdqTqnITU2/usxOnyXVcCbWpj7M8A+tMte9PMGKLij6+XXdrOLyN6WMFcnMqsXj1vt7rBeREdNWoY3rShaDriOAsweqDX2KVTM75dviNnl1804mWVNFDs1NxPprL+KHz5qRb+etinJmZtJNh8yOZNtR2FZY+LETEhYW5Z761E2yKAO4dUPtr8CD+xbtTupBCCeN//aJ5TqhBcEHuDE9ucTmwNw3Zjy1GzJEd+15k17+UsnM0GdmkqY6bqppKuuhNq6HYSvsCVlEVpuCDJmMWitIBxCWSRLOdjxgQhCPH4JDmlEvsNGeko0ZpzfnpYPNAWVZyR0zrOYjuhvS4/sUyelOnGy1MUP6VXUGfQsdHSAvDINSrT0sNUwo4LXgEV/SGpU7VjrK8gw3omO+qPrmJyuNnzozV15N/vSb6tokMFWSy8Rl/RoKVLpV4Z94BsbCGfpzzkiyPFi5wKUPQymeKzS4pFvnuUezXYU3p+JD7bnuoTmt/V3sOco2da1yYcEkhBmA2WoDHnD5k44MN2ZGOkZzorpYfPlc078QB7uO2Nzj7vLkx778DebiETYoVWjypyJ92Parp/3E9GmVqb2N42TkPwUiAR75GUi7rY7R90IXnbFT8ALm3dag7zIWm/lyKv04UomGZevZbnI836VpE5F5PppJU6YaITe2deMd+wc38yQzQiwbsh1PRqYRL8ejo5831fOrO39CQUeeRzwHi1VpHebhFHxMhuEM5A3WPa1cGwbW5v5FdtSqS0sy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(1800799024)(366016)(5023799004)(6133799003)(4143699003)(11063799006)(22082099003)(18002099003)(38350700014)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZPRmqQZDVrW3eLPdk65ht7oByIevcOCHrhpGKzrKgrc05ugnzl2UjRUfl/rQ?=
 =?us-ascii?Q?IOoai158cVWN1YGCKl1Q5v2On2c9ZzoyTQKtotLbjC+pDTsLntX/WM+TqhTu?=
 =?us-ascii?Q?nPMvf4bXcctG/Km2PCnpOMRuWQQGJxP3yzARZbzkcbE/nfcc8X9bw1ctR1H0?=
 =?us-ascii?Q?PIe7ytTqRDD8jE1/sFVXKXkHAabvjndphqqejN32twQgOIk8NdexZfvnFjch?=
 =?us-ascii?Q?uVQUHhkA7Q6z1keVlQ419bzGrxtyK8+9mg8KszpJm0nZIfvXwhDgpQZPKvpc?=
 =?us-ascii?Q?kBWqM9NLAUHQsUi3SfTUMYPEDqwGQK8Omh0SbOVHOgmpRCOC6HEIK9qCVG/R?=
 =?us-ascii?Q?Lly9F2/tncHq0ncX5xMkguuxzLavt0ihq01rQWyjgp2Vj6jpL2A6+nuadU1Y?=
 =?us-ascii?Q?GobpaldJnQnsfTc8AMDr+4dZAtYcppVcJ9nOPGtxG7zmnPV7hcV9aI0QrkHF?=
 =?us-ascii?Q?UInH4tzfNbWr3bIyr/CO2/P8q+k2UL0d/Abf3IpSKU2Z6KpuddG5ykNnuVSL?=
 =?us-ascii?Q?0QpTVsmDkm9BiYaz1vaWvmh/JtX9KMiq2Dm+XuCsYDj2t+ViSRbFY0zoL6zF?=
 =?us-ascii?Q?esPWwkx6PLJoaqFGT6slKZS780wZCEY/lX8+iEXkKXmQ/f2c2zCktxLqGYKO?=
 =?us-ascii?Q?ErRb5wa1/D7YAlg0N/6pWZCJwGS0YZdzL7srD3qADOu1sXEnHuOZNc7acsOk?=
 =?us-ascii?Q?Sdp780DhH4HxBIUbtLin5Qnid2Ngp613i3QxUu8Ci1IQuFJnQ3Y/1fjmMPhU?=
 =?us-ascii?Q?xMRhheq8422D8TMPf7+GcoV9c7k/O6ylIyexGm9E2/aTFzN5tS2YE59Q4rrT?=
 =?us-ascii?Q?z+bBgDQDQJVKNz4jnI9MMurglrPM11pK6f1O/pWv1Zwec+I5gT8Iz6s0nqx3?=
 =?us-ascii?Q?GJwMj3fQ6PZ7yUG9SjvMO4k4FROiVBQH6kIr8mvaPV3ZlIE24aLMirfIRzHk?=
 =?us-ascii?Q?xOaJjcr17deGNKHyu3ILbKqu3vjAESZT05Eg/kl+xVCaURMyjDete5c/hRoZ?=
 =?us-ascii?Q?pGy62IuF4Ti+NcHhx54orWmf8ynQ1Wmn2vmu/ixLkbCV3gKf0LJXrzG/szHT?=
 =?us-ascii?Q?nQKaPHNFjcG8oJ6q7Ny5tm836xLqCbivT1K4Ba8msKI+EjAFKijte3gtPChn?=
 =?us-ascii?Q?NX5xjPgBdj7/V1z0AmeXhcg1tVTXximDsCQKhG6xgM7/cRExTZM8tqUKsf2Y?=
 =?us-ascii?Q?50Ww960XUMRMuojbLTg/MpoMMSo9YlgwVDp9wOpBkhz2AwvCWfCC7HiljHaX?=
 =?us-ascii?Q?W4kVOBMxcR6W28OOp93KtQ3vP3x9sIZ9yDnmBojCwGLRCCz9N/cICEdDT4B3?=
 =?us-ascii?Q?VzWBDLnkTzXC8e97yFKi1tbuYHgeL9Sf0iSOtjQ+0aaG6nodVzvJpXiqww+5?=
 =?us-ascii?Q?RpYFkz8eXctk7VxFIai1zWSnOH1LYacQLHCj97t1EbMGMveA/CKxMOoht8zf?=
 =?us-ascii?Q?B0n9nzhPL1Fc31IkdjaHVmABzrAdPiSnB/IDTVWqPKvJsNtj8xcDXQxXPDoH?=
 =?us-ascii?Q?IHqJE7iBnFJ/QtlQKoCNYD12ACfAJBT6zBodmR+zlB20lMQ8kgMLY5ij3wit?=
 =?us-ascii?Q?/WiVNcEqvPm6BTOCKodKsFAbAEtf16776CoonerVgUdkw90ad5g4iLtLjsMv?=
 =?us-ascii?Q?FL8CFN1A178msNMpab5v+gclfltIQPwCvccvjfV5spCK1NKVJGtwBWFKhV3F?=
 =?us-ascii?Q?WXZzGS2GxFqLpGjXy3bmrkoezBBF4HZBbvQu0VzQZgsCDAnS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9816d6-8ddb-42e1-d0e2-08dec27f0270
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:19:49.2048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iShzIVlI9uDOjvhxhBZvxLbfs01NxeVMVugrUzFMINa7sLyaEBL9sVSHXr6NI3HA9htj0KxdLT8xzYJn3lmrhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7408

On Thu, Apr 09, 2026 at 01:54:21PM +0200, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error when they are read.
>
> Add support for those structured tags in fdtdump and introduce a command
> line option to dump unknown tags that should be ignored.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  fdtdump.c                              |  45 +++++++++-
>  tests/dumptrees.c                      |   4 +-
>  tests/run_tests.sh                     |  41 +++++++++
>  tests/testdata.h                       |   2 +
>  tests/trees.S                          | 116 +++++++++++++++++++++++++
>  tests/unknown_tags_can_skip.dtb.expect |  29 +++++++
>  6 files changed, 233 insertions(+), 4 deletions(-)
>  create mode 100644 tests/unknown_tags_can_skip.dtb.expect
>
...
>  };
>  static const char * const usage_opts_help[] = {
>  	"Dump debug information while decoding the file",
> +	"Dump unknown tags information while decoding the file (-uu to dump data)",
>  	"Scan for an embedded fdt in file",
>  	USAGE_COMMON_OPTS_HELP
>  };
> @@ -183,6 +218,7 @@ int main(int argc, char *argv[])
>  	const char *file;
>  	char *buf;
>  	bool debug = false;
> +	int dump_unknown = 0;
>  	bool scan = false;
>  	size_t len;
>
> @@ -198,6 +234,9 @@ int main(int argc, char *argv[])
>  		case 'd':
>  			debug = true;
>  			break;
> +		case 'u':
> +			dump_unknown++;

does dump_unknown should bool?

Frank
