Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4DDBA4A
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675068; cv=none; b=FwvheSYP1cSdijSsDIJLe65QBHMf1J+G9qs3/hSs7IS1UEJgn2/9ItGFTB1hCkp5/8XMBRfAgrEsGhfUgvHmg+FIjLRrsNX/RxOSDPt2HRXdSBTcsdzM6m721VwUSgKMme30ckWR/dADiYQ8iS41MEad38lUxecG5CiRWDVQvSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675068; c=relaxed/simple;
	bh=uPM2mAoPJC1ZD5KF/P8T0Q1DdZXy0Jq3GnkFh+WNNFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5tgLZ4ukHdZNgjH1Iv2lp8pavjX3h8IhF0hGoz5CJZY4h+Zwpesk3bo/WwCwO289lOhkDIiKffacIl3LTMSwYu7GNl9Okeay1DQVsveXUhjhJ8Hy4Qu5L47Z6j4xkFzqlPHGdXkVTUOb368C0s+dlM7CuwVUxK3k9bt/npHhWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wzzp25bD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wzzp25bD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JF02AS021397
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 17:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lgPrZNB7DwhQl/VdxOBhvjsDC88A68vW2KLUIivKW4=; b=Wzzp25bD2X3zd1Gj
	xEi9Xkf2qKKS48F29aiUKrB7noidOGqJ3A+CVbpGpQvRLeYkflvqg1AnqEYr5Xqr
	ImffCFHBXeJjsdNZwK9FXpaP65d1yBO/TmJ2T621AtDdClbdItZeNQ7XSGB8VCva
	l2wxwogkIrrB4f+6aYL54TvpLXjE0V83VzoG8rQKbqoDbScVbtIfIVdv8cJXJPEe
	3sFucR7IwXflTZwGHga3yMrDmWM2VD1ei7jzpY91l2AoeOMRCmSxbQl9SvLkHcMs
	OkI+6BbA4KqtJ8uR1BpSe24u5goaa8w+dVP45B9JIYW/y6QWU8kNDTbFyHVkIwBA
	4QJR3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r6vyrcdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 17:17:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-231d4e36288so31326005ad.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 10:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747675064; x=1748279864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/lgPrZNB7DwhQl/VdxOBhvjsDC88A68vW2KLUIivKW4=;
        b=W9y3haL8T8gyqAKDsG4OEMfRdNz51UKjyAZD8R2xT2KfBBQAgR2DRI2JbF5Mt/ZT48
         MpdXBnrvQK+syYdhnqO5up27Yc67JCmpudp/18VXwnj8GTick3f0MLlG5Z3nsRYVM34Q
         KpMYOZjhXB09pva1+wMM5yPRTOlslhu96biCWrn7bjBD6ZzPlhFLiB+DTTzRWT0w/nAd
         HLJKPBBzI9aXQCaSik6cII2g6nBNLuT8T+eJwL3D35P4BNBcF0s80+sdZs7HW5FNfc9+
         fK8DG8EwM5J77T4cbMP+M24r3/DLZP4NNrii7Kseq7gao9eYnhuuNr0yzPYXM/Ib+omH
         +1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCW578miD53mzAg6NR90q1xJvX2kMYuiKurAjr1eP+Kl/HwXWiMUi0GNIbJ4P0mRHG4j3trRW/IcsQEDgbeFCSWcfhqG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp0R44CNMm2JwZTNO8Cz7TeCRedALtUC6B/kRwBODb7B1f1chi
	Ua6/hdSVX6O9QruLyfnM4TqFdjGhcQUUTL6i751a9iu4wXb7jCP8s8Gw2Z/CTYCzp9KS5qKy3NH
	Dxpun8ka/hIgrS2hC0eiGsq1/JtATxuWKQbkFsSvdPos0DDcyQz7jiSHfc6kEMNXIy7kXu2z9Oz
	su
X-Gm-Gg: ASbGncu87DeI+hSksBPiBzOqNN6rAeXYO3EGcqcMtMwip8lxKrGAzHSA7PzbPdQdPOp
	9D6NlCXQLToY7fTH02NooORCrAx86wxyEbe5ueccCbP62uKdsxMYpRX3LOOQGLeSwK/Y4MtzSKx
	226aIdQcUtHwgHLG2axwkJewli8YEinSZihNIJnZSDwOqP9KpEEOotT4BV9N5XC6q3TcZJThVL2
	Sbx5oxzJhHXpUNY7lgckVJ3mig0wNoGmfBTsMVbFcsgohvSVbtE1qrQincgiCIfNIQhfQu/K3Gi
	Ol/Ncwaq3El+1OW8SnCsmh8hI5AKVbNd/Vr2cXFLu+XwuenWw32fzGRuq40ppZBZCegtzLi2eYa
	RfA==
X-Received: by 2002:a17:902:c951:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-231d3536065mr178170395ad.0.1747675064235;
        Mon, 19 May 2025 10:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfG8uf94RAY0JgpWgUUJgQh3Hl+tOPmwpTFbf/2WYCgVyadee/O2F6GPkIlXHfKIY6oHxjyg==
X-Received: by 2002:a17:902:c951:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-231d3536065mr178170135ad.0.1747675063360;
        Mon, 19 May 2025 10:17:43 -0700 (PDT)
