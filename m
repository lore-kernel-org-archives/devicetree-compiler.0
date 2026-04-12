Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013085.outbound.protection.outlook.com [52.103.33.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E98733985;
	Sun, 12 Apr 2026 16:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011865; cv=fail; b=Xcw65uV6/sVTSxK3hRorUw6PHMA30uJmqAA4J6NPrRuone9CA2OR/W82Sx+U2wtP8u1yNsC3BENvEsV18MvBrDSZenZN1cCkaepVEJMyJYvBUgLQsccOGD4fk6W1Yg7yj4T2gZMHkFtKZSFkVdBsq8wX45yYOOXy52IZo6x+t0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011865; c=relaxed/simple;
	bh=ml/3o9XN/NoPz+az6SA2kVxa4AUlKJ2puAjTVbrjTnI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ULGZ4RLYKWoAgfMHeV4qYNU6ij5K2n1dMFLIPvJv3hIL0UOJvcXskIX1IOQinWQAQWV7EhmeRZ/6dYnf8oLyq6MVHYECOM3yiaPppAcAE4kdfKDvyJuNoCB4GuhKKlB4BjQ0EVx2ohXFA5knXaVZiRMOdUseaJ77gL5t9Vh19WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=q70ogPMc; arc=fail smtp.client-ip=52.103.33.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="q70ogPMc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBa9pAyXLmQ8xGU1T6wWKsaH5DfO2yLkqlmR6RuoKKd1cqA45HEC63VTvtbYUuiWaUOXQzjHbPwqD171B/3Gt08GzdUgntEKcWELX9KY7mSrBjPadzqLJ9PwmcacZfVDJchdWVgaNvN8qKfPuV1vH/nXyU6b3fA04Xk7HJpeWzpH50E1Jk4eViEJxIiDGoa3xRTzAMv4EckSO6pT0/s7G2AB31664dzMaHQgZkOO94rwPQX/3gHnny4jySYW6HUCcQr8MCF6KzBLkRbqEHmAQI34cWWeIHaz/Wn3X0vB/kEvrAaVLg8O0HJ5FC9mVpv/c8zB6y6YPXH/fLsMZDj4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml/3o9XN/NoPz+az6SA2kVxa4AUlKJ2puAjTVbrjTnI=;
 b=MtjUYRXDL+yBh9863SC1tBXa4r/ifhkIov9kg/a7U/kYgvTDfYALxWYdugQPBdhAUNCtwo6P/ceGmd/9jySjvOvg0jr+jdn1lASn8s9wJB6MExuXmYCvkPjh2qgdril/oYVZ1zi3xrMKde+CXriAyZv6A4a0oZalEeDx8XfVMihs0+qnK85ZGiX5N/0hNa6Do0fLkJGFMkbk+0bMhLHu3GCXAi3uFElYhACNfzzbwlJw3LAh2KzGerxZern6CEjGyfGHw8Z2srqaghWo+P8FvDbWnCnlVpCSIh9YJHIQV36bRNJHzUpkPoK+daJQ3PQgM+OB1zUgNV7+nM2aA95x0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml/3o9XN/NoPz+az6SA2kVxa4AUlKJ2puAjTVbrjTnI=;
 b=q70ogPMcg4a5QJES7zzBW8GXsVxw13dR23v1tECCqs7PD026jyEdaolXZ9ltdVw8AI6yAQBOECOHYg2O+upfqFQyk44v5hNNX8AFbmxPrH6wdkwgUWsIeb+iLbRylp0nBsWpyKx2xmHFbrh06WPMO5FQv36HKV/+Y3iDz7IFvMCUZIlI7E0V15nrP2UUafM/GduG6Oxzst6q+o2D5tP475LwG9of7eiRU6PUAzkTDmDqBM4Fw6t/WdaYyEXgJD/RKUNXVmsLky8mYNt6OI37C0p+Ezbt98mLv7TWtgcawxJcP3iW5i7XIA9MioQEOhqM5hPk3ZRlR7+WR+xGvA2pYw==
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:285::14)
 by DU0P190MB2387.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:5a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Sun, 12 Apr
 2026 16:37:41 +0000
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac]) by GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac%6]) with mapi id 15.20.9769.044; Sun, 12 Apr 2026
 16:37:41 +0000
