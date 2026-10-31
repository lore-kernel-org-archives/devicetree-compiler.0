Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416607;
	b=CoHnrcuxjQmYcqxXHm5WR+a4WoIaLlHtIufdMPlwZZE0FJ/cPva7d3YWthUlhs6Dsco/
	 4op1sqoMKFjyHpUL25ejmhcrcPErhOtX1O2ByQQcNnnsOxozKFFusncCnfeTH5l9yr7qf
	 MiYuj7j5P1SW7yG8h3AL5yW4Ys3xX+Nr1WfObtr9zHGcWLlrMHFgfm51xzvO9J1chqrox
	 hrxiDDIVFj5p5v7B9eF9ySw6cbiAg/uXCLdVYocl0DMyeNroZxoAEEWLM82u5k0D6O0wt
	 UrKOufF4/WJ9Cok+a79WVYknwoqUsPn4YAoDy60vrcF2ci5H5ofwLZaQI42CrbHy1fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
	b=bUioj+kQMAklQGi5pu/FAGHGfJ3+y/LtixPfvRxq8SuuI09+vFX/tVPQIChBCt7Oh3sA
	 F5Ao+4rI8oouT3MHyTOxNUwcUKsf1ILb6fkSBalCvvHvRleTlx99emyBfjZnPLIndgvJO
	 QqnplFnzlHZSPb2P9lVt8TYd8v2DfdS9GRlr/x6Ihs1OhH3/ypekT107BtqR87gjqsqmA
	 IvR8QCxnQ53tS4477U3r7l+Bit1CVyA+jN0gEPFoe3fCUqCWlx5A1xN0/NSjvORHQ8K7u
	 9XijBzOzwm+f/z6JjDVOXA4nRmRjOZDedT1wk+FMXYkK5zsr1b5uDMMIVmr9Q4L2ApQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gFRl3ld1;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B5606A31A
	for <Devicetree-compiler@vger.kernel.org>; Sat, 31 Oct 2026 03:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gFRl3ld1
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ac91f5aa89so12524401fa.1
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 20:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793416605; x=1794021405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=gFRl3ld14mC9YAr4nf1bkqSwrV7Fjh6S8CbuUlgRzKLM+2kf7OdNH4kFDcd01PIwLo
         ONvAL1gJKmxjGdL7Y4QTm1GQgJSgJ6WIeK3Dcowtujhvfe3ETCdKnkhs7gYLe+JS0Dwr
         JxSBbX04OMgpi4cauW3A/s6eMC7ZWhj7d2LqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416605; x=1794021405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=ZwHTo3A3v2aNpqdTdXa5z0qMaRXr9ViWOBnwUI3JXmg/gptYtGuuqI/UxJEL6ya4EV
         3HInuV79WPNrYCGsSWjxE8XWzQ8XhoLWVq/RW3fsY3eXXFSQGhjc5zxTtkjtVCa6dD2S
         NTSmHCrrZnDLjRj05LL0APy4sESjXma0WjKi2YvODd9vP+pRbs+cwIXzd2jofNU8gZfH
         Y48KsChf1/FSWNxEDaPUJyYHu7GFYExyeufpyf+G1lJDxyvr12GjWw+P5eRONyD4q4lR
         FOdDLdKsxoi5TrKNdsTznTWviClfTfq4N3QYkAFrNTdOxl4j9F/vronnjglb9VfruBNw
         vEQQ==
X-Gm-Message-State: AFq9FYLuhDhoLIayhuoOOdFhUtcazQPerBB9oYxtV8X3c/Nz+y2Ar4cT
	58GYZ9S2UPn6p6esmRjrfAjbVcdNL/DTE0UwO2sS2LsgZS1VPm+5sFSA5hEKOgL/oMJgiLir2+s
	nQ728MyeR
