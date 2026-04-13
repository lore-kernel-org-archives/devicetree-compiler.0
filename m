Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013015.outbound.protection.outlook.com [52.103.33.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24400393DEB;
	Mon, 13 Apr 2026 20:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776111905; cv=fail; b=STbDyabZhfn0lmfhjB1zKhFYL8WuiHB6Tit2e3Zf0kSXkQzsC4W/hABLOd3+dTzEczzjXWUgUUdTKGqNn8vkMKeZn+6W89mJ0NrOGMH1wQ4Oy7PYUViBNTpa986b03FWbbl4tG8i+c6375vTzTnZrCVu78yQ1ufBtigbv+6QMkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776111905; c=relaxed/simple;
	bh=LCi5cjoOvTi1ZiehYTWGuAZkmFl41JSDnB+T4I5CTSk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tI2HXRxMLfuktHfv2cL8qM79QkLLhdisU5zFLxgPSjgHsB7mfkBi2MfH+P6zmqAvHRn6US8/ddQoNOBO6DpO+6B/p8PE0hNsoIrcjADJmrypPYlw18Eg7+NtojzkLR5JLKuAtL+Com0ZeoB2CWRWlUofccf841oaMohHMx1MVjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=aBDJJ8JS; arc=fail smtp.client-ip=52.103.33.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="aBDJJ8JS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDp2cV0pvckVIkc5ujFL2uc/e64Pn67YmW/iUVcN3DQsZKW1d+AiYtDyTHKGwyo6xdS/Wk5RmTYkM09+A7BdLDviyqfKgmGQFLZMOO3yUIXjEacb3Fa8IcGgJaaUhg3RaS1EIE+/wZ80Xy39/kTH67NmF9HJdRMTpqGfSbLMmCCX0McZC8HTNGQ2peNMPlk7EBmjp+237HDdzJpXCNADZk9d75kQ+zmhPZ1mJpdlGVQe0uxM5o65lLuAjCYNs5J08kHuXqFESDi3ie+S38HtMPSSXNg7Z6ha3Tg4gnOxXINioc1oCl2DjzzRUJs+j2fGePt/Uf2tF86m4aLw0hdANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCi5cjoOvTi1ZiehYTWGuAZkmFl41JSDnB+T4I5CTSk=;
 b=BwNUPhv1dYjX2t2OfL+ayjQeOcAY/V57o3alL9SLYa8/woC7MmrXqoVhXlZvQMqtY3fuyxaJSkKfuRt7KClgH3rq1ETUs0sw+rw9fJSSnBVbs202X/r7+rE7f2WqtRuOPNWD5CRumTmeJWwWk7H6O7IbaXQIBvwe+9SBRNBykJHVfufqAMU9H/IaR7cCNM77euDKGu/wqngXX1uODsBSIn9t0Mvs2FSGICOqYkTTdhtDAfQ8o/D4mvKwuJU582rH1d7LYAsYJjRwZWa1Px+YHXQTgDOYHAy3aILvdoW4g9z5dzV25PKdld+JE0OByWM/S7PdFwlXyMcUtdGyeAVolA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCi5cjoOvTi1ZiehYTWGuAZkmFl41JSDnB+T4I5CTSk=;
 b=aBDJJ8JSJ+963zpZV8WtMJUP88iJwHKUqVU/o27gopMpC3YTdLEU0A4J/ie8jUHQIZwRYTiCnLZCVnWOvO9TO31sEvixrYRlFTSqhbtZ9U7H9buO6z2YMUryW1nNKnFuGz+8FpO/llKRHrwhndtVRNfT2N164iBYY4wHntD/ceJDuMAImtin+e+JDZSCMQvhrY211zUAcvm6iQVOXhCFCaD23M1ak0GBNIxUcTGgpH808Hym5l3Fl2LJzH+MDvJLJSqDQuFmILYCACt42XCseoXpTGJsknpT+ToW3IZCR4+KkE5K33JoIRxokL8eNF4suel0L4mIBjSEkvZam8n79w==
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:285::14)
 by AM9P190MB1090.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:26e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 20:25:02 +0000
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac]) by GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 20:25:01 +0000
From: Kyle Bonnici <kylebonnici@hotmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Herve Codina <herve.codina@bootlin.com>,
	"devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: Phandles
