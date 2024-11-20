Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391058493
	for <devicetree-compiler@vger.kernel.org>; Wed, 20 Nov 2024 01:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732066259; cv=none; b=FwgrIO9zG/ier+1zNiipH94mQ0QnXwRsQ6uNrft29CqrfACeb4nb6HHTsQRnO7iZhVCKKqav5HgJK2mMfozIz4idTQvgvNkLssZxrsz4C1q/M7ZJLV3TSlbGV/7/mSbUTnA5sPcZ3ZToQ3ePiqZ/NSQoAdC3oo1k9AJSrm01W2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732066259; c=relaxed/simple;
	bh=g54aupvkLjM6o6GjY/+cPXVjUtRqxWMoaZz4Ze6BkGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iu36Otx4xHPKDiCXiczhCxfAFQqWQxS0X24uFd06qAtOulul5jDHQLsIuhZYeDLeKPIqHQg2xT34DAl1FuaG7b2IFJQGiuw7V7IX+dY4FzbPX8cNkcMACIIvrnZScUgQn4mMBvxdTxOZLJKXXsgM4V1lHy1Pjm+eEZC6c88e08s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SR5RbiGd; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SR5RbiGd"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cfbeed072dso4473166a12.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 19 Nov 2024 17:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732066256; x=1732671056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igTPBvX6czY48AfgRXQrSA5d+2cs337OZdjgTKZHbss=;
        b=SR5RbiGdRG4Rpv7hx7KNWLTdh/YZ5wK+xNguNXs8h6nuYiKcZ/VCU15ubtSuLs4BC7
         eLJs512bcHw+QIR4CANngbjPAOJLe86vkO56d15DzjMMe/7hyGdPJGRtK6X9TEsEjJ3s
         HF7GH7az+j6sI2AWdmtAnr0APAv+ucq5lMQnA0KnPuw5WABwXNk6h9mtaQvKd9legAOB
         4/VSDXWUh1r3c9RMupSGSVWvugDPtZn1L7ZEYkkNj4XjxZSCgEfiku9rDjrTaiYtqdYC
         at7GJaP6lM2XcN+R6xy996D5QDUooRNLULsCyFeqDds2GAd6/BsyQO5bkAFU5pUQFOcl
         ocoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732066256; x=1732671056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igTPBvX6czY48AfgRXQrSA5d+2cs337OZdjgTKZHbss=;
        b=ex4rGYoaogPv5rsJ1AMkrHZ8aQy7e1hdNKfVe+JGajZoe/C4xqa5e8yD3Ahy8fMjMy
         2Xz1/eg1vvtBVV4++W3lOocrEnaXM5GCEAXNbYEek3R9/vxyeVVPCeZ/wOcGbWtok9I7
         fF/vzeCWCQBWwHtfe+Maqv24+Q07KYfhkGIj4UVJfXnZfFVTdMsM29uBzpwGlNA4DgQT
         zxeGM7e3Xh1BCCYEIuthlYgyYxGlpGeewwaH5qvqWJu1BBDINV6R+jZ/FozybV+C7Tjd
         3WR5gUdH/hnSnh6a2ltDW9Hv4El+WbqPr4Rjn8m3Zcrv6JCwYtzu+Rn5JV88Rx6ZgoU4
         LwWQ==
X-Gm-Message-State: AOJu0YxGUAhLZeKwlle5LVtm1RRELJAtBWxqqYLVOS4sLi9flMTCsY1y
	Ak13vxMnB1LMHZDZ9IRYGkr/n2yPQmhJZ7uzBPHmW8wmbaCJnbCofFomP9yGSLsAV+ET/q5/SmD
	gudINkDMhWF551nPbgMCUjyrN2kNlqQ==
X-Google-Smtp-Source: AGHT+IEaybWM/T/urVmFs+WahhBx+m4PEwjjQKNXl5jwOiRNCcMk0BQLPWft5XCoq/YQNrn4F0hev8l3l7BotJWxoBA=
X-Received: by 2002:a50:fc0e:0:b0:5cf:e218:a4b2 with SMTP id
 4fb4d7f45d1cf-5cff4cb51d1mr456207a12.27.1732066256416; Tue, 19 Nov 2024
 17:30:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABwgSGZfb_t0W5DgUJoFNQkbVbupdHmkL4ad-NiY2Y4JtkB08w@mail.gmail.com>
 <Zz0zKViRRXlRXytm@zatzit>
In-Reply-To: <Zz0zKViRRXlRXytm@zatzit>
From: AbdelRahman Yossef <abdelrahmanyossef12@gmail.com>
Date: Wed, 20 Nov 2024 03:30:45 +0200
Message-ID: <CABwgSGZF9Yw6KQ4yHCCfzMAO3TcjCndHUSh03aSQ9jE5Was69Q@mail.gmail.com>
Subject: Re: ModuleNotFoundError: No module named 'libfdt' after Installing
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm trying to run a python script in the linux kernel that uses libfdt.

I guess I'm just expecting to run successfully.

I mean I can't import in a simple python script, I just get this error.

Thanks,

On Wed, Nov 20, 2024 at 2:57=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Nov 20, 2024 at 12:31:09AM +0200, AbdelRahman Yossef wrote:
> > Hi,
> >
> > After installing the dependencies (swig and python3-dev), I still get
> > ModuleNotFoundError: No module named 'libfdt'.
>
> There's not much to go on here.  What are the steps you're taking, and
> what are the results you're expecting?
>
> >
> > I install using pip (pip install
> > git+git://git.kernel.org/pub/scm/utils/dtc/dtc.git@main) and I got
> > that It's "Successfully installed".
> >
> > Thanks,
> > Abdelrahman
> >
>
> --
> David Gibson (he or they)       | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you, not the other wa=
y
>                                 | around.
> http://www.ozlabs.org/~dgibson
