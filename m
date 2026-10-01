Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF0B3F54D9
	for <devicetree-compiler@vger.kernel.org>; Thu,  1 Oct 2026 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875148; cv=fail; b=EqIwSvdsnGdiE560sygJclLmGtFKAceR5h7dbsvEiHJ9AWoMdJBi0sucPKwZQJ3tkjAwYIhKkdFyKqzd1OWHvWdKuh24e+XOPDlLZYlPJJV58zJPg+iuRYFyI5mg1EpUEFi5HMQI8aKfo+mJMdnPJ9beoq0Ah7L/i76TAahrmoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875148; c=relaxed/simple;
	bh=/IUA8miIBnSndWqZkoBWqoSzk14Meaz5ljjItNGXLLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XRB7kv5o0dodXCd6aPun7WhW0nnaQlYEcTDj51lJb7bdKcYKV1sBGas0z9z0f6fPnamj3TIfNB3JqObcBMTaVAQjlo9qhTGyVjyopXzJMh1POQ0SlXJyYIL7WW+vuQsG1A1sN4UYYU5k9S1HCNnfCTItMxrCP25gJAuhSDzkp+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0YBcFaVy; arc=fail smtp.client-ip=40.107.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0YBcFaVy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTplDWKkAwOrqZUb2Dfy7Nu0c//JTohQVfbvu8prb96imTntpmUAIgWNL06ah8o9RY5Ub7aPoEe0RTy7tlp4zl4TZ/o02am/Zx+fqeKCwAfmlBzmqEJ90cdVkz3WUUU82h9IvHJCXRGZrHqvg0IjPbGmWz9Jga8doUaVhN5o69iwfGNmf1cUfQpBjHralypnpRqTMzH684tL1H38mXN55joYSVwaTASEL5IM/8PzgpL1Hk5rlig2rWHHzc7GUsPEjqp1kY53mxFSa+mfX9MnX0EGHQRE4aaQOn3AOMIy1uzNAZF5d1c6RAkx/37erDC8WgFjLa5BaIVoIMT+CGTRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKV65HomazuoevCIJyVh7S/qoYpPZp4W4rf0HsfDNaA=;
 b=MTADX5tctrIbEkTyuD7xsGrWVXqVDqIq6mw9HYwAiL6JYmvoITqQ8CKsGHQkk/jtxtsG8/rAXTMbSkaWOBgLBK1L6RieFSdVy5t5BzmqypDmgqup6M5h2AhfCqSj/9CicdBuMCDwHyc+P+5OIpsZDzJjn9NKfbGgRuunNYnogBdQojER5AfhS6BlVeTT3iA56lJ5hZBQQUVVLE0JB1KpbQkgeHFL1sIH2tFSzPvO4Gzd/Yf4A97IDe0E3OtW2wpaR99ZJ6/J4O7UQqB7t1tkZaXjN9REDMasPb0EPffIdMWEiy5/UNdRKrFueV2UxEZeiFv7C52i4LT9kyOSFkDMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKV65HomazuoevCIJyVh7S/qoYpPZp4W4rf0HsfDNaA=;
 b=0YBcFaVyNWivcfmqjjYz4GvltnQNCHbnSEY07FqUsRWFeWCyCFgkGJpdD4Qvu+0+Ps6/XAi5t0fYM7EWXBLwRml3ohTu4Br03WiJCy3RAdyVcr484GdLpsKNMHCzNfzMZEfOiv59dTzVFSHWV+Tl865drnEPUIttz50dvCAkH24=
