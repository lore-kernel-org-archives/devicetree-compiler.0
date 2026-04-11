Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013081.outbound.protection.outlook.com [52.103.51.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FF930F547
	for <devicetree-compiler@vger.kernel.org>; Sat, 11 Apr 2026 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775932417; cv=fail; b=HYsK9JFBWxxcC9tWz0lpr5OAgJRyyaIoQfh1eKe+HRwodWRU92WG18hwWtYXKE+kn6ABwm1F6poWI/tbkF2hG9w44phc7lX3miBS/yTPquxqx4nNZSKtr4ik0GacukCbaf4DOhSaieybYUdRodBrv/c8fKjz6n9JenRkCsMAiFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775932417; c=relaxed/simple;
	bh=C95agruV7yh6XpJDol4npenOY6uZBenSUscvGU1L2ow=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hVC5iwFELW1PFPx4+VepZS+0kZ13ba35VQcDDY03r2sULlrsVO65kD4oVs0LUp6ze6IqUaVRXTGrvRL1a0Mdq5tmEhdlv1lmwniEvbQpaLycJmnFp/Lxub8B3t1HimCbHKPQoDBK680xeReuvzlonLZ5WBf+40mBiOx/ISHvdu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=nBMut9mU; arc=fail smtp.client-ip=52.103.51.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="nBMut9mU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfPpWxkM1Kxl5EA6YIMWUgGXI1P6ICbCBPHNGPNftCjD9878frxy3e9uNauQ1Rg/wWn3/VvAyVYohE/s4mPrfkKaqfFxNCm39JqjaLvBdmEuyd8EhtTpV7gPFW33c7h8R22QsMy8e9dSIizdWB4Tnb5Rbgxzb05ufjF6q+CrLS9ed4ue+bDbUxNj90e9h1x4ePFcbQ+k3S9TUwzeZkaju1AW2qttGZ+gWXKKwGlubQLXWj6yAohDdQ7iktLHekF4he1XgvEZhSwOfJe6o9vljJ2AcSVl+bRm93lLw5gCXNYPPX6aEtBiH8jQ/bv9erBBYpkaqsLO34f1jqOUt4wENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C95agruV7yh6XpJDol4npenOY6uZBenSUscvGU1L2ow=;
 b=UhwfP9KubxfqS/PE/ot/SUtsWxkqPucSJuJWZNfQ/D6m4LZ6zOsLgkwNnZZAfvqIeRue4bJHr0il0m/JWvIaFJkzdYZj7zgKTFL3sEiwOGKlBYr6K6ZdXI4xawPAn13tF+OBL9HYXivirl1aLl4y/Lj2OGVzLFNyC4W3vxj46WmUX1eiGkI4fojT6gP8qp+iwngVyBmv+Fdr2pjqcJo02+PWOL01ERMlIarG85FndsXBFhE4UGvSJXkpdfJE70XRvIEO8ghPokg9jEgD82fHZl4t2jlWm0qzhCJ1Zs7EchgBCx/sLFaHjizE/9fPshe066E01t91bX8Kikz3yeQIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C95agruV7yh6XpJDol4npenOY6uZBenSUscvGU1L2ow=;
 b=nBMut9mUu3lB3Iv1hU4UgbQkAAtgdIXJZc1KR3TmxTm9p+oaJ4g4pCON9DWi3/E35uHOk/j2CF05FO3W0j0ulHOSx6t91ixaRI0Q7xePDve51Vt7ZdOGZaOOJ94xGTfsT0pQLzdETu58uZIQhVuSsTHBcGKLrm3CX4URpBy9rig/Xk/NgxesWcthzWUiDhSu4DAQhx30yuN70jsLtHxveTdtHrq15klZN9rLdho1jcKaME4OtyWXqKrNyofM7ShVEzoQxIlXbZrKFSWCoN64wqSTKlBV4fHv1q7Iitz8phg8TT7BSkr1k6RDn3Msofg0p7rTlc/ZxrNKosi1TE9HIg==
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:285::14)
 by PA1P190MB2741.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:569::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sat, 11 Apr
 2026 18:33:33 +0000
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac]) by GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac%6]) with mapi id 15.20.9769.016; Sat, 11 Apr 2026
 18:33:33 +0000
