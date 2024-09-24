Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2092.outbound.protection.outlook.com [40.107.21.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9E71A7249
	for <devicetree-compiler@vger.kernel.org>; Tue, 24 Sep 2024 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189643; cv=fail; b=t+QqcFxagca9JM55JjeOiXgMBBto/9E8e10WZDO3woVtGXkiKNJ/XREtPurw8BENcTKsYAjn7S6twrh2x7tlrlZnxWQy4IhScjIofAyebuiEKDIeGy4qZERQuQ/fd9/hr+iTfR8I82/cSbfN26IO4uK9U5ibEUHoevOOEwN0iUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189643; c=relaxed/simple;
	bh=dQngtl20bORrSOt0yAZt6LJQifEF46OCcSJt/3GnWdE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jbHOx3325lqoni8pILAEFp7jgOfYemxJOgDveRFdQ2+jB74HaacC82agXvFcdjgwi2H6MlZA0daBlvo/YBfOQRaW+ig22+oSqjbh2p/Ty+8ByAqrQ/zdPTraP2Cz/JT9aHZe/4Yw3YP4mt9c8iuNfODwXjDq7aI50JXsuEPQANw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=pUJvkB2Z; arc=fail smtp.client-ip=40.107.21.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="pUJvkB2Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9YRUHCY77Oh44nvQtlJP0N+M+tiFZUULOCvDz3ud20Crvw1NNWqNAcsdnpzSCQCW/7/6lkWXv1BDNQcFZB2sdbVRVpPYXvwct8JyA8Cs2SIZB8UDzGa2p6Zcr1N8W+azXlUjvAvICSLgnNNQxeoQsTikdYQTdlO6e1wMMaCPyvn9/e+PYWjDK3wzDrmUsSlLRflUME0i+SkYgaAoKxD3edWIHbX3yaNwMp9rfqL/a8suXWxsK16lNgh6ovK97BARIq6OF1Z4kr6FaLA4ves+675PNXryNiydtmKFUNytPe/yZ9Msp74j4uLxoEo8gJEwsqr+2lxG5Vt0qrJc59cxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQngtl20bORrSOt0yAZt6LJQifEF46OCcSJt/3GnWdE=;
 b=yZkCEenUMBM9BzMmB4VWj7BSJWARKm5hEbk26S5eJG8AksqggK9HGG416QJWdEBTsCZznM+e6o4TZXXsenyV9imIp20huqF8hhZ3qOc1uD3PsUKecIxNgcg2qzRkUXWtQGoWEXmI2EsmCFLYNU5wBEW9V9ME/kMJnwgTOHxMtX0pHV8Fx/6WeqUVKNW1QoMx3/mQD8lR7N+2Sf4FCWfdKvYdxjewy1lcMfTynzwJVGwVyeW6obsXd/pKYRjApm/0evRYjlzsXcCwyO0tJDPb3xW+/ZSMVqFU3tKrBuIkDXVyfITMX58ed2Zu78ZdjuBnEe/RqUhvqxsI0OnqFdQ5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQngtl20bORrSOt0yAZt6LJQifEF46OCcSJt/3GnWdE=;
 b=pUJvkB2ZWnlUTKToGRLiWlq8nJuCHhTSH1JKncZnw/KyTwlicyLrDg07ABJwVam3WsRO7J+fokSOiQQ3CaVTUZ+SAKxT80s91O07O6EDSi6es/Vc8W+BHhaMSYG3+fjgMJzTv4AGYiZXDfV2EL+wBAli14oBy7JDe+ssJ8Ttlok0pTKldFfo9A3Jm7WnxJwhlGXe04T5+2qGt2jaxaO67dDqkR+sDPNA+C9c4RM00Z5q27RQ5KtPTC6nr3GQZhGgZ7Ma8pLoosPVvMolYc+X/mVvdJk6YIsx1tQ69k59T184BRYbx5IcZA+iL2WRIwyelw84yh5Z8b9DQxqbiL9Zkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com (2603:10a6:10:303::14)
 by AM8PR08MB5569.eurprd08.prod.outlook.com (2603:10a6:20b:1de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.7; Tue, 24 Sep
 2024 14:53:52 +0000
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6]) by DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6%5]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 14:53:46 +0000
From: Andreas Gnau <andreas.gnau@iopsys.eu>
To: devicetree-compiler@vger.kernel.org
Cc: andreas.gnau@iopsys.eu
Subject: [PATCH v1 0/2] Reduce memory usage of FDT utils
Date: Tue, 24 Sep 2024 16:50:50 +0200
Message-ID: <20240924145320.613246-1-andreas.gnau@iopsys.eu>
X-Mailer: git-send-email 2.46.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0000ED80.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:3:0:f) To DB9PR08MB7512.eurprd08.prod.outlook.com
 (2603:10a6:10:303::14)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB7512:EE_|AM8PR08MB5569:EE_
