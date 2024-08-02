Received: from mx0f-0072c001.gpphosted.com (mx0f-0072c001.gpphosted.com [67.231.155.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E598175D4B
	for <devicetree-compiler@vger.kernel.org>; Fri,  2 Aug 2024 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.155.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722613815; cv=fail; b=m/K/2HvMMfjHJbHw1uo2J8YYDAfEmYWPKv7Qxror1+M+tq8pjed46IGOJ3RQmviQHNsmFKpyJIk4zwLk6LMR/xXiFbKvTh/YNlKQQ6SHtNDEYaBtvIM9hqZ0iVD/utnWwTTlwJ5n7lR5tm6z10JLWVBVYhxlbCnkPfVWhCLmTE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722613815; c=relaxed/simple;
	bh=sqXXphOBm78nd+XgCe76nVSsjvmzhwgrspPjiSXZx1U=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gu0hGv+vOUZ/wkvKHfrdv2iZ/XTWKmMvoZmBRTnVS8T8ID/0UdUTmFRY0F225Zgnu7uLju95AueI0vPPGxOkB1RgFuN8DRfXDU33M1WLWjsUUDQVA+PDli6y+sSSSvnM4kMmOcymqAkM3FQPdPHPduvEXrELu4Yxc6ZK4+/HT5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arcfield.com; spf=pass smtp.mailfrom=arcfield.com; dkim=pass (2048-bit key) header.d=arcfield.com header.i=@arcfield.com header.b=D1sGTiV8; arc=fail smtp.client-ip=67.231.155.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arcfield.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arcfield.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arcfield.com header.i=@arcfield.com header.b="D1sGTiV8"
Received: from pps.filterd (m0294116.ppops.net [127.0.0.1])
	by mx0e-0072c001.gpphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 472CdBj1008778
	for <devicetree-compiler@vger.kernel.org>; Fri, 2 Aug 2024 15:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcfield.com; h=from : to : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=2-22; bh=ihoBLcsu7lwgQzWJOokAW4ra1p68IDM9TeNsb7SbNLQ=;
 b=D1sGTiV8D69ZkOQ+oMCes8ykpKi7LMuoDH9QC0+m0lcx4nuDW8IwRsXqv7UyMBvHdxyg
 Z15M3m1A99Yawm0N0fEYL34lgLcVKhrJTXHFUivN7/SYBAKw9xedy4wQl967Kue/6MjV
 /amOL1O79Ejj8b5DVdXhxNaAm0fSvNbBoTT2GEbjqBv8n7y4eLEHEVfDqpVo1Rub14+F
 OruGNGg+0FlFvKZ0n/48FSxZSaZGLH9ybcSxeBGuXYYXcHShDtpG4kfoO0mmfLjkW+Rr
 Wvai2mMLFmw3a5+KBCkYCbCi6c0TJeE6S+/LgLy0Qp2UvXmq25W5Kwf2skyH7/Jxf/N8 mQ== 
Received: from usg02-cy1-obe.outbound.protection.office365.us (mail-cy1usg02lp0183.outbound.protection.office365.us [23.103.199.183])
	by mx0e-0072c001.gpphosted.com (PPS) with ESMTPS id 40rjcpga8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Fri, 02 Aug 2024 15:36:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=PFGq6rBadhVbjo6H9uHdBcBXXPHc95L//b92V5DlF+Zxgl1HyMeWU73oIG9ES9d6QEIpTV3NAYfWg0/zBA9FNUwmEzGFzSZp1UurYQNSpYvUs3waqC30BG6l9jpJmJPsutIH4CafosCsUmF5HWqu9jp8MMHBeY+p1iQxaR/m1/1AivStZAa3/YqMpgy/Ivf7AJDFrIaFX2aCfqgm4cVCvQv0D8Cq+TMMHTA3YZjjQ51QkyTEGRepedq+uRPJNNJPdud3qorYI1ejdEObemOprgsrdDCYN7rHjy3EqAfBlr8WbvSE7VPBXc3LXThi+uoT6BoOHRG0cKdP+YQIMELPzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihoBLcsu7lwgQzWJOokAW4ra1p68IDM9TeNsb7SbNLQ=;
 b=We9rr8aZr1gsR2h6IsH5uJVQID8cxobbhcEwlqWNRZNqVfw8WewWc4XQ8gA/LjJHj4aCmSTiNVuXTv/07yYQg6PIPz3FFdv8elv2KREwtyLlOoJmbBcFClKcWVefU3or2qsVnq9qPocXvlMLIPY1ocxxqqIyFVCgFEqbvKIfo+WOZ/bXD59eDY5XwbpbJafsMeEWahRCZfGlDOxssSuHAzdZ5p/O0OJo8+cl2nGXbv3h7BlYJfxs0FrKsa2wzPrqT7+u3XdbZ+zPBtGcoCAB3mpsyYEhG4Y/ib88Jkeq6WD5fXrLnLCdL0cVLHtW2iDPsSY9ARVuCwMJQ+nQUEbjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arcfield.com; dmarc=pass action=none header.from=arcfield.com;
 dkim=pass header.d=arcfield.com; arc=none
Received: from BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16a::14)
 by BN2P110MB1480.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.37; Fri, 2 Aug
 2024 15:36:43 +0000
Received: from BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5565:4d3:9a6c:eb85]) by BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5565:4d3:9a6c:eb85%6]) with mapi id 15.20.7784.035; Fri, 2 Aug 2024
 15:36:43 +0000
