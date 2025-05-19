Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC67FD
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674962; cv=none; b=r88lyujcrwD6/8C0Zd8nN9KNAg3DZUpV4NQ56RmVEWgXKFKoxjEffqzr0SKQ7MN5NHLbqioiiQbng80kCqUqVh58U+Tht/ym/jkM3NLZfvYf5feWgSRL+dUHJG8ZhD3FO/mjO8vWWYXBB6PANyH1lU1nBkJNuD9mLebBEILqi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674962; c=relaxed/simple;
	bh=1E8pfZm6KJUsOxEtT71lUvGlAP8f7N6RDB52dUUUxN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVNyc07unoIIzSr7W0cUs9kK96HuL2rrRLA5iDGTfdA6h+8S9oFRQ5OBh6ePt+Y/dESU6VWuEFEBfWmaYjfem4a7ySW+jSJUP3fF7nTpvitXbHfLX/Dewi83ZbxdmP1JxRMyEdSil0HQsj6AEbwsSfEw1zIJiQ6uZAts/adHgNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDJUrWBS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDJUrWBS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JEK5Rd006080
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 17:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KCnfHJoJz2lFO467WT3qgFCT6JHWANvOKYTK+ch4zE=; b=PDJUrWBS8EKxjMn1
	Ep3eJJY6xcGTgQGzdCE8K8la6ufvuoW0t8F4+H19CRSt0wHlp05eID7q7S/3lxhg
	6Bt2in8l/ugGNwGowvlF6IgO3yF4GT/kjohSCWQ8ZB6ajovCM5rofbqo+HpkY/7u
	LxQ4ypblRLVmzezfSgAyPO6db8P4XERsOAsjenWnNExSTAkMIBRealrBiXL5uIJ7
	DZmF7PwauA7zYFcPb7ORAQJhFzH3E6A4FVWx6VIY5oxbZ6DE3kYWfmhAwc/OqHVF
	ndFl8i7YI8NvAHrnxVtxQHUxDvrfIb93MBtwEMvJi1Pgoyy62cEPyZ0/V4TAOhWM
	NhNLMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkhtrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 17:15:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30e8fc03575so2437687a91.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 19 May 2025 10:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674958; x=1748279758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4KCnfHJoJz2lFO467WT3qgFCT6JHWANvOKYTK+ch4zE=;
        b=olPou5AlTd0g/v5Oqf1wdBH2lZpBVdRdVND4nS5zzuKyfS1/u/m8CIvKALBO6fiKMG
         S4Q1yCuP7XMJPv1/gJCsVzBFl1YIIvhv8IOaN64l9uP1Bp9usdfAREaxwJLRI+01gMqn
         aGLhbMchAp9zDNGUuX306eMfCV5NdHZQ3aSsrcc3N82zGQ8JIoRlhmI509nksJYTCvtE
         48dkIPsM42CfK5quVXgQdDILr8I1sYl0DE+h3OH1woHlD6FmVC1ZRwNam+DWnObkqqfn
         etrop2JbMdQ1uvway6izL9YalTc5IPYLwU5HdWimREXlOVc83rGksXmchezs9VsUQ4X3
         D4fw==
X-Forwarded-Encrypted: i=1; AJvYcCVjIWNICcLHJVQKZyN8kd0DuOVsMwFcQEoLNNjUyxG4X3R1ISsjroJtAD7j4GAsUGCWYFPtyDlSjrjK+Mtk0loxmXGy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz96D6xD6/8VqCNxogF8Zwhr1YHIAXAfbKm61Uf/icIhuicX9ru
	2OfJbwNmDY5ej6XXRoGFor08Fse3ZpaFl6sqhYh0qLKMMQTNJBRr+3uj90PbiSoxXqwEvitMg0q
	jBOWsh29GKnVfki22yZtrpkdgUmIpLYpE8FJYvrdt+6h5kRSIKMrGIHmRv9aNaUGlURg1h15Tw4
	3kmSifKovl
