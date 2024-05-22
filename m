Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2114.outbound.protection.outlook.com [40.107.247.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE918F6D
	for <devicetree-compiler@vger.kernel.org>; Wed, 22 May 2024 14:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716388386; cv=fail; b=N2e2GQzlOy0hmKIlwg+on9oACZBBvziq4hXCKbVfyI6KAjGapmshoEmV6jHKJRBquUkkYOQ/PqsHNAnS7q+L/ndkdYkBxytW/WGA/7KWRv+wp7aFRmK12YoQCZFSTRtdciLzxBCNh9thRTT8orqqUmf/cHK3By+mDQIsGnL/liM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716388386; c=relaxed/simple;
	bh=c44EfZJkFtzo/if5dC2HdpHWqyk8WT+PRMUr93LZVz4=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=EyBYvtPvANrbguUh/1LS0dXdY+ACbj0GxglP+D8/VfdSwaB+bpb4djtE2lO3zVbMAFvKEfuT3mmXAJHp7aN8xeyGV0oQiNrHbMTsQ5ujr8KoQ1KBdoF1J3hnOL743WubkEFOuz/5GnJqsbb65ETVqxvoOkfIdkg04YI0rzE4USE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=wND/RgV1; arc=fail smtp.client-ip=40.107.247.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="wND/RgV1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHm4KLbw/a4fh9cWvjUbN5OaczI/kwogzrFfH6SvgNiJkwlW0TGGeDAzL0Z9/w8WDYLqfW1fGWCXex4qOT0A7vVRRmFzZWFAZUbU5wVgBUzEp1dbhnFhSYKgcDwbYHq7bi+illCG7shINx4ZfRTT8to5mP0IOM0DG4iYlr8vltq9DEYy81GSvcTW9ixaXPAuCrS5jwXzVSltvL+EECiiSXaz6UhH0PQETANUEPcXDZLQDwZL6BLZDbll1ItQVmUWyZpo0Vk+5aFFviicdqyAsSgXATHQIl7mowSk3Bb8D2YOb+QQCa6iqZ9D/hsOGTHp+C0CWQvkc2RdwHPBPygMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuhA8rQq/XFL7hvAbxFWPUN//NxPztZT6uMyiyzT4oQ=;
 b=OPR5mqGeJuJVjy6KWXTBvryCAvxm/il5/bvAXY967uXlwev5klt0+HvekakhxB7/RF+XJIQ6Hhrqy5AN8h6q5hIs02StLCmHMFjiXmMsUqO4noQnIqdkrXreqKZAGWK/o7v2fOrToDLJ01pqbN+vB5GYkX0VicrwXS17WW9bRm/eyvQrbF0Ad/KXw6jm3pp+AiLwkgL/Ekme1O9g2Dsr8TztNXucoJpLfuZoO2S7lOZGExPDJDDJl0zj+bTDo3jH+d/jAD3VXiFb9hYnufnLVHBbokQ1AyOfEzluHVVOyGf3AG7xVl3qk8LV7jO15j/RYsQqB1k836F4A7StddQrHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuhA8rQq/XFL7hvAbxFWPUN//NxPztZT6uMyiyzT4oQ=;
 b=wND/RgV1Wl9A5iUCMB2CeKoq689R5Y6gS2MRXFbh+ER7oHVZhptoF8AiF07pzW+me25R8itQhJEX2WLzOh6fG7XLUI3VW8BsTPGGIHJDLGLXxFEwPafRNjMcTjsGtZ6KVxNbyq8gJwTmEBxoBhIpnW95R04wtPZncilM7t6QwNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS4PR08MB7656.eurprd08.prod.outlook.com (2603:10a6:20b:4f2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 14:33:01 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%7]) with mapi id 15.20.7587.030; Wed, 22 May 2024
 14:33:00 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 22 May 2024 16:32:56 +0200
Subject: [PATCH] checks: relax graph checks for overlays
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-bugfix-relax-checks-for-overlays-v1-1-130c8b85c06b@wolfvision.net>
X-B4-Tracking: v=1; b=H4sIABcCTmYC/x2NwQqDMBAFf0X23AWzpBT6K6WHGF90qZiyS8Ui/
 ntDj3OYmYMcpnC6dwcZNnWta4Nw6SjPaZ3AOjYm6SX2VxEePlPRnQ1L2jnPyC/nUo3rBlvS1xk
 3GUIYS4wpUMu8DU34Lx7P8/wBPlbIu3IAAAA=
