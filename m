Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D422165F13
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 May 2025 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615821; cv=none; b=tTbbh/g6PpBSKbvwFamelmya+0KVOEcp8tlLOCCQjVC4MiBFLLd+yQoiZqbqmDxtN6Pxh7lYPnYwnl8FVsHbkGmkEnkMki2cOaRWEwBvc2xoBdV86fpVWsFPVXbilZ/eUsOMyJhWTeUfl2ByhDUfBcRZKf8xG7d22ZAhJPXqQq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615821; c=relaxed/simple;
	bh=Xe8pErh/u0d9ExjxNL3w17PLXxeHysYbOSUWj5x9rA8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjFQl3fG63ja8Bg5/fn0YZ/D83Mz3Xkln43JK9ZnM+y/99MfDOJHQIa94l6TAMy9PkRrwJ7Kx+LbGFZrSo4QMV8LDPjWexqF2i6usNn62ernmwgYrb/HrN63KspxIZrGqA6UzJR8703B82rk4HyjHCsD35nJ+BlvaklzQgI5kZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P5lHxcbp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P5lHxcbp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBXq2b006932;
	Fri, 30 May 2025 14:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tn/oJET/yOVilr6SAqYHzYRk
	OlnFvpgLxFWGMFr5KVs=; b=P5lHxcbp8zgfAxvoe5d2yHWkdGAUiWv3JCyyOAhn
	2T+ak1XP3kktvFzu/TrhZ0b2loeMfTyG9ICTw7MZcGRBgFmNpABtAjjblvCOhxFc
	x3dW5I5WrP08gitVXSF99qUDWa3rINbKTFT1I/Vnh/791M2t/jqNBMsaNbVg4TOs
	NE3YX5CH+TemTiFtoRINPIU9IX2kLzKzurn7H31S+0jFYy0aRATV1EmWZmBWplUo
	EFXyrECBd579VvGPyx5Jx5pDq+0h3ChQtqAjqwXV8ijUmSqRPJ4Xvvr9LLVFXZKV
	pyvkbyVSeqfPLTj/TebNN83XILYfTxtpVkyNC1FudptP9A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqhkax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 14:36:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UEanVm018226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 14:36:49 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 May 2025 07:36:44 -0700
Date: Fri, 30 May 2025 20:06:40 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: <devicetree-compiler@vger.kernel.org>, <kernel@quicinc.com>,
        <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of
 overlay blobs
Message-ID: <aDnCeF88D6BdCzss@hu-wasimn-hyd.qualcomm.com>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <aC1Up3yHJURgc2P4@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aC1Up3yHJURgc2P4@zatzit>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5YMj4ND5fvkA7zON2fqD9WCYoizYeqa2
X-Proofpoint-ORIG-GUID: 5YMj4ND5fvkA7zON2fqD9WCYoizYeqa2
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6839c282 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=LpQP-O61AAAA:8 a=voM4FWlXAAAA:8 a=ve0ytuikeAPOXHgPyxsA:9
 a=ne-L70sPJPAc_cJB:21 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEyOCBTYWx0ZWRfX6y8wPy/2F4uG
 aXtuQAggnrhNjqd+KP6fLeOin3gB82JS7cCNEb5Sy0TLezqKJtVmSi2fZoXPKXjeTc2wulnBmBo
 R0xkOd8Mp+h9b0uDDDPUkzCTouyV0izs9H9E/ZpDL/cUmfZLHeB6qtfH1qNL+qb/t2il2mTL6Ey
 IQ62vec0abxJhdMKaCkfIZrpHPzI5S03VeUE/bROf1aiUO49UD06wbw3FupQhtgoxxTv6XoEvNY
 pDvCpJMsEqCAtFwnpeAimEsFpYNx6N3BV9ocPIOBlV8hmTUPp8jTGRHnA82cAlKamuPLmdiPvhl
 VD118du1/KymdxWPYkDemjQLV+C8+vadifyjFe/XsH4NYTeT7bKljFiqWnZY1i/cZtKw1v+Mdr8
 UrpMaDuFxEUJwQBz+8SYPvycdzO9okyeatG4uzBgyg0eaqdOnykb3ZhxaxnRvlxzFE4Jrd62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_06,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300128

