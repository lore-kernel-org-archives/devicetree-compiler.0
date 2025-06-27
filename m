Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7738298CC6
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Jun 2025 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019368; cv=none; b=BuYdEjaBttiVIa9SsHSwAngHqkjWln2kBXe2nDv0+9xeA6P1JwIaX/9OZQnn6RPMvjxWoT/ZCo0zeB6jkfXZdFJf3/y/c4nTDj8CG66rj1JVrpUjBp4LRtFBdIdj1ZQabSH6oiAl6uI6dNsbOB3kObiqCZXIjCMUHXLL6YMjYP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019368; c=relaxed/simple;
	bh=4tvt+yrEGZ+ICib3iit+LVXpern2+LsXuGbyZ+jpgRM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ih3RbMVsfZv0ktE6fIdLN4i+iE98ILiKSVnDW+neK8HCKXjuvQlIjWqeCAf3nyXqhIMNgvjPSQgmT6Fohusw1tfO7CTfkJUv8Ixy6316KEKEEnNwLnjo9ec3NzB/2CmcpDXnoNHf0S4jFIWmKch2qzMFKXmuvmsANq+0IqaDCpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MB+/LOzB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MB+/LOzB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DYHI018804;
	Fri, 27 Jun 2025 10:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zfs/fVr0IyTc3Jk1ra0kbr0Z
	BaHlQnTTgS3mBpWBPuQ=; b=MB+/LOzBrafTXmb+w7uSUxsutli9yydw1OGXSTM1
	i2WgLhSKHhEd0yRqCxOnEA+t8XFCTl0IPDnVCX+6SfFdHxlSVGeFWyOyhJSjeO69
	1Zjv/FSxYYTkcukBoftdwTpYJBHExVcBEY5IBYwQGXCeE/+ZPqAOBTlWzBVk6IB2
	ffvjWj6CP9eqGjf/2A9z/P5djtlrgvM7zD7jp2t/zwRqW/LeW7buXvXujjDqhOXf
	HexY/0MfZsHwUR+qDcpOdg+w4c7PF4qoVnNxXpJbibijskB+cxtRhYSRegJbM57Q
	Qc9cYLLBZ8jrx3vOTCN/DP+ayjLBJJ0+uvIm9PwoQN9cew==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx4sr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:15:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RAFp0k012267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:15:51 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 03:15:45 -0700
Date: Fri, 27 Jun 2025 15:45:36 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: David Gibson <david@gibson.dropbear.id.au>
CC: <devicetree-compiler@vger.kernel.org>, <kernel@quicinc.com>,
        <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of
 overlay blobs
Message-ID: <aF5vSAKbARuThVZR@hu-wasimn-hyd.qualcomm.com>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <aC1Up3yHJURgc2P4@zatzit>
 <aDnCeF88D6BdCzss@hu-wasimn-hyd.qualcomm.com>
 <aD7W73A7vWQr8ZPx@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aD7W73A7vWQr8ZPx@zatzit>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5E2YefyDqsDyvRl_ay8UONUH6XJWWS5s
X-Proofpoint-ORIG-GUID: 5E2YefyDqsDyvRl_ay8UONUH6XJWWS5s
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685e6f5a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=LpQP-O61AAAA:8 a=voM4FWlXAAAA:8 a=AhZa6hkyb219hw8Y1mAA:9
 a=uZ5ahJ_o_Pl4-4Tc:21 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA4NCBTYWx0ZWRfXyjE30oDiQYvs
 7CjojjE20hkJWfiUwlkt6T3o4LV7686K147dmcvO8vf7ZtCZ0yk4vzRqUlC0ejJ0kZEK8y4Cgn+
 GxauBhJERQYsYa1TF7XQhNBUUEAVJTFHgC0jbeiBRen9/dEE2PE2TbxyNq676D2VS3qKO1DMofy
 31qoVoMifBagPAcUMWpCuaRY6d/wLK0MDg991XX8Lltbvq3Klez0XwZucjyhvrGG4eWm43u7EU2
 ySVLaGnI+1QaUFL3h31qwl90RlSdCBetaz479KlUYMT5VBgfylx3g8m7nRNDpQjJ2MuR3kdvL0Q
 yPxodehPga0wynZ3s2EETn7WxPqaDEGS/AvLrpDLtacsBIBRjcHEnAwcI0upEUEJrO8/3GGtoA3
 jNVahRaOBdmvfA7+5NPEkgZe6fFGiin7jmhnFIp65CtTB/rvtXVEh5PQtW2Mc1YIMW9FTEhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270084

