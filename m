Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F58249E5
	for <devicetree-compiler@vger.kernel.org>; Tue, 23 Sep 2025 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758623829; cv=none; b=V/GzDiY98oVszkE81M48iiexNcdvYziWTkY4mCRPZMG0ErZ4wlSDus/ojFfFEDONsOGLXJTjqrvVHIq0qriveGb8t1nIOJOAiDnAvxL0JKzUgnEgFVSyARqC6WaS5/3gG0AHSiJBP4HPTUPveW3wGTSWguJQNXYEyUjzX8aAwXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758623829; c=relaxed/simple;
	bh=eSsu031VVGwPsLfNPlmNXIySQd3w7MuDIZQkN2cj8lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DzhlYAb2pBvFkFSyLypnHYTyXNtjqD42LHsKlOqA3wN86vFIa32/LR5pFvDSd5I4x8S9pYn3SnMmJb7XSuUL/sg2W2Zh5PCyiq4opiTpajeU0pgc6U7wZojnj980l+P5CaZvDBMpJqzCbt2NY4+0eidaAMHU1B6cKFv9l8rGQ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-84ac859df55so236059585a.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 23 Sep 2025 03:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758623826; x=1759228626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vy5YqCkw1QkAzxS1ADiBH2hURCJ0LLs39K3eOvsbTdU=;
        b=NxiY4UzXP2511jrcaogOeL1XmVvIuV/Im5ONsc5WovQQsI6mVUuYDD0U1fhTOdlFMu
         U9mBlaIrIDZjGRQ2x1T9cMffo4imAoKN5E2OOF/EbZxLhz4f/fFXTLtNtTCxONrXeYgk
         TN4kVbQPI82F1uYByzHEOLv3eDjoW7AEpJh8cDTi9zFWXfDZ6AuvMklMXjelomkKe4BN
         CgPh7QVTF6JT9NpWYDfnROLVe0C3ltsX4Mw/WtQo0YtvrWaWc/l0C0JnFKRf3MRp+aEm
         xXN8VjDvChJrIplsFZoMkeOZnwfb9OQtFd5MfQikqIHgAVbg8yQi9mBGiLuIjUa69Ugz
         qUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvFc//qbaZzyKJDAXAk/Du7eMBLxNCtF0bVRRskaIXNSNDzecHb5he3uYjYmHGOWOLbZchttXMlV1dIiO0I1AGm9s/@vger.kernel.org
X-Gm-Message-State: AOJu0YwLWumzbpxdZd60oUShxX2w4hhUTfu/X5d/CArTr288/e4NsYGB
	XzGpYw4RnOFLhdZSDd17XdrMYz/ie3aAgPitGSk0vMdRmgIcd4XHwAMaoDEblI0T
X-Gm-Gg: ASbGnct3oCbxDzI/tJ2dqA9Fx3prbUEP4FNbcD9n87yu577+ILiBtqOB71mIcDnfFd6
	Kk1cGplvme7HQOssOEPp145kz4mel2SLvyg/zUER+rvwVK7hC5I/rILfTEjfEB3fnUC+fOsVJLP
	Obh+s1hOVwc0t2d88sLuTz2YY1YHpV2e5dyyYq3wkclvxp+S27MkjGQRygRK2CGESLv2kOaL0eK
	eCHjYHd0nK4cNENetsnwhhlPHmR1fPtKwLSSjRumE+T2/1SSK4iIF9skIOlgT7O6Aw/qBIhXKzt
	S0LRxodmZIHeef8vM3OWpD8L45skn3ObX9ZIuZtmwOBRx898kRFbh4HDaFECIOHCliIiq9YqmHm
	RMLYjPhWnZsy9thS36aV+Tyo9NpJSYFbHfosP+a+34SPxJI/DnITdjkuY4u5L
