Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600821E098
	for <devicetree-compiler@vger.kernel.org>; Mon, 13 Apr 2026 02:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776046381; cv=none; b=JyEK6MKcv4I7bEsGKnrtQYbk5y07JxrduMiPy3bn5tBKvKbWJ8ZwR99PNDXIx8GYL2WF/6DOjKkCdBznbXJ5/27DUfHfq5CNL9BRTWiovS4+4jGFob5yBwoJ2dlKtBL7GMH+WEFU7P7g/E90L4IOibl+oLc+8+pkfVLj+27ETGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776046381; c=relaxed/simple;
	bh=QBT998Ouzke3hZLue5SGIzvvlJ53oo/mDNWgg2qFJrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q65ev0jFlDrhXJ8uJ2S/Eb2tcfAYYOY4r6y1GJNuslZFcsmnQroEPWbD4VI1f3LzaVTO4scWeS8nmooml6mcDZ0/eLFi1pADrdHAgA5uKNqzqIXpWLBHFdRaPT6PVYeIQAI/FBt0QxQrkXhEErpucAyM+zeJS9M9NUhrV0MzTRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=XBJKqwSD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="XBJKqwSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1776046374;
	bh=CbWRSJ14OmGf9WicdLj/3HlF1WSK8t+UB5EwcSQGqco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XBJKqwSDHP4+lKZsPqa3Yn8T5Acc8DhV+1SScZf6xaHFpZNGT0WoRiFw7ovHvmoF2
	 83yXR8R2cHunzKPmZDiJ1k9XuycrnfsdWNwEc2ObE7PHITXn8ujlEFdc4OqU5n8tCt
	 62kyFGTI/IZHUDXwXz82m7nRokW61a3BJtIbJrM2hgDb7fWJXHBqq2KykR87FF18KV
	 F9MuNT5UFB2mPdRak/w1IuPXGgVOD84X7OIlm9hzw7ssVsneqDZpgFerQYBQHp5ZQR
	 WXHjkwBzYXatH6B0lcmP/IsjfrMZpVAm9R1fXexboxmtYhrHJAUSvjQ1oToQVcngyR
	 ZOtjxB1AEyQZw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fv9sy3V3wz4wHr; Mon, 13 Apr 2026 12:12:54 +1000 (AEST)
Date: Mon, 13 Apr 2026 12:12:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Kyle Bonnici <kylebonnici@hotmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
	"devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>
Subject: Re: Phandles
Message-ID: <adxRIlenv2OTFXJC@zatzit>
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
 <20260412145144.4737fde6@bootlin.com>
 <D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dqvbqmHFt6Mqcyr2"
Content-Disposition: inline
In-Reply-To: <D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>


