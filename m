Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFA4233722
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 May 2025 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616158; cv=none; b=ltTVH8YVe+HfPH101aZvD3DTwxQ+kzkMii+FMHYYcC53uY4CEYTIUz6Z9hfradRPLDKzpHMQv6RTWXLpU8d9m/rcIUTvdmNeFEGepfk6adw2y1FJFX5d9OrRo4pQJr3ZhCi7QQ0HWWfxEdTYoQQL/QBX9lkTBbwtwk3lNGUcwRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616158; c=relaxed/simple;
	bh=MpHR1wfRgaFjtFv1O0w5qXTexmzKJttpRcbbmJY7r6M=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qt+EdSiuLJaQ+XHx4jjA7W7G/xGvbTK1oDUfQYl8Km6DIQ5iv8uaatjHY1AgPR7Ctenr8vIDd1+tylfUpYqC8yYo9MFJ1Eldty+z8wl1Ynjr79OLAWi2JwVGrGAAaAa+Wxnwt4YPioG/X/RLM7Lf80HbCF8TbVA6uktNSS08zrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fkq0jVhb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fkq0jVhb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBqJBI006960
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 May 2025 14:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dxOBdLRoT50V6mX3YG4PJoWW
	t9oeVmIHDg9g/sFsobg=; b=fkq0jVhbVD7kaoryQeQqGyskuOkDtW//k/IDR+c2
	z2+es0SNhrZGOfwS6coEkEr7xibkbKFUzzlZm3DOfQF68p33TJ5iIpSjPFxMj2qV
	YJir99wqagfDHDGQS4/7CfBpVR3wZZGeNQ3d71whymOSxzbUr4gCwoPO/lNBNaOl
	Fq86DFWiT8Wl7L/B0Tghv/nzNJTCQPLc3J2YBXDcucXvqlGipnfn7k0v54rh2c/N
	9t+ENN6rlqgWIzVatcuRQM0cXeLfxkrqkXit2hDiTyZJ/ABeaXe3r7EUetVCmmQM
	4xE5BgfzyRVLhJN+4u11wsNxPR3rjy5gB3sbYtT6niDn/w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqhmha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 May 2025 14:42:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UEgYPG027880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 May 2025 14:42:34 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 May 2025 07:42:29 -0700
Date: Fri, 30 May 2025 20:12:26 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Trilok Soni <trilok.soni@oss.qualcomm.com>
CC: <devicetree-compiler@vger.kernel.org>, <kernel@quicinc.com>,
        <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of
 overlay blobs
Message-ID: <aDnD0j80AnH+ppq3@hu-wasimn-hyd.qualcomm.com>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <c8fdc06f-feec-4e33-a095-14cb38683f35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c8fdc06f-feec-4e33-a095-14cb38683f35@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a6vUsuIBeo9pB0GTl_HdyUiISw4cH-36
X-Proofpoint-ORIG-GUID: a6vUsuIBeo9pB0GTl_HdyUiISw4cH-36
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6839c3db cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=LpQP-O61AAAA:8 a=-R6rO4ti_YPZ4bSTIpIA:9 a=Q1lU4rTVkePEluit:21
 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEyOSBTYWx0ZWRfXzPYAd+3rIBSl
 gAejyNuqV2t1IxFB3N6ihFWUGCGV+yi0IBmWNbTit8pbHAHDDy8ctVwGz55oS/CxrtUHkKmde5G
 lyAmYcqcFmIvBlc+K092XXTpwZ4zai9c2EzFvSPnbztdBpAnS0/bn+TfB5uPS3OEh/NKCOJtPrd
 fUxq1Foal56ySr1HndnEfN4lXdZjQxlvotrgQn8dd/1i/q74soZSS2fImB321MJERZ+hoxfRPXw
 SUzwKLHW3zCYF/acwyRnnjrxte5IgNrrK+MmweoI+t8Y3YFZnQt2ZYReBNrUf9kpc+eycWUOK3y
 j55upnLcawIO5s/WSDqMUokJstaVGqPLyrBL3YnzI57O6UjDmXazIxmxpaebZ2EuGmvxhLSAhv/
 hGgHbIjgGcAMkRMzKiwqwlXXargZSEfSCT1Nd4kXlCaougfi2nh8OSL5Fermr2irDdPZrgFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_06,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300129

On Mon, May 19, 2025 at 10:15:55AM -0700, Trilok Soni wrote:
> On 5/19/2025 2:10 AM, Wasim Nazir wrote:
> > Hello,
> > 
> > This is follow-up attempt for fdtoverlaymerge tool.
> 
> Please add detail of the first attempt, since we are submitting it after a long time. 
> 
> > 
> > Currently all the device-tree (DT) code for a given soc is maintained in a
> > common kernel repository. For example, this common DT code will have code for
> > audio, video, fingerprint, bluetooth etc. Further this, DT code is typically
> > split into a base (soc-common) code and board specific code, with the soc code
> > being compiled as soc.dtb and board specific code being compiled as respective
> > overlay blobs (board1.dtbo, board2.dtbo etc). soc.dtb represents hardware configuration
> > of a given SOC while boardX.dtbo represents configuration of a board/platform
> > designed using that soc.soc.dtb and boardX.dtbo files are flashed separately on
> > target (besides improving the overall size of DT blobs flashed on target, Android
> > Treble also requires separation of soc and board DT bits). Bootloader will pick
> > one of the board overlay blobs and merge it with soc.dtb, before booting kernel
> > which is presented a unified DT blob (soc + board overlay).
> 
> Vatsa wrote it as per the Qualcomm source structure in the Android at that time. 
> You can see that he is referring "common" kernel repository etc; You need
> to rewrite it or explicitly mention it per Qualcomm directory structure
> in Android or QCLinux plus the tech-packages / external driver modules we have. 
> 
> You need to translate the problem which others outside Qualcomm can understand
> and relate in-order to understand these patches. 
> 

