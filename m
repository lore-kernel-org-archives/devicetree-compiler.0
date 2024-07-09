Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2109.outbound.protection.outlook.com [40.107.103.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B38E155301
	for <devicetree-compiler@vger.kernel.org>; Tue,  9 Jul 2024 11:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522869; cv=fail; b=gPZEqdOKFFEOX6jNLpzSLnB45/Iz7lcDYy5Rh/fh8fbGHcjWAsblPoVEWQ0ZivLyrFwDbEbUPDIMXGiPWe61K+w+nCXRYZUip2NaiJAk47BqqAJOkfpGpqi/0/nJYT4FTOhXYR0j1dFrM2psUcluwzM1Rrye+rVElwgtHrXjTvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522869; c=relaxed/simple;
	bh=M5GuZYpG+g/Kt0mKZLCymkscVl2Rh3PmJyvq0CjzbMY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T3l7zL8LAFunRtLRE9gCB9Sdu188GfN0yPec8/FyOemyxfuq3ryvCE+QP7LCZ5ZeLKk7uOsM3xwVo2WcPfcBffemCKIDX5+4Zy6F3phoAiZMzP5qCNIpIROLFgfXo3lkVc5CDNF5ZvnK8keTkMPJqmtdWkINK1Ssz4GkTXEjGDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=2GFjEis3; arc=fail smtp.client-ip=40.107.103.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="2GFjEis3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0fbRHJZ9mrTIcNYBLsNWSNegssxgpBgRXBtijVwOzUoZWM1eV5IpmQZdRrtszo+R3ZZLoVBrdzHo8R0qo9Qmi9ozilK1nyoxIzxX6thNTwlaDASNCugxevXjk/sgsZdSk2BGYCFc2PYrmplR6ncn2Mw8KA0SQLDWwShhFSYdnzaoO7vOJZ8FxCJLc57Gmoes7RPO7PCd4P1MWHAUl/E42NI2gVkyTQ4LBHPOVvIn5vcg2hUa7Q8ILZ/FpgH+8y3mdBYcMqNLRcghQkK748g20gVA/JwDjkJPTjOmw4rSfrREo2uiyrQhufBmQNEkfHa1hPtkdFrcIJz/wOpwfO0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yW0chqr9YxxS9rKu21v27EGfQ2te2HRlTVtI8Bqzd+U=;
 b=mIYodg1d7GuLMpQ/wiblMM9geX7S6dAa+eTHzoXXVu5G0UjKTxnla5m/cuddVyaOf3rrGCDTtFVbXhjAtesseCnxyKQFuK6xQX/b6SaQXUsy6TYEkg91oTIprciwmPhZSnOXXwD8njZFNKp9cKyky7Ns2RhnGM/KKpZqe3Clu162kMr+JNKsv4LE9RqPm3IaAp0qJEBGlnShxjdVkK4su6ZbznW/klJE2j8bnGXmH4CaBGoQnKVzVA5/V2BJMClQH4cchl67yitK8mZr0QyGS020emJzatYbrU5vU0iEHMbWWiwQ/A5vTukGWTI5JlgqC+ApdZalW9IBn2JRThF3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW0chqr9YxxS9rKu21v27EGfQ2te2HRlTVtI8Bqzd+U=;
 b=2GFjEis3CiHDLTrcbG0dZXcKacQXJTOcioa+fx2u6e2Xzq9yfUFJx67CHCUfPqWI6l5NCELlycxtFKLmB1jsW3STJEl5pwhIE8s3v1KK/dxik/WiplNl+FXwstItvQSjBcCFJCVo84AsAZbNKq8pchNMJKsdhGesV3HsRJ7km5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PR3PR08MB5836.eurprd08.prod.outlook.com (2603:10a6:102:8f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 11:01:04 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 11:01:04 +0000
Message-ID: <41277501-fcaf-428f-806b-0bf85714a1ba@wolfvision.net>
Date: Tue, 9 Jul 2024 13:01:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checks: relax graph checks for overlays
To: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
Cc: devicetree-compiler@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240522-bugfix-relax-checks-for-overlays-v1-1-130c8b85c06b@wolfvision.net>
 <59a8ed6b-1410-40d1-8a32-69cc8741311a@wolfvision.net>
 <2910718.NACDBdzCOe@diego>
 <CAL_JsqJ3rc3+OiZ7o0JNxRGnCinDQJeau6oF0TBYx3ZNcnK6-A@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <CAL_JsqJ3rc3+OiZ7o0JNxRGnCinDQJeau6oF0TBYx3ZNcnK6-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::26) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PR3PR08MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa30770-7a18-48ee-d9d5-08dca0066cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2dRVExnZmxXM3RHelpZVWg5VE5yeUlZa3JYNEJ6NU9IY1BEaC9ZQ0JZeEUv?=
 =?utf-8?B?dXZoQzlaWEUzTlRReXZpMzZDNkJwQWRJVjkyMSt3TVZPbkVWR2ZwTDlLbGYv?=
 =?utf-8?B?WWY0YUIvZGpkMC9ZWDd2TjRQczgyS0Z0Zlg3a0pBNm5xa2hpWHYzUHVxL3Vj?=
 =?utf-8?B?c0lGN1hFQTVmL2FyOUh4eXYrOTR1dk5DMTJ3Q09IajUvSjZ3YTdubERrZkdr?=
 =?utf-8?B?WlI5NWY1SkhJdk9uWFp3WW04ZWpab1dYeVVKbTgxeWVxMWZGSDY3eFlGaEQ0?=
 =?utf-8?B?c3JYa0xtTjB1NjhneElybHpIaGtCMHdvMEdPMi9xd2t0eWVTcTY0WHlWTWRm?=
 =?utf-8?B?ZDBkZlNGRHVkNkw4ZzJNQmYvcTdGWklJUVNiYXpLUWVjbjhhNmV0MXZ5K1pz?=
 =?utf-8?B?OUwya1RFWG1YUXFxbXZpSkg3cHd2ZGpSaUd5MEVrNjJ5bURScDdRR0JHeFVK?=
 =?utf-8?B?VWhYcVNvWGY3ZnNBL0NtY1pYdGhoUzNIUDVHQUMvOXd1VTBkZW4rSktGZi9q?=
 =?utf-8?B?RjFYb2h2T0hpeW9LbTlBU2gwcGNmUldFUDNMZlNMSW56aVRwbC93Q25Udkwv?=
 =?utf-8?B?VmpVSU9aeDZqdU9WM1RndS9QN0ZWQTM3VS93WCs1T1pOWk1PY0V4UFlqVEVD?=
 =?utf-8?B?YzVFM0dMTmRyMG9KZU1Uc2NDbTE1eDM0QzFEN1U4Nkg1MmFyeUZqc0d2dEYw?=
 =?utf-8?B?Y1dTbHpXcmgramdONjJwNHJTWjJoajI2T0Fuc1lhQUV0ZkhxTnE2VHViQ1A5?=
 =?utf-8?B?TXpyTnFUam5FbzNqYzVmaCtnK1p1cjZoUS9nVGZJT29mY0JBcnZRT01IQzRk?=
 =?utf-8?B?a0laUG1IZE9Wc2VHc25POEZNZ0tTN3hVdURaeVhFY2RQalZWMU9SUkZyK0JM?=
 =?utf-8?B?WUNXZjNmc2ttakhvN09ac1pLUy9waG83alRRTStSRzhaM0twRmFscUQyU3Fk?=
 =?utf-8?B?a2hNZkp2NGEzdDE2V1ZlcmJqcUdPVXN4WncweHpiZGovMGJRQXBkditZdFp6?=
 =?utf-8?B?WjVYRlMvZGpVL0ExMEdUOW5rWk5EU2RFdy8wNU1lQ2NPTTJjRm13ZWRNaXJV?=
 =?utf-8?B?Ly9LWWMyekh1Q01CTTVBNmlXQjkzWWdtMWUreC95ZWllMGpkcUpGaXVZUnlI?=
 =?utf-8?B?V29zY1d3Q1RkWHpCMnJ5bXNCSDRWVHYrbitIT0s0QS9mSFVNRloyK0tySHVX?=
 =?utf-8?B?VmREQ3hYNXJpZ08vaEp0VkpnRVY5Tk1XMDRnb1BpQnBoeHpkemdwY282SDdY?=
 =?utf-8?B?WWhkd1E5TzRHajhoSC9oa0IwSE1hMk85S2hMWUs1SU1YWlZJT2o0RzFyaU5k?=
 =?utf-8?B?QkFUamNDd3V1b1VpTS8yVG1LZWd0VXFtRSsveVZVNlJHTnB5NUEvR0gwN3ho?=
 =?utf-8?B?eTdXajlGdTJCV2xTNGYxdWxUWjE1b2VNUjZJdGdVREdOSzZjdS9lVnNPYXRm?=
 =?utf-8?B?QmoyWVRKS3h2YUh6cVpJanZmOXM1aUFKY2syN3JBeDZ0amFidWhsZ1Zrbi96?=
 =?utf-8?B?WDcwTDhzZ1kwWjhVeFoxU2ZEeVVqUFZPOGIveE5sbkFzdWdQYnlMZG1FQVNX?=
 =?utf-8?B?SmE2amNPbzFST2RucmkwbkZ2Y0t6MTZ1OWNLS3ZueVJNcXU1Z0RYaUt1MGVm?=
 =?utf-8?B?NHZwNlRsZGhBUHJmRFMyWHdFYmhiTDNOR2llN2Ywd3EvOER0S01pNkd3WHVj?=
 =?utf-8?B?ZHhtMXZzT2l3dG9FQ3NLVTZhNkNRU2gwZUFQaGdRciszVVhOWmZCbTF6eDdU?=
 =?utf-8?B?U2tqVjFEK1ErVG5TM2VkcnFMeE5QSDkyOS9UemgzNlVIS04zWlFURVZIRlAw?=
 =?utf-8?B?SUs0NlFxWVJ3b3V2THFvdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2ZEMjBYNTdlUkJBNENZQTZmdnNjeTRxS2UzSHV3QWkwcGMvSmlacVRmSTZZ?=
 =?utf-8?B?RkNldHpSa0F6aFpneDIzM2pZY3BoVE9xNTc0SXpKQzUwQ2ZvYlFKNnhJRUov?=
 =?utf-8?B?cUFCVlJGc0VYU3daK1k0Q0ZCQ241aGo2ZUtrVENTRzBuSjRlNEswOWttV3R6?=
 =?utf-8?B?eUdyRWxNbTNHQUJuR1RQRUFKdFZ6UWVlem02anE1Z0VzQmhkcWNsOC9KN2ky?=
 =?utf-8?B?VUpKNDM5a3IrUHRSZWNvWCtTMHFQWkFWdThoMkFWZUJYS3FYUEROUzVhMnlz?=
 =?utf-8?B?Qktyd1RDNktBeSs2a3pWb1Z5bWo0cElMT1VaZy9vSElVa0wyUHUvTVVZcWI0?=
 =?utf-8?B?bXc4Vyt2aXdBWVZuVHR4ZmVyN3hmRkdhUkNJL1Q5eTduSzJManZWc0VDUGFQ?=
 =?utf-8?B?K0cvcm02NGp5MDJhc2pZTy8wY0VlZ2JxQ1JreHA3K2dPNVRTSzZ4SjEvQ00z?=
 =?utf-8?B?NTNGYnlEeWt2alducjl3MGliUnA5ZHQrRVBzN3E2TWpINFRVYjBuTkZjQk5u?=
 =?utf-8?B?cE91bmhVcWxHQU5QaGp3OTkrWkNBTk5vcjZVbmdSL2IzWGdGRUoxdFIzZ09J?=
 =?utf-8?B?QUFGc25HQmMxLzNtdExmd3JoUXhWNm0xUGlCMzB0dFdidlRjQlYwYmwxVDly?=
 =?utf-8?B?anlHcEIrQlJjTWxJSTJpMVRQNmZDbXhGS25rL1gyK2Z6VVh3VHJpVHF4NWxC?=
 =?utf-8?B?WmE2bDg1Rmdxa2RTMWlXZXlSdnJnSHdXWTlmMm44cEdueFNIRVplSm9oRUFl?=
 =?utf-8?B?RzgwRFJFdUd1dWl5SGN2NTExbXpreVN3R1FyQ3lONHJLRHRCQXlIdUR0dTdw?=
 =?utf-8?B?ZjdmV1lHdm1tQzlqTkxITjhtZmcyM1BYM0FjbGZpbFJtdTJJWU83R3V6b1R5?=
 =?utf-8?B?czdqRUdWS1hUS05SUXF4Mnd2UWZRaGZqVHRoYUFUTm53ZmhuVFUzVjF3aWdR?=
 =?utf-8?B?NkUvMjBGWVlkSmRoc3pCUTMrc20yVHdqajk5ZHdpWXZmMEV6elM4Y25vNEdW?=
 =?utf-8?B?bXpERGxEYnhXZjBrTUhPTUxhR2cydGFzL1llM2ZEVUIyWjFTQzhOdFVkYm12?=
 =?utf-8?B?dXJyc2NYZ3ZaUkpQOHQ5RGRGczMvY2FGWlZPVXBNbzlrL0FkMkpDY2d3N3NW?=
 =?utf-8?B?enZGUDFpMTFHT0J6T0xMSXVTZjgwNlE1KzJ2eityaVRoWDErcUJkRW9jNm53?=
 =?utf-8?B?RXlsTGc4QmFlNSsvMWt3clFDS0NnNUhVc2Fnek5XOTl4VGJNK0FhczEwcXVq?=
 =?utf-8?B?dGt5WkwzMnN2RFVvQWhZQXVlSGJlR2Z0N1B0UjNQTlFGT0txNlU0dnlmdUhh?=
 =?utf-8?B?Uit5ZlNPdnVNQ0RqbWJYeWJsT0kvZVkxUXdHdWljeExrWGZmakNKdWJaQTB3?=
 =?utf-8?B?VGtER3JMeWlnSDVYaFJSeUU0WWhvcEQ3NFNFSlRQSzhtWC9qZTZKbGtMWGVh?=
 =?utf-8?B?U09XeEVGdUlWTGVWdTlTeTgwL3pzV3NlTTJCUkp5WUZ0K0NzeTB4REtNTXZz?=
 =?utf-8?B?MURrdVRnaVNpeHhvSnJqVm5xM1VwOVVBTEozbWorV0RHWmIxL0QzV0tkK0J0?=
 =?utf-8?B?R3NXSnJ4RW5rdkVsUnZVYWlnNlpMMmVzRW0yMzlqSjZmMWJNRFNvd2JLcTQ5?=
 =?utf-8?B?anArbEJjQmNmM2kvTlg2Tkg0cVJDd3NNZHIzbWpQNXVXcjVZRUoxczQ4SEhG?=
 =?utf-8?B?NzNLMUxWamlMWmtYRGVIMUtpSzc5T21MMFc5ZUo1Q25oUER4b3dkTHZ1Zm9v?=
 =?utf-8?B?eTZWK0dJVitvdkhYRXN0eEJCaXMrd0J3a0VvdkdzMjArV2U4RVBLUVRMRHk2?=
 =?utf-8?B?V01wU0pmVHExR09PQXByeTJIR01wZlpaSWNSMy9Gbld3QitLZXgzd0JmVlFK?=
 =?utf-8?B?N1FJck1pamd2aU0xZ3JyYU5oK2NyczA5Tmk2TWlaVk5aMFp4ZjJtejJyNWhp?=
 =?utf-8?B?TmorQmJBTTk2Q0NHem9QWGxVTmNNU3hHOFB1OVg2c1AvakdjbFpuRVhORFFs?=
 =?utf-8?B?dkpuZE93M0dHTEpvRHFlbEtzV3FUQWtUOUQ3VjZBOW9KNVBaUVNCd01UUnQz?=
 =?utf-8?B?V3dkWGYzNHFuZE9lK0k4MWd5ME1XdTZFVDJNa29HVkNBZ3UzWmtKQ3IveHRN?=
 =?utf-8?B?M2RBeXpJTGF6WE1EekYra3RMTFpRTHZpY2pGaDVwblBUOE11OUMveHhUOEh0?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa30770-7a18-48ee-d9d5-08dca0066cf9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 11:01:03.9669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZqnJrPItTlMkDWb0Ra9GcaTy42z8715TVEUOeFkqAB51FC5qb/igyt2QqyyQlqqgh6NzgLt7R1VhqXwlQq7r6kVx+zxmz+NCu4qoGA02gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5836

Hi David,

On 6/25/24 22:15, Rob Herring wrote:
> On Tue, Jun 18, 2024 at 2:04 PM Heiko Stübner <heiko@sntech.de> wrote:
>>
>> Hey dt and dtc people :-) ,
>>
>> Am Dienstag, 4. Juni 2024, 16:48:46 CEST schrieb Michael Riesch:
>>> This is a gentle ping with David and the DT maintainers in Cc: (I am not
>>> sure what the protocol is here, so I'll simply give this a try).
>>
>> it would be really great if someone could look at the patch and tell us
>> if that is the right direction to go, or something else needs to be done
>> instead.
> 
> It is similar to other fixes in this area, so I guess it is the right
> direction. I don't really like disabling checks, but don't have a
> better suggestion.
> 
> Not much else I can do here, it's up to David to pick this up.
> 
> Rob

Any comments from your side? Or are you going to apply this anyway and I
should just be patient ;-)

BTW would you prefer a pull request on GitHub?

Thanks and regards,
Michael
