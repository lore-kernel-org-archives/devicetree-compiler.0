Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2105.outbound.protection.outlook.com [40.107.20.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937516F278
	for <devicetree-compiler@vger.kernel.org>; Mon, 29 Jul 2024 22:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722292778; cv=fail; b=s19GBcXuS5Ee/cPOP+pf8HeyBOI5oKz8WdiRzd0MxNkATCMTZjxGhGHJM/qkICsDqatXS5Qbc8gTZf1QQOCf/BwWiGy6r0s37H34kNVweR+CTB0g1SU0Viph9gga3VSX+CMYpZHlslpLZG+I/KvCVSeJyMwJjVQFNZN1b5OLTj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722292778; c=relaxed/simple;
	bh=zM6KnegOkG4D7XmZiDRo/BUtCs+F0RNDtwJdB8C0TUI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NHH+jiboWNU5UFeIooL2xfvoxh4KbKb38iVOMC/tl9AC7v/cD90wvfE3clxrYA0/ViaqO5EGR1/4/vsRcN8MgXi9t26HERV/wYq0J2R7b9sLH1piAixjuaNYxTSZRNAZsc6eOlzdNMbLaa6zN99CJ+RrBvKadw/x0iFzdQoLqSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=b5iSbJBP; arc=fail smtp.client-ip=40.107.20.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="b5iSbJBP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhrL+7/Qrkmtdhta9+Dj/QjSf+ZSbdD3dzG3pqSLUWsT7gtt4Q7yllNPGmk0NNCXQVDV+pqohZRxMNx6UfiUcX1cRve7A9eVAWb0wzdWEkrNl8XRJ4kprSF1KfST/Oz67I0dxHTcev/U+tV33hD+wflNIyHuV7VX/NJf/7LR4M1l7s2HMwujU6mOD4amyY/TFzcZVKMMsAwFG+IRCc2aKJ8hlQnHlwzGEN5Jd8hIgrTcRS6T31ZPTqsOkOiPzeCf9dhK+O06abZmcMFfr8p3Kjzoa1zOvlVA0hCKisktUxTNAIa6dnwM+5rS803qhJDBsP13kNAycsJK6qrFAuTW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kE22MzIU3mQ9HhJftxwGuF+bGWRl3jyL3ZUa1DM9ytg=;
 b=vUIukH5WCokQYekXgsag2YUdMlaqvH8emI3qmhuNA1Cann9I3pUDg00LNjNdUGftrM89tlljonED+9u8Q8I93dQrnbuzROf3N1xwn4WNHG7I/8vin2ejIficzNzwJW++eqPycJCmm/AoXjawp4HwtlX3NZ5biLq8B9v1jqPdNR+OkzfbIiRYNTH3GZ0zW6y3Zz/wQfWXmStSBWgfNBIMu8V6B/1n6dY5OLvVqEiO0B/NZJJNARg/OZQ5WMqO5USApTvgQgkAGGBW6dWshFLYbo5wpixnNoyC9VfuEWkYXMRbRlL7NCwwJHS0I7+a4ZsF8sWf18SQhBP7LEMwy0b2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE22MzIU3mQ9HhJftxwGuF+bGWRl3jyL3ZUa1DM9ytg=;
 b=b5iSbJBP6pgfBp9BwHSR6Qp0OhJldYDSZOfruxfTWlWIU1XIsvVwqz216bKeoiG8F/W0OH9ASNZe1F49Z9PoCMj7aqgOqxDTnhS74UEwJRJXujx6YXVnt6FlXMhJHgkecRdcx8aLd9gcNJEJZn1HDzKOU8Lt3c+sPOzY84JCH2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21)
 by DBBPR08MB10626.eurprd08.prod.outlook.com (2603:10a6:10:531::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 22:39:30 +0000
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4]) by DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 22:39:29 +0000
Message-ID: <5cb14efe-3c16-4df2-89de-0b01ab9dc954@wolfvision.net>
Date: Tue, 30 Jul 2024 00:39:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checks: relax graph checks for overlays
To: Michael Riesch <michael.riesch@wolfvision.net>,
 devicetree-compiler@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>
