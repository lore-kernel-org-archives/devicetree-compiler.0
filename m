Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759013E95A8
	for <devicetree-compiler@vger.kernel.org>; Tue, 14 Apr 2026 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180277; cv=none; b=jmMNKEUL0gjOPIy7R5oB22EBcz2/My1CKSznE0lxSPfBUIE6hyBkLdQCx83/L/BsCbfTiXsMRCq79akCgcQ7qirbB8HOQnCPLr7tOZPY7m+wtgp8G+DBevCZQ8p0igccpaMlY4EtoUCjL2mpDinJa3fFNLrYIcnNk7QnUyEXUoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180277; c=relaxed/simple;
	bh=wmHJdJrfmsdcMV2AKOh8U2EG/bVhuaacgJ/WIYRt1J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYtmu3tRCsHlB3QUdmoJjngzUK3EJrCOH76cy+DE6AaHw7OXobfUpy1Eb3Ahryf30bccCEygL7kilNqmb59chPxYJqNK9/tH8QrlWJW7lKuyyae+8xrOvzNj3JsWObQOonDCC5Zh7HQzbgj2XWQNW2AvhV3xFD65t/bQP/TORso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qp7M9ccv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qp7M9ccv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E277C2BCB9
	for <devicetree-compiler@vger.kernel.org>; Tue, 14 Apr 2026 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776180277;
	bh=wmHJdJrfmsdcMV2AKOh8U2EG/bVhuaacgJ/WIYRt1J8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qp7M9ccvn3XJW7WUUpSamedN2xrOMb+3SVp8RBcosdCy8TXOYuLSwohI63cgg6jGc
	 kTJeAVl+aVBP1u4b/evOLYMRHGp8RuVeNHcmUlac3NbrUzG6FoH+6BDvBHCPHphcAh
	 Ssa9wVB/T4BQCotj0gSYfrUJF9anHkOb5dhzXF2tOYX6RrBZS8bhqZhjUjKxje/wis
	 pjwZLm16KQMMo1X7TZWAzPcMa9VKtr2JPh6yGb0nE/MOMBddSYt8voOHasRikqLUuN
	 j0F0BM2jm35UfxfWGtszVM/9+t6EVEFmTa2BF3VKK3ifBiBWPAmxB1geiEcGMkQsTU
	 2AiTiU0Nih4dg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so6224442a12.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 14 Apr 2026 08:24:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ99UVu13Pza7NZeCR3hksBxq4H3lnGQCkJA1b3+ciV2nYVmZMgj5GaXh+8wNwTGVngxRXLkQWrbl+yzsf5lcgdY6wtz@vger.kernel.org
X-Gm-Message-State: AOJu0YxtH6O2cMMhwHapzKI3L8Bp7xDpOsLs1Xfe4ECphBoDyWU1rqWg
	K8A159gmIsMn3YfnNZpyI3tYtYu4u7bcnZfjXrgAqEXFSyJup1IXXrtBqfB8OkA2MH4eC6iOKe6
	2vJtKZU0MGVCoBO0cKr12gEpbYCyfaQ==
X-Received: by 2002:a05:6402:21c6:b0:66e:68e1:fd18 with SMTP id
 4fb4d7f45d1cf-6707b201d61mr7475812a12.23.1776180275627; Tue, 14 Apr 2026
 08:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
 <20260412145144.4737fde6@bootlin.com> <D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
 <20260412173916.7a971a45@bootlin.com> <163D807F-0F83-4282-B182-7A18B124D3E6@hotmail.com>
 <00f0d18e-feba-45cd-af92-f737c9b965ef@kernel.org> <7F2DF84C-A010-4BCB-B973-D17BF58EDCF2@hotmail.com>
 <e3b4c7c4-64cd-494c-b2c5-fa71a7303038@kernel.org> <74FB5D90-08F5-422E-9DB2-A00E74E25422@hotmail.com>
 <c0983f3d-5025-4933-ac22-bfbc1adc6c31@kernel.org> <DB5F7CA0-08E8-4CF5-9815-598002AF471F@hotmail.com>
In-Reply-To: <DB5F7CA0-08E8-4CF5-9815-598002AF471F@hotmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Apr 2026 10:24:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL2bRmX6qeapqqZZx=V7ARA_XbenrTqNk4ru2AAR24VZg@mail.gmail.com>
X-Gm-Features: AQROBzAjuRuHHmJ2RU-XImtLF9u6cLGoALNnxSsme24IZ064FdBxIOQqF5OpTU4
Message-ID: <CAL_JsqL2bRmX6qeapqqZZx=V7ARA_XbenrTqNk4ru2AAR24VZg@mail.gmail.com>
Subject: Re: Phandles
To: Kyle Bonnici <kylebonnici@hotmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Herve Codina <herve.codina@bootlin.com>, 
	"devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 4:50=E2=80=AFAM Kyle Bonnici <kylebonnici@hotmail.c=
om> wrote:
>
>
> > You cannot have random values. I quoted the DT spec.
>
> Where in the DTS 0.4 spec are property names such as  pwms, clocks
>  etc=E2=80=A6 mandated to be of format <phandle cell =E2=80=A6>?

I would not read too much into what is defined in the spec vs. what is
defined in dtschema. It's a conscious decision that all these
properties are not in the spec. The goal is the whole spec or at least
any parts defining properties is just schemas and the spec is
generated from the schemas. That's the only way new properties will
get added to the spec (with a few exceptions). However, no one is
working on generating the spec from schemas.

> > Well, we don't use discord but IRC... but that github issue also uses
> > "pwms =3D <1 &pwm0 1 20 PWM_POLARITY_NORMAL>;"
> >
> > So again - what is "1"?
> >
> > I am asking because if you use incorrect value as phandle value, then
> > DTC warning is obviously expected and nothing to fix here.
>
> The warning is only valid if =E2=80=981=E2=80=99  is expected to be a pha=
ndle which is what I am
> Arguing the spec does not mandate this.
>
> > You asked why phandle has to be the first entry in phandle-value type? =
I
> > responded that DT spec makes it.
>
> Which section in DTS 0.4 spec?

Doesn't matter. How would you ever parse the properties if that's not
the case. You have to have the phandle first to get the number of arg
cells to find the next phandle. I suppose you could define some other
convention, but it would have to be pretty much global like this
convention is. And this convention dates back to the GPIO binding
which dates back to at least 2005 if not the 1990s. And most of these
properties you list date back to well before Zephyr existed.

The spec, dtc and the dts format will let you do something like this:

foo =3D <0x12345678>, "bar", /bits/ 16 <0xabcd>;

You would have to be out of your mind to do something like that when
the format has zero type information.

Every warning in dtc can be disabled. So if they are a problem, turn them o=
ff.

Rob
