Received: from mx0f-0072c001.gpphosted.com (mx0f-0072c001.gpphosted.com [67.231.155.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC44218E35A
	for <devicetree-compiler@vger.kernel.org>; Tue, 20 Aug 2024 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.155.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724185175; cv=fail; b=guW0mih6ktyAMYi6yf+fXbXqa+Hlmbdk0Frv3APUydZPCl4zUkX1Wct+ldU+icK2ten2lvSMAJJpBi2KN5e9bN9jGHvNipC2cNuxQUdheMgAroLLiVHjQyPyOrWiwiBYC2le/tu6vhb5MK1ShgHMzp7rq8O8T+eQQEB9ZsrxZTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724185175; c=relaxed/simple;
	bh=2z4IwPNMdLfvv2GWx7fsOzbZBtwyqAb0uXSNuiYjiVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PPZysxgDBT9flqN13l/XYYO+icMguPymwRFT/1ebyQvgy1se3gYocKWgERr3f3lU31OaYwADzxBlurvJKlrC3uGtqwoyvmbRYPTwDsDizsxFKu24UpHFNHf/Xwg5VWfY5Ap36LvBYtjBxcDBRbZjoayc/1fpetOWtx6Btjn4wqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arcfield.com; spf=pass smtp.mailfrom=arcfield.com; dkim=pass (2048-bit key) header.d=arcfield.com header.i=@arcfield.com header.b=dfQOHm6p; arc=fail smtp.client-ip=67.231.155.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arcfield.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arcfield.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arcfield.com header.i=@arcfield.com header.b="dfQOHm6p"
Received: from pps.filterd (m0294116.ppops.net [127.0.0.1])
	by mx0e-0072c001.gpphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 47KJs6eO006129;
	Tue, 20 Aug 2024 20:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcfield.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=2-22;
 bh=tRuPqVLvFaavT0Ad3RBuhhjHjijP+9mI9lI3AStSVtk=;
 b=dfQOHm6p3xiU1VUF8Gnmp62WVMU54kCAYATuWcP6tSjJoidfTFiFgiRAaIT2yDZk33RG
 qL2DWMShlge5q+GHTLcgZaIYXGSjCRUi6OCKiwWJQRN5bmDQKqoDlD74uiRy9fAulwDK
 XulN/Th5gHio5AmoYzEM6MjHI8SS3ZVWlCqOKbzjF+DrFbPg6H/CSxzZNj/up8GaDmbu
 jFbOMNmJArEg3vB1MRXiQHsNUXiTHpYr2W69upCdD663fUzx97RUift8RUXhyYAOUJIM
 jU/UxQCuPlJrg/AjYLO/hhaue5fsxsS8PKkXIelo9J7IqA/llTCb/XdIQfgaVC2VBNoe Fg== 
Received: from usg02-cy1-obe.outbound.protection.office365.us (mail-cy1usg02lp0182.outbound.protection.office365.us [23.103.199.182])
	by mx0e-0072c001.gpphosted.com (PPS) with ESMTPS id 412kgchsmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 20:06:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=0lWNbqbY4PUemx49jx5kfrAXMtQcZPqf1rYcJ60hDb1R2plgyGc6o+1xPZ3sjrt9iTAl+qv7NkVJqqieo5AHLuyODw7MH/YzGrO1dtWIB5jY1ICPRt3qcx/vNkzphb27kiVzL9J77lXL8zZfGEwGEpE3bvLDTh/aagBaf4QoUqfsWnQQmPTq69w79jT1DdvRNBjdAwIzOTErqFtnOY8o8XljbUK3HJfMP1D9SeLT+YL/EblptX0FsjERMm+sfHodvREKzxoeP65FqKlMqVG8IzQTINcXwNxx7q1DQFzOQJfyLiCgS7jlDuDb3O+tFPEVXsfUVXj+jxBeYxvSdxApmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRuPqVLvFaavT0Ad3RBuhhjHjijP+9mI9lI3AStSVtk=;
 b=1HxnUTHdzzuLhVJbY8tcFv7+w1gKQN5ZcHq4D6tWrEk1wXBKHO65QlJjyHuh3P2gU4OnJyLVGPmcGjCFIYuGUHn3THD2EkgKOWwwOaYC2j6oSyr0r1lPuSGFWzQOBsXAX6K3MdR3zu9gxCZAxjOupD/omFEZhH9PPc1uH4EFp9bTfHh4/ToDT1LOMA6KZ6VSqbzwXnluQTrid4dF4VSiLv5o2y+p8KRzaGBu0g1z7c52yLi10VxxwRPC0naDTPhfbYC0Nd+/S38q/JoTzmnQMzaxY0NTc00dM3DlceaCf/CFkN7+rYC3dZ+Tgqiill5fQobnj1AlsmH8inoWvsLlBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arcfield.com; dmarc=pass action=none header.from=arcfield.com;
 dkim=pass header.d=arcfield.com; arc=none
Received: from BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16a::14)
 by BN2P110MB0994.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 20 Aug
 2024 20:06:14 +0000
Received: from BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5565:4d3:9a6c:eb85]) by BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5565:4d3:9a6c:eb85%7]) with mapi id 15.20.7828.031; Tue, 20 Aug 2024
 20:06:14 +0000
