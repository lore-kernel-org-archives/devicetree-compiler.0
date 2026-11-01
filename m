Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793569018;
	b=0kWNdrPN2hpBL+iFpa4Umq0r8l7KmVIZAiMJULeEjTQTE4z59r9J0qj+wVOKcR18t1y3
	 M6uUINaSdRXT3Axd+VUTdGHgX5cpngbpQGJ6il2ROV5YYT4jcUgCIVnyWdjgb7N/KrxNr
	 3tkiQgk0xp47VsbOt12ANfw/5rsMDt9xOUbWMOEivetAi0HV9sQBywLjHeuNt2j6aBPd7
	 xJGndEMC7v7EYWQA3JFzRLXQMeesLQ0yT0oDFXOm6rQRvuhOGkHZcEYvA49mxWYGofWLK
	 M9ab8qGdBDGDFTKCpPp3k5hVeGUXmQ1wL1kEsx1bEqh82I9hksC80Iz2Rn0KbsTLWaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793569018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
	b=yXE3uPQr8CiORVaLVBVbOgzmHYJoZdaiODJgEh6psBeyUOngHR1wj5ZqdsS3y6fR65jL
	 sRun2uLs9gb3af36v9r022LGHaUGaHGFZ3A+J35N+3RDLVLbLAYiWOgjs5xV5aQ+ZGCTD
	 89FCQ39zEhVY9uOU2TKuUihf4KWDcGY2Jlgyijwk0dablXq9rauNAAe+/itL+UGFenkOj
	 gu3xVPtDOUDwFZ8SlrhfM4GAQ/vKYmGZwweI60Gt47//9ZUf1H/T+qg2nljC8LW0IvNOL
	 Mgdoy/tDjBMs3rhMAjj8MJA7SR6viYVhQnEHIE0l74RPxfR4uUyDkqR55Fzm7nT2urg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SulfWCQN;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B3606A324
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 21:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B27B3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SulfWCQN
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so378406166b.3
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 13:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793569016; x=1794173816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=SulfWCQNNTiszIgjAZqgYhHW4vt+gK5bKxljTVk0/yEzJbo5XWe9gC7KZKxHJDtWYF
         m0Uzz/LZ+8CIJeDyKPF2vwMbvghBXPe4e4FC6Rr/agxHOr3b9DtMBcb/ot+JVxdJ22o9
         0VFLaTipOMZ76VoC6vbmPPLvbPecpiS5q6nbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793569016; x=1794173816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+s8DhqIO5ki4BPjT0hMEJ5bMlWwwKI5gQlDegeYWw4=;
        b=NU/F9NgzruP46sb683jxoOZHPZLxTA/PYhjMwuQLBmuCkMUloR1JzaxWOzbz7R+61J
         DZn047gpGtekssQS7VcjL+wGARhGBFKAnp/c41iHXaX9Q8EaJyyEQ7S2K893qSIG475r
         uSDJY7ntWqowSzwz4LtIB6H20nyfSQHsvWdCvCP3MbHxzmKJtTgJmwXU31W8CYmOcEtA
         ipLXMvS2M21Xw/vHs1Ag0NO3EUD/Bn6XnjiI3XIUZBpxdR33rIryJgrKrBchjU0dflCc
         fWf8qeWDj+/pZTxy/qlblhb+cTVgWfBgUbJ9PMogByGyr8dBPWqSTiv4RwgYJ7eAa7mz
         4JEw==
X-Gm-Message-State: AFq9FYL6kovI6iR4cSdf33UscQ3yE11GGx9Nby9/XwkF6tSywEpzmlPu
	kb6zdaDAfO22//hkkg+FljJXp+jN/wzyKfrLS03Pe4lLkwY6z+sCrtgu31IcLid6YafzsFKgffg
	T3uF4Zg==
X-Gm-Gg: AYBFou1NgVmN8rYhh700JfPZIK1fsaddLtYqC2mkdgkulEh6+C3GHCsKli8EMKJ3CWz
	V8IYj4mP/34aOADvkGEId3iNxUZpjEl5A5euPVhJniP3APehZn+HQMcwjwGSgLIYrwW//Z44S0k
	Ex2nSdlkr7mFJi1miAo5r84zD+UoXkrg9TLSuEZisyYtKm42aVvqKwx3hpsm+DHtmN5/dEihlT9
	TWFPjrQem6NSrMyD733pcxglGrfj3sIIPEL6Pa7sD0bSYM60qmpPk8OfbwBYWtMKK3ajfxDBLQz
	mLG9kEM4pxl7I8hlHZd0ppZWGV42MQjHkc9C7wU3ZqcNgT1ujF9MmZRMmQiq1dZ/1lUKv5bsuuF
	boDpIvU2jLZrq4JDlcCdhg09NlolQHfsxvSsfPEmS+PjQX/8zmP8DLGHud1sajtnX1arqCmJ4nO
	ENuTy97MPij+YVkE87oRHky9yb87hg1Oyr1WnqSr8wglB3gdgXzaeFedLXu0DzMD6iqfCdgNt6s
	/yC9kVfilEvxK8k4uYO94RNhcqceEMPyDJ1Lou0cXepgk5kTWWfl+n/4spKms2t328nnw00CH0W
	U8+IEthp8povyl8uqin+jyxPHFWZxvVLwPyuMOE2fqEh8AXr23CwhphweBsLk5wBQk8=
