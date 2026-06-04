Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E471C84DC;
	Thu,  4 Jun 2026 21:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608321; cv=fail; b=FRQosGnZ46flZrZ5k/4ckZLj57tJHm9dLTGLPOBp27s6/GAFgfbfl8qVQGykelLeQoufBVdEEduEoehhIgF45n79y4gE+22lbNuA5VIbB0O4YpFP7W41YkAtstnLzbqyz6aYGT5tMC2sHAWwscfplkZ5DTyyFz2pBIT/Umq07AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608321; c=relaxed/simple;
	bh=U2XB/0mG7RZKO9WqKYeP5clK9isTnUUuvI2df3Cj0As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DfhYK9U/BzbF1E0H3JaDcmKgdYC28Yur9yh2aQjNRZTm1TuKL6IiO/9B55klaaSSbkc+TgrdT1pJWxTlGeNkY+LxANq5LcPI6HsTaUFyVJgvo9S8mRqZXvS4m7QDrxBmk1Xe8vAgtql4TyaSnBHBhoW9wKfduVOTV/+gdR+rOEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HDDwjIw/; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HDDwjIw/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUYtnqWlVtZ4o/mrzF+ZYj3HqL+7wLQzMeEf0H6jsVeXGR2X7Xdz3DnOMMa8PDIlJKCqvAQzsfdAClQhvQDO2uexPxcohtyKANQJkEj8piC4zVzVqX87DIIXXkX07tbAdgoLZEhiKXP8G2CVDnQ/zHWH/r8cEFPCKCJZZFkRTrWlzTa4xLrz8zS7vqhh6Y+bee/Zs8apGStlniUdOptl4Br4vopE8iStm9ywgEuNRXuXLd7KGLwgK2lldFjygYRn4KUo4o5sVRtf5wFy03zGmFBZ3iCd3/gPfUfTglYIVPZfS6mO1BmMai64Xj0zO+t+PbvM3c4C+JzQXjqSAmUNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRa9my+uh01l4Ss5qkDdk2mE64BFf7GJsWIEkLzVJ6U=;
 b=IdUnNNIxg1vC7vllxd2a7KLWEymVo9qV0SH1AxupvqRgQ4GtetrdetfPlSnnje4UukeD/QZIHJiGGnzFREr2HCmcF/wrAuo1DoZKrjvoUxI8iM0BJYC4/7rM2X1PHpqRMY07OvgMJVovdGUfPE7SsIb6k13nKD3ZF0T1TCAnzMeUCkD3hoOvhhEMUcs/0Kkpl30QQTR8dVkMN/vP3Bm7I8K6ulLfndCeCKCu4t+BKxzml1PCKsgNH0XR9Nyu2wsAOycgnYY/ZTfWSGAXlbcFkc1T0mrAoqdy817lCrHuIf4qk+sadv3s+p0C0DZ70hV9t5+yXBLLC42B4j09eacbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRa9my+uh01l4Ss5qkDdk2mE64BFf7GJsWIEkLzVJ6U=;
 b=HDDwjIw/J67Ey9Ogv9ewkBEvWP0YQYM9Q6VNpBABKg1TWzcVTek4dE/8Km942JJauovDXMnp0NpPLyl7O4px9I5ELDDYOvUZn7OgVkq/XwRL0QCv4p0t1R2XQ7uICj2hGhFh0HlRNBZUhZ3yI4q3TA/hJrN4vV0rpQyGypIdwHwnCqLDvmzsJbWmo/u1jP5EmCpjbxorvurEG6S1PlozKMbJ9cpruI7P9n+r9Ye+X3E+2xhrS7VrJM0/Ni5G3JPmT7DoekgH7bLirqbwlniBbd3j0/rKovdsTVMlTfZiz8iqimdSLbBeGRfauT19PuETwQWd2TAG983CS7fKT4dIDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7866.eurprd04.prod.outlook.com (2603:10a6:10:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:25:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 21:25:16 +0000
Date: Thu, 4 Jun 2026 17:25:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 07/10] libfdt: Handle unknown tags in fdt_next_tag()
Message-ID: <aiHtNAGj88tm7sls@lizhi-Precision-Tower-5810>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-8-herve.codina@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409115426.352214-8-herve.codina@bootlin.com>
X-ClientProxiedBy: PH8PR22CA0011.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 0237d44d-e3a9-4359-993a-08dec27fc575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014|22082099003|18002099003|56012099006|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	cFv4SIs5EiT91q7tU9bAx+27jzJfckzC+PQXK7XKrFdbhK+Gc3NSKd13Mf1n9DfMW5Rkh4rAghSOQIb88toco+gsLhnBn+6YbMDEUWLe57YhY6I0ZO3l4vvgh8nxacKymxJiETD2lh/pqgGC5u0uVgEdbO8gmeH4CtCSqGJgRi/R9HwBKxgt2ncJPRyIgLyOXZnotFA/8svKyfm/A3pBzgeiYqFFF2ADE+5IKhaVBo6zhX89zsTP+RuUZA45VzLTM3PZkzG4pjyhp6P3PuBBJmNO6TlPwyiIAGN6PLrNZqzDLuvSw+FhRjlGkn5J7rUAXr6vh3jwc6cBUCMVB0NvEY6FI0WtCcuHT3JXkdSHuJ/AKZ4K/kwS6sKv50QHA6fYqwCQgVKrAOdzE/ehtxhJYi5+ZNqT0h1a5gQDwVKrhdsKY4OOL3TkYoaGM7uJJ8jK3YkWOhdR4Ky322ehZBP79Od3gPgRDDz8xCfPDQRVO5AyeVyUCdLKPL2DV6Tg7TRGLmq7sHjILXEILZj65PAELc59JkZsU1QPvHKDysdPZhsWdvSBxWHD2leAFuSxN/uBS98FXHYjbBPKvTCmNjBiNNOOdkbfIDZRkjc69v2ujolVORdz2CKyulnaColMM++V4Hfpj/WcWvxAx9FrO3Z2rJeumVgmyP6Gsn6GjvxMQSy+EIyrYb8U8diW6n/3R3aM6DjqauPTyU1ClA3wovHTYw1N4cnZIHPFV1LtLpaFYBPc04MBwMrZe2+0SWaiNj0u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UzqZ/KhnWiknSYuaRmi27k23Q+u9MoNiJ4EYtysHetAqs/vtrJC1B6lCxHj8?=
 =?us-ascii?Q?D9k4bEhjdj0SDd+XebEvUgx10629s6DDfVLGmigtsD+goRwWxl2ie4vOtMSh?=
 =?us-ascii?Q?J8VoVliuePJFKNx8ffjhai5VvbfeLZZ+2kFa2UFjBldfwZOZysKMgK+H3wdv?=
 =?us-ascii?Q?LZ4tj8JbVkyeEVwpLtGgYchsYQqdJ9Www/dev9lbBV+Ycp7TfKhVk92Ks9Nu?=
 =?us-ascii?Q?xLPtGtzTptVcGC2etevSInQhAP1djfIcLeqXH0CVVCQlouFMb3LhVOMWUGf2?=
 =?us-ascii?Q?CUHJLXivvwWsqMzVB1tj7706Ur5Fi6kbA5Q+5cHU5NDJj+CIM6alOsG7U2fU?=
 =?us-ascii?Q?kWpD67F6dPtdYWTfZbxjSvtGYHn4XVSr3DN0Q0B3j7YHzM+RSAdk3h5Fd4cm?=
 =?us-ascii?Q?mFG1YDL5SlXRYEiqhHkb8teXrMS8uvrxqgg10xE4DH1LyYOdYJFHlwiHlEy9?=
 =?us-ascii?Q?NjdPA4McjU3K12HrAt3hf8LP/jCGZT3FPwFuhI/XoF8vdd24/tyU+NiGpS+S?=
 =?us-ascii?Q?d2H2etrBAk7lRIHDwmizm4Q9QovpsRhDQ5nEhMAt/qG+2wfsByNnEigdO11S?=
 =?us-ascii?Q?U6lQkfacLXLmYp+CAVDC2q0IxMKnbj1Y62O4BfyMy76bQwZmusSuHfYin+xf?=
 =?us-ascii?Q?jiVNgpxbBgCx5Lh+NYhK+hpfbxAWh5IQS2luEDehUMJ9tpyF+e31EwvggZBg?=
 =?us-ascii?Q?5IzbcZDh9lduoQZEiuEEyDnWahSSwGHcAeYDqv6RN/8aJxL7oH5w3vfBr8Ix?=
 =?us-ascii?Q?Zg5WD7HbF/CUDVo/ozR5jFmRFCj9ulU5tOx8If9D61he1IhZF+LWDMRhJPzz?=
 =?us-ascii?Q?j3Fov8UKGnDJ8LyDh6607CYFY5zzDyf0XOYPjP8qZx3FAwfJX21xuhxhKXeH?=
 =?us-ascii?Q?tAOFHe5+V8VqubxKF/+MBZt2InbRNFWrpl85uFuWvRAks0twmXXyHGGnGQ7v?=
 =?us-ascii?Q?l2nn3rpB4PqOodcf7khlsomsoih9QcOmMIx4Ih0DOCy9yUuqiTVuk+fZL8Ac?=
 =?us-ascii?Q?HpWsPbmx/mY+X9m+zaRoO9FpoeSY5s/AlLPJ0GevbSwD0P+r0c7tJ0S8Opy3?=
 =?us-ascii?Q?I45hww7HgCKazAW5PkjxGA25bPjAxa+mGftgu2g1qAwGUEK9NLd3Xh5wy58q?=
 =?us-ascii?Q?9l/Ml9lV7JQ5veayNdgNRKoGS8qX7+ttqCAK1jo87owQ+Rug81zlvaosZ6G1?=
 =?us-ascii?Q?9HgSs/LlWLLCfyN7mou7vpS++05cWiWIBVUQ/2ttX1DlGa2vZ76BIcFLIied?=
 =?us-ascii?Q?0Ee3eAJ6tcF62Got2kEq6AVp7tPlsYx9A9CKRLeJBqTPjvZIOJS7WTfcGfXQ?=
 =?us-ascii?Q?CE15FMwRq6DR6CjpiBuDdSAtvT5tcV6BBK58IJUxSmMGHffNlcV9xahhAw69?=
 =?us-ascii?Q?NgJA7pAwPlx1rWrlJpDGEfnNjJUE8JWfkLsiWazwnMa5UkEo465pTnCp1s/Y?=
 =?us-ascii?Q?L1Xpkl9g5bx3e7ghJ7PFaaPp04CxecPeqFofzrWPRFhiL62JZDpfChudU8cx?=
 =?us-ascii?Q?dJXgnKpmaQFfD6uk3ZqekQoHzUxrO07MaCXe6GqQsZLfbCMw8LB517uITY3J?=
 =?us-ascii?Q?4qDDo6JWQ69V+L+KEieYv18i6zpJ6UdX+9CkF1wO0HoiL+TFaBfO2gnelPCD?=
 =?us-ascii?Q?1S0OF8tl3ti3yBHSiCcms08wo2V4nqAwG+GqXBcbKBAYtipiLbn+0zMJlxJs?=
 =?us-ascii?Q?k3iBjJ7C/iFZoLASICtpO/95eBa5NtV3bf0qWd8scsm28FqahYAHsb4hR3DF?=
 =?us-ascii?Q?OVrGj53MAw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0237d44d-e3a9-4359-993a-08dec27fc575
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:25:16.3901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTHdH7FprQFOhFNsAbETn/fMHnWaomG9NIQNRqTb7Ue9z4NzUSdr/L3rKWSnegOyYe9wleKEuykwmvFVsnlF9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7866

