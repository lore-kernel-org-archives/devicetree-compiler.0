Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0082.outbound.protection.office365.us [23.103.208.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F762EEC8
	for <devicetree-compiler@vger.kernel.org>; Fri, 20 Sep 2024 04:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726807757; cv=fail; b=obIlZcyrYW0EkYDr8dD0D36FUATVUVb9FQaFqqFLpXUeINZm3u48V2ODogIDHgIfbFB7ZhiqR4R1A67722RIVWegQEjsI0cWDRGvT3fKDL0vYqzavx9YjaDkL4pBwqapQFUhjBHBZ7hxNlM2SXNoiQMdiwnMAwgKw9EdTN2Fh6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726807757; c=relaxed/simple;
	bh=VXRD2kIGokd0gUeT7xnNJihzLXSwpFnohPxomMoAU/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fcLWZI9ojQHGpKJU6RZSoAQzyYToqzs3ejeD7Mw7dRmYp0iFg6CXwHMjEgvbyN980tLpfc0tFXQTa6m9ORoZIrIB22XVoWwkzU7MQspILaYA8lW9LIKV1nQ8zFGfLm79PeMBdHkx6nAaPwZ6BBVNgtkG9VJ7s/NQgL3xvNQ4BVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=terranorbital.com; spf=pass smtp.mailfrom=terranorbital.com; dkim=pass (2048-bit key) header.d=terranorbital.com header.i=@terranorbital.com header.b=cns4Cg8h; arc=fail smtp.client-ip=23.103.208.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=terranorbital.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=terranorbital.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=terranorbital.com header.i=@terranorbital.com header.b="cns4Cg8h"
Received: from PH1P110MB1049.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:175::21)
 by BN0P110MB1047.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 00:14:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=OySOhB4XCtTHI3DPGMd2Xr8CPX677oIB/SUdIekURdYf9A93cRPOnfDRk6R67TcvLCgYlarjdFFiLy3xZj2DDimzUcnh3gVfh7HBqMmy9NF3CiASIUZyibBwD2ydN3ZtOpwz9s8UQ/9rPqLg0tpPPzeEomtUwUsO//1tsHPVoX0Gfsk1xtuG7QTHZ+bhiYVqtim4ou6jto33YkFAe9FhRMQlwFE/F5XTceTkwp0vmyzsUUyMPqI24BcG9BXjWdNjq9Ei7u8K12zB71k3m8hRMqpWWMycRchtph7lNounJ3Vr5PhSsM2CvBF4e2GSyd+dYnaE3AIT7UDbXqVkpCObNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXRD2kIGokd0gUeT7xnNJihzLXSwpFnohPxomMoAU/k=;
 b=NdnZdbfbhK/dAYTKdRiXFb7kIQ2lrc20wDCAtaENgEZXobquh2ivdV2Ek2/oRGuCFDna35CkLpVRl3olIyf4blElepp3Z+GMhwXumSYiFp4qhh/a0R/J47zhNJntqe1IgPKa57AA65x8kGp0TD6z6jjS44hfJQiMgp5kx83j/oTNT/XWkQV39un+Ayhb/lVScc5403pgcFVhZXG+j3yGUE7Bx7WIqdlyt4SD+Xph7x0HHCeNofTwFbnyi7/kuf6RpQGjbhZKqitEJ26vBhGwD5lYYky4dPvsyXzBNN0UkcYEvyCbRyzmjx7f7pZWYCtoedlhEEGmZQyDsISo8Tcvgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=terranorbital.com; dmarc=pass action=none
 header.from=terranorbital.com; dkim=pass header.d=terranorbital.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=terranorbital.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXRD2kIGokd0gUeT7xnNJihzLXSwpFnohPxomMoAU/k=;
 b=cns4Cg8hJA56c73k+eSSMqjrnb1/HeSzZp78L2o4wUTMsRnZsZcUFWa6f6n9gNlMi1dFUCVMe9htDzvVqaceMvKqZUdPKI9RsK1OcSoTA3xsBJTt8WVvFo40g90mm8cCWwBPMuz6VvQRuXtcnJyRrlA9QAmgMxELKMu005p+ZFnA5RqTFI7eEU+O/7rC/75mAPZFurytOEpawX1wOpW39piqQOwL8oal3olJSkh6R0YR+xay0tdqp7oPBqBFd+f1rj4oaxz9YbCDnR5bCUdb01rX52aJZF0kPI7TX6mL1c4pXCZNaDqLzq+5nXa1W+n1qeyC2r6hQUchLYlpeh2RPQ==
