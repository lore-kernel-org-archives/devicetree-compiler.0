Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794428120;
	b=sC/qDWus35/yHfYpqgqjnnPlFfalQMqyCZST7Vy8WZ1tN2uvMW5OqQWR2qOt5ASfQOtV
	 KpPtJ/1DU+tNRXRbE86TfvCbQzNRYSEtLdu4L2JWJJv7o7C7ot/EYgCryfkGYE3f1YusL
	 b8SBpCTy4oX6DADZCh1AJHiT2VK1VFIOqlU3nOmsEK7jyyvtruCnGLhePWLo3q98lYacq
	 CQ62zJCxsPoB0GSrv2IiIVWCsHqm0qjS/FNg8aL2/Kr2Lq7vX3atGY5F+mnotifdwBsfH
	 5LXD88mwtxFDbDPdoxdg8X+FVA4rPHh6oaakRkWoXOmHNxUH4Tqnc88Oh7XC57vhOKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
	b=pDKvPfAgygMfWY+1TkyD70n07k7Xoa+qRjvjGNeqOzR0//GUKaqDdl9ci4ASC1V+Dvnu
	 brplsHAOvmZYdQ1krArq3uwLBgzQH8CQmxM2vwhMs6H81wcQTbNYYWkLNiDbvtYHcdDxq
	 zzEwx3p0I7m5JyfhX7hzVPa6DtR/BuRZ8//C+D73BTXhf5QalZp85mKhCKKzOXHhZiAkk
	 /tPP3QIwGGBimcc8n/Dh5mEIKcdC5srAAMtFHX10qqTnATghKeK2KQZZPlUCE2lKjc1VX
	 69AoNv4OS4c/SUbfRT4iR1ClvfZqzc8fg078Vp+txHYSkgYMEpuLBrEH4aTcPC2TeNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iQqhYlpi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36A4606A326
	for <Devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 20:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iQqhYlpi
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cdc606b47so554499966b.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 12:15:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794428118; cv=none;
        d=google.com; s=arc-20260327;
        b=lQ6mRsZ44lqxzEmalxyC33uLOgH7UCPlUNNx9/XeZG4FypTkgJ1b/aue5Ww3JwtUix
         Jm2tMLWowXONvR0f2Q0xCKgbOFqYZFZqVC7BLZy2jtemyzRMvfRH/E9oyrF3JOVB3b3s
         7KckQ9Cp40Fq3fCYRo6s6q6lHe3PV8jYIBeiVkbM6W+6rYvxG6naA7b/XioH+dQnXuSh
         y55VwSMamOH7bunOEdbbm9FwcZsLvRMAZOhsbFT9DHdzwNg7NRJPf2rJuOU1sHF9tEju
         IxGmXapfkc/1vY5x12bmJWrl8YfQj1Buu2zhHlFX6NwbdtDI2sgmcsWcWD54EVGcg+0N
         etKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
        fh=SJvlPlGRj/qrxkDo5v6BkaihAba8A0tRJw20kPxum4A=;
        b=sUs0QT1pQjCPCFTufbuMXiouopsQ7tAB102OYTYDMHGHoBc6mAIWmASHwSca4X0ITy
         lEHU/3rdQCuyUWpU1atOB0WtACGx8NIh6CrQ3K7WywD4YDVx4Wb9E26eCY4L2hNW4pbm
         ri+qHe8x1EeeP2gWN7HrBHZUMYHoonesMo0ZGFybZbI4J3m+3BQAv8YxlhTaphahewKr
         kbF7KKPxziIfWkEU0XwzuInFgociLdsDra2y2F4JEvCuSiQB6ynaOY8ZBQkbJl2Dyf0H
         yjbyX6ViwHYmkN2250hhdR+TGJZ2SwNbNvnrr2rkje+WxudWPF3GJL6//FmZuy5oXCSg
         XxtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794428118; x=1795032918; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
        b=iQqhYlpiDzFnw6ASBEjBccgiaVPkZLP1FAaSdtAEVe5kR3uRwNmNV1nIdylZJvsqlT
         G01QdTGkMev8XoSkokAVURNlnVoMEgNCcVOBxXWGIgQnskIgoJAoZT7LNXfrWtBHsnfb
         pLw5xoVF25+2rFnQpLCVi7mdFLVBUyDPoA0zI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428118; x=1795032918;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XmHa+ZCqDWyS+5epYzHHmaI7iRC9gZC9M7WLrKl+6IQ=;
        b=cIi72j+X+wvrfSMc2GiYDkZ79DJlrpvqXvqjA5uKwzPSrtMcjatHBw0Tdd05sdYyQP
         Au1j3qQ0O7SMNZN78DuWhoA4S955JDYaqjApuvuwPCionhVIoCtb9SPth1vJG5pE1Z4K
         6fp0mY3yvs5q/WfN62F6JBpFK5TiVelwJF9VvqufZ5f6WupV7x/8Af0bbM49xOBFni14
         6CJgfa1dxAICIFXeWJQNOePFjSBaLLrnJkrQIWyDQ1gEfDEFGxAN3CAk4j/I3Dfhh1Rl
         4vXMtdfaW8Tyhns7ZNI8M5mM7foYW1o+oH1cX8i85nvF5rEbTd8LxN+BhTVEW2+xzsdS
         csXw==
