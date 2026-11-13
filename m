Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540622;
	b=0psYcDMPZId7QllGFDHfiMZzAy/ps+idWVoQtzTtrQycAEBZEOVrdwPt0HA95bzWLW3q
	 AiXt2pr5UjWurprRXnkFi133maKHnrOaMj64GpPCTBJJcmLwa7Cgq9isIEwANrVM9UcMJ
	 cFcPiHa09g1yDPD35S1AtvBlDCpaYTp5L/lI3OasnQyvU4p0TW5LGJD5yv+Jl4oXfVmqb
	 ayBWhHuTclYQ9cR524hmPGvRX2pPLwakKCg2cct5Vc4vSrx7H97jP67nunhNz01X0ZiDL
	 phEz190cVYj/oCApzzUKDYibUbki125GjTpjiCRcZLEPjSMRUnhQBsKPzNfgoACCHZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IyDgmHlGc2LlHCU+APm/SncKRB3P+rRs9H3SfqU7anQ=;
	b=ReHqcjoi+qetYlwCcR6lBle91N2yEsrAgNAgAk0vM1BNeLGGCRMK1QxvBzmPZvz9ady3
	 q2Op5tebwUczd1/tIgRi2FgMXuWg2SDusqWYoiAG4ZdBpeIbNnFEjPZh9AMj/Q59TITas
	 /yF/1pCcgLROhrIl2B1U917AC8jx25YHQhgd4JPNyYHpFrY07Gtk2zAMv9dFJgg5VALqD
	 u9hsjcXR0Vq7BWoVCndRefQT15uR08YRJhOOxIR3dmhWxmctENChPkq2IHOtozFXfhext
	 FN02YINTMSflH3TxBchfeCxYEFQGFBIJGqzmq6+e8VGByFoP8jJzxM7d520lBrjb5GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n0vnSv7c;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A5B606A335
	for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 03:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58A5B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n0vnSv7c
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso921613a12.1
        for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 19:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794540621; x=1795145421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IyDgmHlGc2LlHCU+APm/SncKRB3P+rRs9H3SfqU7anQ=;
        b=n0vnSv7cElidOz1lvprPJ8hmH9Okhg1NNaQcJO0XBIehKFtlf2lBP1nI/ws0nf2xov
         4MaDm5lsUVq8FHEGo1MGyobijhuQHE5nXQoK7OM7sJ4a2mfx/qLJnSWRzkgsuVl6I63r
         YJXuzxefKgYlmgi7Nb6z8n2Z9ajL3aJGlOjLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540621; x=1795145421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyDgmHlGc2LlHCU+APm/SncKRB3P+rRs9H3SfqU7anQ=;
        b=l9nQZ5VxJyio9QO31G1T1mgRSd9j5VXbtDGFzuwZnOWSn+Waj+tm5+NfdNY2pPUjlh
         ytx/ttHmjxCC+HVyf3QB+KM0CtTRszOsXFwxfPNaf6ucOBluzeHIq3yjb4zLL0AR9IAS
         PFFNTmqlmt3pYuOQuvMrLOdTJDckqsUvbg1E2oZWqW26fHeObU/GmnpVrv5hIEvi/245
         QxJn2qDe3pI1PiRSiKvaLjri3eVFH8l49Tab9t1VHUCQW8bbu1OaKIc2HTDxsBmJlxW6
         Dwzn+2uTH9oeB7vsJAKZWCKxjQfQBiwl1LESU7ApB/81ovpHLOf30VWiwL7dgV/fncZh
         1fXQ==
X-Forwarded-Encrypted: i=1; AL+hErEXeFBfE3YJd1gXIgdjLn8+T4M9Kkxs8CQwflBmwd7mXmJPv6IhVPkbdqqHZ7lUX7hyXUO51f+gMDUw2Rb6yNgVPhWF@vger.kernel.org
X-Gm-Message-State: APuU4Z9nqocOf3DnliLo3E6lxMivYkoQNAuuOPGxKc0061dpy+9Pt3s8
	f9t6xlWw7xdb3stO/bQl4a35IMpM4neLk9VMRjzAkjoHwxkUcxd6n64bBBQWlmMy5SVr1gNcaFV
	DOYEoqnLz