X-Gm-Gg: ASbGnctM9d+NJz6pkZDnjcX9LVzwhbr2asooDobPTutCCqeaZEvRwvj8dKvExKpWpp7
	hky7TfLcLbnroaakNuo46OXmFbYFKQKUcsVt0gyMoehW9JCxbpPBzXCbf/hY7n30F9knPU1qm4B
	pOZRq89fIFKlnPL3nAWNC9E4WTv68e0PcA68x8bH/KRHP1OnKhtQjpKbdvI70ANdyf3Tukxqs9K
	hNYxNnszQcdsprp6a+JHoTSV2Rff40/MaPQaCGgARmnqoll4S6OA/snO17Chgw0WyYNduC9SgW6
	cJp5phtzF0vRnJdMWDgqffwu/SNEXmFrghAS1ZXPmsTcloB2DJWOvUqqvapr2DBeYa69V2w4DNk
	grg==
X-Received: by 2002:a17:90b:4a50:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-30e7d50b0a8mr24210362a91.14.1747674958479;
        Mon, 19 May 2025 10:15:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxfsiQa8qNrgbh5Gld+lgY2ZJbJlzb9b2M0nib03jwLcmHrSVDvGuK/JelDKsFqJLGH9S5oQ==
X-Received: by 2002:a17:90b:4a50:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-30e7d50b0a8mr24210310a91.14.1747674958012;
        Mon, 19 May 2025 10:15:58 -0700 (PDT)