On Wed, May 21, 2025 at 02:20:55PM +1000, David Gibson wrote:
> On Mon, May 19, 2025 at 02:40:39PM +0530, Wasim Nazir wrote:
> > Hello,
> > 
> > This is follow-up attempt for fdtoverlaymerge tool.
> > 
> > Currently all the device-tree (DT) code for a given soc is maintained in a
> > common kernel repository. For example, this common DT code will have code for
> > audio, video, fingerprint, bluetooth etc. Further this, DT code is typically
> > split into a base (soc-common) code and board specific code, with the soc code
> > being compiled as soc.dtb and board specific code being compiled as respective
> > overlay blobs (board1.dtbo, board2.dtbo etc). soc.dtb represents hardware configuration
> > of a given SOC while boardX.dtbo represents configuration of a board/platform
> > designed using that soc.soc.dtb and boardX.dtbo files are flashed separately on
> 
> So.. *build time* separation of the SoC and board pieces makes sense
> to me, which is I think how this convention arose.  *Boot time*
> separation of the SoC and board seems kind of pointless.  Almost by
> definition of what a "board" is, you must know early in boot which
> board it is.  Still, I guess the convention is established, even if
> it's stupid.

Android Treble requires separation of soc and board DT bits and so we
need to have soc.dtb & board.dtbo in separate images.

In the above example I tried to simplify using 1 soc & multiple
board-variants but we have setup with different combination of socX + boardY,
where X & Y can vary.
So we compile socX & boardY separately and combine socX dtb's in one image
while boardY dtbo's in another image.
Now at run-time based on SKU/HW config, we select particular socX and boardY
to boot the system.

In our workspace each repository i.e kernel & tech-packs (viz. audio, video etc.)
are independent (building in its own workspace) and can create dtb & dtbo.
Kernel can have socX.dtb & boardY.dtbo; Tech-packs can have socX-featureZ.dtbo
and boardY-featureZ.dtbo, Z can vary.

At build-time, we parse sku-id mentioned in all dtb & dtbo and combine matching
files i.e we overlay socX-featureZ.dtbo to socX.dtb & similarly
merge (fdtoverlaymerge) boardY-featureZ.dtbo to boardY.dtbo.

We can create single dtb as socX-boardY.dtb but Android Treble doesn't
allow that. Moreover, this modularity also helps us to reduce dtb + dtbo
image size by choosing N combinations with X+Y files instead of having
X*Y files which can increase image size.
If we don't merge boardY-featureZ.dtbo to boardY.dtbo then we need to
overlay Z number of boardY-featureZ.dtbo at run-time and it increases
boot-time.

> 
> > target (besides improving the overall size of DT blobs flashed on target, Android
> > Treble also requires separation of soc and board DT bits). Bootloader will pick
> > one of the board overlay blobs and merge it with soc.dtb, before booting kernel
> > which is presented a unified DT blob (soc + board overlay).
> > 
> > For ease of code maintenance and better control over release management, we are
> > exploring allowing some of the tech teams (audio/fingerprint sensor etc) to
> > maintain their kernel code (including their DT code) outside a common kernel
> > repository. In our experience, this simplifies number of branches maintained in
> > core kernel repo. New/experimental features in fingerprint sensor driver for
> > example that needs to be on a separate branch will not result in unnecessary
> > branching in core kenrel repo, affecting all other drivers.
> > 
> > In addition to compiling DT code outside core kernel tree, we also want to merge
> > the blobs back to respective blobs found in kernel build tree at buildtime
> > (soc.dtb or boardX.dtbo), as otherwise relying on bootloader to do all the
> > overlay impacts boot-time.
> 
> It's again unclear to me why you need a boot time separation of these
> devices rather than merely boot time.  What does using separate .dtbo
> files give you that just /include/ing multiple pieces into a single
> .dtbo at build time would not?
> 

Since our workspace is split into multiple independent repositories we cannot
include the pieces in one place.

> > This brings up the need to merge two overlay blobs (fingerprint-overlay.dtbo +
> > boardX.dtbo), which currently doesn't seem to be supported and which this patch
> > series aims to support.
> 
> Merging overlays is a logically sensible operation, but it's not clear
> to me why the need for it follows from the premises above.  It's also
> unclear why you need to compile to .dtbo *then* merge, rather than
> combine .dts files then compile into a single .dtbo.

Due to splitted repository structure we cannot combine all .dts together.
And due to standalone build system for kernel & tech-packs we are
creating dtbo and merging together at end.

> 
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
> > at host (build machine) side,
> 
> Merging into a single overlay at build time makes sense to me.  But at
> build time you'd expect to have access to the .dts files.  Why do you
> need to merge .dtbo rather than merge the .dts before compiling to
> .dtbo?  The latter should be possible already by /include/ing each of
> the individual overlays in order then compiling with dtc.

This is not possible with our current repository structure.
Moreover, this splitting of repository is needed to work independently
without slowing any teck-packs.

> 
> > so that on target side bootloader needs to only
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
> 
> -- 
> David Gibson (he or they)	| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
> 				| around.
> http://www.ozlabs.org/~dgibson

Regards,
Wasim
