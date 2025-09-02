Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCB02C21C6
	for <devicetree-compiler@vger.kernel.org>; Tue,  2 Sep 2025 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817509; cv=none; b=DVrWJGolhZxwtX4MmxZf2nBcEkyeZ6fZg1wlulBYPZbq9C0FfDT1LIQvjPvKG8Qv7cRLA3aKUmDKVEBl9uuu9sd7fUV/8D3HhZ5f/c+654s5hHc9T9ESvZEOlBRMCEBW02hC4o/4aE5p7K51Op8AkUpzGEH/tWmAwKV7dzMnPvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817509; c=relaxed/simple;
	bh=XFsjgWdks9UK1IDZq0nzw6/Fak9bnzMGsm7qbX45r1k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eAyL8yK5R1SlQ1QmYrSJpOnH6OqmozFdaQgVxV+gylgtatAgb927CB37vCdbb/Tfm7bluCXiKmfzNUct1uuwjlXaqQouz0U+e4drQjCWqZ5cxZLMtJL1uj2KSItBHfsO3+DBDT9T1/aEmUUaJNTipOqXTK3fi0ab4h2O1sZFlW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSCf/Lj/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSCf/Lj/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BGr9M012533
	for <devicetree-compiler@vger.kernel.org>; Tue, 2 Sep 2025 12:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6CiSitYfQhdcr81D65FI8h69Kgj2yFevP3Pevra2bg=; b=OSCf/Lj/X9LNoHvb
	zM69YtQo+U5EDdR0TgwDLt4cFr+YEF8nJOUDeuu4T9yP6LfrQ/DPymAnHYrh6cMP
	LGuXba4/5YgfmcZBdcvflzAn4+e8qCjOhkS/joUiW5+i5RfovLQQMkZ0Pox/R45O
	TyeIyNjAu+EtIx43g85dZOX+F6DQIAUsA0RGgXIbJ09EPQqhZJeF4SrzU5a0K7BH
	Ld1QZDXZXc2Sz89w/xRCc1tlo6IA3gADjgdvftplYGqBnf/4vEMIRrwQfWfC4YPR
	PPakVKbsgmrpB6+QybmxJukIjqBc/UZNusmZj9DZm+Em6YxrqQFnj+Bxy4ZbaSp3
	MtsuSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0efy75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <devicetree-compiler@vger.kernel.org>; Tue, 02 Sep 2025 12:51:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3d3fc4657so130511cf.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 02 Sep 2025 05:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817505; x=1757422305;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6CiSitYfQhdcr81D65FI8h69Kgj2yFevP3Pevra2bg=;
        b=sOoxIKgZRWmIOT67XNHju72ewnzAHMvslqMo7xG2cwFj0wKNljR5Yn5Y6lV4uFpIGi
         ZCNzMPQ+QXCcFUE0gk65c27Ql01aOiGX8qXx8GFOR+GKOd6vZzDy4ciPIR0hbOECNesK
         4C709nOewYkFX74YCtyLHcLH3LrPLa/BfUsNrMIZNzJoZvoK6ryQe4I9EvLd+e9Y7wjo
         7gCeBcpGOOO+c2AO36NpL6mMOzZyM302VdajzfwHIM6eZF0wRnouQ/qCkdKU+k4F5tZ/
         YxLtJhW4B5+67ODmyc/RwWJmt7y+v6NTa+vuFYmVs2qxrrbCBzaM5g9LGHIxlsQIGqz/
         T9SA==
X-Forwarded-Encrypted: i=1; AJvYcCUgMHa5ng6A1fSwjaEVDHgmuRgLwkwCLa1dhJJfxajLYBqLZJ9ToZ2hHuQSNB56zzcCt2470ckqyidCXQ/FahTIZbbE@vger.kernel.org
X-Gm-Message-State: AOJu0YxdCRvMkeP+HDlEbCoZYLxBHy2aJPbAc+M3ldV48ZgxoYp6zoAy
	3xkNM6C80QU/AaWdEHLevSGJ7UJOavfJxaMVAi1D0FMxwixjnYiDQEQMPgKzlFMHrmcahRng190
	knafzWPj5iwraHaF6CS1NzXErK68jvvShCSx0AoETFosNK42gYwgnxbGsEPBgRP5mtx//upkerf
	Hs
X-Gm-Gg: ASbGncuQSNxbeJ/1d0BE99rUwu6V1pGHPYHqtf+QgsXGpzHTfcEnUVpAG6g92/ezSQQ
	I3Pdg5WPLt0FYs+66CzGb2G/q2nI4jpiGHHucolEyXmKijNfGoN1zRLaQ8XLVrkzxEo0sc8+Xzt
	6GxAEojpDUGNESuCaLWquF+T1onHFGlCI8NHneecItrhaVZ9OGkXtU/6hMR19mNAqGc31rRu5Mh
	pvYQXJL3IJ37TicFmLKaOkhAcTKAf/PgbEvkKcPW085d23NWWRKcbOoLvBfcYXd5xahdU/wKa8m
	lZATuAHnf6pJEyf19/hdKp0fqGKSe39YazL/3348CLm7MunxXfLtiQ6AjBX/+q9+uvLRxVB+0L3
	mWNUjYYZi0yGpRvIXqbSsHA==
