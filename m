Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DCE3D572
	for <devicetree-compiler@vger.kernel.org>; Tue,  9 Jan 2024 20:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/ntopWF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9411DC433C7
	for <devicetree-compiler@vger.kernel.org>; Tue,  9 Jan 2024 20:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704831846;
	bh=00q+0SSlWNN1HK/RDLW2Z9a76z8v2S5u0YIa0sLTUjM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N/ntopWF8+FAW2LwewZG+llmcselybkzIgyOwrTQWsaoD/pGzLxhHbHnBM1A09Qmb
	 J80oj5WmcovXqzx+grBjuhUdrYvQizRgKYLVeuesaW5WPvfRkuP0oTgh4sFjGxaiTR
	 HVCgqJ2q7rKBF5RsK4KRCNUVwEjtaXFZ5NYBHqj5k6t+BsYp8dwzgG+qWjlM8hjD74
	 9MY8VfnYRU6Ucz8EJO0Xay4nePih6B4Wuwjx7HD32LjK3XcHFc38vtFv0wePsTLnm0
	 0P6vfX8xRXkAAZHup37o2EplxL781dj+AexbwmYYubXQzQykZeBOINcxTcu41nFila
	 waKppATLMy9/w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cd2f472665so37139881fa.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 09 Jan 2024 12:24:06 -0800 (PST)
X-Gm-Message-State: AOJu0YzA170QmsZlDAX1H1OjJ57rXDv91x9gB5dPFRUPBcFbsEsG6yOL
	N5b+YHUZc7+cozPWfPOJB1JWNCO1MxlWL0kVlQ==
X-Google-Smtp-Source: AGHT+IF2EFd04SuYtr+5MvwFuBeGiTeNWGMQhKEWJL84I6ZXZBP72U0ePbNxIV759HLVSWlRoQDta1UR6TDLtCPKXMs=
X-Received: by 2002:a2e:a613:0:b0:2cd:2838:78a with SMTP id
 v19-20020a2ea613000000b002cd2838078amr2316140ljp.88.1704831844763; Tue, 09
 Jan 2024 12:24:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARV8Bo-tBXMdOu55Wg9uZRXvNiRdkDJ4LH8PwVMnMp4cA@mail.gmail.com>
In-Reply-To: <CAK7LNARV8Bo-tBXMdOu55Wg9uZRXvNiRdkDJ4LH8PwVMnMp4cA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Jan 2024 14:23:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLEpNhRNZvH0=+Mo6eWDhG37GHTozQEe2Zqv4Bjk_SkLg@mail.gmail.com>
Message-ID: <CAL_JsqLEpNhRNZvH0=+Mo6eWDhG37GHTozQEe2Zqv4Bjk_SkLg@mail.gmail.com>
Subject: Re: Record of original components for fdtoverlay
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 12:20=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Hi.
>
> Sorry for a stupid question.
>
>
> When you get a DTB by using fdtoverlay, there is no way to
> know how it was produced later. Correct?
>
> For instance, this case:
>
>  $ fdtoverlay --input base.dtb ovl.dtbo --output foo.dtb
>
> Once you get foo.dtb, you will never know whether it was
> assembled from base.dtb + ovl.dtbo, or it was directly
> generated from a single source, foo.dts.

That is correct.

If the results are the same, why do you care?

> In my understanding, there is no room in DTB to record
> such metadata, and it is impossible to disassemble foo.dtb
> into the original components, base.dtb and ovl.dtbo.
>
> Please let me confirm that I did not miss anything.

The kernel has the ability to un-apply overlays. I think that only
depends on having the original overlay and not any state from having
applied the overlay. fdtoverlay could be extended to do something
similar if you wanted to get base.dtb from foo.dtb and ovl.dtbo. If
you can't un-apply the overlay, then it would be a hint that it wasn't
created by applying the overlay.

Rob
