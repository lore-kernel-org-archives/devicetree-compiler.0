Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011029.outbound.protection.outlook.com [52.103.33.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAE93B3C00;
	Mon, 13 Apr 2026 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776073808; cv=fail; b=qhrX6GrV8RXbCgRqHUbD9IatPHhj+qCRvdtBilupBS+FZIOpCTwrXHlXAx8IXh8LQnZxG5jffrhST26hNhMQ3HRGjKkkfHxAOExcRze6jBDzsZ9gvDYlJz2xr42jjyIOp0ZmeQf2uduFLylBVqn92tUyTKjZj5g8VAjJs41GcA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776073808; c=relaxed/simple;
	bh=/rAX4HatqDOtczR7PubNXRIZVEOi1mukgqW5hFigtvI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ojxiXqSjOuJBi5zYkVTjZDbK076RrJn0CEruS7liOIO31t/lJjCG9HQ6K+ZllLIGjie66AoyXaP/BrpibKRciN1cv7YwTgVNrd3wyVx8sNhygWXJh+KSBGj/2uqiPyg+nhCrWnpwd1zUtFWGs1RKYuk6/pBP/TFJg2iSU8gax6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=IpexXUn8; arc=fail smtp.client-ip=52.103.33.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="IpexXUn8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lpb59TBDVtVUMfZbUSEuj8KofY8YcCnl5L/mIjoUcngPL//31/uBqwlkd5uUlqXrgWDoRbY7yFt5sLlpTq5PNxcHivdgq+oMLtTxlxdWWpxnht0hRcOMWtS4L2ss6Qs9BdoZw0cMcsGuMk0YADDHO8Glukw2MbVDLGLKCy61AKOTZNZrs1nsjvovMaSquHzevxNYfOS/Ys+gqdOKontDsdLPcm1tkqQUsiEbMbDJDvfNPKkMqQG7SawIos95Z1Fa7Q8GGQ8i2GO2Mi8xkFU7+AyuE45Z4SoZJIcTGRl+mWzsQmwrULVamnYwt+4Dm3jZiod8qYKLsTfXJUw/48rJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rAX4HatqDOtczR7PubNXRIZVEOi1mukgqW5hFigtvI=;
 b=n67ntGH7y0GfEGtvB/UlwHVnIqbTtg6Y24tBlRnloNOJPMH0MzsKU9mqA5NUzxvy+sphPRYp6yTTBbCiA/QvAYdNjJhhw9Ok/NYtAA/dF1v/wcjewmZbaTf3ZKPeeXvXT/qdkk3crk1b4Opk2jyhRtDptviGTezpHzQbtb36Tmfv2SG++bmynMHmJbNUE+4RCtUAsAcABRHwhOE8QMe0RuFlmHMOHwPJEpjRPeXoZ1wbhI2SgHEUMG2FkvLJz/4EfKFF0sYnNhRpQdkA8cO/vbZH2wNEv4EwJe1hVIcsyHOr46TpiVo5C9EHswRh/kXVe0iUgO8uWtZCSIFCA5JPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rAX4HatqDOtczR7PubNXRIZVEOi1mukgqW5hFigtvI=;
 b=IpexXUn8Aw9R6YvMcShdcedHIp0ToEYB9vJpDZQEuX5133qSmOFfvjFm8jYRYIrSyFWsE1y/jLE7HpeZ5n2FnqpJ4dUhfPWY3bfzgdai3fGEdqWR882pIjcUS13IO3HaJQJ5Y1HeDsss4JM/a+zS2I4cuYVjwLAc4KBANVT7Q/hF1jwIculGX+TI87RosNdX+A6OBM9HGhoXhGU6cyOFoKXqfJt0WVZx7QOJwabRlQMXrQOqtp2DBS2qfUleJnx54XDQwEk6bPllrJms2QljuhbPpWYVgNvCVczw44IypU09f9ttfBN8ABcxoZCDhjs3p6lZ1Ws0Ysj9wkHRWJgMqQ==
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:285::14)
 by PA4P190MB1245.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:10e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 13 Apr
 2026 09:50:04 +0000
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac]) by GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 09:50:04 +0000
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
 AQHcyeGzLXiU0rQJNEOrDVQKAULcerXbYncAgAAQq4CAAB5ZAIAAEA+AgADqzQCAAAkrgIAADHmAgAAMeoCAAAoaAIAACW6A