X-Google-Smtp-Source: AGHT+IHcu/M1PxJFDfhPb7Q3hW5urZqtTt3FQDakzuO7E5JsynPUOUesWGWkzW5Ajst8OlRwt3Afig==
X-Received: by 2002:a05:620a:3714:b0:84c:9e0b:e598 with SMTP id af79cd13be357-851708f8ea7mr220950985a.54.1758623825825;
        Tue, 23 Sep 2025 03:37:05 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84aa50416e8sm327264485a.17.2025.09.23.03.37.05
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 03:37:05 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-78defc1a2afso67419536d6.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 23 Sep 2025 03:37:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhWZzJ9BEn3P6TUkEZorRXs1SDSVfOGugnGsJazdtNE0l9i3iKtP96/lXjJQszxeq02B0ZwdbFI2nPSvBiXmrFVeDZ@vger.kernel.org
X-Received: by 2002:a05:6122:2516:b0:539:44bc:78f1 with SMTP id
 71dfb90a1353d-54bcb09972fmr689351e0c.5.1758623379127; Tue, 23 Sep 2025
 03:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aL-2fmYsbexEtpNp@zatzit> <20250909114126.219c57b8@bootlin.com>
 <aMD_qYx4ZEASD9A1@zatzit> <20250911104828.48ef2c0e@bootlin.com>
 <aMebXe-yJy34kST8@zatzit> <20250916084631.77127e29@bootlin.com>
 <aMt5kEI_WRDOf-Hw@zatzit> <20250918094409.0d5f92ec@bootlin.com>
 <aMzhgDYOuG4qNcc0@zatzit> <dcbeaff2-0147-4a27-bb46-e247e42810d7@beagleboard.org>
 <aNJVqSpdAJzGliNx@zatzit> <20250923114849.2385736d@bootlin.com>
In-Reply-To: <20250923114849.2385736d@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Sep 2025 12:29:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmDwedyPnBERs-tSYEG15nMUuh9u1Q+W_FdquHpUC0-A@mail.gmail.com>
X-Gm-Features: AS18NWAbRnZBKwbUs1mL6i0jpGKTu9bSTEeBLQtsdhJWW-X3mhl84YZ9AdBBLbQ
Message-ID: <CAMuHMdWmDwedyPnBERs-tSYEG15nMUuh9u1Q+W_FdquHpUC0-A@mail.gmail.com>
Subject: Re: Device tree representation of (hotplug) connectors: discussion at ELCE
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Ayush Singh <ayush@beagleboard.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Andrew Davis <afd@ti.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, 
	Jason Kridner <jkridner@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree-compiler@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Tue, 23 Sept 2025 at 11:49, Herve Codina <herve.codina@bootlin.com> wrot=
e:
> On Tue, 23 Sep 2025 18:09:13 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
> > Ah, right.  To be clear: we absolutely don't want multiple addons
> > altering the same nodes.  But I think we could do that in ways other
> > than putting everything under a connector.  This is exactly why I
> > think we should think this through as an end-to-end problem, rather
> > trying to do it as a tweak to the existing (crap) overlay system.
> >
> > So, if we're thinking of this as an entirely new way of updating the
> > base dt - not "an overlay" - we can decide on the rules to ensure that
> > addition and removal is sane.  Two obvious ones I think we should
> > definitely have are:
> >
> > a) Addons can only add completely new nodes, never modify existing
> >    ones.  This means that whatever addons are present at runtime,
> >    every node has a single well defined owner (either base board or
> >    addon).
>
> In this rule I suppose that "never modify existing ones" should be unders=
tood
> as "never modify, add or remove properties in existing ones". Because, of=
 course
> adding a full node in a existing one is allowed (rule b).

What if the add-on board contains a provider for the base board.
E.g. the connector has a clock input, fed by an optional clock generator
on the add-on board.  Hooking that into the system requires modifying
a clocks property in the base board, cfr. [1].
Or is there some other solution?

I was also wondering about endpoints, as they have two sides: one on
the base board, and one on the add-on board. But it seems that typically
both ends are added by the extension, so these fall under rule b.

Thanks!

[1] https://elixir.bootlin.com/linux/v6.16/source/arch/arm64/boot/dts/renes=
as/white-hawk-ard-audio-da7212.dtso#L165

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
