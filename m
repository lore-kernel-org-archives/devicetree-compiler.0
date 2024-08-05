Received: from mx0f-0072c001.gpphosted.com (mx0f-0072c001.gpphosted.com [67.231.155.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA33980C04
	for <devicetree-compiler@vger.kernel.org>; Mon,  5 Aug 2024 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.155.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722875753; cv=fail; b=bobTJtOLn1Y0ctRf3K+N7ZydoPd76e3d4cK6SDqOusW1hPsAfqGCYUwAHIAHbGrojh+2sqyzQxpqEJp+H5M7ZSiD7alEJeQI2q1BOBcHs8w09ENxrII+weqf9Z5V05ouukKLd+AZOsDxTfzTT7kXim/P21Hqfwe8XVdJpUT+e5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722875753; c=relaxed/simple;
	bh=QfWRp3o+OvQaTBsDHgr/E0Z9ezGCZzMY52aJJt5gj78=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PrId8DOHFGcYnbk48lAnw0Dgz6kNd73tW31Hm7Fl188RLY9ODuRfzoy4fJKv75wNYQmnpTyuZWgHMZt36nheGRtcC4N3Cr3wgKG/KL6RQTL/LPK8+QgpMrpmYL6pshqZHBXTM93lCH404So6h5ymeP4Lm0mYwW3Eel1lmWsJBQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arcfield.com; spf=pass smtp.mailfrom=arcfield.com; dkim=pass (2048-bit key) header.d=arcfield.com header.i=@arcfield.com header.b=GHhovapU; arc=fail smtp.client-ip=67.231.155.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arcfield.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arcfield.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arcfield.com header.i=@arcfield.com header.b="GHhovapU"
Received: from pps.filterd (m0294116.ppops.net [127.0.0.1])
	by mx0e-0072c001.gpphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 475BIYWN022311;
	Mon, 5 Aug 2024 16:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcfield.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=2-22;
 bh=kdqtlDJIca9+COJhTNpfCXBS9u7WWHKuuB+gmesqY3c=;
 b=GHhovapUmDeIr4lNcz+92i6KtK3l81wfnhWtXO8Qemx+xJP1uGsB5DFGe1NMBh7eXI1q
 Gh1vJEKE/xzwNaTJ3KMOgJHQ/Tm55XUlIpzY7vSn4ofwLmdw3J7uW0/7g8vt2xAba10D
 4t5gOjO6hFG4u4ko36Nl9sc5ezBYBF1egSMXCO6nUb+Q4nNDiGTIVbleQ89MCZv3iMDO
 eSAZfp7S3NswDcU5w5fymP44XRVJFhzknVyrSQYepeySszlZmIRTQT54JutBu5AM+cN2
 oaNRFlUFAwD5H6hg4tycuuVxUW6Fo3KhlynqughZZmWSt1tPChv4ZpHNfgtVa8CUv+p0 4w== 
Received: from usg02-bn3-obe.outbound.protection.office365.us (mail-bn3usg02lp0150.outbound.protection.office365.us [23.103.199.150])
	by mx0e-0072c001.gpphosted.com (PPS) with ESMTPS id 40sc6bgyrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 16:35:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=MIi6HFdQCUry29ZNwBHR2qVp4AAV84iZmVLY/36rITETLlITr8LzX2c5BQwiCkxCy/7EypfjUXtUuQdCFdySMB0b9qgKYayqLqZ2kB6O4b/Te89OlZglExiW06fv2qC2CkVVSlmSf1qyfGFZsMW2c9Ttx2mGJPudhvZIOAre1O/kpDDJbW6uYvixUdtxyP1CnSrN1Fbj9hd7vsSIKT3LyiYw0U7alziYDUcS7dWEy/JyaCj5Yq+mxTDhBqXjMRPtlwguH6cKubC5upl1huGkEO2FC4rYswCKYbu2+iG3FwKwBiu2WZHsABhtLxwezlxukQ6ioQblnRbm9+pqxuMgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdqtlDJIca9+COJhTNpfCXBS9u7WWHKuuB+gmesqY3c=;
 b=WztaFcDnJpR0xgX9s2nOPc9kQOYiPRsGqnFuuz9DrBB3piUJ2cnERU2VEJVFiFHyomQgSTkXWFHlD0kDTGi1cvwBnHmFzfqjBFkYUUemGAEvMwz5osKK39JP2zXJwOCAAuxXATBNAVfH7iuYFqG35+w1S+xzv3JzkgDBb08yGHTDsB1orNLfpdFC3vlI20Fj97zuo/+8X/tr+1AMDxqqgaB3WGdm4US8pjghWqwZPArwkQtJStjSs1ynOpZYpAE+2lUiQ2Sfcnj7mjysrqsSkm+JRVo6meEqansbwj7EOS1eC6ac9H481NgPz9q57KaPBAv3wDx5ROZKi2FbogL/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arcfield.com; dmarc=pass action=none header.from=arcfield.com;
 dkim=pass header.d=arcfield.com; arc=none
Received: from BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16a::14)
 by BN2P110MB1606.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:178::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.37; Mon, 5 Aug
 2024 16:35:14 +0000
Received: from BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5565:4d3:9a6c:eb85]) by BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5565:4d3:9a6c:eb85%6]) with mapi id 15.20.7784.035; Mon, 5 Aug 2024
 16:35:14 +0000