From: "Hoover, Erich (Orion)" <erich.hoover@arcfield.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: "devicetree-compiler@vger.kernel.org"
	<devicetree-compiler@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: Array manipulation revisit
Thread-Topic: [EXTERNAL] Re: Array manipulation revisit
Thread-Index: AQHa51Vypyte3j8OpkK2fEH+YSSWULIZf4EAgADhyqGAFkdz1g==
Date: Tue, 20 Aug 2024 20:06:14 +0000
Message-ID:
 <BN2P110MB1058451703FA8AD804819918F58DA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN2P110MB1058FB69969C91282858C8ECF5B3A@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <Zq3QIVrmUTTc4gjC@zatzit>
 <BN2P110MB105818EC9B379BD63B261E20F5BEA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
 <ZrGIOi9eTBKsf_I1@zatzit.fritz.box>
 <BN2P110MB10581ACB77C1C26CC331650DF5BFA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <BN2P110MB10581ACB77C1C26CC331650DF5BFA@BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1058:EE_|BN2P110MB0994:EE_
x-ms-office365-filtering-correlation-id: f6c5ae7a-88fb-461e-2d34-08dcc1538b52
arcfieldproofpoint-x-header: T25seUlmSmlubnlBbGxvd3M=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IdXkLciWuGLK0xd5bpULwFH4HGe2xwKY/azs0USGQQRQ73BuzKEBVEi7UM?=
 =?iso-8859-1?Q?lUYIxCrchexAVr6jTLoFCIP2v5TtqKea3nj6dcC2sFWIUuSVRtL5CC6r2f?=
 =?iso-8859-1?Q?hjDt9v331zCK1JHDWzZtATpW5VmqVPI7oPyv55dG/lMHnds3rdRahHkQKj?=
 =?iso-8859-1?Q?EPNbmGRUteIQ6z0zB8hU3GpL4sR6jsEMlHyMbUyX8XUzzpN787E+TLFSZp?=
 =?iso-8859-1?Q?6RApEQrXI0RjF45753tbzDphfoMqiDhu/FsCEXqUf+Y10ZD3HrsA4TbpP6?=
 =?iso-8859-1?Q?+vD7nVlqZcXo1qGw8yunQaYz6Scm9RlNFMlZNknQRlPkuCuLACPPu1aSMa?=
 =?iso-8859-1?Q?dAQw9ljOKBwI/pLifPP4YCl2lyOnyB8ieNuCJdOHUDWZXW+G/D+NSFBASA?=
 =?iso-8859-1?Q?nhQQVTwBrlzuLK5tvsTccG6auMT037GpvEJubn6Lw4mynlmwz0Rn8l1IhO?=
 =?iso-8859-1?Q?fbAHgJ6sZ4STSjTt1rms43JMMrkWaG9JmI+FQNuLFX1Ji189YiLRH8q5eW?=
 =?iso-8859-1?Q?vsz6Y+zR2WFos8Whkjbb3mbZiRl0YsNY8H2EHYjPvvIw1aFh54KsdS7t8j?=
 =?iso-8859-1?Q?BrXv2dmaJ8vPXtte1swVF5RcbZY/9yrC0hjgsZuXoUWsbsO5Qu3QoLfagT?=
 =?iso-8859-1?Q?kKjwowSlYVzEpTVn3LYZZjRGorEtGbpclWFOkGAKzsLrKojQJshG+tcBXR?=
 =?iso-8859-1?Q?5AxL/cRNENGvwfIPkXRab663xLcDJefu67QpJTwb7WAK4Cgqr2HuZALG09?=
 =?iso-8859-1?Q?n86aAdm4E06YyohPUr6KJ7316pKnvwWbMX5Jw+Plo6oLb0s5CRRWQAeZpP?=
 =?iso-8859-1?Q?KHEZ/29ZSWG6wlJk1vBCdxe+ppmwQXd2rPYiqMPJQiSa4x2EXk2meGm7nm?=
 =?iso-8859-1?Q?zeoggTM88kxmXcDw8FIN3K2lQQsEEdz1HSzy2XN53NIad0cGwuBfwun7/o?=
 =?iso-8859-1?Q?cXixwehHeTzbM5lOuOpEVB62z0Ea+I2+j2JtT9vg1NylvMHG5TKgwHE44U?=
 =?iso-8859-1?Q?sM0IX82DczH94iKwtQqrGKC0JJlbBAYpc6AGynJm4QxfUBLtHeKcRqv6Y3?=
 =?iso-8859-1?Q?GClayhkrURR6pmnlbfgu/dQKyYrUBLQjZhpxf0hzSQVDKbMKFgRsyNPnz9?=
 =?iso-8859-1?Q?RE0dC6SXMaZraM6pcYLRfauRX0dgxvvGOEUqN59bcquWRFUK50IqgVjB9p?=
 =?iso-8859-1?Q?NvnRpBu0sbHOeyG64KxnLsxI4Nu7etWKuGgZoe8CPVGZcg3vU+F3jYTuTh?=
 =?iso-8859-1?Q?Xhr75SxqX6DV7ttVHJgROm4yuwhdYM3UR59dWuua4G0smjJRugU+9x/6xa?=
 =?iso-8859-1?Q?uDFQAq5j77Z0u8IoNPl/yuzxVTYnvrMky9ZGLG8hTFxvr5yAy6xXKbaxL3?=
 =?iso-8859-1?Q?89n7pCu7a78gGmTF5jPaFTeLR11JXt0XrlxZEdzg2fvH2ik+qQcwfsU/XP?=
 =?iso-8859-1?Q?rXMJ7iALyisd4UEGXFm1hniD2nZGNeTQxlOrWQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN2P110MB1058.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1j+BxnaUPB0ARwPS3ux/hxutg2djd/dsUMKMZ/FoY2Iplfl9IKjCFSTG8F?=
 =?iso-8859-1?Q?q4VwWNgVBl/FNne0akZwqlowQmgzM2y8g2N3bs9MfE14WStJmJSzJVtpwN?=
 =?iso-8859-1?Q?W+lQ5QLVuosECG5km0PDkcbrtUdq3jdTaq2/yr/sQWrD0dkCiUA1zE09JS?=
 =?iso-8859-1?Q?g4vOYJjIRRLFuDIxGjtBoL+iKYCrpWtitdVCVJqIQRjtItnJ7wnTVVMiMY?=
 =?iso-8859-1?Q?zUeIIQPlhT+QzcE88xTE6zUxHTfi/KXtEJcPfp6f/v0KR05kR2NfdpaHVm?=
 =?iso-8859-1?Q?uaQB8WeYJbaNn60OBzjP0OgSFHE5S+4t5dmibDRJVTbS+LQlBR80hHA+ZH?=
 =?iso-8859-1?Q?GlWgB6FY7YV3MNl/aaIIOgyrNHovkaL4sCND7wwGMOcUWqP6kpZAzYh6LS?=
 =?iso-8859-1?Q?7xGAbeWMDs7M6h6auDKRLCLsGba1OKAYcYy1/YcjeRlsHrAxPu88Yts3Uu?=
 =?iso-8859-1?Q?doEsEAFDkDQ37yX/yHCjLLlZ4N4z1xKzv3KuTy1ul9dFUMT29ft9JXEShC?=
 =?iso-8859-1?Q?Lro5zbB01Pv8wcDq08cCbRDhjyljyW6Ei9qPQ3+GdEFVH4YS5DIOpRBtsJ?=
 =?iso-8859-1?Q?E29VVkD797JfijpT0Qs7bcJf2a0A5A5cAIUbiR5Fqln73imjP7fFCLU4Ts?=
 =?iso-8859-1?Q?9p9algUHSwUUlfE1ZOCcCZPILFaAfCHID3ikAlh7n2hC8+w95G3xVcbCDb?=
 =?iso-8859-1?Q?ZDF+VlJSjA28NNd/y90epw7SZk5C14X6hsB+NS5PhJkTyjwJpGT4IPrErU?=
 =?iso-8859-1?Q?EsT8uMMgezfcamUeinl7bYQSiyh4ydv5qL4Ro1wgJ2TeYslPQNMblfFGK9?=
 =?iso-8859-1?Q?aPfUzRCw240734137bWrK2GdeRF9Cz57PbjV5dpw9aM7NLHBefLqqZfwZL?=
 =?iso-8859-1?Q?qtmzZKeGWRtOS0ZoBI7z65tVrJgm0yQbmJntBymKJDCNQ0pAmpA7wRTFOF?=
 =?iso-8859-1?Q?o4HNPxL4uExZoOWAwZLJDFFLTKN+LShX62jHGGEjD9yTFrVLb7wr+O40WR?=
 =?iso-8859-1?Q?Js3R2+u3euCPG7nNwjrIFzPMDeRxsev2ltvGPtRCVKdWRmauX/rkD0EB+y?=
 =?iso-8859-1?Q?HDKC8s38dM78lIh0DHGtLHsJDH8KwZS/OvBT+XFJKipM9Pi5ERh7aK6Id0?=
 =?iso-8859-1?Q?9uvL0fmuLjhlERT1TSabjvV0uXtJGyeQThnieyXKm4HKbwRGT2SRX6bm59?=
 =?iso-8859-1?Q?kvjXQksXOz+8JrvcLU+TRqcE90LWbtOqsOjz7CYta+TeMXXJrtmJdSlign?=
 =?iso-8859-1?Q?esr4xHFVdq46Fz0w9YAOwjvts5QYr3LUJ5MOiXWlSr9EQ6zmi+QAH331KN?=
 =?iso-8859-1?Q?bhF/zCrDw8beYcNs5BEoqTGC4lmGsBN2A7E17BEokbxjksS6WwkgwEP40E?=
 =?iso-8859-1?Q?2wAfsdWlxrDY3s1EpMVhVTNE9g9wJ4058OBNjQQCQB3XN9CuhG2lPY2Acq?=
 =?iso-8859-1?Q?u8QhHtS7CgYTWpfi7BVZ/e4dZSvVnww0vLqugf9W2UtcUaon+HhmFZNiCY?=
 =?iso-8859-1?Q?IS2Zz6IQfeHc+f9t6xYDiEMap50PQ5poqyIl5u6pfneV3npkB4FtMnITqq?=
 =?iso-8859-1?Q?0s7jNgQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c5ae7a-88fb-461e-2d34-08dcc1538b52
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 20:06:14.3580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff94c0a7-07cc-47df-8981-11dfddd57863
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB0994
X-Proofpoint-GUID: slSCg6VObrNUu8HrX-Ts6N26eBOjg5R_
X-Proofpoint-ORIG-GUID: slSCg6VObrNUu8HrX-Ts6N26eBOjg5R_
X-Proofpoint-Virus-Version: vendor=nai engine=6700 definitions=11170 signatures=596817
X-Proofpoint-Spam-Reason: orgsafe

> From:=A0Hoover, Erich (Orion) <erich.hoover@arcfield.com>=0A=
> Sent:=A0Tuesday, August 6, 2024 10:29 AM=0A=
> ...=0A=
> I did a quick prototype of the string case in dtmerge, for convenience, a=
nd it doesn't seem too bad to me:=0A=
> ...=0A=
>=A0... I feel like adding support for the integer array cases is pretty tr=
ivial, but if you're wanting to support mixed property types then the error=
 checking on that would get pretty complicated.=0A=
> ...=0A=
=0A=
If I put something similar together for libfdt would that be worth the effo=
rt?  If you like the idea then I'm happy to prototype the approach and subm=
it something for your feedback.  If so, then would you like it to support m=
ixed property types or just strings and various integer sizes?=0A=
=0A=
Best,=0A=
Erich E. Hoover, Ph.D.=0A=
erich.hoover@arcfield.com=