Received: from PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::21)
 by PH1P110MB1049.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:175::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 21:45:05 +0000
Received: from PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e166:824f:70b0:d484]) by PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e166:824f:70b0:d484%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 21:45:04 +0000
From: Anthony Ortega <anthony.ortega@terranorbital.com>
To: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
CC: "devicetree-compiler@vger.kernel.org"
	<devicetree-compiler@vger.kernel.org>
Subject: RE: DTC Version and Reproducible Builds
Thread-Topic: DTC Version and Reproducible Builds
Thread-Index: AdsIcJomBwMQNbPxRfmzvQAGIPc0iwBBLMiAAFmkwuA=
Date: Thu, 19 Sep 2024 21:45:04 +0000
Message-ID:
 <PH1P110MB1507084A3C88BC2CBFAC984C8B63A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>
References:
 <PH1P110MB15070467257B855EE1B1BB008B60A@PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM>
 <Zuo_l-DJDQ38SAtA@zatzit.fritz.box>
In-Reply-To: <Zuo_l-DJDQ38SAtA@zatzit.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=terranorbital.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
	PH1P110MB1507:EE_|PH1P110MB1049:EE_|BN0P110MB1047:EE_
x-ms-office365-filtering-correlation-id: 937bc246-dc66-481b-0f40-08dcd8f4528d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sleOvWQdR+pIzrpoh43GXjSOprYLmbPxSFL4Ib6rEypBwTZyWkGH+FGH3iGZ?=
 =?us-ascii?Q?U9LS1G9+Gu9W9FnXnit3Q8VaVZUtbDQkRMzjKRcMpDJQg4oMig4G/abwgbSO?=
 =?us-ascii?Q?C6Xgi8gUZf3PzKPdb9HpXiBc2iJqtvA5s/npcsmUcicXd1ozwUQQRO11xV5e?=
 =?us-ascii?Q?W6y4gT75VZPIFxgx8aTWElcGmzF26w8fKk7kp80oSU1NrdaO7yhKC6qM6xyT?=
 =?us-ascii?Q?4suv/ZTF2KisTGs+bgFZvbbwi42zhcjhgiHGqigGY9tFtWG18k0SFD39vsyY?=
 =?us-ascii?Q?30oWL5tTpQPdSQVE6615wG+sNSq8/TeqYJQmAMw/Kt1f/dwFCuW5BaI9ZEd1?=
 =?us-ascii?Q?yVePnjhNH4HydtXqzafmJov1mX5NpVJgAeHmNhLsDpH0ghjb8Q4uUpCGFu4m?=
 =?us-ascii?Q?gXmuYhlAI7KDNl354rUVygaZmmuHLLgY8RvlNJvjcXWOodrcM//NP1J8pkSm?=
 =?us-ascii?Q?FZgKVhlBuEpK2bn1VOd7Hp+l8WeM3enpPGfsrv8DoShwKEaAHuzUikac06Gv?=
 =?us-ascii?Q?kml13I5Zlz52u+6UiaCm394KRbjp7kY6n2PPg3UIVZByBIbX1gmKbgYBQ4nX?=
 =?us-ascii?Q?r4aTjTewapqWwT+r+XR06mFbBF2oewPKzG4TqBZauKiwCRdDI0ia85c4hfcv?=
 =?us-ascii?Q?12tNjMbmOpn//B9+uB4w45RiqnbCuIM+xqgs36LnpLelMqn/Zc3XjG8MriG9?=
 =?us-ascii?Q?4OWsAh5uJ1K/t0swDBTsDOtcQrGogmdCBdspgQWsXAuZjHu5fe92/tRB9N8W?=
 =?us-ascii?Q?qVMQNzh+pCpvJE+ILdTpme8XgbQHM0MeMltaLzNh8mnxg6ysbhgNRssAmKOA?=
 =?us-ascii?Q?PG2mAbu7Gg0lZf2/pKSTIfYJHvH1PqfP7o0OclU0J8HFgs5bgow1I15CXoS9?=
 =?us-ascii?Q?CQhInX0gkgr5C5looNp+iLLMRPU+jhgqJCL0sYgpqhRu/Fc4qoj1uWh0Gfaj?=
 =?us-ascii?Q?zxOWvwqXhFkt8DYe/aKMQ59iEjfYMMkEq+yE0GXEd3Ut+jhRfj9GUCC/WHBI?=
 =?us-ascii?Q?YHLx+VK94xCWelYecAa4KCfibpZePvDMcGnlVC42iwc+ozXuRD6Q2D6kse1+?=
 =?us-ascii?Q?qAaUgeMelNgoWpJyfFmN4X7EsVlyXAQANaPJzSG1xCmykiMkfywv6I3gCrJ7?=
 =?us-ascii?Q?Ru2XyGcpurNTwiO7rxDuwLOCDabTdDnbDqNS3aiUwpLTg0vJBdS86Jvyx7AN?=
 =?us-ascii?Q?4GEaL7RGdky/svgzrkduTlFbBe8VW+2g3QqvArLpDBTSsoh5BaxJ9WDcXTJr?=
 =?us-ascii?Q?arZmIhJ+Vs+ZaBCQluctDd1F4VKpMChG32g/48A2IVX6f6SAZUrWPCtSOpbT?=
 =?us-ascii?Q?wtZJETUHmKzYwUvLPNjpDvSwpHL9YxMc4pmfEfmS7qDc1g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?V7wUpbkD3Cvr0dGGPxGi9PbteuNA0Ru+de5IngXAwU6oA1ESyFOGoB/QVQAj?=
 =?us-ascii?Q?5NjgvQM1PFtaRFZVymqgFmH0rgMTXhx5yGDN3nlrfm4RewcS91gGQrgygm8d?=
 =?us-ascii?Q?SQT8GuVbczDC7iqgpPWP9RGCZGmwMeHDplklnSRpfZFHwlaRNAR39STTCiG6?=
 =?us-ascii?Q?HzG9TvmEy6SMhZyyRw15CxKppOVLbcdcjyTc5whyh28v/ZL6OgO5xaFqCRa6?=
 =?us-ascii?Q?NLVsvcRJZhqr0jek7GVDR8uIcwky2CLY4W1+mkvuE1JMsz/9IMo5zt4vNpzZ?=
 =?us-ascii?Q?XqbDUHlDijiloVBd/QJ7JPfFL/tqowCOS3/GdkOS2527yCNy3IhxGI9tK2Q4?=
 =?us-ascii?Q?zxC9DiXNuOiDiHmbbLP8H8KZdZ8cg2UBhbXuKZlrFAQms5Zxa4p75PNdlIwx?=
 =?us-ascii?Q?bR0PrwX5BiaCsVJ79VKQQO3wlngVIbFSS0X0/4YlzqMAvpz2ARdcqAohg0t/?=
 =?us-ascii?Q?Jmntvlx4Fd5QhQh1CcWMX/wXPVpUDJFXAhmJyfY1QxHkNMhJ/u8XGYKC9FdB?=
 =?us-ascii?Q?YhmOFpDLLQJ7dR3YsrwBR7lbEwe6qcMhZbyFxK1v/YeL7PUdEBEfF373NF5G?=
 =?us-ascii?Q?mbfVrsuGMhPCJ7GZKTCU+km5smAI9+WiB2S6KAG9dX7cCFjml6GNOVLURbzF?=
 =?us-ascii?Q?6ofPY5ql5eSmzTWC+qxSTVQ4f0ROv2Av7urEEY2bERX9I3nbL6dBhElOsnCX?=
 =?us-ascii?Q?FlmjyFf8Uk3yak2mNvSLBmsKFDVCqsCwbT38PjyzVZ3XqGYjRozfNxIAZ6Bz?=
 =?us-ascii?Q?CFiLv/ARM6pHL1OzpiSzkJceFpId/+Ey1x77ZErnHwxnLm6Tk1XeJ/HFTATQ?=
 =?us-ascii?Q?GXtZXPHD4egU62m7tQxVaCPjdvZyNlWhpo6i8GbH0XHiOLuQS5KwJtezMIRC?=
 =?us-ascii?Q?izcaNoGPqdxDoXMsdFaHAv3e5TsB3tGFKPvDlSl58bM8s7MNztXYri35XtGd?=
 =?us-ascii?Q?FE6tNPfMFva1XDVDR3Z/LJW/w62AxSzYI4Q9qZdQVpKaYcBGWx7+HR2RSiMq?=
 =?us-ascii?Q?wdNKBkNJQrA00FURtftEo2ssG8Tk3sP0YP3AIzvSKjRZ/JrJbZyQLtA3qUhR?=
 =?us-ascii?Q?5ZNd6TYi5VjcRIwoeaERiualiQ6xLqbuLlXaGf1sLeFT/as1UC4kt8NsMFXw?=
 =?us-ascii?Q?ibAH+JBh4KE4S68VeYXjSqkhsXNg7Hz2YoaL8hxgIjAho7BeofecQII8BKR4?=
 =?us-ascii?Q?BhG3jjBXQjZm92esj4cX28R7MNR4kwiii+D3Yc6MK87RCbPFHwnfJIV/wcei?=
 =?us-ascii?Q?460JjG1el/Tm/B0xx4s811CAUZBVquA/q6uU1Gqq6pKAlwaTng/gQDpwE1H2?=
 =?us-ascii?Q?GhONH5rXBmJVZMQIRGfSe3KBC+DMu1JqBZxllqOghi66w+OGDsexP1Jk6xlG?=
 =?us-ascii?Q?z9h8ekG+kUSrsh9gIzf5jlOXE2XGiXsKyVcHVdVKvqi04ZL37H5BxXaTI5nA?=
 =?us-ascii?Q?Th9mp+JNF04C0n3Hsgj251oIwxPV+MmclYpraMvKs/KKTxyBJAv/3RN5IQyD?=
 =?us-ascii?Q?gYgyytKuUrnFU09QdOfRotKb+EktVc1CwACwMpyNCpX+YMhgVlj+PGGkWg?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1507.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 937bc246-dc66-481b-0f40-08dcd8f4528d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 21:45:04.7732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a63c5fa-f615-4f48-ae08-40e5f0940b9d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1049