From: "Hoover, Erich (Orion)" <erich.hoover@arcfield.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: "devicetree-compiler@vger.kernel.org"
	<devicetree-compiler@vger.kernel.org>
Subject: Re: Array manipulation revisit
Thread-Topic: Array manipulation revisit
Thread-Index: AQHa51Vypyte3j8OpkK2fEH+YSSWUA==
Date: Mon, 5 Aug 2024 16:35:14 +0000
Message-ID:
 <BN2P110MB105818EC9B379BD63B261E20F5BEA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN2P110MB1058FB69969C91282858C8ECF5B3A@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <Zq3QIVrmUTTc4gjC@zatzit>
In-Reply-To: <Zq3QIVrmUTTc4gjC@zatzit>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1058:EE_|BN2P110MB1606:EE_
x-ms-office365-filtering-correlation-id: 7e807bc4-5782-4996-5c9e-08dcb56c9513
arcfieldproofpoint-x-header: T25seUlmSmlubnlBbGxvd3M=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9Zsld1vmptFSxmFhD9NFasaCOPtuEELT8Pu0RhHLtcpeTLYZxLUplFv5k7?=
 =?iso-8859-1?Q?R4ZQ50SebMHc5E4IpnOa0guL7E1RtyH2YRSnvuds2dgBTFUtYwlV2jedaz?=
 =?iso-8859-1?Q?b2zjH8QNCWadxBy8+PsuIpvnQoeLDIQN4LhfOympW7pUcGOjps9q4tI+KQ?=
 =?iso-8859-1?Q?Cd6hB5VmIRaEeaPY6sHHgjEpG3rjlCc5Tn0fs5RwkSdCuMMpz+eh1XwFea?=
 =?iso-8859-1?Q?DwX7NUU0Q/NGU03CiILj7V6+56mxnTqnCdoxOo0+We7318EZdffw+Ll3L3?=
 =?iso-8859-1?Q?CqNvEaXa1hh/UjLQJcqgGxlyM3E8NlcctSV7Xo6TUSgJ1cQKLFNhqizvCS?=
 =?iso-8859-1?Q?fYvR3SuwSC27s00s60vXVJ7+H2OBWKeURmH6R8llummFeC3oiy+p5b4zh5?=
 =?iso-8859-1?Q?lWgtyGji03CxrF6h3vkZ7cVBVh5aCkIzCzhApqdFC6rta4p0tW20LY7M7U?=
 =?iso-8859-1?Q?kzpK9h8Yc5/ZHOyvT57uZzpDGRaJnHiMnfd0qg0IKjzxvBzMSA+loFcG6A?=
 =?iso-8859-1?Q?TVWbzQhBluIj13hoL53lv/YCpKmRV16b+TXSrc4TFSBYsuFsKGQnKxCqGJ?=
 =?iso-8859-1?Q?GIRrxtSJ2n40HhrG6mpJo2ZR/fUnKDXp91M/MN/s4RBXk1QcleFMfh54xN?=
 =?iso-8859-1?Q?9dL1AIABUJlveLf74rhnl+fcXJKHLM6GawMulN9rv6xs3Br82HKvtVf58H?=
 =?iso-8859-1?Q?4mYRwvJ+/GdntPqCJbaEEJNRT4A2+tn2CsGJt/luDf7Wd2sA3myvDQHyBs?=
 =?iso-8859-1?Q?PeZEjHFgYIod51159uHl6RdGCpwgC+2zH51fnCSZJscLEAeYoNbmXiofkt?=
 =?iso-8859-1?Q?2xa6v3WRc4NiH0TL4ELc6Gd/M8zr5Q9yjA8UufY3B0yoM5my7DILfAQCjF?=
 =?iso-8859-1?Q?Q/RECma8w46g8mVTja5yzxvVxOks7Ky3mSZCYRHd9VQPZYc73Zl87+VN9e?=
 =?iso-8859-1?Q?YIaF6Yj3fLXyoN3dhnTTX0Wo9BUr9p8P/747EkauUEdOuKBJ07geQnueI2?=
 =?iso-8859-1?Q?dg642Lj+bKe9bE6JKR7AA1QwnViG14wJvdjf/fWOAnm2wKltk23BXLS/iq?=
 =?iso-8859-1?Q?taEfEEup8CorZ4YyfXuQnKb23kGOdn0clmzLKQpX+vaj8vjjSozdd0ybfy?=
 =?iso-8859-1?Q?jsuXShLlJLY4/djjz7QWSdVdBe55yh5EGyKdekawFXk+v+Vc/T3gXD21n1?=
 =?iso-8859-1?Q?98ljZeEjIRDRxDJ7NWConyBlFP75LXOYou4g0Xm7LTPX53RLb5jIcgp0pI?=
 =?iso-8859-1?Q?51YoC2R57gJz0Of5RMU8ipMuODLMzvfGMU4VFLd+gsz2UOmLdRlgaivZjr?=
 =?iso-8859-1?Q?DSAJyflOpPhUnZgIOsZJ4AEja0pIUGmfeM7cICLhn0V9TyBHg6ZX54Kj5V?=
 =?iso-8859-1?Q?YCKPANnO0WgyyqtSnOAGLmZS9CILv1QW/l6vziBgGI9QxSEGMPkkEKgrbJ?=
 =?iso-8859-1?Q?UeGFvDuMbPq+XhSf1+P/Hjcpg87Cmyz3u/QIdA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nbi6R5/pOxTKKBdG6BveUAprfTvrbleEAYAoyNCLlBJqugGIY7/kgOufRP?=
 =?iso-8859-1?Q?zRW+zlnfHKHH96/P1iGtQ6Da5HQw4kK+lIdKiOAPCSth19ynVFmi8m+wjz?=
 =?iso-8859-1?Q?vZOso3InVMvL+sPf3NineZO+WRztWWXbABIxwY5+UK6SJfoIoqinRJ9Huj?=
 =?iso-8859-1?Q?1P8VCawFllC0dTPCob6hQdgCedOHVIWP1I3zcOhkqOC3hPaaf9Gfre+rpJ?=
 =?iso-8859-1?Q?fExED6mYYex8icv2Tu6sF2aKObaJWetfxSYfrymS/A6OtQIr9dD8LDHEeZ?=
 =?iso-8859-1?Q?b2hAWcq5uFELwkNVoQSlL2d9bnpNiDFHEKtALqDkBhHuWL7B0CjvI7RCbR?=
 =?iso-8859-1?Q?QTl/rbx4E7COLxyqIkybwHFdGCqJYAE7XeEVl3VnlrIR8Y9Kh9BSyCt2eq?=
 =?iso-8859-1?Q?WXUml/tSn3VwA0Kd2pYwU5inzV9ujjHvexabXkTSIxaeDyY6qh3bGgcV/g?=
 =?iso-8859-1?Q?vBI8nvjGy59SW2b3OwOHCCA9zaudGbCx4QPOuVR/zJycyWIT5MRDsXLz+t?=
 =?iso-8859-1?Q?N6NYZLAQf0TMyJ/pz5DO22RfyPxXa5HU6FawHyUwEqlmRec9dEWZVzt8so?=
 =?iso-8859-1?Q?8KuYEBjwW+Mi8HQHztLrylQ269BZ6N3EOMyIQd6XTqMuZuSeouhdZXGoIj?=
 =?iso-8859-1?Q?L1uZlwf2uY7EWAGhjAxw9MgwOYfois6zUeaVXeeLqzQQF1uUtr9hEscALf?=
 =?iso-8859-1?Q?C0BUSPSGmx69bqVQpgJnvhj/Tpgn3sUTvKEY0S3W51n7pQrTpxgnRi9kDb?=
 =?iso-8859-1?Q?nsjQfvCyPrMkw10AbkQCfpZL8xzd0rpXBvFKrn2pBBcm4Ko5Fryt7UMVh/?=
 =?iso-8859-1?Q?cZhs3I89YMoh+mFeZLm6I8TcwLHHXvYqyf/6lummAQTFR5Jz1VKU3xMTsa?=
 =?iso-8859-1?Q?Rkq50k9iORXm4+AXiE9bSloCYGvs4adFGLJ0TeaDWxqZMkhlItYTJchdMV?=
 =?iso-8859-1?Q?X6i7JD4EgD+OrGpNQueyz6/4mTELkCN2JFqF1BQLbiWmyvk1vso8T4C7QW?=
 =?iso-8859-1?Q?KIdt/A4Ki2arUeBIM+NQyURJSqV343Hshyu8pcCWZil3cftonRs/Yxv0IR?=
 =?iso-8859-1?Q?pbCKSTl0HtURDm4DaYsdnBxjeSiCJGloe9FCpl1RI7g4GH6E/6oPsAWvUe?=
 =?iso-8859-1?Q?shWbWiKwvmMIMo9Mni+ikT94esOh8K2tx6IO7hg/wM2Bz4FUR30kSDoX7C?=
 =?iso-8859-1?Q?x8kIavICGY301g9fPjPBjsraijkInecVvHa9mHcPuzDRl077R6+N+chp6n?=
 =?iso-8859-1?Q?6bHTj1FUyLCJ7ShPp2QO9ifJdpgZEeFE9M3am8J+qR94bVRO5YqKmkpkyS?=
 =?iso-8859-1?Q?/Lphu+vY+gFhl6NVlJIQsXX0B9j2wgU67d4C8Tld2v6C5ZH5ooiKJg9E8e?=
 =?iso-8859-1?Q?ZVVrL5yC6Y3v64lhQIVVjaEOK+TDPr/eUJVGfczLTgdBkQlECU2DBkXIyo?=
 =?iso-8859-1?Q?NpFVY4MASJaMQY4Nw8IxkYDrK83UrkXXbyHZEjWYSD8hcPFkAggci7L2C8?=
 =?iso-8859-1?Q?I0C/WSwkemorPF4gnXyUWiqiWdNuGhRsKEiX7f9FHxipJhFH+NvSKjFdNs?=
 =?iso-8859-1?Q?hyYG5e4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e807bc4-5782-4996-5c9e-08dcb56c9513
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 16:35:14.1596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff94c0a7-07cc-47df-8981-11dfddd57863
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1606
X-Proofpoint-GUID: XZroiOl7sBgZMFtlL3Mj8VGiHUmaeTVR
X-Proofpoint-ORIG-GUID: XZroiOl7sBgZMFtlL3Mj8VGiHUmaeTVR
X-Proofpoint-Virus-Version: vendor=nai engine=6700 definitions=11155 signatures=596817
X-Proofpoint-Spam-Reason: orgsafe

