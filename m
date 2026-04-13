Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3A523A561;
	Mon, 13 Apr 2026 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066923; cv=none; b=UlvoeY0rMxJWYoRtgoy5w62Jx/QdABlnPjwh5aM334OI+XM1JLKlgWIA+uuhTDImTuiccDpnf4Dc6T3Jnhvi5hYqSNqetuizHVXMnvrSQ/xJiOPuxk2ujka8nAR8EgqdfqrEnea8WRQavv47CZUGY5JlncSW2MJOIHcy/lHXAIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066923; c=relaxed/simple;
	bh=840RSZ2FSSDRfUYPBePwdvs6m9GhveHCdOY9Q5ghh+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhlM2/Ve3krDHew7nd6SecQQwPNhVs5nv1YRgcfjjks+MXWh+DYVzGBDDfEpOhTVlO6kesZFhAhxH70y25mFU+zGt8nIpX0VmBY3A0AQxn5Sr4bkk9HI077uitg9BoPXS0F2Lbo4/TYe9trEjG0/njrMdDGXL9MQ4cVo0g0sJG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfUbH7hn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfUbH7hn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BE8C116C6;
	Mon, 13 Apr 2026 07:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776066922;
	bh=840RSZ2FSSDRfUYPBePwdvs6m9GhveHCdOY9Q5ghh+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dfUbH7hnSl8rJjF4/RaB/rfjVzQL4930kNf9WwQlptfjZFgrKnFAXNfuhRMklXYrf
	 itp93fUxRBB+AtoI+wDZ8lbZXAPvUz9+pvgYxtAq/Wn/SNyKzq4JwnD8mCQ66OfwyE
	 6tbCWldCyrY8iZiaWhs7xeaTPqFiF5SBf8Bn3tC1aIJRvBV8D8svP7Rj5fbK8XDw+y
	 0LX+Bc6vhj2FD1M9NQ34QGACe8fNb6IWRBdzwsRluC18KeaGoen8bQr6DsIU5w9y5J
	 ijskCUKRDSrpxWW/qwqJKP5r9MJRb3KzdRPSrss49dJfgtZ80NT9odekVrRWKy2TtC
	 +8wF0i96onYBA==
Message-ID: <e3b4c7c4-64cd-494c-b2c5-fa71a7303038@kernel.org>
Date: Mon, 13 Apr 2026 09:55:19 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <7F2DF84C-A010-4BCB-B973-D17BF58EDCF2@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/04/2026 09:10, Kyle Bonnici wrote:
> 
> 
>> On 13 Apr 2026, at 08:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 12/04/2026 18:37, Kyle Bonnici wrote:
>>>>>> Case 1:
>>>>>> / {
>>>>>>    node1 {
>>>>>>         pwms = <1 &pwm0 1 20 PWM_POLARITY_NORMAL>;
>>>>>>
>>>>>>         Here the first cell '1' is not a phandle.  
>>>>>
>>>>> Here the compiler is making an assumption here that all `pwms` properties must be specifier properties and all use `pwm` specifier.
>>>>
>>>> I think the purpose of 'select: true' is to have the binding always applied:
>>>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pwm/pwm-consumer.yaml#L15
>>>>
>>>
>>>
>>> I’m having trouble finding where the Devicetree Specification (v0.4) mandates that all binding systems must extend dt-schema. 
>>> Since this requirement isn't explicitly in the spec, it follows that the WARNING_PROPERTY_PHANDLE_CELLS validation belongs in dt-validate rather than within dtc itself.
>>
>>
>> So you want to have a property with values not being phandle? The spec
>> defines that properties like "pwm" must contain "value of properties
>> with a phandle value type". Therefore what does '1' represents in your
>> example?
> 
> I am just building and maintaining an LSP to assists Zephyr and Linux developers alike and what is technically
> allowed in Zephyr is not allowed in Linux. The issue here is that DTC is warning zephyr users about it. 

Please wrap your email responses to mailing list style.

> I also find my self in the wrong to enforce these types for Zephyr dts usage given all documentation I have seen 
> so far. 

To repeat my question:
What does '1' stand for?

Best regards,
Krzysztof