From: Kyle Bonnici <kylebonnici@hotmail.com>
To: Herve Codina <herve.codina@bootlin.com>
CC: "devicetree-compiler@vger.kernel.org"
	<devicetree-compiler@vger.kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: Phandles
Thread-Topic: Phandles
Thread-Index: AQHcyeGzLXiU0rQJNEOrDVQKAULcerXbYncAgAAQq4CAAB5ZAIAAEA+A
Date: Sun, 12 Apr 2026 16:37:40 +0000
Message-ID: <163D807F-0F83-4282-B182-7A18B124D3E6@hotmail.com>
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
 <20260412145144.4737fde6@bootlin.com>
 <D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
 <20260412173916.7a971a45@bootlin.com>
In-Reply-To: <20260412173916.7a971a45@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXP190MB2509:EE_|DU0P190MB2387:EE_
x-ms-office365-filtering-correlation-id: 6ae3db3b-a3eb-4119-d26d-08de98b1d098
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799015|15080799012|8062599012|19110799012|31061999003|461199028|37011999003|25031999004|51005399006|10035399007|4302099013|440099028|3412199025|26121999003|102099032|1602099012|40105399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?ODhPU2lMcUx6NUhuMlRDTDYyR2UvQllXeks0b1cvVXZLblA0b1pqc2lFdmtZ?=
 =?utf-8?B?ZEhhYUYrOVY2NnNaQXM3d0RVRDJWaWtjU3BHUTZ2L3RvbXBKOWxtRkJBYUFk?=
 =?utf-8?B?eVdDWXcydldYOXg3UmRvSi9qdUwybjRZeDMwVFN2NnMvWTErOWt0VmZkZlZn?=
 =?utf-8?B?NWdabFN3UkZyWjZzZk1jMVBnTXdDR3hsZXkzZ2lVWWNadHR2enhyekt4ZURa?=
 =?utf-8?B?SnlibjVXeWJ4U1lyQzV5YWFiTkQwTzBlTXJSRE1idld5dHkydEFiTGpsbjQ0?=
 =?utf-8?B?MkxOMWQxbTBXem9QMW5vVmFFd3V2VWNtVjcvQkp3eVlvdTBVU0lRSkNrRXJT?=
 =?utf-8?B?KzRCa0pNZk80WTJoVE9rNHZlNURMTnpkaXd3SUU4NHZDM1hMQzNPdXhWZVhy?=
 =?utf-8?B?eStwSHEvM0JpbXA0bEF4UjVyN2htNWdJVE1ITkNxVjFFd2UrSEhUWWcrbnMx?=
 =?utf-8?B?QVRSeWoxaFlkOEhoRWtjTWRjRFZaV2NLTUZtRmtWelhqSHlqQVhjU3JaZWY1?=
 =?utf-8?B?bUNkbGxiZDFzZHRtU1lqekY5cE11K2xZYjkzcWFaMVFQcXFuamV3L0NQVllZ?=
 =?utf-8?B?dWIvY1orbmZTS2t5Q3dPcy9WcUhoNVdSUzVDNFhGTkVDeC9lY1hSQU5Jbk1p?=
 =?utf-8?B?RkQ3ZlFIa3FBWHVHVm9pa2xDK1J2Y1NkT3AxeWV3L1Q3cHdMQ1QvK3QvT2Yr?=
 =?utf-8?B?c2EyT0diVjBwV0lrUllYanpKUjJCUmRGVjJEeHYvZy9MZGZ4cE1QRDZlcU1B?=
 =?utf-8?B?M1dKeEk1cWlwaytZR0VkQnFqVmkrWFhNcGErMk5aTCtrZU9aMmp5bWtTUjYr?=
 =?utf-8?B?Y25LUUN3eEppUGRCRjhTREhPWmpiWHJtRkVOMWN2Q1FvSy8xMlRQbDBONDB4?=
 =?utf-8?B?QUJyWFJ6OEFuR2QxWTRmaG5NdGxLUDZXbENmL09nSXJWa2lJRWx4Z29DUnRo?=
 =?utf-8?B?QlhjS0xXRDM1NEtKNFFzRURJVEcyNElUcW4xMFZYWGVCZ25IK3ppdWlDNVpj?=
 =?utf-8?B?R0pXZ1lRM1Zwa2t4V1BvaHVTR3ZnL1AyOGoxMHJoY2Z6b1FSREhnUVd1RFF3?=
 =?utf-8?B?OTVtVEh4L1AxZUkvM2ZQb3JveWFrMW5ZZnhacVlOekJ2N2lqWTllaTFQZlRN?=
 =?utf-8?B?bVM3ZTErOFJ4UnZmQk9kTGV5TUdxOGFrd3NFeGx4bDEybWFJMHNWQzhlNDdY?=
 =?utf-8?B?MHJrOVAveUJxVDFnbktGdHRZQ01vMHJIMTRLN1BkUTM0ZHZJWkVVVFlSaHJm?=
 =?utf-8?B?Zkhsd2RRY2Q0bHhXZnlEWk11RVNBcGNicjFjVEh3eW9IYzF4TUl3Y280dXJQ?=
 =?utf-8?B?bkZRMzhLZWpjSVRldEVvYnV2ZUdMNzRSTGRBM1JhVzBNTGdzKzR2RXhlbW9K?=
 =?utf-8?B?bGJhNXJWS25sQkR0dnp4a0JoUjRHSFBaaWdRbXRDSUw5aS9jVTUwT3liNGpp?=
 =?utf-8?B?emNlN21ldklJaHhzRlVCUjY3dm0zVHcwVU93RitRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjlReG5RZnE2UlEvOU9oaXlyMGIyaDdQVHBsdHhYSzgzZTJVaGlHLzNENTZ3?=
 =?utf-8?B?aWFuRTlRNk9xdjBLZ0NUY2xmejVFdUJQMFVlb2YwcDBDeTNwdmVFM0NDT2pi?=
 =?utf-8?B?cVVqMWRpTW91Tnd3bGxUcHAyZXRoOGowNVUyVWthOFFUWUt6Q2xER29aRGYw?=
 =?utf-8?B?N0pjL3p5QzhEOVRQK1pDa1NnOFErMDFQclNoYmR0L0IrT1M2UC80YjJidVBq?=
 =?utf-8?B?Y0NXUnN5c0JjRlp6UGJWTWsrTVhWSmQxRUk3UVA1dG5Ra25nT0cyL0UwZDNS?=
 =?utf-8?B?azhIeVVLaDloS3lWU2ZDWTYrc09LR295TGpzR0JOTnRjN054c2ZCMkFqL01O?=
 =?utf-8?B?RDZlN2NHSU41NWticW9hMGE2eHo2M20zRmdHdU9TczFRUmZMYnhWR2RUUDNl?=
 =?utf-8?B?N3Q1SFhnanVVR21mdWE4SmdrM0NGNGF5SStFalg4bFMvV3l0UVY4dDdMeDNW?=
 =?utf-8?B?cVY5aHBLUTJCbUMyaXNkVjZVejI0TVczaGJUbW1ncjdmMmJxREFid1dSa2hR?=
 =?utf-8?B?N3R5VzJkTkpxWmdNUXg0QU0wY3QrYjhVK2NseXVrVFJpNlM1aXNlS1hRKzRY?=
 =?utf-8?B?KzJYNWZXOThRWjN0em9PUURmYW0yNStrUC9TNGVaekQzK0k0Z3F2bjA5TmFq?=
 =?utf-8?B?dzIrY3dOYnhaM0Q2WnRhNmpoNk1GR2hCeTlBcWJoUTVIMkdoMXVYWXFiTmsx?=
 =?utf-8?B?ZmluWnRobUw3MnVLVkw0d2w0ZWRIemNEVzFXMEVjZlBKa0wraXBMejJRdk5T?=
 =?utf-8?B?Ni9DK21hNm5JbzYyM0pOREc1c0pHNXpGT1E2SUYzMXQzU1JnQWNoOGZ2Q3N0?=
 =?utf-8?B?WnBUY1pPaVFicndHNjRreVF0b1hkNW1Pcyt2WmhYa0dLTWd1YkN6bHhhZzJH?=
 =?utf-8?B?dTZEM1E3LzlXRjVDUlhWUkhEN3BaM0thaHUyeXJGMlRQYWtSQlFYZFlZWUw2?=
 =?utf-8?B?b2FKRCttRU43Vk1nQnN4VW9yU1UvNkRNbHlXQUIySDRqT0d1aDdqQ3R4NkVJ?=
 =?utf-8?B?bjR1MHVFb3pCK0c0c0Q2NjFKVm5pQXNsWE5uOVo5WnVLb1lTbkxIU2J6WFZz?=
 =?utf-8?B?UFgzNGVzT1JCU3N0c0xQaFZ5eEIzRHpTZGpaSkxWcTBnUjVSbjVIV1VnV1gw?=
 =?utf-8?B?Kzg2SGpLVGZxcTZrTTMxbElYblZFQ0NZZXNpd3NsMitqdFVYRjhsdjlSaW1H?=
 =?utf-8?B?VmxHSm0vQWF2YnlFQko5MGFuZjBsYzZDMWc3UzArVDUxQkhuNGl2V25LK2hv?=
 =?utf-8?B?NmIvTjNvQXhHN2U2UVRuQk1XMWxyQmg4WXJ5akJRdnpRck1BMGdkMVBQblBP?=
 =?utf-8?B?bWxjQmtFcjJrak9hMTdyaXdPV3AxNzBLeXl0bFN6TUM2ejM2M1UxaVNjWVZh?=
 =?utf-8?B?dSs5WUt1THhORlo4NTFaQm9YRzZESEdXTHlsZ2I5bUh5T0c5OWE2SDhUa2pD?=
 =?utf-8?B?c0FHQ1NXanZETlVYcHIyKzlkUHBHNTkzV1dlTUxIaHQvcGN0TDhvUC8rY29Z?=
 =?utf-8?B?MGtHQlZvT1BLeGQyMkFwRmtNUVlTcm8vKzRFTk9VTDRNalZVN0duOWovRzVZ?=
 =?utf-8?B?YnF4SUcxbTRoeVZZcS8yNnpSb0QxSGhwSElpQTlWMTVxZ29BOHg1UXVqalBB?=
 =?utf-8?B?OHlkNGs0K3U3b2JZNVYyc0xVbERXaHVZc0JzRysvOWpGdGJwR0FSVExxbWhz?=
 =?utf-8?B?d2tsV0NFbG4xSjhGQmVKdEhCSGFWdDdhNTJtMUZqcVc5Wk5ZTkpkeHBUQmVv?=
 =?utf-8?B?YzdPT3VUVnEzNnhYMHFDT0FpTXNJVHRmRHY1My91S1RiUlVRZktvbXo3Mkox?=
 =?utf-8?B?TlpTTUV5djFaY3Irb3NYUkNiRzc2NnRWMWJuN2JScHZEM0xjcmVXdzZsQ2xt?=
 =?utf-8?B?WFR5a0h3VUhsRmtDdXZqQXp1bnU2b042R2FaZjVkSzd5Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <989D215F89C0494089D8BC74B798A44C@EURP190.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae3db3b-a3eb-4119-d26d-08de98b1d098
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2026 16:37:40.8886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB2387

