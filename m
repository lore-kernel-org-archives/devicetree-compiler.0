Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023077.outbound.protection.outlook.com [52.101.67.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EAC23DE87
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Dec 2024 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844867; cv=fail; b=OIRyaoTWi3vktFvvXXZsHTWB6Itq9QopJ+7VfabFLOf3umlOysRiCUHx/0LxuKwiJQ1TIodoJqPm76xPC4b0alyCnYHYqTxJAABwn+g98buexaCNwQFnOSKSxQ4vn699X1uM+uvQ+yD+zL+ceb/uWbho/5QtEkT8dZzV6mAlOks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844867; c=relaxed/simple;
	bh=XEsh9cxsbT+e3SRrx5YgFsRkUy4eulVK4X5c2yfHaQw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hvW9Erq8RXKzchCUQP8NVYJVC/VcVC6WsfC1rj91ad7MYQz5pT/nB/MKc1RBRNve8hHW6VxJoJMUbqeEOpPNy5RVK9GQVkJCSAB9xbdDCXbK6gmOxmiRnBE4wrot2M2EjktasmgamyMhazAZ0VxrmmGfBq1CdCOb//KStoz3fBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=gkvHCPMz; arc=fail smtp.client-ip=52.101.67.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="gkvHCPMz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yub//E01PHpZ7UQdZ3GHLpMsESOtnDwOS191myybsVdlBMOjfXCC4F1tBYc9g5S0oeiytXQuIE23NmMybXcH5Kk3OojE74Vr66psazIFCmZCzjQ/VwrkdLmEDebZx4J/2pTrvt5PGqjTTkbL58i0YNoLY2VEFJ/pn7Knczfq3wveBeJC4HCUfuvjamCsgKEBGbCvKZGSsJqWYSEt4oRgDHkcv1R+A5oraQMu2ar1ysP/vmlzI6fUfv4BSwaXWSniUnmVOAfGSvAVysV3vow+1lZIEK3kL+Yh9DHE4f82FqjK8R3dVNv1wqw5/gwf/q3cNf+stj5XXRIGmhppHXYZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy71fCTw5xJqEFotiywt2BE25coJ37VqVZKypYjzgQY=;
 b=Pm+CS4zwnS/1FmakBGnCb6MzOjjoPUFf5nHmLb0T3Yi4gBRRkJ5/Z+h6mrn626UOyi3DUanaDi3iTQ+Ljaw5nl1YgHL/J2PsBWefiZcQU/Kb+q+wg2VPA+b9hxTzuJxA1OBc60iPpO0BTosESMCRUXipq6DUjaIDevZYu6/8mgq5k0ouf9lJ1Ktnmc+QttgMYtT6awwWrtQ3RPbv/u05PxuZ0xw0XdY+etcKNnJuii0HYenwoHW97VdMCcZK0zmJbKqieMzgQbCmlg/db3dzy/MuTFOXQu+MF728T7I4RrTlKPs0hnsRrNGQTDHDdBJOr1RPjcj4kQaP6j2AMFGZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy71fCTw5xJqEFotiywt2BE25coJ37VqVZKypYjzgQY=;
 b=gkvHCPMzU4cRP3K+YCpte9KWkDx1WjGoJJ1OWBkUt2XyvTDAWTdrvlM3xhTJcJZ6nD/2EytIvY250CTv64kpYgZ6m0IvRr8SVxrv4g2o6igJGBsOj09FSqMOPN6xC7aqn3UR2QKDIK9+t3trQvkwAde9d+UnWuoJWjlKZ07lJh9JGheCqHqpFseyX9yeHFt0qjinDLqvKsB02Bv3e4fp1EFVo4YUV8VmvSoJ09RcfxWXUHZSGxMQiNhI6DzaW14mlnkUbetcTYcG7O1GE5tYCCn5USlw+fDCJ+FYIdAFF5IB6O6lJoxOKUHnKVqtojiBzIV3DiiMrosww1wyRXbN4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com (2603:10a6:10:303::14)
 by AS8PR08MB6728.eurprd08.prod.outlook.com (2603:10a6:20b:396::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Tue, 10 Dec
 2024 15:34:19 +0000
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6]) by DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 15:34:18 +0000
Message-ID: <58c44f5d-7b45-4489-bf26-2be36c44e39a@iopsys.eu>
Date: Tue, 10 Dec 2024 16:34:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add capability to append to property
To: Ayush Singh <ayush@beagleboard.org>, d-gole@ti.com,
 lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
