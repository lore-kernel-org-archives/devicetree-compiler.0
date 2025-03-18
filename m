Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C28F20E01B
	for <devicetree-compiler@vger.kernel.org>; Tue, 18 Mar 2025 17:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742317337; cv=none; b=jG6fzxS+vHNngXLoPyd4Hj+7sBineUXYxD3hjueKOQUy71Qz4HBchKMrD9LQrl+8W4fgwjJTRu9XiJLjo/rq5tAJksLAxqU9TbFQmoCTnQWh2gsKrlroIEcnZ/NMUuM4XUTQMNlzh4m+IL3RQGQFQp6sM39P0s4qov8m93wyEnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742317337; c=relaxed/simple;
	bh=xJjv5XON6Vl4A5jT03SBtd9IIfRBVg5adwgUY+4junY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9iAvTrTqn/8VamIY1MVp3CvDtyTOr9XrSfL185VSXKKvFepRR9Rh0g+wzz1EWirUjHig2tgKCvLH/rO103HGWGcPTQ2mKwvHADx0KsUUA6Nn1WNYezUmgcy083pqH/CIVlTd/ct5RFI8/hY4KHvrcJ9folSyA3ZRTFQKpdFFnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsKVmucH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsKVmucH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A58CC4CEDD
	for <devicetree-compiler@vger.kernel.org>; Tue, 18 Mar 2025 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742317335;
	bh=xJjv5XON6Vl4A5jT03SBtd9IIfRBVg5adwgUY+4junY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EsKVmucHKePdSSd5lVfz+WZANs9kLvN8tcdDz+wIqHMlRI7zxte2N5SPQOtmkRy26
	 TG997rmzBEfKwtdywGhFziUVKsewXsUn0B7t9nELweAF2xwm4EKE4XxsqBvlRQh9YI
	 1tI5GMInep1yv4AO8PyGkpiYuljeGEMIVR5OuyQeXvp9QqGOl/Hfse1xfyVF3zmgdK
	 s5cyvaUcI6pIp9l5Ju+1Q7PNy8d3v4wmQYeltYmweHvCytfWxfZLQV9eUaunestL+9
	 /3ro1KBl066QIyWMcBYnFK9h1GiOvkra36CqheUMvyCEX9dVsV24ENRj45raDpBlYU
	 T+l6w5lwYDhiA==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso4434820f8f.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 18 Mar 2025 10:02:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YwxMIH2k/xZQBjvbfnepjRlpHWQH9FPysMGMQi0hlh4v8t5v7lb
	DG450yFndzhY6EPY3Pb2hDI0xWq5xLLBrW1V13MUfTy9sR5eH6UgejZLd+1ipT5KR3f+54Z+RAf
	ip1/g8SBjumMPB8ZazpO49NS2Tw==
X-Google-Smtp-Source: AGHT+IFl1Nq3C8XLBtvvcAPn83pw9xlWpJD0HERnDpvgQ0GCska9nceUPJRYcq9puRwZsqD7YO2X9dtxGUxdZmjM/ZU=
X-Received: by 2002:a5d:6dad:0:b0:391:952:c74a with SMTP id
 ffacd0b85a97d-3996bb44ca3mr3897878f8f.8.1742317333916; Tue, 18 Mar 2025
 10:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317004056.14564-1-eschwartz@gentoo.org> <CAL_Jsq+nsJ1yU=o7ADCJ6U55xb_HVJaYReZHUSNgeWyXCH3mtg@mail.gmail.com>
 <767597b0-c812-4ddb-9caf-bd051ef202d0@gentoo.org>
In-Reply-To: <767597b0-c812-4ddb-9caf-bd051ef202d0@gentoo.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Mar 2025 12:02:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLdMRrtyWjL8-iyuYM9LfVc9RoA9VK=+3vpuEkez2q3kg@mail.gmail.com>
X-Gm-Features: AQ5f1Jo445IlsQ1IGtlHQCYnuouMqVf-buzA6HetXn9ABUUdAto2pWVWPse_X9M
Message-ID: <CAL_JsqLdMRrtyWjL8-iyuYM9LfVc9RoA9VK=+3vpuEkez2q3kg@mail.gmail.com>
Subject: Re: [PATCH] meson: port python bindings to build natively via meson
 and meson-python
To: Eli Schwartz <eschwartz@gentoo.org>
Cc: devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 9:37=E2=80=AFAM Eli Schwartz <eschwartz@gentoo.org>=
 wrote:
>
> On 3/18/25 10:15 AM, Rob Herring wrote:
> > On Sun, Mar 16, 2025 at 7:42=E2=80=AFPM Eli Schwartz <eschwartz@gentoo.=
org> wrote:
> >>
> >> We get full build parallelism and fewer confusing ancient distutils
> >> paths. The python wheels build fully standalone, including linking
> >> libfdt as a static library.
> >>
> >> For convenience, when running pip install a meson option is passed tha=
t g
> >> prevents building tools or installing headers/pkgconfig files.
> >> meson-python would otherwise include them in the wheel itself, in case
> >> they are needed, but this is essentially a bit useless so don't bother=
.
> >
> > This is great as building a sdist that can be uploaded to pypi works.
> > I've been maintaining a separate repo solely for that purpose.
>
>
> Interestingly, the one you uploaded to PyPI seems to be called something
> different from the name in setup.py and which I reused for pyproject.toml=
 :)

At the time I added it, there was a name collision with just "libfdt"
which was something else, so I went with "pylibfdt". Now I don't see
the libfdt one...

FWIW, this is used to build the pypi package:
https://github.com/devicetree-org/pylibfdt

> >> Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>
> >> ---
> >>  MANIFEST.in          | 12 ------
> >>  libfdt/meson.build   | 32 ++++++++-------
> >>  meson.build          |  3 +-
> >>  meson_options.txt    |  2 +
> >>  pylibfdt/meson.build | 28 ++++++++-----
> >>  pyproject.toml       | 25 ++++++++++++
> >>  setup.py             | 97 -------------------------------------------=
-
> >
> > Isn't removing this going to break make based builds as that calls
> > setup.py directly? Personally, I think that's fine because I think
> > python things should be built "the Python way", rather than trying to
> > wrap them in make or meson. David didn't agree though. I think the
> > only somewhat sane path is making the make support purely a wrapper to
> > call meson so we're not maintaining 2 parallel build systems.
>
>
> Ah yes, that's true.
>
> Meson *is* "the python way", for what it's worth, as it's a genuine

As a backend, yes it seems so, but I meant as a front-end where users
run pip (or historically setup.py) rather than running ninja to run
pip or setup.py. But looks like with this patch meson works as both
the front-end and back-end. All news to me really, as pretty much
nothing I've read on how to create and/or install python projects
mentions meson, but it's certainly a moving target with setup.py,
setup.cfg, pyproject.toml...

> python build system, no wrapper :) but I do think it's not worth
> supporting make as a route for the python bindings since Make can't
> actually build the python code at all. Also, if you're interested in
> python bindings you can afford to have python installed, and
> consequently, to invoke a build system (meson) written in python.

I don't think anyone is arguing that we need to keep the make build
because the host doesn't have python.

> I have no strong opinions about whether to maintain Makefile rules for
> building pure C code.
>
> I'm not really sure that people building python bindings will need a
> Make rule that just runs meson...

I agree, but not my call. If that is all make is, then it's not a big
deal to support. The problem is meson build is missing some features
that make build supports, and no one has cared enough to address that
so the make build can be dropped (to be just a wrapper of meson/ninja
commands).

Rob
