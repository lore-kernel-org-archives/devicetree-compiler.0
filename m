Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237310;
	b=g2kQtEM4ZviNZ/2X4tXTZDMFEApL4C5mQbw0N7yoNxUfkYfRrSvlRLRj7dzXTEH+NSb1
	 IT7dqScWwrBck/l9yd1mF+vIIavDW9vmidT9BBSkjYpl4HPw6AAZTQx5nHkZFd3spo0sQ
	 BhRQc3/JAjInKkCfluJ4WHSPmEqP95BGEq06X4owbInvbm0O4tQOVOpKpxSCD7T+WyzTR
	 fl2bD7BM4iM0feLX0rIZI+p34tqiZxYkuXbGtS6VkP+7F1qJlvG5UAd1NjMBoYp7m/hAo
	 4+Uxwn9tQjBviS/JpsJvntJ6TF7QTYXtSHzSV4rdTFx66sup/y5wirFGClfjAvdRqWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yF54AFtL3Gkh2hkM8V3bg5e5Kl7mMseeJ1YhC8Kt30U=;
	b=z5BhHCwrkZnMGcTuUv6WvKhQY7x9UEwWD/xi5fFzjVYjVo0CkMY4npTn365OwuJNIkND
	 +3IJEczlFeM2wof40XC9HInnKntTPojOTdq0ygpcr0HsrQ61QWmOi/cLBn3L5ZRoI2nKY
	 GePVlEcYKCdFyLNhg+Oz9DDZdch4GuHGordXFcZcGc6/4MNoTmQQ6lz/78cmOVTeG2ryo
	 H1YTVMvXyKGpAScB5vN11b0BoqHDAspzs7NyXpCvyxq2yb8Uw1snL/NEQbo0L8LWjBKCZ
	 6ChZ1umrJKsofAgmOJytgCj7LS0/ETp69sV62+W37dT+StW8+XDOAmtdx9uLcIa88tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FLtbhkCl;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90BE606A31E
	for <Devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 01:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FLtbhkCl
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so2877550a12.3
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 18:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793237308; x=1793842108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yF54AFtL3Gkh2hkM8V3bg5e5Kl7mMseeJ1YhC8Kt30U=;
        b=FLtbhkCl/T9uskZbozG8+JOV8cPqlt7sqX4jvzfXyzNqs75VJBgIaTfy+vZ48v6Nep
         7jetwMapu17boSfSpregOzQpEztnCs8GCN1Paq/4v94bDEodGXSjKvV66tutnTpZmV43
         sx9ECGWm4JLV5gnx2VKbeNcdYlU3aH5DbQ4y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237308; x=1793842108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yF54AFtL3Gkh2hkM8V3bg5e5Kl7mMseeJ1YhC8Kt30U=;
        b=Rx65Wjb3HJ+vvYy1Cntu/8CwpXYUo+Js5Xdx9wTffq4RbZdlnf97xnBF5BLHv/Jh71
         59Gtl0n87MjSpRfY3+euhE+S0+08Ij2ejRVvoOWNKg3Lt/0eLCZ3PC18KXKlmoPXK5UN
         +Z/98tEINCi2Dop70HqiMYO+f4S60XXuKZsbvXaNJHJIKF0rT/JX8ljjYFYOFGBvfY7S
         ef1E1xgXU/Wqx64h8nhlIjbZ4UEY4vfsQUWVMrRNK36XO9edlUIW0PCJ3c5NuoK996FW
         YMPiVj0WISyUg2X8b1MV2SQQae8qwRgxZJSJ+tuslz0jnipOS12GN8aBKsl7uUkB/3w6
         SCHQ==
X-Gm-Message-State: AFq9FYJ2s0j6Xbits3i/TODln/Ab9EGDP1bjf7tuBAzUP+dBlFSQRqJb
	pHr9+YNSPWDVRk9wgw2xW9u5GC3hRVBfu3n6pgq0Zty3TILRjwOAZS45aKJTIY6OrPqO+9tRa5V
	SzfinGGqJ
