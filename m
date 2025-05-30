Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2845815E97
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 May 2025 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615925; cv=none; b=SBaQZWgbDrzfR6jR8Wte4XbAey4U/C2a4iokGNT/66LfCOpuIztUcizDi6f9t1IFCcrEURavSKoqkFGD4FQtCx98jfdcE7zhMPCjAxSUs/vApu/JbwP1N8jNKoQ2idMUChFpxPimMha84oWNoP1zmbJ365nYz2zT7NpYU1sl/Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615925; c=relaxed/simple;
	bh=aJxNHkywe3WMKn/Vw+iRGqMayf52lK54CllB7wQWQ9Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pg1ocBaEjAK1FhREhWS8ubUrgy4Hp3mrZZ6SQWLc6vrWtKa86NNGEOWW56O76G5/qEFd5ZQd+2Wtovm1sHps87qlgn/omnGIa1F1EWTJHmkpQ0FNODE28nF+wP0xySf+m1e3nPD4NkF3ADbrIcnLJogiTKNiBxXKPoBGXL+Y7ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NzyNAcWQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NzyNAcWQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBK74i005033;
	Fri, 30 May 2025 14:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yNDeio5lXg2GrnkxYJib7Inp
	BGGDB33LcrPzmmrVtxM=; b=NzyNAcWQiG+B2sKlTr1o1Fs/OaHOKvYMnJXhml9n
	47W420H14tYx7wsJwEwUUyBsqCU709xU1uoRR5kevmHDWqGY8aheBXPPa8M6WZbh
	6DcdOxxitsqm8Tv44MQFYw59Rn0VOGMveVdgr6l9Jz8GkRXATK95Yvdno0c/h1J2
	Lp1Bqj8b9aLyP5jjStRnuLj0INQ5GHtjxlt3av0rnAu5yt7jSXNayvSNz2L+5Tq4
	sXQGaBDYyXur4ofZAKZlobcIMo7KbAg1t7MhyCSJubPmdtaq49LzYj8LwZUrbo3j
	L8Q/+ho02x2OzUdWUgBML4E0o5e+l9dqGAnUZfnK+v687A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek97fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 14:38:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UEcCR2006113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 14:38:12 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 May 2025 07:38:06 -0700
Date: Fri, 30 May 2025 20:08:02 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Trilok Soni <trilok.soni@oss.qualcomm.com>
CC: <devicetree-compiler@vger.kernel.org>, <kernel@quicinc.com>,
        <kernel@oss.qualcomm.com>, Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH v3 1/4] libfdt: overlay_merge: Introduce
 fdt_overlay_merge()
Message-ID: <aDnCypy8xpyLWT8b@hu-wasimn-hyd.qualcomm.com>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <20250519091043.621316-2-quic_wasimn@quicinc.com>
 <4f366bbc-849b-4e8d-8ce2-c8013b8cedd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4f366bbc-849b-4e8d-8ce2-c8013b8cedd5@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6839c2d5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=LpQP-O61AAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ic4yfOBKO6LKE2JP2PUA:9 a=CjuIK1q_8ugA:10
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -X4CI0H7R-BJORRCvD9ZCFO7YZxCAVf_
X-Proofpoint-GUID: -X4CI0H7R-BJORRCvD9ZCFO7YZxCAVf_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEyOCBTYWx0ZWRfX8T9GM2iNpIJQ
 VeqaEEMwywaxjrYaU31C1OE6nR37FScmZCsoX71fsz2xmYXHJOD5c4IDqKFj6WspFlkVTR1f7lG
 rsUS1ir+ZfP+VSFDKsbJIWNbE9O/Ywh1WOEgvioskql04HVs82pUDQP4eBr3W1ycvR6YzxoLZSt
 0sWKIbG1mVsD8Sm9i2erMlgczXLB+Y7a55BpOuvkeAv/GdZfk4OQx3iRGJ3X+/FGujrFiGYLpuP
 HZAqhNYxj+KFmfh28xg/GoTXUhHl2bB9lzeqf6WjJ1LBv7wBRbFOSjjmvvZZVAVm6a2Djd/Y318
 0hAAEByfRHnShfQDOIvHKOqewpb3kC3MnTP0TsUdlVyxg4ZSzb3UfpFHs/HlUYCCqmoWea/d6Gs
 j8+0Cc5mbtgAdpQCfhKjCpZdXgv3XiRqI2BQlbSOPhH2tSdcy/gPxaNnVVCF3X4vw0YZq9DN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_06,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=462 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300128

