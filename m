Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B202FF15B
	for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jun 2026 22:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781736897; cv=none; b=Z5L53NLxg3I6XYoyC7bkB11Ib+479cJNL2K7CLfJbD5bM/zNlmpyB/+Qbv+DpnGwymBw50rmQ4oF4Yk16yRSdc4tSQuwECJC7kYmUMytnfRxFt5W9RtG0mMqG6KDDuyVgrtYsKENtrRuFoJmXdWc51ZX0+2zUk7rYk/XoSqEEFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781736897; c=relaxed/simple;
	bh=J0bH7/7G2xx4cE5RXYPFBewnxB/+XbpJtMRac2EIZl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldxJQpVc85pEB6HnNWjUYjBuuxceyI3CYlpVPBFYswuVcGztOIFcksc4ublGz9t8JDCnp9xHwr+WzFkex+DaiDs/4JKg4efafO15nPbHzv/e/NeD8QA/u0Bl36XKkwtUiLh7CVJNJhz+sakckylepZAtVaifX3O+y3UYgPAmMoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UenkYx6P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UenkYx6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C901F000E9
	for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jun 2026 22:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781736895;
	bh=BixqmPqbcgMvalrtbBurGWW2WQ/DHJVyeFUF6qxl8bA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UenkYx6Pz4BMqCB02/xyCkJMqYk5I050Gbuuq4FUUhzKXfsNs/Uy5ZRFvI7FbaNP4
	 FRF3CRERmqyczTxjiHKaFHH56FM95/lumnPP/5wU2kvqYzSZgQbQKkAwdlTu62HsCH
	 KKSWZNA1DGfRlG4e1PkPDQUabmqAo+2//Vc1F3UyyAElAHsK39jrQuP0yDaRA/uBqa
	 xQICPN5CkFa3Mu8JnVIZNn61yyEykLsLfKF0f4L2GQtCNqWJIx5C69q8i+Xu4Matdv
	 Op9Wp3vOkLPj0aNCCH2rxTOJmYFQTqUsuzO3SHy6UD7xZLn/lZlgHq/nd+W54KtLvH
	 vw8Qbx8GDMQCQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-becfa735b9aso31926466b.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jun 2026 15:54:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YyPobjPIp2tba+M7yPz2DAMaIH5ljGBJK9LuYfsY61bL/gA8XIk
	4WwtAQlisIfG23m2cLhmCFhlwDb7OdVKPcMiyPCc9LfCHtrtdHxtRgpWwhWjNKpv5fsDy2nTnne
	pTjUX8XKO7JARiqivzLvdvBknuzgfsA==
X-Received: by 2002:a17:907:1b29:b0:bed:87c:b24e with SMTP id
 a640c23a62f3a-c074d5fb20cmr51594866b.29.1781736894535; Wed, 17 Jun 2026
 15:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617204401.2275738-1-briannorris@chromium.org>
In-Reply-To: <20260617204401.2275738-1-briannorris@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Jun 2026 17:54:42 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq++ERWJ19BcVXHKTzq1PN7tpJm=rm6e08UCH_gcp6ncHg@mail.gmail.com>
X-Gm-Features: AVVi8CdKFEFAWaIPqVbyJ_uGCFf2qhF_t46J6aZM5fh7-SQ43FjtBVYLmFnzFcQ
Message-ID: <CAL_Jsq++ERWJ19BcVXHKTzq1PN7tpJm=rm6e08UCH_gcp6ncHg@mail.gmail.com>
Subject: Re: [PATCH] checks: Avoid warnings for reg override in __overlay__
To: Brian Norris <briannorris@chromium.org>
Cc: devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 3:44=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> A simple overlay case can hit a number of false warnings just because it
> provides a 'reg' property [1]:
>
>  * avoid_default_addr_size: the generated fragment@0 node is an
>    artificial node, where #address-cells/#size-cells can't exist.
>
>  * reg_format: we're assuming the wrong/default #address-cells here, so
>    the analysis is wrong. (We don't know how many cells should be in
>    this 'reg', in isolation.)
>
>  * unit_address_vs_reg: we don't know the real node name here. (It's not
>    actually going to be "__overlay__".)
>
> All these cannot be checked by the overlay compiler in isolation.
> Suppress them when we identify we're running in plugin mode, and we're
> likely looking at a generated __overlay__ hierarchy that can't be
> analyzed in this way.
>
> [1]
> $ dtc -I dts -O dts tests/overlay-reg-override.dtso
> tests/overlay-reg-override.dtso:5.2-14: Warning (reg_format): /fragment@0=
/__overlay__:reg: property has invalid length (4 bytes) (#address-cells =3D=
=3D 2, #size-cells =3D=3D 1)
> tests/overlay-reg-override.dtso:4.6-6.3: Warning (unit_address_vs_reg): /=
fragment@0/__overlay__: node has a reg or ranges property, but no unit name
> <stdout>: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> <stdout>: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> <stdout>: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> <stdout>: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> <stdout>: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> tests/overlay-reg-override.dtso:4.6-6.3: Warning (avoid_default_addr_size=
): /fragment@0/__overlay__: Relying on default #address-cells value
> tests/overlay-reg-override.dtso:4.6-6.3: Warning (avoid_default_addr_size=
): /fragment@0/__overlay__: Relying on default #size-cells value
> <stdout>: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avo=
id_default_addr_size'
> <stdout>: Warning (unique_unit_address): Failed prerequisite 'avoid_defau=
lt_addr_size'
> /dts-v1/;
>
> / {
>
>         fragment@0 {
>                 target =3D <&foo>;
>
>                 __overlay__ {
>                         reg =3D <0x00>;

I would argue (and did the last time this came up IIRC) the overlay
should target the parent node instead and then you can put in
#address-cells and #size-cells in the overlay to make it pass checks
(and make 'reg' parsable without applying the overlay).

Rob
