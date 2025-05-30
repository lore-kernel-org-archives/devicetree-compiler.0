Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC82288F7
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 May 2025 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616984; cv=none; b=kCyk4ai+gWpbSiCRBOyfAacx9mi03vI5kgmr2fKNqslgcGMjAyyPFlAoDdJq/V/t3/V6DAgxy9GvYF5Ma2Olhyhp4Ux/Gfqw17qu5cdr3G+Q3WNCt5vYwoKuP3b7L+Wr9j635X0Tn71jc7iHmjpHTxjEGqMc/gRB/oy1ExUvtJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616984; c=relaxed/simple;
	bh=3C/eQBi2ojul1Lg3jq4V4kJGeK5kY1SwyUnhCCrLNhs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hU5yYbiCfOKlGIf6yPZH8j+lXdORMkwCW0aCSYUfdaRovvzn/vNoLOB1xPKrex697Zi4RU51WLO8CkNErdS5eamIGNZUWdtd45nHGasTGP4RvpWZxg42qLXUhr5vodCQ1GVBO4QPLsxwhFQ9azd5IzE6sQHGWiXojGVwfIaFgG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K992Wgu0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K992Wgu0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U9eJ5a013831;
	Fri, 30 May 2025 14:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HUnhD/Ka7BbzaKoPT/Ock2Ro
	OoEUJzPABLqzZbmiPTU=; b=K992Wgu0azASam1RhBNGIKHl7kAkpHgyumcYIsyY
	B94wx5c/imt9+gfPAXeXXZmLQ5lO0eIxEE0pOzSR/QGvwd7Yzo636bxc8nRSfrWL
	/z6ijZm+euWJXqcIB3MinXzsU5CrYkssNz9rDWvYBgwNEZIHhUGMIX9bntiFRCf8
	djgFMfWSbBaa3HDulRoY25LKAbi4XaabJVYEZSUl8M4/7Bl7F1SidSfqiNvWGG+1
	Brtp76gm8qd+byMidBaFf40m2/f4793T0ynNuDSvJmPD7OHQSjsoEn6+RUEGz82d
	810VwqzVcPIvT1GvgaNM5Xvwl7u7MpjMrNAKUKJZHHhJDw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm3egf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 14:55:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UEtwGZ010271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 14:55:58 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 May 2025 07:55:53 -0700
Date: Fri, 30 May 2025 20:25:49 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Simon Glass <sjg@chromium.org>
CC: <devicetree-compiler@vger.kernel.org>, <kernel@quicinc.com>,
        <kernel@oss.qualcomm.com>, Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH v3 4/4] fdtoverlaymerge: A tool that merges overlays
Message-ID: <aDnG9aOORhKRJGbm@hu-wasimn-hyd.qualcomm.com>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <20250519091043.621316-5-quic_wasimn@quicinc.com>
 <CAFLszTgH_z4yfYVx=zUUK0tV36srmj9zeG-SGGzS7nY3mxJEFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFLszTgH_z4yfYVx=zUUK0tV36srmj9zeG-SGGzS7nY3mxJEFw@mail.gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cTBdAvZa1qutS6zgxZY2WnrAzuAOvbVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEzMCBTYWx0ZWRfX6UkZBGna2mZt
 SctyTme0MqJDHkJnOdVCaTsUz61/3vx7z1/Jgon1e4ny3fUesZZ7Gu13drPRZO26Y3VJOkoLt4O
 Iw75HRSM+G7Y0m+ndsyO8mvN4vPMGSXMjSmqz47tp/xRLZQdFudpuR8PV9e1o+jwge4cG1GWQjp
 MEzWOukU1qC95UYXUpx/JtTcQKP7NthAV8A1QF0wcFomKxPTKqiYZCFp0cbr+bZmPoJiVNJQkVD
 QatCdCQUalEh2Ok98FmyTPoTNdQwYI13NZCx/GgVRaaL/ALxqnFSPcYj+BhJ7RDQZzGdwqb7mxG
 JLi5n7H4394OduzobvrOqq+DHkW5br7UE5UNcvaW42wHG/USjDennMUqN1eX0v0kIWU0TJCFtK2
 vHvV4jZ9I4gfMVNftp3WTHllbRURL92Y/f3HbBAVy4ivhOa63WZVgvK6UfmMKoOE5EUx3z1i
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6839c6fe cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=mumytewbWzkvacwMkY0A:9
 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: cTBdAvZa1qutS6zgxZY2WnrAzuAOvbVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_06,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=669 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300130

On Fri, May 23, 2025 at 02:44:15PM +0100, Simon Glass wrote:
> Hi Wasim,
> 
> On Mon, 19 May 2025 at 11:16, Wasim Nazir <quic_wasimn@quicinc.com> wrote:
> >
> > From: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> >
> > Add a new command-line tool, fdtoverlaymerge, that merges two or more
> > overlay blobs using the fdt_overlay_merge() API. This tool is necessary
> > to simplify the process of combining multiple overlays into a single blob.
> 
> Normally this would be done in the bootloader, with the overlays in a
> FIT. What environment does this tool run in?

This tool is running in Android build system where we need to have
separate images for dtb and dtbo. Moreover, the dtbo is getting
build from multiple independent workspace.
I have provided more details here [1], hope it helps to clarify further
doubts.

[1] https://lore.kernel.org/all/aDnCeF88D6BdCzss@hu-wasimn-hyd.qualcomm.com/

> 
> >
> > Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > ---
> >  .gitignore         |   1 +
> >  Makefile           |   4 +
> >  Makefile.utils     |   6 ++
> >  fdtoverlaymerge.c  | 223 +++++++++++++++++++++++++++++++++++++++++++++
> >  libfdt/version.lds |   1 +
> >  meson.build        |   2 +-
> >  6 files changed, 236 insertions(+), 1 deletion(-)
> >  create mode 100644 fdtoverlaymerge.c
> 
> How is this tested?

This is tested with our internal DT framework which comprises of
multiple soc & board level dtb & dtbo.
We comapre the output/final dt blob with & without this patch for
validations.

> 
> Regards,
> Simon

Regards,
Wasim
