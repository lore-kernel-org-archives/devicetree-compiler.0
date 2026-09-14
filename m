Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40B6430301;
	Mon, 14 Sep 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381195; cv=none; b=A3kOdJk80U8wFaBfIWkvdi98RMMhpeRxxM6EjFD7A6KGLoDRB285r6tovfCWhJ9O6GkmAulgBfzUT+WgU6U6Tt30+MINAKB6QJMbWxnEgsSqDn5+VMndZ46k26SVvdAULQZbbHgZZhrso6HAzHg26KbpdqMi5p7CvviRnSCSJIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381195; c=relaxed/simple;
	bh=Okn5IiA63cT5FQivUSCDW7onGhhTmTisHhjVmBxqor0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qw2A7v6xvSrA9ji4pCwF/PkS6zg5lhDjGo0Urq5055+8j5tCwpgyQniDeRfXo2yflFls+ektHu9i+1fH0HGzAz2R61FT24cHAccorOKjEXPBttb2VStNtZ1F56A6VFd+c4B2FHGnEv6OXnZqHqLRg/6qsD/ixm/qHp0CpwWNZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eiWw99rf; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eiWw99rf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BA781C653FF;
	Mon, 14 Sep 2026 10:20:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9046E60323;
	Mon, 14 Sep 2026 10:19:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9244E11C7AFDD;
	Mon, 14 Sep 2026 12:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789381185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tIShQgUZ1LVGvDiP9wrSyUe0eu3Y16gHnaCYoKrpl0E=;
	b=eiWw99rfzgdVal2nAKsbbvKMxz23mcUJA75mG31IZO0fNcud7NFV7u/qdIXU7Am/W5vXSW
	Vros+u3XV96an9uo921WbvPn5oDPsLqaytsuRAMIhv4lLoYQL/dCMuwvtMEP/icLQBCetW
	IvfTd2N8DVAWVX2k7zHHaemG8DxVTC8rVnnUkQtP5v04SFiahuT1z7KBPBDfWUxbVzIEbm
	ACFm1IncGx8O4PFb8wg5CSiDXdR62tXB6vlpCUbyzCAU7mSYt2rIXzZNUWAryera77JwJS
	3cqW+EP5WL08qIMbXE/GsTTu4s16F7gFZac2F+/7Aejs1/Wu0mFS5TYo1qSfKQ==
Date: Mon, 14 Sep 2026 12:19:37 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <20260914121937.5b7fa2bb@bootlin.com>
In-Reply-To: <aqS6HmkaVYbrePtN@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-7-herve.codina@bootlin.com>
	<aqI3KnnQnUytqkEc@gractus.seuss>
	<20260910094126.4bf4cae6@bootlin.com>
	<aqJ5OhJcv4k-ZAj8@gractus.seuss>
	<20260911091653.37b22b0f@bootlin.com>
	<aqS6HmkaVYbrePtN@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Sat, 12 Sep 2026 12:34:24 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> > Do you mean that we should avoid the DATA_LEN_ENCODING and always have the
> > 32-bit value right after the tag to give the size for all "skippable" tags?  
> 
> Yes.
> 

I did a test using a dts file available in kernel sources. I used (arbitrary
choice) juno.dts [0].

Without any new tags, the size of the compiled dtb is 27067 bytes.

With new metadata tags identifying phandles in properties (FDT_PROPDATA_PHANDLE),
the size of the dtb becomes 29027 bytes and so 29027 - 27067 = 1960 bytes for
those FDT_PROPDATA_PHANDLE tags (+7.2%).

The tags used are composed of:
32-bit: FDT_PROPDATA_PHANDLE value encoding 1 x 32-bit for data
32-bit: offset in the property where a phandle is present.

Removing the '1 x 32-bit' information from the tag value and adding a 32-bit
'length' in all cases will lead 3 x 32-bit values for a FDT_PROPDATA_PHANDLE
tag (tag + length + offset) instead of the 2 x 32-bit (tag + offset).

Back to juno.dts instead of 1960 bytes, the FDT_PROPDATA_PHANDLE will need
1960 * 3 / 2 = 2640 bytes (+9.7%). This leads to around +2.5% of the whole
dtb just to have the 32-bit for length. This +2.5% can be easily avoided.

Also, I will not be surprised to see more tags in the future adding some more
metadata information and so increasing dtb sizes.

Quite often you have mentioned memory constraints system where libfdt should
be as small as possible. On those system, the dtb itself is embedded in the
binary close to libfdt. The size of dtb should be taken into account.

If the SAFE_SKIP bit is removed, I even plan to use this now free bit in the
length encoding part:
  0b000: No data
  0b001: 1 fdt32
  0b010: 2 fdt32
  ...
  0b110: 6 fdt32
  0b111: On additional fdt32 to encode the length of data.

IHMO, length encoding bits in tag value definition should be kept and used
for all tags where the length is fixed and can be encoded using these bits.


[0] https://elixir.bootlin.com/linux/v7.2.5/source/arch/arm64/boot/dts/arm/juno.dts

Best regards,
Hervé