From: Kyle Bonnici <kylebonnici@hotmail.com>
To: "devicetree-compiler@vger.kernel.org"
	<devicetree-compiler@vger.kernel.org>
Subject: Phandles
Thread-Topic: Phandles
Thread-Index: AQHcyeGzJBZ5uExMqkmJrTV9ctgitA==
Date: Sat, 11 Apr 2026 18:33:33 +0000
Message-ID: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXP190MB2509:EE_|PA1P190MB2741:EE_
x-ms-office365-filtering-correlation-id: 4da50bbd-72de-474d-6b89-08de97f8d613
x-microsoft-antispam:
 BCL:0;ARA:14566002|39105399006|55001999003|37011999003|461199028|20031999003|25031999004|15080799012|31061999003|24071999003|19110799012|8062599012|8060799015|1602099012|40105399003|3412199025|4302099013|440099028|10035399007|102099032|26121999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WLG/ZH6Z43VIPJ5T3JthNc5dk79+jKBqaUuo6hhRzbUnWuzO7R96sXjyyYD7?=
 =?us-ascii?Q?uBI8MFxLSuOByIMoGXoV5Sro3x2rA7Nx1rTofQkqI9ubXL3MS6e0Vo2t8330?=
 =?us-ascii?Q?QSDh7e+dKPzrZqnRMdDyJ4x0rNNlSGbaTpvS4gKrRxA0O3I4QLLzEGXkRJBC?=
 =?us-ascii?Q?g0ojJ4Weo5V/oUnAgYqNsE3eqR/hXDDd7SFzA9en5PxJR+0hx0Hw2cbbG7oZ?=
 =?us-ascii?Q?5sSOoH38JxAz5ILG5b31lRpVua5tPm1mJt6NkxMLZgHLQ0ZMtp+TYLIyxfXx?=
 =?us-ascii?Q?CMbDJNqWMUdTQ3hGhQmTHP3a3cyAnXnMiYxI7jvtDBhKx8k8zL1JSS2lGcYv?=
 =?us-ascii?Q?im5TahjGeLA2jz2jrkvdvOTGrKTsj6puk7VissKLWg4K1+6GvcjK13d069la?=
 =?us-ascii?Q?yTPYLRoCRnFuwtMcvJoyNjL+H94+vyeHgKXcphW03H+B764Hg1w5QFc4WcQ5?=
 =?us-ascii?Q?nmxF7PACfbnB8xiaEasIeL9CRlJYmSkAEmdcghDLnCB9WB6U7dxf8di1rexF?=
 =?us-ascii?Q?kPuKhKv9tPuWCHdm3NHQJFFt+N/uLRnNn6lu0uv8QaZ5U+D5a6KjlhuB1YFw?=
 =?us-ascii?Q?+gmgcpUKN8eidVv8YEU7nw7fnT1yIKe20kIRvYWOQhALdLOkba+dwD7t67gQ?=
 =?us-ascii?Q?borNkOHCE3qcqRv618VGiOcuV+VSPl/VNaRCdjiX89oenTGHXgyJTRes+h/V?=
 =?us-ascii?Q?V0Rnwx6tD0eUWVSDV++tpuIOdeILzucOnqr4/swP8jafz6n6yKYyOvpzYNxE?=
 =?us-ascii?Q?OLi3bN0seUcEqc3ozsPk8ezOter+W6XzVIO9RBzxhD0Zux6Xvk2fXPNpGKCu?=
 =?us-ascii?Q?FCifTXAwzM0aUrgFzSZ+4mWdDix+fM6XqO/j3vkjN/5BFwki5rshleKWl3zn?=
 =?us-ascii?Q?VTZKuSWkWiyKZOT06UMeLk6brWblsL+IOY3Ed2dpJPMPnR3/+PlrEOMmsbOF?=
 =?us-ascii?Q?orTYa62kae1QS7sxHigbi282DvM1g8j03U3yr8cMOR4FuH9IPEtLDVNPzUWm?=
 =?us-ascii?Q?oO8yAPHQHD5MHbmYqi3swh4UsXQbO21LQQ/MpZBJ1TYwLf6kqKFnF2ZJX2+m?=
 =?us-ascii?Q?w7hnLAGKppDBa2Q1QkKXl02qqTo2tHEFIWVOViGbLQrfWVo+GSjHkQeDEOy9?=
 =?us-ascii?Q?Pe6LVd7dJug/F8lp6rS7wIxDHqPY6qhzpmHZqEBG0Xwi5L7m6v3uxeZVtNdv?=
 =?us-ascii?Q?nCiYVnBMkLdnhpvBEt96mXWtnaH7QWnSvRB13UpbhKesDtJd5f5IpeCWfiU?=
 =?us-ascii?Q?=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/+7GsWIMRtuo3wrSnSDsfmuJjFlBzbXIKOwqA+PL8Q6pwP0Y6gccJx4KU8wf?=
 =?us-ascii?Q?0mi1rFzS1rNOjbx/sKnARLQ429bZswU2az5kerZRBzYG2cT4Onj33QFR45p6?=
 =?us-ascii?Q?udG2HBr7T7BfcqSxNj++kC6+l6a04AurPHGNDKbrhrZBx7ygxhq1YfNYySWl?=
 =?us-ascii?Q?k/oo8lDf7Od/4uWjCV3XdrrMOzKdAN0gTVoDH9slCWHWyN0qEoCL/E3BpoxB?=
 =?us-ascii?Q?biXvRxAywYH/xbLBIpokVJQ9JUavW1V+xrfJKNox7yvD7Sj0tT/6PnKWkn23?=
 =?us-ascii?Q?wT1F3z8pWtSZKUdfnHPZXBiESRS7Hr5U/DnatPmbAXG2LZ9dK+CeeVDypYaq?=
 =?us-ascii?Q?xnbgXcSwk/VxAZETD0snaWkDno92M5Lr56L/t3TnjbUdUinJSpaxD+8TEKji?=
 =?us-ascii?Q?Zmg/ieCd7KCxiF2XzoA9pA97DFTc8JxTeQkdqJP4zp0g8VnVgL8nzWiEMM0F?=
 =?us-ascii?Q?gxEB1XB3qewBOt8gmnj6gy7PdZqPRIofz2u/F9MQeYOGZiadnBO8yrGgJGCw?=
 =?us-ascii?Q?uVysJsfBaD25On/7nQxTKsWiuhc8BPYw7nj9kt4G0yQx61KmQSKRz9RMh3Ra?=
 =?us-ascii?Q?ew+0bgHi4xSyXCRnRIpAqJJKPWSPUaxaKEwJmphCCH39hthrkKO66Ic/93Px?=
 =?us-ascii?Q?jOQ6O9XFu/Y0PukTxq5ozxhkT9JyP+sMJNuaoJhj0ND0594FI5xpPWi8GjsW?=
 =?us-ascii?Q?OHboPTqAIrFU5us1BfxaQoAGksJJIE4F+tGfH7s4SzvkGUPMjBaHcvE5MHPv?=
 =?us-ascii?Q?VxH8d4vzfUsRY+tKmcyBY0uCp18bHpMQGPd07D8wccIh567JhfYVpNn2xaJn?=
 =?us-ascii?Q?CkIPRUNujRi+FM25XEDER5fAIBhNPtE7FgILgt2Fw9GlqzS1utbVNuw6s3rF?=
 =?us-ascii?Q?WkblhNkCN3KoHbmE8kJtiiOadGIEf8dLKId3XC+ciYhbARZDD3G9xTkqhulu?=
 =?us-ascii?Q?RksrjiWrS1Q9rJs7FMgAUVFC6zS+iFpcoRJ0tVGTn9dtCBMbWt3oEhS+xKnc?=
 =?us-ascii?Q?AIR1S9odsMWzKRQmizX79xJjM7D8lMTPEqH2jrvoShn7q2SAYF6l5YDOffW5?=
 =?us-ascii?Q?ynYXVPiw5U3+U5C396vSXmdkAZ41YK6Rjr6oI1/nBvJKYNIJWuUk0irgjJay?=
 =?us-ascii?Q?H0AS6ns26VM4Emn4Zf4uQF7QE3fz77M0BpDQN60lZuGeqf7QQDzXUfmCCdrM?=
 =?us-ascii?Q?RVvAg+RDNO9sObYDKR/bDu5dw9VeshXr4O/ou2eCdDpNV1huFmCDx21BUVxx?=
 =?us-ascii?Q?fvvbtpgSFLnXfujebLxa/2dMkZsR2TmqFQU3eC4Y/HVrpGIO+E+7gY7vppzJ?=
 =?us-ascii?Q?YRNsLTbkV/Oahy/oPLzj1NktLEvUNAdTpvn2usL9bM1EB6vOelwHIRHYWUZw?=
 =?us-ascii?Q?V/azvB0CMJuG6LJMYqMbvBlnyrbEO4Upf2wROQt1viJlrMLgBQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <061E6B135D0B1840AA720279FB06B77F@EURP190.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da50bbd-72de-474d-6b89-08de97f8d613
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2026 18:33:33.2336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P190MB2741

