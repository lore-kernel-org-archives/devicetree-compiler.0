Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B0C757FB;
	Fri, 31 May 2024 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717167619; cv=none; b=i9mtkdjkjuXiYGaUC73A/1Bm6TaBYHdrOSNwyKS0lQTRYkZC8Lf+oLPlxz+ij4U/0tyt966ulDROonpCeFtAHY542+sFgXBHSgTO22otZmEmuwFctIcCDx74doMd8Au8BKBnA8tC18yc958/mgEUyOCGFuF7cfh5R0RlXh4qCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717167619; c=relaxed/simple;
	bh=jDEr5raCrfCR6eBAeO+8MRA+Yj8CCxClZotDTv2HO+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aByY1d+2gsnOyznAuKOiLoL8q5cSbn3QYZboxrrk6QNYHf5ByvQ6dlMFkT01UNvtTkOTEROKWfZwH+s793upi5o9Azbl8Keabu2AjbLZ2YTFsoSd6XoPJUh8IRlV8pZLFmXVWEyB2KdEl3za0pi7LOixoGrJSSrApSD6OFkGK5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwLDlXCz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwLDlXCz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4418AC32781;
	Fri, 31 May 2024 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717167619;
	bh=jDEr5raCrfCR6eBAeO+8MRA+Yj8CCxClZotDTv2HO+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qwLDlXCzq0VroxTmML89xQirHX2T5pdZNmWt4IYAz7RvH2JWKafFfHVtCXhibKjvt
	 VgIMkCbFu8W5uZ6iJ1bEPdg/c0jl4usPRBCKrcFhtVDjji5WysFyjkIAEYVQca822V
	 HYNJa4FhL3Elaia6ILASbeEF9jSWAmUVleGiMe9cvefe3ST+4t/R/B87RHeAfyBzJT
	 RLa34XoGQ1wtIRJyOeOalZdZzA3gM0YGR7qdT9X/Uym95V7Q4gSnl/0N2+Le+lFC3b
	 mGLT4sIOYD4dh5oCOyRIoyc1G+XSdZdVsXGfvRN78eAcmAcrSMVmvwKgOA8vhU4Y/I
	 vi3AZZvqApPuQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b89fcdcc7so998846e87.3;
        Fri, 31 May 2024 08:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIEzDfPICFZwHhiWbCWWlVxQ6h/zqVGWTdqyI5s1XIGy8W3ssbqrsWM77JvECg/bvhGh4u4wFfDrHwAwTLam6xH8jJM1xB5nDMMVKBq3pQh/YIqN+Tn8XhY8+Js6fmnOPIsy65L9oP4v13n3h5Icc=
X-Gm-Message-State: AOJu0YyRDP3g5zGLVeAmNuc7ArZIFCZQ6OpsYTN05Gz5OoU68rrmEaBm
	RndYawGnMD0LxXnL77WX114kr9//1ZKgv0033UBEiEHwDBO0aZAJeVyGcvr79/LlOg1LvsjLblu
	P6Jb+t2FK3MDBE0LsIiSlJegO+A==
X-Google-Smtp-Source: AGHT+IHUqUmsUP918QpjqzH5npNhgysIiDyHyjn5YLpGuGEUV6JHiEnoTJtkajsrCBZvKF3jmQtoyLD5HqMWTa6R2xo=
X-Received: by 2002:ac2:47f6:0:b0:51d:8ff3:d156 with SMTP id
 2adb3069b0e04-52b89576bc1mr1292663e87.19.1717167617696; Fri, 31 May 2024
 08:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a770cb5acb708e6d65570a4037a376321c9e8bb0.1716977322.git.geert+renesas@glider.be>
 <CAL_JsqLL3g4+nfu2NmC0drR-m5u287EBvK9jbY43XC=bSSVSpQ@mail.gmail.com>
 <CAMuHMdWxxDu-V_drs+dMdycQHY_+v0sPH7bVO_2-ixGWQkdTjg@mail.gmail.com>
 <CAL_JsqL7Vc2T1-JMf7bFAedmz4NYTD3Efm0z_-xdd7JF+xKmQA@mail.gmail.com>
 <CAMuHMdV5q8cSz+SOry1ZJjMhTxhkb0ABNDFgCDySpKPijJjpcw@mail.gmail.com> <CAL_JsqJ0nX7EK05aC7z9i2FEB7jAf0XrPDyPY-NXr8rnEDgqZg@mail.gmail.com>
