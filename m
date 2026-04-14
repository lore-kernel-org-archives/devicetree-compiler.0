Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013081.outbound.protection.outlook.com [52.103.51.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22C22BD11;
	Tue, 14 Apr 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776195075; cv=fail; b=dBMijkbzpF3oZDrRipQH1ywSFCSNL/15fcZdDYYVMg4eXJ+JQgHeiyXjFGXvuVwHEAEtISx632tRCLFspRV5bBZzBGtv2rKVdUDR9gUYKxargVTL87sTHr1TtYdW6TY3Sr9akEV26ZO78HBDi0uGXOUn4m1e2M8Te8Vws+5an3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776195075; c=relaxed/simple;
	bh=RwyND4gHroDHGLZqMtiJPxCYTOn1Uz1cE7VPSo1zj5g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qxylvpOG7zddSUSA93g+v9NLFPcikRBvT+g+xvvPI4cjuFTBywy06XuSznEU6nedgTQkM41PZATrdUpE6wJoVdtcOhg7ZQj5r30WE9hhNBgSjukvcW+Iep69et0GjkleSDpmGNUg0vaSy3aNgB88Hj7uwuqTlm2TrGlMmjRAZpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=VQtEx48E; arc=fail smtp.client-ip=52.103.51.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="VQtEx48E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyOHmgdOXZZyksyDwMaBYWDjREAQVel7lmk1yXO+Bu+lP+UNnAYNJRaAah3/PFjwIVlRUWjHgPSxyWdsGBEqQP+upn9KJkei9yWagq/f7lK1Ri2Jk22QDdcTrYY6rHDxCHmvFMeQOlRW2gIw5CnBgIa2WNkflml8sf1Pc6aSXediqCQFhbLsgW3X8A9e7/ISq4Aqs25jZE3sdH2kfIcKiPKAWKZLRi8gDlXUEGiKqwg1G2pTn5q8BJpJDJbonQRZeU0y5GPyMf0e0M0OP15qQ3ppNAyAUcrP00aI0XAgW8jN5MKNy7nzrevlA+zDaUEUya58dPxlTYd7SzXBAYeUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwyND4gHroDHGLZqMtiJPxCYTOn1Uz1cE7VPSo1zj5g=;
 b=ezZysoqDRJvAc96XT2q7g5qDRnGdXT4VQ/xJL6raZmA/mjwEYlSaYldD+/qgS/F4hp4Toau9WKN+vc+TpA31vv8XmE7EBArBS/BkQb+MKVglknjlVJ+hOwf3hj+dFdK2xKTITIpSeSUdIHeYjkS6B/mGg2XfFEnSpFTEGDZFzUXX3IutfQRgctExuBoS4VhkYdJkG4yel0mBJD8ZlDMI50NlKh92VxDQCGXMHuzHMopxLAB3ox5tf+wyfhdF5SWSOSCg8oQJdLHgbVRHPXp5abFUwGsIi1jaOKs48QRJmqNfEQpZdH3X5Z/x1WwsIbA7OH+126EeI/3EW4tySt7OJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwyND4gHroDHGLZqMtiJPxCYTOn1Uz1cE7VPSo1zj5g=;
 b=VQtEx48EV7cvGfyI8u18CXHp3NnzJZoDT5FfXDb44LUPJvpD9di+hm4bgmRRl9sHNFejmWWk9vwhe4lpmogbDY5fRQaESG0G+6L0Y4NCoX0DoO4oECJgkcw+KAIsH5N9kxp9N38SdLpt/IcnH8d10lGWQzO60QLBL4zsRJR3/JwDMncoC3ieEzj0I8w6nEh9YSMNU/ja4VWSnkhkUSQxq+lW1riNpkfjvpk+crvmJjtOTwTC9UWZFq3yasrjA/r+vCt9azzXpvuobqdsIgCagOYYQaSdhIhKSSrbBGKq9rXVDRCZjQSRWYwhIvD9jXWtgeTqWv1H7uo7FiKAqxeUZw==
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:285::14)
 by AS4P190MB1832.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 19:31:09 +0000
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac]) by GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 19:31:09 +0000
From: Kyle Bonnici <kylebonnici@hotmail.com>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Herve Codina
	<herve.codina@bootlin.com>, "devicetree-compiler@vger.kernel.org"
	<devicetree-compiler@vger.kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: Phandles