Hi

I have been looking at the the code for the compiler and I am wondering whi=
ch specifications marks the below properties MUST BE Nexus Properties hence=
 the validation.

WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#cooling-=
cells");
WARNING_PROPERTY_PHANDLE_CELLS(dmas, "dmas", "#dma-cells");
WARNING_PROPERTY_PHANDLE_CELLS(hwlocks, "hwlocks", "#hwlock-cells");
WARNING_PROPERTY_PHANDLE_CELLS(interrupts_extended, "interrupts-extended", =
"#interrupt-cells");
WARNING_PROPERTY_PHANDLE_CELLS(io_channels, "io-channels", "#io-channel-cel=
ls");
WARNING_PROPERTY_PHANDLE_CELLS(iommus, "iommus", "#iommu-cells");
WARNING_PROPERTY_PHANDLE_CELLS(mboxes, "mboxes", "#mbox-cells");
WARNING_PROPERTY_PHANDLE_CELLS(msi_parent, "msi-parent", "#msi-cells", true=
);
WARNING_PROPERTY_PHANDLE_CELLS(mux_controls, "mux-controls", "#mux-control-=
cells");
WARNING_PROPERTY_PHANDLE_CELLS(phys, "phys", "#phy-cells");
WARNING_PROPERTY_PHANDLE_CELLS(power_domains, "power-domains", "#power-doma=
in-cells");
WARNING_PROPERTY_PHANDLE_CELLS(pwms, "pwms", "#pwm-cells");
WARNING_PROPERTY_PHANDLE_CELLS(resets, "resets", "#reset-cells");
WARNING_PROPERTY_PHANDLE_CELLS(sound_dai, "sound-dai", "#sound-dai-cells");
WARNING_PROPERTY_PHANDLE_CELLS(thermal_sensors, "thermal-sensors", "#therma=
l-sensor-cells");


These can be found here: https://github.com/dgibson/dtc/blob/main/checks.c#=
L1498 this is relevant for https://github.com/zephyrproject-rtos/zephyr/iss=
ues/107066

Regards
Kyle=
