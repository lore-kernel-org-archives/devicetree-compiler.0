Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55D1ABED9
	for <devicetree-compiler@vger.kernel.org>; Sun, 12 Apr 2026 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776008407; cv=none; b=DfQTwPP6MMuFYrOw2INPhKDe85eGFnIZYFyjAihIBAnFQh9ecy9V9rSio6OuMjnFqfsOX4JJ12bvRPXLGk0RoDNY7H8tFb9gyN2IIswCE/OpMDCWpQITWi6Uu1Qf4zBACcnkFlRSCBlg3apvfWA91EotiNVUEWcEp8KTnnzAtiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776008407; c=relaxed/simple;
	bh=u41TX8cclHQaEIWsPGpvvV6rWGXz/ZN1AEH1kfPgIic=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WHqAh6zl/ButvNgpsbdSenul1mFYvV/CwHRr1nLbikNyfmR2AzCxDaBnKLskSwkecMLbxuHHZTvIl1eKjEVHBxNkIHFgLiZ7IyGsLrwKHCZpL5Iab6ojs9ikT4r990T8Cq0HDYNQxA0WHqtDllksFzzLFr5APmm8BImwoo7A3fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R/4eHF0u; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R/4eHF0u"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 08A211A31D8;
	Sun, 12 Apr 2026 15:40:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B73705FFB9;
	Sun, 12 Apr 2026 15:40:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7ACDA10450205;
	Sun, 12 Apr 2026 17:40:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776008402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dJRi3G08EotndWb5PLTNZCDsFkZ8CfeE8f3gT2OHZrw=;
	b=R/4eHF0urgb6Li7+kegjuFaoLnNbEr25/AR9mH2NzoEdOUgtbBzbJdgJUqXbZM4jx/h7K7
	KCbDNfZfEPsA9fm3RR+ha6rDw1QtkLi3O/Q2QTMyI9kfQxhCg/JnYowZlQ4xBIL+GfzIE/
	U4g4S44LrQ6h637Q9QBeJKSKz7G2jmfV+jNN8yv5Fmt3ne1q5id26a8NCY1a0vD39aK3BY
	qn8wcUM3XxonYarbvifqNrQxac7TzOKxgpKTgbAS6KcLCJPnz+sdqpMjflk6bC2om4UFmj
	rgnU2scqvtjUMfa/Fh1kpbZR+sNhVITHFrFVNdm0Cig4/2pn925+zbVu4M0sQA==
Date: Sun, 12 Apr 2026 17:40:00 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Kyle Bonnici <kylebonnici@hotmail.com>
Cc: "devicetree-compiler@vger.kernel.org"
 <devicetree-compiler@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: Phandles
Message-ID: <20260412173916.7a971a45@bootlin.com>
In-Reply-To: <D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
	<20260412145144.4737fde6@bootlin.com>
	<D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
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

Hi Kyle,

+Cc Kernel device-tree maintainers

On Sun, 12 Apr 2026 13:51:35 +0000
Kyle Bonnici <kylebonnici@hotmail.com> wrote:

> > On 12 Apr 2026, at 14:51, Herve Codina <herve.codina@bootlin.com> wrote:
> > 
> > Hi Kyle,
> > 
> > On Sat, 11 Apr 2026 18:33:33 +0000
> > Kyle Bonnici <kylebonnici@hotmail.com> wrote:
> >   
> >> Hi
> >> 
> >> I have been looking at the the code for the compiler and I am wondering which specifications marks the below properties MUST BE Nexus Properties hence the validation.
> >> 
> >> WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#cooling-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(dmas, "dmas", "#dma-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(hwlocks, "hwlocks", "#hwlock-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(interrupts_extended, "interrupts-extended", "#interrupt-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(io_channels, "io-channels", "#io-channel-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(iommus, "iommus", "#iommu-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(mboxes, "mboxes", "#mbox-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(msi_parent, "msi-parent", "#msi-cells", true);
> >> WARNING_PROPERTY_PHANDLE_CELLS(mux_controls, "mux-controls", "#mux-control-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(phys, "phys", "#phy-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(power_domains, "power-domains", "#power-domain-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(pwms, "pwms", "#pwm-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(resets, "resets", "#reset-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(sound_dai, "sound-dai", "#sound-dai-cells");
> >> WARNING_PROPERTY_PHANDLE_CELLS(thermal_sensors, "thermal-sensors", "#thermal-sensor-cells");  
> > 
> > All of those properties are defined as phandles.
> > 
> > For instance, the 'pwms' property available in a node means the the node is
> > a pwm consumer. It must follow the pwm consumer binding [1] and so a phandle
> > is involved.
> > 
> > This phandle can have arguments and the number of argument is defined by the
> > #pwm-cells property set in the pwm provider node [2], [3].
> > 
> > [1] https://elixir.bootlin.com/zephyr/v4.4.0-rc3/source/dts/bindings/pwm/pwm-controller.yaml
> > [2] https://github.com/zephyrproject-rtos/zephyr/blob/main/dts/bindings/pwm/pwm-controller.yaml
> > [3] https://elixir.bootlin.com/linux/v7.0-rc7/source/Documentation/devicetree/bindings/pwm/pwm.yaml
> >   
> >> 
> >> 
> >> These can be found here: https://github.com/dgibson/dtc/blob/main/checks.c#L1498 this is relevant for https://github.com/zephyrproject-rtos/zephyr/issues/107066  
> > 
> > Examples provided in the zephyrproject issue link are, in my opinion, incorrect.
> > 
> >  Case 1:
> >  / {
> >      node1 {
> >           pwms = <1 &pwm0 1 20 PWM_POLARITY_NORMAL>;
> > 
> >           Here the first cell '1' is not a phandle.  
> 
> Here the compiler is making an assumption here that all `pwms` properties must be specifier properties and all use `pwm` specifier.

I think the purpose of 'select: true' is to have the binding always applied:
  https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pwm/pwm-consumer.yaml#L15

If this is confirmed, DTC performs correct checks as this binding must always
be applied and so the 'pwms' property must be a phandle-array property.

Device-tree maintainers, can you confirm the purpose of 'select: true' set
in a DT binding ?

Best regards,
Hervé