On Mon, May 19, 2025 at 10:17:41AM -0700, Trilok Soni wrote:
> On 5/19/2025 2:10 AM, Wasim Nazir wrote:
> > From: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> > 
> > fdt_overlay_merge() merges two overlay blobs. It is largely expected to be
> > used offline on a build machine to combine two or more overlay blobs into one.
> > 
> > It is intended to help maintain device-tree overlay code in
> > multiple source repositories, but merge their binary forms (overlay blobs)
> > into one so that bootloader's task of searching for all relevant overlay blobs
> > is simplified.
> > 
> > Introduce fdt_overlay_merge() which is identical to fdt_overlay_apply().
> > Subsequent patches will introduce required changes to merge overlay blobs.
> > 
> > Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> 
> It will be nice to switch to oss.qualcomm.com, since we will soon mandating it. 

Sure, will apply for this.

> 
> > ---
> >  libfdt/fdt_overlay.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
> >  libfdt/libfdt.h      | 18 ++++++++++++++
> >  2 files changed, 77 insertions(+)
> > 
> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index e6b9eb643958..8690ed55c8f6 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -1098,3 +1098,62 @@ err:
> > 
> >  	return ret;
> >  }
> > +
> > +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
> > +{
> > +	uint32_t delta = fdt_get_max_phandle(fdt);
> > +	int ret;
> > +
> > +	FDT_RO_PROBE(fdt);
> > +	FDT_RO_PROBE(fdto);
> > +
> > +	*fdto_nospace = 0;
> > +
> > +	ret = overlay_adjust_local_phandles(fdto, delta);
> > +	if (ret) {
> > +		if (ret == -FDT_ERR_NOSPACE)
> > +			*fdto_nospace = 1;
> > +		goto err;
> > +	}
> > +
> > +	ret = overlay_update_local_references(fdto, delta);
> > +	if (ret) {
> > +		if (ret == -FDT_ERR_NOSPACE)
> > +			*fdto_nospace = 1;
> > +		goto err;
> > +	}
> > +
> > +	ret = overlay_fixup_phandles(fdt, fdto);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret = overlay_merge(fdt, fdto);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret = overlay_symbol_update(fdt, fdto);
> > +	if (ret)
> > +		goto err;
> > +
> > +	/*
> > +	 * The overlay has been damaged, erase its magic.
> > +	 */
> > +	fdt_set_magic(fdto, ~0);
> > +
> > +	return 0;
> > +
> > +err:
> > +	/*
> > +	 * The overlay might have been damaged, erase its magic.
> > +	 */
> > +	fdt_set_magic(fdto, ~0);
> > +
> > +	/*
> > +	 * The base device tree might have been damaged, erase its
> > +	 * magic.
> > +	 */
> > +	if (!*fdto_nospace)
> > +		fdt_set_magic(fdt, ~0);
> > +
> > +	return ret;
> > +}
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index b5e72001d115..664b141d5334 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -2313,6 +2313,24 @@ int fdt_overlay_apply(void *fdt, void *fdto);
> >  int fdt_overlay_target_offset(const void *fdt, const void *fdto,
> >  			      int fragment_offset, char const **pathp);
> > 
> > +/**
> > + * fdt_overlay_merge - Merge two overlays into one
> > + * @fdt: pointer to the first device tree overlay blob
> > + * @fdto: pointer to the second device tree overlay blob
> > + * @fdto_nospace: indicates if FDT_ERR_NOSPACE error code applies to @fdto
> > + *
> > + * fdt_overlay_merge() will merge second overlay blob into first overlay blob.
> > + *
> > + * Expect the first device tree to be modified, even if the function
> > + * returns an error.
> > + *
> > + * returns:
> > + *	0, on success
> > + *	-FDT_ERR_NOSPACE, there's not enough space in first device tree blob
> > + *	-FDT_ERR_BADVALUE
> > + */
> > +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace);
> > +
> >  /**********************************************************************/
> >  /* Debugging / informational functions                                */
> >  /**********************************************************************/
> > --
> > 2.49.0
> > 
> 

Regards,
Wasim