Date: Mon, 13 Apr 2026 09:50:04 +0000
Message-ID: <DB5F7CA0-08E8-4CF5-9815-598002AF471F@hotmail.com>
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
In-Reply-To: <c0983f3d-5025-4933-ac22-bfbc1adc6c31@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXP190MB2509:EE_|PA4P190MB1245:EE_
x-ms-office365-filtering-correlation-id: 6f93374a-ac31-407a-8b17-08de99420a14
x-ms-exchange-slblob-mailprops:
 SoURN12IA8uWt6j1FABxGa/1cQWkCELvMkcDzWPH60mupcXUbwYmqF8PeMNX3tJlfaM5DCUZB2CgfTuH2sN9NmXv93vORDELvFw4o5bqh3CPFNvV2pdhLhG8EDdkCV3d1WPRkg+dIFvmppqWbJlpYjY8UYU366cOpdGNfmEU63MDl7dZatSd9guRMDVm0J8+v/qTUylsHg3KD2EvMgxR0ONifASeZtfCug92L5OM5ERfamtn7kc9fZyhxPiWyQa9n9RHuW+n0E3lJeKaMbqmo8+T4F1AUs0/GnQ/XZxa+SBjJRyvrRw7Td5ylWyhoz3VvEIli5s3PWd9u5q+xiOn4hyggkOzDPFfOl4w1BKkFGsFmCJiQLRrZZwoNRywpqEqnu7sYBqBqTiuT5muHiuCrU6r1bDFB+Cv/uHbYGZEczq2bnsK3lE6VRGbTawhSFN3NCaMu6mlaAkbg87n3DOAHnNK6vNfil7wklSHrNCn4+47xLia/ZikVomz2psEgEziY/ZirxwUmwxRcIhoxMcpgY7H686ThPklJqY1XrwSn6Iesl908V4OuJHxZi6VBcQJK9ce4OdJwmueI2aVcH9ZJsRZdj6qHjZzbNzUjWAU6WNeSv4h8tK4fyyB/Y7nsB99j1y71iOlUF9jhxtCTJEU0PNMtRFv46h7
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|8062599012|461199028|15080799012|51005399006|8060799015|31061999003|37011999003|25031999004|3412199025|440099028|26121999003|102099032|40105399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q1Y0eVEwYk9PZCtCVjZrY1RrTHM0Z0ltUUZuVjNTRnp3VWd6djB5bVhPeEMv?=
 =?utf-8?B?S3VsWll3NEpoWXRPR2ZkblRQRWFsTUd1VEswQXFLTXlKaFZyQjl4OGY0QWI0?=
 =?utf-8?B?Q0V6RXdoQ2NEZHBJWi9jeHhuaHFySy9oR1ZNckFBWWVYOGVVaFlpbUdQa3JR?=
 =?utf-8?B?aVhoampKeHRIUEcwVVNhMnBHc3FFeEZ0MmhGNzR2VEFDaDIyWm5PTnVESVht?=
 =?utf-8?B?Z1VOUzF4ZUdZZm1TRmhwUytGK2R1TnV6amx1MWkvWmk0ZEU4bnI0amI0WVBS?=
 =?utf-8?B?alROa0JKQW51bkc1TjVlU21YK0QvS2hqaVd4SzUzR3dqYkZJOXN0TWNENmQv?=
 =?utf-8?B?V0RUdUVZU05LdkZpYktjRC96NGFpZ1RwcFJzQW5vdEd1NnVNZnJ2U1J2SDdC?=
 =?utf-8?B?bVFIZ0lWNHU2QTArN21rajZJZm1SMVUwN1NyL0xyNmErQzRoeHFPb3BvdTR3?=
 =?utf-8?B?blJUU01UbHl4TnF5elNzbGpKd1RMdFc3b3Jsa3dDZE9hU2xvVHJON29MRGhC?=
 =?utf-8?B?NFY4eEduYlo3VFdTN1B6OExoa2FsTTU0VlhNTll2bERkY1ZxdW9COFJTaE1M?=
 =?utf-8?B?b2RnY2QvNlkrYmVOUmdzN0FXUy9iUVRmQmtrMUI4RDlZay9hTVZNUUlRSDMv?=
 =?utf-8?B?Zks5UnJPWlR2NFFSSWpwMjNpWVBhczRaUWppR2xlTXpUUDltdmRUTFBENVJx?=
 =?utf-8?B?ZUxPVjM1Nyt1dTlZcmtKYUJBcW9uZTJWUnFmbEl4SG5qVTUwTllQUDNYSG9k?=
 =?utf-8?B?Z1QrbXdKSmF3cndEVlJ0a01hbTNWcGZvNHFpMks5ZHVTUWUrQjRrUXQzUUxC?=
 =?utf-8?B?L3NBUEhkY1RzcXU1eU9OeTlxRDJDT1I1NGhvSS9iV2x3Q04yUXQ1aHB1bitp?=
 =?utf-8?B?aUQxSHhBWXlqMnlCek9nMnlNZWxEUzA0WlBaTVJJMDVldHJ3YVNIeEI4a2JZ?=
 =?utf-8?B?NzFHOUd3dGgyTjJya3hsSFhuUXV4ZGhPbkV6M21Db1hESk12ZERpcUtXR0xN?=
 =?utf-8?B?TnBFZFVPc3dBMG0xaU41Z290aFFLMkNKc3VHdHV0dTlOeGtzMDc0bEF3VXVa?=
 =?utf-8?B?YzFlN1d2TmRvendZOU9PMnV0NStmcGY3VTRKcVNiaFFFVGd2N0tDU3NsUkNt?=
 =?utf-8?B?S3FlQk00SjRSR2FKQU1uaWV6R2FpRXdxL01SMU12dGtBWXgwYkV6a2dLa24z?=
 =?utf-8?B?MGViZ2lPMWdublNRYVNYYkhaVWdkNW9nWVRTbVVzQTZVbzFaVDB0L0NLVG91?=
 =?utf-8?B?YWY3VjJjQ09TZGdWTXJKWldmeEdPbHV3MkpzTnRuM2JvNHJQNlFFelBWdVl1?=
 =?utf-8?Q?NdmlxNcArEqZ5yBvGJsGCeIt7pfRbUyYNH?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2MyRVYyaWdFcVovVGozSHY0WDJ2WlYrU2Z1Z1Ewc0p6b2RqYXNZVXFRTTIy?=
 =?utf-8?B?K0czM2dFQWc1NWxFZXRCaVd0K29ibE5HekhCOTJBSVpaQ0o3Rlo5OTlQam5X?=
 =?utf-8?B?QmdZcGFrbmVNaDFpcGlyVU05QXp6NVYwaVVidVFxbU53ZVBlR2RINWUyVDFL?=
 =?utf-8?B?UExhNE01eUR6Qzd2WkEyanZQN0Z5Wi9qU25UVFNKb0FUVEZEZnFlT0ZUKzY1?=
 =?utf-8?B?SU5tTjBzZldBbkVpUzF0RzNuSGJBY0xrMVVwTEM5bU83ZFZidDA3SjBDeGFK?=
 =?utf-8?B?L3NWL3hrOGpYSDl0TmVJY3ZieGRtMWNIMzFrWW1JUFBzUEdNeFpIMCs0WDBa?=
 =?utf-8?B?WlNQUmFPZzFCMkFJVnRiSU10T3l6U1RWaUw5ZjJHWHJwZVBEUDdLRUU0UXd6?=
 =?utf-8?B?emNDbjh0ZEdzSk1hZ0hpWXNiS2xwMmFSYjRvTUZWMFova1dNSTM5RmRNVUhC?=
 =?utf-8?B?VGxlSDVmbHVDSWlMWWMreTh6VHdBaWVJMTluL3ZhSU13TkV2MTNvTWd4VEd3?=
 =?utf-8?B?L0NQUWZZRkRNd3JtU1BSUmMyaFUxV1MyS1Ezb3UvaHBCTDFnTkdqTmE0VEU0?=
 =?utf-8?B?b3J0NGRoU2MveUZ6QkNnWnN5RW5mWFNQeVNCYS9SN0ZWcDliWGN4WWdvd3dx?=
 =?utf-8?B?VlNYY3JOMFp0QTNnMFIyc2wwOEpMbzhQcEsrQ04vQ3VTVFpWV080YkNkMjA1?=
 =?utf-8?B?TTFJdTF0ZEJ0c0RrTjJzcU5KWndreU1uTWFzaHIrbVRUb1pBclJobWRVS0dn?=
 =?utf-8?B?V2l5cGR1djRSMEU3T2Q5bFpNUUJTcTZHU3dTYi9mdEo3a2d6NVZYNy8wWkhr?=
 =?utf-8?B?a1poOWE2YTBBUlVOMjlIdzVESXgzTlpWQ3dIZ0l5UFlJUlBDMzYzRlVlTjJB?=
 =?utf-8?B?OWZTR29kWm51UzhSTjRCRTYyd0YrVmhFS0dMWEhjV2NKSEcram1tbHFOQzNZ?=
 =?utf-8?B?K2wveWw4TDlTU1VodjJJVmlmMThIelppQVhiN0RudS9uWXJDeURYSS9GZEpv?=
 =?utf-8?B?QW1odXVYRzhuMS8yTEJ2WXFCd2xFNnl3Qkhpc2taamlsVnhadWdjQjFlVlhZ?=
 =?utf-8?B?SWdDOU1nNVdOam5CaVBkZlE3cXh0QitXTVJxeGtZTHMzdElmemhDTmFwTWhr?=
 =?utf-8?B?SUQ4ckFVbjY1ZXV0NWVOZVY5Nk84SnMxa1ZTVWx3aGptOGdrWFhtalZWeDlT?=
 =?utf-8?B?NjNtSnFLelVQS0xjWUJpdHNtMUhkMFdCWVU4ZFArczRZL1ZPUHBQa1MwV3lr?=
 =?utf-8?B?eFhKQlR1MGpkSFAzMHB1VEFRV3JoY1JzWFI0eWtMSWZEejBxS20zcW9HWjNv?=
 =?utf-8?B?U1dhWGFxS3BXYWZad2VmTEx6WENmby9wcHJjRjJKRkhPcFo0MzJZWVN6b1Mr?=
 =?utf-8?B?WEFtZFphZmoxU0pWcUhOeVVqY2JMekprSGJDYXBnOGxDc2lXSk8wMmlKV2JV?=
 =?utf-8?B?UXNCWGU3ZG5SR2JBY1NvRVNUNDgyRDFiWFVRVTc1Q2Joa3FUSEVEa1Vad2FL?=
 =?utf-8?B?K1MzcFluVzhHTG9OcFQ3VWFiUnVuTk14YkFnaEJLTCtNaUUyWkFzNkd3aFRO?=
 =?utf-8?B?bGdUTGt3RkNwc2l6L3pwTUVQTjJuK1JWa3VyaEJHc3RrT21wbVpmN2d2NVU5?=
 =?utf-8?B?SXd4WCt5VEczVWV4TkdWQnZ0REhxV21NaVkrOE82NjNva2VCOXlKZWVOK2Rk?=
 =?utf-8?B?YzgydU52cGNBZnFUeGRFMW1JdWFzMDFpMkljaTk4VlFkQVVpMUJIQkI4bEk4?=
 =?utf-8?B?VmRYM056T3l0THQ4WTF2RURBdlFFWkFYdkkxaWRpOE1Qak1MT1pzOW1Ob2Nr?=
 =?utf-8?B?a1g4NkFCZWRMRHI1MG9GbmxPZ0IrTHRZNlEyRFgrdzgyUGREVEdqc3BoZ3V5?=
 =?utf-8?B?R0FidDNIbUNBWjJEbWpZS1p3QkJ4R2g5L2ttTjlBZVlSNWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DA24BFFA719E447999A7C39A2F8E3D9@EURP190.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f93374a-ac31-407a-8b17-08de99420a14
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 09:50:04.8195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P190MB1245