Content-Language: en-US
From: Andreas Gnau <andreas.gnau@iopsys.eu>
In-Reply-To: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0024.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::12) To DB9PR08MB7512.eurprd08.prod.outlook.com
 (2603:10a6:10:303::14)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB7512:EE_|AS8PR08MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aea0b19-db02-4bf5-902c-08dd19301cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVRYd1dnMFViZkhvbEx0QzA4ZXorVEsvQWtWTUxIZXZpMlMwRyszSUNkM21J?=
 =?utf-8?B?bVhHN3U2RmIvVDNZcFhMOXFnR2dIK1VDTWZqaWNJbXZFMDF3R203bk85cDFl?=
 =?utf-8?B?R2FDcTFhZHQxU0ZObE9VNEM3T0tOTDBYR3ZZUjVGNEFYSkl3QXVjb21IU0Zi?=
 =?utf-8?B?dnBUbW91T2prenRUL3pGYjRsL28wam1QaUdwYXo2SDBlR2NqZ0duUXZlb3Bv?=
 =?utf-8?B?QzBjdno4OTdUNHpDbVg5QUZPdmpqbkswUWRrbVYwMHNNNFhBSGxTV3h6NVc2?=
 =?utf-8?B?Vm9JbjJMUEM0YU9memREei91RFRHMW1pZ29YYlhpcjZpaCtVTThma01zanY0?=
 =?utf-8?B?VUUzK21BS1RuRiswTXF0SjJMMkVDOFAxdk1nWUZOd0QzT1ZjQm1KSlZCaXEz?=
 =?utf-8?B?UnQzeGdXUW00ZzduUU1aOGNvaW11dHhlNDdJSi92dFkxc1lBVzZhMXEyS2Zt?=
 =?utf-8?B?aFBFUnVRMVBMTWxVdmZJV2hRWjZ2Qk8yT0xyMUdUMHFOQnNDMm5jTlNCTkFE?=
 =?utf-8?B?OHF3djRxZ21zR1BvRVVLSzZjeGcxQjd1TGFBRGc1TkF5TWFnVjNWYnhBT3ZR?=
 =?utf-8?B?SVdyUGY0a3FhYk5Ed0xZeHdQOFVkR3hoY0xzbys0OGlCRGxobzBnK0hacFhm?=
 =?utf-8?B?U1RaZmR0WVcyb251R1JyTXB3Q2E1djFUVjZoa1pjbkdsc0UrUitTMVpqZUlp?=
 =?utf-8?B?V1prZVYxVkZZdFRpVGZJaE9RZ21NWVE5NjVzdmY5R0hJdFU2Zkh1Lzd3Q2lx?=
 =?utf-8?B?QzdBOXZkMEF4T0I3NkhxT1BaaVo3U09TNnRBUmthbDdSYm50Q0FBd0lSbjV4?=
 =?utf-8?B?VEtMdWcrajZTYkdjWnBVR0hncWh3L3orR2lrSHFISFRQZ3FxQ0ZkWWwyQk93?=
 =?utf-8?B?b3pMRXI0cEZqTGpiRDcxMm45dGNQQ0UwVE5Tc1BTbHRaODdVNmx4Z3Q1WmFL?=
 =?utf-8?B?UllJNmpZa1NqSG95U05keEp3ME1jV29FUXVDUWF5QUFSU2wxMkVMVjZ2ejVF?=
 =?utf-8?B?dENHc3pFaGJNaXdRMDA5V0MzRjIwZFliNzB0bHR5UzBIZE83SWFHbU1NbVly?=
 =?utf-8?B?SmFZREFSSGxZdFVta3BIM281VXFUOGZWNEs0eVZ1bTUzcnpSdVNQYlFNVzZE?=
 =?utf-8?B?M3Zwc1pZUmt2K3BvMTNJM0FZSHpMVElidzd5SUpVVGVYMkhaNHlTN2cxVTFj?=
 =?utf-8?B?Nm85c3F0OGlRTUdSZ2FVeXJRWU9ocGhHQjRQSEZjTDQ2WjdNcFZ6bEhzNU9q?=
 =?utf-8?B?WmxjaTFjNWR2NjZNeDZpL2VHT0xPM0tFcURGbVk0WDFxTUJKSC9WcERxdmJj?=
 =?utf-8?B?bWJHQ1orRndraVdIeTlhY3JESUZtL1A1dFNHYVdiai9oR055Nm13N0lnYlRT?=
 =?utf-8?B?Y0FBRXlaMUpxWi9USDRJS3EyUlpHN1BSS05CNk8vaEZBUWpDUDB2S3FscUNS?=
 =?utf-8?B?aGRVbzFHaEtJWVVJTXJuRXc0K1AxN0taSEZKd1hBM0RJbVZPN0M5bFNVSzNw?=
 =?utf-8?B?d214VTJNM2pSdXNYaUZPeDZ3UExKZmtKbGs4cXBKby8vdVVIaGUvb3FCZkFi?=
 =?utf-8?B?Qi90VkYrMi9YNzNXRFM4d3FMOUMveDRITXNDNjVkeHV0bkUwK2VGdUd4RDc3?=
 =?utf-8?B?NExXeHpVTXBJS0VsNm9wc1EvTWdha2dMWFU5NzVEUURTZUFZeW9IYTNkWGJF?=
 =?utf-8?B?WCtvc0JWU1Y3VDhEcGpGcDJhLzZ5R2FhNUVjMkdVdFVDdDN3V1JxYUN3MDF0?=
 =?utf-8?Q?ZXfYuyG/zv8QuXB36Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7512.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjZYUktEZXpyOUJ4UnBTbVkrS0txSDhQY0lMNnZVbkdkV0lpd1FqY0xNTjZF?=
 =?utf-8?B?UFpob0lnSDJhUjcwRDdIbE9PVzR5c1RjTlNBVnplMGw5V3l5elNIWGlqOWNX?=
 =?utf-8?B?cXZzNVdCbUNZM3ZrVkJGTGJJUndMdk1qcDZaQVVQRTBtbVZxNmR0YTJINnVr?=
 =?utf-8?B?KzB1Z0JhMGlwQmlRM3lEbzBoZlhlYk9kSkdxeldnd3NHUzFZQzVHZEZiNldE?=
 =?utf-8?B?Z3ppVGVWcmxLelk3VSs3T1NXcWp1Zkp5dXJaSm05SXRLZHJaeUdsUkxuYkFS?=
 =?utf-8?B?VkoxRDRacFNLOFRJeHJNWG9Eb1Y5aGtjSXlsakY5MVBDOVd1anVDTHJpalNn?=
 =?utf-8?B?RXNxMUk0aTJUaHprd2EwR1V5SXpQTVd4eWtkVUlPUitNTzBqb0N2WFVMdVZv?=
 =?utf-8?B?SHI0bUdGMW5xQU8vNjRzdlQ3bGpjYjd3OGhRSCtxS3FaeEFQcFFhQmxZYjlr?=
 =?utf-8?B?cXhUUWhYc2lqdjdaZDJEYzFWM2VaY2JkN1lCMUYwZzF4QlJEREdEa2xlazI3?=
 =?utf-8?B?SExGSzB2a1FOU1ovd0JLc1RKM1JtSERZUUVUUFhTN3FGUHQzMTFyV2p1SHV5?=
 =?utf-8?B?d2s5UVNEdXZldjVlYTNWWEdMdWs2a0x2QzhWZmhOcWwwMHVhb0NPSHFGNjll?=
 =?utf-8?B?SnZTbDJscUJmNzhmNnZMT2xRSnZxejJ2RjVtOWx6RjlKMjkxcm9vc3g3Rmt2?=
 =?utf-8?B?NVNPa2ppQmFDaXhPaVBLQ0ZveSs2VjQzS01lZW4wZXhZRHdzVXZQOHduNkNq?=
 =?utf-8?B?d0dkU1hUdCs3NUZWVmxITDJGQjBoQ2IvTmJKSjRTNllNLzN5Q2dEWFpEMDBS?=
 =?utf-8?B?NUpORVFIVW9qcWJRdHdFVmIwUnRzSFBRSlJRQ2lhNnM2SlFqbEh6UnllV2N5?=
 =?utf-8?B?U1NUMlVQYzM0T05PZWd4SVpMbEw2OXVjek9TVk5BUXpGeFBQWlpZTFk3NWN6?=
 =?utf-8?B?c0VjL0hzVCtldGp5cnYxNnZSaVoyRTErWDdlYW4wR0tzQjlaWWF6NnZlS3gw?=
 =?utf-8?B?MmpqcjlXS0JjZnJqekZlL1czMGdlUEtoNE1PcUJIWXFWVTNMcVZjNWFSUE95?=
 =?utf-8?B?QmlkMVNFVEM5U05EUWdJTTRaR1A0c0dQemkwMjE4SllhMGFScEJFakNXdko2?=
 =?utf-8?B?aW5IOXI1d2hYVzFCRk04M3BNeDd6TEhZMDZFcVZVKzVMZ2x6Zm5vWjRVK3FY?=
 =?utf-8?B?Uk9Nb3htMk1XN1hmeDB1bWJPNWF5c0VwZjl1UlRqQnNWOW9PSmdTckQwMXVv?=
 =?utf-8?B?OEJMNHk2aFVSSVhVQ1RNOGpncm0rYTFmbnY4Q3NISm9mL3FPdXQ1dm9TMXJV?=
 =?utf-8?B?MThxMFowR0VEekRUT0ptU0JkcklLUkt0NE1HREI4aVdDaTBmd2JSM240bHlo?=
 =?utf-8?B?WFhWRzRDS1BraTZNbFZOVFJaOHNOakltZVJzZEpDTk5PQWlBdXRXR0hwYVBO?=
 =?utf-8?B?NG16cXYvWm9mN0tZWTdmQXNjanFJVTFQaGZMTU9EMTV6RGh3cmpXUDBma2k0?=
 =?utf-8?B?bFVIS1VMOENMNS9Id1JPT01ZUXBGeUJ6allYdmxYK25lTms3eUFjaFFhVkZy?=
 =?utf-8?B?UWFobWt2L3lieHBBNDFreWV2WUVZRnlCRVVzZS9TVjA4S3VpNnNOOExQR1RC?=
 =?utf-8?B?ZW1Gc2dSNnBTVlpqZldHQ2N3R1FhWk1IV3FTMnk4eHVORU5NdHdVWVRMV0hp?=
 =?utf-8?B?aDk5SWR6QzFwTHkrTFJRV3lqckN1RmNSTW5OYWQzaGFCWW9taWQ2R2M5dFBU?=
 =?utf-8?B?ZEtuZHE1dnlIczQwZEt6ajVmVGZLLzN4T3RTMCtDUTM4WDlMa25rb1NTcDU4?=
 =?utf-8?B?dFJJNUNnVnpReE56bWVHdUJMK0VxN0ZicEhycExCRDdVS3BsaXJEYmlmYkRk?=
 =?utf-8?B?ZHdCU0NXYWFrMU8zZGJ2eGs1eHRCUktmRXBXempjbmxYRTJiYXV1U0VRWVc1?=
 =?utf-8?B?M0hTVklJSmlFaHZPVUsvL2k1ZTJkMU9ZN0NOTGczWGNCL0dVNDNacjhKK2Zv?=
 =?utf-8?B?YTlpQlNSaWc5UlYxc1BPanNmWDlLck1WS09WMGsyUEdKZk5aV1JqRXFoZjgy?=
 =?utf-8?B?YmVmMVM5Q2RrNm9JNEN2L1J5TE1Ea01RWlRXZWhXYS9WRmVrMnl0R0N6R1Mw?=
 =?utf-8?Q?f/I6JV9VmUvvwpZDCILpmmFbt?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aea0b19-db02-4bf5-902c-08dd19301cb8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7512.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 15:34:18.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zm1AO1qT4/HIFhGus0kvFn1X/kMrOJwmoATvEmV8bB+gp//mnEhwyOMbB6ObbXUF/j3Pwo2OMgDncc7frzCj3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6728

