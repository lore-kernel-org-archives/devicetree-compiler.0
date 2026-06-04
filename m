Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D9237DE8D;
	Thu,  4 Jun 2026 21:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780607354; cv=fail; b=Qv3D6V/2QjfDr5C89AXRhyGeJCs4ZrPZnSneOVGYB1yX1DNQcpKau19tW3qkEKxDy/eMMbMbBwq5E5HYtaa5gd5QZhpieuXwaGw/wWy0TpIw7f/Bc8f8JpN36wCsWSvYNNQpG5pR8r96xiD90Z/rYgtnztRO+QOsqBfeZ05ZrK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780607354; c=relaxed/simple;
	bh=EzTKgVBS8g7ljV5Jyf2n2hm9LjYlvq2ePKisWx0MMTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GZv0N4nM9Gf6/lnG6desIVHjWd4sVV9CWXo4atkbreBUZMD+SpD1sTo5Zb4S8cNWag6ZQUSGbsaYZ7MhJM9fySC/wP2UQG0PTVgZlenffLGyLZ1Vy1U1iWI0nYowKFZQ+L3nEuuZi/sUdKLJz2LQdZAiXe8swHEyPTz/n7J8FKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zg0pWUy4; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zg0pWUy4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7QyqaWybFbFx0OEkWYOEZViDmh3T0XhW098Ms56AqTWvGn2v0QPWRASUfQiT37B4RGXjZrNEXOyfYSBZ/TGJdFeV0bqV5Gw36cOY5MkMp7RQrMSjHNEGOeLkWHkhVxKalH0pHvJHkAL7lQRDwGtQymbfQZZD0bFGcqdZdACBZf7VXRF8sYaaHtyVeRg13i+P5HDVtA1HYtm36drxsZJ9xG6ojEqRpLwqnvriLY5N6RyFUdifyr40VJTzv0Z9gHxOEQbQqp92FlJbfpXY3DqZWmUI1j9h1tFQjBvHkrgFjmjtqC4Wc9/1aXCxfwlwXwiIVvJB9l24tGydd7oTWXcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4GZY5EDfQb4FfPX8pWZKg2D86QGWVMS+QWeEE1KJEE=;
 b=xLRmCwEqhlQEzaF30kWUqK5aYmUtHhlWODD8Mm2HK4wUNlmIx78/pW62UlkYfqGKRWWxcUPpLiVDPLj8YVdPy+v7mz7Iyh0tSMnvtXcGahU/D/kiMq4hY7eJIOFFr8n1Y6q5bN0mffhBrb3qiGp6UJgJk4cEioxH3L6/2Z5k3J0L21biKFIWsdH74ALpJtJC/mXyiZxEp6y/r45NLUdmdi6CBUhkA0Uxd6kVUPa8YMHXzutBq7/3TmKQB6tSaZTfO709Kk7rctPQbbbJgAdY/8GAA8LoYTmnFPSuz74QSFCJxMJdYlT9AMt2RZEp18Fs3YMiwo3PKxUMNXLQSu8gMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4GZY5EDfQb4FfPX8pWZKg2D86QGWVMS+QWeEE1KJEE=;
 b=Zg0pWUy44E75CUUO4y0xHCct+1vw5FhppZ/tU4EgCye+ulYCaJ9zXPewpyHpf/KhUROs7TLHXn2Y0Oaw+/x+EzzF72K4rUnRIkesBxZ9mAp74QiMhwglQhqEOCILSBWVjbOEQnfJErR81ulIapnqmne/x73X4qCrn0QbK6DxfN3vzada0u9rsufC51+bN65/KW8+Tm4r51lnhabNRBIYAkQeGxCISk2j11TJOrG5eFIHyS/KvTEWHrioYitTx68Uzpt++7cJ/aj4xaTeZ2WeZafUY9FYl9lyBmNYL4zgRst94CmRdRnajiTuUE8NCLcmPjsUN88Z6kGHMHObCRuavw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 21:09:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 21:09:08 +0000
