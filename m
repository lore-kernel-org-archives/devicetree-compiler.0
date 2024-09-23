Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2128.outbound.protection.outlook.com [40.107.22.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A97A197558
	for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727088389; cv=fail; b=IpSsplEQhQS5Iad4Z8bTEspgQCbDUhTxvznOHVSoF9OqR5uGOZ82JSZju3WctFCl7xsFV5LD4+93hXB8M04aJLwX/IHR2dwGv9pK4G4zch55/nZard/j/wf/n0GH9nQ5tF+eNQv+Gp1JU9mRUmZBt71HqqLgC8dYE1W3g90REgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727088389; c=relaxed/simple;
	bh=8O6dBwhy5qKkncMQV8GKdJ0rkJfMw91eoiakhWu3RzA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PST88isx8/rEfv09c9omiMkTzNmB0y+gbat/KIRC08s/3cAkdeHWanhGZB/aMAo8M2kGnRkbEc0FQm9W6f/t6SHYFVKu/gU4yr0r5ylDZHYp58JZMLmYNE8HpfJ7cTAio+kzhYayisFMJQ5PXsvpivlVnHcS5L2jlQKV0dbFa3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=vg5wT4sn; arc=fail smtp.client-ip=40.107.22.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="vg5wT4sn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/ugDohSEac4lBPcTp5KOerQYy1nhNRvDkHl6n2qp5HjYZeotpDevEYaI9+1K+aptYR22+78fLagz/T2ZOX/VVv1gXO2x7wfQPEQPSvIvNVTaGQXFJZMj+tJE9/+9pohBawLkkMjOeDCSCJFFHdJUdmZZU4slD1GsqsTyIFKot54RdESzY/WjKVGOc2C5n7HQlbt3oyQNeMW+WiNbXYjEnBXfUsAfWTvdcM/ekP78mR7+b1cdgPQaaHBG+kafsGJ1v6IEliTLlk1uNqF6SKZLAYplXpttqKGtJgHNe6O31Y6Zx9ghZWtcG1oEZAoEU1q17ESdc6WEdJSNHjr9XZzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sua0vr9/6XUnfxp1bzlxcH6QmhMq1aGf7Qq8Mvh/LNE=;
 b=WOkrLGwG6wr7EIkCE4he74f6VW6JxS0BiNP+uC850gNDMPs7vHVI6nmfXUvR6Td5TJrbpcpyWV2wep7FTXB2+TLrGHZRTQsm8fMrvCxghExIcS6ExVFIiZN3+Qv+wBiA1PpdkH0RXinMZq5GpzRWkjr4k7x62vJdSoG3cYKdok6N+VganzYIalAEZ0RTFxXg81tfB7uYaEuBL0JDW90R3y5vMduuvuGKmDMbCS+7h2KkHkmQrASVShdWt8WqLJkO66JMMFmMZk+BH47ZW44wS2+VOXLHV7/cPUq3zKoV48cxF5p4U/8sCbTNxPs2S9+2FUm3gvBOkk7nA7P+W3kM0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sua0vr9/6XUnfxp1bzlxcH6QmhMq1aGf7Qq8Mvh/LNE=;
 b=vg5wT4snmLd7DeD0CL8jziwST7Jm7iGKzQXb4qIQJ+1+fW6McIamR/5u7cLnwJOGrweIsgq4Lz3UkxTamjCemxv7wEQIGSPGc/3hV+chcMnw2mDJQocsS++OUtcO/gojryyfzz+WNmNaECybgbXZXI3R/eCsrCGp/dmFtJ3ywYYly8JSg2E8PraKgfMsgU7mFdwIvWmBG0ld4pzKXrmY2FomdBzlHLDYRbmo5n4jOsOMh1fwUySzUWgXDbpzPOdCMgF4doSt/JCTWSvR1OAhdlG8v7qDMnm+q2X7tvga+hI52E3d/QCeWr2R+UzOLXPWfXFNZRx+nYSrVvV7MbmpaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com (2603:10a6:10:303::14)
 by DBBPR08MB10386.eurprd08.prod.outlook.com (2603:10a6:10:534::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Mon, 23 Sep
 2024 10:46:21 +0000
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6]) by DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6%5]) with mapi id 15.20.8005.010; Mon, 23 Sep 2024
 10:46:21 +0000
