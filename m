Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EEF275106
	for <devicetree-compiler@vger.kernel.org>; Tue,  2 Sep 2025 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809337; cv=none; b=tPnkzZwMDX2ni5jyeVfokqJRaTU6jLjU/IMwbbYIudYj+m6RvAlYcQPmMIxXFaE+qAcVR/y74dQRK6tdMxwawO3iXyAV8XJbjL//ZgFDoJSQAH0+SChxjCC2QOLm0CpA7f08kMOvrKhta/+/VUvhJ4jR8Mckcu5qjjAc0mwpX3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809337; c=relaxed/simple;
	bh=3LH2F/R9cUOneNG+YOBwQpP/A8spNHvmLgE9y8zpvIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCSgg++3wwJptAa/l7Rjuc0cAJAvvrgJCUPFQDu/qjCnbFURYznqUT5HE+f+TubQhimPE+O+BtlShGOzJl0uU1HH4sg7RT7xXZv57DL8K2xxGwSiOQUYLOjQ16BAowvqnVJRvw4bizZegeOH2lq5ZRVn+vsiRYWk81s59+8L6uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ7NjIcN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQ7NjIcN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Sui3011396
	for <devicetree-compiler@vger.kernel.org>; Tue, 2 Sep 2025 10:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	811gSyYdpRspeNwkEyGLk9levNLRPg2pV7K/2fjl4W8=; b=CQ7NjIcNpKPueAXM
	w88Y1agbFfjSI+WxdjPFm5bCaVbYD6mbp4ICn/DN41cHKgDgI3CRp5bszr6oYqag
	fIjYtIjHn+/3guc+qMqRWX4lagINWnIjolk7IF3Xti4v9qgNGTPruesWbh6mpl9R
	NN6fGhyDKrJ1voFICHcyuBvbMzZwqVSWhg3k43d0Dt21pmHMTRNj35Z/mMNq+Cf0
	8rC8+59aOqeoyOioD6vd9sz7deRxR8wWYSDZipl7x05mjYYRa31PKOUJdDGBMm0k
	4PJG0ysmFoCUq/g7FJ3l8o0hhPdAQYnagQ6ZcLv7HSaOsvYSStdT//VqnRubCSen
	wl/XsA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjffmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Tue, 02 Sep 2025 10:35:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24925f21966so67048275ad.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 02 Sep 2025 03:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756809333; x=1757414133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=811gSyYdpRspeNwkEyGLk9levNLRPg2pV7K/2fjl4W8=;
        b=JoAo74UIcYctiBZBulOUwniT7iT3LP4r9SOOGUmIijwRi9HDCkEebCnFMT+VTi+IeL
         ISomijHKnUHmh/g+89lZfmoqdRGuMkOWAPPRGAWIsyeAenN498mGqxZqgypRCJvcIrs5
         ufciDcPiIBBkWuaXZn6Bj0jRr2ksi2+qtzLJw7t/E6VE7ZHdH3V8TuqoSa3t/CO06732
         gt94muEwT+oAZbYNIs3eCpr9x+6RI92KPycctUWFoEtNSIdcCZ0krCSBVOTEFVu/5Cpt
         nFrRoBJHpz9EytQ9v5hhpoCIEFfg34ec2WccmgwoGbopJcB/JYN73iTJK+YQy6DfFBr5
         nKVw==
X-Forwarded-Encrypted: i=1; AJvYcCWnvkZTKXpmtGVVRu5N07bDrTq+crpw+VsqCPGyp188S2rHq64L11oInfMBcYhT1tl45UPvVbVvVQ82Lli8lzCRquZA@vger.kernel.org
X-Gm-Message-State: AOJu0YzwG/380tc8GAs8qo/scc9AJQ8Ib+gGthF1eNr1byOx1MYVaBRT
	PFTozqSaKHTil5uYI4PEMUKOtJgfejNY52gn/3AT62nkRm5l+8pigbVItVmGzbmdbb2P+M83tBp
	q3OWepIpg9PjSh3hfD36/1tEfdx7v5CvEhiGCGqRHPiMbB88zM2n3g58S37djfPDOx3Ccn4KbhN
	+0
