Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C38218AD1
	for <devicetree-compiler@vger.kernel.org>; Fri, 20 Dec 2024 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708622; cv=none; b=HVbQXh7YvL8qj9HEWwaP2sHutJaukcwjbn5qpxw6wBUgroegCTew1UTP1m72WQ9IuzIOnrnXwPntbGSf+AUPW7wulu/7ZtX0LzJ3T/A6Wj4MGWAncCjy8ZyM4zwYyHEXwNLPNHFA7b9PrkDEwmdJ8XiXec5kgoENi0GQJ9Vvnwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708622; c=relaxed/simple;
	bh=IwFEWOazrKRCk8Sd8INmtTrWAwCb27E2w+15kZPDKYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/30TlhFGWXrdtPmRXhMOPLCxdgdFYBOerkZH33RU14mXsK5kJXFWxHo917kdtf6/AfNm6FIHX22m3Q0kYGSz2/zTyPwkZ1oEu8S19QXXY2y9Fd3o/8FpObhj7rX5H7Llhr0Lsv9G/5PPqOBtyldz4xhCOgOXOdxyWrEg5Zoa/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=Fsoln4Dj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="Fsoln4Dj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21675fd60feso24591515ad.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 20 Dec 2024 07:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1734708620; x=1735313420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OtwwoG00YIUieIgAu9EL1P5pcpjQls818/RKymAKR5Y=;
        b=Fsoln4DjYulhoOdIDiCox5ChjBSFIRBpCKQDX31FxJ+OBAuVpMYoWvs1VC9Oo9meyK
         qSOxalfrE837KMN/zI2RrhnpqZSi/nrziHYpEceHZNmCHk1Hnp34+aruVZXXDtU5vjpC
         6kB/DOps4u0LAsaNf5I4GlDRykxawYz8fSDZUMRz6SANbZcKfuRTE1/TrTeQ077gWJf5
         f/qOB0n2XA/zIglmMB8teMk60n1MTzuEEUTa1+MxVQBFA3uSVjx6ZT6HakT87Q7NDZEF
         ojIG4+4VwdqGuj0Mm5+XV7U69mDoG1+YnrzghWfX+oXKiBdhBnctgCqqKZ80daP1juOA
         X/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734708620; x=1735313420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OtwwoG00YIUieIgAu9EL1P5pcpjQls818/RKymAKR5Y=;
        b=EgnncafhklDJAK10fTFpdJtfTPfNo9ASLJ6pZuaxbJSdfTMtWqVr1vlay3yDIbvZKL
         LC3trvgqfaZnPkUkFaia0TRdlY4ytwCLILr+3JWl0t+PbvXzixYgkPOEZNxcc7kb1nLH
         DY6wGsBZ+EHr+izjy6LYAkxJcmY3ck+/QuaaY0L8ZpQOAAJFhVzzi5U12LCn0K9T7ZrU
         AGy/Yu4h3P/bJFvytOzV+f4TVElKV8eRRG2rwairojO1B1V+tdy1V2rfA1FbH6O09CO6
         NpH+Tnzm0SGQC+ZwlAYwQ9VQQaEG1o3i1nqVRm9Z8tkLWwFe8sIcdb/6e91dq1U7C0nD
         j5gw==
X-Forwarded-Encrypted: i=1; AJvYcCXgrlI1BR62xqdtyrEK8M3r5DQcZOTZse9FcdfYymddqGOLXxm75qY17EyfxOei+GtyyI6hOZLXBlubPBEgewcq5Tr4@vger.kernel.org
X-Gm-Message-State: AOJu0YwIr2Z0l2lo/p2JAM9SPErm97XcEIVRLnhYAHPVpKhDobrcUbHn
	/yRMN57DuGHrOKNRzKB5NuQWhdQKt8bdOITNArIfe9+kz6Fr293RFmGhd1yo9A==
X-Gm-Gg: ASbGncsjjOvZsuYY5tRbk6x59LOimOCAb4rnPLgU+luETBYWY17LF9fln2JvtJLePn+
	4Btzl3+hcOYzu0BUw6SUuNkT0D5+sW020gaqTa0Gkw7D2fwnm0nnbpvB+fc8WKIBHkY3hlUKgQ0
	cYk9wgFiVp4IXw7uVrqo7F+Ry9m5VxCz+PsQW47A8Yk1vcM77trVnETaLK0IosOhDWAV+crdvgp
	ZW2vUnQXGhRoatS2oaNAj3XyaQRhW/3jHt1FVkgoPmzeVOZDX6qm3CJ3X+hhYMKx/qLsqgmVyvF
	UwWL5bDsntkH44Mq6Ka9exNLuEHYm1G0MA==
