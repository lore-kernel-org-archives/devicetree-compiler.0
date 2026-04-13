Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011032.outbound.protection.outlook.com [52.103.33.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D41548C;
	Mon, 13 Apr 2026 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064257; cv=fail; b=cGLNDODxno1+0XIpGZ6oPBF1sOLZ7uqEylAgZsNnvH0CA9xy4SYNZTLGmmKCeJtx7C9p1dfiIsl7PdQq3c8lOrgVU0zOvywmnwfUdMpvgAlEKP/Kn/7V+pJtpqzUVy1Lj5A27re0+Fg28ULS6wBX3OvHWIuLROUlv4z23GH7TkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064257; c=relaxed/simple;
	bh=MhZ7jJDzac/uzh3IUwyKodx7swCo7oj+8xTIqhRM31s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b0v9lJrVFOoEt8QXwNtvU3jz2MH73QLZ+T02b2382GbXfr/oBkXclNOJq2E+t6KB9DPXaJzVCVqVVXrOI5rEdZLafKg7LrazO+3KApMw1VNoh1NjuaRgSnwSgZii3fQfvIz/zCQCqS880V8zxvyPTVfGGPLH2xqRXFCqLaQbop0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=OvmcWcub; arc=fail smtp.client-ip=52.103.33.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="OvmcWcub"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUtC1mCqDxwlip2og5e33kGxh6YgWZYHx2UV3ESUxlX4s8JP2qo760TG61Wt6/HTkJOy3UB1GfTMJ3Jl7tFn+9OZhdyLWYP1h0bgBaLPwCUL+jDjOO0jkrbvshyj+ICFrmVHz9oqT2y+81UW31xW2OY9NPKXmX8Eta04Xjqy1sMdo92AwBDKCfnte6bxgpWQW82v5+YNK2uEHr6XwBA3+oH1+Rqn8hLzGVyhm6D+RGDOoH8dUcaEM7wKy3xrGkpMXVhhQV2+C0T9bYV9SkPZ+2XyMLdlN5nxjI2El/uXsoXFjOdJLtmehcYO3IAbivz8Bt1g6QQ50rEjnD5N7KCxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhZ7jJDzac/uzh3IUwyKodx7swCo7oj+8xTIqhRM31s=;
 b=mQRye3xjEKo9vzrConxpgPsqn1aA3RwpvX+yhvzdEt+DcMORkIlXpQw76g13ahBxCjS7eMwYZNHeNpdki0OAGvz6nJgmiBFwx902o+kMJYqXpcQZB7tFpWjRGAANLxApjwMKK20EmCNsj2ou8e/wTJhG0QtHStiqMwYxNeMEKAbsKClDlYc+f2Wwym4D8AmavLRXfArAV3rXs7HZJCtiv2W9qWXnHe1rWgQF5AP/0auf5B23K0C3GPbeWiZEdy4Y4sOfhnVQL5jtS62a6XcdRaduk1/9DxWbNb8oWX5JAT1IV6fk7EZ1lAU94YJ4qqHvySm/c7T8yD42A/g/4TNrAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhZ7jJDzac/uzh3IUwyKodx7swCo7oj+8xTIqhRM31s=;
 b=OvmcWcubmAidt2/wkzIXaZD8wLxwV3WFYe33ziidvuJQkEXvldR2BqTkRe2RPqqQBkRyLGLmdgows/ZPrpMh9oNyXZcWrqHUHDQPPmQi+GScBCckp6D+ZizeZKAMCFiRBVahaYwVFsDwqrDpv8KVDW60HI5cz/minJtEBUUmvY4rZ219Bl3HryxuubPGyMl0GHcGl/MKiXqJHALLxXEBZC7nUNE7zUv7JALbkHlGQANQvW06pUeg93WcNzbu87mFvBMdZo39Uvr6TtNLHgSAvLGK3UTyFKVvL1I1on+orJ4pDTrk5KeyNWBDJUgclLwRr+r49ZK0+ZjU39ch5YG5BA==
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:285::14)
 by FRWP190MB2380.EURP190.PROD.OUTLOOK.COM (2603:10a6:d10:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 07:10:53 +0000
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac]) by GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 07:10:53 +0000
From: Kyle Bonnici <kylebonnici@hotmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Herve Codina <herve.codina@bootlin.com>,
	"devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: Phandles