X-Gm-Gg: ASbGncu9xoK9oMxy5pUUYHIdgyd0K+FTUNHJC84UDfdK5FgTLIBXLO053NrBedS0z9s
	ifIhs4onVrs9dqzy7fXm/40Hu5GZ6yklsYYUBOtFaJ0xFf+c5eUYFWzktmNnVu6fzqtfb/ig55V
	fCG/h0UloI+xxJEBrDXhffkf6KonKI2S1DB2xy1Ect3tcSCOMNNQXmHbKkPc6XV1uoCDd7ZPbQS
	Q08G5XcRrA/A2FOhzzLOYkyblyTPvk32V+LnbnRRdyq8Wmo/k3V0FipWXeO4DdGNr3J0o9hGn72
	vOM6SrK93TXpcp9x5Rx5lNqzp2JMbesRR7UJnQDx8ucmgkwqWf6Yl5OInWEieT79Zsmy
X-Received: by 2002:a17:903:3c45:b0:242:9be2:f67a with SMTP id d9443c01a7336-24944873f96mr149234915ad.11.1756809333399;
        Tue, 02 Sep 2025 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD6nILX7osHmLAIuMJSurVGc7mEBQghyLj4atU0R8klI4W/t3IA6Cos0Nsl9xL9q9J13ffSw==
X-Received: by 2002:a17:903:3c45:b0:242:9be2:f67a with SMTP id d9443c01a7336-24944873f96mr149234495ad.11.1756809332777;
        Tue, 02 Sep 2025 03:35:32 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b168157b6sm14104845ad.13.2025.09.02.03.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:35:32 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:05:27 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Wasim Nazir <quic_wasimn@quicinc.com>, devicetree-compiler@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of
 overlay blobs
Message-ID: <aLbIb6s0Ps0J1lZL@hu-wasimn-hyd.qualcomm.com>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <aC1Up3yHJURgc2P4@zatzit>
 <aDnCeF88D6BdCzss@hu-wasimn-hyd.qualcomm.com>
 <aD7W73A7vWQr8ZPx@zatzit>
 <aF5vSAKbARuThVZR@hu-wasimn-hyd.qualcomm.com>
 <aF_KEwXLkQ2ff_69@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aF_KEwXLkQ2ff_69@zatzit>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6c876 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Tg1aC1VmllaIkuQUY_IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: MreJFzVe3upkWx-Twh7rtQvj34E11gSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX3JekwhKOi+yI
 GYJj2ZsxRWLJpVMdznyGltkZNaGMSx3/u88aV6zTH3mNDS7w4V5oITGyQkpNBaTvvGoz52iOADW
 YOjNphIGjrFDKACwDjQoxxgsKh/+m1+6Bghq9i5lvg2C1PqDAIgL1psfZkuwCj8lzqAXGwioJjz
 lQI3TyGfLklRBV81ENDzjhkImR2WU8+0nS7Xdx7fsrBX603xA7QOpJsi8g55SvTAe2+dEFv+TN7
 fBeQ1SZRL3jdEsQb1ROqk7zjgv7KDCU7LeOFwDJ3hbDfjgIMiLiQo33ZMrKEaNVMFMJpb39vH+G
 hj7Hw2VOpEgsxVaGVNgxK73em3N8IIGzDDtkxRgetthup/GT6GgLwBeD8EmFucNs74rqvVnjDqn
 dqDslXNz
X-Proofpoint-ORIG-GUID: MreJFzVe3upkWx-Twh7rtQvj34E11gSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

[...]
> > 
> > Our repositores are following android structure based on android-treble
> > where vendor subsystems needs to be modular for ease of OTA upgrade and
> > development.
> > 
> > As a result of which each feature/techpack (viz. audio, video etc.) have
> > its own independent repositories where it can build its modules and
> > overlay DT (soc & board).
> > Kernel is separate and provides only the core images and base DT (soc &
> > board).
> 
> The build system should serve the needs of the project, not the other
> way around.  If the feature repos can emit a dtbo, why can't they emit
> a dts as well?
> 
> > So, dtbo is the option to build it independently and at last we have
> > options to either "overlay all dtbo at boot-time" or "merge it at build-time and
> > overlay final dtbo at boot-time".
> > 
> > This build-time merge is done outside techpack build system.
> > But if we want to have dts from each techpack, then techpack-build system needs
> > to communicate somehow to know which dts to include with which base dts.
> 
> Why is that a harder problem than knowing which dtbo?  The dtbo must
> have been built from some sort of dts, no?
> 
> > This is not possible at build-time between techpacks.
> 
> The build system is not immutable - you're proposing changes to libfdt
> and/or dtc; why not changes to the build system?
> 

Hi David,

As each techpack operates in a sandboxed environment with its own build
structure, all dependencies are managed within that sandbox, so the
techpack owner only needs to focus on their own module. Since each
techpack produces a compiled DTBO, it is self-contained and can be
merged with other DTBOs without additional coordination.