On Tue, Jun 03, 2025 at 09:05:19PM +1000, David Gibson wrote:
> On Fri, May 30, 2025 at 08:06:40PM +0530, Wasim Nazir wrote:
> > On Wed, May 21, 2025 at 02:20:55PM +1000, David Gibson wrote:
> > > On Mon, May 19, 2025 at 02:40:39PM +0530, Wasim Nazir wrote:
> > > > Hello,
> > > > 
> > > > This is follow-up attempt for fdtoverlaymerge tool.
> > > > 
> > > > Currently all the device-tree (DT) code for a given soc is maintained in a
> > > > common kernel repository. For example, this common DT code will have code for
> > > > audio, video, fingerprint, bluetooth etc. Further this, DT code is typically
> > > > split into a base (soc-common) code and board specific code, with the soc code
> > > > being compiled as soc.dtb and board specific code being compiled as respective
> > > > overlay blobs (board1.dtbo, board2.dtbo etc). soc.dtb represents hardware configuration
> > > > of a given SOC while boardX.dtbo represents configuration of a board/platform
> > > > designed using that soc.soc.dtb and boardX.dtbo files are flashed separately on
> > > 
> > > So.. *build time* separation of the SoC and board pieces makes sense
> > > to me, which is I think how this convention arose.  *Boot time*
> > > separation of the SoC and board seems kind of pointless.  Almost by
> > > definition of what a "board" is, you must know early in boot which
> > > board it is.  Still, I guess the convention is established, even if
> > > it's stupid.
> > 
> > Android Treble requires separation of soc and board DT bits and so we
> > need to have soc.dtb & board.dtbo in separate images.
> > 
> > In the above example I tried to simplify using 1 soc & multiple
> > board-variants but we have setup with different combination of socX + boardY,
> > where X & Y can vary.
> > So we compile socX & boardY separately and combine socX dtb's in one image
> > while boardY dtbo's in another image.
> > Now at run-time based on SKU/HW config, we select particular socX and boardY
> > to boot the system.
> 
> Ok, sure.  Still seems like a silly approach to me, but it sounds like
> that's not within your control.
> 
> > In our workspace each repository i.e kernel & tech-packs (viz. audio, video etc.)
> > are independent (building in its own workspace) and can create dtb & dtbo.
> > Kernel can have socX.dtb & boardY.dtbo; Tech-packs can have socX-featureZ.dtbo
> > and boardY-featureZ.dtbo, Z can vary.
> 
> I mean.. how you organise your repositories should serve the needs of
> the problem, not the other way around.  But I guess that's equally
> true of dtc and associated tools.
> 
> > At build-time, we parse sku-id mentioned in all dtb & dtbo and combine matching
> > files i.e we overlay socX-featureZ.dtbo to socX.dtb & similarly
> > merge (fdtoverlaymerge) boardY-featureZ.dtbo to boardY.dtbo.
> > 
> > We can create single dtb as socX-boardY.dtb but Android Treble doesn't
> > allow that. Moreover, this modularity also helps us to reduce dtb + dtbo
> > image size by choosing N combinations with X+Y files instead of having
> > X*Y files which can increase image size.
> > If we don't merge boardY-featureZ.dtbo to boardY.dtbo then we need to
> > overlay Z number of boardY-featureZ.dtbo at run-time and it increases
> > boot-time.
> 
> So, you clearly have a late-build stage where you combine the various
> dtbos down to just two (soc & board).  Why can't the output from the
> earlier (single repo) build stages be a dts instead of a dtbo, then
> you use dtc to combine those into the two dtbos you need at the late
> build stage?