Thread-Topic: Phandles
Thread-Index: AQHcyeGzLXiU0rQJNEOrDVQKAULceg==
Date: Mon, 13 Apr 2026 20:25:01 +0000
Message-ID: <BD9B9616-F15E-4A3B-84C8-C4AC985FCA27@hotmail.com>
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
 <c0b93231-9337-42f9-83c3-e657e5f017ec@kernel.org>
In-Reply-To: <c0b93231-9337-42f9-83c3-e657e5f017ec@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXP190MB2509:EE_|AM9P190MB1090:EE_
x-ms-office365-filtering-correlation-id: 203acefa-f368-4def-76d0-08de999abda5
x-microsoft-antispam:
 BCL:0;ARA:14566002|37011999003|51005399006|461199028|8060799015|8062599012|19110799012|25031999004|31061999003|12121999013|15080799012|3412199025|440099028|26121999003|102099032|40105399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?T2FWTmVxSkNOclI2UkVaYXZ3NEdmTm0weXpGVEpLMmtNeE9RaVNaSEQ3TU05?=
 =?utf-8?B?RUxIM3kvMXBrWkdPWE9ob21PaHNLNGtSSk4wZ3JSYjBwT0pPQVhWQ2RMZDl6?=
 =?utf-8?B?NmhQVHo3eUIwYkx5UmZ0MHNaWnR3V2R0WFBtYis0VVg0WVJKbnBEY3JwTnN3?=
 =?utf-8?B?eUJ6NDNQUWlKSVhsZVFhZHFQWjJnZFpTWEk0V2pDQWI4VlJQYlByVzMwa3Vl?=
 =?utf-8?B?aHZvbGtFU01lYUs2OVRCNVJJaS9OL1crVm15UTk5U2pDVnVnMUNud2RTNHpz?=
 =?utf-8?B?UEpGN3MyVUd6RlhBSmNmNWJ5NmJZUjg1VXVGekM5aXZpNk1SdkVHWnlkWkl6?=
 =?utf-8?B?aVNNcHFCNlRaVGZjRC9WYXhsRlE2alZuVmZvM3REcjNqWWY2ZE1XWTEwQzBJ?=
 =?utf-8?B?WE1FQ1RRU0d3R0ZLcVF2V2VoMnJMdi9iYnFCeVQrKzRscHgrb0Y0a2ZOczBh?=
 =?utf-8?B?djZOOFU4RVo0bXpwMkdDK2N4dHVzT09hcVMycGx2MkhLc3pRemovWFV2R0s4?=
 =?utf-8?B?SnptQVp4TGVFNHdxVldORWt2R0h0R1FDK2FlNlg1RitvaEQ3U3NVaGpFSWtN?=
 =?utf-8?B?NU4zYXZNWmJRRkFqZHl5Z3EzOW5YNU5ZSUlHOXA1d1diU0haOFhOY0RmazdS?=
 =?utf-8?B?clpWTkUvVXBYRWNZM1VVcXNFREQ2WEQ3dmxqNVVMSy9lRjUwRHpCKzNYME1N?=
 =?utf-8?B?QVBmaGtHUmhxMTAwZ01pT3B0MDJXUWdZRlkyUndnZEtJbXZQZTc0MlJpT01W?=
 =?utf-8?B?OThIbjVYWGJMZm5MVTg4Ly9ydTdURi9td1ZXS25tRXZtL3paZWlndHRLR0xi?=
 =?utf-8?B?YlVwWHZDbGwrK0dRWWJiRmIyNG1icWJ1enFwVmtHT3VocHJZeU5kU3UyNUtw?=
 =?utf-8?B?RTVCdC9TdTNROGFKN0wzWUZIY0JWTWFiU05INWNELzJCSkRRZWhpenJDd3Iy?=
 =?utf-8?B?UE50SldwYmdhZXBVRWQwTUtTMkVTWVZWNUlsTGQ2M1BPTitiaDh4WGJMNFJi?=
 =?utf-8?B?Vkt4VTg3NWUyZjVLU0VWNTlhbHpldlF0dmgzanJrR2ZUeHltb1JQeW52MTM3?=
 =?utf-8?B?Yk1FTmx0SGwvNUZwejJya1ZGNmUwZnd0c01WUXdDS1lIOVl5bVRKM2srVzdy?=
 =?utf-8?B?ZEY0UDMxTW1ISHlDNG5JVDNGQklHZTVCNzdJWGdPOFdCbEkwdjQ0Snoyck82?=
 =?utf-8?B?TVpaMGlPUlRWSGFBaHBnU0N4aFg3REdrRUxxcXBqUDBKYkVUei8ybm9DRWpL?=
 =?utf-8?B?cXVKalVPL0ZnMEx4clBuYVRzSzhUTmlDMnRRbkEvWXZleUw0cU44S2NOb2ow?=
 =?utf-8?B?aTVoSHBNOE5VcW1aU2Z3a3VYeUZhdER1ZlRycDIxeCtzT0QvZGN1QXZPR1do?=
 =?utf-8?B?d1g1TnNGcjVyOEE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWVLSzRaMHRXakVkbkkzWTlVbnYrcGFhL2tvMmFuOTdSRmc2RlhtVUl0elk5?=
 =?utf-8?B?R21TSDJKZENWdS9QOUV4eDFnbDZLa0UxeklCc0lGNUx4VCthZFlsQklhQmU1?=
 =?utf-8?B?L3hkNjVEaGRYalZTTCttM3lYQ1Z3NEVlQlNOTm1LK1hpTnBWd29zTnJaOTRF?=
 =?utf-8?B?TlRZQnAxZTBtZ0FFaUlpT1RCR21nWHkxT0tDLzdNSkNOUERXNGg1WUpzTEpy?=
 =?utf-8?B?dkNMaTRqQWxXNVhxdDFhQXhtTEJqSzlEVVNIeFFPVEMyajdFYVBIZmd5QXFS?=
 =?utf-8?B?dk1MRHlrQUoyU1Vhd1VuNkpXVjM5Sy81VzR0aWJKOWtEbk1wTkxqdjNkcExl?=
 =?utf-8?B?TjVWeXpGRWxxQkJLV0ZWbFBVUmthRmNiakFJb25reXQrcUZMTG9SNHBTZmhl?=
 =?utf-8?B?UTgxbzJ1UTFCYkJ4dHBGUk9nMW15YnA3UWR3aU5mWk00Zk5QNmh4UksxWTdD?=
 =?utf-8?B?bE1TeG1Tbjh3aVFVa1ZHcnNwbGFyMDlyY1M1WjR4OU83Rm0ySXZrWUg2Z3Vv?=
 =?utf-8?B?SWdJY3lSR1gxZU5hY2FmbkRhZ3J5Vkp3QzUrRWF3NlRKTmlST2ZsVXpPbGN1?=
 =?utf-8?B?R1NLQW15d2N3TmcrNnJTNXRzbGQycnpCSzNsaVY1c2huV1R4dVFsaUNucHd3?=
 =?utf-8?B?RHg0bER3WnJGb3F3Vk1yN1ZoVHdyYnQxV0laODBQS29UTGZKREZ4VUVibklK?=
 =?utf-8?B?WmFuU29BeTFMQkZJWXhzZHJPRVRVR21EWUo5dU0xUlRRSFV3bUJjZDA1VTlv?=
 =?utf-8?B?WVNzWlhyR29wSTJ1bnpaK08zbVhnb1o4aks4ZlpFU3VjelordFg0Zmw3TStr?=
 =?utf-8?B?UUdLMFVvUkNKSWJrTER4cENkbHJBVW5CUEVYQ1dQbVlVWk5rcGR5dFdlMzZC?=
 =?utf-8?B?bFhWd2I0OXdUNGVOT2FrTmROS1hVU3NTcGdvMlVPWkZxK0xDYitlTXRKaHZH?=
 =?utf-8?B?VlQ3V3MvdWowNTQ3Nkw5TnFYdGdFMHZLaUJWZHBrTDA2dkIzVzRyWkZ6UW1K?=
 =?utf-8?B?SkFvWkdMR0xKSmgzYzk0YUxWQmdyVHQrTXVCdzJRa2M1d0tJS3h6amxDbmtq?=
 =?utf-8?B?SllabG94QW1pN21WcnVXa080STlHZ1JnVUQ2VHh5OFpuQXdXMWgzYlhoaGtJ?=
 =?utf-8?B?ZFdzekZTeWNYL2MvbzBDUjdwOUZYc1NRVDhCVHNaQTJZVzFaNy90ZWFQd25D?=
 =?utf-8?B?c0VOakNZUDNHa1JxUDlNNVhpV0N1YW5zM2JsMXdibTlwdGpGdmRxcmZPMnFT?=
 =?utf-8?B?SHdwTjlia0JDZFZjRkhFOUR0U2Q3d1QyckpwODB2Z0dqMG45VEFWMEVyNlRn?=
 =?utf-8?B?SzZDbHZoL3VqWThOMjdOZTV3UWxnc2daWXBqOGtxWDIxRVRvenNEbjJZMnVF?=
 =?utf-8?B?SzFaU1NvV0VrTDVzMUkram1FTlBiY0hHZ2JaOFVjL2F6bVVydUNMSWdTREpZ?=
 =?utf-8?B?blgxZHFvcFRRdTgyU2Z1ekRaZ1R1RXljd0xXak1zWHM1QXhTKzhaV20wSmd3?=
 =?utf-8?B?bmZnazB6NGpHRWVyVHJGS1NzMlVtMDVrVjNuRHpzaGwwWEc2a3VVclBZSVBU?=
 =?utf-8?B?cW9WSi8rZUxsTG94c3FLTmtheWdGUFp0bmIwL0I4SzdpWHVYZlF5aVBKUURC?=
 =?utf-8?B?R0N3a0QxSk1rU0Q1RXh5K3hXWERXWVFROTlSdElIYitLdEhKczVGR1JhenFL?=
 =?utf-8?B?di9HQWJQcm1pSnM1d25qMzlJZlBvbDA5andraGtUVEJMdmVaRHlvYk8rYytO?=
 =?utf-8?B?cnpiYzBhd29SUlIzWFBoMXdMQk5keCs1NFVjRXY1YWcyR3VQNE9ZTlNLMHdM?=
 =?utf-8?B?akRJT2JmZkYwSmhGVVJBL2JlNUFtUkJvSm5ySnkyOUJBYXNDdFB6aWZVU2VJ?=
 =?utf-8?B?NDJ5UUpYU1RwNkNjY0ttUGVra2tvblFjZHI3dUg2cGpObmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EA839674404FB4386F079D7101DF96E@EURP190.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 203acefa-f368-4def-76d0-08de999abda5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 20:25:01.8924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P190MB1090

