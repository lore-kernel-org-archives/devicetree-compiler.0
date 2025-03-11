Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2096.outbound.protection.outlook.com [40.107.104.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B738223C9
	for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708188; cv=fail; b=kxM11AIb5Ltl3vc7Y00/9x71C5Yr9pG42oc4t1a+hdG0QHzo4HEGH0nl1DpCzSBrqFmQNCYLVbaympyq8B8wJuilhTHBemgKnXJ/i7XXwbAlC3V2m4rLkirPz5hMtH+CXBZLdJLBLmwA6txdQRrj7OvBopIKYHJ/sYXgNAPmroQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708188; c=relaxed/simple;
	bh=THczZkm769NhE0HmahdZzh7erucrOs3zcoX65bBLKR4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r/evcOlnpIziyh34YELCuaCXok+/JdWTmbOBWQhHNzAC7+0SUgTCHiyZB1g1ty81lqZl7kNMpDCBioDX1Yaavv/lP6YJ78PnaqLoEZPoH+DSQkPKXJDQqJG1C1uOht6kd/QGBtglXfx2Vodoa44MntwG4oCP/Mz4fSWukO58Src=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=YSd7I+61; arc=fail smtp.client-ip=40.107.104.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="YSd7I+61"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLK0JkbMNkpD3h+BYxMmXIjFuWfLRP37mAB6w2XCkgHpg4nRiJXNBRzmm2E+JpXTBUtzSLgwfatKsSPgfm4UtpRcbCm4G+syl7ZIiMqLR7Ml9Ta1Di4x/uB0FPySjeIcYftPQIEim0VudhnLGWTkUaPfAYq/myl/O8Li+kABdusleLnlnDO3KJzbLjuTLAIFrTdZeWvGyecM93/P9rgi7UtYaOI7DXhHJ3BTHZTk/0xcU4gKgaK1TdyzDYiJHXZQgRtKbt8/bKUKAAlceo21KscAdXSbuixCXl+HGkTbk9gGegQlSHEYN35dpqVo0A3yrgTbMeU2MdJwDuqKCPSzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivJiE5RNyfVNjMd/gq32CqMpwl6cK6vQdvusvycjDrs=;
 b=POESn+2SF/8R2svCg56iUw5A1OQVmyA4DkWaSgSO6ql/127qSG5BDx3/3csIbC82Y5bygN7l5LFN766NHEFoRyqLUK9bCeSNdFNRACzPYC2Po0CvK8Umz5wh2chb30sVCiFes5cASI46fLLw0lxVwf+65fYfzGL2BW+9t5G4MSi3OujHSWNn6R09cxtYhVaQLJ7m2oZV/ylfVbprdrmsPCS/Ldct+ck66DMKq+KtReAO1eYhCv3B+F4tZNVOUdyAexOp+1heWxzkQaArU3CDDoMnp6osOoWG59P3xI5I3g/WznvYC+fpBk+reJ6yP5f/RjB0+fC0rqwAOhCthizUSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivJiE5RNyfVNjMd/gq32CqMpwl6cK6vQdvusvycjDrs=;
 b=YSd7I+611BHdAXXzuBshCubcFFjD4wGUC2GLfOnSrdhTov0eJz4VJ0GXzABwpeSjVUrEOMCm4TbOoAf59WMKLM42ljvHny/0YrX4b1kJoOXEnSXId+ard8r4uNlWn22CVMEFVwEMqDe2kAwH8uE1XTWw1uoPxT+cXJhW0VOu1cax3NjJx9WM+aiAz91USjlReZb0Z+K5sfzCqHyV9ryJzkpkwCL0tfIdeY3aBBOP8+LLRR9rsKD0M+1mlhdx8xBk1Z91s7eznFVXirsTT8M6iLA3eywM4haOUXir/SAzedAa+D7doGnpX9V44K+H2UT8P7hZlBHmkdJlQx1R6LMsNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com (2603:10a6:10:303::14)
 by AS8PR08MB8443.eurprd08.prod.outlook.com (2603:10a6:20b:567::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 15:49:39 +0000
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6]) by DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::fd8d:f047:ac4f:6d6%7]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 15:49:39 +0000
Message-ID: <b43777dc-6c24-48e5-9830-143e468bc0e3@iopsys.eu>
Date: Tue, 11 Mar 2025 16:49:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dtc: Add /./
To: Ayush Singh <ayush@beagleboard.org>,
 David Gibson <david@gibson.dropbear.id.au>, d-gole@ti.com,
 lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org
References: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
 <20250311-previous-value-v2-3-e4a8611e956f@beagleboard.org>