On Thu, Apr 09, 2026 at 01:54:23PM +0200, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error when they are read.
>
> libfdt uses fdt_next_tag() to get a tag.
>
> Filtering out tags that should be ignored in fdt_next_tag() allows to
> have the filtering done globally and allows, in future releases, to have
> a central place to add new known tags that should not be filtered out.
>
> An already known tag exists with the meaning of "just ignore". This tag
> is FDT_NOP. fdt_next_tag() callers already handle the FDT_NOP tag.
>
> Avoid unneeded modification at callers side and use a fake FDT_NOP tag
> when an unknown tag that should be ignored is encountered.
>
> Add also fdt_next_tag_() internal function for callers who need to know
> if the FDT_NOP tag returned is a real FDT_NOP or a fake FDT_NOP due to
> an unknown tag.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  libfdt/fdt.c             | 75 ++++++++++++++++++++++++++++++++++++++--
>  libfdt/libfdt_internal.h |  3 ++
>  tests/run_tests.sh       |  9 +++--
>  3 files changed, 83 insertions(+), 4 deletions(-)
>
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index fb4faba..cce1373 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -167,7 +167,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
>  	return fdt_offset_ptr_(fdt, offset);
>  }
>
> -uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> +static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffset)
>  {
>  	const fdt32_t *tagp, *lenp;
>  	uint32_t tag, len, sum;
> @@ -218,7 +218,37 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>  		break;
>
>  	default:
> -		return FDT_END;
> +		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
> +			return FDT_END;
> +
> +		switch (tag & FDT_TAG_DATA_MASK) {
> +		case FDT_TAG_DATA_NONE:
> +			break;
> +		case FDT_TAG_DATA_1CELL:
> +			offset += FDT_CELLSIZE;
> +			break;
> +		case FDT_TAG_DATA_2CELLS:
> +			offset += 2 * FDT_CELLSIZE;
> +			break;
> +		case FDT_TAG_DATA_VARLEN:
> +			/* Get the length */
> +			lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> +			if (!can_assume(VALID_DTB) && !lenp)
> +				return FDT_END; /* premature end */
> +			len = fdt32_to_cpu(*lenp);
> +			/*
> +			 * Skip the cell encoding the length and the
> +			 * following length bytes
> +			 */
> +			len += sizeof(*lenp);
> +			sum = len + offset;
> +			if (!can_assume(VALID_DTB) &&
> +			    (sum >= INT_MAX || sum < (uint32_t) offset))
> +				return FDT_END; /* premature end */
> +
> +			offset += len;
> +			break;
> +		}
>  	}
>
>  	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> @@ -228,6 +258,47 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>  	return tag;
>  }
>
> +static bool fdt_is_unknown_tag(uint32_t tag)
> +{
> +	switch (tag) {
> +	case FDT_BEGIN_NODE:
> +	case FDT_END_NODE:
> +	case FDT_PROP:
> +	case FDT_NOP:
> +	case FDT_END:
> +		return false;
> +	default:
> +		break;
> +	}
> +	return true;
> +}
> +
> +uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset, bool *is_unknown)
> +{
> +	uint32_t tag;
> +	bool unknown = false;
> +
> +	/* Retrieve next tag */
> +	tag = fdt_next_tag_all(fdt, startoffset, nextoffset);
> +	if (tag == FDT_END)
> +		goto end;
> +
> +	if (fdt_is_unknown_tag(tag)) {
> +		unknown = true;
> +		/* Use a known tag that should be skipped by the caller */
> +		tag = FDT_NOP;
> +	}
> +end:
> +	if (is_unknown)
> +		*is_unknown = unknown;
> +	return tag;
> +}
> +
> +uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> +{
> +	return fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> +}
> +
>  int fdt_check_node_offset_(const void *fdt, int offset)
>  {
>  	if (!can_assume(VALID_INPUT)
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 4c15264..c1ae306 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -20,6 +20,9 @@ int32_t fdt_ro_probe_(const void *fdt);
>  		}							\
>  	}
>
> +uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
> +		       bool *is_unknown);
> +
>  int fdt_check_node_offset_(const void *fdt, int offset);
>  int fdt_check_prop_offset_(const void *fdt, int offset);
>
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index d147011..48ac6fa 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -576,11 +576,12 @@ libfdt_tests () {
>      run_test dtbs_equal_ordered cell-overflow.test.dtb cell-overflow-results.test.dtb
>
>      # check full tests
> -    for good in test_tree1.dtb; do
> +    for good in test_tree1.dtb unknown_tags_can_skip.dtb; do
>  	run_test check_full $good
>      done
>      for bad in truncated_property.dtb truncated_string.dtb \
> -		truncated_memrsv.dtb two_roots.dtb named_root.dtb; do
> +		truncated_memrsv.dtb two_roots.dtb named_root.dtb \
> +		unknown_tags_no_skip.dtb; do
>  	run_test check_full -n $bad
>      done
>  }
> @@ -961,6 +962,10 @@ fdtget_tests () {
>      run_fdtget_test "<the dead silence>" -tx \
>  	-d "<the dead silence>" $dtb /randomnode doctor-who
>      run_fdtget_test "<blink>" -tx -d "<blink>" $dtb /memory doctor-who
> +
> +    # test with unknown tags involved
> +    run_fdtget_test "25601 25602" unknown_tags_can_skip.dtb /subnode1 prop-int
> +    run_wrap_error_test $DTGET unknown_tags_no_skip.dtb /subnode1 prop-int
>  }
>
>  fdtput_tests () {
> --
> 2.53.0
>