DQoNCj4gT24gMTIgQXByIDIwMjYsIGF0IDE3OjQwLCBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGlu
YUBib290bGluLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBLeWxlLA0KPiANCj4gK0NjIEtlcm5lbCBk
ZXZpY2UtdHJlZSBtYWludGFpbmVycw0KPiANCj4gT24gU3VuLCAxMiBBcHIgMjAyNiAxMzo1MToz
NSArMDAwMA0KPiBLeWxlIEJvbm5pY2kgPGt5bGVib25uaWNpQGhvdG1haWwuY29tPiB3cm90ZToN
Cj4gDQo+Pj4gT24gMTIgQXByIDIwMjYsIGF0IDE0OjUxLCBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNv
ZGluYUBib290bGluLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgS3lsZSwNCj4+PiANCj4+PiBP
biBTYXQsIDExIEFwciAyMDI2IDE4OjMzOjMzICswMDAwDQo+Pj4gS3lsZSBCb25uaWNpIDxreWxl
Ym9ubmljaUBob3RtYWlsLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4+IEhpDQo+Pj4+IA0KPj4+PiBJ
IGhhdmUgYmVlbiBsb29raW5nIGF0IHRoZSB0aGUgY29kZSBmb3IgdGhlIGNvbXBpbGVyIGFuZCBJ
IGFtIHdvbmRlcmluZyB3aGljaCBzcGVjaWZpY2F0aW9ucyBtYXJrcyB0aGUgYmVsb3cgcHJvcGVy
dGllcyBNVVNUIEJFIE5leHVzIFByb3BlcnRpZXMgaGVuY2UgdGhlIHZhbGlkYXRpb24uDQo+Pj4+
IA0KPj4+PiBXQVJOSU5HX1BST1BFUlRZX1BIQU5ETEVfQ0VMTFMoY2xvY2tzLCAiY2xvY2tzIiwg
IiNjbG9jay1jZWxscyIpOw0KPj4+PiBXQVJOSU5HX1BST1BFUlRZX1BIQU5ETEVfQ0VMTFMoY29v
bGluZ19kZXZpY2UsICJjb29saW5nLWRldmljZSIsICIjY29vbGluZy1jZWxscyIpOw0KPj4+PiBX
QVJOSU5HX1BST1BFUlRZX1BIQU5ETEVfQ0VMTFMoZG1hcywgImRtYXMiLCAiI2RtYS1jZWxscyIp
Ow0KPj4+PiBXQVJOSU5HX1BST1BFUlRZX1BIQU5ETEVfQ0VMTFMoaHdsb2NrcywgImh3bG9ja3Mi
LCAiI2h3bG9jay1jZWxscyIpOw0KPj4+PiBXQVJOSU5HX1BST1BFUlRZX1BIQU5ETEVfQ0VMTFMo
aW50ZXJydXB0c19leHRlbmRlZCwgImludGVycnVwdHMtZXh0ZW5kZWQiLCAiI2ludGVycnVwdC1j
ZWxscyIpOw0KPj4+PiBXQVJOSU5HX1BST1BFUlRZX1BIQU5ETEVfQ0VMTFMoaW9fY2hhbm5lbHMs
ICJpby1jaGFubmVscyIsICIjaW8tY2hhbm5lbC1jZWxscyIpOw0KPj4+PiBXQVJOSU5HX1BST1BF
UlRZX1BIQU5ETEVfQ0VMTFMoaW9tbXVzLCAiaW9tbXVzIiwgIiNpb21tdS1jZWxscyIpOw0KPj4+
PiBXQVJOSU5HX1BST1BFUlRZX1BIQU5ETEVfQ0VMTFMobWJveGVzLCAibWJveGVzIiwgIiNtYm94
LWNlbGxzIik7DQo+Pj4+IFdBUk5JTkdfUFJPUEVSVFlfUEhBTkRMRV9DRUxMUyhtc2lfcGFyZW50
LCAibXNpLXBhcmVudCIsICIjbXNpLWNlbGxzIiwgdHJ1ZSk7DQo+Pj4+IFdBUk5JTkdfUFJPUEVS
VFlfUEhBTkRMRV9DRUxMUyhtdXhfY29udHJvbHMsICJtdXgtY29udHJvbHMiLCAiI211eC1jb250
cm9sLWNlbGxzIik7DQo+Pj4+IFdBUk5JTkdfUFJPUEVSVFlfUEhBTkRMRV9DRUxMUyhwaHlzLCAi
cGh5cyIsICIjcGh5LWNlbGxzIik7DQo+Pj4+IFdBUk5JTkdfUFJPUEVSVFlfUEhBTkRMRV9DRUxM
Uyhwb3dlcl9kb21haW5zLCAicG93ZXItZG9tYWlucyIsICIjcG93ZXItZG9tYWluLWNlbGxzIik7
DQo+Pj4+IFdBUk5JTkdfUFJPUEVSVFlfUEhBTkRMRV9DRUxMUyhwd21zLCAicHdtcyIsICIjcHdt
LWNlbGxzIik7DQo+Pj4+IFdBUk5JTkdfUFJPUEVSVFlfUEhBTkRMRV9DRUxMUyhyZXNldHMsICJy
ZXNldHMiLCAiI3Jlc2V0LWNlbGxzIik7DQo+Pj4+IFdBUk5JTkdfUFJPUEVSVFlfUEhBTkRMRV9D
RUxMUyhzb3VuZF9kYWksICJzb3VuZC1kYWkiLCAiI3NvdW5kLWRhaS1jZWxscyIpOw0KPj4+PiBX
QVJOSU5HX1BST1BFUlRZX1BIQU5ETEVfQ0VMTFModGhlcm1hbF9zZW5zb3JzLCAidGhlcm1hbC1z
ZW5zb3JzIiwgIiN0aGVybWFsLXNlbnNvci1jZWxscyIpOyAgDQo+Pj4gDQo+Pj4gQWxsIG9mIHRo
b3NlIHByb3BlcnRpZXMgYXJlIGRlZmluZWQgYXMgcGhhbmRsZXMuDQo+Pj4gDQo+Pj4gRm9yIGlu
c3RhbmNlLCB0aGUgJ3B3bXMnIHByb3BlcnR5IGF2YWlsYWJsZSBpbiBhIG5vZGUgbWVhbnMgdGhl
IHRoZSBub2RlIGlzDQo+Pj4gYSBwd20gY29uc3VtZXIuIEl0IG11c3QgZm9sbG93IHRoZSBwd20g
Y29uc3VtZXIgYmluZGluZyBbMV0gYW5kIHNvIGEgcGhhbmRsZQ0KPj4+IGlzIGludm9sdmVkLg0K
Pj4+IA0KPj4+IFRoaXMgcGhhbmRsZSBjYW4gaGF2ZSBhcmd1bWVudHMgYW5kIHRoZSBudW1iZXIg
b2YgYXJndW1lbnQgaXMgZGVmaW5lZCBieSB0aGUNCj4+PiAjcHdtLWNlbGxzIHByb3BlcnR5IHNl
dCBpbiB0aGUgcHdtIHByb3ZpZGVyIG5vZGUgWzJdLCBbM10uDQo+Pj4gDQo+Pj4gWzFdIGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL3plcGh5ci92NC40LjAtcmMzL3NvdXJjZS9kdHMvYmluZGlu
Z3MvcHdtL3B3bS1jb250cm9sbGVyLnlhbWwNCj4+PiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL3pl
cGh5cnByb2plY3QtcnRvcy96ZXBoeXIvYmxvYi9tYWluL2R0cy9iaW5kaW5ncy9wd20vcHdtLWNv
bnRyb2xsZXIueWFtbA0KPj4+IFszXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
Ny4wLXJjNy9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20u
eWFtbA0KPj4+IA0KPj4+PiANCj4+Pj4gDQo+Pj4+IFRoZXNlIGNhbiBiZSBmb3VuZCBoZXJlOiBo
dHRwczovL2dpdGh1Yi5jb20vZGdpYnNvbi9kdGMvYmxvYi9tYWluL2NoZWNrcy5jI0wxNDk4IHRo
aXMgaXMgcmVsZXZhbnQgZm9yIGh0dHBzOi8vZ2l0aHViLmNvbS96ZXBoeXJwcm9qZWN0LXJ0b3Mv
emVwaHlyL2lzc3Vlcy8xMDcwNjYgIA0KPj4+IA0KPj4+IEV4YW1wbGVzIHByb3ZpZGVkIGluIHRo
ZSB6ZXBoeXJwcm9qZWN0IGlzc3VlIGxpbmsgYXJlLCBpbiBteSBvcGluaW9uLCBpbmNvcnJlY3Qu
DQo+Pj4gDQo+Pj4gQ2FzZSAxOg0KPj4+IC8gew0KPj4+ICAgICBub2RlMSB7DQo+Pj4gICAgICAg
ICAgcHdtcyA9IDwxICZwd20wIDEgMjAgUFdNX1BPTEFSSVRZX05PUk1BTD47DQo+Pj4gDQo+Pj4g
ICAgICAgICAgSGVyZSB0aGUgZmlyc3QgY2VsbCAnMScgaXMgbm90IGEgcGhhbmRsZS4gIA0KPj4g
DQo+PiBIZXJlIHRoZSBjb21waWxlciBpcyBtYWtpbmcgYW4gYXNzdW1wdGlvbiBoZXJlIHRoYXQg
YWxsIGBwd21zYCBwcm9wZXJ0aWVzIG11c3QgYmUgc3BlY2lmaWVyIHByb3BlcnRpZXMgYW5kIGFs
bCB1c2UgYHB3bWAgc3BlY2lmaWVyLg0KPiANCj4gSSB0aGluayB0aGUgcHVycG9zZSBvZiAnc2Vs
ZWN0OiB0cnVlJyBpcyB0byBoYXZlIHRoZSBiaW5kaW5nIGFsd2F5cyBhcHBsaWVkOg0KPiAgaHR0
cHM6Ly9naXRodWIuY29tL2RldmljZXRyZWUtb3JnL2R0LXNjaGVtYS9ibG9iL21haW4vZHRzY2hl
bWEvc2NoZW1hcy9wd20vcHdtLWNvbnN1bWVyLnlhbWwjTDE1DQo+IA0KDQoNCknigJltIGhhdmlu
ZyB0cm91YmxlIGZpbmRpbmcgd2hlcmUgdGhlIERldmljZXRyZWUgU3BlY2lmaWNhdGlvbiAodjAu
NCkgbWFuZGF0ZXMgdGhhdCBhbGwgYmluZGluZyBzeXN0ZW1zIG11c3QgZXh0ZW5kIGR0LXNjaGVt
YS4gDQpTaW5jZSB0aGlzIHJlcXVpcmVtZW50IGlzbid0IGV4cGxpY2l0bHkgaW4gdGhlIHNwZWMs
IGl0IGZvbGxvd3MgdGhhdCB0aGUgV0FSTklOR19QUk9QRVJUWV9QSEFORExFX0NFTExTIHZhbGlk
YXRpb24gYmVsb25ncyBpbiBkdC12YWxpZGF0ZSByYXRoZXIgdGhhbiB3aXRoaW4gZHRjIGl0c2Vs
Zi4NCg0KDQo+IElmIHRoaXMgaXMgY29uZmlybWVkLCBEVEMgcGVyZm9ybXMgY29ycmVjdCBjaGVj
a3MgYXMgdGhpcyBiaW5kaW5nIG11c3QgYWx3YXlzDQo+IGJlIGFwcGxpZWQgYW5kIHNvIHRoZSAn
cHdtcycgcHJvcGVydHkgbXVzdCBiZSBhIHBoYW5kbGUtYXJyYXkgcHJvcGVydHkuDQo+IA0KPiBE
ZXZpY2UtdHJlZSBtYWludGFpbmVycywgY2FuIHlvdSBjb25maXJtIHRoZSBwdXJwb3NlIG9mICdz
ZWxlY3Q6IHRydWUnIHNldA0KPiBpbiBhIERUIGJpbmRpbmcgPw0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiBIZXJ2w6kNCg0KDQo=