DQo+IFRoZSAiJmZvbyIgdXNlZCBpbiB0aGUgcHJvcGVydHkgZGVmaW5lcyB0aGF0IGl0IGlzIHBo
YW5kbGUsIG5vPw0KDQp5ZXMgJmZvbyBpcyBhIHBoYW5kbGUgYW5kIG11c3QgcmVzb2x2ZSB0byBz
b21lIG5vZGUuDQoNCj4gDQo+PiANCj4+PiBZb3UgYXNrZWQgd2h5IHBoYW5kbGUgaGFzIHRvIGJl
IHRoZSBmaXJzdCBlbnRyeSBpbiBwaGFuZGxlLXZhbHVlIHR5cGU/IEkNCj4+PiByZXNwb25kZWQg
dGhhdCBEVCBzcGVjIG1ha2VzIGl0Lg0KPj4gDQo+PiBXaGljaCBzZWN0aW9uIGluIERUUyAwLjQg
c3BlYz8NCj4gDQo+IDIuMi40LjIuIFByb3BlcnR5IFZhbHVlcw0KPiAiVGhhdCBudW1iZXIgaXMg
dXNlZCBmb3IgdGhlIHZhbHVlIG9mIHByb3BlcnRpZXMgd2l0aCBhIHBoYW5kbGUgdmFsdWUgdHlw
ZS4NCj4gDQo+IFRoZSBwcm9wZXJ0aWVzIGhhdmluZyBwaGFuZGxlIHZhbHVlIG11c3QgaGF2ZSBw
cm9wZXIsIHdlbGwsIHZhbHVlIDopDQoNCkZvciBhIHByb3BlcnR5IHRvIGhhdmUgdHlwZSA8cGhh
bmRsZT4gaXQgbXVzdCBlaXRoZXIgYmUgb2YgdGhhdCB0eXBlcyBhcyANCkRlZmluZWQgZHRzIHNw
ZWMgMC40IG9yIGEgYmluZGluZyBtYW5kYXRlcyB0aGF0IHR5cGUuDQoNCj4gDQo+PiANCj4+PiBX
ZSBkaXNjdXNzIERUQyBoZXJlLCB5ZXM/IFdoZXRoZXIgaXQgaGFzIG9yIGhhcyBub3QgYSBidWc/
IFBsZWFzZSBoZWxwDQo+Pj4gbWUgdG8gdW5kZXJzdGFuZCB0aGUgdG9waWMuIFdoeSB3b3VsZCB3
ZSBjYXJlIGFib3V0IFplcGh5cidzDQo+Pj4gaW1wbGVtZW50YXRpb24/IEl0J3MgWmVwaHlyJ3Mg
cHJvYmxlbSBhbmQgSSBhbSBub3QgYSBaZXBoeXIgZGV2ZWxvcGVyLiBJDQo+Pj4gYW0gbm90IHNh
eWluZyB0aGF0IGl0IGlzIG5vdCBpbXBvcnRhbnQsIGp1c3Qgc2F5aW5nIHRoYXQgSSBhbSBub3Qg
dGhlDQo+Pj4gYXVkaWVuY2UgdG8gZGlzY3VzcyBpdC4NCj4+IA0KPj4gSSBhbSBhcmd1aW5nIHRo
YXQgdGhlIERUQyBTcGVjIDAuNCBkb2VzIE5PVCBtYW5kYXRlIGFueSBvZiB0aGVzZSBhbnkgb2Yg
dGhlc2UNCj4+IOKAnGNvb2xpbmdfZGV2aWNl4oCdLCDigJxkbWFz4oCdLCDigJxod2xvY2tz4oCd
LCDigJxpb19jaGFubmVsc+KAnSwg4oCcaW9tbXVz4oCdLCDigJxtYm94ZXPigJ0sIA0KPj4g4oCc
bXNpX3BhcmVudOKAnSwg4oCcbXV4X2NvbnRyb2xz4oCdLCDigJxwaHlz4oCdLCDigJxwb3dlcl9k
b21haW5z4oCdLCDigJxwd21z4oCdLCDigJxyZXNldHPigJ0sIA0KPj4g4oCcY2xvY2tz4oCdLCAg
4oCcc291bmRfZGFp4oCdIGFuZCDigJx0aGVybWFsX3NlbnNvcnPigJ0gDQo+PiBtdXN0IGZvbGxv
dyA8cGhhbmRsZSBjZWxsIOKApj4uIA0KPj4gDQo+PiBUaGlzIGlzIG9ubHkgbWFuZGF0ZWQgYnkg
dGhlIGR0LXNjaGVtYSBhcyBmYXIgYXMgSSB1bmRlcnN0YW5kLCB0aGF0IGlzIGEgdXNlZCBieSAN
Cj4+IExpbnV4LCBidXQgbm90IFplcGh5ciBhbmQgdGhlIERUQyBNYWtpbmcgdGhlIGFzc3VtcHRp
b24gdGhhdCB0aGlzIGlzIHRydWUgZm9yIA0KPj4gYWxsIHN5c3RlbXMNCj4gDQo+IE5vLCBkdHNj
aGVtYSBpcyBpcnJlbGV2YW50IGhlcmUgYW5kIERUQyB3YXMgdmFsaWRhdGluZyBpdCBzaW5jZSAy
MDE3LCBzbw0KPiB5ZWFycyBiZWZvcmUgZHRzY2hlbWEuDQoNCk15IHBvaW50IGl0IHRoYXQgdGhl
IERUQyBpcyBvdmVycmVhY2hpbmcgSU1PIGFuZCB2YWxpZGF0aW5nIHByb3BlcnR5IHVzaW5nIA0K
V0FSTklOR19QUk9QRVJUWV9QSEFORExFX0NFTExTIHRoYXQgYXJlIG5vdCBtYW5kYXRlZCBieSB0
aGUgDQpEVFMgU3BlYyAwLjQuIFRoaXMgaXMgbGVha2luZyB3YXJuaW5ncyBpbnRvIFplcGh5ciBh
bmQgY2FuIGxlYWQgYSB1c2VyIHRvIA0KYmVsaWV2ZSwgdGhhdCBaZXBoeXIgYWxzbyBpbnRlcnBy
ZXRzIHRoYXQgcHJvcGVydHkgaW4gdGhlIHNhbWUgd2F5IGFzIHRoZSBEVEMNCg0KPiANCj4gRFQg
c3BlYyBpbmRlZWQgZG9lcyBub3QgbWFuZGF0ZSBpdCBhcyBwd21zLCBidXQgcmVwbGFjaW5nIHRo
YXQgY2hlY2sgaW4NCj4gRFRDIHdpdGggc29tZXRoaW5nIG9ubHkgdmFsaWRhdGluZyBwaGFuZGxl
cyB3b3VsZCBub3Qgc29sdmUgeW91cg0KPiBwcm9ibGVtLiBZb3VyICdwd20nIGlzIGEgcGhhbmRs
ZS12YWx1ZSB0eXBlLCBiZWNhdXNlIHlvdSB1c2UgcGhhbmRsZQ0KPiB0aGVyZSwgYW5kIHN0aWxs
IGlzIGhhcyB3cm9uZyB2YWx1ZS4NCg0KRG8gbm90IHRha2UgbXkgY29kZSBpbiB0aGUgZXhhbXBs
ZSB0b28gY3JpdGljYWxseSwgdGhhdCBpcyBqdXN0IGNvZGUgdG8gc2hvdyANCmhvdyB0byBnZW5l
cmF0ZSB0aGUgd2FybmluZ3MuIA0KDQpNeSBwb2ludCBoYXMgYmVlbiB0aGF0IGluIHplcGh5ciBu
b24gb2YgdGhlc2UgcHJvcGVydGllcyBzaG91bGQgZ2VuZXJhdGUgDQpXYXJuaW5ncyBnZW5lcmF0
ZWQgYnkgV0FSTklOR19QUk9QRVJUWV9QSEFORExFX0NFTExTIA0KDQoNCg==