Message-ID: <58d4594d-ef04-4b3f-9a4e-f97fa37c1827@iopsys.eu>
Date: Mon, 23 Sep 2024 12:46:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: DTC Version and Reproducible Builds
To: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 Anthony Ortega <anthony.ortega@terranorbital.com>
Cc: "devicetree-compiler@vger.kernel.org"
 <devicetree-compiler@vger.kernel.org>
References: <PH1P110MB15070467257B855EE1B1BB008B60A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>
 <Zuo_l-DJDQ38SAtA@zatzit.fritz.box>
 <PH1P110MB1507084A3C88BC2CBFAC984C8B63A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>
 <Zu1XAFqbtWnDcOmR@zatzit.fritz.box>
Content-Language: en-US
From: Andreas Gnau <andreas.gnau@iopsys.eu>
In-Reply-To: <Zu1XAFqbtWnDcOmR@zatzit.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0325.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::20) To DB9PR08MB7512.eurprd08.prod.outlook.com
 (2603:10a6:10:303::14)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB7512:EE_|DBBPR08MB10386:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c57ab5a-b1e6-4c84-e2ef-08dcdbbcf62c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnYzeDU1a3o4U29pT0JVcE1lNUZHNkNJVm93NW9ES3o1SThmY0dBUjdGL3dp?=
 =?utf-8?B?ZVBOSDRIeHpnWi9WaG1UVFdSWUJ3RWE4ckJsUzFVNWhjMFRBUVZBK0xSYzNP?=
 =?utf-8?B?M1pqN05SQ2RIaU1tNHBCRHp3MExxVUk4bHBNNkhySjNUYWhnVThNSk5uLzFz?=
 =?utf-8?B?NFdBMXBweHplTDh4VzZNRUh6UisyUUhPSWxnbGJrVnI5L0JDeGhXbGtCUjlN?=
 =?utf-8?B?NnphdXMwSlZTa3F0a2R6YXlKS2Z4VjltbFc1MEZGZDc0YWVYK3hqZUN1OWlK?=
 =?utf-8?B?TUlVSlVDbmhtV1dOT2MvMldndCs3eWRMWnUyZS80UWpFaFU3VnFpL2pKcG9O?=
 =?utf-8?B?ZVJyL25EcytsOG13elVtR01EMURUUllXc1hicUJpVUNzdzlJTzhXNWtyalVU?=
 =?utf-8?B?TkdzWUg2emdnWEFrWlhERjhucEYyTnZrclcrOVBkb25CTG9lU2pSVnZyWDV6?=
 =?utf-8?B?T2lQQlJXTVlnMDBLQVM5V3BjMHh2ejJJdlVkOS8xbC9DanliZkQwK1hoN1R2?=
 =?utf-8?B?UTRuZVowUDdxSzZPMHd1b3ovZ3RiSGxDWWJ4Ukd6QU9KeEwySWFpZ0Z1NVZQ?=
 =?utf-8?B?TGxHVkVDSHFHWmdJVFFzUVhIZ3FQRTVDRTliUjFlb3FiVElGaVVWUnpDYnl2?=
 =?utf-8?B?Z0puR0xYN1Z6NW12WExuM1k0K3p2ejR0cjFlK25QQXB0RTlaQnJqUDAxRmRL?=
 =?utf-8?B?SHh2UzVSaDJVZDZMOUtRR1ZTRDRHMGdENnd0MGRJZ3ZvM1MzSnc3dkhaK0Vz?=
 =?utf-8?B?RWlFQVJ6bkdXOWV2aGt0Mnh2TmNRVlRZVXY0Z0FIeGM2RjlFMmVnTjdwSEh4?=
 =?utf-8?B?ZUV0WGdJYXZQYXRLb1pLZXhxZnhrUkprenhra1ltcEFJc3BDTkYvYzNubndF?=
 =?utf-8?B?L3pnUEsrM1pHdkc3Z25KK3UrOFhOWElWbzlPcFc0aE1sZXM1NUR2SS9lSWxP?=
 =?utf-8?B?S0ltd0xGTDNmS29kbnRSN1JBUFp2U0lCeVhsTXgxaTFUM0YyQUJZVE9BK1NH?=
 =?utf-8?B?dytjclgwNDh5MkRqWUVpMGIvMXIyVlNYS2Z2TVdYejFiUlA2UXBKS2p6V2hx?=
 =?utf-8?B?OVduWjVvZ0kvODQ3S1NyOUd6UGxqNHU3Q2pacVdBbDRqcDFCZWJqRXp1TURR?=
 =?utf-8?B?QnorVmlnbHZuZFRodFhsaHdnUEliM2xnT2VJcm1jK1UxMzhRczFvemYrTGE4?=
 =?utf-8?B?WVZ4Uk1pVHNabEYzdEgwVksyckNiU1FLakdoYW8xVFM5N2pJckdzNWZtUFNm?=
 =?utf-8?B?UHZ2MjB6bGNqRHdMWFdPdTgxUERrTlZtTlo5dVdsZnNSS3YrTzJKeXZvUSsx?=
 =?utf-8?B?Ym4zVGxnaTVuS21FZWtkUmVIZVN4bnJRMjdUNnl5Z1gwNWhxcHpBUHM0dVBG?=
 =?utf-8?B?WVA3MFl5ZlpmM3l6QzBQZ0tpaWEzWTNKcUx4dGdYVHcybmd3bzNWWjIwZm5s?=
 =?utf-8?B?YStUK2dVOXFEb2JTVG9PL3duQUp1SkFvOFhhWUY5NWYvY254SCs1WGtpc3Na?=
 =?utf-8?B?WW5ya1hKN2UrYnFYckZwMEhhdFZqTjB0cXVDOUZ3R3ozdXZ2ZGlTMU4yL2NV?=
 =?utf-8?B?aVRCT3R4L0o1ZXpjcGFMMklQeFFmMnVNV1kveHF0UDc2bE1xYWRRSmhFL25P?=
 =?utf-8?B?dWY3UnVQVUppUEZmMTRKS3cvaG9Qa0tJVnUrT2VkcCtJQ05kdWpZcGZERlNz?=
 =?utf-8?B?T1R0WTkzMFJlZ2pVbTE1TTIxSjRLcWQxdVlONDBVQVVGVkJONE9Fc0JEZXhp?=
 =?utf-8?Q?3Rdtvbb2YF5MpRYbG0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7512.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXduRy9leGo2NzVkNHhkKzEwT1U3Y3d1T2VQVUV6WlY5bkdHcFh5dWtQWlIx?=
 =?utf-8?B?VkxjRi9hcGZDaHRsNTAwcklzUllNczRFVVczWDdWR1REZHlrbkJFbnVjTTcx?=
 =?utf-8?B?TmNlZjRYTXgrYWNjekEwWC9zYTY2a0g5ZmJMOUhsME5xUzlPRWZSbnhwRGdn?=
 =?utf-8?B?UUhxT1greVNXMno4Wmg3elpzaFdvWjZvVWtTQ2NsL2RVVERCTGpOTW54bWNY?=
 =?utf-8?B?RXVlaHhnZnRieWR4RHZCeU9uSURqUkgvL0xOQkFLY3RwMFg4NDVzbWJVbWdC?=
 =?utf-8?B?citRbHhsQi8rcWRZcUJWMHJFYkN0RmRGWGE0dmxTNlVWSjVzNGVNY3ZwdGpq?=
 =?utf-8?B?ZEEvcFhsUVZJcjVyYzFXOTgrODhxWGRvajJGcDdGRzVwTkVpTzlibWlWZXNo?=
 =?utf-8?B?MGVrOTZEdDFKK3pyVmhNa0pIaitDNnd1QWNhK1h2dTBHZEg0cTA1MVlDT2ZL?=
 =?utf-8?B?aTJweWE5V09tSCs0RWFCUFBHWEwvMnJXN0g1MDV2bDdFMW9reWdXeTBuZkcv?=
 =?utf-8?B?N3ovcEFlVDdXbDVFUWFVNWlJaWI3WG1wNkdLY1M2d0JScElnQ2Rmcm9tT0FS?=
 =?utf-8?B?a2h2TnBuTzgrbnJoS3g1c2pZcWlNQkl2dzZiT2dhaFMxVDBGSzc2bU5VL3R6?=
 =?utf-8?B?ZGNlU2tBZXFpc1hwY0FoWmZabXNqWmFWeXFqYS8zWEo3a3IraWl4SVdDblBR?=
 =?utf-8?B?TGxISXU3VjJmTkRzckNkYnN1NzFHQ0xJK201cFpSV2xsbUpBS0NTZzI3VEE2?=
 =?utf-8?B?bnlMZmJVdFB0SnZVak1yY09tWDRWWW9UN2RDTm5oOXdSU0FlZktwcDRUdFBE?=
 =?utf-8?B?V0cwNlR2YUVvRFBIVVJqY0pBcHluRjFMRkkzVnlqbnIvVDN6ZUc3bVhJK1Z2?=
 =?utf-8?B?eVBmN25SVkVwa25Pa2FVSndISUtVZTN1QkZ5SURjblhPOWhLblplejZNQWVN?=
 =?utf-8?B?bXpqdURoaXJTazNWUXRxUG9BRno4anUydUFZUXNLTERKckt0SndMOVF4MXFG?=
 =?utf-8?B?NFlWZFFxOXc5dUZFODhLUW82eTZCNzA2czRXSnpGNnlnd1kyU0dnVTRlYlFo?=
 =?utf-8?B?ZUxjeWdvSVJ6a1kxdDdMWWl3QWxUOXNsY09EQjVScXJ6ZjhmZDJlWjB2SllX?=
 =?utf-8?B?WmhhSHJGZk1YY0JQOXhjWVg0R3ZQdFhJR29TcHo5NlBQUzgzMy9ya2l0KzZL?=
 =?utf-8?B?a3FTR2F3L2xVdVlySm1sei92MEg4c3hINXRiWU1KeERkTG5maXo2MnNBSEdF?=
 =?utf-8?B?QUtWK0YwMDZCQnhxRVdya1F1RXZjVXlFV00yN25IN2gyclZqVGJFbEg1UDN6?=
 =?utf-8?B?TW1KSkR4MEk3YmRhdUNNLy9lQnNjWFR6NEJ1cXpnQkZEa2FsTTNFc0hQRm90?=
 =?utf-8?B?R0lQZ3ZhQkdJcjM4MTFDK0hSTFZJODNOemlsWDJKRE82QzJUZ01jeXppK3hP?=
 =?utf-8?B?cmc5ZnI0bXRld3RoT3JEMlpIVDdsLzdTQVF4UzA2bE1sOUExbDJYQjdOSXFI?=
 =?utf-8?B?Nm9BUmkwVmo2UlZvb3RvYjlrVTBKb3NCd0w5cnI2L2FQa1A5RDVaZkRDQlg3?=
 =?utf-8?B?R3MrZ2Z0NGVwWDA2SG9tN2lYNjhrQUJSR1dGQWw2TU55OE5OOGtUamtvN0d4?=
 =?utf-8?B?L3pFbklUTzJmZHJBQ1BYeUFWVmowbDNnRmtIcFkrQTZPYjM4R3dQYWVscnBY?=
 =?utf-8?B?UW5HakNSSW1wYnpnWTVzc25lQXFpdUZkZUdkc2VGaWN4L29FakxHWWpNT1dN?=
 =?utf-8?B?N0kvN2dKZ1RGU0NwWDdoZ2JZUlFtc3YwVTFFT25hWlUzMCtsODA3QVE2WllR?=
 =?utf-8?B?N1VBRjZ0ZHFpc0pCKzZRY1ZNZEkzaXVSWi90WWtZYjJ3V3kyS3p6VkVQRG5K?=
 =?utf-8?B?QndKOVVhZ0ZsS3dWMHl3SHJoY3NrcGx4Vkc1REFaLzZWaUFwSVl3bndveUJD?=
 =?utf-8?B?eThvdkZPUnhZWTA2anpySHlUTEU5SDljaEUyN1B2ZEpkUlUrS0hNQ0ZSSWcw?=
 =?utf-8?B?cE5HaXNrY1VlTkZIMERUOUNFdVVHVjhPRGdTZitmZ0lxejUrMThlZU53VVpW?=
 =?utf-8?B?czdCSGRNbFRtcC9CcGxvZWR5WjFONUNDZXR3TDh1RGhzZjRjbm5OZVQwQ3NL?=
 =?utf-8?B?OVRlQXEwcEVzMUhCT29HTjN4dStuRUJjVlptUXVVeGc0TlFhY3NjelZyb05k?=
 =?utf-8?B?TmZ1QkdIUjBzTCtQcjRwY2xZT0Q3L2p3aFNDZFRCRENZandxZjA3d1NKSFlw?=
 =?utf-8?B?QzVVY2h5Q3lGd2cydDVUdDYxeWJ3PT0=?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c57ab5a-b1e6-4c84-e2ef-08dcdbbcf62c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7512.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 10:46:21.1676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inhQ72n96PY5YxacM+9/NOF/wkBF37ZrQlDe5EazNRNTBIfH86m20yu5/JPSjyehR+CRk45pPWSAOBWf6wIcQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10386

