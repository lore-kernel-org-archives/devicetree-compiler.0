Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B40D35F61E;
	Mon, 13 Apr 2026 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074277; cv=none; b=FqC0VjOzS9UFQKFEytVu6kjUcizDLXyB+fW0/2Lb64py3X/xBPL8pTYUpywDo+lLT9SZHAxi0mQQCSlFWlVxbc5Q8aUxr3RCJM1enKaFnA0U6hlbDHlD3ZCI2yAbFuMJWvXVttZnP+OH2XE2BKqeQqzASn/avuGrqwpdYTrc6X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074277; c=relaxed/simple;
	bh=u8pW0OHScrfGhZlo/ilIrloF2yrBdlyj3/aTpLJlBPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OaqWo5P/wQImdZnoAOmxhGN8Yg3JPAhSLzrpsN6rnNPvq9EEFkAguzq/cmwjnU7lnwlONWsfCPKuP56oY1oM4L8Sv/CUbsJVGrUoAPa0JwmdDkYuRYPr17gxkLKRNBlSpueL0+Z3yOkrMRUJbQqGM8ybFpv4Ns/X/XbNFCYG/no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfbzzM+g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfbzzM+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D65C2BCAF;
	Mon, 13 Apr 2026 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776074276;
	bh=u8pW0OHScrfGhZlo/ilIrloF2yrBdlyj3/aTpLJlBPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QfbzzM+ghyEGZv0NK+9vVglEfc6eD2Zylvks05eAz6c5NwHcV1X1YFmAWxYWtqVeU
	 OFgEyNJ7Me26YUdU97PU3xX9tH6f6ZfEN7/xB6mahYY+2zkAPaXYwRBvskh2N46ERb
	 2//51VztFNjbiQ+qMFrM4r0qxHBwqi/M/Wu+e8QX4CTodZMnv1XYIBXXxjOc5B9adt
	 z4ZzCc6SaWzzw4ga8GPtjUqYUhBjvRY5fEUJMczdVx7TUmOTXf+cfBEPsW0rZuloIM
	 KgU8/FaPO6F+DYUypZkYeVdYyqI/PGFut3ZonmUxEertuyYPMAFq7JpIw24j1w2fjs
	 QtJMv2c/RyyXA==
Message-ID: <c0b93231-9337-42f9-83c3-e657e5f017ec@kernel.org>
Date: Mon, 13 Apr 2026 11:57:53 +0200
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Phandles
To: Kyle Bonnici <kylebonnici@hotmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
 "devicetree-compiler@vger.kernel.org" <devicetree-compiler@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <BB363BC4-B813-4D03-8737-587DF7425908@hotmail.com>
 <20260412145144.4737fde6@bootlin.com>
 <D22046DB-95B3-431E-8E80-0BA806811D01@hotmail.com>
 <20260412173916.7a971a45@bootlin.com>
 <163D807F-0F83-4282-B182-7A18B124D3E6@hotmail.com>
 <00f0d18e-feba-45cd-af92-f737c9b965ef@kernel.org>
 <7F2DF84C-A010-4BCB-B973-D17BF58EDCF2@hotmail.com>
 <e3b4c7c4-64cd-494c-b2c5-fa71a7303038@kernel.org>
 <74FB5D90-08F5-422E-9DB2-A00E74E25422@hotmail.com>
 <c0983f3d-5025-4933-ac22-bfbc1adc6c31@kernel.org>
 <DB5F7CA0-08E8-4CF5-9815-598002AF471F@hotmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DB5F7CA0-08E8-4CF5-9815-598002AF471F@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/04/2026 11:50, Kyle Bonnici wrote:
> 
>> You cannot have random values. I quoted the DT spec.
> 
> Where in the DTS 0.4 spec are property names such as  pwms, clocks
>  etc… mandated to be of format <phandle cell …>?

Ah, true, this is not expressed but DT spec defines types for only a few
cases.

> 
>> Well, we don't use discord but IRC... but that github issue also uses
>> "pwms = <1 &pwm0 1 20 PWM_POLARITY_NORMAL>;"
>>
>> So again - what is "1"?
>>
>> I am asking because if you use incorrect value as phandle value, then
>> DTC warning is obviously expected and nothing to fix here.
> 
> The warning is only valid if ‘1’  is expected to be a phandle which is what I am
> Arguing the spec does not mandate this.

The "&foo" used in the property defines that it is phandle, no?

> 
>> You asked why phandle has to be the first entry in phandle-value type? I
>> responded that DT spec makes it.
> 
> Which section in DTS 0.4 spec?

2.2.4.2. Property Values
"That number is used for the value of properties with a phandle value type.

The properties having phandle value must have proper, well, value :)

> 
>> We discuss DTC here, yes? Whether it has or has not a bug? Please help
>> me to understand the topic. Why would we care about Zephyr's
>> implementation? It's Zephyr's problem and I am not a Zephyr developer. I
>> am not saying that it is not important, just saying that I am not the
>> audience to discuss it.
> 
> I am arguing that the DTC Spec 0.4 does NOT mandate any of these any of these
> “cooling_device”, “dmas”, “hwlocks”, “io_channels”, “iommus”, “mboxes”, 
> “msi_parent”, “mux_controls”, “phys”, “power_domains”, “pwms”, “resets”, 
> “clocks”,  “sound_dai” and “thermal_sensors” 
> must follow <phandle cell …>. 
> 
> This is only mandated by the dt-schema as far as I understand, that is a used by 
> Linux, but not Zephyr and the DTC Making the assumption that this is true for 
> all systems

No, dtschema is irrelevant here and DTC was validating it since 2017, so
years before dtschema.

DT spec indeed does not mandate it as pwms, but replacing that check in
DTC with something only validating phandles would not solve your
problem. Your 'pwm' is a phandle-value type, because you use phandle
there, and still is has wrong value.

Best regards,
Krzysztof