X-MS-Office365-Filtering-Correlation-Id: 26735e1c-e7e7-43d0-a0df-08dcdca8b130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YzQVMK7TlVIiFI4wmfDEexG9UHqDRooq1CrRio6W2mxxADHALPVeY4ysW12m?=
 =?us-ascii?Q?b9gakLP+M8wc0EjhggfR7S7wcXK1AgpV6DutgoL5KEw11Nmdtv1Sl9I9TYfz?=
 =?us-ascii?Q?ov8Cg3t8Kem1u6hfs5+O+tQTnU47BtEb00TT4kQJaEWL3ASewAQ9tF5l0rSl?=
 =?us-ascii?Q?uRCffAf/A1uzzAJ4ocYx0gyxmhnU1HbPELofEJmbKIIjM6iDJNtmlKUCFY8I?=
 =?us-ascii?Q?EeKcgB3p3qUh7wR0Ip8sWRrLJKa6J7p4NV7qFl6a3prF8NlXA6NosWcFt6W3?=
 =?us-ascii?Q?K1eksyd3Ex7LrimfEcqpRPjz1aDQBlstH35cq9IoMSuLuJtdK74hOo9ji9TW?=
 =?us-ascii?Q?Dw2/kf/Ajt7MTVVzp/kcAOXIfibzEPpa4iUEefgTM+c2O2gqwYU49FBs3G0F?=
 =?us-ascii?Q?dj7vwiWNNwZVWvC5uODGysgn/pJHeuj+9+1daSLyGl0rvolP2lpnPkErkvYm?=
 =?us-ascii?Q?uAKXtWMa7M46/kT0pKrp0HwfT8Zd5UcjhUNxTyiL0cToNo+VBb5FufSJgyOA?=
 =?us-ascii?Q?BmcSQNOiKcmpNauvBLNYvNb8yOEdwMKxoytkRETTLx/NK6L1d3jXv8At+wBN?=
 =?us-ascii?Q?L38dnGSzNrJE6VgDSE6Jb+rfcqxZfy96Ae/Ys/dISwB9XbfSBkSj7vOr9/vk?=
 =?us-ascii?Q?fMAOzKVz4MrmFHJ1tsuSySZ5Hu8FoWtYeRfQWm2YPXLL2YVLBhKV8Yirzt77?=
 =?us-ascii?Q?ebGerK11NMtAQgftj0lAOb+PFBNbLolzlvJNQ/rhMusmVRzMJJ0kYkKBHtsf?=
 =?us-ascii?Q?5wAUHvjEDHx3JHeDL2CzKrnNDGPCyHOduF8XrFIN7P/+hMSyxywobAvvX5Tg?=
 =?us-ascii?Q?sRgS1VsQTAc3PjdHc0ukZnZ/+qYL5ORwL1mCRoEv9X9lzny9tnCZd71XisJt?=
 =?us-ascii?Q?imMomXdYlerekCjB/n6Qs/aUF3Gnq5OPUh2hT+86jNLHtuyquf00JRtYDc73?=
 =?us-ascii?Q?vbV6kN2QKzUGlJrjpRX9V1HOtEh5z+vDxCwSS3w7qoHgX5m2sEQy/JrIkPtg?=
 =?us-ascii?Q?QUPkO8UZvU73HhhggVyGtpaLMU8vUz7A5Om8F0oH6r2BlQWp1EWzWzqCeyv4?=
 =?us-ascii?Q?07YYTGZMDVfnPk/aX4utOZZ6wyfbO3J2qLmEGa6F8cZQEQafxkRTTGGNXeuX?=
 =?us-ascii?Q?BxLkHWCHmAku9X0lX0c9LVQXT0hYAnGHCFDEpUu6UgEhPjVNENizurZ6Ym8d?=
 =?us-ascii?Q?ArDgZt5+3pQ+SGLyRP6wA0072qKgs3Z7tyImIba5O0cpCNMn00PJkZe8ZR7M?=
 =?us-ascii?Q?uchWPBTi//lHO7V6BuhweMj9apiev0p8wifQWuN0iMyCH4f2f05m6u+T9q2H?=
 =?us-ascii?Q?FduPfieVyD6tPx7ZJTViRUzK/J1rYstBMFoUmn6GU9mJbEiyXO/0JTc8sJJ+?=
 =?us-ascii?Q?tpmzKZ0itgTI+Ujd+ui8+NocGpmcIMJ7LSQgztl2fQqXUE8vkw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7512.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nno4tF9DCKbI8C+T6xLG5p/A7RAcIHG/2M4Smlm3AijjhEcEUOkVSpUQimu2?=
 =?us-ascii?Q?oczffUGuVWchdlUTzKwmYjOhMDFrvDl9soENhw2o8mdA30pJoUTpjJ8phTyB?=
 =?us-ascii?Q?tY6UVDtKTWfrzkg2L81TkyEcIEZUrCNvqSkinc0wgMsUZuST/dSN7se8Y3kP?=
 =?us-ascii?Q?jkHFOp2h3oILqTeEG8LLuX52iznvd4obfeIRhWTMOvlCa+JZykp+l7p8g8TE?=
 =?us-ascii?Q?ZV+R3YgniJdSBnXxK8zjYRY747J9FvZshDEdSrSmpMM1xJfBppXAznoGigSV?=
 =?us-ascii?Q?B0l4poIafvrKy4O/KoeY40uYLfsi5AzVB7g06gt3VObZXAlVTC9HzVS08TFT?=
 =?us-ascii?Q?HUQvM7NbTuDrEDkDJtqHL77Qd8/Q8fDSpE+7pajapSdlKcd7NCGY+ip5DWgz?=
 =?us-ascii?Q?nObeF+nyLeJgoHt+FdHhI2xDnPRIR6tkt7hdIq0oTR/+YtRYqdJcFfTppnuo?=
 =?us-ascii?Q?f/sD2kgr6k+mMS5kNaF6sOKDbXttcttso5nJEiEix53/en77dgciXmlUDKnG?=
 =?us-ascii?Q?R52WKiYXr/9PD2jY+kmGRwjh8hEX6KVUB79NBbuXHnC/k2yShIGgXC11SZTy?=
 =?us-ascii?Q?ZmFT6smmXXPycG7mZzxzyHSXz5jT1qoXpFgMuqAJP1S2DBAIPXPBzVrNaAVB?=
 =?us-ascii?Q?8DUl7eDzrdo2H3h29vqDlU5SAsp2a6noc0+dgapJlkSjfk8krpavggDBMeDS?=
 =?us-ascii?Q?U72Mbd6od4UNJoT6oJpERH4d83ZlXybCp200F7Co0jTf1N34+QIe5cvlPVPk?=
 =?us-ascii?Q?GPmEFre6n7CgNkSYOGlpKdfJpZs+swp2Q6z0T/Oi6xWtVg0s02zPvwTzmNBB?=
 =?us-ascii?Q?pVfBphclcYqVGvqx9iy8n1PQpEWpUEF0ZlfzUr48C4zY9sK9um5FV9ficcXr?=
 =?us-ascii?Q?QLh2Pfh9pRUq4NQw2x6q8eE1PI6EGO6Fm6qrBne2IZbf9RenwT67oSWAblji?=
 =?us-ascii?Q?zIklRBEoB3/x8EGqPlLvyTRD+i3VC0muAaKXbqRuzDhl9xWMgDafY/t6iP38?=
 =?us-ascii?Q?Pz2J+yn9geFtfraEf1mGzHy89u5WeIZBgEVeDIq5XhRt4Sy910Nn60occvuh?=
 =?us-ascii?Q?BKY4iWbqVgN+00cbfuZLhxqRVb2TLqFTlN6Cd/oLpeY5moexsEGJ3lJ2xNg+?=
 =?us-ascii?Q?7I3mNJz+Udh3jHE3fp4b2ziQd32AWQhuH/Q+U+77ctePKkhaetCkeiMZTumL?=
 =?us-ascii?Q?wWlqJ/ZT0NyrTders9uNOZKPWuHumQ9VVdDZ9jZLR9qI/DrPQS1bTyHD29+n?=
 =?us-ascii?Q?GPNKMSNiSoSPN7DBMYMdu+KpGOc/3fyiTHQwGek+jxq/ebCiwAQKhG5SQX97?=
 =?us-ascii?Q?CuIGNwZ6AD6IcSgMeBsbwdp9Is6XADATe+1i7ADpNsPVabVJ2XM2/MOX1oor?=
 =?us-ascii?Q?+a4/gGukTzqn/uwET02Ze1WDwR0/a28Bzen9j7Pi+A0VfVLo1V//5SumMo8i?=
 =?us-ascii?Q?VAQi/SNOoNOSyP5zq+mfYuYhr06icS4X+ustjR3Nf2F50CBo7uCf1rtilU8K?=
 =?us-ascii?Q?FpEaDtDGGYQpPaXRtkKt3r6LmkPt/+MANWSVWdRUCMU9M8X2M/m0/V3rMd27?=
 =?us-ascii?Q?LbeeKl3XcHtojctVQhKwXXtKX6IA7f0RDS6qAfQ1CA85U4MO7WAs4/L6dLd6?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 26735e1c-e7e7-43d0-a0df-08dcdca8b130
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7512.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 14:53:46.6734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxDrjK74c6CNA33FQfK9Rs7tkIeJQmFPEFho1fjPkQWdM/0D7Xm1FzrifDjV7jO7YCIo7yNbUvDQlHCIsgu5kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5569

This patch series reduces the memory usage of fdt{get,put,dump} and
related tools. This is especially relevant when using the utilities on
embedded devices to process FIT images, where the actual image payload
is stored behind the FDT blob in the same file.

The first patch optimises how much is read from the file, while the
second patch optimises the allocation strategy.