X-Gm-Gg: AYBFou3aIP92bmCrEZFLF7sf5Z1rZf41vWZTR5nhj+d8gse8MvxWEleghwGTFGE1ujj
	XVFPLepRTxVbY+jHB32qlLon+rZvaF+pKXdB1WeTbBoyfkd2+ePgEyYu8WbaxMmJj66Nbm53OAI
	fGoz3/uGPQKPnEKoB3Qgbi6Lp8ilh0Hu/BIWEFn+KgC5l0bovxRTdZCKcYFxzYeN/GzdCtuiIfH
	GCv+HeFC8dAs3PkLBjb6e8qHWs6dXvdMjNiupOY8N0QpcuYPXt2v/GI93SV93Q1VERa8Lo/RPnl
	0XLOrTa6xbk+ybrVNPKcubsvajesoGGJTkQy3Z0jkbQl5ktUH1fkTEBekUC0iQpvwNM4aD9a4pS
	9VQbFE5I4KseH/QP/ZJ5x9PO3L/l00gRv5DN9M2X67s8UECveSM1vSIvGJcztysCkX86Dp6DVub
	q1dM6iOX7fZ7Dfb75vxOzd8tZmJTgzjjs6HQZ+ZOFD1cZjQOop3W3WPNfF6AFNZbN1YWvymxtJc
	/gjnsRgvQicVDg6SzfVJuGQdTtc2awfiSXz+inJRYEY0hnn8DNi+9IaWEcFJRau6o2hN7dIw12F
	UJqZAsXrGngHtuJHIBEGU0prsi43MDbOCD+hRkvP9KSpVC0bxIm2BODuvFedE+QkTGFC
X-Received: by 2002:a05:6402:a142:b0:6b7:b0bc:f4af with SMTP id 4fb4d7f45d1cf-6b7c0953b9bmr849990a12.7.1794540620827;
        Thu, 12 Nov 2026 19:30:20 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23cf6e9sm444135a12.20.2026.11.12.19.30.18
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 19:30:19 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so3004405e9.3
        for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 19:30:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF1ACJffYLwxhBz7ErbAaycDqxxYTwCxjQlSmZ/apqhjLB0oUXOVcG4pnwxntGywAvTeCqxwl6bKp2WQ8dOFcvcoTVA@vger.kernel.org
X-Received: by 2002:a05:600c:6912:b0:4ba:59fa:510e with SMTP id
 5b1f17b1804b1-4bb55ab411dmr22862225e9.23.1794540617960; Thu, 12 Nov 2026
 19:30:17 -0800 (PST)
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
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
 <avPZeSgU8ABix34f@gractus.seuss> <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
 <avUZ-uqxLAu2ICyJ@gractus.seuss> <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>
 <avaDbTmhq1NuTKJr@gractus.seuss>
In-Reply-To: <avaDbTmhq1NuTKJr@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 19:30:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V+iLQQvUi3g7+JED0S=8ksup+59rNxrqAnXtHjXc+AWQ@mail.gmail.com>
X-Gm-Features: AclHuK-aJhOTg1eK8SFSLRiauTt_F0qspaiN0WNuraPul_eSmwqC3QJG2lM2xV0
Message-ID: <CAD=FV=V+iLQQvUi3g7+JED0S=8ksup+59rNxrqAnXtHjXc+AWQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 12, 2026 at 7:26=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Thu, Nov 12, 2026 at 11:28:29AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Nov 11, 2026 at 6:31=E2=80=AFPM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > > > > > > +++ b/devicetree.py
> > > > > > > > @@ -0,0 +1,226 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clau=
se)
> > > > > > > > +"""devicetree - Non-flattened in-memory device tree repres=
entation in Python."""
> > > > > > >
> > > > > > > I'd forgotten about this but PyPI has Zephyr's python-devicet=
ree
> > > > > > > [1][2], which installs a top-level 'devicetree' package.
> > > > > > >
> > > > > > > I'm not sure what to suggest. Would libfdt_devicetree be too =
awful?
> > > > > >
> > > > > > Right. I'm OK with libfdt_devicetree. David: do you have any
> > > > > > objections?
> > > > >
> > > > > Don't love it, but can't quickly think of a better option.
> > > >
> > > > Would libfdt_tree be better?
> > >
> > > Not really.  The problem with all of the above is that they're making
> > > this library which is about managing a non-flattened device tree a
> > > part of the library/project/namespace that's explicitly about
> > > flattened device trees.
> >
> > Personally, I kinda liked "libfdt.devicetree" that Simon suggested
> > (though my analysis says accomplishing that would be difficult).
> > ...but I can also see David's objections to namespacing this under
> > "libfdt". Does this mean "libfdt_devicetree" is out, too?
>
> I wouldn't say it's "out".  Both options are adequate if we can't come
> up with something better, I'm just not enthused.
>
> > One other option is "dt_livetree". That matches the "livetree.c" that
>
> Again, adequate but clunky.
>
> > already exists in the source base. What do folks think about that? If
> > we switch to this, should I move the ".py" file? In my draft v4 I
> > still have it under "pylibfdt/", but I could move it to a
> > "pylivetree/" directory...
>
> How about "libpydt"?  I'd prefer to reserve "libdt" for a hypothetical
> future cross-language live tree library.

It's fine with me. Simon?

-Doug