References: <20240522-bugfix-relax-checks-for-overlays-v1-1-130c8b85c06b@wolfvision.net>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <20240522-bugfix-relax-checks-for-overlays-v1-1-130c8b85c06b@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0033.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::46) To DB4PR08MB9190.eurprd08.prod.outlook.com
 (2603:10a6:10:3fd::21)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB9190:EE_|DBBPR08MB10626:EE_
X-MS-Office365-Filtering-Correlation-Id: b6641c89-bac7-4e0c-e6a1-08dcb01f4f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGZybU5ZbkFYVDZHaGxXZXBNQktVdXU0SzhPNWZSNVVkOEczdktwQ3RyNVdB?=
 =?utf-8?B?c1dsekMwZHhzYzdvdUxGTk1uODZsV1kwTGgreUZINHFGN1pHOWc1aE9XVEJv?=
 =?utf-8?B?M1dUWkJQb0M4ZXhMaklyeUVPWVV4Q1ZtMFAzN1ArdHc2aGdSNXhwNkpHUlBh?=
 =?utf-8?B?TUlYOEFMOWxtTHdvaGc3TE5MeXAvU0hPVURDSjBZZzFvT0p5N1FrVkRBZVRQ?=
 =?utf-8?B?QjIrQzMxYW9ZNE5LWGUyLzlHdE5DdmdGWU9sZlRoNlpXYlFlSjBuWmZwZmM1?=
 =?utf-8?B?NkJFT1d5N3NqUjA5RUNML3M1NUV2WnFzWjh3OVdtMk1IMFJ4UFZkOXRBNTJu?=
 =?utf-8?B?ZFdCamQ4WU5vSWpCRHM1ZjllNzRNWittOXhJVEVEUFU3MjNTc1BuNmF0REc3?=
 =?utf-8?B?aHZVMEMvT1pXYmNBRlQyOHNTZlF0TkNTbCthN1c4S0xXMHZ1WGo2UEw4ckZo?=
 =?utf-8?B?R0xjZXkvUXBBVDFWZ01FcncwSWdHNjVtVTdSVTM2ZDZMMVdIdjRVL1ZTeGM2?=
 =?utf-8?B?c25CN0ZscHQ4NE91UERRZlJJZDNmYXZDWHVQMXJQN2tWbDErekRuWXFZT2Y5?=
 =?utf-8?B?dlpVL1lkTXpZaTNmRkZqWjg1SkNXUGpzN0xzMm12MWMzOEpjWEppekh1eFZF?=
 =?utf-8?B?NW1SM1k1eGVIR0RoMENCMzN1WTJhV2ZWbVl1RDZUWEdyUkJYRDdFR1R0MnFw?=
 =?utf-8?B?YUpwbXRRWWg5MktuOFFsU1hub1M3RzRFc3IwMWUyOUIzSnl5YTNva25pQW1Q?=
 =?utf-8?B?WGxMTWpUUU03aURzb1NBN1g4elpiejJ2VGVhRGFSQjVoQUhnY1BpRnZBeENs?=
 =?utf-8?B?RnhieHVKSFRCOVg3MUFqUlpHeVByUnlCYVQ5V1JLV0Q2TXNZWTZReDE2RFRZ?=
 =?utf-8?B?d2tXK2EwWC9NQmZzNi9KdVpoTGROdEpmQW1yOTBwNUJCT3REK2ErSHROZ2JX?=
 =?utf-8?B?TzM5dUFuQmU1RUoxK0QrM29CSVJRUVhxaUM2dndqRmtSTjFwNCtUQWtua3Bw?=
 =?utf-8?B?b1l4aW9CVTUzNzd1ODIwS2pzQm8rRFhIQzVUdk14eWVnZUNJNUF5OWZWclpx?=
 =?utf-8?B?eDl2MmVsZUxJaGZaT1hYR3hETU1FbnFsQ3JJMDN1VUpUU0haalR4dWxnTWp2?=
 =?utf-8?B?QUFaSG9OK3BxTGlTTEUwclp0TUV0TmVlTGJVR0MyRlA2UExCeElDMmoxcXpZ?=
 =?utf-8?B?c2xtWitEeVdyUmh5Q2RMTkQrcmZibTJXcUZYU0lTczlPNi8yRFZMM0RVOWdB?=
 =?utf-8?B?cmdDYklhR3VFV0dnZm14MDNnOHdYM2podUdzQjV0TDU2RzVGUTFDM2M4cXFu?=
 =?utf-8?B?dXY2ME4yUmZXSjdjNVJScGRtZS9UdTZZKzlObHl0ZytRK1F2SUIwNEpqYnRF?=
 =?utf-8?B?c1BRemg4ZHBOYzJibDM1YzlPNkZ6QnExZXhyRVV4VzRlM05jYm9FblliSTBu?=
 =?utf-8?B?V2dIOHFEUXlsQm4xSWx1VXVVSkJQRVA4MTNmVEZ4eHZTb3V0amRRRHNOOUg4?=
 =?utf-8?B?OTF5ODNsVDNBRDcwUkhJK3dBK24wcFplaTVNNDF0elhZdFZXUU9Tc20vbHB6?=
 =?utf-8?B?Mm9IUStyMXllNDkxWlc5Wm1uVzJlcTV2Wkl4TkhvcWYyQXdlYkZ4b2JEZlB6?=
 =?utf-8?B?djRCVEF5dExpelBlTlRaL1Q0OENrbnVEMkl3czQrMmZ4eXcxQ0VJcktPbnN3?=
 =?utf-8?B?MHNqOUdsa0JmUzNFWUR6bGlaV3k3ekNNWjFNdXJvam10Z2hLU1NuZnJmTWdj?=
 =?utf-8?Q?ReMzqo59bKGTs0w2/4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9190.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0dGTGJpdFB3ZlowUjZ3bkp5TTBkM010Mk1YY1VVV2lzWUZTL1ArSHEwbUZJ?=
 =?utf-8?B?QlE2YkQ2c0FFM21heW9MT3BwVFVqajllNHlMOUhhbmxIUTMwdWZ0VTdnbGNM?=
 =?utf-8?B?d2tzZU91S2VjOG56N0FPMEo2RWJsQnFoV2dMbk1la2VURnBIVHVRY1ErM2tU?=
 =?utf-8?B?bGNGRk9DQUtGUXh0eXJMQjJneHZ5bEdreEVxcmtZaXNrc3pnWmlyVE0wc0w3?=
 =?utf-8?B?Y3QwYktlSml4czFjV3phcWJqcE16MFpWSDZpbWFqUWFHRVVrSHphMXVhRElk?=
 =?utf-8?B?aWJJUDNudUdESmY2bTBDUkt3Z3FBRHFTdjU1VXRtYmJVYWd1Tnd6ZWtIK2RV?=
 =?utf-8?B?SU9hTHR2dmJhOU45cWIzMDE2dVdIWFJ4L3UxNE5FaHpwZmQrNS93TjBTRGpt?=
 =?utf-8?B?ckZVRWZNY3BqTXQyUzJDVzBFcWpUZkg3aU10K2RjdkhnSzd6QUw0a0RCUXU0?=
 =?utf-8?B?U0l6ODVFWGQxQ0RGdDVocG5jYnpWYlhxaEFHajlHeU1hZmNSaEJnbzlCOE1Q?=
 =?utf-8?B?K2RqSm9nMzJrY3ErWEZuckxhUnRzcEtNNitZcEp1SFc3SjBSSjhQY2RqSEF3?=
 =?utf-8?B?aXRDTkdMTGdzTHpLcittRFJkak85b3B6eWs3alQ4aXVRdmZhMHBPWm9UVGpL?=
 =?utf-8?B?M1NnYmtFTWp4d0lWSXNnMFRHZzQyRkFKQm5wejJ3ci9YNitoNUtKaUxZTE1n?=
 =?utf-8?B?SXVDM09TWVcwdDNCVEtTWXVnR3ZHYm5KWk5DNVpsRk5pY1c1bW8raFljU3NB?=
 =?utf-8?B?cGxod0VRMUJzd1R1NlQxWnA5ZXpRNG9xTjdXMEI5TTN0QmIrNGIwU2J4UlRw?=
 =?utf-8?B?YkVIS3VQaXZmZ3dMQU85c29pRnBHdGRNdkpqMlNjaUFzTjVBOUlzek9oa1k1?=
 =?utf-8?B?QzZjMG5Ba2IrR1NiTGNDN1lyNnhlQnlpcGtaV0R2RFd2RUZ3UzFhNS8zdVc1?=
 =?utf-8?B?ZU1MRXlrU21YWi9kM2orNnhyYXlzOU0yLzRvZE9BQjd1YmcrZERwREcxNGNW?=
 =?utf-8?B?a3hRVW96eVhpMVIzdWk1a1ZCRS9nT2dOaUNPMHpWekdKWkE5c1cwQ2lLQUpW?=
 =?utf-8?B?QjFjMFo5VGhlSWFhbFFxRFR4dFk1UEJxbS80YU9sNytGVFYwaXZLdk90Y0pa?=
 =?utf-8?B?R0xLMG1TUitWV1NkUkpxQU5OMFl4V0FGTVdodTNZQW9TOWNYUy9jei9jVEFa?=
 =?utf-8?B?NUxicTBkOC82dGtLVWVQODhtbkZiMTdaYlFveUUzbS9sNEpvV0tRRk9sZlpz?=
 =?utf-8?B?Y000VTd0UmNoaXBuTVVFQXlBL2Q4RjBpa0JKeXdmUU9COWJtS0xrOVJ4MjRC?=
 =?utf-8?B?QkdyQnlzSG44RVViRVVwTUJkeGNFUC9rOGZRSU9QcXRGMTc5R2FNVkFPNUda?=
 =?utf-8?B?OXFJeXF2OUtNSElFMFVzbk13VVFEQVdhd2tWWnNUTjlPbU5aSG5jZVNhVUpU?=
 =?utf-8?B?cHpxUzlIVGEwYlNPTVdJeE5ramIvRDI0bmxQTDhUT3pqa0pnY25NUmVBc2lI?=
 =?utf-8?B?WDhXUzhHUmN4MlcrMi9zQ3lMK3ZnYWEyMGIvazhlM0ZTU2t4d2tnZ2w4eldh?=
 =?utf-8?B?ek9DRXdrSmtwSG1iUmtHa2dOZU03eXFpZkh3UkZrNVkyaEhWS3dVTU9qT21o?=
 =?utf-8?B?azhuMFdld0JmUDVld3V3SzNvV2E3WnV5MVg4MnRWRVo3aDFtbWE4VDIzbkFY?=
 =?utf-8?B?Nk1KaUl5U0pSKyt4cTQxYkc3aWhwVzBZeWJYeGxOazRhR01jajY3UllLdHBw?=
 =?utf-8?B?RW5ZK284b0dpUnJobkE1UktQblJ4SFlOTDZYQ1RoYWdjVk45NjRWZVNkOFZD?=
 =?utf-8?B?TW1pQjdGOVJ1WDBURTJCdVIxTFJCY1hBK2c1NzdNUmU0eXYraWJUQlBOcFUy?=
 =?utf-8?B?YjEzc2JUVGRkbUJYNEw2b2Y2QlpLeFFMcUhiZllQZmJDckY3VERKdGhmck96?=
 =?utf-8?B?cEthSjNWZ2lnQlVXWm5uejlrWTE3cHRqcWVJVWZuZS9MVDZSY0phTmxxRjhn?=
 =?utf-8?B?MGtnRFdjYTkxOVZjeVFjK3RyaEliaHI2MmFUT29MUzBhdFYxMnVuYThkUWNw?=
 =?utf-8?B?RnNCVHVBVEwwS1N0U2NKYnRrYVdSbHMza3psb3liTFpHRHhuTk9iWU9kOWdu?=
 =?utf-8?B?NmM5MXVObkQvM0ljZjBteU9kdVFBZzV3RjU0YVRUdEkyeTdzK0J4NVlyclRY?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b6641c89-bac7-4e0c-e6a1-08dcb01f4f17
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9190.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 22:39:29.8601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0zT/JTRWQHwOBc/71E5N4HKNh/Tq794HNnBRErGTS9RCrO5RosXP+Gox45nl8rdMNkPsk6K19uLhgUSO1TZJG5rZhUTAX4mNcFH4/1drjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10626