X-Gm-Gg: AYBFou1KxQChy4DI9/ceMCblhybs4nxV62FWAH1HHjFFQW4TjlimftHL28gG5UHKDfl
	Mv/8fRwQtAKiGpESMFOJUrPFio1XEUj0vBLtuyxIMzz8ATFASUDjy0xvlFA5GMmumFVVQzAknqm
	KO7ZzAoj7aoUTFO6WG4V2bMwLGke4aODqRagN2QEBM2f2/xZ57Yh/C7ieXezm1A0VxX4V02jXjL
	hfpp1RJZDUoBGHfCNOlSiFmtDaJgjmZ7LpCGMBXB52/7CJOtTf3BFx/j1FVhLVLGxVaovQANF3d
	xBWP5V8IakBh2zKjMSByiyIIQtbhAy3Y7GNQVhIIg4vIJXIV3/CirxI6fNDq/4pNtwusX37Zebf
	bDeiPkWkUk0UNqkYZyxfa9IK8i5Mh1PbLVnXvbhwkHQZGIwgThtUADtuEy+LKk/wyGZ2hFhM2CS
	BN94uPA05ZEXymw0ySYlmctMX9dMq1+PRjmoq504/NJzvfFs1dGBR+YoXKqaEgEPZKrZDzvzSps
	yxAbkXr4LMnw+ey52RyB83NU2C+VvDsP75M9eErzTVDZNEB1od9dh/flhNA9a3K4RmTICj2HNsp
	PKSwMxwU1wH6gNcncywvvq3DvfhWc2l6AzRTJVoOemvy8ZMJVfTYgPT25dZNKtXTyVfj
X-Received: by 2002:a17:907:72c7:b0:c46:b9b0:8e8f with SMTP id a640c23a62f3a-c49bdf74858mr349041666b.41.1793237308337;
        Wed, 28 Oct 2026 18:28:28 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm2131617a12.29.2026.10.28.18.28.26
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 18:28:27 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b042c0759so825569f8f.2
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 18:28:26 -0700 (PDT)
X-Received: by 2002:a05:6000:2c08:b0:48d:bafc:a409 with SMTP id
 ffacd0b85a97d-48e5d2f07femr9584368f8f.26.1793237306160; Wed, 28 Oct 2026
 18:28:26 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-3-dianders@chromium.org> <at7cBFtlAQOFJ8jG@gractus.seuss>
 <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com> <auKak7QsI_6uoCep@gractus.seuss>
In-Reply-To: <auKak7QsI_6uoCep@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 18:28:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFvoQbqoghJf14z8ykqu3NNxgLXT2Oi1Rh8d_E2Zq-gA@mail.gmail.com>
X-Gm-Features: AclHuK9jXgiNO3ZlmyYc7y4t6Q91zU5w_w9WcC5ZTNrECUt3_gy7-ALkR1xmn7k
Message-ID: <CAD=FV=VFvoQbqoghJf14z8ykqu3NNxgLXT2Oi1Rh8d_E2Zq-gA@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, Oct 28, 2026 at 6:11=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > Yeah, I debated this a bit originally, and I agree it's a bit confusing=
.
> > How about this: I'll keep the option, but force it to be just a filenam=
e,
> > not a full path. At least to me that makes it less confusing. Hopefully
> > that's OK?
>
> Hm, the way the path is encoded isn't really what I dislike about it.
> Something about the "base-dtb" name suggests an existing base tree,
> rather than an output desination to me (particularly since in future
> you might want an existing base tree to do recursive factoring).  What
> I'd suggest is dropping the short option and renaming the long option
> to include "output".

OK. When you have a chance, take another quick look in v2 and I'm happy
to change this option however you want in v3.


> > > > +            all_have_prop_fixups =3D all(
> > > > +                bool(d.sym_props[path][prop_name][1]) for d in dtb=
s
> > > > +            )
> > >
> > > I'm not sure why you care that all the copies of the property have
> > > fixups.  AFAICT all you care about is that the set of fixups is
> > > identical for all of them, empty or not.
> >
> > Sigh, this is where me not understanding 100% of the details of overlay=
s
> > bites me. Some background. I remember there being some talk a little wh=
ile
> > ago of (perhaps) shipping device trees compiled with '-L'. That would
> > allow the OS to know for sure which properties represented phandles and
> > that could help the OS figure out device dependencies.
>
> [Not really relevant to this series, but that doesn't sound like a
>  great idea to me]
>
> > I wanted to make
> > sure that running fdtfactor wouldn't break this and the OS would still
> > have all the information it needed even after breaking things up into
> > overlays and re-applying.
> >
> > In order to test this, I wanted to make sure we tested re-combining the
> > base devicetrees and overlays and we could confirm that everything was
> > there. In order to make all that work, my agent added a bunch of extra
> > '/fragment@0/__overlay__/__local_fixups__'. ...but it turns out that wa=
s
> > a workaround for the fact that fdt_overlay_apply() didn't preserve
> > __local_fixups__ in the base. :(
>
> Ah, right.  Again, I'm not convinced this is a great idea, but if we
> wanted it the right way to do it is to have fdt_overlay_apply()
> (optionally) regenerate __local_fixups__.  It's not really merely
> "preserving", since applying the overlay might require that some
> external fixups be converted to local fixups.

FWIW, in the v2 series this is what I've done. There are 3 patches
in the series that just fix this.

NOTE: personally, I don't _actually_ have a need to run fdtfactor
without the `-S` option. It just seemed more correct to me to
be able to keep __local_fixups__ correct after merging. It also
tends to make verification of things easier because they you can
nicely "reverse" phandles for comparison...