Received: from BY5PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:1e0::31)
 by PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 17:18:59 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::a5) by BY5PR03CA0021.outlook.office365.com
 (2603:10b6:a03:1e0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Thu, 1
 Oct 2026 17:18:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 17:18:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 12:18:57 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 12:18:56 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 12:18:55 -0500
Message-ID: <8ec742e7-677a-46af-89e9-a581375e6f1f@amd.com>
Date: Thu, 1 Oct 2026 18:18:54 +0100
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libfdt: Fix fdt_get_path() reading before the start of
 the buffer
To: Herve Codina <herve.codina@bootlin.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
CC: <devicetree-compiler@vger.kernel.org>, David Gibson
	<david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20261001121036.2910243-1-ayan.kumar.halder@amd.com>
 <20261001171010.3715b028@bootlin.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20261001171010.3715b028@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|PH7PR12MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef8f5d0-ca7a-4aef-fd6b-08df1fe0140e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|5023799004|56012099006|10067099003|4143699003|11063799006|18002099003|13003099007|22082099003;
X-Microsoft-Antispam-Message-Info:
	YppuOdWomn3PzxZYgfObrxfxRrE/1X0Df31zpPK0B19HRQU7iFql3qCfm0wwX4N1orZFN420Mjjf1ziZljvKM45oEVrGYowwUJzROOIxkZzLvz0YOmhxdWwV+Az88qfnHwW1GI6UhoHMFzH7EpJkwOvBTPaJGzhU+IeWpx/TWGfesg09XBppG5AOb0n8VLN1ZQHSEZHfxNYuM58sX4zsZv26qPgaS2qbgEsYWY1N5AJ3jZtxDrY2+zmsYzAZ+hMehPv7wc3b6cwMNQZwzFY1DSdsSsx2o9HGlWAUfRUEiLcI7JtbfFWlgAkzD2bFWoNi0qkpwgcgm5Qp9nZABLd9QGya/1uKLiR66ip5SXq6WEpGtdd5GOtV3uHagejulQvfp6LWIg691o2YJ+np2CSBAgO2/Vi3YhIBMJ88q0w5zie6+ZUivGqzxLvviDFiOt2iHu6UuJeBfbOnt0xnzSUzQH9z2Kc/80NZIVKqaHbzBtdf9g1UKezuS+mdpGquDMpNro6LqIsB0uhPIwqpHjDwDCZlJXXMCsIoEp20SLveSvRUt/lrCuh5Op3yEAHUWAaUUb7A2C503WcnpSBL2yNFXZCpqA4S6uHBrCEB0OefltRClLrl5g3rHD0ER5ShfczSMgBD+uNTRoaIHgfG5dsS21I+n0xaB8MEKulPhQ8FLy8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(5023799004)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(13003099007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	96kNNI5486yEBIcbsnb9zqnYy5H2G5dG3N5v1JnAstuEbSu4WiwQ51I2t+bFoezHa9sStKVoS6YWc0V5COKy0XecHdnuZm6flhphneMXEA6eBGlkhFiK/dt5DPQUhwIObBFqgAdcVUBIzw3ps6G8+Sfro+12urwFD9xVo9qX81eur8ulSo4tGJpeuOfolLp8H2Xx3VKYjrumcnJmJmNd+u5bffM6d4CyT4JORArypKe9goGEyyL3TKcb9KGhO2dzU02GK9typK+viuaWisexLP6PAqMRs3w+uao32wWOmnqQLU2B6gTpp81VASadlqIQIPSeKYu/PU0anF14+YTj0R6MDGWmBSllHGM0AHpzK4OpS+Dd64LvDC1y7KyGs0cI6GFY8I1VNQV9N/IPm1Z3YQQJp8fsqA6EaZTgkK7Y9jWP5faACpM8e9v1XGN6Cok9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 17:18:57.8272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef8f5d0-ca7a-4aef-fd6b-08df1fe0140e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853


On 01/10/2026 16:10, Herve Codina wrote:
> Hi Ayan,

Hi Herve,

Thanks for the review.

>
> On Thu, 1 Oct 2026 13:10:36 +0100
> Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>
>> fdt_get_path() walks the tree from the root, appending each node's name
>> to the caller's buffer as it goes down and removing the last component
>> again as it comes back up.  It keeps the number of components currently
>> in the buffer in pdepth, and removes components while pdepth is greater
>> than the depth reported by fdt_next_node().
>>
>> fdt_next_node() reports that it has left the tree by taking the depth
>> negative, but the offset it returns at that point is the offset of the
>> end tag, which is not negative.  The loop only tests the offset, so for a
> fdt_next_node() returns an error (-FDT_ERR_NOTFOUND) when it reaches the
> FDT_END tag [1].
>
> I don't understand your point. Maybe I've missed something.
> Can you clarify?
Sorry, my wording was wrong.  I meant the FDT_END_NODE case, just above
the one you linked:

     case FDT_END_NODE:
         if (depth && ((--(*depth)) < 0))
             return nextoffset;

Leaving the root node is an FDT_END_NODE tag, so --(*depth) takes the
depth from 0 to -1 and fdt_next_node() returns nextoffset, which is not
negative.  FDT_END is only reached on the next call.

>
> [1] https://github.com/dgibson/dtc/blob/7a1e017926004ecff5fce62d62d42ce9f3e00082/libfdt/fdt.c#L283
>
>> nodeoffset at or past the end tag it runs one more time with a negative
>> depth.  pdepth still counts the components in the buffer, so the removal
>> loop is asked to remove more components than are there: it takes the
>> index down to zero and carries on scanning backwards for a '/' that is
>> not in the buffer.
>>
>> Stop the walk when the depth shows it has left the tree.  Offsets that
>> far along are rejected by the error paths below in any case, so this
>> does not change what callers see.
> If fdt_next_node() can return an offset (positive value) which is not pointing
> to a node without any errors (negative returned value), fdt_next_node() has
> to be fixed not callers.
>
> Can you give details leading fdt_next_node() returning a valid offset which
> doesn't point to a node?
The offset is the one past root's FDT_END_NODE tag, so on
tests/test_tree1.dtb:

   offset   depth
   540      2
   560      -1    <- FDT_END_NODE: offset >= 0, depth < 0
   -4       -1    <- FDT_ERR_BADOFFSET, from the next call

Does it make sense ?

I discovered this issue by building libfdt with AddressSanitizer.

( I am new to this, so it may be my misunderstanding )

- Ayan