To: devicetree-compiler@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716388380; l=3693;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=c44EfZJkFtzo/if5dC2HdpHWqyk8WT+PRMUr93LZVz4=;
 b=6qyzeO5lxVNV81mG9/b4bHIGzMH+JMV1vcTrCsmql3o2uuXe35T2z7NlzM9Nz5j7PFQeOD4b5
 3X0wLOeW2QlCZZWiSHTkqPb50DSPoOciPbagbDbsOryuAYDFC2lfry2
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR02CA0074.eurprd02.prod.outlook.com
 (2603:10a6:802:14::45) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS4PR08MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: bec7fe07-8b4c-44ac-7cd8-08dc7a6c150e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|366007|1800799015|376005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mzk4WXFxbzgrZFVIalRLNFdmSEphc0ZzWk1neVNlelAyZlFRQTFwNWNvVlYv?=
 =?utf-8?B?U2FzeStmc3BkeHBrOW50TGMrUkdER09sN2QyRlRaZXRxWGNGZUxmeW5XeWtt?=
 =?utf-8?B?YXFnVU91WVcxY0ZhUENqd2N0blBGYklMUEEzclRSa3lFcDlXaGE5S2NzU25q?=
 =?utf-8?B?ZFNCZVg0WUQ2aEVhWDhYWDRNNEhROXQ0d0NFbGFSRXhXSWNJdEdNcjZZOGFa?=
 =?utf-8?B?MXJmRWRVR1ZWcnBnbWdEWXRBVDBIcnJEYTFpYnA3YUtwRVcvMjVueGdXRC9w?=
 =?utf-8?B?ZnBuWXJBaUhjUnhIK0tYNXdXTU4zZnd4bXlNM0kzZkZpUXIxQlVMM0hESkxF?=
 =?utf-8?B?QWZka0loankzbEYrVHdaYndGNW1xOG5hMHozNVRGSHZaYUV5T1MzZUdiOFFz?=
 =?utf-8?B?c0Y4bXlGRS9CaVNmVWEyZ3J6Mkp3TGJLWE8vZStqbVVpZmtyamFtd0RURGpI?=
 =?utf-8?B?NWIrSHkvTEdJRkVDSXNZZ3B2WmxmYWFLaVQzMkVUMFRXQzhWZ2dKQVA5ZkF2?=
 =?utf-8?B?RXNJT09yOEFvMldsL0FIMm44NVFONHdDM2NXbjNqU0x5bjBtN1IxQVhwYWVQ?=
 =?utf-8?B?Tit0WWEwSXEzRTV4aVJRSXFIa0F0SHl5V3Q2dVRmMkMzQ0xFRlhKa0htdFhK?=
 =?utf-8?B?akFEMkI5WVhnY0hXYW55S294WFFDQU5XcFd0cmZ4Y1pLWHJUS2N2ME9VYzlB?=
 =?utf-8?B?YURDTmlSKzNXV3NpeER3bURQUTRvTmUxdm9JNWsvVGQ1K2hvZDFjTlpMZHcv?=
 =?utf-8?B?ZzlRMWxtYVUzbWdXdWtOakk5OS9iZ2ZrKzBXcG5WQ0pDUFlpcVQzS3ZXZDlW?=
 =?utf-8?B?MW1QckY4SzVkT2RNN1c3TGNrSGRvbnI4TFI4Wk5RU0tXVDBWZ1dicjZkMStO?=
 =?utf-8?B?YVNBZVVDNzRvSURuRmRPdmNuS0xsbmhYQUNGZlJqMFRncDFQUVdrRkVwcE0v?=
 =?utf-8?B?L29jcGxQQUY1RzJoeFpxLyt0eStrcWJoSW0wUjd6SmhoSHBDK2ZkUTN0ZnVY?=
 =?utf-8?B?aWtBdlphZDRUUk9rcndON2IwWlZERWJvZ2FxdStXdE9tKzFyODBNbmt2clNN?=
 =?utf-8?B?YU9XMDZxN1lyWlBpSndjZ3JUelZPWDBlL1JCNnZ5ekl5bURvZFEvZWtiT05H?=
 =?utf-8?B?aUI5VEZvMmNzaVoxczFPWVF0bWoxZFgxK2o4eWY4L3hxcVpiVUlZQ1c3SDI4?=
 =?utf-8?B?Z2EyTTFDcDZJME9hNUtyaHNCeDN5QmhkV1ltT1RsLzVJMXNSYVhFemw4cVZK?=
 =?utf-8?B?THJMb3F4eTV1b0hSS3ZGQnVtOUxMKzFWTU1OU28xa1VQUHZsZHQ5dzZ3OVBk?=
 =?utf-8?B?NnBBWS9ibXhIZ3pHcVhOL3hRSmNib1JRTk9FK0Nob285UnJjakFHWFdxKzRR?=
 =?utf-8?B?dmhoUFNKcXBPRnhOeGtQcFNHYlRjWlljaituZHZXVkJHdFdxekozRzFIWHNT?=
 =?utf-8?B?aWJMdDJjSGFHcjZBeUlBcFBEM1hFMjJWNzJab3FQOTI3UVRFRnQ5UTlUN1Zm?=
 =?utf-8?B?WGhUNGMwclJhNk1lV0NzN3JmSnhQanVWUmxUUS92cmFvMFNNencxcmV6NnZB?=
 =?utf-8?B?WWZMbjU5dTRSRDEycVdXdVFJajRQZUtheDJnY2JlaWJUNHUrRUNPRzhhdUMz?=
 =?utf-8?B?SWt4ZlJySWsxNVVtSERGVVNwV3NFcHVLbUtKOTdWZUJqU0l6cTUvMWRZRnBI?=
 =?utf-8?B?c1hNQWRpZHNMUGR1VTV1cW95OElSbk9xS0VWWGlucjFQRFlNd1EvWFF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(366007)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk9BM0lrR3dlbkdXdllrdTgwUHNHa2dwMklBN1IyMVVJd0hOK2hzYUNtd3Y4?=
 =?utf-8?B?OUg5MlBBajhqNjB5RVJUR3RvZlp2ZXlIVnJPem5jTk03cDNFL2crYmJQbGR5?=
 =?utf-8?B?SE83VlhUQXZXRDUvUG1oTXVkTmZFRnFIMENzNGZiNVFHd25KQkUycGFKQjZU?=
 =?utf-8?B?dGlTMnJZM01tZ01pRER3ckt6V2VINGZzTjJEQjc4cDFDS2k3b3hiY01VV0E0?=
 =?utf-8?B?OHI5SlZObXE2S1FPbzJCMnVzdDFydFRIdThUejlEaTNIdGt2cHBEUVdzR2F3?=
 =?utf-8?B?R1V3MUFIaTY2cDR6N3d2Y2g2bHlGS0NQdDBteENjdUV5c3pkdTB5aXhIZGIr?=
 =?utf-8?B?YU1CdkhVcUxpKzVIbU1KcEJhZloweG84Z0trYXYya2YzbVlUWldXM2d5ckpN?=
 =?utf-8?B?d1pvZWFBazFMSzlRaGZZYWExbVMzekdHMHFRYjZDV042TnAydFI5NFREOEUw?=
 =?utf-8?B?OGxPSmZZYnQvdXNORU1VNmJYclVFVjRvNjRNQ285WHpsendqeTgxajFZUkFw?=
 =?utf-8?B?dXdVUjZrUmt2bWx1dWFvZjhhK0l5eUZkWFR5QVhuZXVnOWJBZk4vSmluMUVi?=
 =?utf-8?B?WlhWM0s2OHRJT0ZPaFVOY0kxRTV6QjJTWVZLY0V1aVlJQk5pOW1kd0pyMjUr?=
 =?utf-8?B?dFRvd2ZwTlRxaG1KMEVIUVAyWUpCNzVrV0dFNGhMYkRQbVo2QnR3VmJrVEky?=
 =?utf-8?B?VU1kZ3lJZlN0SGZuWU5TWm9acm9VNjM0MUJlWld3cS92TWxrUkZ4eTNpL3c0?=
 =?utf-8?B?dXVCRjN4V2NhUDNZaUY4N2ozeVhlSFdJRzRJTVd0QmtkOGZwcW5nS2RxOVk0?=
 =?utf-8?B?NkhhcnhJRG50aFVhVlU4YnF1WmtDaXh5eDR6V0xhc1RJYUludDhKQkI4bHRo?=
 =?utf-8?B?NTJRcC84MEptMTRnSFNXeUVzWmk1VE1zdWdLRGZyaUxUcFVxME5BdHJVNVNC?=
 =?utf-8?B?VmFGbUI0NnRzaFZlR2c4QW14QTVXZmxFSUlXVXV1eHpHVWJoVGxmbzFLSUVM?=
 =?utf-8?B?QVZuVmVMYzNUZ1huZVpXMnd1TG1nMmU0QzBrcThMMkswVERMTEJpMkwzZlZt?=
 =?utf-8?B?dTg3SmNhcHVTR3JjdUpxY29IcFVZeVFHMERxRmc1SUUreW1LaWxTRkYwTVkv?=
 =?utf-8?B?NFBlcWpLR2pCd1dyUEkrVTlVRU5CS3l1OEdlLzFFODRKcUl5VWtJSzR5WDBx?=
 =?utf-8?B?RlBBbWo0cGFleGluTjk4ckJhdDgxdW9lSHNidTZlQjFyQ2pScDd5L05PeWdw?=
 =?utf-8?B?cDJGelF5SmpJVnNSbE4yL0FvdXFPdXhBUkRLOHFCMVFlY2JocG9Dc0NZVlRz?=
 =?utf-8?B?OEIyYmtrUm5VSHZiVUhyS291Ylo5aGFBQjI2WHNhMWRxeEhLWW5sM2luS1lW?=
 =?utf-8?B?emF1Nk96dUF0T2h1ZTlwb0p5QkZrUk5tNkhrak5JcFA3UlZDYTVQZEsxdHNy?=
 =?utf-8?B?YmNNTFpjZ1grOFhabEhVTHZxQ0lrOENQQnZzYmNoMlhIV2NGTlFPQThJU2Fw?=
 =?utf-8?B?ckxQYzFLVTlhbE1VeTllcWtqa0RaTFVINytNUEUvY0NINUdHVDI0WEE0RHBa?=
 =?utf-8?B?MnFiYVhldVZNVlM3S3lITTZYc0xLclJXdktyT2lIOGR5dHkzMmhybVFhajZi?=
 =?utf-8?B?MHdTZDVna2kycENjQUlaS01IVk02WkF1VndHZXFqQmdMQ21rNHdyWDg1U0g4?=
 =?utf-8?B?OHRieC95dlZQVXlUd21NNEpMbCtKUEZDendTNFAycjByVzVFa0RZcUM2YXdR?=
 =?utf-8?B?aEl0SDY1SHRKbXlpcGVkeTBPWU9CdjRpNC9sQ2JLc2g3cUxOZEVBellrMnNa?=
 =?utf-8?B?Skxwc1hUMm1GcDF2WTk3Z1V4VHFFRmdMV3lWc2g2L3BpZk91SklmalZJMGZk?=
 =?utf-8?B?VXdSZm1vMWJVRG1jMzVwaCtYS09TbDQxQTdWZUZ1cE1WM05GaG1GWWF4WDQy?=
 =?utf-8?B?RCtCS01sN3hoVGxmdHZvTGxoR21YcVk4WlpZNjZ4UGp4anNTL1pnUmFzem5M?=
 =?utf-8?B?dHpUN3hYcGdFMVBhVnhoZ2s5cjB6SVBtQy96VHY1RVFhWitwNHdGM1VoNnVF?=
 =?utf-8?B?ZitudjdtVkNwdTU3WkdQTDRDYW1DR053dnU2MnlmWEpHdmxhY2hTMlF3ZWJW?=
 =?utf-8?B?NEdXcmNQWU5zeG1SYWNBd1pLeURpcTVBdVNOMUlhUUpvNHJ3VVJUY0pieTlB?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bec7fe07-8b4c-44ac-7cd8-08dc7a6c150e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:33:00.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+rDwruhBfuYtIICSt7OKktZfdTts3TkNwZQAS6cEEiibaIGEaD9poTRSRxFaHHbORatfrHoPGlK3S+jcV75V7QoXwLqAvsw1/YoSg+GJTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7656

