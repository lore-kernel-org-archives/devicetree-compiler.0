Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06A13D518
	for <devicetree-compiler@vger.kernel.org>; Wed, 18 Dec 2024 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734537039; cv=none; b=oZxIaXNZP8ELtp5l3uO6wXQYQpNrnjA5T7yZkelRahetwWqwix66Ud4yEyHv/ytsGkvE24gn/SgJcsqF4NmfO9zdWjkQWW5K1a8RF3SCJlcfXjRNugU/xDRMQEfNJ2ktO7/XlrbwIvn29M6Wr6hrONFUze87vN404SlI95yVjyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734537039; c=relaxed/simple;
	bh=QSs3YYSAUzjUzdzG7BBi+n9R9SLPjVOHVFN4d1+YPcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q61mGNNC1UUhQD4q8eJRREoWA5Lpfcpij5auBs7+imbPFkLahypHxbPf89xhYGn2yAactLqfTW2lVQNzp2q4fId+6+m/GObGXECll03roupmQgMDoUxZrfQYVr66V1jzuiokOguEGjBnwco1es0gtMWSeLQOTFpwb72MNb04Fto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXiAazmf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXiAazmf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E39C4CED4
	for <devicetree-compiler@vger.kernel.org>; Wed, 18 Dec 2024 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734537039;
	bh=QSs3YYSAUzjUzdzG7BBi+n9R9SLPjVOHVFN4d1+YPcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GXiAazmf9nLle4OxhiZ+D8BBxD79iMqq5/PAHM5ibxpzZxiTu9sL+OKOPxb7yk/Sc
	 nIgfotz1GVB2LOyyJR4CukDa6Tx4NoLDbd35z6BmXSCZMpMQbrjCl91uelUFZeZRQx
	 BgU7qR5uxSxsOCf0wSIM6lh1J/7gwe8h6+zM8iZ3GuEYQQOuU3/lj/H1V4CLsC9WAp
	 6ogh7QYy4ZJF+NQZV0icnBKkB7OzT8lTLaDPGSomprBtjwG/C25sjve+61E/kjkbpq
	 04KK7Thh+MLUG+yZJDt2fdO/eoX6Zf2xP1mR9mPK76g/kTHtvskT5vULK0owqCEz34
	 jwC/AcYxeMNig==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e3dace03a73so4360931276.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 18 Dec 2024 07:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVW0AfWwPuMS6gg7Ba25fqmPpVMd7cnU6NBZRG42e5SuDr3qW0wNXXkvAJwxmGmeYr3SAUTwnw/rpbj6tgTc3RXObYx@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZNWbDSubknzev+iaJtb810NXAhReujP3yNGDX+JazvOymMKx
	h6riHP3nWeMIlFKpfX3bdwrqcV8RG+FnkvVsuxM1QQ8ZUFEXDoZPlwcZW7E0uDJzfyJG9T5/sLT
	0WWhnHTnLRgQXhkzoTobbuqe+dw==
X-Google-Smtp-Source: AGHT+IEfdkNQJLLSpoC2axHfQU4IHr3l5YBD233869ntq5c43t7sxKp2vZgRsfLRn0uIv3UBqO6ThU5KAREFUgisHAE=
X-Received: by 2002:a05:6902:1185:b0:e4e:551e:fd0a with SMTP id
 3f1490d57ef6-e536225d123mr3116036276.44.1734537038431; Wed, 18 Dec 2024
 07:50:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213141438.3616902-1-thierry.reding@gmail.com> <59988586-f518-47ec-ae08-6b98b52b6f4c@nvidia.com>
In-Reply-To: <59988586-f518-47ec-ae08-6b98b52b6f4c@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Dec 2024 09:50:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKRVNVHAd=U2GXv3VaCGguZbk6ZgCY0h-eMo_pvJxU+kQ@mail.gmail.com>
Message-ID: <CAL_JsqKRVNVHAd=U2GXv3VaCGguZbk6ZgCY0h-eMo_pvJxU+kQ@mail.gmail.com>
Subject: Re: [PATCH] checks: Warn about missing #address-cells for interrupt parents
To: Brad Griffis <bgriffis@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 8:01=E2=80=AFPM Brad Griffis <bgriffis@nvidia.com> =
wrote:
>
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The device tree specification (v0.4) suggests that #address-cells is
> > mandatory for interrupt parent nodes. If this property is missing, Linu=
x
> > will default to the value of 0.
>
> Just to clarify, this relates to interrupt-map specifically.

Yes. That is the only case that really cares and needs it. We used to
warn on all interrupt-controller nodes if #address-cells was missing.
But that turns out to be way too many cases to fix, so we dropped that
part.

> In that
> scenario the device tree spec requires that both the child node and
> parent node specify #address-cells and #interrupt-cells. It further
> specifies if a unit address component is not needed then it must be
> explicitly defined as zero. In other words, this does not seem to be
> just a suggestion, but more of a firm requirement.

unit-address being 0 and #address-cells being 0 are 2 different things.

> > A number of device tree files rely on Linux' fallback and don't specify
> > an explicit #address-cells as suggested by the specification. This can
> > cause issues when these device trees are passed to software with a more
> > pedantic interpretation of the DT spec.
>
> The device tree spec also says that in the case where #address-cells is
> not specified that a value of 2 should be assumed. So in this context, I
> find the kernel's current practice of assuming #address-cells =3D <0> als=
o
> violates the spec.

Relying on defaults is not good practice and deprecated for longer
than we've had DT support on Arm. The default for the kernel on PPC is
1 which doesn't agree with dtc nor OpenFirmware. The kernel walking up
all parents to find #address-cells/#size-cells is not behavior defined
in any spec either.

6.13 now warns if parent nodes or defaults are used, but not in the
case of interrupt parsing.

> > Add a warning when this case is detected so that device tree files can
> > be fixed.
>
> I think a warning is reasonable, but perhaps we should consider making
> it an outright error. Though given the number of impacted device trees,
> perhaps that needs to be done in a couple of steps.

I'm more inclined to change the spec if needed. We only need
#address-cells if we have interrupt-map, so that's all we should
check.

If a given binding wants to be stricter, we can do that in its schema.

Rob
