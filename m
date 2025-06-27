Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE0429898E
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Jun 2025 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020322; cv=none; b=h8m0+JltX4lRqRd2pPtglADGTIq0u2+iFj6kYoptIe43/M89LqptA7g3CFaVbCVczp0obsq29/j80iv532bougicikKpbMdz7SGE5G5rpVlWbn/X5tohbqnEC0vHBBeOtbCDjvvCE1YoGzWV4QmG6Qu7L3SHCJPngRYGX++HnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020322; c=relaxed/simple;
	bh=Z+m4yH17P9izg9YuhVJc86SSQoo/4nb+noxdgAOdv5k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3J376/HP+dtREEQT6gQ51bfD3JOJraQCDEPdhbkAahpHYVQNUNnAQfw1RDS/0cX84IeSCCnt61RCnN2ttiddrwPmAqae2d/fghWhx3KNraKc1oXcDfsRdIkMdBQwgEqtxuZlF3KviTO6yItVnRsiVSYj3zVseCa3OPHPJ3h6rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D459wb84; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D459wb84"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4D2IP028865;
	Fri, 27 Jun 2025 10:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HXU2l79wCwe/9pNVwhKCCsp1
	FaduX9CkuNKU8UGBL/g=; b=D459wb84nzWE4Nb8E+YExIZ0SIQ1CfqHBrtElncT
	Nh2r5gdlLRkHoH3NHN4T+8ad/PCcijxOigpbG1EKo4lxlIO2Ii9lRzj9tQAVf4s9
	fad3dcw4CAbP56gjOMhCTjx9a6EfrlJTFAPUjslgc4uPzFtCNw/mavNOJ1jpuhWj
	j1E17wtU8MX63aXOMNXeoanAikkT6yR6okvUT/Kl+fFeBNr6LcA1btmbKQKIv6C4
	SR8+3tVE2v8PjTICFUjlUbk4ylS5Eqjw2TVXYv+PvfnDBsvIh1t6c48AnbFQpHbz
	rR/bZ51S1Y47Rh2T5e7qzDCZXGrKKyd+DTxlqdT8xX/PAA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbh5cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:31:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RAVB80009200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:31:11 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 03:31:06 -0700
Date: Fri, 27 Jun 2025 16:01:02 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: <devicetree-compiler@vger.kernel.org>, <kernel@quicinc.com>,
        <kernel@oss.qualcomm.com>, Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH v3 1/4] libfdt: overlay_merge: Introduce
 fdt_overlay_merge()
Message-ID: <aF5y5vqcndKUQPuH@hu-wasimn-hyd.qualcomm.com>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <20250519091043.621316-2-quic_wasimn@quicinc.com>
 <aC1VQfD3F1v_1rem@zatzit>
 <aDmkipTfwXqyz1Mm@hu-wasimn-hyd.qualcomm.com>
 <aD7X2MMB5x0WWkLU@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aD7X2MMB5x0WWkLU@zatzit>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA4NiBTYWx0ZWRfX5SHy0XoLAGEj
 H2i1p2S2Na6uY+NUi0RFmAQIO/UtIQwBxGmDpCrm5uZtufsj8y9VajpOTmrIS4exGyrfd3LXka6
 fgiHnJjcTslfAYj+CXYhqHZ23iMz3oWiNKBylcVHce6l7qN6lUjX2fkgQ99kRoQPT8svf6685V3
 r/dzJrYVKYPkePz8QCFXJ31LzQOKnJbKk884aKCKdrGwz4fjO7N2Y1Q+XuAHnEHwOABzWLRFXYE
 wfSX5OY2uOKMQguGyhIPfVw3xU3t6G11csr7NHsv+5jNoV+Qwjgn2lUgh51dIQI5mOJ62XVB/tX
 5z9a7n+w3i6ANxsIbAE8AnH/J5XsBHGKyvopmGVxWdD1GuT0WgWOIOqzuZkgb0RWg7Ct7+JfhLn
 OSr2t6AIZ6vDkVNuJwJ6tMqRqxcZdYb/R2I3nlPOKR7qEfgPECP5n20RgA+nhRlT55y7jLaK
X-Proofpoint-GUID: Nvj0JRE23aFgPkhxyo8coKSkzUyNHES8
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685e72f0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=voM4FWlXAAAA:8
 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=Wk1UEFJWhki93NnLVoUA:9 a=CjuIK1q_8ugA:10
 a=IC2XNlieTeVoXbcui8wp:22 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Nvj0JRE23aFgPkhxyo8coKSkzUyNHES8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=709 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270086