In device tree overlays, the following patterns occur frequently:

board.dts:
/dts-v1/;

/ {
	display-controller {
		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			vp0: port@0 {
				reg = <0>;

				vp0_out: endpoint {
				};
			};

			vp1: port@1 {
				reg = <1>;
			};
		};
	};
};

overlay-endpoint.dtso:
/dts-v1/;
/plugin/;

&{/} {
	hdmi-tx-connector {
		port {
			hdmi_tx_in: endpoint {
				remote-endpoint = <&vp0_out>;
			};
		};
	};
};

&vp0_out {
	remote-endpoint = <&hdmi_tx_in>;
};

In this case, dtc expects that the node referenced by &vp0_out is
named "endpoint", but the name cannot be inferred. Also, dtc
complains about the connections between the endpoints not being
bidirectional.

Similarly, for a different overlay overlay-port.dtso:
/dts-v1/;
/plugin/;

&{/} {
	panel {
		port {
			panel_in: endpoint {
				remote-endpoint = <&vp1_out>;
			};
		};
	};
};

&vp1 {
	vp1_out: endpoint {
		remote-endpoint = <&panel_in>;
	};
};

dtc expects that the node referenced by &vp1 is named "port", but the
name cannot be inferred.

Relax the corresponding checks and skip the parts that are not reasonable
for device tree overlays.

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
Habidere,

