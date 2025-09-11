Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F8F32142B
	for <devicetree-compiler@vger.kernel.org>; Thu, 11 Sep 2025 12:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757592927; cv=none; b=OeF/fxKkG6sPJvZYA2OYwl3QpLXUqxi9PhyYB6dk6awhd4xd7OKqJxz8JyvuevvJJa1uEUoxdyYvsyBwNRqhKYS3UyP7OCS78stjIvwfU1xaJtz0OJWj/D+/bYCJZMgESFhTCG5nMq5pMjnokm4Sk5+98ugg84goIsiMENe/4AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757592927; c=relaxed/simple;
	bh=/DNmTsKU2YQxjE0a0HP3UiiRHt/9KrkhYaTXKbwcjD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOnSBvLBSAetEyTG+FjIbqrvzC0ZHW/+SKc+u5sFn4zTNNDJYwh+xWPk03SCWWS6hkFZjiRbZeIYqlPqNjejF5SDm/mjO/sZhMoKDDML3Ab/TfA+PNGwVDSCbadm+jpxA0+ZEj+bUou06T6g8BhXX5mUis6uf7v+/0WVroq/Dws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=nwW6MrjD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="nwW6MrjD"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77459bc5d18so484783b3a.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 11 Sep 2025 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1757592924; x=1758197724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edkglS5aPIxkVAhweNonmsQnCtG5vsLjFWEbqDByJiU=;
        b=nwW6MrjD+OZJX6mH/V9OEhjahwKuEBid/hhioKIBczUzXovjuotueUhM9+UqOmHxI/
         +dV+octOWCOYH7Y7X1/NnFN/pkV4NpDuQlwajP8Rd9ytbtR+XNkjWf1HKeQoTppEvLE0
         8vnjfq9I8MlwDpw6C09neZZMEt7jXe6azbvPeqbiSDusdkHUcpGXSLd2Dp/f1l5kTCRT
         aPOUMXQx1vVmS6uxG4Qic7HQt1Fm5kDtM5rGmJF6ovRYjmm/o+Xi9eNlWaHajKKWrtSw
         yH5ic5BQDLb3LgRIFSnoS1uZ7uqa6LxMiSD66PHM1CjTmbbsfFzk67Wb5/cOOu5BxRWH
         +iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757592924; x=1758197724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edkglS5aPIxkVAhweNonmsQnCtG5vsLjFWEbqDByJiU=;
        b=SnMcAE2wN/zKelAYlpG15UBflYHhmjQuDb7+5KTMhCTM9K0M40ZC5fiVIJ1D9W97IU
         gAby8AifyCP5yfzUp3Rntsp4zqxTWMlMdEPZfnfwt0hX+JwBYQaPNaWonIAJ1s2puqNq
         jvvwX1s0CSpRePBw6FpTvV9eu3IszV11KmixzJj/ibMGGEaoc3Ns1gTUBvxpUs6tQ+q0
         fVNdDZF5zKAQY16N1W/znNseIZUbYfeodZfpVgW7FdT7O0emXtInuPix36aK1CZr5ZPg
         98tJjJWTZKSZSta8AG/fR+avuyqwMOHdCdd9ly7RahuXagOQLmPLlgHGEvTkrj+Z1PKK
         sYvA==
X-Forwarded-Encrypted: i=1; AJvYcCX4x7lRpYaPo7EUg8iyrCKWa9qJIxLmRD2pFkQwdFetTwYhnY7dJBe3Duycf0/i9dNfetemsg2hY/2TyruLOp/rXxui@vger.kernel.org
X-Gm-Message-State: AOJu0YxcyeX04lAErxPSWDGjcSkgrct5DbyEpC26r30q1MQ0qbNtAZzR
	x7hM9TF/Ffq7gkw62QUbp9SHLPVQ0a/M8xN+H9t4E0342RQlsiFQsQRm6pb8tinKBA==
X-Gm-Gg: ASbGncuoZNuUUMV3UYsVKM9+VBTzpIMPfuNu+3EqFg51HuHsVWVswGaYTfRg/am9MRG
	jANlcoJFrI0ptQKW8CasdoyiikZvQejrRGLhww/Vu7fA7lxSg2K6Ob7knzu6p9v7oZeQj5W7uSD
	q1HqSarr6A4bkU0zR4QaulTYr32U4oH/+3PUggwimopbrOskpCQcP102Fcya2HB7LDE4qwbLl/y
	U2popwq1aQ5WacUk4camWppzPyg8Hiq2mGkO3WmkZJK8ZpyttX6bf98QQKqLzJfGNpKW9Kss7cJ
	42aPq+Rv9WgDQ2pC5Sq3b6kjpRjv2Wi9ThDh63BCshF5wngOA7E/SxFXeU5IDumzXa2aLYc7SoQ
	t9AZ/ENgNA4kDnHoMkI+jIe+CkobhuDu4d7S2/uRgFLczuouc6ApgDMcYfRpi9z/WlR35SDU=
X-Google-Smtp-Source: AGHT+IFgOkdGq5x9NJ+zU1c1dBgNDsfTwSsAjnSI6VcIJfup8RDIJaGYOd3IR4zKYJVMBvEDdL+5xA==
X-Received: by 2002:a05:6a00:1acb:b0:772:43a9:d587 with SMTP id d2e1a72fcca58-7742ddf13cfmr19926689b3a.20.1757592924243;
        Thu, 11 Sep 2025 05:15:24 -0700 (PDT)
