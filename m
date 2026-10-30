Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380095;
	b=YwwHyMBbKNoH5rojfZIqZMvXIfOp0uBzljTAYZnY5jzyGHWxjjaYgBRft/RFOr2tXUax
	 khuaCPx8A72QCnfITIDmbmH+/nqeXvFpv5ceHeZ8qi0AnNgNmNp5Nb0GDSRl1PqVhSiSC
	 vu2ibDlUE9PJka+SuKHsRmYF/B7MPU0V/CFE1Uktq8UFWwKndX5W4qn0VZx+U+Q7Bg3SA
	 lqCYYUD3DWyYqm6mKcfaHAHVH6YN0vJGyGsPgC6SejSWSYw0bvabryuoCZtOUNwZ6NCMh
	 MPUj1RbIUyTfHKLIX6X00dITQAkDxLNr5iD3XLQ+aY5mWQ3DDj5l/+8AvtqrD6nmgyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380095;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WI7il4H0M0I6GNERfW1cT/1hZVDDsmYCxPNjCWoM+Cc=;
	b=Yx2sui5pyXj1itBsrDUrWHGUR6LRNm5hQejSbCWeAPNQRHcQJoSxJ2q6lammc613xyUj
	 +8gdF8Q+sRrgLF/NwdSi1n2x2pMKivvhvXQxvb5ngi5jTZUCBALJrQ834B01xnqCA/keg
	 kCGDceDITXuxjNkDaGSRbvqIkl2+grrDKLJ+5twnmor9fK1uWNyBkL3PinN9qDRfpwZ3n
	 wCobpcDyJ7rjcc1Lyvhx0dIif9orDuycI2VYpRraQz1xXTfH4sU1NM591cgdr/0hQPyWJ
	 JgpMTQkRQjWNkymk1uFaK92C/sYGsHe6u2zti+hBZni6YaGV1Uk4r3KPweHKfcRJ/hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fzmvOfZu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.20
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67D3606A31A
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 17:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E67D3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fzmvOfZu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BayLeSwPq7Fmz5w1eqShvH2mvVY2pwt1mTiv9K/PkWmNPUvIw4GUBtWllUjLLFZLyhkfERP0bkl6YyV7Hw0VJHRtdZuaVtHMy1q8Ir9/63DksDEgiBY9pPy10RnWv16B3tsFFVeunQbmGGeXw7/ccx+PkTyAGMNOn1OkQbpg6y1fzoYwZLHQrMovbxLNiOUpcVry9/QkO/cGf0s0QNquHzUDElKyJqre0R94vhwmmoeURBJQq1rAbwHAOexsdeiZysYCOuWEROq/lp5ezYEk/UVlaVMGLdD3kA2hsSJAIqPZ10XPr52t2vTXtRDKtSZZN3sHP7BDhRP98cBYntV5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WI7il4H0M0I6GNERfW1cT/1hZVDDsmYCxPNjCWoM+Cc=;
 b=WT9S1a7ljsdsSVpUZ0Nx/RsoIGnbWWzpxjF2k4aYLN+aR9hprA+V3gjwSZaXLGFBDn7BhvLMubCRh2abEd1MjWoEL2F85oa07lA097F05MHL9GZIrqtJhunHlJcmvPnYB+4qBfXIVIWTipIfjfxgQfd4GYZML+Psd4luhUAm13S9u8kHwsu3idY24TW4wdD3tWZrGEKyhnTT9E4HM9WOLxyE1AS0h7dUhEkUHIXvLNJT+VkP0+1tAm013f3SnyZ9yFIEPB63t3uiLT7qEMQYB/xNHlFtcMgW7bIU6mCLeJ9Wv85lhhc86W2LHiTJu7LlgoDrMk0xtPUz6rbipKvQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gibson.dropbear.id.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WI7il4H0M0I6GNERfW1cT/1hZVDDsmYCxPNjCWoM+Cc=;
 b=fzmvOfZu6suJvcJtJEKggGkyq6tno5dXt7PclZylwnFH4ARKNtU7oB/LrNa/fYLqmx1+cJUrNan0CjpQJ8kjkzogiXGQbJ3VXdRBVjvxm1gJ2L0ZQsEUtXAWWSd3APota4d0ViCdvYpDWCohDNboT1WHBzjopSaGzvvK39MaLB0=
