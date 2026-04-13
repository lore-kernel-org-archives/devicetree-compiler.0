Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazolkn19010001.outbound.protection.outlook.com [52.103.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC53AC0DC;
	Mon, 13 Apr 2026 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069616; cv=fail; b=ZDJeOPbiTTVHLezMpj+fgOcqhzPeSXITOB4w2tjBZL73o3c7kNWNB+HM1gQWnC/8keXrPhuLjUkbDJ/ThPCkbKhNVmkPjLgst/5WqKbknTA9agzuysBe1AeB+8carA8CfnjyfML9EJneiDSfalHsLGgeH24IchoJ7hoWsDv7m7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069616; c=relaxed/simple;
	bh=5xLS8cY5AQPKVtmTAhGmO0MwD28vLagtBh5r0IybREc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EH98XI6B+avyYzj2m66fRe9nQ8JR2mfCzZjc/pIdn9IHzDGw4oBWSPNcevSuwDS5tKoTbeK85a0WKI83Wgbe+jax74ZckoSuud9zneW4Jk4tn+nHxD4uvjB2mwOsmdvhUqT1tXrs3xm7KuMLOHoYpoP2tXHuYj0gTKsDqIZ16Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=Pa3R1YAb; arc=fail smtp.client-ip=52.103.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Pa3R1YAb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WI1iJQLhx9WclSVxVl1Zfdu59IbeopeNZ5sRCz5h4EqhPksdDj0BUSr4iZV50uNt5yxGAA7bZYZOpr88tY5ywcNFg0MUuhXDnz48gmFDRf98njtZlZvvw2l1o7Gw0/5ogppLpCbd+KqScKOvtywNJws/ROqnkbgqXYfBmz4aqObMtRliE8v86W3Y4cy8E3A7WZprg6NEtsAGAbRLvP5QTw5Zxp8qqzvkzuP5oqK6Ou/0uzyUh1lWg/JLtsUocQP9vWi1UPlLRtvofcLBXLvOOAm2ToDza5AUJtouFxtWvrfLeYTXYuv6ohwJtPZwv4XQtKADeuc9oxn+I6zD53dMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xLS8cY5AQPKVtmTAhGmO0MwD28vLagtBh5r0IybREc=;
 b=xCtahuEFrHAYmQ0zRXuAnBKyRWZqdzpamehjK/4V7m+k3+y1nAszh5gByrMOvIYowpByXpbxbjpdR8iQTWakGzWQvU19vUWk0SnS7sU91Enrz6eZRnN1e/OD1zuIemkfkDfDjEWfldRi4tixbw+fAl7o/ZTlxrhn0PySPt0oHy6TBrH3/wPMxDmwKbLRgxbj8B81mKVZqAOdDddcdXYD6kvsfHKYycqVXVfMPQemliqNXOHhvP42HeX2ibF29YObXqZ2s1oOypuecvXOdndlNpi/7dccuKPpG5hKYIK8iZPBqe3N4rXMH9U5neeQnCqUWe6jOYGfp6FY/iVrMjdLzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xLS8cY5AQPKVtmTAhGmO0MwD28vLagtBh5r0IybREc=;
 b=Pa3R1YAb7IHTMGWUI3KlVNAsbeX+hkHs1w103s7gTc1UC9HlOZgc4I97StdNOI60je0yEwWwljDxkwFhTbw2iEX0I2Je7TFbA6FCf5PfGWcicw4s9tKqYibvZXx3V+9E6EpKfRfT6txcQ653wfFAa3DFnQ/hcBK+Bv3j8GYy4VlGXuVe16dTV3WlC1sGxN7mFC1PpFzqZejAJ13hN6O7z49WrVOGFifcAW/3L0YDKCeI9eEl8v6wLlY6NcnOEFANdQVisoAcrK9KhPEQ0EwfF/yEbV2ven1kf0kJufdxqJDwkIEGkWtcwXdpGVx3pVAkn8bNISiuqJRkYzcLzJa6xA==
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:285::14)
 by PAXP190MB1816.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:274::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:40:12 +0000
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac]) by GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 08:40:10 +0000
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
 AQHcyeGzLXiU0rQJNEOrDVQKAULcerXbYncAgAAQq4CAAB5ZAIAAEA+AgADqzQCAAAkrgIAADHmAgAAMeoA=
Date: Mon, 13 Apr 2026 08:40:10 +0000
Message-ID: <74FB5D90-08F5-422E-9DB2-A00E74E25422@hotmail.com>
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
 <20260412145144.4737fde6@bootlin.com>
 <D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
 <20260412173916.7a971a45@bootlin.com>
 <163D807F-0F83-4282-B182-7A18B124D3E6@hotmail.com>
 <00f0d18e-feba-45cd-af92-f737c9b965ef@kernel.org>
 <7F2DF84C-A010-4BCB-B973-D17BF58EDCF2@hotmail.com>
 <e3b4c7c4-64cd-494c-b2c5-fa71a7303038@kernel.org>