--dqvbqmHFt6Mqcyr2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 01:51:35PM +0000, Kyle Bonnici wrote:
>=20
>=20
> > On 12 Apr 2026, at 14:51, Herve Codina <herve.codina@bootlin.com> wrote:
> >=20
> > Hi Kyle,
> >=20
> > On Sat, 11 Apr 2026 18:33:33 +0000
> > Kyle Bonnici <kylebonnici@hotmail.com> wrote:
> >=20
> >> Hi
> >>=20
> >> I have been looking at the the code for the compiler and I am wonderin=
g which specifications marks the below properties MUST BE Nexus Properties =
hence the validation.
> >>=20
> >> WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#coo=
ling-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(dmas, "dmas", "#dma-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(hwlocks, "hwlocks", "#hwlock-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(interrupts_extended, "interrupts-extend=
ed", "#interrupt-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(io_channels, "io-channels", "#io-channe=
l-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(iommus, "iommus", "#iommu-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(mboxes, "mboxes", "#mbox-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(msi_parent, "msi-parent", "#msi-cells",=
 true);
> >> WARNING_PROPERTY_PHANDLE_CELLS(mux_controls, "mux-controls", "#mux-con=
trol-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(phys, "phys", "#phy-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(power_domains, "power-domains", "#power=
-domain-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(pwms, "pwms", "#pwm-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(resets, "resets", "#reset-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(sound_dai, "sound-dai", "#sound-dai-cel=
ls");
> >> WARNING_PROPERTY_PHANDLE_CELLS(thermal_sensors, "thermal-sensors", "#t=
hermal-sensor-cells");
> >=20
> > All of those properties are defined as phandles.
> >=20
> > For instance, the 'pwms' property available in a node means the the nod=
e is
> > a pwm consumer. It must follow the pwm consumer binding [1] and so a ph=
andle
> > is involved.
> >=20
> > This phandle can have arguments and the number of argument is defined b=
y the
> > #pwm-cells property set in the pwm provider node [2], [3].
> >=20
> > [1] https://elixir.bootlin.com/zephyr/v4.4.0-rc3/source/dts/bindings/pw=
m/pwm-controller.yaml
> > [2] https://github.com/zephyrproject-rtos/zephyr/blob/main/dts/bindings=
/pwm/pwm-controller.yaml
> > [3] https://elixir.bootlin.com/linux/v7.0-rc7/source/Documentation/devi=
cetree/bindings/pwm/pwm.yaml
> >=20
> >>=20
> >>=20
> >> These can be found here: https://github.com/dgibson/dtc/blob/main/chec=
ks.c#L1498 this is relevant for https://github.com/zephyrproject-rtos/zephy=
r/issues/107066
> >=20
> > Examples provided in the zephyrproject issue link are, in my opinion, i=
ncorrect.
> >=20
> >  Case 1:
> >  / {
> >      node1 {
> >           pwms =3D <1 &pwm0 1 20 PWM_POLARITY_NORMAL>;
> >=20
> >           Here the first cell '1' is not a phandle.
>=20
> Here the compiler is making an assumption here that all `pwms`
> properties must be specifier properties and all use `pwm` specifier.
>=20
> This is not the case in zephyr. Any property that is a specifier
> property must implement a binding and follow these rules
> https://docs.zephyrproject.org/latest/build/dts/bindings-syntax.html#spec=
ifier-space
> and validation is the responsibility go Zephyr's build system.

I'm not quite sure what you're saying here.  Are you saying that
Zephyr is using the same property name as an existing binding, but in
a different way from that binding?

That's a terrible idea, whether or not it's technically against any
spec,

Also, Zephyr shouldn't be making choices about how the device tree is
encoded.  The device tree describes *hardware* (real or virtual) not
how the hardware is used by a particular OS.

> The same applies for all the other examples I have here
> https://github.com/zephyrproject-rtos/zephyr/issues/107066
>=20
> Given that these nodes do not implement any binding then no type should b=
e inferred.
>=20
> In addition AFAIK the devicetree specification does not say anything
> about these specific property names (unlike `interrupts` and
> `interrupts-extended)`
>=20
> Hence it is my option that the compiler should be agnostic of the
> binding system used and not make any assumptions about bindings
> used.
>=20
> >=20
> >      };
> >=20
> >      node2 {
> >          pwms =3D <&pwm0 1 20>;
> >=20
> >          Here 2 arguments. The node referenced by &pwm0 must indicated =
the
> >          number of argument to provide. I.e it must have a #pwm-cells$
> >          property set.
> >=20
> >          According to your example, this property must be #pwm-cells=3D=
 <2>;
> >=20
> >=20
> >      };
> >=20
> >      node3 {
> >          pwms =3D <1 &pwm0 1 20 PWM_POLARITY_NORMAL>;
> >=20
> >          Here also, '1', the first cell, is not a phandle.
> >      };
> >  };
> >=20
> >  Case 2:
> >=20
> >  / {
> >      foobar {
> >          pwms =3D <1 2 3 4 5>;
> >=20
> >          Random values. Error detected by DTC.
> >=20
> >      };
> >  };
> >=20
> >  Case 3:
> >=20
> >  / {
> >      zephyr,user {
> >          pwms =3D <1  20 1>;
>=20
> This is yet another example see where zephyr want to allow any inference =
based on the value and not the property name.
> see https://github.com/zephyrproject-rtos/zephyr/pull/107127 (https://doc=
s.zephyrproject.org/latest/build/dts/zephyr-user-node.html)=20
>=20
> i.e .         =20
> pwms =3D =E2=80=98foobar=E2=80=9D; // should be a string
> pwms =3D <10>; // should be a number or U32
> And so on.
>=20
>=20
> >=20
> >          Here also the phandle is missing.
> >      };
> >  };
> >=20
> >=20
> > If you want to use Nexus node on top of that, you can have a look at the
> > following example:
> >  https://elixir.bootlin.com/linux/v7.0-rc7/source/Documentation/devicet=
ree/bindings/pwm/pwm-nexus-node.yaml
> >=20
> > In the example, you will find the consumer, the nexus node and the pwm
> > providers.
> >=20
> > Not sure to have fully understood your issue but I hope my comments hel=
p.
> >=20
> > Best regards,
> > Herv=C3=A9
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--dqvbqmHFt6Mqcyr2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmncUSEACgkQzQJF27ox
2GeqLA/4q740VHYBT7DJJj9HFHs4eaUcEWHPgfxZKDYuxIPyejxvvuetZCC2ilkj
l9UjftXSK0kIFUBztoCIdUJi0XkfAB7nMnyE/YWwhXp38LUAB/MKmGM72BNW1cWX
zRI1DEDLAwasWSMjiAgQ0jb8ymYEG221Mc2SBudOSHAch8AxgjDVJEtvWf3YS4Kr
2IDGEbrl0JRq780pEd/ut3s8TmT1VslCyHwWlaXH4uLiQvC4Xhzfky96ZhJa054V
JwEXk+3d4aJbTOT1E/c4aA+QvKeX8ru2MThuyn7OwRreRNTDTlXFH5x5r0/FJyez
+/oO2uNcv9EZL8NR7LgfOsO3PPZNLi5vpmmLBLc6VH6kQEab7UCrZYzGpmCjSDGz
N3eyPMNFVw1j8At/lvYsmFoewSnrZTARbOtw2+W2RbyBpuCun8pIjmHO4CYNJs+F
QYvAXIMxk1f2g8b3TYoETSxoaykg0sj/sTF84pgDbseE0YpAeExsgJSfMNA7RBgb
eYvOdyOF6QJFaUFjrS89ZbAsLiTc93xTqaylvKPlBFjjO6vBziG9kyHcMfMDmOXN
7S1woulrcBGnQJkuRqv22kbIVi6q0x3velvTAdug8BGhzWOe6TUVgHFO/VNDmVmr
ianIU1pouWGy6uyaouzhPXx47lpgpiYE48A5qmo3rpcfyGWSRA==
=Ojnf
-----END PGP SIGNATURE-----

--dqvbqmHFt6Mqcyr2--