From: "Hoover, Erich (Orion)" <erich.hoover@arcfield.com>
To: "devicetree-compiler@vger.kernel.org"
	<devicetree-compiler@vger.kernel.org>
Subject: Array manipulation revisit
Thread-Topic: Array manipulation revisit
Thread-Index: AQHa5PBLcVH+q6+Ihkq6AuXL2rK5iQ==
Date: Fri, 2 Aug 2024 15:36:43 +0000
Message-ID:
 <BN2P110MB1058FB69969C91282858C8ECF5B3A@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_5301f6a5-d4a9-4086-88d6-5857a81cdb57_Enabled=True;MSIP_Label_5301f6a5-d4a9-4086-88d6-5857a81cdb57_SiteId=ff94c0a7-07cc-47df-8981-11dfddd57863;MSIP_Label_5301f6a5-d4a9-4086-88d6-5857a81cdb57_SetDate=2024-08-02T15:36:43.113Z;MSIP_Label_5301f6a5-d4a9-4086-88d6-5857a81cdb57_Name=Unrestricted;MSIP_Label_5301f6a5-d4a9-4086-88d6-5857a81cdb57_ContentBits=0;MSIP_Label_5301f6a5-d4a9-4086-88d6-5857a81cdb57_Method=Privileged;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1058:EE_|BN2P110MB1480:EE_