In-Reply-To: <e3b4c7c4-64cd-494c-b2c5-fa71a7303038@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXP190MB2509:EE_|PAXP190MB1816:EE_
x-ms-office365-filtering-correlation-id: 8ed17e23-c6d5-40bb-7f29-08de99384604
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|37011999003|25031999004|31061999003|51005399006|461199028|8062599012|8060799015|19110799012|40105399003|3412199025|440099028|10035399007|102099032|26121999003;
x-microsoft-antispam-message-info:
 =?utf-8?B?dXlVUHRDS3dSbDJnTUtzSWJQeWtXbXRNbm4zbFd2NTNRSzgvL09PUUs0R1JT?=
 =?utf-8?B?L1FoUFdseUtQTW1UeUd4RGtaTUdWdUpjUVU3UUdLUE0vem0rWnZYNldYUDVz?=
 =?utf-8?B?ZWZkaE9PTEVUbExlTmp5aHR3NVZKZkFrTXU3TnMwNy80UnBpMDJlTjZSbjJN?=
 =?utf-8?B?SVJMSXl0QkJ1MnIycWRWYmV1SHlzblk3dkROczdTVXJBS3NBL0trSVBLNmhB?=
 =?utf-8?B?MU01dFV2aTlheDhqdlIxOUoxM1hIdzJxdCtkdWVJWDQrUlF0YnFWckxXMFJT?=
 =?utf-8?B?VTA5TEZKTlV4ZjM0Ui91NktoWTRFNHJ2WmVFR21FSXpwMnQrRnhhRjNhbXVs?=
 =?utf-8?B?OWpuN1BJVmwwWjN4TGlJOTMvdld5cGN4S3MwblJxREo2VG9qNnhIaE9JNlJJ?=
 =?utf-8?B?Y2pMM0JMbWNmSzg0UVliWEpndjJaUml1V3lXOHhnTm5PSElBRVVxdUZpaUFw?=
 =?utf-8?B?SnB1YmtLQ2RLME1SZmNlTyt2VlJIOVhINmNya3NES3YzVUMzVU9xQ3FaeVgv?=
 =?utf-8?B?N29FdGlwQ2E5cFVyRzE5Rjd3M0tINEVxdjZqL09ubm5mU1dwRVpwb2VLNVht?=
 =?utf-8?B?cmNReEJhdjg0Z0h5TTVkQVZpZ09mVUR2ejlDR3NKamFBRkQ0cW9rd0x3T0oz?=
 =?utf-8?B?azZpNG8xd0VGUGVCWE9zTHNJWHQwdWx5VEQxckxvQ1Y5cUkyM2ttY1p0elUw?=
 =?utf-8?B?NC9VUFBSWFVtVjZIQjI4TEw5dUFXKzBmMjRnbUd0L1pSWlpZOVpsTmFOc2dX?=
 =?utf-8?B?b2V3TjY0V3dKcE1JMWt2ZUtMd2tmaEppdzBtMVlNME9rbzdGMmh1TDEvUXEr?=
 =?utf-8?B?ZHdnc0FjMEtSRGRSYXV0RkFtZC91S1Eza3F2Y3ErNWJHdFFXY0dyek9kaUU1?=
 =?utf-8?B?MnNZMFpaNUNTUUk4R2xkeWR1WlpVbzJSSTVBZVAzdFUvTWp1RGx2alh4bWRW?=
 =?utf-8?B?M2NBOFAvV044TVNlRTVLWENSdisvYnpHbmtKeVpCS0k3VitPdEc3V2NuamNM?=
 =?utf-8?B?MVorcVQ0Q24vYk05bjlTQklQSzliOWRueE5pNkMxTncwNDRGbklINUlQNHIx?=
 =?utf-8?B?RlVVV204eFlCVjB0eU1TdHBUREpKdU81OUlYODhtVVVMcVFzSFprZUdzTlZj?=
 =?utf-8?B?RGdhczdhellGQnFMMURJRkNYTHdkMlIxS2Z5MlNMdUpDMEFUd2pPeHRKa0kz?=
 =?utf-8?B?Qk42L3NSRk9Ed0tKYmxEZVVxTkphekhYd29xV1d0RWlkcW9vQm8zbUlPazBH?=
 =?utf-8?B?bjN4OW80NnhENTk3OVFYR2JDT3VnWW5aUzdIaXd3bEt6enRON3hJcERIbWVC?=
 =?utf-8?B?V3dENDZPMWg3azBiOUJodXFaVEJLdW1aSHhsaGs3NnJNSFB5Q25HdmJsR0tN?=
 =?utf-8?B?bk1tUTFiWk9LcHR2RDVtSHlDQ2NwSW41NmR6V0MyeGtWdWRTOWtqWThnWW4w?=
 =?utf-8?Q?eeMC4Tk9?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEVGQml5OE82NWFnSFBCQmQzdzdjR1JKMlJOMTVpc0ZlamdxZ1dMSHUxUXlR?=
 =?utf-8?B?bGk4UEc4aHpncHo3SU5jdFFOWlNodGtXSXR1aTkyQnhLTG81U3VRenNoREUz?=
 =?utf-8?B?a3Y0cEE5UU51S3BZa2dZWVVaTk0ySnEvR1R2cEdEajl6dVdrOTBwOFFqMlhB?=
 =?utf-8?B?ekhnZVNkNndzNDNDN0djMk03bHNUa09BYmk4NWNSaTlJUk9FVGNZT2ZnaU1F?=
 =?utf-8?B?MG1jd3BVMmg2VlhmSXNoM2RDTlZycE5YWElFMk9qbTBUVUNlS2xLanZhMmds?=
 =?utf-8?B?ZTFVcXJra1Q2NXNncjJOTWV5RldpNUcyYy9mQzhZOHExSnVDUnY1dEQ2MTZ2?=
 =?utf-8?B?QnFOTG1RclJWSExXRk10azdKNStMaVd1QlZOSzV2bXMvS2g2Q1VYOFkrUDZz?=
 =?utf-8?B?aC9QOE11WkN0cThBbDBBTElFaU1Pd2RoTUFUaXdjZGlHWTM4MDNVTVNCb3J0?=
 =?utf-8?B?TnBQRW10clByb1JteUM1N090cWNMTkhxMU41RzhUaUhzSkJvSFUrdTl5OTNW?=
 =?utf-8?B?OXNxV1RFSnBXMDJXcXBybTNCQ1psaWRuZ2ZwVE04QmtSQWlOZnRWd21Tb2hj?=
 =?utf-8?B?ZExOaDRYL3lyRytsUC8yc1BMYjdzUEpUeFpnU3NSQUxBZk5wdEtPSlk2WlEy?=
 =?utf-8?B?N1c3MjVtcVcwcXJYc2RHdjJDQTJNZnVXdTd2VmsrT0NJcDF0NUpaQ2JPNjhL?=
 =?utf-8?B?WHJlZzNtVUI0c3Exd0hRdnIyWjZha3ZrTjdJbzMwK1VWWER5OWFCRVFoa1ZW?=
 =?utf-8?B?SkVqNkdlM1NyQ3BSWWEyTUNDZzdqYUgydklWVllPa1NraGQraWtURERHZ1NM?=
 =?utf-8?B?UTlkdktMdFhOV2E5NXVMM1ZkYTlaUVA3UkxEbDE2aFpHWW91b2Z4SkFPQnRT?=
 =?utf-8?B?UFE3czhCVElSTHozMFRNejU3Ry9KdmZuVXBUL3BVcWsxWGkya0NlV0xLYXpo?=
 =?utf-8?B?UUxwYU9yaUdidkt0V01iVW5kK0ZUZGJZY3ovUEh3VjQ0R2dGRkh1aTR1bURu?=
 =?utf-8?B?K1NaZ3hjajBWTnR3VEdaNGZTNVVSdm82V0JQWUZ0cnhPalNEeVFkVTdlOCsw?=
 =?utf-8?B?YU93QWtPZGdqa0h5ckNrOXRuRXFBQVpGeFljdk1Edk5pZWwwM0hRV0c1d2Vl?=
 =?utf-8?B?QStnTVh5WWFXM1JMclcwUXJsNzlFdGZwb3VsV0hRbGpETzZMTHBJTTZKZmtM?=
 =?utf-8?B?ZVFSejJuNmJtbFIrRStKVlVLR1JYekh3QmRpNlZCeWpiblR2NStyNjlsN3Zk?=
 =?utf-8?B?YzB5WXZSdFNFTCs2U1duSkRSSW10cE9WT0JIaWQvZ1MybXdrbWR3dWxVSDNa?=
 =?utf-8?B?RzliVStiTmhjWUFvdjdtMGwreHhDMWd1NmZzcWtiTS95QkFzZnZJWXdpKzll?=
 =?utf-8?B?YmZjNUYwVVAza1FmcTBDYXVvd1h4SmRhRnRkK3pUbWtuMHlwTy9sSmZ1NmR3?=
 =?utf-8?B?M1F6THZrdGVYR2t4cDFyTzFXNGkzT1lEUDVqTDNHbkt2YUk2Q0Z2WHZPRFZ0?=
 =?utf-8?B?L09Fd3Z0TUFxNk92UGNiQU01K3BDeXJySWMxdmpJeVJlRjRaYWI2d2Z3V05p?=
 =?utf-8?B?aXgzTGdmcUZ0WXFRekNUU2ovcWZYbFlBbmhVYkRCU3ZYc1BVRFJvNDlndGxz?=
 =?utf-8?B?ZW5DTVNxVXhyMjNqZ0Z3dXFQcXNNS25Gak51MnAreklxMC9RNXREQkgvTWhq?=
 =?utf-8?B?VjFkVG0xcVlWQWhoOG9CMTExZjFXL1R5VFBmMFZuNDh2RllTdUdIVTRQczJG?=
 =?utf-8?B?Wi9CdGVrRUVpQllHb0xYTVVEeXlwbzFBWDZoV0d1R250bDlPSm5HRUpWcjE5?=
 =?utf-8?B?aTF5T2pia0N4MHRCeHdrSnN3TWdjOWI1M092cmtvTVQyV096blB2UFFZck1S?=
 =?utf-8?B?WERFZkg3d1IxNUdKQ091V29kT29zT2tVWW5tWk1PQWUvb1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C98E2808717BB349A8F11DC5C1BE28AA@EURP190.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed17e23-c6d5-40bb-7f29-08de99384604
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 08:40:10.4523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP190MB1816