X-Google-Smtp-Source: AGHT+IFDIpMM6XLF9Q9d64kUQz7n67Me/UoC5CouGPtD6IYoROUiw7aBq2dQ3zW+hi6dCrt/w/W4mw==
X-Received: by 2002:a17:902:fc84:b0:216:356b:2685 with SMTP id d9443c01a7336-219e6e8bb95mr50871295ad.11.1734708620137;
        Fri, 20 Dec 2024 07:30:20 -0800 (PST)
Received: from ?IPV6:2401:4900:1c80:c399:3720:62fb:3572:df11? ([2401:4900:1c80:c399:3720:62fb:3572:df11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc970c84sm30400145ad.58.2024.12.20.07.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 07:30:19 -0800 (PST)
Message-ID: <89073be9-c5f6-47ef-81d3-e7d57070f8d0@beagleboard.org>
Date: Fri, 20 Dec 2024 21:00:14 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add capability to append to property
To: David Gibson <david@gibson.dropbear.id.au>,
 Andreas Gnau <andreas.gnau@iopsys.eu>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>,
 devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
 <58c44f5d-7b45-4489-bf26-2be36c44e39a@iopsys.eu> <Z1_EM1dEmN4KHhBr@zatzit>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <Z1_EM1dEmN4KHhBr@zatzit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 16/12/24 11:39, David Gibson wrote:
> On Tue, Dec 10, 2024 at 04:34:17PM +0100, Andreas Gnau wrote:
>> On 2024-11-11 10:54, Ayush Singh wrote:
>>> Allow appending values to a property instead of overriding the previous
>>> values of property.
>>>
>>> Currently, we have /delete-node/ and /delete-property/, but lack
>>> /append-property/. Hence we end up having to repeat all existing values
>>> when appending to a property (e.g. see [1] appending to clocks from
>>> [2]).
>>>
>>> This functionality is also important for creating a device tree based
>>> implementation to support different types of addon-boards such as
>>> mikroBUS, Grove [3], etc.
>>>
>>> In practice, it looks as follows:
>>>
>>> ```
>>> dts-v1/;
>>>
>>> / {
>>> 	str-prop = "0";
>>> };
>>>
>>> / {
>>> 	/append-property/ str-prop = "1";
>>> };
>>> ```
>> If we add /append-property/, why not add /prepend-property/ as well? This is
>> not only "nice for consistency", but it would also enable solving a problem
>> where SoC compatible strings from dtsi [1] need to be repeated in board dts
>> [2], because one cannot prepend to an existing property.
>>
>> ```
>> dts-v1/;
>> / {
>> 	compatible = "soc-vendor,soc1234";
>> };
>>
>> / {
>> 	/prepend-property/ compatible = "board-vendor,board-xyz";
>> };
>> ```
>>
>> What do you think?
> So, this kind of demonstrates why I don't love /append-property/ as a
> proposed syntax.  The way I'd prefer to do this, ideally, is to allow
> properties to be described as expressions.  We already have integer
> expressions that can be used in < > context, but I had intended to
> extent to string and bytestring expressions - but I've never had the
> time to implement that.
>
> Under that proposal, I'd expect appending to look something like:
> 	str-prop = /previous-value/, "1";
>
> Prepending,
> 	str-prop = "1", /previous-value/;
>
> .. and you could do both at once in the obvious way.
>
> The downside, of course, is that this is a much more complicated
> proposal to implement.  Parsing that syntax isn't too hard, but I
> think doing it sensibly will need some structural changes in order to
> evaluate property values as expressions, rather than simply
> constructing the properties directly left to right.  In particular the
> interactions between expression syntax and within-property labels (and
> other markers) could be fiddly to get right.
>

Do you wish to allow `/previous-value/` to be repeated in the same 
property? Something like this:

     str-prop = "1", /previous-value/, "2", /previous-value/, "3";


Ayush Singh

