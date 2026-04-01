Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D722EC083
	for <devicetree-compiler@vger.kernel.org>; Wed,  1 Apr 2026 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056285; cv=none; b=PNLtnkwi4ZT6Ic4VrYufQuxT0SlH83qbTC9ojnogmXv+ytD+EsG33Zkxo0wxHrMr4HvVRh7yGcSu/C5ev0FnvrwD/0Jv0/aVh2iDUeS1274bQp/Kj1a4LqGLKnVeECowEaT6P22UNvD/d3Ug+zWqvba599ENy5ibdKTJAMeATvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056285; c=relaxed/simple;
	bh=c6Se/yYbHBZsvwakaZNhizmcpD4B8V48Ac0wvBVu4+w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EJm7qMP7xqnaifEU22BFZ7/J7LoRH2bPD6ANk6BuFJ5xHuMrzSdm74D8B3uSA3IRXbHlkl+xPMwj8NSW91OzsVqv9FyZX2ZU+9u7Mgo4JJZ0FVKLKm3O2PdHd8J4O5iHGacyNjl0r/sYOPPuuBZj9mjjWdwEM55zNSVBrT+zgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s9UNwnSG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s9UNwnSG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 53C924E4288D
	for <devicetree-compiler@vger.kernel.org>; Wed,  1 Apr 2026 15:11:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A07D602BF;
	Wed,  1 Apr 2026 15:11:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FA6E1045030B;
	Wed,  1 Apr 2026 17:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775056280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bDPpplOnDmxTVEYqaELJ5CrTokGdiyxDMOnoJTUXxU4=;
	b=s9UNwnSGmYKIqhkUCmxEaaChwfT8MGAb8YIfQe30KdIxUZxz7Zn1DnT3BAV1tuO/bBs9Xk
	tcwwVRe57aWJw9Jb2JNmcTNUOURpBkqaVvFntSeN0e+ZEMsVu9+5ZFlsDGPVyFlG07i1xm
	GR2cZcpFknAM6Ae00xpg0wejfMKnmL9KmOwYwHu3V0b3llC7k6PO6tlsc0+Ns0Zg6EAccb
	JKIU8kunLWyGn9igHieguTzRgfyqI3uNGcbX5WJbAu5B/laLyvm6Rnkap9hkClPNGPsq7T
	Zs1Cd8COPhxbt/DZTY3RZT8sjCV9YRDntYJT7IlXqcNsxyPgzPsJ3B5H/0J9ig==
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 17:11:15 +0200
Message-Id: <DHHWXNCDAWG9.2LYVXAWG8RBTY@bootlin.com>
Subject: Re: [RFC PATCH 05/15] libfdt: Introduce fdt_first_node()
Cc: "Ayush Singh" <ayush@beagleboard.org>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, <devicetree-compiler@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree-spec@vger.kernel.org>, "Hui Pu" <hui.pu@gehealthcare.com>, "Ian
 Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>, "David Gibson"
 <david@gibson.dropbear.id.au>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-6-herve.codina@bootlin.com>
In-Reply-To: <20260210173349.636766-6-herve.codina@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Herv=C3=A9, David,

I'm trying to review the patches that have no feedback so far.

Being new to the dtc codebase I'm mostly pointing out things that are not
clear from a newcomer point of view. I hope this helps anyway.

On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> In several places, libfdt assumes that a FDT_BEGIN_NODE tag is present
> at the offset 0 of the structure block.
>
> This assumption is not correct. Indeed, a FDT_NOP can be present at the
> offset 0 and this is a legit case.

I wonder whether this can be proven by showing an example, or the specs, or
whatever use case that makes sense.

> Introduce fdt_first_node() in order to get the offset of the first node
> (first FDT_BEGIN_NODE tag) available in a fdt blob.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  libfdt/fdt.c             | 25 +++++++++++++++++++++++++
>  libfdt/libfdt_internal.h |  1 +
>  2 files changed, 26 insertions(+)
>
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 56d4dcb..676c7d7 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -252,6 +252,31 @@ int fdt_check_prop_offset_(const void *fdt, int offs=
et)
>  	return offset;
>  }
>

Even though this seems to be quite uncommon in this repository, I think
documenting new functions would be helpful, especially preconditions,
postconditions and parameter values when not obvious.

What about:

  Find the initial node with content (FDT_BEGIN_NODE) in a fdt, skipping
  FDT_NOP [and <other tags> is applicable].

  *return: pointer to the first node into the fdt or e negative error value

> +int fdt_first_node(const void *fdt)
> +{
> +	int nextoffset =3D 0;
> +	int offset;
> +	uint32_t tag;
> +
> +	do {
> +		offset =3D nextoffset;
> +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> +		switch (tag) {
> +		case FDT_END_NODE:
> +		case FDT_PROP:
> +			return -FDT_ERR_BADSTRUCTURE;
> +
> +		case FDT_BEGIN_NODE:
> +			return offset;
> +
> +		default:
> +			break;
> +		}
> +	} while (tag !=3D FDT_END);
> +
> +	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND;
> +}
> +

Luca


--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
