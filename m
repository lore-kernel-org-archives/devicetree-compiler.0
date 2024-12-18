Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4AF70817
	for <devicetree-compiler@vger.kernel.org>; Wed, 18 Dec 2024 02:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734487282; cv=fail; b=M88fEVEPHNbLmKqL5FYt0iuPLgnhp2f47vFhhfKDPL3qMwD8pEoC5iheLDYeLal1RvrpV8NIHnqJR3nfCYTJZE3J6+K6py33AGQ1edDiFJhIpVnVE+lDsl5y//7pWWrezvgIgnBtqJ8IXbI4TcXvll94nBEC1CSzIuZtZIY/s+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734487282; c=relaxed/simple;
	bh=dMpkLdUDGypL2oUSPimHRhdPCOh+fwV1T2iCL3jANa0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CjOZq53khVFvKfdm6xLG0JthUmHFYeoylKtZWaJtoz6vSnl3B3t2+eLMRDMjXkCiKf9OSC03gkbMecxZgdYFHKMwSzkJLy6S0983nhxjdsMvOwM9G0JdhojctCdc+hk8pGyyXFkvT1YlIoWhUwQkZ6OIex7mTSl4Nzp8+rV2Mvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a24al7rV; arc=fail smtp.client-ip=40.107.220.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a24al7rV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kx2pWS+TYnx0r2nfqYNhUbAA76wOXzkqqBzY0y8SkhcxPiWBETWWPWp/yM14VlChuHVRLfuZWB+7uGTjS2N7bsFA1ArHF5sLB2h3tplpxQT3bGF+YuvuboqUym7Vrapqe2UaV+IBggCNI7LbwCmaqQsLn9TzPBdFvCG3r2P1MAWhmrYw3w2DXjNMg4Pkn9ksf0zUxCaXigPECAgUVNjljrqflczOcmwBvjNcAi82dtO/95kSoNDJiMjWBmZsykeEgC/uxj0dn8aA88souUYaHLdajg7ERj+5H4WpRLnTio/3qxqgky97nqscHrTACpxCTJvxXA72u3gGWPJ0IJP6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lt4d48IZasPAHax/4lLiAeELIfcVKjHdajL6fKGw78=;
 b=U3NyCJJ7E0ZuwEaQJIyRxg0dtQaJ+duenTeDsWJ2ob7yfiAaqfE6Lwn8H9KYXOV+Y8Gp55x/16Z1oaRHC8OgeEc5CHIfkI31JE0yH0IUgijqOA4iETIJbS+ctrzvVc0/i6m/77iStLo2C8FhidovEGWHuNCTeFd+GmH0PfXmf1KgoZbhUQzRIDOLL7GKxxmr2urGkEb/KzPNRRsvZwrtERBzZog+kVBcLvO6AD+Nis1EdxuK/n2xi8NNuXmpLZqFvRBoUclS5ObJBzEUXs+o3FqhQzgU/Dgs94PxattXJKe1/O81q1E/N55WTr8Q3EqncG6SMocJdMU9yjadnQM66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lt4d48IZasPAHax/4lLiAeELIfcVKjHdajL6fKGw78=;
 b=a24al7rVdMOMHLFd09aYr2cIyVarRw83oS4yQU8qKa6YiiSA8yLvZCEkYWpMf6svacmaOZPERw91Mk/bwjqU5ip4j7oEpKhVvEITO7baqV4J92QbfbkSn5R6mkKhAjzOGWwnXld7pP0EGNQiX04wDrpfXaVmEpprxunZM033jksjXAc7yI9LL9TapTrM2DhRwLm/728T753Klti+YUxbBNIk/ujsl7w3E2OX+WaHz+THewlP0lA2KA+rBFMxWkuoGHsSwpDt4IUSap5QEamsvkfDVX2fK+mss79VvRnUScr7ydI4s0+QBsyZ9t4rPMFSFNa5D/ItnMdDQK5HTQ/tMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) by
 SJ1PR12MB6148.namprd12.prod.outlook.com (2603:10b6:a03:459::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.21; Wed, 18 Dec 2024 02:01:18 +0000
Received: from DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6]) by DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 02:01:18 +0000
Message-ID: <59988586-f518-47ec-ae08-6b98b52b6f4c@nvidia.com>
Date: Tue, 17 Dec 2024 18:01:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checks: Warn about missing #address-cells for interrupt
 parents
To: Thierry Reding <thierry.reding@gmail.com>,
 devicetree-compiler@vger.kernel.org