X-Received: by 2002:a17:907:e84a:b0:c49:901c:d9f with SMTP id a640c23a62f3a-c4ca7ad1408mr728350566b.49.1793569016176;
        Sun, 01 Nov 2026 13:36:56 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe96185sm312341066b.68.2026.11.01.13.36.54
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:36:55 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48bbb06e746so986394f8f.3
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 13:36:54 -0800 (PST)
X-Received: by 2002:a05:6000:41d9:b0:48e:646e:fb61 with SMTP id
 ffacd0b85a97d-48e6e305b9emr20425341f8f.34.1793569013833; Sun, 01 Nov 2026
 13:36:53 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
 <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com> <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
In-Reply-To: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:36:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
X-Gm-Features: AclHuK83p4a2Vbxf-q7Oyea7vApFkqc_qnBlge2O9IlGicuQhVVmFjLkwyEXh7A
Message-ID: <CAD=FV=WGtmBxQhc+ujm3qtVgftfKupqtp9sUpg_ubeQ=-_QG-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 1, 2026 at 11:34=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
>
> > Putting the metadata in the configuration's `description` property came
> > out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> > already uses configuration descriptions for similar board matching).
>
> Thanks for the background. The Xilinx case is a bit different, though:
> the same project writes the string (the binman .dts) and parses it
> (board.c), so it can change both sides together. Here the kernel would
> write the string and the Pixel bootloader and outside packaging tools
> would parse it. That makes it a cross-project ABI, and I'd rather that
> ABI were typed properties than an unwritten string format.

OK, fair enough.


> > The proposal I've tried to push a few times is that it's OK that
> > different loaders have different types of information available
> > to them, but people don't like that. They want a universal standard,
> > which nobody can come up with.
>
> I agree with you here. We don't need a universal set. I've sent a
> proposed spec change [1] which lets a configuration node hold one or
> more match sub-nodes. Each one names its scheme with a vendor-prefixed
> compatible string and carries the properties that scheme defines, for
> example:
>
>     conf-1 {
>         compatible =3D "google,lga-...";
>         ...
>         match-1 {
>             compatible =3D "google,board-id";
>             board-id =3D <...>;
>             board-rev =3D <...>;
>             soc-id =3D <...>;
>             soc-rev =3D <...>;
>         };
>     };
>
> Trogdor would use its own scheme (board name as a string, rev and SKU
> as u32),

Sure. For now I might just leave the "match-" out for Trogdor and
simply have the config file simply be a list of DTBs. Trogdor
currently boots OK with the "compatible" strings. Maybe Chen-Yu will
want to propose something for a newer Chromebook where he can take
full advantage of it. :-)


> and Michal's loader could do the same. Each loader still gets
> what it needs, the types are explicit, and nobody has to parse
> 'description'. Please can you take a look and comment there? If it
> works for you, you can point to it in v2.

That looks reasonable to me. Do I need to respond directly to the
github proposal, or is my response here OK?

Yeah, I can point to it in v2.


> > Should I give it a shot for v2?
>
> Yes please. The DTB list already reaches make_fit.py from the Makefile
> through the @file argument, so the new file only has to say which DTBs
> to include and what metadata each one gets.

FWIW, I still liked the idea of limiting the DTBs that were actually
compiled based on the list of DTBs included in the FIT image. My
current v2 draft still has that feature. It adds an argument to
make_fit.py where we can give it the "fitconfig" file and it can spit
out the list of dtbs. Then the kernel Makefiles use this to limit
things. If you don't like that idea, though, it wouldn't be the end of
the world to (slightly wastefully) compile a bunch of DTBs that we
don't need.


> We'll need a simple
> per-platform file next to the .dts files, passed with a new option
> through FIT_EXTRA_ARGS

At the moment my v2 draft doesn't just use the FIT_EXTRA_ARGS but uses
something like this (which will be documented).

FIT_CONFIG=3Dgoogle/lga.fitconfig

Hopefully that looks good.


> Running fdtfactor can then be another make_fit.py option, like --decompos=
e-dtbs
>
> [1] https://github.com/open-source-firmware/flat-image-tree/pull/66

I don't think it buys us anything to have make_fit call fdtfactor
directly, does it? The kernel build can just call it. That also makes
it easier for people to pass non-standard options into fdtfactor if
they want (via FDTFACTOR_ARGS)

-Doug