DQo+IFBsZWFzZSB3cmFwIHlvdXIgZW1haWwgcmVzcG9uc2VzIHRvIG1haWxpbmcgbGlzdCBzdHls
ZS4NCg0KSG9wZSBJIGdvdCB0aGlzIHBhcnQgcmlnaHQgaW4gdGhpcyBlbWFpbCENCg0KPiBUbyBy
ZXBlYXQgbXkgcXVlc3Rpb246DQo+IFdoYXQgZG9lcyAnMScgc3RhbmQgZm9yPw0KDQrigJgxJyB3
YXMganVzdCBhbiByYW5kb20gdmFsdWUgdG8gc2hvdyB0aGUgaXNzdWUuIFBsZWFzZSBub3RlIHRo
YXQgDQp0aGlzIGlzc3VlIGhhcyBtb3JlIGNvbnRleHQuIFRoaXMgY2FuIGFsbCBiZSBmb3VuZCB0
aW4gdGhlIFplcGh5ciBpc3N1ZSANCmh0dHBzOi8vZ2l0aHViLmNvbS96ZXBoeXJwcm9qZWN0LXJ0
b3MvemVwaHlyL2lzc3Vlcy8xMDcwNjYgDQpBbmQgYWxzbyBvbiB0aGUgZGlzY29yZCBsaW5rLg0K
DQpUbyBzdW1tYXJpemUsIEluIHplcGh5ciB0aGUgZHRzIGlzIHBpY2tsZWQgdG8gYSBoZWFkZXIg
ZmlsZSBvbg0KY29tcGlsZS4gWmVwaHlyIGJ1aWxkIHN5c3RlbSB1c2VzIHRoZSBiaW5kaW5ncyB0
byBkZXRlcm1pbmUgdHlwZXMuDQpBbnkgcHJvcGVydHkgd2l0aCBubyB0eXBlIHdpbGwgbm90IGJl
IHBpY2tsZWQuIA0KDQpgL3plcGh5cix1c2VyYCBub2RlIGlzIGEgY29udmVuaWVuY2Ugbm9kZSB0
aGF0IGRvZXMgbm90IG5lZWQgYSBiaW5kaW5nDQpBbmQgdHlwZXMgYXJlIGluZmVycmVkIGZyb20g
dmFsdWVzIG5vdCBwcm9wZXJ0eSBuYW1lcy4NCg0KVGhlIHJlcG9ydGVkIGlzc3VlczoNCi0gWmVw
aHlyIGlzIGluZmVycmluZyBhIHR5cGUgYnV0IHRoZSBEVEMgY29tcGlsZXIgaXMgaW5mZXJyaW5n
IGFub3RoZXINCnR5cGUgYW5kIHJlcG9ydGluZyB3IHdhcmluZyBhYm91dCBpdCBpbiB0aGUgYnVp
bGQgb3V0cHV0DQotIFplcGh5ciBkb2VzIG5vdCBpbmZlciB0eXBlcyBmb3IgcHJvcGVydGllcyB3
aXRoIG5vIGJpbmRpbmdzLCBoZW5jZSANCklmIGFueSBvZiBtZW50aW9uIHByb3BlcnRpZXMgYXJl
IHVzZWQgYW5kIG5vZGUgaGFzIG5vIGJpbmRpbmcgZm9yDQp0aGF0IHByb3BlcnR5IG5hbWUsIHpl
cGh5ciB3aWxsIGlnbm9yZSB0aGlzLCBidXQgdGhlIERUQyByZXBvcnRzIGENCndhcm5pbmcgdGhh
dCBjb250cmFkaWNzIFplcGh5cidzIGltcGxlbWVudGF0aW9uLg0KDQo=
