Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B01CEAB4
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Dec 2024 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377834; cv=none; b=KJk4Pw0hJJbvbn6vznMIIf/4qHSWmBK1dnJvhGt8SRItB5kQY/+crILyV9a9XC5ZBxBwq+siKUGDWrnZJaM2ywTHXRHCeqpG4585WP5e9lui9MTa4eo9lWssuk9uyaZ3RBTfd1nS17+GY7MVbfKCuHNGKXLEHqWDZqlU9jWJtUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377834; c=relaxed/simple;
	bh=9MhURhvMRmwmplgLgqCRwskQZnJbiHe4rAUwS1C0cWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXrX6kS3znU0Z5ZVERMtN29eGd0kRfqBVJfNRcQ8EfKXcz5kSB9P4tCaDdAIevp5WTRbXTxZA/7FpCRjcaee0IiuId4VCqk23nk1xsAJPFom5l1ls5lFzes5+WBxHNGe2SMTG2Z0X1ZHu7N43Ebbp4x0chpPpcHO4nk4CvukcPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1V8eQOh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1V8eQOh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875DDC4CEDD
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Dec 2024 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734377833;
	bh=9MhURhvMRmwmplgLgqCRwskQZnJbiHe4rAUwS1C0cWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p1V8eQOhC/G4kIeG5KFbFMXGCZn8TjN1YjnkceqaHjexoI5XPIj6sg1hA+vwHZADO
	 LTFtmvs90y+VESabUNTlNaR6D6TzPJlrdG1HE6AgfZflxdpQS7pZtTqe1PVe7Qzkmf
	 Ki++a2gs+gOYQlmcc3Nt/NWICkn//FQbdIWumQrYwaqD4nYCHE7FJEZF9I+dQu8FyK
	 ykx4BrsgonkTlMnvCeWDjOo1xCO2BaIBBQ1IS3lQ4l+Nj3wI1iqw0ZQ+aeIPDrhHUE
	 fd0OhOZHvK3XhA2/hDtk5HXFKvglFE7d9s5dnl7XyfqsswGm/59rFRoj9i/fjNmgGw
	 418tR62jyM8EA==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e396c98af22so2999358276.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Dec 2024 11:37:13 -0800 (PST)
X-Gm-Message-State: AOJu0YwHRbfMUiRoSpgm0o46r6yxYKSn1ArUO+rRyQRrc5Dw7mLpKbF+
	YH5wY/ovKkbB8L/VRHbUeJbomeh/EyatQhRKamGvbgjcPSeBbcgxOHLBONTI4AXQ3ry8c/ODwxN
	L2gCW+Nooio39gCGf2ou3V10NJQ==
X-Google-Smtp-Source: AGHT+IF4zGtJWWort5+FCqdNbU+twXN1s06150ZAnTm1ucsaYDHZ8tT+bSLHWnZAn0Nk9z1M8pQuQ2R3GiypIOWwlbU=
X-Received: by 2002:a05:6902:230c:b0:e3c:8680:a07f with SMTP id
 3f1490d57ef6-e434c425b17mr9096343276.31.1734377832777; Mon, 16 Dec 2024
 11:37:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213141438.3616902-1-thierry.reding@gmail.com>
In-Reply-To: <20241213141438.3616902-1-thierry.reding@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Dec 2024 13:37:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLrttpfXyDBteq98NMp3WLbmoQwa6JaGkbX4hiT1y2k4A@mail.gmail.com>
Message-ID: <CAL_JsqLrttpfXyDBteq98NMp3WLbmoQwa6JaGkbX4hiT1y2k4A@mail.gmail.com>
Subject: Re: [PATCH] checks: Warn about missing #address-cells for interrupt parents
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, Brad Griffis <bgriffis@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 8:14=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> The device tree specification (v0.4) suggests that #address-cells is
> mandatory for interrupt parent nodes. If this property is missing, Linux
> will default to the value of 0.
>
> A number of device tree files rely on Linux' fallback and don't specify
> an explicit #address-cells as suggested by the specification. This can
> cause issues when these device trees are passed to software with a more
> pedantic interpretation of the DT spec.
>
> Add a warning when this case is detected so that device tree files can
> be fixed.
>
> Reported-by: Brad Griffis <bgriffis@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Applying this to Linux' copy reports on the order of 1300 issues that
> originate from 29 .dtsi files. If this proposal is acceptable/useful, I
> volunteer to patch those up so we don't get spammed by them.

I could have sworn I did a check for this, but it seems not.

> ---
>  checks.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
