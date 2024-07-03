Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDDD1849FF;
	Wed,  3 Jul 2024 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720026407; cv=none; b=jdk20kNrZG1OGsWipTXmR38bZKeS61V/RMW9Jtv3vg6Ggcs8G4srB3KYa2hJLxcNdr0WFsnB8C2Pd5Qc+3BKv68H9NzFPvjxF+DBpIOZumvBzgY8awB4v6gTWNbs48OTPYn0RJlAvkID9DVm+TVgJeFn2h180j7wF/eI/JYdQ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720026407; c=relaxed/simple;
	bh=ONL5j3JoEl6RzlzdKX0SzNktxbiFGSIIyhgQiTiZqos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrU4AYrCqkksOgOUzXl8O9xMpPb03owzXJf2Chixx2E7LMd1qOfZXuKdiB0x30I86eQgEq48ZoGLuaqrHXd84zqrZrRNbHsasa1fMmKy3DZBi8C2a35dZNE8Kqpe1XMsUpOh4dPLQlwItvOstauHGR/y1GZQ+6dQpLksRvV79LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSZ2sJpL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSZ2sJpL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47595C4AF0C;
	Wed,  3 Jul 2024 17:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720026407;
	bh=ONL5j3JoEl6RzlzdKX0SzNktxbiFGSIIyhgQiTiZqos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KSZ2sJpLUWAGW2IqYss8pgreeDap3K2gHHd9uZFcOnXMU2yqfMfsxs8jNqDFgqUPP
	 L1xA6Wn4g0A8ZJt/vg7a4yQj2hESSMdyqLA8YB3X8jLijKYKeq4NrhBl58Lu6eRzeR
	 BnVS5P/JU1r8CY6pYhfQlrQaRPbQ10AhdJB38zP2SzzipnuPmIBfI0/zGyHHIZht5X
	 VZ2WOugOhdr+opm0uWSEu+oFcfbmxBFtsMpe3spYXo493EYRu9f3DNL7RuY4JMrICE
	 UFtRTLMZsygaxPSYRcT7IKckogZPf9SMMXvUPVa9Spc2GysMAuzXTBpKCA2hqTtldy
	 YsIrPU+3QNgPA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52e8037f8a5so5675739e87.1;
        Wed, 03 Jul 2024 10:06:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMBw1BSTeLk4KNp8IuUq1VKdVF0w+doqIOCgGX3hee/znkBETKCe+K/JzCzJdksR7hBNkVDah9ddpSYuGSWSJ/yRb+0H6JVut6Vdw5Gnr1T3+JlS7XlFNa6XPTPYOgEvw48SyIZAgC7oj6/xnPRuM=
X-Gm-Message-State: AOJu0Yy7iE9BUUYeT59oN/qy4QfZTlnG4imqK+x73Xus/3GyCABhY6We
	fSGtzVSvnVReB//FBw9toncIEZ88HgjwdwyYhUp5pvCh6iXCA4rdSnl0r+ktOnm9n1nqotF/pKx
	kcW35H2NndonuV6MPf7688Ehe4Q==
X-Google-Smtp-Source: AGHT+IH1fv3bWoCslorZutqxVVL1O3S5aVZmqcEmlHWLxyiHvtPK1a2NmO3yu3oPWRo6b2zJ7j2MhMl2U+6ypMGVDrw=
X-Received: by 2002:a19:8c14:0:b0:52c:dd3d:85af with SMTP id
 2adb3069b0e04-52e82671e7bmr7045178e87.25.1720026405597; Wed, 03 Jul 2024
 10:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626075551.2493048-2-u.kleine-koenig@baylibre.com> <bxyscvary2ozzvdnszl3rtfqy3oo5bxnpn6avvaexhtnd47tck@qa44v5zxqhps>
In-Reply-To: <bxyscvary2ozzvdnszl3rtfqy3oo5bxnpn6avvaexhtnd47tck@qa44v5zxqhps>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Jul 2024 11:06:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKj4w92Ym7KTmQo3D+iNszB5u6-kceMCrNCztM0LJaQkA@mail.gmail.com>
Message-ID: <CAL_JsqKj4w92Ym7KTmQo3D+iNszB5u6-kceMCrNCztM0LJaQkA@mail.gmail.com>
Subject: Re: [PATCH] libfdt: overlay: Fix phandle overwrite check for new subtrees
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, devicetree-compiler@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 7:44=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello David,
>
> On Wed, Jun 26, 2024 at 09:55:52AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > If the overlay's target is only created in a previous fragment, it
> > doesn't exist in the unmodified base device tree. For the phandle
> > overwrite check this can be ignored because in this case the base tree
> > doesn't contain a phandle that could be overwritten.
> >
> > Adapt the corresponding check to not error out if that happens but just
> > continue with the next fragment.
> >
> > This is currently triggered by
> > arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso in the kernel
> > repository which creates /panel in its first fragment and modifies it i=
n
> > its second.
> >
> > Reported-by: Rob Herring <robh@kernel.org>
> > Link: https://lore.kernel.org/all/CAL_JsqL9MPycDjqQfPNAuGfC6EMrdzUivr+f=
uOS7YgU3biGd4A@mail.gmail.com/
> > Fixes: 1fad065080e6 ("libfdt: overlay: ensure that existing phandles ar=
e not overwritten")
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>
> I wonder about this patch's state. Does David wait for feedback by Rob
> as he reported the issue? Does Rob expect Geert to comment as
> salvator-panel-aa104xd12.dtso is in his maintainer area? Are the
> responsible people just busy; or is this fix already hidden in their
> backlog?

I think it's just waiting on David.

The patch looks good to me, but I haven't tested it nor am I that
familiar with this particular code.

Rob
