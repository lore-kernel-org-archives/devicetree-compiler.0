Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6487238D
	for <devicetree-compiler@vger.kernel.org>; Sun, 12 Apr 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775998318; cv=none; b=GfQQTmaq1u2qgB0X/AoLP3TD6BJrf9NQ22c153rmhhzJLSmnpCExrYTfEGoZYGJDSEAiK51WNdic3W+eCBe0IQgUCFMMatDLdDq3csfq1ybVEdr5Jen7c1GRiECXr5AsaCWLatPN95qRuMJwi7GTI4bvwCbTa9x8wcqUuy88E68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775998318; c=relaxed/simple;
	bh=t59OVgtgybCuCnJaxlY/w39kLy4Y7SerRSz265isrAg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F5dpHrFClN+YLyMMYawzEo3l2zEe+glJZH8DrPtgYGQPH9URPRJ6bKHyuJQlecpFAB4elUt7TameHQBeRYzFHtdLdTRklAs0cKAKl+/2ok280F01KR5/E3qS7Kn3F4IHnWsPyhWtcRtvXSoq5CFS4i11b8QC8yhzeDvN5vTFSRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f3Jn0ecR; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f3Jn0ecR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 55B74C5B188
	for <devicetree-compiler@vger.kernel.org>; Sun, 12 Apr 2026 12:52:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 162395FFB9;
	Sun, 12 Apr 2026 12:51:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA76F10450084;
	Sun, 12 Apr 2026 14:51:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775998306; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8HHQtRiKpFNi87DFL/1qyqraUxy6AhgW16UzYL9bSpM=;
	b=f3Jn0ecRLJ7XApJRSBnb2bOfACdfSf31RGlC/ddGIfo9cZaPaesZmf/ABUcnZEHGovWNUX
	OP2NFyWZ8/ZL+j0qLHdsXeG33zIts3lDlrN8EuhczHn6V1w7TNP4x2AqnoRbuSvx5jKh5z
	rzoFiAEsJlnKzwZIMBG+gix7jS/3qFF1U3fFxa9wClbR63edPlkP4vV8lc16633UyTnfoX
	MSwWx9lgxD+nV8dB9x12lESvPrBXwhZBMR0wY6fba4zzzHwFbcYuI/rX6pBC2RGawF2jKk
	zYBOElQyvc7PqznMqW0XrNrOAjhoKZ8X52A4IdXL2HPmNDb6tUbLLD7+tfkZ7g==
Date: Sun, 12 Apr 2026 14:51:44 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Kyle Bonnici <kylebonnici@hotmail.com>
Cc: "devicetree-compiler@vger.kernel.org"
 <devicetree-compiler@vger.kernel.org>
Subject: Re: Phandles
Message-ID: <20260412145144.4737fde6@bootlin.com>
In-Reply-To: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
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

On Sat, 11 Apr 2026 18:33:33 +0000
Kyle Bonnici <kylebonnici@hotmail.com> wrote:

> Hi
> 
> I have been looking at the the code for the compiler and I am wondering which specifications marks the below properties MUST BE Nexus Properties hence the validation.
> 
> WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#cooling-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(dmas, "dmas", "#dma-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(hwlocks, "hwlocks", "#hwlock-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(interrupts_extended, "interrupts-extended", "#interrupt-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(io_channels, "io-channels", "#io-channel-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(iommus, "iommus", "#iommu-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(mboxes, "mboxes", "#mbox-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(msi_parent, "msi-parent", "#msi-cells", true);
> WARNING_PROPERTY_PHANDLE_CELLS(mux_controls, "mux-controls", "#mux-control-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(phys, "phys", "#phy-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(power_domains, "power-domains", "#power-domain-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(pwms, "pwms", "#pwm-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(resets, "resets", "#reset-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(sound_dai, "sound-dai", "#sound-dai-cells");
> WARNING_PROPERTY_PHANDLE_CELLS(thermal_sensors, "thermal-sensors", "#thermal-sensor-cells");

All of those properties are defined as phandles.

For instance, the 'pwms' property available in a node means the the node is
a pwm consumer. It must follow the pwm consumer binding [1] and so a phandle
is involved.

This phandle can have arguments and the number of argument is defined by the
#pwm-cells property set in the pwm provider node [2], [3].

[1] https://elixir.bootlin.com/zephyr/v4.4.0-rc3/source/dts/bindings/pwm/pwm-controller.yaml
[2] https://github.com/zephyrproject-rtos/zephyr/blob/main/dts/bindings/pwm/pwm-controller.yaml
[3] https://elixir.bootlin.com/linux/v7.0-rc7/source/Documentation/devicetree/bindings/pwm/pwm.yaml

> 
> 
> These can be found here: https://github.com/dgibson/dtc/blob/main/checks.c#L1498 this is relevant for https://github.com/zephyrproject-rtos/zephyr/issues/107066

Examples provided in the zephyrproject issue link are, in my opinion, incorrect.

  Case 1:
  / {
      node1 {
           pwms = <1 &pwm0 1 20 PWM_POLARITY_NORMAL>;

           Here the first cell '1' is not a phandle.

      };

      node2 {
          pwms = <&pwm0 1 20>;

          Here 2 arguments. The node referenced by &pwm0 must indicated the
          number of argument to provide. I.e it must have a #pwm-cells$
          property set.

          According to your example, this property must be #pwm-cells= <2>;
          

      };

      node3 {
          pwms = <1 &pwm0 1 20 PWM_POLARITY_NORMAL>;

          Here also, '1', the first cell, is not a phandle.
      };
  };

  Case 2:

  / {
      foobar {
          pwms = <1 2 3 4 5>;

          Random values. Error detected by DTC.

      };
  };

  Case 3:

  / {
      zephyr,user {
          pwms = <1  20 1>;
    
          Here also the phandle is missing.
      };
  };


If you want to use Nexus node on top of that, you can have a look at the
following example:
  https://elixir.bootlin.com/linux/v7.0-rc7/source/Documentation/devicetree/bindings/pwm/pwm-nexus-node.yaml

In the example, you will find the consumer, the nexus node and the pwm
providers.

Not sure to have fully understood your issue but I hope my comments help.

Best regards,
Hervé
