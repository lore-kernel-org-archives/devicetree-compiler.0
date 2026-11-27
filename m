Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781618;
	b=4Rjxlzw6GqDmgnHT+mrecsbesXPkYdPeRwdE8QDZtn6us3fGwrKrJkJcGj7+UAyfT25W
	 cMBn5aAC0qqZOwe6MC9PjSIASCChCBPl6UyDRdi/95Wj87xPBNhahMRYDSxBlG8dUHhoj
	 Kn2VtHPteWl9fKBU9O58YJ8pSJczfG2pUlMWWSkfWwXDkNCHQr1Uyt6cxJKNsgtVYaiRc
	 MzFP5yOG2QzJz4xqvhu13cqlVpa/kYgVpvzlQBk74xRYdDEe5pNKTO1PqDKABCBRsJILC
	 4C8O0gSnG/WxUbdy2+DmekCKrPmXbYq2wBrvzl4lUzyqTh72HaZooqnqfshreW0XVtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
	b=JwgCuhI3GSFWMVjXXXZklOAAKzLZhn1TWHLiHZ5yRlDeZxFyFI/iyKfNMa+ohUeV9R4T
	 kZt/+jJ+lBbUC8wPdH18NKk4Tx3zFqDIP2bzdPMx9ERqUILujGTGHeXVUGuOSV5TRCObM
	 V0qRGKTeK7E4FsiaVZJyKE1A8vZNOl2OegaPIAt+PQT3p4yX6peeWy7qpvigNEuQh1bYw
	 gX+l7oDuqrg5boMSfEDTIOzFzIHAJvQFOc2yrkUhZF6PU0quinh9DVsQDgQetqBeV45QV
	 rT/cUmMnQ3RFrYYaXdtUJfAe1rl/2gEh00bIgX6BJLDR/jODJsZzDUoqeCIYuCDN4Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IzTcYT/o";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKnZgQSD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A8606A33B
	for <Devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 12:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B87A8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IzTcYT/o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKnZgQSD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp9PW2268650
	for <Devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 12:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=; b=IzTcYT/ozKMWXuJA
	qR2A1WW6ceB8r0S5rRexOAaw82FLGR9RGJL2KY1QkdqwqhxOyy8+EAURlkYrhvmd
	bjyzWZqkIEJQRryUt/C0tMhcxF/TjRuJdu3CpvRmL4ecVAtogGaVmu8Jno+f6yXc
	1D35w2HDNHULZb9fFmkEdlU/ey5qoHhGXXWmQ84kKqoOrd/u+VgeVOdFTzXHvTTM
	5tuCqikXS5HG/dFoCJ7o/VM5gf2SqaMLM0AI/WEYe8yHvUDuthglQhyNU9alv+Iq
	oT5NKBdl9W3LAoL5GNm96tf2LSb2BO8r3kIpeCe8oXIZs8fLvunOWPA420dvhkbG
	A4NYzg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhhrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <Devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 12:13:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso340721e0c.3
        for <Devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 04:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781616; x=1796386416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
        b=cKnZgQSD8br2MGLHVo+K4h83QIzyW0OkHXK/IcSJtBaa5Z4bSkpAUCioYjn07Yia3Z
         BPNeKZJDUB3QQ54qdI3C4nbCyov8n7yKrhWA8wqB7eRRAjDOmL900FWP5dt6XywAOMPp
         fW3S3Pm3lytDYqjEXwbAT7u/0Zx5NiVMjSWQo90ZNjGWzKQX7dvrbZaKo2Q5x47hdxJH
         EvXtFF9XsS51AbB9tZpsW1YTOvWAkSQQhCpI2rdXp9E1NRCP/niQg2Hjtte0bpUenfW0
         lVnyK3G9GZzr4TSvo7hLrejlYMqJtKE1dSZ5M0MQYjllKypzkwx+qS+STFUSAiXbIeEg
         Ktng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781616; x=1796386416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
        b=y8gYvV1fVj6pAhsm/B9yXo9krov80pRQy8T8kG38dJ4G9iN0TFEjAj/LLTxlHh79yO
         klJDPrgy/TfNdZOrNlHpiacZig8VmgfYttAsyXmZYmJMQaMicNJJtUmtIweEet+9NeX7
         x8HLOY74D3mQI1zPg7cpY9j7u2g0zlmimAyrdVXLmCLQiqGkve2jm1fKPADpYAptWvxZ
         Qseq2rYl1IYzPbK1RT+w/zg9MdrMbs1rUhs9d4xjtkrr1PJKfPeiiK6aW04lfwhlc69w
         A4kQeovrkDMMx6txRV6AtHwIRJDgSV15Dxp0eTeI3r3SbGuSZ3irZ3b8Iu/29MO+pLQ9
         6I1Q==
