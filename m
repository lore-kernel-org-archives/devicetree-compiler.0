Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2127.outbound.protection.outlook.com [40.107.22.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128461494A7
	for <devicetree-compiler@vger.kernel.org>; Tue,  4 Jun 2024 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512534; cv=fail; b=H1HwKCqMCM5A4dlLr3xpISIiPR2AxxuvCQ+0OhyORun8c/Q1LDI8uqr8fZ+Bh+EU4z/rA6Xe2rhUEab8H7bochL+8McXPXtbI3ydxPudiNawJh0WlNL8R3Q7bvK3UTMSrXUw/Kl9BK21XRA5MAkTD0JYOPRA3HBYcL9tFOJ5bqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512534; c=relaxed/simple;
	bh=6RKFsvdOEn9HxXSw6EgZyWCoBE6xelKYk70GeK018RY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fy5goUbhx3j/cvWEvd/PRVobvQalvZ8l69/Gmug3p1M42qBIX7XN4sAG4aRwZWlSGhNZRLiRdSM3xQKjCCdkZhkp4zi/p+YRhDZL048YkKB/dWfZinzIWrBpO7DchYSO8+/qMFCULgHL9aExC8SgHpKPtk20wNDw5VWBQQ18Zos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=mcJVyJgO; arc=fail smtp.client-ip=40.107.22.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="mcJVyJgO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWhloJH7+hwxuxH4fJtn6/mvEvbfpJiI86DCXmnfa2U4wqLvXdKPYYB4st6ayq92wZ1lBpNeOAxNvXx1BwMj/BraISXm9ZMDNgJs718E7c0n5dj32EU/baDo07tvchfUF9BWayzN07XP71xR4J4ZqN9CY5fLQyIVkJ/fq4UN/338FGuG+YxlfY0a+++LtSArGY1eusL4M3OOMVZeCdaR8UeF8Q4hsBt+Y0hc98biLgLW2Rk4+VTkwrZxGwX9Rj8OxlhjZ1w3fWbDoPZ7ZykZDMHbB5e7QbUvHr07YnYgpeUqq7beVrLxY69NzVPWx0QmnOWJZRCJM+KLu8pKYG7XUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIBGqlj0yHP1mRxMKe5TuF3DBFnsLfJZv5LE1XT6+LM=;
 b=h9RRbiwyvZehUluhRI2EPh9dCtEpDLWgViPywKV1OPGuZNJUgddgZOK2u2DjttrEkt6b+nz+AM/zGOxFmZq7WgWLh5IdmJFVYwEFrYwGzqlwfElOykwN0PYpBUBH9D+1DuC12RiDqjTj7XQXBAwmfGNsorXwxe3Cjo1PzXUwUN0DNKhFgcUuCxv2O53yG07I+Tljtdk6oav7aLtM2akhnUKBC7sA3XGlzU1y5X69oTtCBS+WookFuaaLvlhdQfC9r5FBL9SjkWOOR+juh6/8tDF2LIhY/Nv5BQB8amjLK64ei9Gud2oTUBez5HfJ4w/bFYLRYq2ygsvhsvdeUmYJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIBGqlj0yHP1mRxMKe5TuF3DBFnsLfJZv5LE1XT6+LM=;
 b=mcJVyJgOBXn/XkmK/sxA/KQRIIIcS76CfI6XpvS3RA4Bz60QMdsy0Ah7UGbwm8OD7VwDXrP5EUpp/V2Yqf42469heTnGy7iqB+rLAVc5a9Xp+Q+2qmktnoqDVl17X0uCeQp3iBf39xXOdTmhA3ThWa7gXJ/abNRspdsYJK5bIKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAWPR08MB8984.eurprd08.prod.outlook.com (2603:10a6:102:341::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Tue, 4 Jun
 2024 14:48:49 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%7]) with mapi id 15.20.7587.030; Tue, 4 Jun 2024
 14:48:49 +0000
Message-ID: <59a8ed6b-1410-40d1-8a32-69cc8741311a@wolfvision.net>
Date: Tue, 4 Jun 2024 16:48:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checks: relax graph checks for overlays
To: devicetree-compiler@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
 David Gibson <david@gibson.dropbear.id.au>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
