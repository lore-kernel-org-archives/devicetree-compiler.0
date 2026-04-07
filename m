Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BCE369996;
	Tue,  7 Apr 2026 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576800; cv=none; b=Y3hlaykXCDwYPPp/l3n9YDsUqAIeiIWJZESwUchn2rQ6ZBzVlOk2tG/nvJfvTqfH+3ZDclUaEBlHzG/D/IzqaJ8MFa4uL4KR+4sF3g6E7k8fmNXS7MsKR2hhvtRqngriOwbL2bkDXswu8AxZgMcsOd3hScVx/Ocr+cMk1q+sUWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576800; c=relaxed/simple;
	bh=CUeyn+KT2IfAF2Z286PBqcMn8YSvSsd9KV1WNimIlg8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=nFsBorUOH3nKMxgUdTUAE+EQv3qf/nabT71nz8WWMD2yDa3VCiPHxHg54HXZFPvC7lzGl9I413zSTOyXANpnoJG+uTQkTTE8r2VS2DGFg+lOhaOmBuZhYDQ3yHawBlT4dVWzdWlHE7aVUS+SVAXzPwY8emSDOcBtXC4aYo0ghYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EZCC+bZk; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EZCC+bZk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B09A94E42949;
	Tue,  7 Apr 2026 15:46:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A241603C7;
	Tue,  7 Apr 2026 15:46:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6F1B10450100;
	Tue,  7 Apr 2026 17:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775576788; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kXDjfKQNj28Im7bJaSBn1QDitehpBDWVDEOonldAWl8=;
	b=EZCC+bZkhn+Hq0FS02lQqvAWcrV54LER3VCEeenHsI3xy/2AVXCuJkpNj2+EY8R4c/Sy0x
	bWQT39gyoynJzpDXwAS+CLffDWdlTdcMaz4U4H0+awd6PzokKyBWfJx8JPLssYV85/J0Xo
	F4FfzNRLT7ya3WvC6uSMfQXRRevPT7FPo6a7Yrn+ADSMwWM/l85mdg++/zg0oHCzdoSQpr
	u/COq4ubhU1Id6wEZ9lSlqRyQzp41MA1fFE3Q/nVLqSQteE8MIpVt+D7e/ojk0zSo5XSrT
	GxJjm6p0dPMSYUyrQPAXDdHD/YytkNdRwyzWdqR6onz1E7xiVmnzKaPgVNA+4A==
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 17:46:24 +0200
Message-Id: <DHN1FU9M67IT.3MKUA8VO3MHI5@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [RFC PATCH 10/15] fdtdump: Handle unknown tags
Cc: "David Gibson" <david@gibson.dropbear.id.au>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Ayush Singh" <ayush@beagleboard.org>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>,
 <devicetree-compiler@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree-spec@vger.kernel.org>, "Hui Pu"
 <hui.pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-11-herve.codina@bootlin.com>
 <DHHX0MU38SMV.1NAWHIZ7STHW4@bootlin.com>
 <20260407160345.5adad916@bootlin.com>
In-Reply-To: <20260407160345.5adad916@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Apr 7, 2026 at 4:03 PM CEST, Herve Codina wrote:
> Hi Luca,
>
> On Wed, 01 Apr 2026 17:15:09 +0200
> "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>
>> On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
>> > The structured tag value definition introduced recently gives the
>> > ability to ignore unknown tags without any error when they are read.
>> >
>> > Handle those structured tag.
>>
>> How? This sentence is vague, what about:
>>
>>   Allow dumping the unknown tags or not based on a command line flag.
>
> Hum indeed but I don't fully agree with your proposal.
>
> The patch adds support for structured tag in fdtdump and introduce the '-=
u'
> option to dump unknown tags which can be safely ignored.
>
> What do you think about:
>
>     The structured tag value definition introduced recently gives the
>     ability to ignore unknown tags without any error when they are read.
>
>     Add support for those structured tags in fdtdump and introduce a
>     command line option to dump unknown tags that should be ignored.

Looks way better now, thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