Thread-Topic: Phandles
Thread-Index:
 AQHcyeGzLXiU0rQJNEOrDVQKAULcerXbYncAgAAQq4CAAB5ZAIAAEA+AgADqzQCAAAkrgIAADHmAgAAMeoCAAAoaAIAACW6AgAHvyoCAAETlAA==
Date: Tue, 14 Apr 2026 19:31:09 +0000
Message-ID: <D41A7F85-B339-4409-9628-555D4857707A@hotmail.com>
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
 <20260412145144.4737fde6@bootlin.com>
 <D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
 <20260412173916.7a971a45@bootlin.com>
 <163D807F-0F83-4282-B182-7A18B124D3E6@hotmail.com>
 <00f0d18e-feba-45cd-af92-f737c9b965ef@kernel.org>
 <7F2DF84C-A010-4BCB-B973-D17BF58EDCF2@hotmail.com>
 <e3b4c7c4-64cd-494c-b2c5-fa71a7303038@kernel.org>
 <74FB5D90-08F5-422E-9DB2-A00E74E25422@hotmail.com>
 <c0983f3d-5025-4933-ac22-bfbc1adc6c31@kernel.org>
 <DB5F7CA0-08E8-4CF5-9815-598002AF471F@hotmail.com>
 <CAL_JsqL2bRmX6qeapqqZZx=V7ARA_XbenrTqNk4ru2AAR24VZg@mail.gmail.com>
In-Reply-To:
 <CAL_JsqL2bRmX6qeapqqZZx=V7ARA_XbenrTqNk4ru2AAR24VZg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXP190MB2509:EE_|AS4P190MB1832:EE_