Our repositores are following android structure based on android-treble
where vendor subsystems needs to be modular for ease of OTA upgrade and
development.

As a result of which each feature/techpack (viz. audio, video etc.) have
its own independent repositories where it can build its modules and
overlay DT (soc & board).
Kernel is separate and provides only the core images and base DT (soc &
board).

So, dtbo is the option to build it independently and at last we have
options to either "overlay all dtbo at boot-time" or "merge it at build-time and
overlay final dtbo at boot-time".

This build-time merge is done outside techpack build system.
But if we want to have dts from each techpack, then techpack-build system needs
to communicate somehow to know which dts to include with which base dts.
This is not possible at build-time between techpacks.

> 
> > > > target (besides improving the overall size of DT blobs flashed on target, Android
> > > > Treble also requires separation of soc and board DT bits). Bootloader will pick
> > > > one of the board overlay blobs and merge it with soc.dtb, before booting kernel
> > > > which is presented a unified DT blob (soc + board overlay).
> > > > 
> > > > For ease of code maintenance and better control over release management, we are
> > > > exploring allowing some of the tech teams (audio/fingerprint sensor etc) to
> > > > maintain their kernel code (including their DT code) outside a common kernel
> > > > repository. In our experience, this simplifies number of branches maintained in
> > > > core kernel repo. New/experimental features in fingerprint sensor driver for
> > > > example that needs to be on a separate branch will not result in unnecessary
> > > > branching in core kenrel repo, affecting all other drivers.
> > > > 
> > > > In addition to compiling DT code outside core kernel tree, we also want to merge
> > > > the blobs back to respective blobs found in kernel build tree at buildtime
> > > > (soc.dtb or boardX.dtbo), as otherwise relying on bootloader to do all the
> > > > overlay impacts boot-time.
> > > 
> > > It's again unclear to me why you need a boot time separation of these
> > > devices rather than merely boot time.  What does using separate .dtbo
> > > files give you that just /include/ing multiple pieces into a single
> > > .dtbo at build time would not?
> > > 
> > 
> > Since our workspace is split into multiple independent repositories we cannot
> > include the pieces in one place.
> 
> I still don't see why not.  If you can emit dtbos from the single
> repository stages, why can't you emit dts instead?
> 
> > > > This brings up the need to merge two overlay blobs (fingerprint-overlay.dtbo +
> > > > boardX.dtbo), which currently doesn't seem to be supported and which this patch
> > > > series aims to support.
> > > 
> > > Merging overlays is a logically sensible operation, but it's not clear
> > > to me why the need for it follows from the premises above.  It's also
> > > unclear why you need to compile to .dtbo *then* merge, rather than
> > > combine .dts files then compile into a single .dtbo.
> > 
> > Due to splitted repository structure we cannot combine all .dts together.
> > And due to standalone build system for kernel & tech-packs we are
> > creating dtbo and merging together at end.
> > 
> > > > fdt_overlay_apply() API currently allows for an overlay DT blob to be merged
> > > > with a base blob. It assumes that all external symbols specified in overlay
> > > > blob's __fixups__ section are found in base blob's __symbols__ section and
> > > > aborts on the first instance where a symbol could not be found in base blob.
> > > > This is mostly fine as the primary use of overlay is on a target for its
> > > > bootloader to merge various overlay blobs based on h/w configuration detected.
> > > > But when the number of overlays increased then bootloader takes lot of time to
> > > > apply the overlays on base DT.
> > > > 
> > > > So we need new API/tool to merge all the overlays into single overlay file
> > > > at host (build machine) side,
> > > 
> > > Merging into a single overlay at build time makes sense to me.  But at
> > > build time you'd expect to have access to the .dts files.  Why do you
> > > need to merge .dtbo rather than merge the .dts before compiling to
> > > .dtbo?  The latter should be possible already by /include/ing each of
> > > the individual overlays in order then compiling with dtc.
> > 
> > This is not possible with our current repository structure.
> > Moreover, this splitting of repository is needed to work independently
> > without slowing any teck-packs.
> 
> I really don't know what you mean by that.
> 
> A few other things bother me about the situation, but maybe I'm
> misunderstanding.
> 
> 1) You imply you need many various of the soc.dtb as well as the
> board.dtbo.  How does that come to be the case?  Isn't there a fixed
> set of SoCs with known features?  Remember that device trees should -
> as much as is possible - describe just the hardware, not how it's to
> be configured or used.
> 
> 2) To a certain extent the same concern applies to boards.  What's
> controlling when the extra features are needed?  Are extre pieces
> physically connected on?  Is it controlled by on-board switches?
> Something else?
> 