This patch fixes several warnings 
 - Warning (graph_port): /fragment@3: graph port node name should be
   'port'
 - Warning (graph_endpoint): /fragment@3/__overlay__: graph endpoint
   node name should be 'endpoint'
 - Warning (graph_endpoint): /fragment@3/__overlay__: graph connection
   to node '/fragment@2/__overlay__/.../port/endpoint' is not
   bidirectional
that appear when compiling device tree overlays.

This first warning popped up e.g., in the scope of [1], [2]. The latter
two warnings appear regularly when compiling our downstream overlays. As
we plan to submit them to mainline soon, we'll hit that blocker sooner or
later.

Looking forward to your comments!

Link: https://lore.kernel.org/lkml/20240412-feature-wolfvision-pf5-display-v1-1-f032f32dba1a@wolfvision.net/ [1]
Link: https://lore.kernel.org/lkml/20240423082941.2626102-1-heiko@sntech.de/T/ [2]
---
 checks.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/checks.c b/checks.c
index 2fb7ee5..2ea5913 100644
--- a/checks.c
+++ b/checks.c
@@ -1822,10 +1822,14 @@ static void check_graph_port(struct check *c, struct dt_info *dti,
 	if (node->bus != &graph_port_bus)
 		return;
 
+	check_graph_reg(c, dti, node);
+
+	/* skip checks below for overlays */
+	if (dti->dtsflags & DTSF_PLUGIN)
+		return;
+
 	if (!strprefixeq(node->name, node->basenamelen, "port"))
 		FAIL(c, dti, node, "graph port node name should be 'port'");
-
-	check_graph_reg(c, dti, node);
 }
 WARNING(graph_port, check_graph_port, NULL, &graph_nodes);
 
@@ -1860,11 +1864,15 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
 	if (!node->parent || node->parent->bus != &graph_port_bus)
 		return;
 
+	check_graph_reg(c, dti, node);
+
+	/* skip checks below for overlays */
+	if (dti->dtsflags & DTSF_PLUGIN)
+		return;
+
 	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
 		FAIL(c, dti, node, "graph endpoint node name should be 'endpoint'");
 
-	check_graph_reg(c, dti, node);
-
 	remote_node = get_remote_endpoint(c, dti, node);
 	if (!remote_node)
 		return;

---
base-commit: ae26223a056e040b2d812202283d47c6e034d063
change-id: 20240522-bugfix-relax-checks-for-overlays-e72b11df44a1

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>