From: Andreas Gnau <andreas.gnau@iopsys.eu>
Content-Language: en-US
In-Reply-To: <20250311-previous-value-v2-3-e4a8611e956f@beagleboard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF00002BB2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:20) To DB9PR08MB7512.eurprd08.prod.outlook.com
 (2603:10a6:10:303::14)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB7512:EE_|AS8PR08MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: c25d91dc-c52b-4f1d-eebd-08dd60b45502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUpHK3BKTWFldmM3Y3BZY2ZyRnFpVXk1b0VtNnE1SmhQbnBPaHlFdE5yQzlu?=
 =?utf-8?B?R0F1N2poVitMUlFOVHJROFRYYlY1TENNcGVXbzJ1RDBXQkhvdVh1ak5GSWZh?=
 =?utf-8?B?RkRrQkhlWGRRblNLL1REeEhlSXMrQ01JNXF6ZGREbDl3M1RXMis0bldsRWZO?=
 =?utf-8?B?STU0SFJLSlhzYlFUQmpaS1ozc3loclhrcHF5a1k2RTVwVnBwNHZicldHbGVX?=
 =?utf-8?B?MlUvbjlTRmtqWlltMHZqQmVtejArSEIwOUxnYjJTY1Nncm1nYVhZdnBsWXFw?=
 =?utf-8?B?dURQRE0wVGQ4V244L1VOQVdPblp3UTJHaXJyeEloblRmaTduZ21mOEIyWE12?=
 =?utf-8?B?Qk5zTENSb3Faa2JCZjdraDBLbDNqbUUwZEp0bE81MERYRFNBeXJSZGZTU3FR?=
 =?utf-8?B?N25TWXAySGVLNGVTUVVFVmJVakNpZGZabXhGdEVkQXU0QkJQMjB2L080eGJ2?=
 =?utf-8?B?Qi9NRnJxWGRnNDJnS1owbk10VU0wMEw5TU83bEFUV3Q3UVc3d2hyK1drVFA0?=
 =?utf-8?B?bWtSYnc1RGsxR1FZZzR3MHVJbE1LMlFaeXZWU2pWYUJudkErUzFvM1ZXcGRn?=
 =?utf-8?B?WGxxOFQ0cHE1aGVHWSttVURFRVRHUGNGbGh5SVBtUDF3cGMvT09qUzkrZE1F?=
 =?utf-8?B?b1FsR2x3aUtXZGQ4MWxmR3NkclZZbEhlNmVWSWx6ZUZGQWVqaVRqc0dWSkRD?=
 =?utf-8?B?Vm8xYnBXbGtFQ0J6YXRVTk1wUUYyZ3RNckhTaUpDY2g0S0tHOEJKZkpseExI?=
 =?utf-8?B?c3pNRE1vbXFoa3drc0ZtRVVPS0lLUUNRcy9vSWRIaUxSUGhNcHBhUkhSdFh1?=
 =?utf-8?B?VlVkWUl2aDJvMkp1RDVLWHh3RlI0b1BQYWxwYS8yeFh0OER4YnVYR3Q4UEFC?=
 =?utf-8?B?VUgvamtFa0FnV09xc01zaHJZMFJFRytSYVFMVFQrc0lHb1J1N005RjIvTWQ5?=
 =?utf-8?B?QitjbHhLbS9VVEtQcGhwR2FTVWlnbWU3SmtQSlNIV2JPelRHTi9Fc3lUWC9h?=
 =?utf-8?B?WGUrRmJiN3hVVWNmUTRpbDk5enBRVzhiSmJOakxzVFAxMitLUGRTcTl4dkhw?=
 =?utf-8?B?WFQ4ZVA1TWNzOGlhem1pVE5abVAxbE1pWitwaW0vd0JqRWhMM1hFSmlsdlQz?=
 =?utf-8?B?MDF2WUZncHFMWVBkY2k0TitaL0EvbEFpOFM1ejk0Y3AvcU1La2NXeFZtbUJW?=
 =?utf-8?B?azVoNDZ4ZVRKTmRsUDhpZVBVVUM1UGdzR0dqNUJZREdnVWh5ZHZOQW9CbVQw?=
 =?utf-8?B?MFpPUEdWOHZobHQvVEd6QmhiNGh3amZ5c0RwQ2lRSFhLQW1HZ0RUTndqbTlW?=
 =?utf-8?B?YUJHUXh0NEw1QjNhQnNLRVZ0LzN5RXhwak1Zd2RjcU5rbDhET25DTllOc1k4?=
 =?utf-8?B?U1liUWVBYjI5MjllRlhTWTlRWEREMHpKRERxZHIveW5rZ01nKzJRUGVrOGxX?=
 =?utf-8?B?aDk2b2ZzYkZsbitxTnk5RkNiRzUzc2JmK2JDaGpPQUJlNkZqNUZDYzZmdDJo?=
 =?utf-8?B?dVRNR2pYejBrT1I5V1h4cFJDUnFaRlhnczlSN2s5M1lyd3pCTTRqU1h4Z0Zh?=
 =?utf-8?B?OERzOUUrUGpRbkZ2ak51WU9KaDRCRENhd3o0alkrdUVnVVpEeVZQbk1vdHpt?=
 =?utf-8?B?eENwaklEeEdkc09nUWd6dVl3bExZTmo0d0w5c3pSYURCMWR2YUdCNFF4ZlVK?=
 =?utf-8?B?N3ZPQXRuaDFKWkZlOUNkRzE4cTdNSmVTajlvcC9haVBUbTFLYTI3UWVWVExZ?=
 =?utf-8?B?Tk1XWWg2aDVMeGN1M2RpNGRpbDNUZTR3bGdPbnl3ckhIUG44NUtLbDN0NlJK?=
 =?utf-8?B?YTVJd3JQUFVrNjYxYWtqUWpvNisvNlQ0SE1iYW14TlNlQ0d0cVhVdHJUeENX?=
 =?utf-8?Q?6WggZp5KfjRKe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7512.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekR0Y3ZNaFZScWh5VytGaE1WYk9TalY1YzlRS0V5OHFyTmQ1MlkzQXNOQktp?=
 =?utf-8?B?SUFaVEFjT2NWTVJEYnM1akdRQ09pNnZQY3piVnN1N3hKaUxZbkRBYjBvaHRs?=
 =?utf-8?B?QTdRSTdjNnNveXNaYjVZSFcwelhkZ1ZPRFZpcVNXN0F0OCsrNUk2YW16QWVO?=
 =?utf-8?B?bGN6cVcwenNZKzIwUUE1anRjc3lQZzZTNWlNM043VThJUWt5eDltcDRhalNN?=
 =?utf-8?B?czlmOGxGV25WQnJ5M1JQRXJuTnJhbkt3cm1lOHdMRVNmSE1oeWdhWm1qTXhz?=
 =?utf-8?B?ME0vVnBvU0cyYkpjWkp2cjRpa1o1VXJqQXloaE1VTVl1V21yUzhyQndsQ1Jw?=
 =?utf-8?B?YU1lMlJGbncrbjg2eU9nNmx2R05la2xkajVWQTAzVkJGRENtbDJYLzJyd3pn?=
 =?utf-8?B?bVBlSmJGcW4wZnQzRWQ1MXB2SmZNT1hPYVJ6U3hqQ1pvUHpXeWNhZ2RpVXJU?=
 =?utf-8?B?S3pRNUNmSDBuaWpBV1BUWWJsZjFmbWhpWTA4dDg2d0JjTU85WnRPSlBtaGd0?=
 =?utf-8?B?QVJlc1dCTzdOZ25GZlJDRlZEajdoNkdMV0lVY2l5WTVhZWN4d2wzLzNhQjBT?=
 =?utf-8?B?SFgvOExuNFQxWXNTSTFLVWVBZGxkT1UxaHdQY21zNkpjdzFyUjBlR1BxU0pm?=
 =?utf-8?B?ckFzQjM3ckpsSTEyaE84S2toNTdoZmx1WlRjRWpVcTVLNFFvWXYxaTd3bWpy?=
 =?utf-8?B?bkdLNTRIeEhDUGZWcko1VzkvRzA2czc5aEQ5YUpaeDZ0cERsOGFkVWxnUms4?=
 =?utf-8?B?TXBneWk3MW0yejlDSHNzTURqeUdaWDVCSDR3Ty8yUG4yaDdKVXYwako3ejJj?=
 =?utf-8?B?MmYxR3o3Z2hRdkRDamU4V2JpaVNEelZveTJkeXRJZkpDK1JlZ0Q0WDdzdmZi?=
 =?utf-8?B?MXFJM3l0Vkl2dGMwVzZrYVM3SFRxY1FRRW5TZHEzQjlDRTR1YzFDWXlraTBo?=
 =?utf-8?B?Nm9nSm1xRUlMRVRuNWtYcWZHNWZlU1dab0V1cjNmUS93Nnl1VEx2Tm82OXNl?=
 =?utf-8?B?OXd6TlNLV1dYOFFDYklOQnVydE9yMHNUcmZ6TkdVVTZxSlpiZDB1ODNYWUN6?=
 =?utf-8?B?V3AyOEoxd0RUOHVlbTVQZ0s4MHEremgrQmxaYnhIclhiS2dkcWlHUlZSVVhq?=
 =?utf-8?B?UVQwY3NwdmRNOEJ2Y2RVc1FxVTFBVjE0UThYQ0VyVnFTRXhaQkJqL1I0UWl3?=
 =?utf-8?B?VkQzcUJ5NU1xQUJhVE1vcy9CT1JzVmxheU9ON2RzWitoMGRFNTFpS2JOdk5E?=
 =?utf-8?B?SEtjbTI0TE4rZ3RmT1Y2R2ZUL2owSVlOZ05ZQ0QvQkVZRGYzRW5ncGNWM2Fp?=
 =?utf-8?B?ZFRsK2RmUW9OK29iR3F4bTRMN1dwU3hlZk81eTloKzU5V1RSVmpDSXJDaURa?=
 =?utf-8?B?ck5oRHEySHR5VUVWbWdqODVYUm0wY2xKQzJjTmJXcWNvN0UyOGt2V2t5NDN5?=
 =?utf-8?B?aVlGZ2d3N21leWhJOWhMb1d1emZiUWdBcCtXdkh5cVVHZkZHSmRGUmlyWXR3?=
 =?utf-8?B?NjNVWDgzZ0tVM2ErcDF3QllXQnFvd1RSZlpEdW51c0RpZE1weWpOU0tpYndU?=
 =?utf-8?B?aTdUbndQK2NpaFFQQ2UrL3pNekk5M2FtR2VpWU1Fd3R3N25vZGpGTWpQa3dP?=
 =?utf-8?B?MVpwVjg2TTNvL2EvRllUUlhWaVJWajBwMi9BRDBwSisrN045eU9PajdSZGZY?=
 =?utf-8?B?M0tDQ3RMSUgydnBhRXUyRUtPRndhcnR3WXBLS05ReW40N1hib1dNeURjTnMr?=
 =?utf-8?B?ZnpFUldtdVVLVjd0SzJObEpwVXE3bmRnTEY0VVBYekFhRWpFQUtTS0JpdUFY?=
 =?utf-8?B?U1gxbVJaUzhRSHB0S281TEZRL1NqcUpXd285Nkx4MDBqR1NWeThQb3p1RlZF?=
 =?utf-8?B?YjFDaVJldkNGSkdhSkNCSjlzeW4yTnNsRldBcTN2QWZ6NmFEeGRjR3kxK2Vj?=
 =?utf-8?B?LytwN09LUFdRQlNxbXQ0WmdjSWlmSGlJYlFQOTFpaXIvaGxHMEJIcU05ZFNM?=
 =?utf-8?B?aFlKNE0rY1Myb0l6aXhjR0taY3VEY1RWZzUvNFhIOUdYcEs4ekxXayt2cjBD?=
 =?utf-8?B?Q2ZIZnBzcXA5Nk9mcE5VZHJrMU54SVhmR2VJZlc2MmlyMEdWcXNWVHA1R2N1?=
 =?utf-8?Q?Xqi08BEfjBovVIA7sGxmamsC6?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c25d91dc-c52b-4f1d-eebd-08dd60b45502
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7512.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 15:49:39.5163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B89qawr9cOOnWeHimOjW+3jf8ljzBvbhxEZYnLPYYL9XJdHG30wOTDpRoRtLbO/Ks4cSfUV1MLGbyeruJRFg3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8443

On 2025-03-11 16:35, Ayush Singh wrote:
 > Allow constructing new values for a property using old property values.
 > Can be used to append, pre-append, duplicate, etc.
 >
 > In practice, it looks as follows:
 >
 > dts-v1/;
 >
 > / {
 > 	str-prop = "0";
 > 	int-prop = <0>;
 > };
 >
 > / {
 > 	str-prop = /./, "1", /./;
 > 	int-prop = /./, <1>, /./;
 > };
 >
 > dts to source output with -T -T also works as expected:
 >
 > /dts-v1/;
 >
 > / { /* base.dts:3:3-5:3, base.dts:7:3-9:3 */
 >          int-prop = <0x00 0x01>, <0x02 0x03>, <0x00 0x01>; /* 
base.dts:4:9-4:26, base.dts:8:9-8:36 */
 > }; /* base.dts:3:3-5:3, base.dts:7:3-9:3 */

I think it will be a bit easier to understand if the two examples 
correspond to another, i.e. to have both int-prop and str-prop with the 
matching value from the first example in this example.
