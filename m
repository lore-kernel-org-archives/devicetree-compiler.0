Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8ED2652B2
	for <devicetree-compiler@vger.kernel.org>; Tue,  2 Sep 2025 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817366; cv=none; b=VAER4Iuyaq0dXCuhImpFXCuD8h9VxI5SIJSqIWhW+8h6ptlT1KnlljtoeRumoCBVDfBuOgjkm2ictK38iacEcTlz3ldFAqAMy972rIHcMQiC6FrjZXN8zC4lqkYDoBwnMPJRSFfD37losb6M8+4OnrY4upsfDP5pOrmCJDnRSlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817366; c=relaxed/simple;
	bh=JeHkLvW7nFmYLFt+WzhtR7BCpEpu/jeXYl/wyZM71TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUpcphL+VkgTpgGzHUciB77jwJ98Oei5omyIwpEHjcRaE3aL1r+spaEl/4lFEuxGu4WTfDTkhkM2+I1/uTt4ZYT5qyPPIttymcKb+uVC91sbdgQoAdSP6qcOOlujPG9nLYTFyfmtgVWG6wRlJQjHs17P65DGwoV/NixiJtnanX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mx/83hY6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mx/83hY6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Agfxu009790
	for <devicetree-compiler@vger.kernel.org>; Tue, 2 Sep 2025 12:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uv7QzNwxbI/Epf17R6g6LwsEakxyjfdHpoAgr3helsQ=; b=Mx/83hY6HtRDk0N5
	bcr92ZqgrrjYuR/Ngg2Y/5NEmpzJqXIYRGJewz+hoHpw8RBsdTkARgtf0k0vaUGG
	xG+QO10lGp7ml0LbQ8o3kB9ozz6ip29k6+ylO3uWhzmI5YPcAu/E/DEBVAN1xTOU
	wYBX9pXvHcQPB49nJMViy/VdXtLbj4Ukwj1VUEd3fnSkrlH9+ylZ7EH/K5GvhyKk
	pSxaAe4sGpG5lA3nBMiFxHPR66gKho76X/npCxsDLebLYqWaQxmAGGLK4+FCTW8X
	sNfyKe57Tgd0EEMyT3TTIEmcqdf3aT1sjRRRurVLXiSz1JDGdXXOPwa2s86CkF5i
	rtdXiA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjfsuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Tue, 02 Sep 2025 12:49:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3387c826eso7495601cf.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 02 Sep 2025 05:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817363; x=1757422163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv7QzNwxbI/Epf17R6g6LwsEakxyjfdHpoAgr3helsQ=;
        b=IoTFVaDkJbtJKvuzJ2PtkfiDmkrgG083Qjr8mDQ/9tLc7g9HKVHZxnZA9Sd7LYTC94
         1jF9pG3y//jBwo+Dx8ldJbrAUhOCOw3Nwk+dgmAIMdN4suVwIwnbdShhcWAcia3D22xP
         2rFOuIb0uyhQGcbrwIRZIEABJ7/Xp8Qu8VFnUMMNCM8BBC0x15HAclWbYHphQj/d97Kd
         itp8ljaFXAc6qtXyQOsePcJTP64VPrGAwcNGFGN5u7xCEvqR5yRwbkPaVIfw8cQb1z4j
         MoTG/qrA13kh8+l3tdPPIMr2E6EZaF8PTX56vAMeq4yVN/dltal2LeI/+UjIjcjEat/7
         cmyg==
X-Forwarded-Encrypted: i=1; AJvYcCXxlaNDrpEY6SLN3pbXiknryRfw0AJTsD9lW+V34lPpAYbPKUkxHgNjPVDKSSC1eYO+HuXNNAGp2Q8ZDrb+Ctwgc0nx@vger.kernel.org
X-Gm-Message-State: AOJu0YxuprXiD0fh54CIEJ6pNzEE5tjEivqYNOhtTXVnkQaMVymfoD4p
	durjwx3m09gbeH8GgbhAyD6Zu2rgnPEiwJbB1mk8wn9VTQS0qAVf+hwD+0eFPFiHJMEeHMdrE29
	LBWuvXxdSh5vzuulcsgpvzPZFLugS6D/QawnH86LziuOx45yJe7YuRSba4xDcqK7FQ3oy2NJTCz
	S5
X-Gm-Gg: ASbGncvpsBxawLJLbDg44EG1/ZY1gxDgAYsggWPuYJzcSDEg36TLFoSPVfJ8uIgte1H
	Gyxsur1yX3cDc4K81rImLOqOAhbRLTJpnVoBo9z2S4XG/VKeA+emgvfgFCqEJZZxAaaS15vcPN8
	XrSRLgo3kNQTvbuzFYVM2+UZjoPnWa5gGrGiYwqnSVfI8QPzY8TMRHc0YsuSrwvkCv/nzk2HpKC
	7nYdoqESJFX3o79o3jBu8jLjcsUu0jQPQlbr9/9m7iuinxaNDmfpIJ2c0vfIGnpYIpOvULsTHEB
	ih4SjhmiXrashRIEVMhDhJz/TK/5VS4P7vcazFUEHgjtGvt06iEBLHb4bbTmjg5vkV4T5yudVW7
	OQ5Pq3cVr3zrEaCEvLURCtQ==
