Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829818;
	b=LrbRfQb2GyPsiJpALIv9PsbRQARevHVm5dJ/E8DMRX5M10UzI55qBMvfDaMeaCo6JlTj
	 WaB/6SrwYMOPucIBzZjaVeIsNXTBempavtg46abUB0nUnJ79QujdDm+gIr/AnK7nj07bA
	 dHYV+rI30DfwlXdW4bGmodwirhucEXiXr/QMUGoREfJUl7BMT8D7CwLJJmlyIJZl6+QRS
	 4QR0nf5dh4B8mZM+c+kUHc0vUtw4AnXZJbIsJEK+gF/mxPtAsapXY1IzjGmq7/HjzfCGP
	 Ma+iTjvmCfABCC9pcASZNuGq2wtJ867JYkRrYf+TTdsqjdsCa+GLKwfVmJqrSSpY6oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
	b=Ss81/WHGnbi7sDcJFaXp5ZO6gEPNClHxP+57uy1yTePFkge47IFOTUiQGFy/2HAHHMXD
	 mejTXUnxlaxM/lcBMdQT/GHzi98WQHTaqgeE25MXlsXWmhpMUyuy6HxxZSnkXiEoYNrJA
	 uir4W+b3fqDDTixjJnNj/5BCtCYv1mSsrxquk5K+5ON0YvNPOv18+bzA4CTNYOAE75BRU
	 Mb+ekGLYbwJodZPD4XyYOxorXdJ6YmOQjMEZuEVJEofxcjILAEDI5N1gmpyf7rzjOY/iB
	 sgEugIQDNzTAI/Aru/xE37WTqch5V5I7EFaylt8w1lV9a8fLZkiLX7953WxoyrJoTrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="j9m/eYvc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830B9606A320
	for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 08:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 830B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j9m/eYvc
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so2350020a12.3
        for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 01:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829817; cv=none;
        d=google.com; s=arc-20260327;
        b=FF4L//vFfsNcjSRjKHiwk2Ie8+V3GhU6g5TDJpNX4dpUnb8ztadDijXmX0AbHhVkOf
         Ubtt4fY0ay2mxKFxvGg8HkzvFikSToYas0MQNzh2DIYwL3vRGyfUvx5sMgk0g6HiaF5K
         fW1V/PkEGWibi0X8lm+/j7OEC7REJvczSQS3tJhaSn3JAr3lpe56n0HjU9+aICzuZs/F
         6vkZJCpHg08/GLzFznSjnnL98OrjAsJlNtBr3K6Lwnn1h96QY/rs2ZZQIP8XIolD3btu
         yWEPSiJwfgyAByafKzup7r9fy5qn9NV0n+D96psnH3Sy5ta0hm7+tW5dSV2dxfongmQj
         JcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        fh=2S8heCVlBcN1L/Prklu4EHW4prEk3qO28OF9EGAWJfE=;
        b=Lp84cCDBFt0d112l2sP67Q63TqII5eHmi3Is/A8KSJznumeb0cJb6UOk0XjRSm008s
         ZqhhNkJx3RuQ8NMDSFF7VTqOwVkQPHEuV0haaMn6xCLes46sgH/UOb04nC36VnqUKEiA
         lCE+KvZWXop7/pYIBMD6Uk1Jn5kwAQJIZi6mcmsGvarl6Ls9CRStzuivuUcfvcp+yr5T
         dTQvWko61gk0anGIlxN2df7tsF7o582gSLQcQu0H755iwJz8LnBqeD9xFfoLh64md4Ay
         EPHsQLOpRDyEsiHu5Z+GcJM9MxR3yJOqmePxhsvVOY4WhR6fNA7AzfCFL86yzC3gfoo7
         uBbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829817; x=1793434617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=j9m/eYvcshaqWdxR1RRPRIr1ItYrA1TN4RRH0Tb/73JTmjyGNBA+MSabq/chQ3jRup
         FDO+bPo7UmRdMpdeNPL45rZL+MvdTWsOwUsOK1L3CWBxyBfvgHY1GMnC7+rnUD+uEALq
         OMq+yCYuInNRftXgM4Yo1DFyaRmVERqAUmQ+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829817; x=1793434617;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=MG22EMMlb6U3TamSpYSSHHKv3RZ8FaE7GN3+9Q6DX0AoDdePBXMyZMHtsl0N7MWLS1
         +Tz4qoPRJEwQxpRqZ/8OO2i8xPMazqSv1YupHDuCytAcHjb/aPCyanT4ykZNJUyCPPav
         ewizTLjzZIlccegCfTz33yEzOH8oRwIIHJKT82m3FTc+cGZf8WXuGuloS+eR0Bdw20W7
         y47XucDM4IlQYFudy2WgYClwv+iaQfNh2axcD90jzqlF6tYeEVhDQ2ipuLmvTQ0ZbvoQ
         j5oMigy0sOgDwotfBmHHp0jsqZ8NQwqyzuHrWDTH54Nmn/0BCpAzORLMVKt3RtoEcaca
         0tjw==
X-Gm-Message-State: AFq9FYIe1Z8fP7Wt09WraSPi+FMrLdz59cJE2iBOUAPRv1b2VtzMmqCY
	uDXRFn1HaFcxjGHBqJ6n8FF78UZynb31aMGwWRSiqcPxGgdC6TSObL3Jz8kPD8Fb8zOqeFjfr8n
	aYCfP2GB1v5gxkg/Hwp910mSPKsxhLF+ruTGkqX/3
X-Gm-Gg: AYBFou2StDbGaccVuVklRRm/cMKn8Sf0DImMi+cdtegz9cx90qlapWreKKYvv2A6p72
	nbioAPkzJaJ5KvfRhxmYu+q/h62vDwIJVJZsuVzhsPfQqbopo7TVO/P8neBd2mC7X1lJS5yyeuJ
	s0HssXO6FOC12w/XwSxjGUO7OxOv2qxk5jB/KQcwNRL8Hb+Cv6jRGab8bQz2enOHwWvrrn1ZwVC
	estjFlTD22+EumtQNraphLO5jZP9btd+3WPe0VJsnuXn7o3n4l+eWQ3RNzkFT6/9XN7PyYp6atN
	90zj3LQSBbQfM/ife0toa8v66ph07iggPwcyxwJdNXZTDEcYO3W/GyIW5p/3cvaPUKC+qF+PV6V
	T1yh+lv7XpH///KOZ0PBWq4a074gQVBqLZRs=
X-Received: by 2002:aa7:c9d4:0:b0:6b1:c355:c7c0 with SMTP id
 4fb4d7f45d1cf-6b442fde26emr1152906a12.26.1792829816963; Sat, 24 Oct 2026
 01:16:56 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:55 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:28 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:55 -0700
X-Gm-Features: AclHuK-X20URHOUw51jVSQxB-TyQaLgWVXdt5sH3O8YNafmV3nonazmm4bHkTWI
Message-ID: <CAFLszTjoZ=TZqW8BTFTot0ZRcv_--BYZgdOCUD-rv6nT479--Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Add fdtget.c and fdtput.c to sync script
>
> fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
> cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
> of update-dtc-source.sh, and were never added to the sync script.
>
> Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
> kept in sync with the rest of scripts/dtc/.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/update-dtc-source.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