References: <20240522-bugfix-relax-checks-for-overlays-v1-1-130c8b85c06b@wolfvision.net>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240522-bugfix-relax-checks-for-overlays-v1-1-130c8b85c06b@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0155.eurprd07.prod.outlook.com
 (2603:10a6:802:16::42) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAWPR08MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: d27ed572-3fd0-4c84-f3d8-08dc84a571d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUY4VlUrQ1RnelhZVW93M0d2dkZlbmRnT3J1NWNpLyt2cUI4bHY5c3FJaUN3?=
 =?utf-8?B?V0lJVERIWi9lekp6dHY1dElsL013d2VIc1cyQ3NsbFEwcWFyOEwyOUtJcVkw?=
 =?utf-8?B?NnhDbHBHUm9EaEVTb1luMGVpSnZYU3BWWld6bVJLV1hERitmdEtEeTVaeTRJ?=
 =?utf-8?B?enJmdEFPL0gyejl4NTQvR1RNTzFlTFhPU2FPV3JxcUdGb1VUTDd0aVF1VVFL?=
 =?utf-8?B?eUZHZkNyN082OU11U1BoTnZhamNUK2lUaUw5RjV3S1hvTzg5UE9oNUpWUlg5?=
 =?utf-8?B?NTc3Qjd6TkRCeWNEQTVQWGMxU0lKVXVUUUEyWU1MdUd6cnlDRDc3VThGY1Rz?=
 =?utf-8?B?bzVRcXVLVGdtZU1nMlBwZjYzSkJ2RkJVVGdFQUpNUlVGeTYwNXRCY29heEhs?=
 =?utf-8?B?WTlTUnZPOFF3WGVoYzA3cTV2Y1lzZmJMcTBzK3p5NE1RcFJ2dEZIVnhhNzho?=
 =?utf-8?B?WXpUQXZPYll3Vlh5ZjNPUE82QXBsNlVuSGNEVENXdm1kNlhRWGJFL2JCOTFo?=
 =?utf-8?B?YzFQd2svSXY1bHVMZnhPSWdjV3h5Y2hyRlNxNGpvNFdlZGc0N05PK0hlU0tP?=
 =?utf-8?B?bHFFUGs0QmZ5MVVVVXF1d2NERmp3cDN2QXhwVTQwby8yMkRwM1hrRW1kUXhp?=
 =?utf-8?B?WFNuZlJFRGRpaVU2L1NWYlhySmxQMVBjNE1YNkgzMWU1cVppVEZRUktTcEdF?=
 =?utf-8?B?K2M3VE1VWkRSNGllUnRrYnV1Nm01VFZtdjN4RjJjMzFGRm1DVWtFaGg2WENT?=
 =?utf-8?B?NlFxMVlmb0lDR3ZxOHhsWXhDcUw5SVlWZ1hrOXA1L0YyRjl0bkRFQkhvdWla?=
 =?utf-8?B?WE9rLzArZmlWTXF5c3FrYkpXODdqajBzVUV3aUpQRk12dHhYV2hkalluM0tQ?=
 =?utf-8?B?Mm1xbTFVallYV3llWWs2NXFic3JyYjVYYno5aWZjYXhhM09ZVUswT0d1cDdJ?=
 =?utf-8?B?dkxseW9rdUU0cVdQZHVoOWdPcmlXVWVYNDBpaUw1MzZwQjlwUlJBbmpGTTV4?=
 =?utf-8?B?R2VGMzFvalJseEc0Z3FaS0wwOWZ6WHRKblBDS3dTZWFUb0d1U1FPT2h2UldC?=
 =?utf-8?B?TDhGNEFiZjFnQkQwKzZsakwwSWFxR0J4MUVEdTU0TE11Z3cwdXJvcUxJUW1l?=
 =?utf-8?B?Ym8rREl5NW1EcXRleHc1YUtXTDJsWHgrbjZwQWlFcUUyNUZmelE3T1pwS21M?=
 =?utf-8?B?NXdFaE4wMEJYcklCNkFNQjJ2NEFkZGsyZVRzWnFRendxOFRFaUU1VUsvcmEv?=
 =?utf-8?B?aURLcS80R2FFbU52TVEvQ1BVTGVSczBlZC9udWVEcWJ4VWtrcmVsL2NPeEdh?=
 =?utf-8?B?Nkt0T0QvYmFPclhQZC83NmJ5cElHS2h2emNKMytlazFBVzNiaEZuWnR6a3RF?=
 =?utf-8?B?WUlBckJvRExKU0VXTWZnOTgzNEtmRUFsNkJ5azNKY2Z2ejN0d2FMb0Z2VXBS?=
 =?utf-8?B?SzRva2RXNzR5MDJiam8zYnFqcDBFaE9pKzRKdHQrbUlzV1NlbHA4cGtNTnpk?=
 =?utf-8?B?a1VuVFlqbEhreExjckJQckZQTWxrMnF4REVsSDdCVnBYN3FzRmhzMGMrbjZ0?=
 =?utf-8?B?V2p6OTlkaHNadEFGQjdtb1BkL2FTZmZqM2U0clJVY2FCRWt0WFEwUXAyUm5X?=
 =?utf-8?B?Q0o0M2llQTVyZjBYLzc4UFBVSEtxTlNnL012bEVib0NyYUl0RTdFakdsQkh2?=
 =?utf-8?B?RFpJd2RtWm9hbCs4NjV6TDl2UFpFRGRhdEI0ZFF3THpOQzMzWnE2ajB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGh6UnF1SjlCU2tGMUJNRFRGcWNZZ2c1ZVhnQmNCYnBDbFJWQmJEVDJRbXYz?=
 =?utf-8?B?Uy9RbHpxd3lVZXlERlJxWDVpY0RoZ25pRC9Sd2gzaFQ4ZlhLQkxtNWIwdDQw?=
 =?utf-8?B?eFczUDlIRmpWV0xjUXBjVWY3SWQwQmZWb3ZoS0QySXVmOU9oakQ0azlxNys5?=
 =?utf-8?B?NWhqd1VGS0sxcm5QOWxORXMyMmliRE5JRTVrNWV2N0l2bFFJbTRHODZLZEVT?=
 =?utf-8?B?R2xna3ZZVG1iOStMa1kyek0yV3cyQjJYNlE5R29lVXNBYjAxcG03RXhsb0Ro?=
 =?utf-8?B?UUErK1o4QklJZnhoV2ZlYlo0UlpwUUd4elFpUEJMM01NRmR4V3p3Y0RqcGtH?=
 =?utf-8?B?S1E3UnBEekZrcCtkZ09vNDFnRlhlTkYzWHF0RW84QzRwdFhtRkpOSm4rL1Ji?=
 =?utf-8?B?QkQ5SDFXV2hSWGVnOWtZNHZzeWJBTWdKT3BjS1hSUlJXVnFOcnBlR2lSbW04?=
 =?utf-8?B?cGhjRmZYWHdMdUEzR2pHZXVCZ094Rm9YUytkNnU5VUE3T3RmZGVpbGRDak9r?=
 =?utf-8?B?b3lWU0dzSHRhb3ZZYUhxdmhlM0pqT085dVV6VkhEcEJzY0pIaUJFdXhxakF6?=
 =?utf-8?B?K0VpZVlPVUk5VFZpZ2JRQlJwQVd2cWNNMDlwL3RIOUkrMmhOQnRtYXAyMTBm?=
 =?utf-8?B?VlZWQUJBbktrY3k3ZXo2RzFabEcvZEFnQUFUbnBRUWRaVWxvQlhvUEVnSjEx?=
 =?utf-8?B?ZlpZL2ljbUNYejJXWHdyMkhMMFlhVUFhQlU5L3dwTVlkTjc0MXMxbGRyZmN2?=
 =?utf-8?B?eTVwZmdnQmpSeUpWcmJ1RTR2MElZQVJDMWlVQXAybUZ6OWhSdkh6VzN5VjVu?=
 =?utf-8?B?L1ZkVXhkRTY4TlQ4dGtNV2RLM0ZDZW9qS1ZVUTFRWUtZamJyOU9hdXZqYkJK?=
 =?utf-8?B?WW4wS3RtTWE4a3gzbXFJc3Qvb0g5ak9oblhmTVEydVVZNFo5eWZUVzZxWlFR?=
 =?utf-8?B?T25QZXIySVZhK2VmY2tWZUtoN3dxRVp6bHhiNkNSK1FtZDlNNWZxOUNZYWtp?=
 =?utf-8?B?NVJCbjh1OHpwZTJWaTVJVG0xNUxYS1RsTXVEUWJkb1NubUNBMDE2QmJXeFFr?=
 =?utf-8?B?aDJnVndzQUVCSnBJRlRFSElibWE5bEFNZ2Fid3lKSHVXcGlFVGl4TUo4dGtF?=
 =?utf-8?B?L1dLcDIvcC9EYzMvNkhQUHVPV3AzQ1dJV3VvK04yMWFnNkpNK0RHVldpS1Fn?=
 =?utf-8?B?NDQ0Q1VwUmY3Rm4yOXZENzBHWHFGWkprdUlJL2tCVlQ5SGROaDlQalF3R2d1?=
 =?utf-8?B?SStPM1QwTFZjelRIY3dLdEU4SFdqbzBIbWtHaEQrK2JwNTd4ZmFrd1pabHV3?=
 =?utf-8?B?WGJEd1JRdGg3YmJTclNOWUNHcVB3K1FFK1htcC85NXBabXYwbzRqb0hTcW1D?=
 =?utf-8?B?Y0dpcVo0b2laR0RyeGNrNWxnOGtmOGs4TXpNMFd4cHY3ZlMyWVpXc1F1aFJC?=
 =?utf-8?B?QVRwMjJNK3V6ZzdoZGJrdEhRMjVJcjNUQVI5azVIbmpRRHN3MTBTdzlQR0RX?=
 =?utf-8?B?REhmTVV4bGdkS0Vya2ZHM1BOZlJqT2dmcHgzYis0OVZ4eWpQdEtTZDNvYzZu?=
 =?utf-8?B?UTlWU2dzRXpIN2E2U1Z2ZE1oeEtqTEJIZVJSVkhqTWlueG81V2RUWlFWQzFS?=
 =?utf-8?B?dzcraGx3UWZwY2k1dyt5VXhqcGV2WXluNFVzeWdpN2VRZFBBV1hFaU1DWlNT?=
 =?utf-8?B?SXZQMlkvNW42bkVRNEJmbVVQUmwrcnJiZ1FwY1VkMUpEYXYzeStvcUVKY0hU?=
 =?utf-8?B?bGFRSUIvMSsvdkJUZDh6aE5Fb0NTbzZOODE2S29pQXZTblhjU0FTY1Rwd1N3?=
 =?utf-8?B?eUU2S2F0ZjJtS2JMOE4yM2lxMzUvTHFjQ3ZoTXdJSEtKb1Y0MTVwZXFCRi9v?=
 =?utf-8?B?dmdRV3JGczJUY2JxY0h3VU1HRFE2SWZnRUZPQjZyNHlPVmNWd2F4b1NTcXNK?=
 =?utf-8?B?U1BBNHZLZWtlVUhUUkN6TUlaRWFiY0I4U01qUEFrRWp2Z3c4NFd2TlNOZGp4?=
 =?utf-8?B?OFBGaUdvQmtEZlg1YjZDeXJ2M1pSQ0RKd0FJQ1FPMXl6d2lGbkljTjBXYUJv?=
 =?utf-8?B?U2s5UkYzcDRhUUZPczF0VUErSVJ1SWhtcmpIc0RYRktaeFpjUUVOZkJ6RmZq?=
 =?utf-8?B?S243SUpIZGt6cEc3RmU2am85cHhOTG15S2Q2RlNmWGt3Z1FBZlNaVzRTRGNi?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d27ed572-3fd0-4c84-f3d8-08dc84a571d4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 14:48:49.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/mH2s3LfbiY9dvy2wfqoVYArC8hyYFOib/x5f13Er25ZFRqFCedWLloYQgTkx0Q2pCcXGJtXtpCCjrxcz0l4hM3PN6MubZP+mSMNREAkA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8984