X-Gm-Gg: AYBFou1ckcNj1IBSJLruqU5SaIiRYaAO6UoIlDEt9pw2XxIHECLbMZCDQd9l4bAS4WQ
	GDNAEb1Kcl9ew82JgxoDXihtnREBeNW2mzl4BnGkJZLCaiA3/tzSP5qtwdsvVsbEPpaf8bXBJCw
	d8LB9gToE2U8yGCuBaFCfVfvgUrVuX21SgTwS2t4piOq1ph+RzVC24HW5V+7QSV06LX9cFIVLat
	DBLUs9NIN7ufk7ukkrVJA3d6qvrnMbRv3jTH1ox6uZNuE/ZNU32rq6Z7IX2VpqcQjcT/Ki3aXwz
	QalkAKOe/EKnlREct6UBSyP46SOU9dY+NcIe6CEwxWbKAgeMR+bgf2B+m8f56ZeMH4S8rXXv7j2
	/a+7hfff0sXosFcFrK323zUa3l/geDscGccz+Jamxp+BEeBotEsmVjstBeSTpHzkS4zQoLRk3IV
	E9mFuiaqQ3dudqf2/lsYza37WgVg0zfk1vPRtowqfVxfV79wcwsbS+BBEJEODOFt2ukAGVgrFjh
	TnwR1QJONDSBavavlEoP3FTpzJTsF26nkxozUK2gPtSEpCcOmS1ARKdxcKjkDUVJw+OVBDwrKNz
	ODujO9+FPmTS6NnYuSbqgqh9OFkKS5jD8mB4BcFEs+ZSnkROkeEsJ1l0u1z+2ZOwZl8ad031VUd
	qCGRJ+F6uM3/0xQ==
X-Received: by 2002:a05:651c:a20a:10b0:3ac:c7a4:4da with SMTP id 38308e7fff4ca-3acc7a4086emr308441fa.2.1793416592523;
        Fri, 30 Oct 2026 20:16:32 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbedf87dsm7280771fa.17.2026.10.30.20.16.32
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 20:16:32 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1155502e87.3
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 20:16:32 -0700 (PDT)
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id
 ffacd0b85a97d-48e6e4f561bmr9818154f8f.21.1793416220997; Fri, 30 Oct 2026
 20:10:20 -0700 (PDT)
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
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 20:10:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
X-Gm-Features: AclHuK-bghq4wzz1qNlwlR04GGQ-u_3zjoGTgsEW-iZ0A7dRvqdHdSoL4JcYqzo
Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
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

On Fri, Oct 30, 2026 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > The FIT_ITS path is a second way to build image.fit alongside
> > make_fit.py, and much of it repeats what make_fit.py already does: it
> > puts the root compatible from each DTB into the configuration and
> > compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> > /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> > hand-written .its file, and the .its files repeat the DTB lists from
> > the Makefiles.
> >
> > Have you thought about extending make_fit.py to take the per-board
> > metadata (e.g. from a small file next to the DTs, or via
> > FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> > in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> > logic, and trogdor would come almost for free.
>
> I certainly can do that if that's what people want. ...and, yes, I
> think it would simplify some stuff in this patch series. The
> question is: what does it look like? Is it a file that is a list
> of devicetrees along with descriptions? The list of devicetrees
> would be to limit which devicetrees are built into the FIT
> and then each would have a description. ...and yes, that would mean
> it would need to be updated in parallel with the Makefile, but I
> don't see a significantly better way to do it. Yeah, I guess that
> could work OK.
>
> If so, I think a bunch of the patches in this series will be
> dropped or look very different. I probably won't directly reply
> to your comments on patch 2, 4, 6, and 7 if we go this way.
>
> Should I give it a shot for v2?

FWIW, I did a quick prototype of this, and it is definitely a much
smaller / less invasive patch series. I've got
"sc7180-trogdor.fitconfig" and "lga.fitconfig" files. Because they are
easy to parse in python, they're in ".ini" format in my prototype. So
"lga.fitconfig" looks like this:

+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# Each configuration description encodes board and SoC matching metadata
+# for downstream packaging tools in the format:
+#   "<Model> (<key>=3D<value>,...)"
+# where <key> includes board_id, board_rev, soc_id, and soc_rev with
+# hexadecimal <value>s (in any key order).
+
+[lga-blazer.dtb]
+description =3D Blazer
(board_id=3D0x070406,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-frankel.dtb]
+description =3D Frankel
(board_id=3D0x070306,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-mustang.dtb]
+description =3D Mustang
(board_id=3D0x070506,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)


Happy to post a v2 RFC showing what that looks like if you want...
