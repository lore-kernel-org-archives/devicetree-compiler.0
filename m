Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569140;
	b=bcMmbSoVIv+hF2jv8Ak2q64zXY5Nd56Xvxoo6J5M+YH6N25gp/lHirMEuIxr4YnwWM0e
	 lykVcCol7HDd/0bG10NYOnzhh5erdCEgRyTB7+ms6eOq+bSqw1fgQHQ98u71IoI68tJ1s
	 QBxddkQTDrVXj29lNrFQp6gLj2cEovjy2/ewpUSFyufZcrfYUHeU7B8wv2NPr8VZx99L4
	 8qJo/LicNX/dSKOuUjVUf92Q8TMz7IMCNrCv+XOecFreW4CAc570+QQP8SJsJea3Cr4ws
	 zMoNh8c79ys87Upy2AGiBTl83nb4eU/sgZIXaja3yBbGWrwodTVdcU/9dKofsbVPzEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
	b=XMfwspp7GQqdl8H9eHmGJSeVa8QkZhwqb3PjevMLUO2GG0bbwxBRvWNZ5MJoidRCzaAX
	 doo6p6p3+xABo0ian551IFESG3buci7WIBgQ3TuJw1IcYGcBrEbuybjQdlbmHaGr2uu7q
	 ySCeENbT78LRlxFx4Xp2yc+Xw1pcCUn/+eLdnohAWT2t5olque9lqpyidxGGOYQj8KMNX
	 U3nkEciUonQEyrDQchvRsVE7IS3Rgh7cXFUCnmEc/+uhLjYXLLFgx2R3sb13SUMVSf4hn
	 0yXdU4GgcASC0hnnyybiN20hcqvyq+kNETvnAas+TVwVG34Whg7pG4/52W4kBheyeQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kaaNZghx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87196606A31D
	for <Devicetree-compiler@vger.kernel.org>; Wed, 21 Oct 2026 07:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87196606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kaaNZghx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L7cd7S502632
	for <Devicetree-compiler@vger.kernel.org>; Wed, 21 Oct 2026 07:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=; b=AyQbDhhIrkFWR6Vk
	Qi2NR9JA3Zl2CUV7EWDi6niUDRqZIXrxHan5CO5/E/BXU7ve/rdkbmA1nMYiorTj
	uUnreypvOJoV9NBh7qXqdcP2SpKXHgjoLhz89Rwh0hy6JheE85O54i4M3fuBy9+K
	GPoUifUKk6HR/ZvKSW5RdHvWNFEesfA+HyQp4k8orY6iqKF5XuUB1191IkbZE+8P
	plpke5EwWoQ+7NfxTqbvPFLeYU9SR35EZlpu5h8sxqbblJm3JCdRo8AnJX/ALU05
	F/8Y9yWbh3i75DhlSJm/79KrlTXj29up/7QkDqsFQj2p0RS5n2rG7kpyuT0V4JEd
	ihpS0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjnfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <Devicetree-compiler@vger.kernel.org>; Wed, 21 Oct 2026 07:52:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac58b24so14025585a.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 21 Oct 2026 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569137; x=1793173937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=kaaNZghx1V1tDVFBtfbOHdOEr9Phizi5xlJ6ERiWDvDbI05JyEfD8rWGP5+yvkruew
         TlfhXByCfoj1YkiW/fDODftvPmJftZIjr7Iw46dmmKiZZnoy12TAeIbExF4QQEj/EMmR
         gBVn56zqc4I7isgfEVvKVzPVOPVeYOFh9QZzb1uf1zHmZ7QrFXBZ7w1lQLvXfozybWcZ
         HQSvEbwYmprFOVV6VFjgN/6MewUKUNYD4bNMRVF8lImECzYCCASqyvAMJ2MXd3qy2tbQ
         dfquvwSA8MVDVame3bezw0dSVPs2SYFy8qtYfhPrgCagyVqEna3l6E2NGwAfAE8yyKW5
         Em2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569137; x=1793173937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=oyrgaZ2YEdAItDNLhYRdu+JsgG57rz0Jr3OUDgCzVI43/j1xTp7WVzdjNts1g72yhi
         9f1oGLggha4r6dcvjO92uLo1TAOiP3kmU3FqxHwrBLYZn83B00icEZIqKWgHTSfL7naT
         j0G9F6LXkptXhUo6db2CE/OX7RRYXjpO/Rxk8+u29deS88WGmbNt+TMgLIFMDx1nxIZe
         LkM/jLCV5T3AMuNvJYFh9c8y5I7VEG5zoHX2pEFY1/9wuKngJ/WSvZ2exNkjqJqTKqyD
         1KmxLHBqN6BABGuxP4NP8yICA2cZCY0vxC/Ye4QRR+OkOH4LmwW8qfcUwieRPi3gB9lm
         NNdA==