Hi all,

This is a gentle ping with David and the DT maintainers in Cc: (I am not
sure what the protocol is here, so I'll simply give this a try).

On 5/22/24 16:32, Michael Riesch wrote:
> In device tree overlays, the following patterns occur frequently:
> 
> board.dts:
> /dts-v1/;
> 
> / {
> 	display-controller {
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			vp0: port@0 {
> 				reg = <0>;
> 
> 				vp0_out: endpoint {
> 				};
> 			};
> 
> 			vp1: port@1 {
> 				reg = <1>;
> 			};
> 		};
> 	};
> };
> 
> overlay-endpoint.dtso:
> /dts-v1/;
> /plugin/;
> 
> &{/} {
> 	hdmi-tx-connector {
> 		port {
> 			hdmi_tx_in: endpoint {
> 				remote-endpoint = <&vp0_out>;
> 			};
> 		};
> 	};
> };
> 
> &vp0_out {
> 	remote-endpoint = <&hdmi_tx_in>;
> };
> 
> In this case, dtc expects that the node referenced by &vp0_out is
> named "endpoint", but the name cannot be inferred. Also, dtc
> complains about the connections between the endpoints not being
> bidirectional.
> 
> Similarly, for a different overlay overlay-port.dtso:
> /dts-v1/;
> /plugin/;
> 
> &{/} {
> 	panel {
> 		port {
> 			panel_in: endpoint {
> 				remote-endpoint = <&vp1_out>;
> 			};
> 		};
> 	};
> };
> 
> &vp1 {
> 	vp1_out: endpoint {
> 		remote-endpoint = <&panel_in>;
> 	};
> };
> 
> dtc expects that the node referenced by &vp1 is named "port", but the
> name cannot be inferred.
> 
> Relax the corresponding checks and skip the parts that are not reasonable
> for device tree overlays.
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
> Habidere,
> 
> This patch fixes several warnings 
>  - Warning (graph_port): /fragment@3: graph port node name should be
>    'port'
>  - Warning (graph_endpoint): /fragment@3/__overlay__: graph endpoint
>    node name should be 'endpoint'
>  - Warning (graph_endpoint): /fragment@3/__overlay__: graph connection
>    to node '/fragment@2/__overlay__/.../port/endpoint' is not
>    bidirectional
> that appear when compiling device tree overlays.
> 
> This first warning popped up e.g., in the scope of [1], [2]. The latter
> two warnings appear regularly when compiling our downstream overlays. As
> we plan to submit them to mainline soon, we'll hit that blocker sooner or
> later.
> 
> Looking forward to your comments!
> 
> Link: https://lore.kernel.org/lkml/20240412-feature-wolfvision-pf5-display-v1-1-f032f32dba1a@wolfvision.net/ [1]
> Link: https://lore.kernel.org/lkml/20240423082941.2626102-1-heiko@sntech.de/T/ [2]