X-OriginatorOrg: terranorbital.com

David,

When I say DTC programs, I am referring to: convert-dtsv0, dtc, fdtdump, fd=
tget, fdtoverlay, fdtput

One other thing that wasn't immediately clear to me is if those tools are n=
eeded on the Linux side or just for U-Boot. In Buildroot it seems that U-Bo=
ot requires it when using Linux, which puts them in the Linux image. That c=
ould be another potential path forward.

I'd be interested in seeing where the versioning logic was copied from. Sin=
ce this seems to be the only package we are using that is doing this sort o=
f versioning.

Unfortunately, I don't think our system can be configured to use meson with=
out a massive overhaul. In the short term I've applied a patch in our build=
 that removes the line that grabs the commit tag during build.

-Anthony

-----Original Message-----
From: david@gibson.dropbear.id.au <david@gibson.dropbear.id.au>
Sent: Tuesday, September 17, 2024 7:49 PM
To: Anthony Ortega <anthony.ortega@terranorbital.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: DTC Version and Reproducible Builds

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


This e-mail message and any attachments are intended solely for the specifi=
ed addressee(s) and may be confidential, proprietary, privileged, and/or U.=
S. export controlled. If you are not the intended recipient, you are hereby=
 notified that any use, disclosure, distribution, copying, or storage of th=
is message or its attachments is strictly prohibited. Please immediately no=
tify the sender by return e-mail and delete this message and any attachment=
s.