On 22/05/2024 16:32, Michael Riesch wrote:
> In device tree overlays, the following patterns occur frequently:
> 
> board.dts:
> /dts-v1/;
> 
> / {
> 	display-controller {
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			vp0: port@0 {
> 				reg = <0>;
> 
> 				vp0_out: endpoint {
> 				};
> 			};
> 
> 			vp1: port@1 {
> 				reg = <1>;
> 			};
> 		};
> 	};
> };
> 
> overlay-endpoint.dtso:
> /dts-v1/;
> /plugin/;
> 
> &{/} {
> 	hdmi-tx-connector {
> 		port {
> 			hdmi_tx_in: endpoint {
> 				remote-endpoint = <&vp0_out>;
> 			};
> 		};
> 	};
> };
> 
> &vp0_out {
> 	remote-endpoint = <&hdmi_tx_in>;
> };
> 
> In this case, dtc expects that the node referenced by &vp0_out is
> named "endpoint", but the name cannot be inferred. Also, dtc
> complains about the connections between the endpoints not being
> bidirectional.
> 
> Similarly, for a different overlay overlay-port.dtso:
> /dts-v1/;
> /plugin/;
> 
> &{/} {
> 	panel {
> 		port {
> 			panel_in: endpoint {
> 				remote-endpoint = <&vp1_out>;
> 			};
> 		};
> 	};
> };
> 
> &vp1 {
> 	vp1_out: endpoint {
> 		remote-endpoint = <&panel_in>;
> 	};
> };
> 
> dtc expects that the node referenced by &vp1 is named "port", but the
> name cannot be inferred.
> 
> Relax the corresponding checks and skip the parts that are not reasonable
> for device tree overlays.
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
> Habidere,
> 
> This patch fixes several warnings 
>  - Warning (graph_port): /fragment@3: graph port node name should be
>    'port'
>  - Warning (graph_endpoint): /fragment@3/__overlay__: graph endpoint
>    node name should be 'endpoint'
>  - Warning (graph_endpoint): /fragment@3/__overlay__: graph connection
>    to node '/fragment@2/__overlay__/.../port/endpoint' is not
>    bidirectional
> that appear when compiling device tree overlays.
> 
> This first warning popped up e.g., in the scope of [1], [2]. The latter
> two warnings appear regularly when compiling our downstream overlays. As
> we plan to submit them to mainline soon, we'll hit that blocker sooner or
> later.
> 
> Looking forward to your comments!
> 
> Link: https://lore.kernel.org/lkml/20240412-feature-wolfvision-pf5-display-v1-1-f032f32dba1a@wolfvision.net/ [1]
> Link: https://lore.kernel.org/lkml/20240423082941.2626102-1-heiko@sntech.de/T/ [2]
> ---
>  checks.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/checks.c b/checks.c
> index 2fb7ee5..2ea5913 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1822,10 +1822,14 @@ static void check_graph_port(struct check *c, struct dt_info *dti,
>  	if (node->bus != &graph_port_bus)
>  		return;
>  
> +	check_graph_reg(c, dti, node);
> +
> +	/* skip checks below for overlays */
> +	if (dti->dtsflags & DTSF_PLUGIN)
> +		return;
> +
>  	if (!strprefixeq(node->name, node->basenamelen, "port"))
>  		FAIL(c, dti, node, "graph port node name should be 'port'");
> -
> -	check_graph_reg(c, dti, node);
>  }
>  WARNING(graph_port, check_graph_port, NULL, &graph_nodes);
>  
> @@ -1860,11 +1864,15 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
>  	if (!node->parent || node->parent->bus != &graph_port_bus)
>  		return;
>  
> +	check_graph_reg(c, dti, node);
> +
> +	/* skip checks below for overlays */
> +	if (dti->dtsflags & DTSF_PLUGIN)
> +		return;
> +
>  	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
>  		FAIL(c, dti, node, "graph endpoint node name should be 'endpoint'");
>  
> -	check_graph_reg(c, dti, node);
> -
>  	remote_node = get_remote_endpoint(c, dti, node);
>  	if (!remote_node)
>  		return;
> 
> ---
> base-commit: ae26223a056e040b2d812202283d47c6e034d063
> change-id: 20240522-bugfix-relax-checks-for-overlays-e72b11df44a1
> 
> Best regards,


Not sure if that might be a valid solution, but including "rk356x.dtsi"
(where the nodes referenced by the phandles reside) removes those warnings.

Best regards,
Javier Carrasco
