Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5D32BE03B
	for <devicetree-compiler@vger.kernel.org>; Mon, 13 Apr 2026 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076250; cv=none; b=Er2yBiQoVFHPg18IkG0QuTCSctCzxrr5Ij4traTsplPoEWEZn6I0yw2YsU/Ylkz7irvuGmtGVKEPIhKSGcWJJ624ZlR8Tkt/txlfzq7SVhfMaVfOxUJX371zVHVpIYrA9LjZfoKorYZ6nK4QOq5M8jYPZ3cp1bQwLh0nmv7lQXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076250; c=relaxed/simple;
	bh=lFcFko4QriSwkpIDl0tEUb076hlM1VvGQGB9sf/JwHw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qf5PrncaM/A+nV3eTa5//TnCMvxA9hxFVPoxaWFluNywSC1o8V1JflWq9oxaYUpLrwmNMpaVhTyY03N1tjY2qQWI8F/QVZ+ek6mWKENiZSo6A9+nyDimbF4l9gv7LOlhx3F0XSqxwg8FQxluEfnFl45uu73AEVjMNgK36MFVQmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eJ+2lgWx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eJ+2lgWx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 45ECCC5C183;
	Mon, 13 Apr 2026 10:31:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B63BC5FFB9;
	Mon, 13 Apr 2026 10:30:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28F8B104501E1;
	Mon, 13 Apr 2026 12:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776076245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XEHjALJ1gQ0Wyww5UZiQGxFjQFIHZv869B+/Zwz/kug=;
	b=eJ+2lgWxVgmZ7uZmCe79Q0eitQaTRlrevyr6IKM1gcrbocUEa6aJf4mhV1t5nWSBxTlTsp
	fBdqqG5VoEPp+WUgT3Xkano7q6ARFhr5yQ/kVPhYGJHkLGH8iOzWXZvcl9b5UeVNba07SG
	qHfd3YOX851nQtP/W7SoL9C086EIsi+HnRjL5f7o0JUif3WLO+NXZr5Dry1+FTZMy2Mrpr
	Xdh4C9f52xU02PStXVPBLih24ajWvzwevcW9g0o1WnjOIgjtarpk+npxc3pxRnRCbeqMPN
	eG18Yso3KfjdoPcEVU1LgTmlOYiJaSpUr74cn0iK+0f43gtJUR0I3prTiRdsQA==
Date: Mon, 13 Apr 2026 12:30:41 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyle Bonnici <kylebonnici@hotmail.com>,
 "devicetree-compiler@vger.kernel.org"
 <devicetree-compiler@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: Phandles
Message-ID: <20260413123041.6273d44e@bootlin.com>
In-Reply-To: <72dc4a71-1a3d-4e36-9bcc-d9a4de3de6cc@kernel.org>
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
	<20260412145144.4737fde6@bootlin.com>
	<D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
	<20260412173916.7a971a45@bootlin.com>
	<72dc4a71-1a3d-4e36-9bcc-d9a4de3de6cc@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Krzysztof

On Mon, 13 Apr 2026 08:33:49 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 12/04/2026 17:40, Herve Codina wrote:
> > Hi Kyle,
> > 
> > +Cc Kernel device-tree maintainers
> > 
> > On Sun, 12 Apr 2026 13:51:35 +0000
> > Kyle Bonnici <kylebonnici@hotmail.com> wrote:
> >   
> >>> On 12 Apr 2026, at 14:51, Herve Codina <herve.codina@bootlin.com> wrote:
> >>>
> >>> Hi Kyle,
> >>>
> >>> On Sat, 11 Apr 2026 18:33:33 +0000
> >>> Kyle Bonnici <kylebonnici@hotmail.com> wrote:
> >>>     
> >>>> Hi
> >>>>
> >>>> I have been looking at the the code for the compiler and I am wondering which specifications marks the below properties MUST BE Nexus Properties hence the validation.
> >>>>
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#cooling-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(dmas, "dmas", "#dma-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(hwlocks, "hwlocks", "#hwlock-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(interrupts_extended, "interrupts-extended", "#interrupt-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(io_channels, "io-channels", "#io-channel-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(iommus, "iommus", "#iommu-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(mboxes, "mboxes", "#mbox-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(msi_parent, "msi-parent", "#msi-cells", true);
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(mux_controls, "mux-controls", "#mux-control-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(phys, "phys", "#phy-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(power_domains, "power-domains", "#power-domain-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(pwms, "pwms", "#pwm-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(resets, "resets", "#reset-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(sound_dai, "sound-dai", "#sound-dai-cells");
> >>>> WARNING_PROPERTY_PHANDLE_CELLS(thermal_sensors, "thermal-sensors", "#thermal-sensor-cells");    
> >>>
> >>> All of those properties are defined as phandles.
> >>>
> >>> For instance, the 'pwms' property available in a node means the the node is
> >>> a pwm consumer. It must follow the pwm consumer binding [1] and so a phandle
> >>> is involved.
> >>>
> >>> This phandle can have arguments and the number of argument is defined by the
> >>> #pwm-cells property set in the pwm provider node [2], [3].
> >>>
> >>> [1] https://elixir.bootlin.com/zephyr/v4.4.0-rc3/source/dts/bindings/pwm/pwm-controller.yaml
> >>> [2] https://github.com/zephyrproject-rtos/zephyr/blob/main/dts/bindings/pwm/pwm-controller.yaml
> >>> [3] https://elixir.bootlin.com/linux/v7.0-rc7/source/Documentation/devicetree/bindings/pwm/pwm.yaml
> >>>     
> >>>>
> >>>>
> >>>> These can be found here: https://github.com/dgibson/dtc/blob/main/checks.c#L1498 this is relevant for https://github.com/zephyrproject-rtos/zephyr/issues/107066    
> >>>
> >>> Examples provided in the zephyrproject issue link are, in my opinion, incorrect.
> >>>
> >>>  Case 1:
> >>>  / {
> >>>      node1 {
> >>>           pwms = <1 &pwm0 1 20 PWM_POLARITY_NORMAL>;
> >>>
> >>>           Here the first cell '1' is not a phandle.    
> >>
> >> Here the compiler is making an assumption here that all `pwms` properties must be specifier properties and all use `pwm` specifier.  
> > 
> > I think the purpose of 'select: true' is to have the binding always applied:
> >   https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pwm/pwm-consumer.yaml#L15
> > 
> > If this is confirmed, DTC performs correct checks as this binding must always
> > be applied and so the 'pwms' property must be a phandle-array property.
> > 
> > Device-tree maintainers, can you confirm the purpose of 'select: true' set
> > in a DT binding ?  
> 
> The quoted parts were mentioning Zephyr. Here you mentioned DTC, but ask
> about "select: true", so dtschema. I don't get the context... dtschema
> has nothing to do with DTC and Zephyr.

I wanted be sure about checks done by DTC itself.

My feeling was that if a binding defined in dtschema has to be always applied
(i.e. select: true) it is a legit case to have DTC performing some checks
according to this binding.

Kyle seems to define the 'pwms' property to be something other than a phandle.
IMHO, this is wrong but the 'pwms' property is only defined in dtschema.

Best regards,
Hervé