On Tue, Jun 03, 2025 at 09:09:12PM +1000, David Gibson wrote:
> On Fri, May 30, 2025 at 05:58:58PM +0530, Wasim Nazir wrote:
> > On Wed, May 21, 2025 at 02:23:29PM +1000, David Gibson wrote:
> > > On Mon, May 19, 2025 at 02:40:40PM +0530, Wasim Nazir wrote:
> > > > From: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> > > > 
> > > > fdt_overlay_merge() merges two overlay blobs. It is largely expected to be
> > > > used offline on a build machine to combine two or more overlay blobs into one.
> > > > 
> > > > It is intended to help maintain device-tree overlay code in
> > > > multiple source repositories, but merge their binary forms (overlay blobs)
> > > > into one so that bootloader's task of searching for all relevant overlay blobs
> > > > is simplified.
> > > > 
> > > > Introduce fdt_overlay_merge() which is identical to fdt_overlay_apply().
> > > > Subsequent patches will introduce required changes to merge overlay blobs.
> > > > 
> > > > Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > ---
> > > >  libfdt/fdt_overlay.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
> > > >  libfdt/libfdt.h      | 18 ++++++++++++++
> > > >  2 files changed, 77 insertions(+)
> > > > 
> > > > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > > > index e6b9eb643958..8690ed55c8f6 100644
> > > > --- a/libfdt/fdt_overlay.c
> > > > +++ b/libfdt/fdt_overlay.c
> > > > @@ -1098,3 +1098,62 @@ err:
> > > > 
> > > >  	return ret;
> > > >  }
> > > > +
> > > > +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
> > > 
> > > The parameters should be renamed to reflect the new semantics.
> > 
> > Sure will change to proper name.
> > 
> > > 
> > > The 'fdto_nospace' parameter seems weird.  Why not just return
> > > -FDT_ERR_NOSPACE from the function?
> > 
> > fdto_nospace variable is used to know cases when 2nd fdto (overlaying fdto)
> > needs more space while -FDT_ERR_NOSPACE is used for cases when
> > 1st fdto (base fdto) needs more space.
> 
> Ah, I see.  I can see the reason now, but it's still a deeply ugly
> interface.
> 
> Hmm... why do you need to ever expand the applied size?  It's obvious
> you'd need to expand the based dtbo, but not why you'd ever need to
> expand the one you're applying on top.

Since, we are updating phandle references of fragments & __local_fixups__ of
2nd dtbo so we need to check that.

> 
> > I will change the arguments for better clarity.
> > 
> > > 
> > > > +{
> > > > +	uint32_t delta = fdt_get_max_phandle(fdt);
> > > > +	int ret;
> > > > +
> > > > +	FDT_RO_PROBE(fdt);
> > > > +	FDT_RO_PROBE(fdto);
> > > > +
> > > > +	*fdto_nospace = 0;
> > > > +
> > > > +	ret = overlay_adjust_local_phandles(fdto, delta);
> > > > +	if (ret) {
> > > > +		if (ret == -FDT_ERR_NOSPACE)
> > > > +			*fdto_nospace = 1;
> > > > +		goto err;
> > > > +	}
> > > > +
> > > > +	ret = overlay_update_local_references(fdto, delta);
> > > > +	if (ret) {
> > > > +		if (ret == -FDT_ERR_NOSPACE)
> > > > +			*fdto_nospace = 1;
> > > > +		goto err;
> > > > +	}
> > > > +
> > > > +	ret = overlay_fixup_phandles(fdt, fdto);
> > > > +	if (ret)
> > > > +		goto err;
> > > > +
> > > > +	ret = overlay_merge(fdt, fdto);
> > > > +	if (ret)
> > > > +		goto err;
> > > > +
> > > > +	ret = overlay_symbol_update(fdt, fdto);
> > > > +	if (ret)
> > > > +		goto err;
> > > > +
> > > > +	/*
> > > > +	 * The overlay has been damaged, erase its magic.
> > > > +	 */
> > > > +	fdt_set_magic(fdto, ~0);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err:
> > > > +	/*
> > > > +	 * The overlay might have been damaged, erase its magic.
> > > > +	 */
> > > > +	fdt_set_magic(fdto, ~0);
> > > > +
> > > > +	/*
> > > > +	 * The base device tree might have been damaged, erase its
> > > 
> > > This comment is no longer accurate in the new context.
> > 
> > New context here is two overlay files, while earlier it was dts and dtbo?
> > I'm concerned that I may not have understood correctly, can you provide
> > more details.
> 
> No, I think you have it.  The comment references a "base device tree",
> i.e. not a dtbo, but that's no longer accurate.

Oh ok, got it.

> 
> > > > +	 * magic.
> > > > +	 */
> > > > +	if (!*fdto_nospace)
> > > > +		fdt_set_magic(fdt, ~0);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > > index b5e72001d115..664b141d5334 100644
> > > > --- a/libfdt/libfdt.h
> > > > +++ b/libfdt/libfdt.h
> > > > @@ -2313,6 +2313,24 @@ int fdt_overlay_apply(void *fdt, void *fdto);
> > > >  int fdt_overlay_target_offset(const void *fdt, const void *fdto,
> > > >  			      int fragment_offset, char const **pathp);
> > > > 
> > > > +/**
> > > > + * fdt_overlay_merge - Merge two overlays into one
> > > > + * @fdt: pointer to the first device tree overlay blob
> > > > + * @fdto: pointer to the second device tree overlay blob
> > > > + * @fdto_nospace: indicates if FDT_ERR_NOSPACE error code applies to @fdto
> > > > + *
> > > > + * fdt_overlay_merge() will merge second overlay blob into first overlay blob.
> > > > + *
> > > > + * Expect the first device tree to be modified, even if the function
> > > > + * returns an error.
> > > > + *
> > > > + * returns:
> > > > + *	0, on success
> > > > + *	-FDT_ERR_NOSPACE, there's not enough space in first device tree blob
> > > > + *	-FDT_ERR_BADVALUE
> > > > + */
> > > > +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace);
> > > > +
> > > >  /**********************************************************************/
> > > >  /* Debugging / informational functions                                */
> > > >  /**********************************************************************/
> > > 
> > 
> > Regards,
> > Wasim
> > 
> 
> -- 
> David Gibson (he or they)	| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
> 				| around.
> http://www.ozlabs.org/~dgibson



-- 
Regards,
Wasim