In-Reply-To: <CAL_JsqJ0nX7EK05aC7z9i2FEB7jAf0XrPDyPY-NXr8rnEDgqZg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 May 2024 10:00:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL9MPycDjqQfPNAuGfC6EMrdzUivr+fuOS7YgU3biGd4A@mail.gmail.com>
Message-ID: <CAL_JsqL9MPycDjqQfPNAuGfC6EMrdzUivr+fuOS7YgU3biGd4A@mail.gmail.com>
Subject: Re: [PATCH v2] fdtoverlay: Remove bogus type info from help text
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Uwe's Pengutronix email is bouncing, so switched to kernel.org acct.

+dtc list

On Fri, May 31, 2024 at 9:38=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, May 31, 2024 at 9:07=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> >
> > Hi Rob,
> >
> > On Fri, May 31, 2024 at 3:43=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > > On Thu, May 30, 2024 at 8:32=E2=80=AFAM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Thu, May 30, 2024 at 2:31=E2=80=AFPM Rob Herring <robh@kernel.or=
g> wrote:
> > > > > On Wed, May 29, 2024 at 5:11=E2=80=AFAM Geert Uytterhoeven
> > > > > <geert+renesas@glider.be> wrote:
> > > > > >
> > > > > > "fdtoverlay -h" shows a.o.:
> > > > > >
> > > > > >     <type>      s=3Dstring, i=3Dint, u=3Dunsigned, x=3Dhex
> > > > > >             Optional modifier prefix:
> > > > > >                     hh or b=3Dbyte, h=3D2 byte, l=3D4 byte (def=
ault)
> > > > > >
> > > > > > However, unlike fdtget and fdtput, fdtoverlay does not support =
the
> > > > > > "-t"/"--type" option.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > > Upstream dtc has Uwe's commit 2cdf93a6d402a161 ("fdtoverlay: Fi=
x usage
> > > > > > string to not mention "<type>"").
> > > > >
> > > > > So you want me to sync upstream? That's how upstream commits get =
into
> > > > > the kernel. I don't take patches (unless there's some urgent
> > > > > breakage).
> > > >
> > > > If that's the policy, then yes please ;-)
> > >
> > > With current dtc main branch, I get these errors:
> > >
> > > Failed to apply
> > > 'arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtbo':
> > > FDT_ERR_NOTFOUND
> >
> > Interesting...
> >
> > Do you know what's the problem?
>
> No. Since it is conveniently platforms you care about, I thought I'd
> leave it to you. ;)
>
> Well, it seems that if I use the upstream built dtc and fdtoverlay it
> works fine. Using the one in scripts/dtc/ doesn't. Looks like that
> issue is on me...

I figured out the difference. The dtc tree build of fdtoverlay is
picking up the libfdt installed on my system. The kernel tree build is
statically linked.

A bisect points to this commit:

commit 1fad065080e6cae0ec1a4ad6288733cd24c103f9
Author: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Date:   Sun Feb 25 18:54:23 2024 +0100

    libfdt: overlay: ensure that existing phandles are not overwritten

    A phandle in an overlay is not supposed to overwrite a phandle that
    already exists in the base dtb as this breaks references to the
    respective node in the base.

    So add another iteration over the fdto that checks for such overwrites
    and fixes the fdto phandle's value to match the fdt's.

    A test is added that checks that newly added phandles and existing
    phandles work as expected.

    Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
    Message-ID: <20240225175422.156393-2-u.kleine-koenig@pengutronix.de>
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

 libfdt/fdt_overlay.c              | 251 ++++++++++++++++++++++++++++++++++=
++++
 tests/overlay_base_phandle.dts    |  21 ++++
 tests/overlay_overlay_phandle.dts |  34 ++++++
 tests/run_tests.sh                |  28 +++++
 4 files changed, 334 insertions(+)
 create mode 100644 tests/overlay_base_phandle.dts
 create mode 100644 tests/overlay_overlay_phandle.dts

Rob