On Mon, Sep 16, 2024 at 07:51:31PM +0000, Anthony Ortega wrote:
 > I am trying to generate reproducible builds for a Linux environment
 > using Buildroot. One of the last packages that is giving me trouble
 > is the DTC programs.
 > [...]
 > They all seem to intend to encode the git
 > version of the package they were pulled from. However, in a build
 > system such as Buildroot the DTC source is staged in such a way that
 > the git information is stripped away. While that in of itself is not
 > a problem, the problem is that it may be getting built in an output
 > directory that is within a larger git repository. Therefore, when
 > the setlocalversion script runs, it ends up pulling the version of
 > this larger git repository.

Yocto/OpenEmbedded[1] and OpenWrt[2] avoid such issues by setting 
GIT_CEILING_DIRECTORIES. Maybe buildroot could do the same and fix it 
for all packages, not just dtc tools?

[1] 
https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf?id=bb3101fffceacfa4c021c33affb7c785da8d859f#n788

[2] 
https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=include/package.mk;h=7fbecf98dc7c9a5b11ce1958e254578f7e4d9c73;hb=7850e197670afff38426075953ba6a71f0f431c8#l202

On 2024-09-20 13:05, david@gibson.dropbear.id.au wrote:
 > Unfortunately, I don't think our system can be configured to use
 > meson without a massive overhaul. In the short term I've applied a
 > patch in our build that removes the line that grabs the commit tag
 > during build.

On Thu, Sep 19, 2024 at 09:45:04PM +0000, Anthony Ortega wrote:
 > But, in any case, I wasn't suggesting this as a practical workaround,
 > but more as a diagnostic.  If it works with meson we can look closer
 > at what it's doing and maybe duplicate it with make.

I do not know what other projects do, but most likely those that do not 
exhibit this issue, set the git-dir explicitly (or use GIT_CEILING_DIRS) 
to avoid git taking some repository above the source directory.

I still think as a first thing, buildroot should implement a generic 
solution and then we can look into fixing dtc and tools.

Regards, Andreas