X-Forwarded-Encrypted: i=1; AL+hErGu/Yp++C2XOqrN42koMnuZ5ZoeGWdKkKrJLjzMrXJAqiYS83seD4UnGhpg4XwtMg12k2i+LvqBSMjtQ6vX9fT6Y6wB@vger.kernel.org
X-Gm-Message-State: APuU4Z83AM5sAZFGqKCRCbCsTZ1hKqk+jPGFGVQOU2D0AyET8fefDPNO
	6tKZjsYVy4LFUp9JrgyoCVbZmY6DW1VRXoNZEa/d0XHt4OJ730eJ+EYt4Yx+b/jfEwRdzBzVz//
	ILJH9FKNPTiKkA9prQ0AIx06nfnP+gDOZFOF0Qsq1
X-Gm-Gg: AYBFou2dxrFFXOPSwol9NeoE3eEsfXIh7WXsIbv7N1NB5ESIBgMagH5l1SWuAAqEiLF
	9+xOHxHE5DEGDzZDaNQe+30tBR1Fx8dcrFXtLtZmLv7+mMRbGYVA8vVfvpwOY/n69uigv4pCut+
	qgFT+QbtvvkhSJVaCK0FaB6CMp6ndd19gGsg8wt4XYjWewJHGys34xK0u3Q3sS05hPywitEu2yY
	q89vX6NjK87PETQIo2Icsk1Zu1kkDBDxuqCGIxESSaIsgiCTagWBVqHwSnRMiQZsml76GuVOsLB
	/gu8qWwnYcij5rZYH6q4e/NiPcKamoSkz5t9B6VNb3xENoC5n557ooBfd4ZqogSxqU2MUTkRXuF
	l2nIfPe1R/dzmVE+Y8XMn3dG2aA34T/x213rjaZqZouEFN9qAV6MJueriDdr9znl0uBjj9q3SCa
	lI0lemxZblrA0GfB6CC4BrA9SBgruc+iUY2SX1HDKwCNhNbfSR
X-Received: by 2002:a17:907:9454:b0:c31:8cfe:9a25 with SMTP id
 a640c23a62f3a-c5066a82a5emr284901466b.9.1794428118138; Wed, 11 Nov 2026
 12:15:18 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com> <avPZeSgU8ABix34f@gractus.seuss>
In-Reply-To: <avPZeSgU8ABix34f@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Nov 2026 20:15:06 +0000
X-Gm-Features: AclHuK-kOq9TFXAlofL_aQgLmTwNgVeU9jF5L7666dJWRKAUQkobhjJQaDq30ws
Message-ID: <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Doug Anderson <dianders@chromium.org>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 10 Nov 2026 at 21:16, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Nov 06, 2026 at 06:43:18PM -0800, Doug Anderson wrote:
> > Hi Simon,
> >
> > On Wed, Nov 4, 2026 at 6:08 AM Simon Glass <sjg@chromium.org> wrote:
> > >
> > > Hi Doug,
> > >
> > > On Sun, Nov 1, 2026 at 4:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
> > > > representation of a devicetree node and its subtree:
> > >
> > > Please can you start with the motivation, i.e. why a live tree is
> > > needed and what will use it? The list below mostly repeats the
> > > docstrings.
> >
> > Makes sense. In my draft v4 I've updated the commit message to lead
> > with the motivation and condensed the summary so it doesn't repeat the
> > docstrings:
> >
> >     `pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flattened
> >     device tree blobs, where inserting or deleting nodes and properties
> >     shifts subsequent node offsets. That works well for in-place queries and
> >     localized edits, but makes multi-tree comparison, structural diffing,
> >     and bottom-up tree construction (as needed by the upcoming `fdtfactor`
> >     tool) awkward and error-prone.
> >
> >     Add `pylibfdt/devicetree.py` providing `DeviceTree`, an in-memory live
> >     tree representation where each node holds `props` (a dict mapping
> >     property name to `libfdt.Property`) and `children` (a dict mapping child
> >     node name to child `DeviceTree`), along with `unflatten()` and
> >     `flatten()` to convert between `FdtRo`/`Fdt` blobs and live trees, and
> >     helpers for path lookup, node creation, and pre-order traversal.
> >
> >     Add unit tests in `tests/devicetree_tests.py` covering `DeviceTree`
> >     round-tripping, subtree unflattening, duplicate-name and corrupt-tree
> >     rejection, and navigation helpers.
> >
> > > > diff --git a/devicetree.py b/devicetree.py
> > > > new file mode 100644
> > > > index 0000000..f81b8fc
> > > > --- /dev/null
> > > > +++ b/devicetree.py
> > > > @@ -0,0 +1,226 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > > > +"""devicetree - Non-flattened in-memory device tree representation in Python."""
> > >
> > > I'd forgotten about this but PyPI has Zephyr's python-devicetree
> > > [1][2], which installs a top-level 'devicetree' package.
> > >
> > > I'm not sure what to suggest. Would libfdt_devicetree be too awful?
> >
> > Right. I'm OK with libfdt_devicetree. David: do you have any
> > objections?
>
> Don't love it, but can't quickly think of a better option.

Would libfdt_tree be better?

BTW we might be able to change pylibfdt to package (and even call it
libfdt on PyPi), iwc perhaps libfdt.devicetree might make sense, down
the track.

Regards,
Simon
