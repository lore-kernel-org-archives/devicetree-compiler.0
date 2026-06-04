Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F218A4D2EDE;
	Thu,  4 Jun 2026 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608404; cv=fail; b=TxV0uvA4LFrOXhvMfp9mNkocs3UmIolJwhu0pwV5aFzVUFSDZoPiHIrf3s2DADtfGWRcDmgTezFSBOAJQAFZEqo/JwCMHbhe/xqt4FQign/V5E9JNUSSptmOAOQHQm3TNFYFwmGqHTRpu7SWpratLc5TfqLY24ceyMgB4QSkPKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608404; c=relaxed/simple;
	bh=yTHkGHYra7GBcDVUQRCvLvcAJXmSi01eyesXPyPoKdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rBUFCBR02u+Jt7Am0UjbBPfmiAgpoY+IpIYpJ/0dC7yUTeSgJefinof48z0z5H+QNQ+8f2/YCodKDpR0ynEzGo+TqmAkMLrDhNeuwWFHn0ftdXtl+SPI5a/Q3ArQcuDpUEPhJ8tHJDdrJoqXgGRp/ZiTtWnPYust/f8zTAttxyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DQuR0jaC; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DQuR0jaC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rj2/Nvp6nWSdheRg65ggYNh36CNOYX73xI9gbF/AHjkWZylU7Cfrvh/JPB3PWi8AO7gPnmgu2X7hjmJ6/1x9HtPEmptfCk/eef8EeoKvalPVxMj5Blr1fBxvdHThu0oPx4HMWjaKkEPAmqS0RUCy6aN7EoXSIPustrR8ExbtnkcyxiMhTViB+41rhUWR2JzukA7IvL9z0FGiOSwxC5UfhgdbWNNEeoXmH+PnDzqFtLBo5pXiDvoDoDG7GyJSa9srVfRdoEyOfByG5gR991/ngw2m1m9+memghGxNNHTRUhDa2jPXRZV6BqE+HyXbHMymXHIxfyo6gcSYhU4KdRDSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7a0akRl0aYEaQr+0nSo39IKbEaQDzdnGaqIaDk2jc1o=;
 b=GGkulVJodJZh3wXajGnvwhrQYgfev8P2IFYUj2741FIdpUXw6T92E4+fBzBeXZicCbfkc5ihE3AEviruvlDnNfMvoXVX0hwt0ZNhCp1+zHIQdXdTkMYOrGaLNqPgmFo+s3KsbiCHHkhAjaF5SZ7feoahM1Z1UE2I4y30OwG9puK7AHYvGcMYx6JIW4q28r64ymuFWol9kGZmLiw9Kl1H6vLKcB4H6JByfaaPDTekb8hjMsYdHSFKoCjqoHWFoLR6Gmq2WFtR15KfzSIp31J6I8dvDh+npjYDo1jT1cSofUZaobudDvgWH1JP5FlRdw8ddAv58Q0NV1QREKnjTPqRsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7a0akRl0aYEaQr+0nSo39IKbEaQDzdnGaqIaDk2jc1o=;
 b=DQuR0jaC5Jfdj4Wq5tj/Bql5qAwFXHxbdO9zsw9dZptJ2TL+0FDiyaKeKjkRzI46HLFhXHblvlZPGHbVQDm5Cf2NyDd2+v7kg9kSbb2hI5CCxDuE0XunHmxzmHwRM9sXFoCUxyI/zOlLsrffYW/RBi4Cyv4I5jCaptD/di9e0VKMiUz8qBq4zN6GwCiVeHnstM/2M6sRroucdrKwxKWfOMJDBJdeC9SABROmws/KIug0dFiXfFzsVymdsg70qpwjEysEpRLv4kBPPqfcjrRiBCyf7KmB2L49w2cri+Nh24Clt7L5+BEztKcJY+z5O+6MFKR5SLyXuMO/6fUOgBE1wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7866.eurprd04.prod.outlook.com (2603:10a6:10:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:26:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 21:26:36 +0000
Date: Thu, 4 Jun 2026 17:26:29 -0400
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
Subject: Re: [PATCH v2 08/10] libfdt: Introduce fdt_ptr_offset_
Message-ID: <aiHthWs_EDL63QhE@lizhi-Precision-Tower-5810>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-9-herve.codina@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409115426.352214-9-herve.codina@bootlin.com>
X-ClientProxiedBy: SN1PR12CA0050.namprd12.prod.outlook.com
 (2603:10b6:802:20::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dc84be-44b8-4f2f-0e7d-08dec27ff4e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014|22082099003|18002099003|56012099006|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	Ch/mYs2iTV2pmymH4zv2Mu5NI1HFrZK2fRm/quvPsIW6QtaWJR215knEdD5PGU+fBYxApR2m0xkeCdKi0qnj9Udtaxpc6f2pwqRoBmeYFCDxl5Gl+umEvy4mGzcFt3wlugQ9UFAF5VOL4d8IhtHdJ/dImtPdVulnjg0PAuFBz6o6qg/k15pw8GBxvCmVO/+ctRlY9i91DyiNw+4e3IJkJbQMc94a+2oddVE5kMwUIS0qRg+v3Xb5slljxabqtC0bmRg6GYoYiZ7gSDriDVE70nFFrlUq0QGcJxa5DMH1Sh/us04nM6y9Oe+bEnP2hErcHjwqBYmEBDhKlH4JQLnPwmyQw/iVjNOfEOR7VoSArn9oZ5E1qM5J+5dXtV8Te1xX4bs1nKIbwhv5GosOSlIzLosHhKz7PD1+jZxf8n8LbOO5ypcNTojlfSsvKYNe99pDZff72TtCUPxTKgqzUSdMjIs568PkmMpoYUdmYB6yj1aKlBuKcVE1KKA/rBjLaW4TpmiEP/VEy8EwglZc069GEVkrJZ0PHV+dWjw1JksTaQnyMLqad4fmp4B7nRrLSPskoMX/1NWFYVgVk6YMJm25VJJ93M8OMfMxrKv4Yd0YDeh2DYkUpfve6P7iRnYBQ3IfrtCIN3NNtTnaOWm3zoMxexgAg4J6qLQqPFxfLvrxsJ5K/94qfrHmbjYuuaR5f6gL/NLFUZ7t0YvFnqcEDQymH9wmyGMQCOC7D6Oh8DyJMSMXNUAMXb8cRWPIz5Dsuy6R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9KQkjqri4MfgOi9KgrMlBkP6GNOcQFWLo+pTbBKEjkMvkfflvkIXszAJ88LD?=
 =?us-ascii?Q?Yj5sNaIYoKtt5nGvBwIMZ4iPZx7yKlIyW+T2pCZucNPtdli3svxiQvdQJV0a?=
 =?us-ascii?Q?N1EzVZTGhFOvZVR1YP77hbkZ7vdbO4z4eQbMSylzdfJhYHSpqxl1jhFkt5Gv?=
 =?us-ascii?Q?9mY27klPXHNox7YPcSE0VOmXK9zrNmsjTtrqj94oBLfAlscsdkoogTY1P9Yh?=
 =?us-ascii?Q?nOa6hbi1LfHL/p4F9AcRG5Qo/7jRk6zQV/36Y4E4bPn0NTSuc5572R9SMi4O?=
 =?us-ascii?Q?GyOB0pQWc32CEvB1oPDRe/mC4hpAHfI6MoSZbwlbd/0Dji74yogIdKJ+e1cl?=
 =?us-ascii?Q?vb0wYySLNGbJSth86CV0SLGvFKx+MR3d3nXWwH0iCvXxXuEKao7heFHluA/W?=
 =?us-ascii?Q?uXVtTKVljJz4m72PkYsR89HmzJlhHhkECnPPiwHBoPs/hEbfnDSwfeRKCgVd?=
 =?us-ascii?Q?vX0WVqOhNJmtT2LS+9XbsL9nYCuMXkKg4y0hR47A174tARFCGgEshrM/6Udj?=
 =?us-ascii?Q?neSLb5cXKnRxDTOWh3Q0qggbL8tDgU8+NmgTLKiyPy3aPvThIUICsaf6TgTN?=
 =?us-ascii?Q?dKIZcrE7KOHe3px0BomeVBmeYBjrdScwG4oELtwruB9pjcadGpjD/mUV9tcH?=
 =?us-ascii?Q?mhBtxoFx+Ap/zo3Ant6JBzAx5xpAIKqfU8ULlDj1BNj/Q0mapbKC9le0W1TD?=
 =?us-ascii?Q?0FgqUP3adpeRq0yfyGUsIMEedrW/Ct1vzylTpNEWbZHUEhMOMNlpzej15u06?=
 =?us-ascii?Q?CbDD33EHoDUMpRco/+pDgIcR/a7leg2Y8PANCMCUIuH5WDZ9tgife3tPTGB0?=
 =?us-ascii?Q?bvXsaAOzW+W2+DDE6+/C/r28skkvJqVenXbZDtuOvXSukpNI/aPf2WzhUoXP?=
 =?us-ascii?Q?VNR9xdaFgSb07nBoCJ8VPZ6j1oNrfJnvGKcRiMEFw99/cGnbzlpeNlTOQvXc?=
 =?us-ascii?Q?3JDvxfUTxaestBgONbLiO/OJ0Q+gy5lCk9LQvkNYcIJcB+6s4yGy9XqAd5TO?=
 =?us-ascii?Q?kc3vKLfL2Fg8GqvPQHtLnGY5Krlc/SJcJliw8Xo/ENY605ziEA6eYXBGvVeS?=
 =?us-ascii?Q?TXPp2FnyK4mjtCSlFgOKUX42Z9WesCc6RmUK9tSSTOY5UqGOLi7L6jgvUHgG?=
 =?us-ascii?Q?46cd8Jc9Vy7LAnXpWOATeH9S24ciHQ6TjpZoFNzaEbyQw6Mg+T0FRa6BIYHi?=
 =?us-ascii?Q?f4gFc/RloVZP9Sg3JZYB/uOtKfnmq/zeWIJJeu+NtK075xJsSoADFCHco4SR?=
 =?us-ascii?Q?jOx4Cnpzc9qYml9YxoU/IxByEAPYftdA7QAlhn/WUuZM+K+vIv1m56GmhhzT?=
 =?us-ascii?Q?/4GFjIM71YEKkOVi29WTYI8pbvdTje31CS+qo263svR+OiowlDGUp3MyUsY/?=
 =?us-ascii?Q?LvBsUyYHRTIa836TlM5ikpQ9BZ0yrD3MwPO6D9mWqRhd0vgSbmU/tLhxu1Fg?=
 =?us-ascii?Q?5+vyUT/ipBzy8Y0rqDzh5ehTX+L8TZsFerBPRTZYfBgEtXRBrZCpuhlps+C+?=
 =?us-ascii?Q?zdzKGsbMVcOBDzJHPxNvlefFP3LIo+vL7JQuOdIQfb5n8vhqLxTml814xrma?=
 =?us-ascii?Q?nZkkktnuNQxotlYcl6EhgTKVdqND/k3eSL3xe4GKG7YKYhY8LlxV7xgjseeg?=
 =?us-ascii?Q?LKHjP/JHvsXJwJYGCUqc0o36gDRsJpDm4TG9543J+cewF3gnx+EfoTUCFvm6?=
 =?us-ascii?Q?gGA2TuqUXcM4Ttnwu0lIFc2U6h3BgmyIfW3rFE1E7W6lduvosQu2q37Jg2jM?=
 =?us-ascii?Q?QKOyhU5k+w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dc84be-44b8-4f2f-0e7d-08dec27ff4e7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:26:35.9794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh0dUdpy/ipKEL5AjCor11btF2LAfZBKAgcmjJD+EpTmuS+eQyh/bRNsb7msfqAiFoW7gQepoNTRIpb3GEgkrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7866

On Thu, Apr 09, 2026 at 01:54:24PM +0200, Herve Codina wrote:
> libfdt provides internal helpers to convert an offset to a pointer but
> nothing to do the reverse operation.
>
> Introduce the fdt_ptr_offset_() internal helper to convert a pointer to
> an offset.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  libfdt/libfdt_internal.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index c1ae306..9fd0012 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -47,6 +47,11 @@ static inline void *fdt_offset_ptr_w_(void *fdt, int offset)
>  	return (void *)(uintptr_t)fdt_offset_ptr_(fdt, offset);
>  }
>
> +static inline int fdt_ptr_offset_(const void *fdt, const void *ptr)
> +{
> +	return (const char *)ptr - (const char *)fdt_offset_ptr_(fdt, 0);
> +}
> +
>  static inline const struct fdt_reserve_entry *fdt_mem_rsv_(const void *fdt, int n)
>  {
>  	const struct fdt_reserve_entry *rsv_table =
> --
> 2.53.0
>
