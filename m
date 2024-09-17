Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D99178368;
	Tue, 17 Sep 2024 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726597379; cv=none; b=QwN3hKR9hUtn8HsS7RbubNs8gSfurnw1xP8OD7KBQPIB1slMXfZOjd1M+T0v0gP5rJwzoOn5/iT58OK7gmh6yQJTZr9JPhjnbhm60TDeUAlxliIY28GFoOTv0GFk96aBzP9a/lLVxYCaWnaIW7oLPK+fKqweY1d1qoesf7v5B9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726597379; c=relaxed/simple;
	bh=CJggJ/xExh+ro16YkBC1OwtLZxmdrOCTp95FdMsRtJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YI1y8DgjJT+vMn2BWjvVkxZqqqc7qbt1uIs/rd6iRdUNUUycWWjK3XA6X7MzDItVS2GRPQZBpHl3dZaV3+hY7GSEmxwxDePUSouJUWOOd3TJ7mebagIN5YNzjXsFyIshGjaYkTgMgWTuvZUzYNXvz0vz5NIyRmYgTxH7fI60mY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkVmPz7y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkVmPz7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAD1C4CEC5;
	Tue, 17 Sep 2024 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726597379;
	bh=CJggJ/xExh+ro16YkBC1OwtLZxmdrOCTp95FdMsRtJQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VkVmPz7yMurLqYzaQAKug99xLOXd9BLUcjWbSCOulNtaUoJ3NY6nZyxWIFxnXrpcv
	 0OUMbCEYwkz8TD0oPR8Goyt5GrFbSIPlxq2zBUb3qCV3K4mGumCvaHG72B9GQ1s4Q+
	 mK0nw+kRO5avcNuabts5mQlTxO6E7iu/TdfpoBdDE34f/y6ttJi5ZeWu3I70KKafrE
	 Ef7TBG24JGjzQiq4RHlepOyXn5xC74MyumD1VVcEePoT0svvlXJuve3QkE96zWwuML
	 67wlpg+MVYHqfkZ3EZx9knIuLmRAE9Ubf2RrIicGeGCib+NJZQMKe2Yve/YsSD4Q93
	 b75knHb2hZGqg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so5300121e87.3;
        Tue, 17 Sep 2024 11:22:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXHievz8COuPaATQNQbVD/kXGtofh+s23+/TOVH4kCAc/sOYUZ2RrTqQFyw1jG6u3FsUT8i1X3mp/X@vger.kernel.org
X-Gm-Message-State: AOJu0YwrU+8K4rC2ZLCPIKnfFpcJCNK9IgUszhuRuNS6zcNfCUAJd/6K
	L9gOg+1NaR3EjlkUtwHz/Bp0SzCslY/Qwu3w5Um88nXHeKuAI0XI0LKGE49Y4R+WVefqWPhtXuR
	5Z8W7FuWCTNn++vPlb+KQmw8uCg==
X-Google-Smtp-Source: AGHT+IENroxnqPV8maiNFl9zeSN9wW/fx/jKvtPeE8FVetStuO4gyf9feUFt4HENpEuYBwmLvKCq5LojYv6kUhwIczc=
X-Received: by 2002:a05:6512:23a8:b0:536:53f7:26f9 with SMTP id
 2adb3069b0e04-5367feb9ba7mr9635427e87.3.1726597377667; Tue, 17 Sep 2024
 11:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZsBvsq5pVv9xEPmp@zatzit> <CAL_Jsq+P6j70L=Sr=a5cBrGEMswZN0fYdaeOeDxGFG-VJgWNbg@mail.gmail.com>
 <ZujKoLT9VBHATtyP@zatzit.fritz.box>
In-Reply-To: <ZujKoLT9VBHATtyP@zatzit.fritz.box>
From: Rob Herring <robh@kernel.org>
Date: Tue, 17 Sep 2024 13:22:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ2dcng7xZoua-iAGi2FtPhddxgr9TJ5JdfC_wticW3cQ@mail.gmail.com>
Message-ID: <CAL_JsqJ2dcng7xZoua-iAGi2FtPhddxgr9TJ5JdfC_wticW3cQ@mail.gmail.com>
Subject: Re: Device Tree Compiler v1.7.1
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 8:24=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Mon, Sep 16, 2024 at 02:45:23PM -0500, Rob Herring wrote:
> > On Sat, Aug 17, 2024 at 4:39=E2=80=AFAM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > Rob Herring pointed out it's been a year and a half since the last dt=
c
> > > release.  There haven't actually been any headline changes since then=
,
> > > but there has been a steady stream of small updates.  So, I've rolled
> > > up a new release.
> > >
> > > As usual, the git tree can be had from:
> > >         git://git.kernel.org/pub/scm/utils/dtc/dtc.git
> > > and tarballs can be had from:
> > >         https://mirrors.edge.kernel.org/pub/software/utils/dtc/
> >
> > The tarballs are there, but it doesn't look like you pushed the tag
> > to git repo.
>
> Oops, sorry.  FIxed now.

Partially. The tag is there, but main/master don't include the tagged commi=
t:

99031e3a4a6e (tag: v1.7.1) Bump version to v1.7.1
3d5e376925fd (HEAD -> master, origin/master, origin/main, origin/HEAD)
setup: Move setting of srcdir down to the bottom
e277553b9880 setup: Collect top-level code together

Rob