Thread-Topic: Phandles
Thread-Index:
 AQHcyeGzLXiU0rQJNEOrDVQKAULcerXbYncAgAAQq4CAAB5ZAIAAEA+AgADqzQCAAAkrgA==
Date: Mon, 13 Apr 2026 07:10:53 +0000
Message-ID: <7F2DF84C-A010-4BCB-B973-D17BF58EDCF2@hotmail.com>
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
 <20260412145144.4737fde6@bootlin.com>
 <D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
 <20260412173916.7a971a45@bootlin.com>
 <163D807F-0F83-4282-B182-7A18B124D3E6@hotmail.com>
 <00f0d18e-feba-45cd-af92-f737c9b965ef@kernel.org>
In-Reply-To: <00f0d18e-feba-45cd-af92-f737c9b965ef@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXP190MB2509:EE_|FRWP190MB2380:EE_
x-ms-office365-filtering-correlation-id: f4183d30-d5d8-46b8-34f8-08de992bccdd
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|461199028|31061999003|8062599012|8060799015|15080799012|51005399006|37011999003|25031999004|10035399007|440099028|3412199025|26121999003|102099032|40105399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?UTl3cFppVnBHMkJCRDhuNlZ0NFBvMHhrRHdoNFFPU3pKSEdGY0F6OUFSSHU3?=
 =?utf-8?B?aTVGN2pZZG1NbDVjUW5OSFZOSE1UWHRHKzRNZWRJcS9UMEl1ZTc4WmdxSXNO?=
 =?utf-8?B?N3dzZDQxdXErZm1XWWVUUFFPSi9tZGFrRHRqbFVmQ0k1SWU5TUxBMng4azN6?=
 =?utf-8?B?cDlGY1dYaGlUMVFvN0YvMjF2Q2hGeEM5SHVoNnFtU2dJZ2lhcEtaNE9XKzcv?=
 =?utf-8?B?WktwYmZPS3U3Z2Fncm1VQ1dtbzFaeVh5QXltRXk1R3BVQnY0K0h4SjVPZEQy?=
 =?utf-8?B?TU1PWVMvQ2FUQW1SQ1pLQzE3a25EYWJlVGFiRmRWd2kzT3R3cDg3VWJXOFJs?=
 =?utf-8?B?MmQ4dlZpM25MNEp0ZC9zZzBmS05Nc1R1V3h2ZEhSc2FhMHlSSzhYNHVJVCtJ?=
 =?utf-8?B?ZksxVEVPQkJvUXdYcVlGQjJwNUxlQVRpeHErMVZoZlQxODJlemhLUkROcHp1?=
 =?utf-8?B?aWVQb1hETmtKazNDeSswVmw2QlBydFFHeUlESi94azJuYmZHZmJ4Q1MxN3B0?=
 =?utf-8?B?YWEzUFE3RzVteExrTnQrb1ZMTHdhOUZkQlVsalZrVE50MVdVeFIwSmZCZlp5?=
 =?utf-8?B?SFF5VTVhVE5Mb3g5MWVCWXZqYUlkcHY3Vk9YVmhjN29EY0Y3WXJsVjBCc3Jy?=
 =?utf-8?B?Z1J6eXArUHJ5c3NQZURyMko5L090RlBydW1tdWtBMEQvblY1RnRVc3I2QUd2?=
 =?utf-8?B?STExS3FmMTFMdFYvVUljSWs5SjdzOXJVMlBJMlBCenpGY0xOancvMkZYWDE0?=
 =?utf-8?B?S1R6SlRMd1EzdXZILyttZ0p1cWdORTcyaGg1eWRtL0EzNGJzeHMxYUlQYmFk?=
 =?utf-8?B?bEg4TVJSdE5kQnZIRWszd2pTaUJmOGNwOS9IcFlrWFhaVVkyMDkxS1RWNTUz?=
 =?utf-8?B?WWtESVlydjBxWjFkNk9FNDFEbTJpa1FEdTA1L09vbEhoWHNxRVZ6Y3lCZ2RC?=
 =?utf-8?B?T2I0MStldUx1S2hNbm1VKzg0eTd0bWdpOUR6TTJHa0JSTU1yMEhsak1NN0hv?=
 =?utf-8?B?ckhVenhrSWgxYXpNK3cwcnBmbmdubll6NXNaVmRWRjI3TDVBenV5MEZOeS85?=
 =?utf-8?B?SzFCRjMxYWlPWnFPZEw0RUFWWW5NTzlSNWV3YzU3Z0tvWWJSSVp1cDNqNlQ5?=
 =?utf-8?B?cXVELy9aWUVrVVAxODFsS0FtbWEyb0tJM2QyME04VGR0ajZ1Tnp0WGw1ZDdm?=
 =?utf-8?B?b3hCdEJ2QjNGbVNsWkdLNDhmLy81WEw4M3NabC8vTTVWbGZlUGhXczdzOURB?=
 =?utf-8?B?dmZTai84c1JzWFI4SSs3WFdaakYyS1Bwb2FaTE85SFZaMXBBWE8rT3g2QlYz?=
 =?utf-8?B?dkJwZWp6dkVDeEcxejFnWVBWcWx6OVpuQ2tINlY5SkJ4S1FuT2YxN0k4U05L?=
 =?utf-8?B?aXNSQTNnaE5iUVFnQVRuSXlqSUZpY0E2R1k0QlJDajhBNnJFNFdTVmkvNGMz?=
 =?utf-8?B?bWI1eHIrSGVzbmhmRUhjOFBEM2JmZkUvY1BFcExBPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXJZdzkrNUorUmRzNE5xZ0NEc0RaYnY2bGszbzlXQjMzYVhqK1dLZDdScHVW?=
 =?utf-8?B?eHFQUjJmK0p2RC84eEl6MVRURTlMYzFsZSszM1dMSU8xcE53QVJzbUpNZndw?=
 =?utf-8?B?MHpzcHBubWFDVEZRNm12NGE0dU9hUXNDQmFleU5BU3RXNlV1U3k2VjFhbXB2?=
 =?utf-8?B?dFZtTkVTekRCS3V6UmJmaURmZEhyWFhJSzNwWHo2eWFPYUtUMWlYRzcyYWtV?=
 =?utf-8?B?cnVqMEZkNmgxM1VtblUvV2Frc1NIc3pVbXl4NWR3VkhFWkM5WFB3UmFaOS9h?=
 =?utf-8?B?bDI1WG9WV3YxZUUzakovT21PRExqVWZzOHp3ZU1RU3gvamRZdnBocGVQWEFn?=
 =?utf-8?B?eWNKSXIxUVAzbC9EeHNtZ21GK0VnbTlRTytrUVQ4dWpGYjZYMlIyc042VUFP?=
 =?utf-8?B?WlpudGdGeklTOTllbU1tUFJucGU0S3NuRnlFRjdKVWtsbGFSU1l0ejdhY2xM?=
 =?utf-8?B?NC9UdWovWmF4ZjZkU2kvVldCeXg3MzgzQ1pFQjVSdDgxNTNycDE4U2tiQUY0?=
 =?utf-8?B?aUVQVkdpUEJLMjhyYjkxWFVxeU9sZkxEdXg1bUVnMUlTWklZL0VpVy9hVWUy?=
 =?utf-8?B?bUNzR2lmTGV2RTY2TERvc2Z0NEx4YlZZSEw4N3lQUlZkQTBoRnhpTitRZkF4?=
 =?utf-8?B?OWZ4WmI5bDVyV1NaSTRqRlNIMlFDZ3MyY01lWk9SdTFSRjVDcHhUL2RVbktQ?=
 =?utf-8?B?RVFvc0N5elpMUE91cngrd09ZUWdjU2VWMlhzaHMvMEp5UFVjQ21OMjlWQlRU?=
 =?utf-8?B?SlJVUHUzeU1Ic1FYaTFzWXdsdWdFWE44d0tuYi9VRHo2SURGdzJvSVNVazR5?=
 =?utf-8?B?Unl2UWxjNTlTR05Jems2TXlkd3FoN08wcnJ1QVBOa0g2aEJDSnUwTGw4Uzg4?=
 =?utf-8?B?blMvbEt5Z0cxem9XeXRjTWM5aEl2anE5ZmU2aHJyN0tBdW5maDBKSEN4cXVz?=
 =?utf-8?B?TG1jTzZpSlhVQ1VwSTU0bG5tN1dkZ2FlRFZLa3oxY05iUVJQT1Nua0svanVG?=
 =?utf-8?B?U2RXVGtmZkhoUXoxQVI4T1YxTTQyeUtzSStEWkU4MEQ5dWE5KzgyNDdEYmpp?=
 =?utf-8?B?aGRpTk9xSmk2VnJHZDFKb0ZvS0x4MU9wRk5zT05JNGZHdGxrdkQycDJNRDgz?=
 =?utf-8?B?RVBlY2NsRUtXNXlibjFQK0E5TUV4aFhpSjBEcFNjeTNTdjRKVkRaUFZMQ1Qw?=
 =?utf-8?B?c21xbWpwVk0rcXpoR3d5NHVQSkdzZUVXTkJDU0NJQmhTM1JTbDdzZC9pQ2FI?=
 =?utf-8?B?S3BwY2NlbjJUZTNHQVdRa3RxTDVrNXRLdDR6Q3dzTHh1VTRENDVydW01VkFw?=
 =?utf-8?B?bFZkMXpGNmxlYlVpa3BnU1hFZWYxRVV4a1lkdXdmdGQzSG04WHBscWZMMDg4?=
 =?utf-8?B?Z2pWRHpXWnQ1SUxjYmwwNW5sUFk1alVaQmh4YUk5UkZmUGVHdVNpeDFlSzNJ?=
 =?utf-8?B?NHRsVUh5eFR2Nlk1MTcwWUhUbjZRUXRaRk5kdTRoNGRtSzBVZ2xDaWFUSUMv?=
 =?utf-8?B?eGdISVZzanVLN0g4TnI3STdocGNyWml6b09MRkF6MElqWTFRWVBmNkJQYjZU?=
 =?utf-8?B?MW9WT3Y1ZEtkN01lTm40NytmLy8zNGNLa3N0QjRadW5VOHVQZXdtN1E4TEhH?=
 =?utf-8?B?VlVVUEJUbFBuaTJRdnpYQURzM0RrSnJRdmxPVTFPSzdmdzNBL1d6azM3Mkxv?=
 =?utf-8?B?SDJqSEFpOFNVeGZBRFRqRE9kM0VpMHNwQit4QUtPZ1AyUlgwTkNOTjBYUFZ0?=
 =?utf-8?B?OWtGdjl5cnRLb0JIekFzeUlHYi9McWZQYms2aUNUL2RJNTRUNms4eEFDblA1?=
 =?utf-8?B?cXkvcU13SFVMcGt1SXBzdHlmTEI4Yit0eE1NK2pHalNiaUh1ZkxEb3psVFpM?=
 =?utf-8?B?ZTV6a2RhQzlLT0d6QVhRNGxoTnE3NlF1TGMwb1RUbi95QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5FF7E2AD90BBF4AB46DF4023F9DA944@EURP190.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f4183d30-d5d8-46b8-34f8-08de992bccdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 07:10:53.1647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP190MB2380