x-ms-office365-filtering-correlation-id: 09955d23-89af-4005-69bb-08dcb308e930
arcfieldproofpoint-x-header: T25seUlmSmlubnlBbGxvd3M=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7HU6L+x3CwhaTbvtwJ9RZX9Ij901TLT0bog/eZN1FOvSTw8aBIc/ESDY9P?=
 =?iso-8859-1?Q?VfTClDhiAQ49opzhVYqYpbGQLvSG0vrM/PJ3rVK0ECr5oZzmQiV/J6rHhg?=
 =?iso-8859-1?Q?Qd/cilxrOAkys/5fvThwuidrNPzhK7i6zJJu3ydnwhsYDCbs38muMrcegO?=
 =?iso-8859-1?Q?z6qZS8zcMUnt27AfGMO+r0Msvc3DDFNayt5J29ZcYQ8A20RYZBME187isE?=
 =?iso-8859-1?Q?86llHe+Ao+LxsQDoMR2AM9nblwIYSBFPEdOMBeeoSKuMY4PtvOMa7E4Fk1?=
 =?iso-8859-1?Q?ULOL/N3ghupozCI4tN4oiiWDe+Zo2vnTLK852M7LRXW5L6/H163HBoN+Yi?=
 =?iso-8859-1?Q?eUWQSScwzVj8b6HvJLJw8RThE5wpclA1YdBjO2PpFLVIv1LKi1xkz84q8C?=
 =?iso-8859-1?Q?UCkIVchAiknY4NPW0vVcnpB2OJVaI76ajlr6bvjPvijnHHgWYCrbE3uCAY?=
 =?iso-8859-1?Q?nXKZMXaCO4IDqC6z+qnVfVPxrvsNxfqaDEqmtvLlD9xyWbzxOPGRP8vJYn?=
 =?iso-8859-1?Q?XfQhb1ifHzlqRpUlILaeJKkTnhnHlvRzdCfhM8FcV0T+SE+U7FKSp2kSXV?=
 =?iso-8859-1?Q?/amo7MSa7+3xBSsN36I9v6lsadYvxHWy3sbuOruaUfmoMfnFzor/5dt44a?=
 =?iso-8859-1?Q?sJeMOiYvLKpKzx2YAQcPoWKTQ2JltvGn58EQV6Rz1WJ0W2y7ftAIYnFMkL?=
 =?iso-8859-1?Q?3xR3AJEigXPPW0Kjm5Qxi9mMDV+dPzYqLzqCKaXcy2peGSlg0W71WedXUC?=
 =?iso-8859-1?Q?6Pa+GH/4GK79Ly6fkM/1z91kw6XQCUHVevVBvsNWA02Ls/I1gi3LzhlnZd?=
 =?iso-8859-1?Q?ExLdypYFgQovbXheqo967KFR1KRuYrGqeTjgAXqiEHdOPIMMMHFpkTLMHj?=
 =?iso-8859-1?Q?mXVF2Ss1bkpKINhMQOnOKTZu7fkCiRTLruRY5clc2YRqBbKm2IPzrBfABa?=
 =?iso-8859-1?Q?r+9GLSO5iRgMtjUy6uwutCtsARG0xaooOtxHDQr/3iiOIjlvdgos5S/pac?=
 =?iso-8859-1?Q?Q8Hu9+kvzvLoLwDlDY5Y6ylJa5x/0TSc7NSS3ihy9b3Ns3WNUMNUys4F/3?=
 =?iso-8859-1?Q?rJ39H+Yuu5o4ZMR0MBfQMwyJv4k5NAuXIH94G1bWif8TcqXenWH/bxm8mN?=
 =?iso-8859-1?Q?yMOWoCpH2MKvfql/L0REcQ5jPOCXxumkCNQZH6KMwrps82utniiItDSCuG?=
 =?iso-8859-1?Q?tD+/C9Zlmdl+SNUpd05iIk4Cksyv1DslLt4rPe3SP+HNgQpM2TJb34X5It?=
 =?iso-8859-1?Q?gf/ArlPqBTZsSOm++4UYespPZrUfke2QySCQchQ/61rcnERG4G0dFB//2J?=
 =?iso-8859-1?Q?BwQ6Dv5I6trG393vMlmAfGl2QJOAWcOWzxp2/WH4jtDLuu+2nJWRDBNknE?=
 =?iso-8859-1?Q?hmhkug2C3C2LAxWaXxFXfHFiDCTBafiEwvZDvF0Vv0ChrFwTyrUz4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?N0exfpK6wNzG4mu34C2ZP1sRTSx7dLQIDzdRIOqesF6yd/RhoeY26p8P/C?=
 =?iso-8859-1?Q?6kLTzkOa/2mrewTVtJ9SXWDEAoy6+/Yro/1S5k61xf3Aht7yI0BA5Tqo/g?=
 =?iso-8859-1?Q?vWVy42FgicegbsPk3wqOts0ANRUdBYqTEe23LQGGcixaQX85sXX8e99Jri?=
 =?iso-8859-1?Q?8FA+/z7JbbMxO4GRPU0HgPzRHXliqUBYxfZyswHTiBzMlRVt3DgU48vkym?=
 =?iso-8859-1?Q?9ImQPX4QUQG54Tx79GAmo++xLG9Wn0JfEmvlh8dVb02bhkkfrkXpltiSSA?=
 =?iso-8859-1?Q?94chcFnkXsBOhEZBH0KGOvhsioX87LtkJCol7izEAd4zgt7aXGJBojobl4?=
 =?iso-8859-1?Q?G0MfX6ZZ91n/4MwnSSQz6dkLAS9MEnqT6miCbDBol/Rc7hHEkrfSNw1IU9?=
 =?iso-8859-1?Q?fVE9oMzjMcpgKHuilXRqw1r86yNNMtGLbGLSarXSydjQH0GeRWbIu9dJ/1?=
 =?iso-8859-1?Q?b6rCSHrzBOjcc9zIb5xUXkmdS+45HqXSGuKRjJuuyDT+/H6zxb/3Ma08Qs?=
 =?iso-8859-1?Q?w87cYXoDPfCy0LD4zPexyFepr8ATyLxCle+Yn7dwKd+grqwKvYM2E0nBSo?=
 =?iso-8859-1?Q?2W8i5YLz/lmtfUXm6mDbz96L6kkaJFzGfAiIAHb/YgpaL7sBtEG6gxAWTM?=
 =?iso-8859-1?Q?Azk0rBz1P++ykmpaz0Dxo8nQwIAWQV9HcjNYK1V/ZIYVh9jZYwwzOn5LjE?=
 =?iso-8859-1?Q?EsqnqWDSbWZXLZdXACsWoJZdC1BP+9W5ZGBDrf1Q4X7O5fiMSBZHfYkvjq?=
 =?iso-8859-1?Q?UzIZrfOpj2B3+i+szdTKhNmXjIR0w5t/TY5l4QpSkQvAwhsI0863zlSdfe?=
 =?iso-8859-1?Q?n/7CrOxtl9efSwPUQK20vD+houLp9fU5CidYxAGOWjvHST8K3vEKq+iHwH?=
 =?iso-8859-1?Q?YwgcY4fgVtu1C3dJP6Mu6Wxj5y+f9JUuUX271tcph7WAiRag/QXHszcnjN?=
 =?iso-8859-1?Q?eampKnBEZw2PV7ywBCCqhvGs48nbUTieqlvn+NnNToTJYh8CaR5khD9kTB?=
 =?iso-8859-1?Q?JUTYEUl/wrdWZ7mUezEc1ZwgxFFMVPcw/Szo1XO5iOMj9zPPq3hz1sj+sQ?=
 =?iso-8859-1?Q?EGpEwNC8hPdas+fRQ9tPvPg6Do6f0Ldv/ZJ7WOlcnatPQWM6WKkCiY2ljs?=
 =?iso-8859-1?Q?f4eoA4Wrpax6aVoxtKmc9zTVgJs0RNpIqykRclOatbV1Prnuim7aX1W5h6?=
 =?iso-8859-1?Q?87NgT+dAer1iSHk/RgFjmNwXF3ICGdqASIgeDfLt/xdpcDbsSB/e6ScjeP?=
 =?iso-8859-1?Q?2qMIIoO3FM1oEkg4UWbCdQf4sT8ishU7UiLeMN2aw8EhEjl4W86H3iQITW?=
 =?iso-8859-1?Q?nYVTSJapSDR/KFw5FlnNgWcVEsJU2ar8bYNxit8mZGFeW942fqiErumzkL?=
 =?iso-8859-1?Q?5ayejyJ8hNz4YL37mZ7mvOy6YqIgJrcIcmhi9DebTZJyKXvgJ7yeqae+Af?=
 =?iso-8859-1?Q?U2nPCNNnpnV29MSN3AxutmT1aAAMRnr5IPpZCmZ2mHBZ2G7NWBQZxi7T/r?=
 =?iso-8859-1?Q?P75dGqbHnc7XL+c+x6PC+D7upDf5xeOYzx8xuP2+Ce9tMyfBOzL9ESma/a?=
 =?iso-8859-1?Q?nTdecYw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: arcfield.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 09955d23-89af-4005-69bb-08dcb308e930
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 15:36:43.2554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff94c0a7-07cc-47df-8981-11dfddd57863
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1480
X-Proofpoint-GUID: CmX5esEoS7_YFNLu4_CD88L8TnN6myoS
X-Proofpoint-ORIG-GUID: CmX5esEoS7_YFNLu4_CD88L8TnN6myoS
X-Proofpoint-Virus-Version: vendor=nai engine=6700 definitions=11152 signatures=596817
X-Proofpoint-Spam-Reason: orgsafe

