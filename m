Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AB622097
	for <devicetree-compiler@vger.kernel.org>; Thu, 31 Oct 2024 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730378190; cv=none; b=qFSvRHrfzrLVZjusJmFomcMose68+YAbhOZU/R8ZhtHaKSoIxlFR/j8mbdjb0wwa/lsjfCVaJ6pOOneyHV5LbVXIWIuNB35TMWfNoJBqUQ202swtxYidGCidImEGjjgzJyIgxyMoSX9I3uXSXtHPOVdXJHT3QvALPfYjyAWxqXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730378190; c=relaxed/simple;
	bh=pN4THYBz7uQ0QtFOh+VfhQ7YxybXfqz01rlAMR8YBDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iblnRXiYE1yeL1ZRdjf4h+bY2B014ICuS9wxLvM7cjM8euPc47bD5rqsDi/qbVyI66vUmi9lWP5jOCqhyUaENZtjUkmG9e8p0S0hrSw3S9nlU22we6wkmq2TDihsctp9pdNLYNZrvFs3nu7BBihNKAQPerYCY7rxuN/ecWEePbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3bKAFJk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3bKAFJk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B214DC4FF12
	for <devicetree-compiler@vger.kernel.org>; Thu, 31 Oct 2024 12:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730378189;
	bh=pN4THYBz7uQ0QtFOh+VfhQ7YxybXfqz01rlAMR8YBDc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b3bKAFJkKSgaCgXGRa/vKBjG3camJRhnvPF9y57mm5gm6RsMpdia94BoLgmZDl3gl
	 0GaMZW3x1ar8ceN0n4CWFmfBuewEVG6SPiwKq4tFLTnfroo3R2MByppASG8lP5GcdS
	 y+soWwSnNixgik6goEgcacCqqY5XBrFAropCw3KctX4fFd5MN/LT8GXjZeGVNHEcyG
	 sq1lNAvCkQUuKTB0KsKJ+uXZScjhVDnFI0KE3ooAMS5+T9JRu54ZQ1F9SV3DY3MB8w
	 70N6qXnlZ0eeEdVyglHLZLew9VsTgNE/Uln6npYzdvtRsZ0zV8VGGHDsgCSReQnZ7l
	 jZqP+woWUml4Q==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e690479cso956021e87.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 31 Oct 2024 05:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4Njn0YGhr7MzxRoXtrLbwZQTc/pau+SBdm+yOwURp7phAqGzRtmABI1sZZNy9JXShN/VCORYtkzMKQhUYn0xFW5RK@vger.kernel.org
X-Gm-Message-State: AOJu0YxDPXmgtx+2bcgwYmC/h20D2DtcETd68i3KCfEIWl0fzKNA5vBD
	0LgG9WipIv5CA+hHMY0EeEMUK6powNFb/yAA/cnwjfZhZThfX11NIQ3cwTaN7Jr9zuCkJqhAYY7
	C2w6wUfBWxbYjRgAl12X+/fuugw==
X-Google-Smtp-Source: AGHT+IGbQ2QlHmIxAipRELROCkoUWNGVlKx35u7hznfndRbc071Xg+IQrc4GAadbju0m88E+b4HFw1okR1LMSOUdBvQ=
X-Received: by 2002:a05:6512:318c:b0:539:918c:5124 with SMTP id
 2adb3069b0e04-53b348df188mr9574653e87.31.1730378188102; Thu, 31 Oct 2024
 05:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zxzh0ODFyZnav5JE@74d70d9af7e3> <fc3dcef2676252484cfa427ad0197cd9aa697420.camel@xry111.site>
 <ZyGHKJZe4q3ZP5oc@zatzit>
In-Reply-To: <ZyGHKJZe4q3ZP5oc@zatzit>
From: Rob Herring <robh@kernel.org>
Date: Thu, 31 Oct 2024 07:36:15 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJDYwX7jAShFboGv6Bw8zd_UeW+ArVwtv+U8oVJgCkRKg@mail.gmail.com>
Message-ID: <CAL_JsqJDYwX7jAShFboGv6Bw8zd_UeW+ArVwtv+U8oVJgCkRKg@mail.gmail.com>
Subject: Re: [PATCH] libfdt: Fix build with swig 4.3.0
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Xi Ruoyao <xry111@xry111.site>, Rudi Heitbaum <rudi@heitbaum.com>, u-boot@lists.denx.de, 
	devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 8:10=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Tue, Oct 29, 2024 at 08:52:52PM +0800, Xi Ruoyao wrote:
> > On Sat, 2024-10-26 at 12:34 +0000, Rudi Heitbaum wrote:
> > > Call SWIG_AppendOutput instead of SWIG_Python_AppendOutput so that
> > > is_void is handled within swig.
> > >
> > > Link: https://github.com/swig/swig/commit/cd39cf132c96a0887be07c826b8=
0804d7677a701
> > >
> > > Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> >
> > Dtc is a separate project at
> > https://git.kernel.org/pub/scm/utils/dtc/dtc.git, so the patch should b=
e
> > rebased against it and sent to devicetree-compiler@vger.kernel.org.
>
> Looks like someone independently fixed it upstream:
>     https://github.com/dgibson/dtc/pull/154
>
> I'm doing final tests now and expect to merge shortly.

Would be good to tag a release too, so that distros have something to
pick up when they update swig.

Rob