We do have a fixed set of SoCs, but there can be multiple boards using same SoC.
socX-featureZ.dtbo & boardY-featureZ.dtbo is describing one of the
feature (viz. audio, video etc.) for each soc & board respectively.

> 3) What exactly is costing the additional time when applying may
> .dtbos at boot time.  Combining many together at build time will
> obviously result in a larger dtbo with more fragments that will itself
> take longer to apply.  I can certainly believe it's still faster
> overall, but it's not obvious to me why,  Understanding that will
> allow us all to reason better about what's a good approach here.
> 

In our setup, we have 7 overlays (boardY-featureZ.dtbo) for 1 of the board
(soc overlay (socX-featureZ.dtbo) are different so excluding that here).
So, if we do overlay-merge at build-time we are saving ~60% boot-time spent on
overlaying the board dtbo's.

> > > > so that on target side bootloader needs to only
> > > > apply merged-overlay-dt to its base-dt. This saves lot of time due to reduced
> > > > number file reading/loading & minimizing repeatative overlay apply.
> > > > In our test setup we see an improvement of ~60% while applying merged-overlay
> > > > at bootloader and the merged-overlay is product of 7 overlays.
> > > > 
> > > > To serve this overlay-merge feature we have introduce fdtoverlaymerge tool
> > > > which takes input as overlays and gives output to merged-overlay.
> > > > The tool uses fdt_overlay_merge() API introduced in libfdt to do the actual work.
> > > > 
> > > > Additional notes:
> > > >   If snprintf (in libc) may not available in some environments, then we will need
> > > >   to write our own snprintf() in libfdt.
> > > > 
> > > > ---
> > > > Changelog:
> > > > 
> > > > v3:
> > > > - Update copy_node & add copy_fragment_to_base to incorporate two cases i.e
> > > >   - Case1: When target is available and we merge fragments
> > > >   - Case2: When target is not available and we add new fragments
> > > > - Change the logic to update fixups & local_fixups in case of overlay merge.
> > > > - Few patches are squashed, reduced to 4 patches.
> > > > - v2-link: https://lore.kernel.org/all/1599671882-310027-1-git-send-email-gurbaror@codeaurora.org/
> > > > 
> > > > 
> > > > Srivatsa Vaddagiri (4):
> > > >   libfdt: overlay_merge: Introduce fdt_overlay_merge()
> > > >   libfdt: overlay_merge: Rename & copy overlay fragments and their
> > > >     properties
> > > >   libfdt: overlay_merge: Update phandles, symbols, fixups & local_fixups
> > > >   fdtoverlaymerge: A tool that merges overlays
> > > > 
> > > >  .gitignore           |   1 +
> > > >  Makefile             |   4 +
> > > >  Makefile.utils       |   6 +
> > > >  fdtoverlaymerge.c    | 223 +++++++++++
> > > >  libfdt/fdt_overlay.c | 901 ++++++++++++++++++++++++++++++++++++++++++-
> > > >  libfdt/fdt_rw.c      |  14 +-
> > > >  libfdt/libfdt.h      |  18 +
> > > >  libfdt/version.lds   |   1 +
> > > >  meson.build          |   2 +-
> > > >  9 files changed, 1146 insertions(+), 24 deletions(-)
> > > >  create mode 100644 fdtoverlaymerge.c
> > > > 
> > > > 
> > > > base-commit: f4c53f4ebf7809a07666bf728c823005e1f1a612
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