X-Received: by 2002:a05:622a:1992:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4b313dd0295mr113549281cf.2.1756817362686;
        Tue, 02 Sep 2025 05:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+yBHJS93Fc33z9SAcNLUR66NTc1GIwEUIogmpS/5PKOLJ5w0+gzAiOuavy6vFNl7eFojdzQ==
X-Received: by 2002:a05:622a:1992:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4b313dd0295mr113548901cf.2.1756817361955;
        Tue, 02 Sep 2025 05:49:21 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7a10sm9785053a12.5.2025.09.02.05.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:49:21 -0700 (PDT)
Message-ID: <3f63bde4-f534-4dd1-a791-8326aef5c482@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:49:18 +0200
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of
 overlay blobs
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        David Gibson <david@gibson.dropbear.id.au>
Cc: Wasim Nazir <quic_wasimn@quicinc.com>, devicetree-compiler@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <aC1Up3yHJURgc2P4@zatzit> <aDnCeF88D6BdCzss@hu-wasimn-hyd.qualcomm.com>
 <aD7W73A7vWQr8ZPx@zatzit> <aF5vSAKbARuThVZR@hu-wasimn-hyd.qualcomm.com>
 <aF_KEwXLkQ2ff_69@zatzit> <aLbIb6s0Ps0J1lZL@hu-wasimn-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aLbIb6s0Ps0J1lZL@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6e7d3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Aut3hR_EAB3_qb9LFYsA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: eKBrPOD7kvXkFeG-t8Nw8rxrKRVq_Si2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXxTi8jpdLHT8P
 +hEBayUxU1v6QIlhNyMQIW2TsEFVa4VuDmdIrH8IoZZFc6K326ZYXXTv4RIxMytqGnd11B6L2i9
 25Vviyhbq+LhN5nKrMPFiFjkOIpAU8FJI9vVJT892kJWSniKeAQjsWBGfVb1WWGp3zG9TCOKKWy
 M6KN3NuayjvKe90JfOMiD0mxyYvxelsgC15aYcmecIAYOjPpORoD9U3iWVJWboERgcV88QRNcSf
 jBMMQ7qs4frOuQ+3wtKKFYkM6yXoHFNjcZxpfZSgsBBIJVJRS00GdDBBsiBOE486V+0OLzC0kBG
 7e5GJwH1MwIpHoUcsUFtoc3QLoSJ9zWlzqTDNPGBPV2l9S78SgkEmwGjb+NuswRId2vtDoJIK/0
 6I/uNS1b
X-Proofpoint-ORIG-GUID: eKBrPOD7kvXkFeG-t8Nw8rxrKRVq_Si2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/2/25 12:35 PM, Wasim Nazir wrote:
> [...]
>>>
>>> Our repositores are following android structure based on android-treble
>>> where vendor subsystems needs to be modular for ease of OTA upgrade and
>>> development.
>>>
>>> As a result of which each feature/techpack (viz. audio, video etc.) have
>>> its own independent repositories where it can build its modules and
>>> overlay DT (soc & board).
>>> Kernel is separate and provides only the core images and base DT (soc &
>>> board).
>>
>> The build system should serve the needs of the project, not the other
>> way around.  If the feature repos can emit a dtbo, why can't they emit
>> a dts as well?
>>
>>> So, dtbo is the option to build it independently and at last we have
>>> options to either "overlay all dtbo at boot-time" or "merge it at build-time and
>>> overlay final dtbo at boot-time".
>>>
>>> This build-time merge is done outside techpack build system.
>>> But if we want to have dts from each techpack, then techpack-build system needs
>>> to communicate somehow to know which dts to include with which base dts.
>>
>> Why is that a harder problem than knowing which dtbo?  The dtbo must
>> have been built from some sort of dts, no?
>>
>>> This is not possible at build-time between techpacks.
>>
>> The build system is not immutable - you're proposing changes to libfdt
>> and/or dtc; why not changes to the build system?
>>
> 
> Hi David,
> 
> As each techpack operates in a sandboxed environment with its own build
> structure, all dependencies are managed within that sandbox, so the
> techpack owner only needs to focus on their own module. Since each
> techpack produces a compiled DTBO, it is self-contained and can be
> merged with other DTBOs without additional coordination.
> 
> If we were to use DTS files instead, every techpack owner would need to
> be involved in resolving cross-dependencies, which is not scalable in
> our modular setup.

+CC Couple of probably interested folks

My slightly-related $0.05 are that the whole concept of compartmentalizing
DT development like this makes any sort of uniformity, common style or
overall coherence of platform description impossible, as each team
inadvertently develops tunnel vision of their slice of the SoC/board, with
the only tangible benefit being a smaller LoC-per-reviewer ratio (that is,
unless the same person gets assigned to review multiple compartments..)

This works when you just need DT to convince the OS to bind the resources
to a driver, but actively prevents developers from catching anti-patterns
and/or abuses before they arise

Konrad