X-Received: by 2002:ac8:7c55:0:b0:4b2:d981:9d4a with SMTP id d75a77b69052e-4b30e932ab7mr112312421cf.6.1756817504806;
        Tue, 02 Sep 2025 05:51:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWcOVRlBkcmqXwVmioShHdzfrT7B8lL6AzAwGSTzEMsuMdLrUVFY2cE+u70BBf9DRIBNYhtQ==
X-Received: by 2002:ac8:7c55:0:b0:4b2:d981:9d4a with SMTP id d75a77b69052e-4b30e932ab7mr112311921cf.6.1756817503865;
        Tue, 02 Sep 2025 05:51:43 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040d44c9adsm742131066b.9.2025.09.02.05.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:51:43 -0700 (PDT)
Message-ID: <7e9e749d-cf79-45bc-bff4-d13668c320a7@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:51:41 +0200
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Introduce fdt_overlay_merge() to allow merge of
 overlay blobs
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 <3f63bde4-f534-4dd1-a791-8326aef5c482@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3f63bde4-f534-4dd1-a791-8326aef5c482@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s06Q3OqYMTF0qNxmM7zHFWce7W52v19t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXwTaL7VGBGYiZ
 YTzRDpT5VYMZUzxHKxDVKFRO4/XU+J25rTyZZu8TBtgb0EHa1iiwVn4r2JaP7mF7a7iOsY51Mv/
 lD9nmlxK1KssxzLZiPA/WTekxE+dmgflQEjKTHe3W7xumLPCgoMnOwNfZ98wPOf62sC8669AsYa
 qiMxFaFI4qCrXgCv8QNcHqukijBnkz7xmKO6JzEZYR6hQ+N88YwGH+dEkY5hb4KAfePLr2K6DMe
 K0KGt4cOrVNgwgiaLi9ZkUDBIocFeC2NPuSorW5cg2g+fRXwC8oaDSzq/LQWsd1oYDjExv3cT4y
 Z413xGVuhEmT0IwcKawwquz4XnXcOzjhq7tuw2WhbCBOQTIuFsIMnOYjUOy2MwxB/V/F6zVslrG
 Mr2PeCjn
X-Proofpoint-ORIG-GUID: s06Q3OqYMTF0qNxmM7zHFWce7W52v19t
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6e862 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=K12AKi6NsyBnpLsEiysA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On 9/2/25 2:49 PM, Konrad Dybcio wrote:
> On 9/2/25 12:35 PM, Wasim Nazir wrote:
>> [...]
>>>>
>>>> Our repositores are following android structure based on android-treble
>>>> where vendor subsystems needs to be modular for ease of OTA upgrade and
>>>> development.
>>>>
>>>> As a result of which each feature/techpack (viz. audio, video etc.) have
>>>> its own independent repositories where it can build its modules and
>>>> overlay DT (soc & board).
>>>> Kernel is separate and provides only the core images and base DT (soc &
>>>> board).
>>>
>>> The build system should serve the needs of the project, not the other
>>> way around.  If the feature repos can emit a dtbo, why can't they emit
>>> a dts as well?
>>>
>>>> So, dtbo is the option to build it independently and at last we have
>>>> options to either "overlay all dtbo at boot-time" or "merge it at build-time and
>>>> overlay final dtbo at boot-time".
>>>>
>>>> This build-time merge is done outside techpack build system.
>>>> But if we want to have dts from each techpack, then techpack-build system needs
>>>> to communicate somehow to know which dts to include with which base dts.
>>>
>>> Why is that a harder problem than knowing which dtbo?  The dtbo must
>>> have been built from some sort of dts, no?
>>>
>>>> This is not possible at build-time between techpacks.
>>>
>>> The build system is not immutable - you're proposing changes to libfdt
>>> and/or dtc; why not changes to the build system?
>>>
>>
>> Hi David,
>>
>> As each techpack operates in a sandboxed environment with its own build
>> structure, all dependencies are managed within that sandbox, so the
>> techpack owner only needs to focus on their own module. Since each
>> techpack produces a compiled DTBO, it is self-contained and can be
>> merged with other DTBOs without additional coordination.
>>
>> If we were to use DTS files instead, every techpack owner would need to
>> be involved in resolving cross-dependencies, which is not scalable in
>> our modular setup.
> 
> +CC Couple of probably interested folks
> 
> My slightly-related $0.05 are that the whole concept of compartmentalizing
> DT development like this makes any sort of uniformity, common style or
> overall coherence of platform description impossible, as each team
> inadvertently develops tunnel vision of their slice of the SoC/board, with
> the only tangible benefit being a smaller LoC-per-reviewer ratio (that is,
> unless the same person gets assigned to review multiple compartments..)
> 
> This works when you just need DT to convince the OS to bind the resources
> to a driver, but actively prevents developers from catching anti-patterns
> and/or abuses before they arise

Just to make sure it's clear - this is not any sort of nak to the patchset

Konrad