I saw this old thread on array manipulation:=0A=
    https://www.spinics.net/lists/devicetree-compiler/msg02575.html=0A=
and was wondering if anything got implemented to handle arrays and I'm just=
 not finding it.=0A=
=0A=
For most cases I've encountered there are workarounds for dealing with the =
arrays, but I'd like to figure out a way to update GPIO line names from an =
overlay.  Example:=0A=
=0A=
&gpio {=0A=
	gpio-line-names =3D=0A=
		"QSPI_CLK", /* GPIO0 (example, not always the same) */=0A=
		"QSPI_DQ1", /* GPIO1 (example, not always the same) */=0A=
		"QSPI_DQ2", /* GPIO2 (example, not always the same) */=0A=
		"QSPI_DQ3", /* GPIO3 (example, not always the same) */=0A=
		"QSPI_DQ0", /* GPIO4 (example, not always the same) */=0A=
		"QSPI_CS_B", /* GPIO5 (example, not always the same) */=0A=
		/* ... */=0A=
		"GPIO_MUX_SEL0", /* GPIO148 (thing to add) */=0A=
		"GPIO_MUX_SEL1", /* GPIO149 (thing to add) */=0A=
		/* ... */=0A=
	};=0A=
};=0A=
=0A=
What I'm looking at is that I have several layers of device tree informatio=
n:=0A=
    1) shared-based-device.dtb=0A=
    2) fpga-overlay.dtbo (different for every device)=0A=
    3) config-specific-overlay.dtbo=0A=
=0A=
When all of this information is integrated into a single tree I can use #de=
fines to set names for all the pins and then write out the pin information =
all at once (though this is a little painful, since it requires a #define f=
or each pin).  However, when this information is in an overlay I need to kn=
ow what the current contents are to replace things properly.  So, what I wo=
uld _like_ to be able to do is something like this:=0A=
=0A=
&gpio {=0A=
	gpio-line-names[148] =3D "GPIO_MUX_SEL0";=0A=
	gpio-line-names[149] =3D "GPIO_MUX_SEL1";=0A=
};=0A=
=0A=
Then when the overlay is applied what I would expect to happen would be for=
 libfdt to read the existing value, find and replace the specified indices,=
 and then set the full property with the new value.  Is this totally crazy?=
  Is there already a better way to do this?=0A=
=0A=
Best,=0A=
Erich E. Hoover, Ph.D.=0A=
erich.hoover@arcfield.com=
