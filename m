Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9DB3A8CB
	for <devicetree-compiler@vger.kernel.org>; Tue, 25 Jun 2024 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719346538; cv=none; b=hhImSXpYkIExYYU2QjOXQVF2tOvAp/qx5dfusRNhc2HbE4n3k8/D6zt3hmxxQwDntSbhfz9ldwQJLkD7AsnwctSc89rkZla2nXWonnQY14FMn43oGFRmpog4TYH4xBHDgePM05331oQqurjB+zU+9wlDJmRAomo3eNnZ8JdiGRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719346538; c=relaxed/simple;
	bh=EKQFD6OaMZ9whG551TCNxQQRTdSdHU0acOQvidQK2LA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdfN+qtp4nhjhKOH1EBKQYQb4m3EUPcT0Pgas+Nc8Dhm/uYk3biXUF2k6yhsQ+U4CP0ckIlvrg2fKQgXJzr0P/gV978aIKQn8nPIZqnoR9mZqMuBo+m3ekH78SrNZO62pqLMPYACAv91mXNPwOJt8oELTJWyuAhpNtF3ZnMPFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqVfeb7/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqVfeb7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD179C4AF0A
	for <devicetree-compiler@vger.kernel.org>; Tue, 25 Jun 2024 20:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719346537;
	bh=EKQFD6OaMZ9whG551TCNxQQRTdSdHU0acOQvidQK2LA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tqVfeb7/KvA8f3kciMBJgkvytF692WPU7kuspMFDwWO7IpLf0oMCDQuogye8GvpBb
	 RlhcqW4rXImSAgSftWkPAu/73TnSF8n296VWUXV2uKgoK/xABjLu7fVqF351SPNhmu
	 0vY33OFJmq2iw+flufxirPqq3lNGfIH46LqhQA/F1y+AdEuKZexWGO/4u4DIKQEPz6
	 5kO2Pqsit3FxKKMhZ0hLHJ/3/2S5tClml2BbOa7wHLMWZ9UClelBGP17dtEq6wVBe5
	 gqO/4wq7U9xRkCk52PoZSL35o7TqLg034W1Ij1wwntd+d9pupWf6MGFAi3D5Lolq7x
	 RMr+1z9REjtOQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdf579dd2so3433182e87.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 25 Jun 2024 13:15:37 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy6CmYzkcHff5Qwd/PGdroAcKAzN8wY13el5rXCd3N+AOPT5B/d
	ubHZ6mW5UPQit8m0LONGUaYWcki6PVTGHU1ZVVSavRGNog5EngaEl+O1MfKQ0DZLxLpC7NO7Jf4
	ODBtvg3jH53A4iMO/dSIXhUHoWA==
X-Google-Smtp-Source: AGHT+IF1uvgf/EoNvFDUG2E2p/sav/Zg5lEcxUQzltGYAr0bVQ7EHeIHluY2WIYrprJnMt23/veemvVAEJpt4zZEID0=
X-Received: by 2002:a05:6512:1248:b0:52c:e3ae:2737 with SMTP id
 2adb3069b0e04-52ce3ae27c9mr6228526e87.68.1719346536067; Tue, 25 Jun 2024
 13:15:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522-bugfix-relax-checks-for-overlays-v1-1-130c8b85c06b@wolfvision.net>
 <59a8ed6b-1410-40d1-8a32-69cc8741311a@wolfvision.net> <2910718.NACDBdzCOe@diego>
In-Reply-To: <2910718.NACDBdzCOe@diego>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 25 Jun 2024 14:15:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ3rc3+OiZ7o0JNxRGnCinDQJeau6oF0TBYx3ZNcnK6-A@mail.gmail.com>
Message-ID: <CAL_JsqJ3rc3+OiZ7o0JNxRGnCinDQJeau6oF0TBYx3ZNcnK6-A@mail.gmail.com>
Subject: Re: [PATCH] checks: relax graph checks for overlays
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: devicetree-compiler@vger.kernel.org, 
	Michael Riesch <michael.riesch@wolfvision.net>, David Gibson <david@gibson.dropbear.id.au>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 2:04=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Hey dt and dtc people :-) ,
>
> Am Dienstag, 4. Juni 2024, 16:48:46 CEST schrieb Michael Riesch:
> > This is a gentle ping with David and the DT maintainers in Cc: (I am no=
t
> > sure what the protocol is here, so I'll simply give this a try).
>
> it would be really great if someone could look at the patch and tell us
> if that is the right direction to go, or something else needs to be done
> instead.

It is similar to other fixes in this area, so I guess it is the right
direction. I don't really like disabling checks, but don't have a
better suggestion.

Not much else I can do here, it's up to David to pick this up.

Rob
