Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D05F1891AB
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 May 2025 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748608201; cv=none; b=r5wFmEALgnFrhzGwhTtKhN+OmTsC5pRXRH7KkF/edQtBgDVqXxVct5ArMGntnCXvTZM8XFdu/x0AlQq5jKGJvSQ8TvZq54kIEPhL+XEQivDZYJz+tDfh4D24IH8BgS9h8tixHEGq0vr5WSIdSuMkYciYQPuZS4aoKdVDbjaezVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748608201; c=relaxed/simple;
	bh=DXYxg2pl6zhOmQFeENvRsCiucYjHXMK0gqrl+cT4jic=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3xiOGV+GVNN57s4Z7339Eum3T5+iF3oCKclhlEB5870cS7smbJ+cFKcyq622eDkj+4SCvdX2Oo1gwQb5U8VbrsDPdGb0cz2tWMQLYPOB+8yZ9aZ51L6sFmDZYRYR2NpGkhTauzDm4DpM//z0J88fpLxDIRF+M3FWNjDni/nSYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QrF5algq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QrF5algq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBoTZ0018216;
	Fri, 30 May 2025 12:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7CRSzO81mkWlQzmdKraNYij5
	KIISZjHvrjtk5dtEGuY=; b=QrF5algqqQQ+mD3nOuLHZ54hrTnBxbRaWM5Ba5ux
	WAmKKwlYzvcfsqHrbBaZD4SohuHUSf3x85GFGXODhKUUgMK1v5bg9Dub04Y9j+TC
	BBn4/zjets94pnASP5u3di3io+F2+LaMV963zQQi9TvMR+xP/sqsBmWG/tSLIpdW
	I3rQ24Ekq2SJxRptES7mVJRcv7F1PDzVVq5g3/nFeByatY+C1y0CHN6WqZjSZBIG
	ID0DFmO2wJhIHnH6sZuQKqRHASsvyPonhxh2dtWZrOncmY+G4zBFJ+DYYMAshipU
	S4pw9t2EDDvFs/tHc7omqYG70d7qpleN3KIl7u31jK9VjQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4yr3n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 12:29:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UCTDhZ000841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 12:29:13 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 May 2025 05:29:08 -0700
Date: Fri, 30 May 2025 17:58:58 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: <devicetree-compiler@vger.kernel.org>, <kernel@quicinc.com>,
        <kernel@oss.qualcomm.com>, Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH v3 1/4] libfdt: overlay_merge: Introduce
 fdt_overlay_merge()
Message-ID: <aDmkipTfwXqyz1Mm@hu-wasimn-hyd.qualcomm.com>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <20250519091043.621316-2-quic_wasimn@quicinc.com>
 <aC1VQfD3F1v_1rem@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aC1VQfD3F1v_1rem@zatzit>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEwOSBTYWx0ZWRfX5nmhuxQRNdDT
 o+ivJw2e61qgypR+gCua9hRvGrsxDeRmHsUMa/tHGOyvG0k7YYAHgMctM9Uxa2NpRADvTEnZPnf
 jS2jLbDwXv3sfhXNI57oUqp+2qv/L5nuKFokZTcCnCXOq5CPA170C+2i8N5VjK2ijVJ0LX/ZhGv
 X1nmtzIXaiZ7M8+MRQp0lGdfNqxBCpBynGM5aMea58kTE7PfVbTZp4yYtwomnj1Py6DOIKjkjGm
 Q3skxVvoAQ6p+0RooU79Zv6rxOcKLdlRqQGm/OKxwdH3v39b9xLz6LZJ2f+SjOH4+Ja1b48MwJa
 iu42bBrrVrqFyOSHHGGQfTrklZ18dsQbe06Np7QjMMq/BEY5rluc77W9FEFQeAeU99N2uXBLh3v
 iRVee0FEuWBx4nm7A81tsF2ApWyLk2X4aqweeyg8345eKu6bQdewYGoF6wHAh9Pn8Fi1rRzD
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839a499 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=voM4FWlXAAAA:8
 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=ycO9NNzXJKlXL293bjYA:9 a=CjuIK1q_8ugA:10
 a=IC2XNlieTeVoXbcui8wp:22 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tTMoz5U6iRqxZKh0N11bmKbHk1UuAl3c
X-Proofpoint-ORIG-GUID: tTMoz5U6iRqxZKh0N11bmKbHk1UuAl3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=652 malwarescore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300109

On Wed, May 21, 2025 at 02:23:29PM +1000, David Gibson wrote:
> On Mon, May 19, 2025 at 02:40:40PM +0530, Wasim Nazir wrote:
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
> 
> The parameters should be renamed to reflect the new semantics.

Sure will change to proper name.

> 
> The 'fdto_nospace' parameter seems weird.  Why not just return
> -FDT_ERR_NOSPACE from the function?

fdto_nospace variable is used to know cases when 2nd fdto (overlaying fdto)
needs more space while -FDT_ERR_NOSPACE is used for cases when
1st fdto (base fdto) needs more space.

I will change the arguments for better clarity.

> 
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
> 
> This comment is no longer accurate in the new context.

New context here is two overlay files, while earlier it was dts and dtbo?
I'm concerned that I may not have understood correctly, can you provide
more details.

> 
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
> 
> -- 
> David Gibson (he or they)	| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
> 				| around.
> http://www.ozlabs.org/~dgibson

Regards,
Wasim