On 2024-11-11 10:54, Ayush Singh wrote:
> Allow appending values to a property instead of overriding the previous
> values of property.
> 
> Currently, we have /delete-node/ and /delete-property/, but lack
> /append-property/. Hence we end up having to repeat all existing values
> when appending to a property (e.g. see [1] appending to clocks from
> [2]).
> 
> This functionality is also important for creating a device tree based
> implementation to support different types of addon-boards such as
> mikroBUS, Grove [3], etc.
> 
> In practice, it looks as follows:
> 
> ```
> dts-v1/;
> 
> / {
> 	str-prop = "0";
> };
> 
> / {
> 	/append-property/ str-prop = "1";
> };
> ```

If we add /append-property/, why not add /prepend-property/ as well? 
This is not only "nice for consistency", but it would also enable 
solving a problem where SoC compatible strings from dtsi [1] need to be 
repeated in board dts [2], because one cannot prepend to an existing 
property.

```
dts-v1/;
/ {
	compatible = "soc-vendor,soc1234";
};

/ {
	/prepend-property/ compatible = "board-vendor,board-xyz";
};
```

What do you think?

[1] 
https://elixir.bootlin.com/linux/v6.12.4/source/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L18
[2] 
https://elixir.bootlin.com/linux/v6.12.4/source/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts#L14