Feedback on this issue would be most welcome!

Thanks a lot and best regards,
Michael

> ---
>  checks.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/checks.c b/checks.c
> index 2fb7ee5..2ea5913 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1822,10 +1822,14 @@ static void check_graph_port(struct check *c, struct dt_info *dti,
>  	if (node->bus != &graph_port_bus)
>  		return;
>  
> +	check_graph_reg(c, dti, node);
> +
> +	/* skip checks below for overlays */
> +	if (dti->dtsflags & DTSF_PLUGIN)
> +		return;
> +
>  	if (!strprefixeq(node->name, node->basenamelen, "port"))
>  		FAIL(c, dti, node, "graph port node name should be 'port'");
> -
> -	check_graph_reg(c, dti, node);
>  }
>  WARNING(graph_port, check_graph_port, NULL, &graph_nodes);
>  
> @@ -1860,11 +1864,15 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
>  	if (!node->parent || node->parent->bus != &graph_port_bus)
>  		return;
>  
> +	check_graph_reg(c, dti, node);
> +
> +	/* skip checks below for overlays */
> +	if (dti->dtsflags & DTSF_PLUGIN)
> +		return;
> +
>  	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
>  		FAIL(c, dti, node, "graph endpoint node name should be 'endpoint'");
>  
> -	check_graph_reg(c, dti, node);
> -
>  	remote_node = get_remote_endpoint(c, dti, node);
>  	if (!remote_node)
>  		return;
> 
> ---
> base-commit: ae26223a056e040b2d812202283d47c6e034d063
> change-id: 20240522-bugfix-relax-checks-for-overlays-e72b11df44a1
> 
> Best regards,