x-ms-office365-filtering-correlation-id: becff71d-9797-4899-a59e-08de9a5c6154
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|15080799012|8062599012|8060799015|461199028|25031999004|37011999003|51005399006|19110799012|440099028|3412199025|102099032|40105399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGNjREpIWkk2dWY3UFprMFR4RTlOdHV6WVo5Rks1THJ1L0NlZ3hzRHN2M2ZT?=
 =?utf-8?B?QTExZEdldDV4Ynh6aW5oTFBtWUVLK0tLdE9nSmo5cURlRnpOaG9RR29hM1Zz?=
 =?utf-8?B?OFBnMzY2WENxcTE3cHRJR2RRY0VhTlNuZmRNQkxwMEVLV1ZqSis3ZkJ2NlZN?=
 =?utf-8?B?cFUvMHJwdXozZFpzVnhSeVhwT283NHlPdEIybkUvdy9LdzBFa1Avb2p4MXRa?=
 =?utf-8?B?YXh4M08xVjZsOVV1WHlmc1hORFFPQ1NJMHhoeFpUN3dRMGx4QnFmcnlmdFVw?=
 =?utf-8?B?STdFN0E0STZEVFZncnBUd0hUZWFGT1F3QkR2Y3k3cExRSnFha0cvOXpRWVM5?=
 =?utf-8?B?N1NLZXlmUzgxbGVpSVJJci9rQlh5MUVzNERRelJMRy9BSi9VTjlZNnk0MzFk?=
 =?utf-8?B?bDVJYnVQbkVQVUtVRnhQUzhvSXlCZkE0MFdhbW5EbWFvdXFHTFpDQ0dZWmtu?=
 =?utf-8?B?MTRiUWxkVDdzd3FDbWFzaFZ1bVVMWVA0TG40WmlCc08yVjZ1M21zd0sxbVlq?=
 =?utf-8?B?NzgzVUZUS09SZTRDRTgzRHB0MmdERUdTTEJVUVUwZzU1VHd1ZnNkNC9QdFBT?=
 =?utf-8?B?MFVCTk5EM3MzVnZoK2M2Mm05dzkvY2xMR00vT1RBRDRHZVBGcElLVWhPVE5i?=
 =?utf-8?B?dUlNKzhkNDdKemw5ZFowaUR2S3lhWXFBcm5WVkdDKzlLd3RhbHI4eTE3dmhF?=
 =?utf-8?B?a1J4VVhTd2hZdy9kckxWQXk3aFJ1ZXRKc0pHYkRzdnJnTk8yeFN4aWxIRDh5?=
 =?utf-8?B?UEZNelhoY1pMVDBjVXRWZ1hzdFNhR2tkdUtFZ1NOUWhSTlhjTERjcEE4VlBM?=
 =?utf-8?B?Q1hQMUJwNjlBQTVDa1JabmhvQmVzRytBeXJaQ21uME5kMDlmMHhseHJ2elBC?=
 =?utf-8?B?cFNFVjE1d1pMMk5yM25qcjVZcTdST3YwbHgvQmRuRjFvekNxUU5LcmxiL1JQ?=
 =?utf-8?B?Z3ZKY0FIdkhXMFFmWDFtM2VVazVMVXFtbDBmdERZNll4eE1qNCswNHc4ZVpQ?=
 =?utf-8?B?UFJzMWZtdVFKM3h5MjNsS2x2N3dOTTlCcXp0dWMwM3JFZXdyV1RHeHZOZVQ2?=
 =?utf-8?B?Y1VXam1NS2FHN041eFgwcGMzclh6bVJ5bFhoY0N5M2Vhd3hMNlc3NERIdWQ5?=
 =?utf-8?B?ZVFEWmNQeWZSVEh1WVVBTlppZy9Nc0xhMTJyZmd0UElHYUFBNGQxUnhoWmdO?=
 =?utf-8?B?Zno2UnZML1RGWWYzZXBJSzV4eWRFaUgvWXJ3SHJYWll6T1pldkJHVXF3RG9i?=
 =?utf-8?B?bnBVSmEzdDdzRXZYT3duNmI2QXJJWm1iNHBQWGJpZDZVR3pGQ0tSMjBqZ3o5?=
 =?utf-8?Q?UM9wAfrXFV+7Q=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2k0clZ5MktreVlvQjlLL1I5WEJjYjA1WkcwUjZkdnZQZmFtT0Z1eERWTHBY?=
 =?utf-8?B?dWJDUFZtMmVYckw1d2NRMVRNUXNaK1IvQW9MckxHK1piSXBOV1JWVDNuN3RG?=
 =?utf-8?B?amhxb09HUmo4N0lleWJ1YWU5TkRrTEpLaktramQycTZ3aTI2L2I3V3V5RlND?=
 =?utf-8?B?WXNVR3VXMS8wOVZLdGcwNVNqUTROL1U1cGhJdHdUTUkwZjlCNE9rNXV1Sk5J?=
 =?utf-8?B?ODZlYk11TjZZR1ltVzBOZGkrekpMc1ZKYnJENk4rOVU2cFA0bkc5VFE0cXZ5?=
 =?utf-8?B?QkdZa08wMnlxd08wK2VvM1E1Q1BUMFkzb2JadmNQTWZGb3VESWZsbm9BYXpE?=
 =?utf-8?B?MU9RTTlGVkxsN1YwRVF1amhvNzhTODhQQVhOQzY3dWt3VWdNQmcwT3EzSEYw?=
 =?utf-8?B?Q1o2dUVicWNlYWdUdE01Q0pPd1Z4bVpuaVhrU0RkWjA3ZE5oYTNLTnRpL2d0?=
 =?utf-8?B?OUl1eDVRamxLN3VjSis5eUhxRUVNd0tUOGhBR0N4RWxGbGw0Uk1XT3lVNk9l?=
 =?utf-8?B?bmI1b2lENFFUMGZIdzZWeUpKS0pHRXRpaU10MkpVNnNEMmhtM2w5VDN5U0Fp?=
 =?utf-8?B?WmtmRFppaDRWM0g3QlZjcEw1dmM5a0hodnkwVU1YcG5MQ21xd0FUNDhURE9i?=
 =?utf-8?B?U1JBZnUrblN1RFEwT0FINU82S2lPd0E1UkxXSUxRSkJpa0VaRE1VUzl0U3JW?=
 =?utf-8?B?bUtiTUJSckRsNXlGNC9JWXNDODVrcFpmQVRuV3c1QUtHZ253S1VySDM0eElM?=
 =?utf-8?B?TE9nOVJsTkIzYWxCemtlRkJ5aVo2cWxpMGN5UjJvakFQRUhQSE1KWms1Q09K?=
 =?utf-8?B?ck56S25xSTZBMitqSUdKem4vMWdaTmlNRVFqTE9vY0ZyajI0c3NXaFBUdDIr?=
 =?utf-8?B?WTVGOUF3YjVHczhxYXZtZUlPL0FhYTFMWUVvQmdOdlJNZTl4My9POXh3WC9P?=
 =?utf-8?B?VTZ5ZkxGWmttbGNCUEdNdTF1SDV1YTR6RENtbmZubHo4WVR1QTAzQjJBMjl5?=
 =?utf-8?B?dWVpeUZlalc5Ujg3SjJBZEJESDFJdmh3LzJ5N2MyVnRicU41cmo4OExkM2s5?=
 =?utf-8?B?aE03WDF1U015SVV4em4rZThpaVJtSHN5WEVRNGdVdFZOZHUvdmc5MDJIVkN3?=
 =?utf-8?B?NTh0RktpeVVmTkJ5d05VOG5CQTUxZEduakxlTGJ3V1R4RE0wVjJ4ZnAyK0Zp?=
 =?utf-8?B?Z0ZTbE9seDdZWTVRQTlBSVl4a3VhdkNPVVNMTDJUVUp2b2JyYktyaWRZTGZQ?=
 =?utf-8?B?WVJheGZ2cEtqMGJPd0JBa2hpUnR6Z2xiRmYwdm93cFdCa2o4RGJ0bDJXUENv?=
 =?utf-8?B?akhSUW0vQ1hpZkovWHZlc291RFB3WENUUHdMOUlBS21LMHdFTXovYXZpVXRJ?=
 =?utf-8?B?aEFHelQ3Wm9CRDFtZG1XZDhJajFJY3BUTzl1RHlPazlUQjk3eFhrTEZNdHZy?=
 =?utf-8?B?ZGhxN2thSnNJaHh0SUxTTVhwa2lOVWxCaERsbGRYWDlMV1piUG5IY2FiaFZL?=
 =?utf-8?B?RzZENjZSNGdFTnNSa09SSkRmL0UxUTA0eHdnNUdPbGZHdXQycnVqck41YTJk?=
 =?utf-8?B?K28rUU1vSnJmNjZ1bWNweGk3ODhLN25jTEcrN3BYWUdIcGR4aFovLzhjaWp1?=
 =?utf-8?B?S2R0SkZwN3RKeHhYaGZKQ0ttL3ZsTml6cWpQZXdsYmM1bmQ3bU5sVDB6S3BD?=
 =?utf-8?B?TVVMcHJkRFQvdkYzb3JCVC9GUnVOZGczUHhFQmRGanRuVElaSEFYVnFQYjIv?=
 =?utf-8?B?cUp4ZU0wWWlKV21YNlNKdUhyVThjb0FDL0Y3UGdHNjNPR1VHS09jYU80bTZZ?=
 =?utf-8?B?V1UzU00zazNnT1RxemViKzZLNnJQKytYUS9DSzgxMklZL05xTGhnUHgxUTNC?=
 =?utf-8?B?OHpmNXN4Y3Rkbkhtb09iK2htZDZub0lZQWFVRXlLZDZacmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4C4BA4ED45FA848A6E3D1ED81C40CD8@EURP190.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b33f1.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: becff71d-9797-4899-a59e-08de9a5c6154
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 19:31:09.3288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P190MB1832

