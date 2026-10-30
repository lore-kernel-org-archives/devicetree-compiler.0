Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364617;
	b=JCInAm3+EWjE3X3vX+LMtDzPIlSr2sAQluqeEFvCTA5diRlQumBZBRr/9br2D9PyoaSh
	 s5mTw/aUbkBM/50xnEHJkdrCjeW5J3M5QT/PkD81q2hn8HlAydaN76Ba3Od2779UkAlBY
	 KiREtUaoHootfaBgCcmhaQDx9XtGdvV1ugVmQc7eWOTNNO63yEI6nMoqoh9uKYlAUp6r/
	 sUz0pj2+ocjgTAyIFQscfXcrkQ9PAUbyi7C4zuCj5qqV4GD60Ka0DBQCkJT3UA+rOXxPy
	 zNx+lQrl3KAKnuYQAcu7Syk/tJTWm36Bt/JG/rB/OYwwJ98Z865hF0KsXwYah6dXT6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
	b=YBIW8Dk38FRdRQX6CdLr4cwttTPYK5f20/BXt5T1AVg7q53ZAtTbJEk+KgBWPYKsPNhB
	 CWdc/qr8DVv9+K/UaM+1kfajQzCT8kAYFGH18Nk+BpqCtdYrRym7wqnPbjFp1wCRZzlcr
	 OU33IFaQbodk+hJoH2JynmI+DiWVo9qOaX7H/ifmRcGzepWZEzH/dCxW+VVoouW8Q5dZ6
	 gm7IqMaTGqloGr/C/yyMQhllkPkQEbfl+pVWoByNnuhokmkvd3JIthavY9OrE5FXby2By
	 pz57atAN92nkqGexWIc1dP0EJImFb9TCzIotb+CK3/DYIuCpnNm+4V0Z6MGYTtiFE6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TzCiSuTo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904D5606A31C
	for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 12:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 904D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TzCiSuTo
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so748306a12.0
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 05:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364615; cv=none;
        d=google.com; s=arc-20260327;
        b=mHjW0PBJdnnCTGFUSL8f6F3M4jZyTG3zXSJsddQ4XnOgHetK19Z0YQSxAEpkvqmUa5
         9cGBB833RAdxcZos6PM2oYOgcH4fo7ABkuBGED3no0CspVQbaYrO1JdW0wptOaZy713L
         ZAnAQ1QyNF54AHp0CEyiyJP4lC2CbenW5N8Aj4vrEhXpQx8u11cjD3YwBqGYvH95zR6p
         vbIc+BkNyHdIDuyabL/tMioENt1ApWG+Vi64vNhvYAoE/3wc9b5o7Yra0KD36vRwlb5v
         VCZL9eVj7Y56/RFIuDTpWVXFo6X3bonlFoKjzlesp6V9wo/j2+2howVqem9C5nT1rTU9
         xuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
        fh=v0GCJqyoWGhL0bL1BD0oUO+DkJ2nkPH0tE1OsgHyX7k=;
        b=ei8ILdqlI1wtsKhZ6/sYcod4Of3xEj+uzigYNgLExnHUOLdQ/0SXorJ25ZLe4oNhzR
         fi1XtyyW3zzsEY1bVN7Tc7KnBLmDzRodCQvxfUVH5OBTho4TPW6FrrTR6F/+/IRqQ9vX
         qVcdXpk/Vuj+2PcIEAMOGkmk3nzQNtjthWRweQWQOxnBqhZmrFBgKKHbsAivm6oYVck1
         H5x4Vk3Xgd065picRQEt/WnhFRnDA9jD5XMUdRUXQRRvG/eS8h8UYtn+oa6vj/hb6D9V
         jDJDixFgE9RfzL6i2dxqXlXiA6phF0C+GQXA0Yq/0cH60vpJtmtXq5fNOtiX3+HclDZW
         LBiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364615; x=1793969415; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
        b=TzCiSuToJkR7BCFedxtyLeiDz71h+eYNxYR7HpKJ0TmSc/1+iX8nAVnXW13Bu5xBaV
         pgR+LGdFa63l1pAbtG/WsZoHQKmZTw95ahfWxE1wOa2Rxsdc4cnFWbhBRZxUFHxJ74xK
         D1Tr2CGY6l/uuFpN+YFijxZv6Vfhr+f/7Gj3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364615; x=1793969415;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
        b=zGz/lREvD6U3fqZ3yjvoEPTqpHhSIaRtDREJ7qy+6G/dMyO/VgG35VYvvUEbZSM6zr
         f/Ouc9EDpixgTnXJkrnBCFfJwbDW0EuJiiwKGpRcuI2Ac4MlynYHRBUJ9dgsTbpc/BK2
         OX1aczZjoec3UTa45O9Thwhb77smrpbVzADC07ujJOjwZm5CLB3ijhBZSUJgK/H8hOnT
         N3Syk8on5Mtuq9L3YXAd2h4pXmO0mE1vMi21sZVVyMXJns6qzsPXGHf/SFiwuoZ8LqET
         SSvCGTcZmf/WyL7X5HX4armMjRtQolicg0Vc4/dIdGVFFrCsttSdEdEfn7IUrP2VThlA
         wFaw==