If we were to use DTS files instead, every techpack owner would need to
be involved in resolving cross-dependencies, which is not scalable in
our modular setup.

> > > > > > target (besides improving the overall size of DT blobs flashed on target, Android
> > > > > > Treble also requires separation of soc and board DT bits). Bootloader will pick
> > > > > > one of the board overlay blobs and merge it with soc.dtb, before booting kernel
> > > > > > which is presented a unified DT blob (soc + board overlay).


[...]
> > > 
> > > I really don't know what you mean by that.
> > > 
> > > A few other things bother me about the situation, but maybe I'm
> > > misunderstanding.
> > > 
> > > 1) You imply you need many various of the soc.dtb as well as the
> > > board.dtbo.  How does that come to be the case?  Isn't there a fixed
> > > set of SoCs with known features?  Remember that device trees should -
> > > as much as is possible - describe just the hardware, not how it's to
> > > be configured or used.
> > > 
> > > 2) To a certain extent the same concern applies to boards.  What's
> > > controlling when the extra features are needed?  Are extre pieces
> > > physically connected on?  Is it controlled by on-board switches?
> > > Something else?
> > > 
> > 
> > We do have a fixed set of SoCs, but there can be multiple boards using same SoC.
> > socX-featureZ.dtbo & boardY-featureZ.dtbo is describing one of the
> > feature (viz. audio, video etc.) for each soc & board respectively.
> 
> But why does the set of features on a SoC vary?  Generally, by its
> nature, a SoC has the components it has, they're not variable.
> 

SoC features are fixed, but different boards may utilize different
subsets of those features which are also fixed. To support multiple
board combinations efficiently, we select DTs feature-wise, allowing
reuse of SoC/feature overlays across boards.

> > > 3) What exactly is costing the additional time when applying may
> > > .dtbos at boot time.  Combining many together at build time will
> > > obviously result in a larger dtbo with more fragments that will itself
> > > take longer to apply.  I can certainly believe it's still faster
> > > overall, but it's not obvious to me why,  Understanding that will
> > > allow us all to reason better about what's a good approach here.
> > 
> > In our setup, we have 7 overlays (boardY-featureZ.dtbo) for 1 of the board
> > (soc overlay (socX-featureZ.dtbo) are different so excluding that here).
> > So, if we do overlay-merge at build-time we are saving ~60% boot-time spent on
> > overlaying the board dtbo's.
> 

I realized there was an error in my earlier boot-time improvement
estimate due to some unintended factors in measurement. The actual
improvement is around 30%, not 60%. Apologies for the confusion.

> Well, sure,  but I'm trying to understand *why* doing it all at once
> is so much faster.  I know the code for overlay application, and
> there's not an obvious large cost per-dtbo - I'd expect the time to be
> dominated by things that are per-fragment or (roughly) proportional
> to the total size of the applied dtbos.  That leaves two possibilities
> that I can see:
> 
> 1) the later dtbos are frequently overwriting properties in the
>    earlier dtbos, resulting in a final dtbo substantially smaller than
>    the sum of the original dtbos.  This seems implausible to me given
>    the structure you've described - I'd expect each dtbo to be
>    altering different parts of the tree.
> 
> 2) There *is*, contrary to my intuition, a substantial once off cost
>    for each fdt_overlay_apply() call, independent of the dtbo's size.
>    If that's the case, we should understand why and see if it can be
>    mitigated.  That would help all use cases, not just your one.
> 
> In short, adding a substantial new feature to dtc/libfdt seems
> premature without better understanding the cause of the poor
> performance you're seeing.

Thanks, Alex. I appreciate your thoughtful analysis and the effort to
understand the performance aspects of overlay application.

That said, I think we might be diverging from the core intent of this
patch series. The goal here isn’t to optimize or fix the current overlay
mechanism, but to introduce a new capability that’s currently missing:
the ability to merge two DTBOs directly.

Let’s set aside how our build system produces multiple DTBOs. Imagine a
scenario where we have one DTBO from our side and another from an OEM
and we don’t have the source for the OEM overlay. If we want to test
how the OEM overlay behaves in combination with ours, there’s no
straightforward way to do that today. This is where DTBO-to-DTBO merging
becomes useful.

So instead of focusing on optimizing fdt_overlay_apply(), this patch
series introduces support for a currently missing use case: merging
multiple DTBOs into a single overlay at build time.


-- 
Regards,
Wasim
