Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1A21385
	for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jan 2024 01:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705456307; cv=none; b=S92aY6pDxq2TDsar3WRAIioPPm6DJ5dJGHYYANTmvMCXk3UqVLHz4LDw/Pg/r0J9325WIQCQgyYFm14nNBrt+Kj6uO3bOQqugAPvFzX6r8n/roCBJs6DCtot7Yp12HwGhK4QUSs6iCS0XM8H92jPvTY5SZ9XiVlczzYoNCmjaXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705456307; c=relaxed/simple;
	bh=/1X3l2iH7P0JbV1J1UR2TwKtKmqFPJwuq139Y30Dwbo=;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:
	 X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding; b=UIqJ18tZgklDB9Ti7dnMr1AJa7Imz1di84soUjYnjASJJTEvhXew7cPfoekUJb/b5b1tZrti5brpmBrmNw8R16EUwNUjogwLxzRevpRxt9dfFh/W0s0D1Hg8rdgVqEIqhbpCs/kFTbS+7FbcUZ+pHV+dnwBdQ95PUCZDFVqn8Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuQVjbrX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuQVjbrX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE91EC43390
	for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jan 2024 01:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705456305;
	bh=/1X3l2iH7P0JbV1J1UR2TwKtKmqFPJwuq139Y30Dwbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kuQVjbrXsmRGpbe/5y4Hu5yV9oQujs3fQgq5gU7GVHbBkZ1f0mnL8FiY4Hp2snxZv
	 FCqA78NBFtcr2TKyxVeHoz4VyBICNUga34oEhoE9iKpTJ7SDa4gIb2ESrRjFmGqBcj
	 4t8lGZxsVtK+LSOL1w2gSB0loI6/7VCAO144oRFvjtKXSueOUI2ItY6Xar6Bw3oy+C
	 7VEFJBtYJORDgQVQwEFjZPP6lIfWzDiNbzNcmjMnSilq8zGfByz7s95OTTY55Sw8VE
	 gXaPVsFvYgrNNWsg/RvcFLp55UQ8NmuaWPIhmqLycweL/mPyohejgaR8To+fWgDOqY
	 iVYy/mGBK/NUA==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-20400d5b54eso7407709fac.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 16 Jan 2024 17:51:45 -0800 (PST)
X-Gm-Message-State: AOJu0Yzrw5t/b5CCPync1EvVy1P52Ivmf7v/2C+oymAxyel3w9PHtVvx
	2m9kGIoYylTYPnXwhQpkCAqX11qNl6SAUbdIYK8=
X-Google-Smtp-Source: AGHT+IEEZUkowQFV24PFguLFzrGWTpOi+40OT6VOYbJMkNvSEM+1bnQOzBvHoN/CbYQVj6CCPTyTf2CGLaVD9QmN2LA=
X-Received: by 2002:a05:6871:798c:b0:1fb:1b2:fc93 with SMTP id
 pb12-20020a056871798c00b001fb01b2fc93mr11919816oac.22.1705456305173; Tue, 16
 Jan 2024 17:51:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARV8Bo-tBXMdOu55Wg9uZRXvNiRdkDJ4LH8PwVMnMp4cA@mail.gmail.com>
 <ZZ0lJMxKeD-TGyEr@zatzit>
In-Reply-To: <ZZ0lJMxKeD-TGyEr@zatzit>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 17 Jan 2024 10:51:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQUBuxYwPUQc4_o=+Jj3b+CTH+-KNRym-FgrM-fU5dyjw@mail.gmail.com>
Message-ID: <CAK7LNAQUBuxYwPUQc4_o=+Jj3b+CTH+-KNRym-FgrM-fU5dyjw@mail.gmail.com>
Subject: Re: Record of original components for fdtoverlay
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 2:48=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Tue, Jan 09, 2024 at 03:20:12PM +0900, Masahiro Yamada wrote:
> > Hi.
> >
> > Sorry for a stupid question.
> >
> >
> > When you get a DTB by using fdtoverlay, there is no way to
> > know how it was produced later. Correct?
>
> More or less, yes.  Depending on the exact situation there might be
> some clues that an overlay has been applied, but there's certainly no
> easy or reliable way to tell.
>
> > For instance, this case:
> >
> >  $ fdtoverlay --input base.dtb ovl.dtbo --output foo.dtb
> >
> > Once you get foo.dtb, you will never know whether it was
> > assembled from base.dtb + ovl.dtbo, or it was directly
> > generated from a single source, foo.dts.
>
> Correct.
>
> > In my understanding, there is no room in DTB to record
> > such metadata, and it is impossible to disassemble foo.dtb
> > into the original components, base.dtb and ovl.dtbo.
>
> Yes and no.  It would certainly be possible to add special property
> into the dtb to record a listing of the overlays applied.  However,
> that would only be accurate if the tools used to apply updated it
> correctly, and of course the current ones don't.
>
> Even with that, it wouldn't be possible to "unapply" overlays -
> overlays can overwrite data in the base tree so it's no longer
> available.  There's not really any natural way of making that possible
> within the dtb + overlay model.


Thanks.
The answers are what I expected.


We can assemble a DTB from a base and overlays,
but cannot do the opposite.

So, I was thinking that it would be sensible to
support installation of base and overlay files
instead of assembled ones.

https://lore.kernel.org/linux-kbuild/20240109120738.346061-1-masahiroy@kern=
el.org/T/#ma9017aeb05462996177434cd4a1daa1c2fbe09cd


There was no comment so far, though.












> > Please let me confirm that I did not miss anything.
> >
> >
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _othe=
r_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson



--=20
Best Regards
Masahiro Yamada