> From:=A0David Gibson=0A=
> Sent:=A0Saturday, August 3, 2024 12:37 AM=0A=
> ...=0A=
> dtb overlays are kind of a hack layered on top of dtb, and don't have a w=
ay to represent things at a granularity less than a whole property (except =
for special handling of phandles).=0A=
=0A=
I'm going to say that they seem to be a _very_ useful hack.=0A=
=0A=
> Introducing new syntax to dts always requires care to not break compatibi=
lity, but that's really the least of the problems here.  To implement this =
you'd need to invent a way of encoding partial property updates into dtb, w=
hich would be an incompatible extension.  It would need to cover ways of de=
scribing the part of the property to be replaced more complex than fixed by=
te offsets to handle the string list case here.=0A=
=0A=
Maybe I'm being naive, but I think that this syntax could be very simple.  =
It looks to me like the current implementation disallows properties with br=
ackets in the name, so I would propose taking advantage of that to create a=
n invalid property name:=0A=
    PROPERTY[S*INDEX] =3D /bits/ BITS VALUE;=0A=
where S (single byte element size) is one of 1,2,4,8 or s (string array).  =
I could see "S*" being filled in automatically from the RHS data type (but =
override-able if you need to do something special).  So, in our string arra=
y case that means:=0A=
    PROPERTY[INDEX] =3D "string";=0A=