X-Forwarded-Encrypted: i=1; AL+hErEBygiUVyY2laKCt5HihnwSb6hMBKe5AfTiHAR326XclENdAj718hi6/fck2pJEOPHDuOgIXeaGGs28yLsoaO1zz+T7@vger.kernel.org
X-Gm-Message-State: APuU4Z9efdEteYS6kRuPVvVzlY5sCP1YKTWPVDOBMCgzBlvOLwIsCviS
	VtmlznicYxqKu2de4JasSDyndK5DQYkS2vXGUanWCGc6L9/HR1mCnoE4o38+idG/MzovzVHRoPr
	CVe/8DrWRZhzLcttNszfo5eD70iyW7m0gh59140UIgrq8RYnNzjNHxr28P33utrI0ivgNzYrdiA
	5o
X-Gm-Gg: AZFdTZfq4LWmZClV9WZi+7Iooe9+ozPMQFRWRZ5xhz6QvInwcSx7ceqACYQ6dnX21wC
	/r3tbYRq9A4UdRUmelgp8pvxwuNQEgGP+Hqvvi3wuWs51KBrLuIWiiZDL+hvw5w7Pt2bMjxNGPo
	8wD1vV+WlIRyZDwDxr5SCKNDggSWMuiyDp7+mVt1LSy376gTXEs2W9mk6sN3U0C7MMR6S5KIX1/
	SWqPm+paKfWjJnOCj42juD1+fXxJ2sJtzxgETxVuklZ1Y/oGJ10fVvik/RN07YirlW7zzRhv5jD
	3/L/dQG6mNthn6vEHIXw0Lkl5CxBd8velbuu25LXWO5Hx3Xnq5vatPRPtbDYqspnHwco3Jvx3VA
	fM9lWaWep5edCZIcHf9zywR5YcpjoZJ6cBy9U1T16Ul+0GpxexD78taoPVPJedUrSHlH/+kI=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr16376780e0c.3.1795781615907;
        Fri, 27 Nov 2026 04:13:35 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr16376707e0c.3.1795781615471;
        Fri, 27 Nov 2026 04:13:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm845002066b.43.2026.11.27.04.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:13:34 -0800 (PST)
Message-ID: <c3ebad86-3421-4941-bf64-e400dc8f14eb@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:13:32 +0100
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 5/5] arm64: dts: qcom: sc7180: Add
 sc7180-trogdor.fitconfig FIT config file
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>,
        Peter Griffin <peter.griffin@linaro.org>, linux-kbuild@vger.kernel.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Chen-Yu Tsai <wenst@chromium.org>, Will Deacon <will@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
        Saravana Kannan <saravanak@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfXxDtnmDpnvGZB
 UbtMx7waZsbKp1UO4OcQNybQ4U1uwRwtZVctkWnnkIIN96LGIOgS72VqmNzI5GBzb1MIpi3FYsI
 mvgjDjOZashFD4PbHjGliX9vyf8KvoA=
X-Proofpoint-ORIG-GUID: DtFpcnniz02yWA9FSb6Ja2lXH0AAECvc
X-Proofpoint-GUID: DtFpcnniz02yWA9FSb6Ja2lXH0AAECvc
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b0973f0 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=kMGPIAtnrfzpPBabNyUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfXw8p6xlH69OST
 kGd5puuJqEOj2YwAYVJ/+nih9U+fc6mEO7WU68FFUprU3JX016k+dbP6BSSlbubxXzI6i9lOTv7
 kSxwEGvE3ge6j3wkcZMoipYPYKMRqRhX88A85oQDHlZaXz4gLcmvQb9s2INyE2ssdFDGQnHnFYn
 5zEjPbDgdFSxtY0loCEFQBC0EwZ4EUF847Et6Kk0rtNrAWmsuEp6Gs7SOJiW6NUs9RZrtAEHf17
 FiBHUKjlnneNNzBwaneZKZ6tAYiNUekJh7MiJpuYiGMq5TobcSn4hEtNV3SX7UA+jPP/ThfYmKo
 GWSitnoa9kGFFrCXwDqmlRDt+LJS5QjcJvnsrU2T6Q+XbAZa437mwwJHU2gvqGsCeyolxHAMc3P
 sVatss0Jnl+ACAT4RAaT03sHA2AivSCjUs4KYbhDS4nn0Zzc759FhXbhtWvPnreEDWza+Ea79OP
 ZxGSCLelrW3Of+GhOZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048

On 11/13/26 10:09 PM, Douglas Anderson wrote:
> Add a FIT configuration file (`sc7180-trogdor.fitconfig`) listing the
> SC7180 Trogdor family board DTBs, allowing the LZ4-compressed Trogdor
> FIT image to be built with:
> 
>   make \
>     FIT_CONFIG=qcom/sc7180-trogdor.fitconfig \
>     FIT_COMPRESSION=lz4 \
>     FIT_FACTOR_DTBS=1 \
>     image.fit
> 
> Having an in-tree `.fitconfig` configuration file for Trogdor produces a
> FIT image matching what downstream ChromeOS build scripts
> programmatically generate, makes it easy to use `fdtfactor` on the
> Trogdor kernel image, serves as a template for future Chromebooks (which
> could encode board/SKU matching metadata in configuration match subnodes
> rather than combinatorial `compatible` strings), and helps community
> users building upstream kernels for `sc7180-trogdor` devices.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
