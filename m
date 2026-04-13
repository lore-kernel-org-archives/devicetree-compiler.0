Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632917DA66;
	Mon, 13 Apr 2026 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776062033; cv=none; b=p6h0E5JiGW+7K+mq1DdSo8MC3jDRPK8xY1jR+YrtAR0zyv/Zl4qNZ38fx5eGlTkwe24reFy3mbwoh0apAitmbqNquDA4/Pa6V3FaWtwXNLvNg3l8Fs53SsaREFAvAeonvOLqejh3U9ru2nv1uYLYF7Ebk8HmwTNAUq0qwhCd0/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776062033; c=relaxed/simple;
	bh=cbZPdx/gHbRAyj94PZOO6f26UmM1RzHGZwCfNYE0LNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0gp6cM95akZCQuX7AiuzWsVfBoGtWJGW6pHLJjNWBnBoeARm9AqyluPu7gn2AJLfCJBOufYErFjK+5pdhNGgX9mJYg4Nxo3i6Ruy5Cv8N2beEDopSZJDN0bMuGSkdCbjskY6p34bPpspMrYHPOlrG2vB5nRRYAtmGprbYyGReM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XforbCwf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XforbCwf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE48C116C6;
	Mon, 13 Apr 2026 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776062033;
	bh=cbZPdx/gHbRAyj94PZOO6f26UmM1RzHGZwCfNYE0LNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XforbCwfC3/G1HnFCQABGvTr2W0Xin9jXFvxjvSYjOb9T0Qqs1zDqlWTHwjGiUuXm
	 ChMUMjzq5ddUeWA4DildmGULbxZOvBnqWUqJ1rJwP6eufQJtyxHZjXm/N5BtlTlR8W
	 ie7GSENyClp75k+W3baAhi0BZRaav+Jo3OC9HRkOXOSaT1gSFKsWKh97ztQysm5TTZ
	 0BVADSf4/pDsRPBBG51/QKIT8s7FZb2oFwXkEpZ6rkUC+xtmqqXWKGfKtggWT/N+PF
	 b4oF/tDV/gBTFkYKrDytFODhz2THHMDsermX+ukZhW4QTfQsOJTi+vpFKOm5QdO6tj
	 4OqJBYNdKvHyg==
Message-ID: <72dc4a71-1a3d-4e36-9bcc-d9a4de3de6cc@kernel.org>
Date: Mon, 13 Apr 2026 08:33:49 +0200
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Phandles
To: Herve Codina <herve.codina@bootlin.com>,
 Kyle Bonnici <kylebonnici@hotmail.com>
Cc: "devicetree-compiler@vger.kernel.org"
 <devicetree-compiler@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
 <20260412145144.4737fde6@bootlin.com>
 <D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
 <20260412173916.7a971a45@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260412173916.7a971a45@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/04/2026 17:40, Herve Codina wrote:
> Hi Kyle,
> 
> +Cc Kernel device-tree maintainers
> 
> On Sun, 12 Apr 2026 13:51:35 +0000
> Kyle Bonnici <kylebonnici@hotmail.com> wrote:
> 
>>> On 12 Apr 2026, at 14:51, Herve Codina <herve.codina@bootlin.com> wrote:
>>>
>>> Hi Kyle,
>>>
>>> On Sat, 11 Apr 2026 18:33:33 +0000
>>> Kyle Bonnici <kylebonnici@hotmail.com> wrote:
>>>   
>>>> Hi
>>>>
>>>> I have been looking at the the code for the compiler and I am wondering which specifications marks the below properties MUST BE Nexus Properties hence the validation.
>>>>
>>>> WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#cooling-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(dmas, "dmas", "#dma-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(hwlocks, "hwlocks", "#hwlock-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(interrupts_extended, "interrupts-extended", "#interrupt-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(io_channels, "io-channels", "#io-channel-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(iommus, "iommus", "#iommu-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(mboxes, "mboxes", "#mbox-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(msi_parent, "msi-parent", "#msi-cells", true);
>>>> WARNING_PROPERTY_PHANDLE_CELLS(mux_controls, "mux-controls", "#mux-control-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(phys, "phys", "#phy-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(power_domains, "power-domains", "#power-domain-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(pwms, "pwms", "#pwm-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(resets, "resets", "#reset-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(sound_dai, "sound-dai", "#sound-dai-cells");
>>>> WARNING_PROPERTY_PHANDLE_CELLS(thermal_sensors, "thermal-sensors", "#thermal-sensor-cells");  
>>>
>>> All of those properties are defined as phandles.
>>>
>>> For instance, the 'pwms' property available in a node means the the node is
>>> a pwm consumer. It must follow the pwm consumer binding [1] and so a phandle
>>> is involved.
>>>
>>> This phandle can have arguments and the number of argument is defined by the
>>> #pwm-cells property set in the pwm provider node [2], [3].
>>>
>>> [1] https://elixir.bootlin.com/zephyr/v4.4.0-rc3/source/dts/bindings/pwm/pwm-controller.yaml
>>> [2] https://github.com/zephyrproject-rtos/zephyr/blob/main/dts/bindings/pwm/pwm-controller.yaml
>>> [3] https://elixir.bootlin.com/linux/v7.0-rc7/source/Documentation/devicetree/bindings/pwm/pwm.yaml
>>>   
>>>>
>>>>
>>>> These can be found here: https://github.com/dgibson/dtc/blob/main/checks.c#L1498 this is relevant for https://github.com/zephyrproject-rtos/zephyr/issues/107066  
>>>
>>> Examples provided in the zephyrproject issue link are, in my opinion, incorrect.
>>>
>>>  Case 1:
>>>  / {
>>>      node1 {
>>>           pwms = <1 &pwm0 1 20 PWM_POLARITY_NORMAL>;
>>>
>>>           Here the first cell '1' is not a phandle.  
>>
>> Here the compiler is making an assumption here that all `pwms` properties must be specifier properties and all use `pwm` specifier.
> 
> I think the purpose of 'select: true' is to have the binding always applied:
>   https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pwm/pwm-consumer.yaml#L15
> 
> If this is confirmed, DTC performs correct checks as this binding must always
> be applied and so the 'pwms' property must be a phandle-array property.
> 
> Device-tree maintainers, can you confirm the purpose of 'select: true' set
> in a DT binding ?

The quoted parts were mentioning Zephyr. Here you mentioned DTC, but ask
about "select: true", so dtschema. I don't get the context... dtschema
has nothing to do with DTC and Zephyr.

Best regards,
Krzysztof