X-Forwarded-Encrypted: i=1; AKwUvBwOSb0qrUTJ1pMWyuPZTgt3X4EUNYBy4AKwYuKcIDevvMvCF8Iqpf2jZRqzTVQFgzxfqrUG0G67T4vs6J0GcH2rdvGB@vger.kernel.org
X-Gm-Message-State: AFq9FYKH7l9e/dRUWgJChJoKRsQ8RPzYIzf1eUbSIr6IptAQjRceC8RI
	tATqk2QF6iqwsaPe8b8gvjccjAUOghFKHfNF4j2q6I+Z4b1+6sAmNF9dajmgrSdVvKp/rzQjRDl
	a97Ij90wUiHdl26xI3SHxWXBRPrpGZMNcHhK74fLtgIUjCqv1YB4p6HgbkfLYIcK6yTyiuKv5T3
	A9
X-Gm-Gg: AYBFou0LulnSUIOlJUoOvlqK1Zui+eJphAupCtYlFozZRA/vrr2NV97DabsoLzlP23x
	9jk73U1fxY8nkxphoHVCvTaj/ZFdlwa5XCfIeLjKLYxFKbEUlXRmL0bzIX/Br6j1oTqqLwiJfkd
	T3ujxFVKe+kN3Cvyq5EOIAkEv73mYmuCI/QW4X4WbXKS1ubRd7O2vflXb38THhGEEicPp+P8bCv
	UwBCAoRtiEkra9LA/desPlrqDJUWlIBDBzD/DdxHNIYGsE4id/GjT0jBca3SEnLWBa3XkO02kOx
	6MPAk8EtqjxwoT8PbIKgxu/O6Z+JGUb7iTeecBXqTNzG/5cdBjTB9Ca8E2vuARjr/jSl8rmJWe5
	4L02LUxcqSBYub1o+Q+62Ww==
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23256131cf.1.1792569137634;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23255851cf.1.1792569137150;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679009aacsm49878266b.78.2026.10.21.00.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:52:16 -0700 (PDT)
Message-ID: <08dea1cb-aaf2-4c62-ba9d-8bef2d6d44a1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:52:10 +0200
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
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
        linux-arm-msm@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org,
        Julius Werner <jwerner@chromium.org>,
        Saravana Kannan
 <saravanak@kernel.org>, Will Deacon <will@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX63BYrlVQ6/aX
 Xo87UxfpWvOXgsOs2R1uzRQRvUNCv75bzkSG8qVSxKvQE/dY0e6c1po1iPGZbCaaqMSVnN7n3dA
 zSOfzZa2/COdpMI9OeGb3FeeFPj3VcOfxNUg/ZdKaV95YYUCBVQb3GPwlK53e2LVT722RlLUF9P
 Ho5M2Dbze+SYHfyJ4LoC2dH3teGEcY/BEgN7E1H8iOjDPhnYBVLb7pZMt6YRJyw+mRvKvtjlxSy
 WkuVkC6UpXz/2NYEcq1lHNVRc+qEvIJemgKx6GltNpNWrFHSnpy267vRa2I8XgN9A1aRnU8NV0c
 UY+c19xcklzIvUfQwpsGiGIVp/rs96FtDlTvwT8+EUKpAVbSYwZWkK9gdLZbQUGO+H8HPC0EvzB
 ldeCeOFKXdqIMw0X7lmCrS9LIt6jqGeDDGahgM9enl3480DZI3F4udIs3JNpPm5MG7IC7OiTRbN
 Z1U11AjnXDMMxmXJZiw==
X-Proofpoint-GUID: 44mx_WgsqykgCJJJLXpHenqoC3HBsao2
X-Proofpoint-ORIG-GUID: 44mx_WgsqykgCJJJLXpHenqoC3HBsao2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX0ZU32D1MQj/w
 ZcE05ustvF4925TLUx5AuS8VlxUCGsjfc23vgMs1+nlACi2xSSW6rthI1S1724pskS3KXPuR1Rw
 eyZZ8caJCi+t7Re/rDl9qzGi6y+uA1g=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad86f32 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=hCCUOKFY6uXp-TWS5dAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

On 10/20/26 5:35 PM, Douglas Anderson wrote:
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:
> 
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