Received: from [192.168.86.35] (syn-076-176-048-107.res.spectrum.com. [76.176.48.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed571esm62565415ad.248.2025.05.19.10.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 10:17:43 -0700 (PDT)
Message-ID: <4f366bbc-849b-4e8d-8ce2-c8013b8cedd5@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:17:41 -0700
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] libfdt: overlay_merge: Introduce
 fdt_overlay_merge()
To: Wasim Nazir <quic_wasimn@quicinc.com>, devicetree-compiler@vger.kernel.org
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com,
        Srivatsa Vaddagiri <vatsa@codeaurora.org>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <20250519091043.621316-2-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Trilok Soni <trilok.soni@oss.qualcomm.com>
In-Reply-To: <20250519091043.621316-2-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfHm13D4 c=1 sm=1 tr=0 ts=682b67b9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=wCb6IjQJCxI75TCTlYEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2MCBTYWx0ZWRfXzEZIxaYmy0F+
 WwTrA6P+RS1qOL8mdXRR2BX5wiWy0jIypLgLBfwsC8ibwkeWRz+z6JbB9YUj3Z7kELnPAhv4ppH
 mwHfpiY0fQQmRTDVwR3KVirvAMg3596gpFOHkDkUgpRJoZkw25+BBwldqg5TXvuTgfOcmmWe+dp
 PmPUd6FzsSlDyP8L7Q/h5WP8r5F4xo5Mak2AGon0SPtCyeNQcL6ngD+1xqhd6iLYmr7zAqmsk0r
 nUVV6JbOD+y/cNZB9GteyY/OqDx7n9yAbuxCJ8/11GfGibRKTc/5t4FD++/Rsziv+vUpuouPFoD
 6J956jif+7BTRwnRa09b3ofeYzHlCJJK9REmHq3dUwZafK3g12vshBsj/rodvblVqRhP+q6QvDe
 /Dttq0HikmDbFeEfNraK6xYmNtqcro0tklgq6f6xX2MRmfGWVRm+0+uAn1M9X+NalzekNjkN
X-Proofpoint-ORIG-GUID: h5S6Eifg-5SgREBJMkQ4PMAMkB3yb6pZ
X-Proofpoint-GUID: h5S6Eifg-5SgREBJMkQ4PMAMkB3yb6pZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=747 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190160

On 5/19/2025 2:10 AM, Wasim Nazir wrote:
> From: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> 
> fdt_overlay_merge() merges two overlay blobs. It is largely expected to be
> used offline on a build machine to combine two or more overlay blobs into one.
> 
> It is intended to help maintain device-tree overlay code in
> multiple source repositories, but merge their binary forms (overlay blobs)
> into one so that bootloader's task of searching for all relevant overlay blobs
> is simplified.
> 
> Introduce fdt_overlay_merge() which is identical to fdt_overlay_apply().
> Subsequent patches will introduce required changes to merge overlay blobs.
> 
> Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>

It will be nice to switch to oss.qualcomm.com, since we will soon mandating it. 

> ---
>  libfdt/fdt_overlay.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
>  libfdt/libfdt.h      | 18 ++++++++++++++
>  2 files changed, 77 insertions(+)
> 
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index e6b9eb643958..8690ed55c8f6 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -1098,3 +1098,62 @@ err:
> 
>  	return ret;
>  }
> +
> +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
> +{
> +	uint32_t delta = fdt_get_max_phandle(fdt);
> +	int ret;
> +
> +	FDT_RO_PROBE(fdt);
> +	FDT_RO_PROBE(fdto);
> +
> +	*fdto_nospace = 0;
> +
> +	ret = overlay_adjust_local_phandles(fdto, delta);
> +	if (ret) {
> +		if (ret == -FDT_ERR_NOSPACE)
> +			*fdto_nospace = 1;
> +		goto err;
> +	}
> +
> +	ret = overlay_update_local_references(fdto, delta);
> +	if (ret) {
> +		if (ret == -FDT_ERR_NOSPACE)
> +			*fdto_nospace = 1;
> +		goto err;
> +	}
> +
> +	ret = overlay_fixup_phandles(fdt, fdto);
> +	if (ret)
> +		goto err;
> +
> +	ret = overlay_merge(fdt, fdto);
> +	if (ret)
> +		goto err;
> +
> +	ret = overlay_symbol_update(fdt, fdto);
> +	if (ret)
> +		goto err;
> +
> +	/*
> +	 * The overlay has been damaged, erase its magic.
> +	 */
> +	fdt_set_magic(fdto, ~0);
> +
> +	return 0;
> +
> +err:
> +	/*
> +	 * The overlay might have been damaged, erase its magic.
> +	 */
> +	fdt_set_magic(fdto, ~0);
> +
> +	/*
> +	 * The base device tree might have been damaged, erase its
> +	 * magic.
> +	 */
> +	if (!*fdto_nospace)
> +		fdt_set_magic(fdt, ~0);
> +
> +	return ret;
> +}
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index b5e72001d115..664b141d5334 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -2313,6 +2313,24 @@ int fdt_overlay_apply(void *fdt, void *fdto);
>  int fdt_overlay_target_offset(const void *fdt, const void *fdto,
>  			      int fragment_offset, char const **pathp);
> 
> +/**
> + * fdt_overlay_merge - Merge two overlays into one
> + * @fdt: pointer to the first device tree overlay blob
> + * @fdto: pointer to the second device tree overlay blob
> + * @fdto_nospace: indicates if FDT_ERR_NOSPACE error code applies to @fdto
> + *
> + * fdt_overlay_merge() will merge second overlay blob into first overlay blob.
> + *
> + * Expect the first device tree to be modified, even if the function
> + * returns an error.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there's not enough space in first device tree blob
> + *	-FDT_ERR_BADVALUE
> + */
> +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace);
> +
>  /**********************************************************************/
>  /* Debugging / informational functions                                */
>  /**********************************************************************/
> --
> 2.49.0
> 