becomes a property named "PROPERTY[s*INDEX]" with the value "string" when s=
tored in the dtbo.=0A=
=0A=
> It would need to cover ways of describing the part of the property to be =
replaced more complex than fixed byte offsets to handle the string list cas=
e here.=0A=
=0A=
It seems like string arrays are the only complicated case, and by knowing t=
hat it's a string array (like with the above "s" size byte) the implementat=
ion can count NULL bytes to find the correct element to replace.=0A=
=0A=
> Finally you'd need to update libfdt (and any other overlay implementation=
 out there) to process this new fixup information.=0A=
> =0A=
> So, yeah, it's not going to happen.=0A=
=0A=
Maybe I'm missing something, but if we're adding the information to the pro=
perty name in a way that's currently invalid then does that solve this prob=
lem?  For older utilities, or ones without the handling for this extra info=
rmation, the utility generates an error or just adds a strangely named prop=
erty that gets ignored (when I gave this a quick try by hex editing a DTBO,=
 the kernel happily gave me a "gpio-line-names[s*148]").=0A=
=0A=
> However.  If you're able to have an actual program on the target processi=
ng things, rather than just applying an overlay, then there are more option=
s.  You can then do whatever logic you need in your program, using libfdt t=
o read update the dtb.  I'm open to adding additional helper functions if t=
hey're useful for things here.=0A=
=0A=
For my case I am already using dtmerge on the target to produce the final d=
tb, so I can easily add a hack to dtmerge to manage this process.  That sai=
d, I'd like to avoid making something "completely" non-standard.  My prefer=
ence would be to implement the feature in the official tools (in a way that=
's acceptable to the broader community) and then hack our tools to work wit=
h the same thing.=0A=
=0A=
> Aside: you could argue that using a huge list of strings like this is a p=
oor design choice in the gpio binding, instead of, say, having each gpio li=
ne as a different subnode using 'reg' to index them explicitly.  But, spec =
design tradeoffs are always tricky, and we're pretty much stuck with it now=
, anyway.=0A=
> ...=0A=
=0A=
Yeah, I understand why they did it the way they did - but it definitely mak=
es this particular task harder.  Some of our systems are incredibly storage=
-constrained, otherwise I would just throw the device tree headers and a co=
mpiler on the system and use a #define for each pin.=0A=
=0A=
Best,=0A=
Erich E. Hoover, Ph.D.=0A=
erich.hoover@arcfield.com=