Sure, will modify the source-structure add provide more details.

> 
> > 
> > For ease of code maintenance and better control over release management, we are
> > exploring allowing some of the tech teams (audio/fingerprint sensor etc) to
> 
> "tech teams" is a internal usage within Qualcomm and it will be hard to understand
> some times outside QC. Please rewrite. 

Sure.

> 
> > maintain their kernel code (including their DT code) outside a common kernel
> > repository. In our experience, this simplifies number of branches maintained in
> > core kernel repo. New/experimental features in fingerprint sensor driver for
> 
> "kernel repo" is also bit QC specific. I will stop reviewing this patch
> since you should consider rewriting this summary. 

Will send updated summary.

> 
> > example that needs to be on a separate branch will not result in unnecessary
> > branching in core kenrel repo, affecting all other drivers.
> > 
> > In addition to compiling DT code outside core kernel tree, we also want to merge
> > the blobs back to respective blobs found in kernel build tree at buildtime
> > (soc.dtb or boardX.dtbo), as otherwise relying on bootloader to do all the
> > overlay impacts boot-time.
> > 
> > This brings up the need to merge two overlay blobs (fingerprint-overlay.dtbo +
> > boardX.dtbo), which currently doesn't seem to be supported and which this patch
> > series aims to support.
> > 
> > fdt_overlay_apply() API currently allows for an overlay DT blob to be merged
> > with a base blob. It assumes that all external symbols specified in overlay
> > blob's __fixups__ section are found in base blob's __symbols__ section and
> > aborts on the first instance where a symbol could not be found in base blob.
> > This is mostly fine as the primary use of overlay is on a target for its
> > bootloader to merge various overlay blobs based on h/w configuration detected.
> > But when the number of overlays increased then bootloader takes lot of time to
> > apply the overlays on base DT.
> > 
> > So we need new API/tool to merge all the overlays into single overlay file
> > at host (build machine) side, so that on target side bootloader needs to only
> > apply merged-overlay-dt to its base-dt. This saves lot of time due to reduced
> > number file reading/loading & minimizing repeatative overlay apply.
> > In our test setup we see an improvement of ~60% while applying merged-overlay
> > at bootloader and the merged-overlay is product of 7 overlays.
> > 
> > To serve this overlay-merge feature we have introduce fdtoverlaymerge tool
> > which takes input as overlays and gives output to merged-overlay.
> > The tool uses fdt_overlay_merge() API introduced in libfdt to do the actual work.
> > 
> > Additional notes:
> >   If snprintf (in libc) may not available in some environments, then we will need
> >   to write our own snprintf() in libfdt.
> > 
> > ---
> > Changelog:
> > 
> > v3:
> > - Update copy_node & add copy_fragment_to_base to incorporate two cases i.e
> >   - Case1: When target is available and we merge fragments
> >   - Case2: When target is not available and we add new fragments
> > - Change the logic to update fixups & local_fixups in case of overlay merge.
> > - Few patches are squashed, reduced to 4 patches.
> > - v2-link: https://lore.kernel.org/all/1599671882-310027-1-git-send-email-gurbaror@codeaurora.org/
> > 
> > 
> > Srivatsa Vaddagiri (4):
> >   libfdt: overlay_merge: Introduce fdt_overlay_merge()
> >   libfdt: overlay_merge: Rename & copy overlay fragments and their
> >     properties
> >   libfdt: overlay_merge: Update phandles, symbols, fixups & local_fixups
> >   fdtoverlaymerge: A tool that merges overlays
> > 
> >  .gitignore           |   1 +
> >  Makefile             |   4 +
> >  Makefile.utils       |   6 +
> >  fdtoverlaymerge.c    | 223 +++++++++++
> >  libfdt/fdt_overlay.c | 901 ++++++++++++++++++++++++++++++++++++++++++-
> >  libfdt/fdt_rw.c      |  14 +-
> >  libfdt/libfdt.h      |  18 +
> >  libfdt/version.lds   |   1 +
> >  meson.build          |   2 +-
> >  9 files changed, 1146 insertions(+), 24 deletions(-)
> >  create mode 100644 fdtoverlaymerge.c
> > 
> > 
> > base-commit: f4c53f4ebf7809a07666bf728c823005e1f1a612
> > --
> > 2.49.0
> > 
> 

Regards,
Wasim