DQo+IFlvdSBjYW5ub3QgaGF2ZSByYW5kb20gdmFsdWVzLiBJIHF1b3RlZCB0aGUgRFQgc3BlYy4N
Cg0KV2hlcmUgaW4gdGhlIERUUyAwLjQgc3BlYyBhcmUgcHJvcGVydHkgbmFtZXMgc3VjaCBhcyAg
cHdtcywgY2xvY2tzDQogZXRj4oCmIG1hbmRhdGVkIHRvIGJlIG9mIGZvcm1hdCA8cGhhbmRsZSBj
ZWxsIOKApj4/DQoNCj4gV2VsbCwgd2UgZG9uJ3QgdXNlIGRpc2NvcmQgYnV0IElSQy4uLiBidXQg
dGhhdCBnaXRodWIgaXNzdWUgYWxzbyB1c2VzDQo+ICJwd21zID0gPDEgJnB3bTAgMSAyMCBQV01f
UE9MQVJJVFlfTk9STUFMPjsiDQo+IA0KPiBTbyBhZ2FpbiAtIHdoYXQgaXMgIjEiPw0KPiANCj4g
SSBhbSBhc2tpbmcgYmVjYXVzZSBpZiB5b3UgdXNlIGluY29ycmVjdCB2YWx1ZSBhcyBwaGFuZGxl
IHZhbHVlLCB0aGVuDQo+IERUQyB3YXJuaW5nIGlzIG9idmlvdXNseSBleHBlY3RlZCBhbmQgbm90
aGluZyB0byBmaXggaGVyZS4NCg0KVGhlIHdhcm5pbmcgaXMgb25seSB2YWxpZCBpZiDigJgx4oCZ
ICBpcyBleHBlY3RlZCB0byBiZSBhIHBoYW5kbGUgd2hpY2ggaXMgd2hhdCBJIGFtDQpBcmd1aW5n
IHRoZSBzcGVjIGRvZXMgbm90IG1hbmRhdGUgdGhpcy4NCg0KPiBZb3UgYXNrZWQgd2h5IHBoYW5k
bGUgaGFzIHRvIGJlIHRoZSBmaXJzdCBlbnRyeSBpbiBwaGFuZGxlLXZhbHVlIHR5cGU/IEkNCj4g
cmVzcG9uZGVkIHRoYXQgRFQgc3BlYyBtYWtlcyBpdC4NCg0KV2hpY2ggc2VjdGlvbiBpbiBEVFMg
MC40IHNwZWM/DQoNCj4gV2UgZGlzY3VzcyBEVEMgaGVyZSwgeWVzPyBXaGV0aGVyIGl0IGhhcyBv
ciBoYXMgbm90IGEgYnVnPyBQbGVhc2UgaGVscA0KPiBtZSB0byB1bmRlcnN0YW5kIHRoZSB0b3Bp
Yy4gV2h5IHdvdWxkIHdlIGNhcmUgYWJvdXQgWmVwaHlyJ3MNCj4gaW1wbGVtZW50YXRpb24/IEl0
J3MgWmVwaHlyJ3MgcHJvYmxlbSBhbmQgSSBhbSBub3QgYSBaZXBoeXIgZGV2ZWxvcGVyLiBJDQo+
IGFtIG5vdCBzYXlpbmcgdGhhdCBpdCBpcyBub3QgaW1wb3J0YW50LCBqdXN0IHNheWluZyB0aGF0
IEkgYW0gbm90IHRoZQ0KPiBhdWRpZW5jZSB0byBkaXNjdXNzIGl0Lg0KDQpJIGFtIGFyZ3Vpbmcg
dGhhdCB0aGUgRFRDIFNwZWMgMC40IGRvZXMgTk9UIG1hbmRhdGUgYW55IG9mIHRoZXNlIGFueSBv
ZiB0aGVzZQ0K4oCcY29vbGluZ19kZXZpY2XigJ0sIOKAnGRtYXPigJ0sIOKAnGh3bG9ja3PigJ0s
IOKAnGlvX2NoYW5uZWxz4oCdLCDigJxpb21tdXPigJ0sIOKAnG1ib3hlc+KAnSwgDQrigJxtc2lf
cGFyZW504oCdLCDigJxtdXhfY29udHJvbHPigJ0sIOKAnHBoeXPigJ0sIOKAnHBvd2VyX2RvbWFp
bnPigJ0sIOKAnHB3bXPigJ0sIOKAnHJlc2V0c+KAnSwgDQrigJxjbG9ja3PigJ0sICDigJxzb3Vu
ZF9kYWnigJ0gYW5kIOKAnHRoZXJtYWxfc2Vuc29yc+KAnSANCm11c3QgZm9sbG93IDxwaGFuZGxl
IGNlbGwg4oCmPi4gDQoNClRoaXMgaXMgb25seSBtYW5kYXRlZCBieSB0aGUgZHQtc2NoZW1hIGFz
IGZhciBhcyBJIHVuZGVyc3RhbmQsIHRoYXQgaXMgYSB1c2VkIGJ5IA0KTGludXgsIGJ1dCBub3Qg
WmVwaHlyIGFuZCB0aGUgRFRDIE1ha2luZyB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoaXMgaXMgdHJ1
ZSBmb3IgDQphbGwgc3lzdGVtcw0KDQpSZWdhcmRzDQpLeWxl
