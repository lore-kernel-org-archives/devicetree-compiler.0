Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFE0194A65
	for <devicetree-compiler@vger.kernel.org>; Sun, 17 Aug 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755418745; cv=none; b=PQbVIJdkiXOEtcYwoVnbAs+mafqtAyb5/l+1ZrNQCSKGNfm30Ugq6HGTtdFKTA0Rl9OII0KeV7mmuwSQgpqEKCP0Y+9tA/DySSg0GxNc15GHqiOIZdZON68O1l+TkZJQU20qj5qIjfqXFbWfxjNh/PGkZWkFGP1sVuthPHNuPXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755418745; c=relaxed/simple;
	bh=ERv63eQ4anOeoX9isrKyL+s93JtTU+ncBsWxJDWgpfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSDOyKJD3Fc9+yoXnLOOgeRlqcsAn9O5B5KcHYYnGhOBU9i5+dVpUkucBdBTJBlISNMTBP73eK7bl5gxL8cckofHW8A8EYRtB1ZOV1XgaZsl9bNwaD3e+zHRvImz+NJR4a3kjTI3mx3A2fuiRy68g7fhrK5O+f9nolypYDc3lj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=1r2QdUoZ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="1r2QdUoZ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e39ec6e05so1781006b3a.2
        for <devicetree-compiler@vger.kernel.org>; Sun, 17 Aug 2025 01:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1755418743; x=1756023543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QpbDSFzWLLyr/AuKOxQCJ6ZGLOQmyLXqxcfhFiFe8fA=;
        b=1r2QdUoZrq9ilDVp+nSW93y7MDbtlox62N4P+Zm9jaQL853XxUhEYcXq6dFN+trVIV
         F2LTbR94C1IB6BkuZKXwZruMBn6vFR5r27uKxDYqZHwMTxXFiHf8aEt6LIK82ZoKMRbg
         LGZ9u5wlzZqH2dFdvi+j/Os1NSpiMWA+B22KOc5/5r9wxFDX6wkrKdkq0onU6q49iWSJ
         gomNINi4d4J+wF/oXKi5Z3SzhlFcdI0Pey+TobnOFQ8GGf0eENSdYuCsI84K6U4Ubtmm
         3qZLthK8NOYWErnBaZtdkjwH4S7vpMNH7gmaujVnvnZ06AIlQnxp2oYoqOniCKoICEw5
         wBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755418743; x=1756023543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpbDSFzWLLyr/AuKOxQCJ6ZGLOQmyLXqxcfhFiFe8fA=;
        b=On8Yw6caHJ4ZFnpss3xJkLngbO5QqAynjymv2Z/nVvv8IFpYSFJSngz8n+cLpb21nF
         eKgmPj3uf0zHQ6sT9HQJCnu2UjXJBvLhahui5PoVxS8k1atKS0fN+ttxnmiDqr7dBkI3
         cLFX/E66vCVEZK6KKacRHe2OOz22MjUaf8pDK6Qf+XmwYZNvQhSitytuyHy8KtbmxqKY
         8yanLUGRIjaYvdynLmdTrpGTfklqk8msDKpPNVxmMbfCXCNC/qgyk8MIdZ9ScI0wQFHY
         qwFyys4c/lq3Pj3fe941vSl5tF5dV0wYbhiJqYCbtWW++zV1/CHj7SRSXI2SiVT0Qf/8
         Qj+w==
X-Forwarded-Encrypted: i=1; AJvYcCVRdfMTaqmGuaSfvhZ1hMjpCDjVUzzfVNm/IGA34kLpwKjs8WWE20dGdzVVx1o6YpOMVh30kq58or/8XdppACokmQHM@vger.kernel.org
X-Gm-Message-State: AOJu0YyfJ5LT9742C59R6lZ+ud1scytRakMPZxyTrdDeYHbp8o6htxHw
	uXSeq8qbGtwJmkN5KhCxS3+q2r6fGCV2uOGON69GCBnrw2TknvN1VTJ+xdJHu5CQLg==
X-Gm-Gg: ASbGncuzrLvYz7xBXTeeFoUc5uZIw2tIn/ho4EZIa0HGJbVlGEAj/ZR4HRt74kwSQc5
	Zn8WnuI2QWgV7xwcmUWNP1grPFIK3hZu/tZE0N6JTxfHlz4Xksy5YSqY9SWUJdc9YymyDUhm5rN
	/dYX2nnA65H1CYuKCdQ9BK9Mvtbofh8WTZEG77iPf6agZqoiKeMgzm2xwhxTNO3EPDnvIieTvxq
	VWAZxbC+hPOxJTMKVGSXlokNF/C6d/bo17iOjJupbD3uYHa3RyEQWXLjgcq/MsNGWwRkXBUnwEK
	fRUztt/gbbTS9t/f/UBQyTwF7lj0zvyff2S601JEkeJ7Ricy8+CEBBX8H7JRqgyyGmPadIoXaO1
	FQmRty2nckScOCd7/oXDnZX4DyJscrNLtodwo4zCpiQn4lCE0RWH/elbFSixIN3iqzwY1QZil4Y
	Y=