Date: Thu, 4 Jun 2026 17:09:01 -0400
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
Subject: Re: [PATCH v2 03/10] tests: asm: Introduce treehdr_vers macro
Message-ID: <aiHpbQ6AM-fecPwv@lizhi-Precision-Tower-5810>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-4-herve.codina@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409115426.352214-4-herve.codina@bootlin.com>
X-ClientProxiedBy: SN7PR18CA0025.namprd18.prod.outlook.com
 (2603:10b6:806:f3::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: 58775a47-99e5-4c75-f98f-08dec27d8487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|52116014|7416014|38350700014|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ybf9E2mgqqeffJ9v8Pb5yg1LkRMUelGp0qOVGAx4fpSGB5h0KP92oi9CSNeZwX8GnXVfQQipc1COoCKIu8uDfJBKKfTdvXE3f2V0YRrtON5BxWVGewUAnR/QDVeWf99dklM1pr4O42TBCmapubjKYe/8TKDPJQSU0pM/pziANlAju2diUDZ1N1sLXiAWWd8xhRflFUWNjcfLJ9S2Pn5ZD0ewYY0dsPnt+Pv28msIC7S+tnfhCpheREWm9woUwgy9/82I0+HD+YR0rl5BeYmKSoHLD8bRTn+w4De0a3x02U1hJklkt3t9eB9/F7hRPSYsEpKmjaYMHAPNIU3D6ZPN2Vxx2er9bYPRvgHKCFZ48y6wytEKFCQUd+D6kE/pY0eopiz7llDySdqxwvJXGdMlj5UORS2d+EbUTuKrvxXGnUmWp92qXEzVFN59zEaHTrQVkubp8d7HSWexVG9Jkwb1hD7s5DYvckL2dpq0zl1cG+Wky01bsqTsnUCknsMZK846HUNnreOTZd0hx/8z/n2W7Emib2N8w2TNctIvp+jpZw1s8rF5tsGVFyTmp4qml29Mi7aP5YgOg1kiuhTGh+kNYJ+vAorzJXv+4lIUSXm6UAcpeV6GfegtTZsNAjppMmjWpVTivyhbyKYaFoDjkgX3PS9nQhaE8KqmHZ6x9OXby26xnXAPO39o3KDQI4muzDrZEwfBk1IJXCX6HViTY6ccLu0pUzfLPfiRmgYNJ6CE6v3x9oKS4qHcXJI3uxX1y+F9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(52116014)(7416014)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mGdnGFdiYHmCbO9TsUZFhSPLvWluFnVCo7M7zLQhNEe0iRCyM0JukCgd5LaE?=
 =?us-ascii?Q?kmu4PnJSQHH7UUJncyu+q6ZK0oIdemEMvMDTXdWm9HbII1vXpT6NQOV2+d+L?=
 =?us-ascii?Q?Hwrv0g0LyQfw47VZaKQtScSiqiDHwUsyNKXzRjeibh/bCO/HWvCWN4KQkycY?=
 =?us-ascii?Q?ptC+/b3hxkwOWEhrSenztvNIWNXnkfGHWZVXHFwptRhQMK6V8jFtU9Yiuf8z?=
 =?us-ascii?Q?GNfN761je5vB1+Fxdq/9gl/eBVo1I8KVV0wuWVhtXF/xI87zzQLljtfSM87+?=
 =?us-ascii?Q?mrXfwNOnItgMFo1tpq+p9FORAI844CM8QzTztGAkF0l/uxnqTJq2L9/KncY4?=
 =?us-ascii?Q?4zjmpycZzu2LC3uLE+nmUpwco8s2n9vVuUuKPFzdUR80wTNCFJqe57dhURUZ?=
 =?us-ascii?Q?5H4nYM5B0ga0FIyhT2jFRKzusN81PnPDlSdYPK80p6E+VUe63x6CEwRwzc1c?=
 =?us-ascii?Q?lX9jj/5gPzhxRPSd9w5OlnuI40Haw0cJgJKfpRmxvqTQ0YPPMMDbQxFBw52g?=
 =?us-ascii?Q?k/9JJCKrxku88gm8PH0d0Qscit3OaLYUKDbRcFp2e6JACvp9hVB/qF+FyLph?=
 =?us-ascii?Q?Ph854q1sP4j2mEP6p3t1HWsufuWN8XsjxWokuWZEKW0VGYz6eItq1VuFHLWu?=
 =?us-ascii?Q?7g2dNEUFuXdYQPkHwYPbLhmsFuadrrEMT53NqGxaDcwj5VP07/Av3eQL1uvs?=
 =?us-ascii?Q?Wt9tsqfi8Nkr7g8HmOPCJNRFiYhqss2P55L9TXy80CP8wkCkXAyR86V7QVNi?=
 =?us-ascii?Q?KAhqwFA/KgLGzyGJ0K8Jr0gRQYnEwAydlvLYNwf5ldPlJhjKf4uWyvW/Ojpc?=
 =?us-ascii?Q?hF1ngjTugJJuDsoasmuPv1Ht7ebL5V+hPTM2iSqm9B6d2DBUe2A3io5ltgLg?=
 =?us-ascii?Q?/0RmJJhEDYVEB3530vv9Dvl9qNs4RSqFVGwuXnYG1Bjvm1cioXTsUSfLeJVM?=
 =?us-ascii?Q?sBauf3AmIpyfdoabibDF7uAXP+DKDBdrCCqTDV8C9enSLygYZLxM5rhC58mm?=
 =?us-ascii?Q?D/S2qrx2N2eTkfhWegHI0bmrXPhacS70Vl+Y1EcnuXAMDgz+1skJqgG5k0R7?=
 =?us-ascii?Q?x1He6ncKmcDeAoplvp0cTZzj+ezNdfbzQVqP9VFZOKvkAlGL9263hs4/qFoj?=
 =?us-ascii?Q?Ey9OgN6Cw032hrCu7nMH+Jszs/MTVQEFuS7mzr1AEfshwBfG2uSrZ4PgCWzo?=
 =?us-ascii?Q?jLFHuMigtT2o4lkXVxMQQCa82ZMkutrraYdbR+FXIatQeHKuiNVzEqaIdkgc?=
 =?us-ascii?Q?0p/d7qinajv6FqWmDiPfML9v9OsPosK6zt/zgy5WGzt24s/ppdXH3gv+wqLp?=
 =?us-ascii?Q?x/NVnnO9UVd2lMjvR5Dg+pIsVJZnZgSbtkS7S+c/yWQSS2WvfbNq4OS20kUV?=
 =?us-ascii?Q?Q7pd4UC2ETEvRMc/GModXPDYd91FF3rLXBqRjJ7YL8VTFLw2UZRJL9fB7arS?=
 =?us-ascii?Q?Yuz4kda60TFNOP9XHKdk+jR6QB9R6mh6ukTntuhtIoTma43Hp4G7uZZOthEQ?=
 =?us-ascii?Q?2VTPcb6vCnqi84NwCbYdY9bbvhPkhWb3nG9krFYk7w/rxEakiCO1xv3Ov1mC?=
 =?us-ascii?Q?ASQZlW5jaalVTqRuAoAztPels0xOnirQ97rycWf74Bz84U7alsDMEkA3JitI?=
 =?us-ascii?Q?1oNiLK5OL+RrHOI7RHkyAqKZKTL1fQ2DfXkYzykOPK7N/OCBxyxk9069cAmu?=
 =?us-ascii?Q?HWHlDIwh9GLoyJJcTrYbV/H1H2agh14LQpUOgDqjW33Sek1vWf3lGiFTpKCX?=
 =?us-ascii?Q?yw/HZJCV1A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58775a47-99e5-4c75-f98f-08dec27d8487
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:09:08.5241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEkCIXtpzEQtvOkFqsYUG+NS1ZAubdK7dZZzWwdh85c5rE7lzMdftm49fe+a1UFVAIIpEC5FqDMivSFZTiLyLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9644

On Thu, Apr 09, 2026 at 01:54:19PM +0200, Herve Codina wrote:
> tree.S is used to generate custom dtbs. It uses the treehdr macro to
> build the header part.
>
> The current definition of this macro doesn't allow to set custom
> settings related to version fields.
>
> In order to easily generate some dtb with custom version values without
> duplicating the full header computation, introduce the treehdr_vers
> macro.
>
> The modification doesn't introduce any functional changes.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  tests/trees.S | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/tests/trees.S b/tests/trees.S
> index d69f7f1..4db2b9b 100644
> --- a/tests/trees.S
> +++ b/tests/trees.S
> @@ -8,7 +8,7 @@
>  	.byte	(\val) & 0xff
>  	.endm
>
> -	.macro	treehdr	tree
> +	.macro	treehdr_vers	tree vers last_comp_vers
>  	.balign	8
>  	.globl	\tree
>  \tree :
> @@ -17,13 +17,17 @@
>  	fdtlong	(\tree\()_struct - \tree)
>  	fdtlong	(\tree\()_strings - \tree)
>  	fdtlong	(\tree\()_rsvmap - \tree)
> -	fdtlong	0x11
> -	fdtlong	0x10
> +	fdtlong	\vers
> +	fdtlong	\last_comp_vers
>  	fdtlong	0
>  	fdtlong	(\tree\()_strings_end - \tree\()_strings)
>  	fdtlong	(\tree\()_struct_end - \tree\()_struct)
>  	.endm
>
> +	.macro	treehdr	tree
> +	treehdr_vers \tree 0x11 0x10
> +	.endm
> +
>  	.macro	rsvmape	addrh, addrl, lenh, lenl
>  	fdtlong	\addrh
>  	fdtlong	\addrl
> --
> 2.53.0
>