DQoNCj4gT24gMTQgQXByIDIwMjYsIGF0IDE3OjI0LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgQXByIDEzLCAyMDI2IGF0IDQ6NTDigK9BTSBLeWxl
IEJvbm5pY2kgPGt5bGVib25uaWNpQGhvdG1haWwuY29tPiB3cm90ZToNCj4+IA0KPj4gDQo+Pj4g
WW91IGNhbm5vdCBoYXZlIHJhbmRvbSB2YWx1ZXMuIEkgcXVvdGVkIHRoZSBEVCBzcGVjLg0KPj4g
DQo+PiBXaGVyZSBpbiB0aGUgRFRTIDAuNCBzcGVjIGFyZSBwcm9wZXJ0eSBuYW1lcyBzdWNoIGFz
ICBwd21zLCBjbG9ja3MNCj4+IGV0Y+KApiBtYW5kYXRlZCB0byBiZSBvZiBmb3JtYXQgPHBoYW5k
bGUgY2VsbCDigKY+Pw0KPiANCj4gSSB3b3VsZCBub3QgcmVhZCB0b28gbXVjaCBpbnRvIHdoYXQg
aXMgZGVmaW5lZCBpbiB0aGUgc3BlYyB2cy4gd2hhdCBpcw0KPiBkZWZpbmVkIGluIGR0c2NoZW1h
LiBJdCdzIGEgY29uc2Npb3VzIGRlY2lzaW9uIHRoYXQgYWxsIHRoZXNlDQo+IHByb3BlcnRpZXMg
YXJlIG5vdCBpbiB0aGUgc3BlYy4gVGhlIGdvYWwgaXMgdGhlIHdob2xlIHNwZWMgb3IgYXQgbGVh
c3QNCj4gYW55IHBhcnRzIGRlZmluaW5nIHByb3BlcnRpZXMgaXMganVzdCBzY2hlbWFzIGFuZCB0
aGUgc3BlYyBpcw0KPiBnZW5lcmF0ZWQgZnJvbSB0aGUgc2NoZW1hcy4gVGhhdCdzIHRoZSBvbmx5
IHdheSBuZXcgcHJvcGVydGllcyB3aWxsDQo+IGdldCBhZGRlZCB0byB0aGUgc3BlYyAod2l0aCBh
IGZldyBleGNlcHRpb25zKS4gSG93ZXZlciwgbm8gb25lIGlzDQo+IHdvcmtpbmcgb24gZ2VuZXJh
dGluZyB0aGUgc3BlYyBmcm9tIHNjaGVtYXMuDQoNCklmIHRoYXQgaXMgdGhlIGludGVudGlvbiwg
dGhlbiBJTU8gdGhpcyBuZWVkcyB0byBiZSBkb2N1bWVudGVkIGluIHRoZSBzcGVjIGF0IHRoZQ0K
dmVyeSBsZWFzdCBzbyB0aGF0IGFueW9uZSB1c2luZyBkZXZpY2V0cmVlIGtub3dzIHdoYXQgcnVs
ZXMgYXJlIG1hbmRhdG9yeSANCmZvciB0aGF0IHRvb2wvc3lzdGVtIHRvIGNvbXBseSBhbmQgdXNl
IGNvbW1vbiB0b29scyBzdWNoIGFzIHRoZSBEVEMuDQoNCklmIHRoaXMgd2FzIGRvY3VtZW50ZWQg
aW4gdGhlIHNwZWMgSSB3b3VsZCBiZSBjbGFpbWluZyB6ZXBoeXIgaGFzIHRoZSBidWcgZm9yIA0K
bm90IGZvbGxvd2luZyB0aGUgc2NoZW1hcywgYnV0IHdpdGggdGhlIGN1cnJlbnQgc3RhdHVzIHF1
byBpZiBJIGNhbG1lZCBpbiB0aGUgDQp6ZXBoeXIgaXNzdWUgdGhhdCBhbGwgcHJvcGVydGllcyBu
YW1lZDoNCuKAnGNvb2xpbmdfZGV2aWNl4oCdLCDigJxkbWFz4oCdLCDigJxod2xvY2tz4oCdLCDi
gJxpb19jaGFubmVsc+KAnSwg4oCcaW9tbXVz4oCdLA0KIOKAnG1ib3hlc+KAnSwg4oCcbXNpX3Bh
cmVudOKAnSwg4oCcbXV4X2NvbnRyb2xz4oCdLCDigJxwaHlz4oCdLCDigJxwb3dlcl9kb21haW5z
4oCdLCDigJxwd21z4oCdLCANCuKAnHJlc2V0c+KAnSwg4oCcY2xvY2tz4oCdLCAg4oCcc291bmRf
ZGFp4oCdIGFuZCDigJx0aGVybWFsX3NlbnNvcnPigJ0gTVVTVCBiZSBvZiBmb3JtYXQNCiA8cGhh
bmRsZSBjZWxsIOKApj4gYW5kIHRoZSBwaGFuZGxlIG11c3QgaW1wbGVtZW50IDxzcGVjaWZpZXI+
LWNlbGwuIEkgd291bGQgDQpoYXZlIG5vIGp1c3RpZmljYXRpb24gZm9yIG15IGNsYWltLg0KDQpJ
IGhhdmUgbm8gaXNzdWUgd2l0aCB0aGUgcnVsZSBib29rIGJlaW5nIGNsYXJpZmllZCwgYnV0IHRo
ZSBzcGVjIGNhbm5vdCBiZSANCmFtYmlndW91cyBvdGhlcndpc2UgaXQgaXMgbm90IGEgc3BlY2lm
aWNhdGlvbi4NCg0KDQo+Pj4gV2VsbCwgd2UgZG9uJ3QgdXNlIGRpc2NvcmQgYnV0IElSQy4uLiBi
dXQgdGhhdCBnaXRodWIgaXNzdWUgYWxzbyB1c2VzDQo+Pj4gInB3bXMgPSA8MSAmcHdtMCAxIDIw
IFBXTV9QT0xBUklUWV9OT1JNQUw+OyINCj4+PiANCj4+PiBTbyBhZ2FpbiAtIHdoYXQgaXMgIjEi
Pw0KPj4+IA0KPj4+IEkgYW0gYXNraW5nIGJlY2F1c2UgaWYgeW91IHVzZSBpbmNvcnJlY3QgdmFs
dWUgYXMgcGhhbmRsZSB2YWx1ZSwgdGhlbg0KPj4+IERUQyB3YXJuaW5nIGlzIG9idmlvdXNseSBl
eHBlY3RlZCBhbmQgbm90aGluZyB0byBmaXggaGVyZS4NCj4+IA0KPj4gVGhlIHdhcm5pbmcgaXMg
b25seSB2YWxpZCBpZiDigJgx4oCZICBpcyBleHBlY3RlZCB0byBiZSBhIHBoYW5kbGUgd2hpY2gg
aXMgd2hhdCBJIGFtDQo+PiBBcmd1aW5nIHRoZSBzcGVjIGRvZXMgbm90IG1hbmRhdGUgdGhpcy4N
Cj4+IA0KPj4+IFlvdSBhc2tlZCB3aHkgcGhhbmRsZSBoYXMgdG8gYmUgdGhlIGZpcnN0IGVudHJ5
IGluIHBoYW5kbGUtdmFsdWUgdHlwZT8gSQ0KPj4+IHJlc3BvbmRlZCB0aGF0IERUIHNwZWMgbWFr
ZXMgaXQuDQo+PiANCj4+IFdoaWNoIHNlY3Rpb24gaW4gRFRTIDAuNCBzcGVjPw0KPiANCj4gRG9l
c24ndCBtYXR0ZXIuIEhvdyB3b3VsZCB5b3UgZXZlciBwYXJzZSB0aGUgcHJvcGVydGllcyBpZiB0
aGF0J3Mgbm90DQo+IHRoZSBjYXNlLiBZb3UgaGF2ZSB0byBoYXZlIHRoZSBwaGFuZGxlIGZpcnN0
IHRvIGdldCB0aGUgbnVtYmVyIG9mIGFyZw0KPiBjZWxscyB0byBmaW5kIHRoZSBuZXh0IHBoYW5k
bGUuIEkgc3VwcG9zZSB5b3UgY291bGQgZGVmaW5lIHNvbWUgb3RoZXINCj4gY29udmVudGlvbiwg
YnV0IGl0IHdvdWxkIGhhdmUgdG8gYmUgcHJldHR5IG11Y2ggZ2xvYmFsIGxpa2UgdGhpcw0KPiBj
b252ZW50aW9uIGlzLiBBbmQgdGhpcyBjb252ZW50aW9uIGRhdGVzIGJhY2sgdG8gdGhlIEdQSU8g
YmluZGluZw0KPiB3aGljaCBkYXRlcyBiYWNrIHRvIGF0IGxlYXN0IDIwMDUgaWYgbm90IHRoZSAx
OTkwcy4gQW5kIG1vc3Qgb2YgdGhlc2UNCj4gcHJvcGVydGllcyB5b3UgbGlzdCBkYXRlIGJhY2sg
dG8gd2VsbCBiZWZvcmUgWmVwaHlyIGV4aXN0ZWQuDQo+IA0KPiBUaGUgc3BlYywgZHRjIGFuZCB0
aGUgZHRzIGZvcm1hdCB3aWxsIGxldCB5b3UgZG8gc29tZXRoaW5nIGxpa2UgdGhpczoNCj4gDQo+
IGZvbyA9IDwweDEyMzQ1Njc4PiwgImJhciIsIC9iaXRzLyAxNiA8MHhhYmNkPjsNCj4gDQo+IFlv
dSB3b3VsZCBoYXZlIHRvIGJlIG91dCBvZiB5b3VyIG1pbmQgdG8gZG8gc29tZXRoaW5nIGxpa2Ug
dGhhdCB3aGVuDQo+IHRoZSBmb3JtYXQgaGFzIHplcm8gdHlwZSBpbmZvcm1hdGlvbi4NCg0KQnkg
YWxsb3dpbmcgaXQgSU1PIHdpdGggdGhlIHB1YmxpYyBpbmZvcm1hdGlvbiBvbiBkZXZpY2V0cmVl
LCB0aGUgRFRTIHNwZWMgDQppcyBvZmZsb2FkaW5nIHRoZSByZXNwb25zaWJpbGl0eSBvZiB0aGlz
IHByb3BlcnR5IHRvIHRoZSBiaW5kaW5ncyBzeXN0ZW0uDQpTZWN0aW9uIDQuMS4xIG1ha2VzIHRo
aXMgc3BsaXQgaW4gcmVzcG9uc2liaWxpdHkgdmVyeSBjbGVhciBJTU8uIFRoaXMgaXMgd2h5DQpJ
IGFtIGV4cHJlc3NpbmcgdGhhdCB0aGlzIGlzIGEgYnVnIGluIHRoZSBEVEMgYXMgd2l0aG91dCB0
aGlzIGRpc2N1c3Npb24gd2l0aCANCkFsbCBvZiB5b3UgSSBjYW5ub3QgZGV0ZXJtaW5lIHdpdGgg
Y2VydGFpbnR5IGlmIHRoZSBEVEMgaXMgb3ZlcnN0ZXBwaW5nIGl04oCZcw0KcmVzcG9uc2liaWxp
dGllcyBvciBpZiB6ZXBoeXIgZGlkIG5vdCBmb2xsb3cgdGhlIHJ1bGVzIGZvciB0aGVzZSBwcm9w
ZXJ0eSBuYW1lcy4NCg0KPiBFdmVyeSB3YXJuaW5nIGluIGR0YyBjYW4gYmUgZGlzYWJsZWQuIFNv
IGlmIHRoZXkgYXJlIGEgcHJvYmxlbSwgdHVybiB0aGVtIG9mZi4NCg0KVGhhdCBjYW4gYmUgYSB0
ZW1wb3Jhcnkgd29ya2Fyb3VuZCBpZiBhY2NlcHRlZCB1cHN0cmVhbSBpbiB6ZXBoeXIsIA0KaG93
ZXZlciBJIGFsc28gc2VlIGhhcmRlbmluZyB0aGUgc3BlY2lmaWNhdGlvbiBhcyBtb3JlIGZ1dHVy
ZSBwcm9vZi4NCg0KDQo=