X-Google-Smtp-Source: AGHT+IFk4cmzZ8knzcqGryjCtqznGVp8ByCefDXiUvBioI5V9GMWllGRO8DUMkd+5bQJOnP1RdocGQ==
X-Received: by 2002:a17:903:11c4:b0:235:ef67:b5a0 with SMTP id d9443c01a7336-2446d87ff2dmr102780345ad.36.1755418743203;
        Sun, 17 Aug 2025 01:19:03 -0700 (PDT)
Received: from ?IPV6:2401:4900:8898:f586:e00d:52f9:31de:96d4? ([2401:4900:8898:f586:e00d:52f9:31de:96d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5a3f2fsm49778445ad.166.2025.08.17.01.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 01:19:02 -0700 (PDT)
Message-ID: <3889e19e-7f1e-4306-9e11-77a61432b402@beagleboard.org>
Date: Sun, 17 Aug 2025 13:48:52 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: Add support for export-symbols node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 devicetree-compiler@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
 <20250430125154.195498-2-herve.codina@bootlin.com>
 <0770a47e-fd2f-4b6f-9a9a-b0d539ace30c@kernel.org>
 <20250528185740.4bf91bef@bootlin.com>
 <49e1e1fc-412d-4334-8337-16e352a34788@kernel.org>
 <20250618113232.6d237208@bootlin.com>
 <ed6beb97-12f1-4d71-b4dc-b34d4d611b81@beagleboard.org>
 <3ff4b3f9-cc8d-4044-b2eb-33010d8951c0@kernel.org>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <3ff4b3f9-cc8d-4044-b2eb-33010d8951c0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/17/25 13:11, Krzysztof Kozlowski wrote:

> On 18/06/2025 11:54, Ayush Singh wrote:
>> On 6/18/25 15:02, Herve Codina wrote:
>>> Hi Krzysztof,
>>>
>>> On Wed, 4 Jun 2025 20:35:51 +0200
>>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> ...
>>>
>>>>> Symbols are exported only when an overlay is applied on the node where the
>>>>> export-symbols node is available. Those symbols are visible only from the
>>>>> overlay applied. Symbols exported thanks to export-symbols are not global
>>>>> to the all device-tree (it is not __symbols__) but local to a node.
>>>>>
>>>>> If an overlay is applied at connector1 node, it can use the 'connector'
>>>>> symbols and thanks to export-symbols, the 'connector' symbol will be
>>>>> resolved to foo_connector.
>>>>>
>>>>> If the overlay is applied at connector2 node, the 'connector' symbol is then
>>>>> resolved to bar_connector.
>>>> OK, this explains a lot. Unless I missed it, would be nice to include it
>>>> in binding description.
>>> Sure, I will add something in the next iteration.
>>>
>>> ...
>>>
>>>>>>> +patternProperties:
>>>>>>> +  "^[a-zA-Z_]?[a-zA-Z0-9_]*$":
>>>>>> This messes up with coding style which I would prefer keep intact.
>>>>>> Basically these properties will be using label style.
>>>>> Yes, those properties remap phandles.
>>>>>
>>>>> Their names are the name of the label used from the overlay and their
>>>>> values are the phandle mapped.
>>>>>
>>>>> You already have this kind properties using label style in __symbols__,
>>>>> __fixups__, __local_fixups__ nodes.
>>>> I have them in DTB, but I don't have these in DTS. The exported-symbols
>>>> would be in the DTS and that is what coding style is about.
>>>>
>>> I think export-symbols has to be in DTS.
>>> Maybe it could be described in an other way in order to avoid the coding style
>>> issue you reported.
>>>
>>> Hardware:
>>>     i2c0 from SoC --------- connector 1, I2C A signals
>>>     i2c1 from SoC --------- connector 1, I2C B signals
>>>
>>>     connector1 {
>>>         export-symbols {
>>> 	  i2c_a = <&i2c0>;
>>> 	  i2c_b = <&i2c1>;
>>>         };
>>>     };
>>>
>>> In order to avoid the coding style issue, this could be replace
>>> with:
>>>    connector1 {
>>>         export-symbols {
>>> 	  symbol-names = "i2c_a", "i2c_b";
>>> 	  symbols = <&i2c0>, <&i2c1>;
>>>         };
>>>     };
>>>
>>> Krzysztof, Rob, do you think this could be accepted ?
>>>
>>> Ayush, David, do you thing this could be easily implemented in fdtoverlay ?
>>>
>>> Best regards,
>>> Hervé
>>>
>> Well, it is possible.
>>
>> However, on connectors like pb2 header, there will be 50-100 export
>> symbols. So it will start becoming difficult to maintain.
>
> And the first syntax solves this how? I don't see the practical difference.


Well, I was more worried about matching which phandle belongs to which 
symbol easily. Let us assume that 2 symbols will be in each line (after 
accounting for the indention and 80 char limit) and we have 70 symbols, 
so 35 lines. To check which phandle belongs to the 2nd symbol on line 
25th line of  symbol-names, well, you would at the best case need to 
have something like relative line numbers in your editor. Then you know 
that the 35th line from the current one is where you need to look.

In the current syntax, the symbol name and phandle are on the same line. 
So well, easy to see which symbols refers to which phandle.

>> Additionally, the further away we move from __symbols__ style, the more
>> difficult the implementation will become since we can currently very
>> easily piggy-back on __symbols__ resolution implementation.
>
> I care more how I read DTS, so complexity in dtc is less important to me
> than consistent DTS style.
>
> Best regards,
> Krzysztof