Received: from [192.168.86.35] (syn-076-176-048-107.res.spectrum.com. [76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d590a2asm6928852a91.44.2025.05.19.10.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 10:15:57 -0700 (PDT)
Message-ID: <c8fdc06f-feec-4e33-a095-14cb38683f35@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:15:55 -0700
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of
 overlay blobs
To: Wasim Nazir <quic_wasimn@quicinc.com>, devicetree-compiler@vger.kernel.org
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Trilok Soni <trilok.soni@oss.qualcomm.com>
In-Reply-To: <20250519091043.621316-1-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oL9tPCEOE2Cjl0Q_yRjGsL18Y8yfU0cd
X-Proofpoint-ORIG-GUID: oL9tPCEOE2Cjl0Q_yRjGsL18Y8yfU0cd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1OSBTYWx0ZWRfX1YgZdmKNmWcR
 a0Fn7f4Dl6/+Gk1V96t5xRqRdBk/I2qDgOAdnDwU7S4ropUfTXnbG8AFLswP4iuJBaUZ2JRiQl1
 xdrGXkxqFiMAUdCurrWabgXEDwMXI9EPdSg/skluKH0F0lZ1YKXVaEGHnA/kaad/dfaMlv3lUUU
 V/XI06VnMs/5ekgJpgfwNgMKgFgTwfz+QuYMsetwCVq29bfHWOC7V5uFtug+UH3bn/9VJhbElhR
 DXH3VWlgsofiCfTuD67ORRduCvIN7qE7vMOW20zw747COhj4fs8xWwW2HPgpYKYn9MYVevkrW65
 JcF276yuSvbbaKsUNth+HuyTnv38fVR0q7sGfZEcS51OcQU5SFwqh9uGKL4YUa12WGv7eqkZCB9
 MIrI42wlYDXm6f1OP2JqsHLbINyoGqkDbKiHwOu2ql3S1Z4E4VnRLIQlwPZL9F7HmxWHt4RI
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b674f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8
 a=vbSbjOHuINoDek3aZcIA:9 a=Q1lU4rTVkePEluit:21 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190159

On 5/19/2025 2:10 AM, Wasim Nazir wrote:
> Hello,
> 
> This is follow-up attempt for fdtoverlaymerge tool.

Please add detail of the first attempt, since we are submitting it after a long time. 

> 
> Currently all the device-tree (DT) code for a given soc is maintained in a
> common kernel repository. For example, this common DT code will have code for
> audio, video, fingerprint, bluetooth etc. Further this, DT code is typically
> split into a base (soc-common) code and board specific code, with the soc code
> being compiled as soc.dtb and board specific code being compiled as respective
> overlay blobs (board1.dtbo, board2.dtbo etc). soc.dtb represents hardware configuration
> of a given SOC while boardX.dtbo represents configuration of a board/platform
> designed using that soc.soc.dtb and boardX.dtbo files are flashed separately on
> target (besides improving the overall size of DT blobs flashed on target, Android
> Treble also requires separation of soc and board DT bits). Bootloader will pick
> one of the board overlay blobs and merge it with soc.dtb, before booting kernel
> which is presented a unified DT blob (soc + board overlay).

Vatsa wrote it as per the Qualcomm source structure in the Android at that time. 
You can see that he is referring "common" kernel repository etc; You need
to rewrite it or explicitly mention it per Qualcomm directory structure
in Android or QCLinux plus the tech-packages / external driver modules we have. 

You need to translate the problem which others outside Qualcomm can understand
and relate in-order to understand these patches. 


> 
> For ease of code maintenance and better control over release management, we are
> exploring allowing some of the tech teams (audio/fingerprint sensor etc) to

"tech teams" is a internal usage within Qualcomm and it will be hard to understand
some times outside QC. Please rewrite. 

> maintain their kernel code (including their DT code) outside a common kernel
> repository. In our experience, this simplifies number of branches maintained in
> core kernel repo. New/experimental features in fingerprint sensor driver for

"kernel repo" is also bit QC specific. I will stop reviewing this patch
since you should consider rewriting this summary. 

> example that needs to be on a separate branch will not result in unnecessary
> branching in core kenrel repo, affecting all other drivers.
> 
> In addition to compiling DT code outside core kernel tree, we also want to merge
> the blobs back to respective blobs found in kernel build tree at buildtime
> (soc.dtb or boardX.dtbo), as otherwise relying on bootloader to do all the
> overlay impacts boot-time.
> 
> This brings up the need to merge two overlay blobs (fingerprint-overlay.dtbo +
> boardX.dtbo), which currently doesn't seem to be supported and which this patch
> series aims to support.
> 
> fdt_overlay_apply() API currently allows for an overlay DT blob to be merged
> with a base blob. It assumes that all external symbols specified in overlay
> blob's __fixups__ section are found in base blob's __symbols__ section and
> aborts on the first instance where a symbol could not be found in base blob.
> This is mostly fine as the primary use of overlay is on a target for its
> bootloader to merge various overlay blobs based on h/w configuration detected.
> But when the number of overlays increased then bootloader takes lot of time to
> apply the overlays on base DT.
> 
> So we need new API/tool to merge all the overlays into single overlay file
> at host (build machine) side, so that on target side bootloader needs to only
> apply merged-overlay-dt to its base-dt. This saves lot of time due to reduced
> number file reading/loading & minimizing repeatative overlay apply.
> In our test setup we see an improvement of ~60% while applying merged-overlay
> at bootloader and the merged-overlay is product of 7 overlays.
> 
> To serve this overlay-merge feature we have introduce fdtoverlaymerge tool
> which takes input as overlays and gives output to merged-overlay.
> The tool uses fdt_overlay_merge() API introduced in libfdt to do the actual work.
> 
> Additional notes:
>   If snprintf (in libc) may not available in some environments, then we will need
>   to write our own snprintf() in libfdt.
> 
> ---
> Changelog:
> 
> v3:
> - Update copy_node & add copy_fragment_to_base to incorporate two cases i.e
>   - Case1: When target is available and we merge fragments
>   - Case2: When target is not available and we add new fragments
> - Change the logic to update fixups & local_fixups in case of overlay merge.
> - Few patches are squashed, reduced to 4 patches.
> - v2-link: https://lore.kernel.org/all/1599671882-310027-1-git-send-email-gurbaror@codeaurora.org/
> 
> 
> Srivatsa Vaddagiri (4):
>   libfdt: overlay_merge: Introduce fdt_overlay_merge()
>   libfdt: overlay_merge: Rename & copy overlay fragments and their
>     properties
>   libfdt: overlay_merge: Update phandles, symbols, fixups & local_fixups
>   fdtoverlaymerge: A tool that merges overlays
> 
>  .gitignore           |   1 +
>  Makefile             |   4 +
>  Makefile.utils       |   6 +
>  fdtoverlaymerge.c    | 223 +++++++++++
>  libfdt/fdt_overlay.c | 901 ++++++++++++++++++++++++++++++++++++++++++-
>  libfdt/fdt_rw.c      |  14 +-
>  libfdt/libfdt.h      |  18 +
>  libfdt/version.lds   |   1 +
>  meson.build          |   2 +-
>  9 files changed, 1146 insertions(+), 24 deletions(-)
>  create mode 100644 fdtoverlaymerge.c
> 
> 
> base-commit: f4c53f4ebf7809a07666bf728c823005e1f1a612
> --
> 2.49.0
> 

