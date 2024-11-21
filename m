Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD31BF58
	for <devicetree-compiler@vger.kernel.org>; Thu, 21 Nov 2024 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732220916; cv=none; b=Ycfl1jMxnA8+HV+YMADn8DDtQ3teulCavju84Y3S4ox2u/2jCps6/KuqLv3bwXYrYH4chK5q8R2xNkQGLRN6DYb3i/wZmKD4sThdIqWY5/ufdwieNrkN68UmpDL0XxrwmqtM6oyNrRWhJefaal2eORmXZdoUmSbdBMf8gIetcpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732220916; c=relaxed/simple;
	bh=DyGcludxf7ueBE0kbHEmbBau3/DbPGEAJJSFYe5ZkEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obAq8WQMGcVK5q8GdJli9FvTQ7BoGtSJhxTxnJO8rFWXUtG1Pvs2Nod9jif9Ok2Tvxm6wIPtQpZM7D+0chryct3uHXP5217YVPM3RXKNEstmK5fhJf4Mm0WceH0jic0aJBV8Eaix/GOdOQa5Zi2k//p+h0U9Ls8V/GAGMIFLsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uSfjx67i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uSfjx67i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468F6C4CECD
	for <devicetree-compiler@vger.kernel.org>; Thu, 21 Nov 2024 20:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732220916;
	bh=DyGcludxf7ueBE0kbHEmbBau3/DbPGEAJJSFYe5ZkEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uSfjx67iwUJBRFBS8jCs7CVR4RI9T0Ry7rp3EvRuZBs9A3fZC3KLUCxe8ySjgiWUm
	 udqz04RIlgcnMWA4s/8PjK895zH1dlLKGXwmzNp8Sm9TAVw6dej0VW5QqNxY6eA2H7
	 RN87x1JHK5Vqz2Kjdgv+hu4biWu0wvKEIFUUTfJrU3rP+jwn1q+o6T+beFlFnjUDfD
	 pddNwo2sEaeyxZ+X4F9k0zaWfZ3Q0xzCUXxw36OUi/SvACLIWFODRrXvue0y11Bbt2
	 IzNjjO+lPkuCbujunb7J2RY9kSeBBYEfKK23Xx3Z3BOllWyghE8sp7y4Li9RQh9Vxa
	 CPbnk0UljVQoA==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3884cd186aso1404327276.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 21 Nov 2024 12:28:36 -0800 (PST)
X-Gm-Message-State: AOJu0Yzf84whl+JP1FnK/OokF3RANT5yGkLya4Dh/z06wvOOmi8O1kEZ
	ezlCAZYoL2T5YyAK+CNTUyABDLxnvpDdNqJbiYfG3FTxKa/9+iUe4EBDG+WX/J/X2EkdKdD6RdI
	6GIDbKCjOdmoXcJQkFv/JkVn9HQ==
X-Google-Smtp-Source: AGHT+IHfDr0tTZk0PhA0FJ3cMduW4U8z8pysIEWqE4chEo7dYSBwtvYbJ1XTe6bkmMO/zUMQMR2mrLGjPLT/vKi0fuU=
X-Received: by 2002:a05:6902:2b8a:b0:e38:9735:61b4 with SMTP id
 3f1490d57ef6-e38f8b31c9bmr313052276.12.1732220915405; Thu, 21 Nov 2024
 12:28:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABwgSGZfb_t0W5DgUJoFNQkbVbupdHmkL4ad-NiY2Y4JtkB08w@mail.gmail.com>
In-Reply-To: <CABwgSGZfb_t0W5DgUJoFNQkbVbupdHmkL4ad-NiY2Y4JtkB08w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Nov 2024 14:28:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJzxzMk9YZ5ubimdSpGJb_4D5=FgQXZ==gyb+Bai4rEJQ@mail.gmail.com>
Message-ID: <CAL_JsqJzxzMk9YZ5ubimdSpGJb_4D5=FgQXZ==gyb+Bai4rEJQ@mail.gmail.com>
Subject: Re: ModuleNotFoundError: No module named 'libfdt' after Installing
To: AbdelRahman Yossef <abdelrahmanyossef12@gmail.com>
Cc: devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 4:31=E2=80=AFPM AbdelRahman Yossef
<abdelrahmanyossef12@gmail.com> wrote:
>
> Hi,
>
> After installing the dependencies (swig and python3-dev), I still get
> ModuleNotFoundError: No module named 'libfdt'.
>
> I install using pip (pip install
> git+git://git.kernel.org/pub/scm/utils/dtc/dtc.git@main) and I got
> that It's "Successfully installed"

In general, I don't think pip works with pylibfdt in dtc repo. I gave
up trying to get something that worked with pip. And make. And meson.
So I packaged pylibfdt for pip/pypi here:

https://github.com/devicetree-org/pylibfdt/

Rob