Received: from ?IPV6:2401:4900:8898:6c44:fc6:e0b:3bf0:1af0? ([2401:4900:8898:6c44:fc6:e0b:3bf0:1af0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b17acasm1957738b3a.58.2025.09.11.05.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 05:15:23 -0700 (PDT)
Message-ID: <36a85af7-75b1-46db-8df8-e83372d33b93@beagleboard.org>
Date: Thu, 11 Sep 2025 17:45:17 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Device tree representation of (hotplug) connectors: discussion at
 ELCE
To: Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jason Kridner <jkridner@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree-compiler@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Andrew Davis <afd@ti.com>
References: <20250902105710.00512c6d@booty> <aLkiNdGIXsogC6Rr@zatzit>
 <337281a8-77f9-4158-beef-ae0eda5000e4@beagleboard.org>
 <aL5dNtzwiinq_geg@zatzit> <20250908145155.4f130aec@bootlin.com>
 <aL-2fmYsbexEtpNp@zatzit> <20250909114126.219c57b8@bootlin.com>
 <aMD_qYx4ZEASD9A1@zatzit> <20250911104828.48ef2c0e@bootlin.com>
 <CAMuHMdUUGoaetdsTEVx27TYQZ_khzyCn0wzi2+TibYcvkg1fXw@mail.gmail.com>
 <20250911122333.2e25e208@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20250911122333.2e25e208@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/11/25 15:53, Herve Codina wrote:
> Hi Geert,
>
> On Thu, 11 Sep 2025 10:54:02 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
>> Hi Hervé,
>>
>> On Thu, 11 Sept 2025 at 10:48, Herve Codina <herve.codina@bootlin.com> wrote:
>>> On Wed, 10 Sep 2025 14:33:45 +1000
>>> David Gibson <david@gibson.dropbear.id.au> wrote:
>>>> On Tue, Sep 09, 2025 at 11:41:26AM +0200, Herve Codina wrote:
>>>>> Suppose a base board with 2 connectors:
>>>>>   - connA
>>>>>   - connB
>>>>>
>>>>> Case 1: Addons are independant
>>>>>                 +--------+
>>>>>    connA <----> | AddonA |
>>>>>                 +--------+
>>>>>                            +--------+
>>>>>    connB <---------------->| AddonB |
>>>>>                            +--------+
>>>>>
>>>>> With addonA and B two addon board each connected at one connector without any
>>>>> relationship between addon A and B
>>>>>
>>>>> Case 2: Only one Addons using ressources from both connector
>>>>>
>>>>>                  +------+
>>>>>    connA <-----> |Addon |
>>>>>                  |      |
>>>>>    connB <-----> |      |
>>>>>                  +------+
>>>> Case 2 is what I'm talking about.  Case 1 is the easy one.
>>>>   
>>>>> The addon is connected to both connector and uses ressources from connA and
>>>>> connB in a dependent manner.
>>>>>
>>>>>
>>>>> The Case 2 can be solved using a connector that described both connA and connB.
>>>>> Having the split connA and connB is a mechanical point of view.
>>>> I don't think that's a good solution, because it means you have to
>>>> make that decision at the board layer.  If I understand his case
>>>> correctly, you have a board where you could do either case 1 or case 2
>>>> at runtime.  We'd want the differences between these cases to only be
>>>> reflected on the addon device tree, not the base board device tree.
>>> Based on my understanding of Geer's use-case, I think decision at base
>>> board level will be needed.
>>>
>>> base board        addon board
>>>    connA +--------+conn1
>>>    connB +--------+conn2
>>>    connC +
>>>
>>> Or
>>>
>>> base board        addon board
>>>    connA +--------+conn1
>>>    connB +    ,---+conn2
>>>    connC +---'
>>>
>>> Or any other combination that would match.
>>>
>>>  From the addon board point of view, the only think we can
>>> say is "me, as an addon board, I need a connector of type 'foo' and a
>>> connector of type 'bar'".
>>>
>>> Also, at base board level, statically defined in the DT
>>> connA is described (type 'foo'), connB and connC are
>>> described (type 'bar').
>> Correct.
>>
>>> The choice to map connA to the type 'foo' connector expected by the addon
>>> and the choice to map connB or connC to the type 'bar' connector expected by
>>> the addon can only be done at runtime and probably with the help of a driver
>>> that have the knowledge of the 3 connectors.
>>>
>>> I have the feeling that the choice of physical connectors to which the addon
>>> board is connected to is a human choice when the board is connected.
>> All these choices and decisions apply to single-connector add-on boards, too.
>>
> Yes, in our use case (me and Luca), each addon has an eeprom, wired exactly the
> same on all supported addon, which allows to known the exact addon. Also addon
> insertions and removals are detected using some gpios wired to the connector.
>
> Based on that our specific driver handling our specific connector perform the
> following operations on addon insertion detection:
>    - load a first addon DT to have access to the eeprom
>    - Read the eeprom to determine the addon type
>    - load the DT matching with the addon type
>
> This part is of course connector type specific. I mean having an eeprom with
> some encoded addon type values and hotplug detection with gpio is a part of
> the contract between the board and the addon (part of connector specification).
>
> Best regards,
> Hervé
>

My usecase is a bit more complicated, since I am trying to model all the 
available headers on BeagleBoard.org sbcs (particularly PocketBeagle 2 
initially) as connectors. However, that still ends up being a single 
connector which can have multiple addon-boards simultaneously instead of 
the other way around.


Best Regards,

Ayush Singh