Received: from BL1PR13CA0296.namprd13.prod.outlook.com (2603:10b6:208:2bc::31)
 by SAWPR12MB999317.namprd12.prod.outlook.com (2603:10b6:806:562::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 17:08:11 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::44) by BL1PR13CA0296.outlook.office365.com
 (2603:10b6:208:2bc::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.4 via Frontend Transport; Fri, 30
 Oct 2026 17:08:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 17:08:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 12:08:10 -0500
Received: from [192.168.1.21] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 30 Oct 2026 12:08:08 -0500
Message-ID: <32a90a77-df50-4bd8-8f7e-b064aaa2d82d@amd.com>
Date: Fri, 30 Oct 2026 17:08:07 +0000
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libfdt: Fix fdt_get_path() reading before the start of
 the buffer
To: David Gibson <david@gibson.dropbear.id.au>, Simon Glass <sjg@chromium.org>
CC: "Halder, Ayan Kumar" <ayan.kumar.halder@amd.com>,
	"devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>,
	Rob Herring <robh@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
References: <20261001121036.2910243-1-ayan.kumar.halder@amd.com>
 <asRkJHpQ_gbAgC1t@gractus.seuss>
 <CAFLszTgkLjcNNYB+0sUAnpWK5n3tP5ZPUQB3-oF9Z8jB3YRi5w@mail.gmail.com>
 <as8VzAevIZu1eQCK@gractus.seuss>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <as8VzAevIZu1eQCK@gractus.seuss>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|SAWPR12MB999317:EE_
X-MS-Office365-Filtering-Correlation-Id: be2d733b-1aaa-458d-1026-08df36a8600a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|10067099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	sjI4nuuFEmX4Ndwt4Tgri/4NWewgxo0ZeRcUVttu0Y89HV+OqAZcULkkZ2xkXcT3WPJREjTNUDmeZe5nrGzeTOk77Nhu2A+iSADxnQ5OGeYEachx4bYbKkuSeO3q9Yjyg3p1PFSrECTJwsJGJmVGrqecpKmrbGLmPasGZR80hmQC6pQVaVasw6H3EpnsuxQJTe2tAEIQVPuVyaeDrtvdGLsCzpwt8QpyyOu07/MjQAIsNd7P2dWLDwl1yUVjlA5/7pzjX/EJLBVbQYLHUbx07FZeAE+7mNP8a2QwofwCaS3Ik4fhxBkdZsSMMQZbQBhcAi2BVxQfSIzqVRpgfq1udAw/E3A6xKtbRqpHDo8/Ze+DUJy5xFXVnmg5iSAFOO3J6JOYXpSEJWcuiWAWl0BTyH5B3IxmwaloxWL5pmTZ6TW6xM9Kv9RTaud/Rh/SJqZZ9AyBDanW7iDJgEbM2oDlFr0dsYu4VcMQlQf2sG0QUlLJbLMtLntJWcnj9ow2t9zADrANU0o+T2qobXPFG/SK0cFOtG1jUUBHjT63bEObCrL5Gz1ai2KoLt/5eEINZ35dath5FZnpxAv0jXFrrQ4eZ0cO58E/zu3brYorAO8KG3UzURvAk8Kp0RkOEJrUm+0gtuD2i3sAPzMTtOXw3PVYX8Sdlxz3E4jYI+Io6HM1pOkpdUgQwC9CJCTPkPtn0ZA1ahXl+tZaKP1bdGJ8QzRN2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IQ0IeFdxCQAjF98UtiVig0ciApSuygTEjx7L3KCnDcYitCMwZvFxnaiJ51KZr5r5wdngUr9qaMC6wyaZdlqGwJ9KkyeR09cvh/ZdqhmYJEc/lH+RWxM8DDi+Fn5KtxrUZoyQWh7XFno1ckA3eQxN+E92qmvJrbGkvX0aJiHEUqwwqNm2nQPMlO8QGdlmnHDpY6dPMt8hYPJvS5c8igWsIVD99PB9c3YPjpudc7kR4FeEzJ8Z5fYDBzwvYOhZXnSs68T+a1HU6L2urEW0MuLDVkA1d4vRB4OWAye2v/3cI37VhTqF4bye4By/JDqzT4TYnJFvhrhFVKSQnR5CjwrQYgQRjltQldQbxe21WrTUGIWZ0sFtjMyl6O78SW+O6Um96VDNZmPVxiIa2zpjb5nSwtcYuisUwq7l9F9WmxU9PyoHHTJWM0pAc213AeODLgRp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:08:10.3119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be2d733b-1aaa-458d-1026-08df36a8600a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999317

Hi David/all,

Apologies for the long delay.

On 14/10/2026 06:40, David Gibson wrote:
> On Thu, Oct 08, 2026 at 01:15:44PM +0100, Simon Glass wrote:
>> Hi,
>>
>> On Tue, 6 Oct 2026 at 04:01, David Gibson <david@gibson.dropbear.id.au> wrote:
>>> On Thu, Oct 01, 2026 at 01:10:36PM +0100, Ayan Kumar Halder wrote:
>>>> fdt_get_path() walks the tree from the root, appending each node's name
>>>> to the caller's buffer as it goes down and removing the last component
>>>> again as it comes back up.  It keeps the number of components currently
>>>> in the buffer in pdepth, and removes components while pdepth is greater
>>>> than the depth reported by fdt_next_node().
>>>>
>>>> fdt_next_node() reports that it has left the tree by taking the depth
>>>> negative, but the offset it returns at that point is the offset of the
>>>> end tag, which is not negative.  The loop only tests the offset, so for a
>>>> nodeoffset at or past the end tag it runs one more time with a negative
>>>> depth.  pdepth still counts the components in the buffer, so the removal
>>>> loop is asked to remove more components than are there: it takes the
>>>> index down to zero and carries on scanning backwards for a '/' that is
>>>> not in the buffer.
>>>>
>>>> Stop the walk when the depth shows it has left the tree.  Offsets that
>>>> far along are rejected by the error paths below in any case, so this
>>>> does not change what callers see.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> I think this is a bug in fdt_next_node() rather than in
>>> fdt_get_path().  It should not be returning offsets that are not valid
>>> node offsets (excepting negative error codes, of course).
>> The bug is only with an invalid nodeoffset past the root's FDT_END_NODE
>>
>> I don't think fdt_next_node() should change - fdt_node_end_offset_()
>> relies on it returning the offset after the FDT_END_NODE when depth
>> goes negative, and fdt_nop_node() and fdt_del_node() use that. For the
>> last child of a node, that offset is the parent's FDT_END_NODE, so it
>> is not a node offset.
> Huh, good catch.  Looks like I deliberately changed it to be that way
> in ce4d9c0f ("libfdt: Rework fdt_next_node()"), but I'd forgotten.
>
>> One option would be to reject nodeoffset up front with fdt_check_node_offset_()
> I'm not entirely sure where you're suggesting putting this.  I think
> the original proposed fix is correct, although having an additional
> offset test for robustness might not be a bad idea as well.
I have added it at the top of fdt_get_path(), after the buflen check:

     if (!can_assume(VALID_INPUT)
         && ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0))
         return err;

>
>> For the commit message, as you mention, use 'FDT_END_NODE' rather than
>> 'end tag' and make it clear this needs a bad nodeoffset - also try to
>> explain the problem in the first paragraph.
>>
>> Also please add a bad-offset case to tests/get_path.c
> Right.  I now think the fix itself is good, but some changes around it
> are desirable:
>    * Correct the commit message as indicated
>    * Update the commit message to explicitly reference commit ce4d9c0f,
>      which explains why fdt_next_node() works the way it does
>    * Add a test case

I have fixed all the three in v2. Please see "[PATCH v2] libfdt: Fix 
fdt_get_path() reading before the start of the buffer".

- Ayan

>