References: <20241213141438.3616902-1-thierry.reding@gmail.com>
Content-Language: en-US
From: Brad Griffis <bgriffis@nvidia.com>
In-Reply-To: <20241213141438.3616902-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::21) To DS7PR12MB6237.namprd12.prod.outlook.com
 (2603:10b6:8:97::18)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6237:EE_|SJ1PR12MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 69046d78-13ea-4fcd-433c-08dd1f07dc75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVg3bjdQTVJ6T1Z0dXpheUJSTHJGVTZiU1IvSmUwaUNnR1lMWTNQTXhiWkRi?=
 =?utf-8?B?VnM1Y3pHYlI4dmRvcWlZK0NyK2RsYlptOTd4dVlpeFE3V3paZzhpVVFmd09i?=
 =?utf-8?B?a2w5S2RtV29KY3gwN2pLVEd1N3RNbmZQZUE1STRtYlNmVXFPUEJLTGN4b0th?=
 =?utf-8?B?REVIcmRKc3pLbFE3dy90T1h2ckZ6TWkyL1pGYUlsM0htMUZnRGh5NHFVazRh?=
 =?utf-8?B?aFdZUW1ra1RqcGVubVl4cyt6YU5JMGdhVGI3YktCVUVtcFlpSVZsbmdCbW1J?=
 =?utf-8?B?WEl4NWdFSkV4K2xZdFc4Q1BUc0xJSEFJYWxHQzhhenc1blFiTDFQSkRndDE1?=
 =?utf-8?B?NldOUVErdEJaWVQzNE9hZ1Vqb0M0cTIzNmw5aFNLWWJ0YzVudi9NaktBNVRw?=
 =?utf-8?B?d0lzeTJ4a0xtblJQVFZHc3E0Q1Z4Z2owZEpndmRITXEvVnZIRUUxL1lXQkY3?=
 =?utf-8?B?Z1oxTkxHZnJrNFVVeEcxSzloQmc5ODE0OWxuanBsbG9NdGpsNHVXNUxpUWV2?=
 =?utf-8?B?Q3R3OG85dno3ZTFhVGlVTHVjRzhHUEtSZ1JXdEh5Q2tLbmNOZUpVak9wSzJU?=
 =?utf-8?B?Q2FLdkVjTTZzYVdqTE1XQU5NQ2ZTelZjdFJ0dFphK1JjbUpoeHhKR05SQmJI?=
 =?utf-8?B?RmhBVXZXeGxOWVRyZEZWYjlwOXA1S3FiSXFkZWVOYmxSSElSQjBFRG1EMTI3?=
 =?utf-8?B?NVZ6MUZXa1J4Um1kaHZsVEEwUW50SG04UVBSOUlmYlIvekh0ODFTdWNHYW5u?=
 =?utf-8?B?c1FIUGxCWUxnVlRsV1JZMkxmbERTTWFuK0NOblZsR0xIblhnQ0RyQ0p3emRR?=
 =?utf-8?B?Y1E4K3ArbStiZHprTm1iL0NmRkRlV3Z4UWt0dVRWVVRWcnB3RUU1bWRRdkM2?=
 =?utf-8?B?eEtBSXF0b2l0cGk5NzhNS1h0eW1FZUd3dWRoSEVFYjNackZRUHFXMm5CV3BL?=
 =?utf-8?B?bmFyakdzVXl4ZGdlQnh2YjYzU21USkZhYlk5aFhZckM5d1MwWGZWanFPYVdo?=
 =?utf-8?B?Wjg1Vm05S0QwU1dCQmxudnNyV1Fkc3UzTnBid21BZWl5eER5MDRxbzRqeDRD?=
 =?utf-8?B?ZGtHWHVXQnJUYWVoa2N0UGRrRzhnNGEwVkpyaFVrT0pyQUhlWXQ5WkdFTEpU?=
 =?utf-8?B?MStnbUNOOFRqV3ltbTM3ZGlPcEdnT0gvVlpFNXJLQTJWSmlMZVJhTG5SY28z?=
 =?utf-8?B?c09DTXM3MlVobzdBbVUxaHVFVlprUVFtKzk0Q1VLR2dObnlrSEdoOG1OSGtN?=
 =?utf-8?B?T3lJcEMrUWRnRzRLUkRiZmxzMEtuQ3JRdTNUckpoM2JVOVNtQkVhUGZVbFd6?=
 =?utf-8?B?WkF0ZHJtc1h6NVc3V1E2a0VYMHN2amVxZ1B0NVdaWVFPSERNbjFMZGlLelBR?=
 =?utf-8?B?R2FRd3Z6UnBqYk1FVzVHUkRwd1F6bHVlWFM1MDlhTkN1cXhHZ0VWQlNvd1NZ?=
 =?utf-8?B?REdHcC9xMURXd1NiQUE0eVk0NXp3anY2ek5vcFJ2TnVxZWo5V1drdER4STN6?=
 =?utf-8?B?anJNOUh4YTkyNTg4MUZPelFUYU5JWFM5dVdEbmhnRTUvNWNiZU84a3g3cVVD?=
 =?utf-8?B?OEtwRktyTFp3d0tIc3hnM2IzUFdKOGJQNm5BRkthVkdXMHlJWisvNUFPRE54?=
 =?utf-8?B?SHROaUMrOUZCUmxpeDVnWmh4UytNcHJyS2oyTFpyM0tzTURWRnJCWDBmalg0?=
 =?utf-8?B?ZFlucHhWZU1kVzQzVWxUZjgwejM4MmFiZ1ZaclZXY0QzcGZiN3k2RThETFhP?=
 =?utf-8?B?ZTRrYjBVZTBqdVNZSWFnQ2lVczNLVE4wMzAycy9tYVRKbENJQWFtMU9PMFly?=
 =?utf-8?B?d0Rid2tHNGpjdzVvYnVmMjB6Wi90NzZ3UFl1WjR3YUFXR1ZxZzNmeUQyMjdN?=
 =?utf-8?Q?7kngbhV4X7b/h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R21RZGEzSnNvdHhBNVc1dmtvMzl2b3NpbG1rV3FoYWNwdjhuQ2ROaTg2aTBk?=
 =?utf-8?B?aUxJT0pyRitPb2wzQk9VQ0wrNlJSZkxtQVVmMkVWc0EweFVEK1RpNm9MOVJ1?=
 =?utf-8?B?VEY3SXYreXhsZnRMc0l3UjlyMnRsYk5oa2E4cW1kNkVqZGY3RFlrWXpOM1Nm?=
 =?utf-8?B?eVRBWEJBcGtmQlA0eGN6M1EwaGJBZUpORHNLOWpaaXpuN3hkdlFta1VuenZE?=
 =?utf-8?B?NUJtQzV1YUs0ZFY3d1hIbEZUUzI2cG9uOU5TNTI0TzBqSk9ubVpOakFzVnVa?=
 =?utf-8?B?L1VDZzBpeWJOcTVaNGVkWFZUeVhnbDY2TDllRWdIdmFBTkpNVmZzaGIzbDFp?=
 =?utf-8?B?eG5JNWdnYWRjNlBScXZ6dEIyblBtWUoyRWE5VVh1ZnNqKzZEb3d0TkJwUmdO?=
 =?utf-8?B?VjhhVUo5TXpTK2tub1l2L2NHYnM0TWh2V0JsbmRtSXRuNU0wTTdTNHVPSkNU?=
 =?utf-8?B?Mnh0UTVETFlzdnREdDJSaUp6b0tsMDlGbWpsaTFtOFl0UTBPMWllTjRpdjF6?=
 =?utf-8?B?dUNEYjd4cUh4eDFQcnJIRlFSZFBsdllNOW9rSHU2dTUxWUZEOHA4R0dyUHlD?=
 =?utf-8?B?REhvVUZWbldhNDRHL3liT3NQWkNtckpNaklvV2ZiU1hObHlLTWpTc1ZoK0w4?=
 =?utf-8?B?UnNpUzY1U09WWmMxWTVpR1ArU3Z6S3IrQmgxbWI0bXdhTXFTbVZoZUpQSkF1?=
 =?utf-8?B?TDhybkV1WXFpZ241UXJDdUxYZi9JUUdleXl5NnEvZEdpSTQvbTVyMmtNaDJR?=
 =?utf-8?B?VUlVS21mQngydWp6d2JMOEpWQUpqM0pPb1d5SVNrSmIxRTlLOXZhdmM2ckZS?=
 =?utf-8?B?SWJLenN5U2UyaEdsQkZEOGIxMWk2NFRPNnk3MXNkQ1BsVmZXQ1Z6YlNzMWgw?=
 =?utf-8?B?WTZHWlBKeG90UENrZzhyRDg0WEQrVVc3c2Rnd0FtbEtPN3VVTmpvR0hhdG5T?=
 =?utf-8?B?ZlZoaGk4VWtuZGRVZmFqTFUwNWVUNXNDclczZlYyNkF2KzVIK0x1ZGpHbXZv?=
 =?utf-8?B?V0pOaVg0VDRYSlVmeEVpbmV6VVZTZU43UHppZkkybEZhUkdkeHVKL3M1ay85?=
 =?utf-8?B?VTA2dmZLTUJBM3MvY2JGaTRDZVFpUjRxVkhiTU11RE5xVG0wRnZpT0pIRFEy?=
 =?utf-8?B?bFFuWWNIdmRCNUVwZFR6clh3YkZsTlRreDkzcmo2VnMzQW5FdTdkSnlQdWdh?=
 =?utf-8?B?ZlpFSzhvVXZLNFdnR3NQNHB1ZDEvcmUxV3J1VG50UkVxandGQU0xVFd4M2Zq?=
 =?utf-8?B?bzljQU04QnZpSG9FVGtpMU9QNzBXZ2tJWVd2eGNoMW95NGRzbHNGSW4xaTBi?=
 =?utf-8?B?eDhDcXBwZXkyNlZWZ3NDRDlUaGo5OHBaT2NXbU1QdGdEZjdzWW55eTVxR3lG?=
 =?utf-8?B?TkxudmJTVElYWWx1NkwyT3FaU0tadjh4VWhCM3RucHVUTjdId0QySDFYZytk?=
 =?utf-8?B?NFhDNkZoMGFwVkhLai9sVXJQVFp2blZQdDA2SFNnejhzMDYzeG9LU1pyTEhH?=
 =?utf-8?B?cm9BcmI4NTVFNHoxRUQ3WDZEUWxnemtTYUVvbXowYkI5aDdySWp2bmNtU1Ey?=
 =?utf-8?B?SThhMTV0Yk9Rd1ZnOHpwc29rd2xDWWlPbmlHbFA5c2RGK1grak05am9NT045?=
 =?utf-8?B?dkc4UStyWG5acU5US20xcWRqUlljTjl2WFFycmFTTStUTEpsZjlZRUkzMFdN?=
 =?utf-8?B?aTJudnpZU201eFZ2Z3FrUmNKdFZUS1BMcXljcVI2dTZlSzBlZE8xdWdiRnha?=
 =?utf-8?B?WkxEcXpvUCtZUFdaQlp2QWlTNkxOd3dlUjVob2ltbEFVRENXM0FuYnZlTTY3?=
 =?utf-8?B?Zmo1RHZvWTVndVp2SytvN1laR0l2V1owcDl5QWpTSFdaclBwS2MzS1VpWFBy?=
 =?utf-8?B?RENETTBUTDNZbGNTL1hWRDBYb0g4bkFJL3J5Vzg4a0hwdWlLUllZeW10VTFH?=
 =?utf-8?B?NWxKKzFLNzU0dytQUVlLUnZoU1JnYVdtVGNLcmZ1ajFUZVEvTEhIRGZhTXJq?=
 =?utf-8?B?WGJzTGgvcmU0dmNTYUZIeERnNXdRNzVHajdUTWYxcStuNDgrZU9SRER6SENq?=
 =?utf-8?B?L0hhVlRkd1dWNzlkMDlRWGVxZkdWc2JmWnBKa0R5TEpNbGVlaUhpT1RoSW5Y?=
 =?utf-8?Q?Jun3J7U2Ci3duFNtpsVJkBhMo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69046d78-13ea-4fcd-433c-08dd1f07dc75
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 02:01:18.1527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yowvvSmUXbzSsYDmsySNGhAeYxgF+lcS35x79gAW9iBQtzzeL7wV0sCDdw2jFP1o+qqULWv7QWrAUPcaLVPDhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6148

> From: Thierry Reding <treding@nvidia.com>
> 
> The device tree specification (v0.4) suggests that #address-cells is
> mandatory for interrupt parent nodes. If this property is missing, Linux
> will default to the value of 0.

Just to clarify, this relates to interrupt-map specifically. In that 
scenario the device tree spec requires that both the child node and 
parent node specify #address-cells and #interrupt-cells. It further 
specifies if a unit address component is not needed then it must be 
explicitly defined as zero. In other words, this does not seem to be 
just a suggestion, but more of a firm requirement.

> A number of device tree files rely on Linux' fallback and don't specify
> an explicit #address-cells as suggested by the specification. This can
> cause issues when these device trees are passed to software with a more
> pedantic interpretation of the DT spec.

The device tree spec also says that in the case where #address-cells is 
not specified that a value of 2 should be assumed. So in this context, I 
find the kernel's current practice of assuming #address-cells = <0> also 
violates the spec.

> Add a warning when this case is detected so that device tree files can
> be fixed.

I think a warning is reasonable, but perhaps we should consider making 
it an outright error. Though given the number of impacted device trees, 
perhaps that needs to be done in a couple of steps.