DQoNCj4gT24gMTMgQXByIDIwMjYsIGF0IDA4OjM3LCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gMTIvMDQvMjAyNiAxODozNywgS3lsZSBCb25u
aWNpIHdyb3RlOg0KPj4+Pj4gQ2FzZSAxOg0KPj4+Pj4gLyB7DQo+Pj4+PiAgICBub2RlMSB7DQo+
Pj4+PiAgICAgICAgIHB3bXMgPSA8MSAmcHdtMCAxIDIwIFBXTV9QT0xBUklUWV9OT1JNQUw+Ow0K
Pj4+Pj4gDQo+Pj4+PiAgICAgICAgIEhlcmUgdGhlIGZpcnN0IGNlbGwgJzEnIGlzIG5vdCBhIHBo
YW5kbGUuICANCj4+Pj4gDQo+Pj4+IEhlcmUgdGhlIGNvbXBpbGVyIGlzIG1ha2luZyBhbiBhc3N1
bXB0aW9uIGhlcmUgdGhhdCBhbGwgYHB3bXNgIHByb3BlcnRpZXMgbXVzdCBiZSBzcGVjaWZpZXIg
cHJvcGVydGllcyBhbmQgYWxsIHVzZSBgcHdtYCBzcGVjaWZpZXIuDQo+Pj4gDQo+Pj4gSSB0aGlu
ayB0aGUgcHVycG9zZSBvZiAnc2VsZWN0OiB0cnVlJyBpcyB0byBoYXZlIHRoZSBiaW5kaW5nIGFs
d2F5cyBhcHBsaWVkOg0KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1z
Y2hlbWEvYmxvYi9tYWluL2R0c2NoZW1hL3NjaGVtYXMvcHdtL3B3bS1jb25zdW1lci55YW1sI0wx
NQ0KPj4+IA0KPj4gDQo+PiANCj4+IEnigJltIGhhdmluZyB0cm91YmxlIGZpbmRpbmcgd2hlcmUg
dGhlIERldmljZXRyZWUgU3BlY2lmaWNhdGlvbiAodjAuNCkgbWFuZGF0ZXMgdGhhdCBhbGwgYmlu
ZGluZyBzeXN0ZW1zIG11c3QgZXh0ZW5kIGR0LXNjaGVtYS4gDQo+PiBTaW5jZSB0aGlzIHJlcXVp
cmVtZW50IGlzbid0IGV4cGxpY2l0bHkgaW4gdGhlIHNwZWMsIGl0IGZvbGxvd3MgdGhhdCB0aGUg
V0FSTklOR19QUk9QRVJUWV9QSEFORExFX0NFTExTIHZhbGlkYXRpb24gYmVsb25ncyBpbiBkdC12
YWxpZGF0ZSByYXRoZXIgdGhhbiB3aXRoaW4gZHRjIGl0c2VsZi4NCj4gDQo+IA0KPiBTbyB5b3Ug
d2FudCB0byBoYXZlIGEgcHJvcGVydHkgd2l0aCB2YWx1ZXMgbm90IGJlaW5nIHBoYW5kbGU/IFRo
ZSBzcGVjDQo+IGRlZmluZXMgdGhhdCBwcm9wZXJ0aWVzIGxpa2UgInB3bSIgbXVzdCBjb250YWlu
ICJ2YWx1ZSBvZiBwcm9wZXJ0aWVzDQo+IHdpdGggYSBwaGFuZGxlIHZhbHVlIHR5cGUiLiBUaGVy
ZWZvcmUgd2hhdCBkb2VzICcxJyByZXByZXNlbnRzIGluIHlvdXINCj4gZXhhbXBsZT8NCg0KSSBh
bSBqdXN0IGJ1aWxkaW5nIGFuZCBtYWludGFpbmluZyBhbiBMU1AgdG8gYXNzaXN0cyBaZXBoeXIg
YW5kIExpbnV4IGRldmVsb3BlcnMgYWxpa2UgYW5kIHdoYXQgaXMgdGVjaG5pY2FsbHkNCmFsbG93
ZWQgaW4gWmVwaHlyIGlzIG5vdCBhbGxvd2VkIGluIExpbnV4LiBUaGUgaXNzdWUgaGVyZSBpcyB0
aGF0IERUQyBpcyB3YXJuaW5nIHplcGh5ciB1c2VycyBhYm91dCBpdC4gDQpJIGFsc28gZmluZCBt
eSBzZWxmIGluIHRoZSB3cm9uZyB0byBlbmZvcmNlIHRoZXNlIHR5cGVzIGZvciBaZXBoeXIgZHRz
IHVzYWdlIGdpdmVuIGFsbCBkb2N1bWVudGF0aW9uIEkgaGF2ZSBzZWVuIA0Kc28gZmFyLiANCg0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