X-Gm-Message-State: AFq9FYL/1kA39LlN3DFXshsGqDnYSVatdO3nHkFDxG4kdLNg6VNlDNa/
	cVbwNsoInLm3myRUKsAdycIU6zwIc3By66ggAJCLimDNVPL0dWho3+6QPO+A5vPQTsd4VJzYJe5
	LpXn8r3xpEy2bs/a38vvotEz3NGtOzLLEJEIr9Hti
X-Gm-Gg: AYBFou2TWUPRquPIujCQ78cH4rgKipkiLNjXD6R6yngq7HU7Y3TkFxk++dHGuBQ2lGL
	+xDw1Ceo+ZTBs/JeG6nEf241jpQRoMQucvpUjnHJzZNfQQNe96Es48t2jg2++pTRAD00crxKmkH
	k2/c5BgGsRJCwbPlBFIJtB5wrvyhcdDrilCJH7AlRleVNchLPCb+taGTCNKuDrOx6ifYUb0RL5P
	pg75dE347MlfahPQFE9oXnAnCQQ++sLkjOO1OFvjVISQBmjhNwOLzTggGpN50tXLdc0Ql7A35qE
	n654fn40i6nNo7k8LJdjoecm5HAM8pAD0tbrQzGt3Epfewr4GZ6Km3w98lUkXC0LGXu//lD4C/8
	ItvQabRwIXX9RJ+UX5jX7ndSi2LdoBb0nC7caHqLXl4goE7g4/A94sO88dcjuvnRh+yJtQfUm
X-Received: by 2002:a05:6402:44c8:b0:6b1:e87d:5b60 with SMTP id
 4fb4d7f45d1cf-6b4d4686cc2mr1282015a12.15.1793364615011; Fri, 30 Oct 2026
 05:50:15 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:13 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:35 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-2-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-2-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:13 -0500
X-Gm-Features: AclHuK_ccuMwNBYpkeGQ2k0lCJMfFrklKr-EXRp2KSyxEboedXPDgWFhQQBhEOc
Message-ID: <CAFLszTg9hB_YiBAjFKv-oKw-c3iNB+sANwqf-eZhot=JrQBupw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] pylibfdt: Fix FdtSw.as_fdt() when buffer is
 nearly full
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> pylibfdt: Fix FdtSw.as_fdt() when buffer is nearly full
>
> `FdtSw.as_fdt()` calls `fdt_finish()` on a copy of `self._fdt` without
> using `self.check_space()`. Because `fdt_finish()` appends the 4-byte
> `FDT_END` token, `as_fdt()` raises `FdtException(FDT_ERR_NOSPACE)` if
> fewer than 4 bytes of free space remain in `self._fdt` after the final
> `end_node()`.
>
> Wrap `fdt_finish()` in a `while self.check_space(fdt_finish(fdtsw)):`
> loop so `FdtSw.as_fdt()` automatically resizes the buffer when needed,
> matching the rest of `FdtSw`'s methods.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  pylibfdt/libfdt.i       | 3 ++-
>  tests/pylibfdt_tests.py | 8 ++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
