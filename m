Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79C413FEE
	for <devicetree-compiler@vger.kernel.org>; Tue, 24 Sep 2024 06:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727160110; cv=none; b=pEQS+YVwF584gnhoAa9CUJh7jE8Wd7Kxls4JbhGcekDT/GXyokzcWZhtFghVupFAy+I6+lSSqFjRvVlT+Zviwln8gi7LNt8qqce1x22gUrmYllde/ABL8VPM1o6/PFe6Ui1zsKKpZx0qiQRlclkNs2IYhctDCqZWfMHttB6mUpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727160110; c=relaxed/simple;
	bh=YIwsAyyoCJ+jHK1fMd3iToSaZMYKRSPSL9OUUWHM2Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JC9I9JGeju6kVe9mQ2d9AXr/ozJobarBmqX3pIQRLKNFWlAMvl7hbOKA6fd80+oBI0+kStuzhtDF26pFjTLn2ouY1dFz6N6dRDK1rSFVa51alna50KYi3lMXMoeIzdK5MJ9bouwP7ehPOCw5hFCHuAO04WVl04nKdVec6Ga8kj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=q3GJ9Tdv; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="q3GJ9Tdv"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718d91eef2eso3303201b3a.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 23:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1727160108; x=1727764908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRz1cMNB2M3zkmX9gPQRpjuVpscQBnH+E4FiMSXp6WM=;
        b=q3GJ9Tdv1m0nFzO8VaU2BopNYKnrtE5b6pvOUUCdfPCI5fJCX8qZD0IaW0D1DU/zxn
         Yt65yYOWUIxic48nNXYwXrcGuKm8V4YBHOYKUSTcOAScEqW8TeppuHDNtLh1FEskvDJC
         vuuOsvOdTs1I2CqYV91O+V05eXWBWLSfEJCZR/pDQZ7SEBA9iwFhQ38qQoE/NEwnEiKj
         2cP2x1TSB6i++nKsJ5IL3nBwoOKmoOeSmNb5VS62XEZlbsx2BLyaDdTB1x8pzJFG2x0l
         mdFpFnLi2WAg43EKWuN1djFVlXZoszx0OGoa7IChSVoN543PAnV9yRl40PKpTOSAlLuH
         uXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727160108; x=1727764908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRz1cMNB2M3zkmX9gPQRpjuVpscQBnH+E4FiMSXp6WM=;
        b=IhiqtFglciV0OJ260E8cb4N1ZB/2ac9Qo64FIzHt8ubFaEczF6Hs28uC8naT5BSddG
         w886p+Tioys16ixAGU5fAmhNHXZx6rFmQy23iFzgTW/6TVljat9iAzR42xgTB8gMR8QU
         DcE7zx1Sh4bGZP8MR61sjTji2us+aNUZdRZvj2X4qdOrilscx7E6/ulNrI9Z8ieEXM7w
         osSDnxUBeb3hxNazYYnSPlks3nv1vETcpaAwBiVO7XJGtYwY8K8DGwmNXXf8KGPrQIA8
         vIxe95GHAlq6KqmjS/Le8QxkCsbBAwdvSfgW7m0tw33dhIMyuwTtb2Et0uuvoMWbSwqZ
         giVg==
X-Forwarded-Encrypted: i=1; AJvYcCUiytgwcYwjQPkde094ZKHcBlHY0JCfqligQBVU4M+Tsk5zjHp8UGjY+kzkmMJohRZvPl/Q2DQkrPrOyHhBzfDdqXhC@vger.kernel.org
X-Gm-Message-State: AOJu0YxCk6b29ofCcq+3nP4SEiI9QXzHgo9I4jvlFf1I8bs/r04C04ve
	EJ7UbGBO7PJOEnG6HptrZW2jExa/nVWliabsKbE+0VYf3FfT0ceZItLBRMnDenyP8F6V5nkqJin
	56Q==
X-Google-Smtp-Source: AGHT+IFDZhUmcHS3xMHmjfsOHb7VjbAUd2GKirLaywc8nsPmcwl81XoejszU4KThxJxiwgSKXPjhEA==
X-Received: by 2002:a05:6a00:1ad1:b0:712:7195:265d with SMTP id d2e1a72fcca58-71afa14a96fmr3217486b3a.0.1727160107728;
        Mon, 23 Sep 2024 23:41:47 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc9c7831sm574352b3a.212.2024.09.23.23.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 23:41:47 -0700 (PDT)
Message-ID: <99c2b16b-a9bc-4808-966c-96b60889876f@beagleboard.org>
Date: Tue, 24 Sep 2024 12:11:36 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
To: David Gibson <david@gibson.dropbear.id.au>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
 <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
 <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box>
 <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
 <ZvDjW7W1096FW8XL@zatzit.fritz.box>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <ZvDjW7W1096FW8XL@zatzit.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/23/24 09:11, David Gibson wrote:

> On Fri, Sep 20, 2024 at 10:04:56PM +0530, Ayush Singh wrote:
>> On 9/18/24 08:06, David Gibson wrote:
>>
>>> On Mon, Sep 16, 2024 at 03:10:52PM +0530, Ayush Singh wrote:
>>>> On 9/12/24 09:08, David Gibson wrote:
>>>>
>>>>> On Mon, Sep 09, 2024 at 12:54:34PM +0530, Ayush Singh wrote:
>>>>>> On 9/9/24 10:33, David Gibson wrote:
>>>>>>
>>>>>>> On Mon, Sep 02, 2024 at 05:47:55PM +0530, Ayush Singh wrote:
>>>>>>>> Add ability to resolve symbols pointing to phandles instead of strings.
>>>>>>>>
>>>>>>>> Combining this with existing fixups infrastructure allows creating
>>>>>>>> symbols in overlays that refer to undefined phandles. This is planned to
>>>>>>>> be used for addon board chaining [1].
>>>>>>> I don't think this "autodetection" of whether the value is a phandle
>>>>>>> or path is a good idea.  Yes, it's probably unlikely to get it wrong
>>>>>>> in practice, but sloppy cases like this have a habit of coming back to
>>>>>>> bite you later on.  If you want this, I think you need to design a new
>>>>>>> way of encoding the new options.
>>>>>> Would something like `__symbols_phandle__` work?
>>>>> Preferable to the overloaded values in the original version, certainly.
>>>> I can whip it up if that would be sufficient. But if we are talking about
>>>> any big rewrite, well, I would like to get the details for that sorted out
>>>> first.
>>> Fair enough.
>>>
>>>>>> It should be fairly
>>>>>> straightforward to do. I am not sure how old devicetree compilers will react
>>>>>> to it though?
>>>>> Well, the devicetree compiler itself never actually looks at the
>>>>> overlay encoding stuff.  The relevant thing is libfdt's overlay
>>>>> application logic... and any other implementations of overlay handling
>>>>> that are out there.
>>>>>
>>>>> At which I should probably emphasize that changes to the overlay
>>>>> format aren't really mine to approve or not.  It's more or less an
>>>>> open standard, although not one with a particularly formal definition.
>>>>> Of course, libfdt's implementation - and therefore I - do have a fair
>>>>> bit of influence on what's considered the standard.
>>>> So do I need to start a discussion for this somewhere other than the
>>>> devicetree-compiler mailing list? Since ZephyrRTOS is also using devicetree,
>>>> maybe things need to be discussed with them as well?
>>> <devicetree-spec@vger.kernel.org> and <devicetree@vger.kernel.org> are
>>> the obvious candidate places.  There will be substantial overlap with
>>> devicetree-compiler of course, but not total probably.
>>>
>>>>>> I really do not think having a different syntax for phandle symbols would be
>>>>>> good since that would mean we will have 2 ways to represent phandles:
>>>>>>
>>>>>> 1. For __symbols__
>>>>>>
>>>>>> 2. For every other node.
>>>>> I'm really not sure what you're getting at here.
>>>> I just meant that I would like to keep the syntax the same:
>>>>
>>>> sym = <&abc>;
>>> Ok, the syntax for creating them in dts, rather than the encoding
>>> within the dtb.  Why are you manually creating symbols?
>>>
>>> So.. aside from all the rest, I don't really understand why you want
>>> to encode the symbols as phandles rather than paths.
>> It's for connector stacking using the approach described here [0].
> Thanks for the link.
>
>> To go into more detail, let us assume that we have a mikrobus connector on
>> the base board. We connect an addon board that exposes a grove connector.
>> Now to describe the parent i2c adapter of the grove connector, we cannot
>> really specify the full node path. However, having support for phandles
>> would make writing the overlay for such an addon board possible.
>>
>> In practice it might look as follows:
>>
>>
>> mikrobus-connector.dtso
>>
>>
>> &{/} {
>>
>>     __symbols__ {
>>
>>          MIKROBUS_SCL_I2C = "path";
>>
>>          ...
>>
>>      };
>>
>> }
>>
>>
>> grove-connector-addon.dtso
>>
>>
>> &{/} {
>>
>>      __symbols__ {
>>
>>          GROVE_PIN1_I2C = <&MIKROBUS_SCL_I2C>;
>>
>>      };
>>
>> };
> So, essentially you're just adding new labels as aliases to existing
> labels?
>
> Ok, I can see at least two ways of doing that which I think are a more
> natural fit than allowing symbols to be phandles.
>
> # Method 1: Allow path references in overlays
>
> dts allows references both in integer context:
> 	foo = <&bar>;
> in which case it resolves to a phandle, but also in string/bytestring context:
> 	foo = &bar;
> In which case it resolves to a path.
>
> Runtime overlays, only support the former, but could be extended to
> support the latter form.  It would be a trickier than phandle
> references, because updating a path reference would require expanding
> / shrinking the property including it, but I don't think it's super
> difficult.
>
> It might be somewhat harder to imlpement than your original proposal,
> but it's conceptually simpler and more versatile.  In fact it removes
> a currently existing asymmetry between what dts and overlays can do.

> # Method 2: /aliases
>
> /__symbols__ is very similar to the much older IEEE1275 concept of
> /aliases.  In fact they're encoded identically except for appearing in
> /aliases instead of /__symbols__.  The original use for these was in
> interactive Open Firmware, so you could type, say, "dev hd" instead of
> "dev /pci@XXXXXXXX/scsi@X,Y/lun@XX/..." or whatever path the primary
> hard disk had.  Arguably, __symbols__ should never have been invented,
> and we should have just used /aliases.  This is the kind of thing I
> mean when I say they overlay encoding wasn't very well thought out.
>
> But, here's the thing:
>
> a) aliases can be defined in terms of other aliases:
>
> 	aliases {
> 		scsi0 = "/pci@XXXXX/pci-bridge@X,Y/scsi@X,Y";
> 		hd = "scsi0/lun@YY";
> 	}
>
> b) fdt_path_offset() already resolves aliases
>
> If given a path without a leading '/', it will look up the first
> component as an alias, then look up the rest of the path relative to
> that.
>
> So, in your example, if the base layer defined MIKROBUS_SCL_I2C as
> an alias rather than a symbol, then in the next layer you could have:
>
> &{/} {
>       	aliases {
> 		GROVE_PIN1_I2C = "MIKROBUS_SCL_I2C";
> 	}
> }
>
> libfdt should already resolve this when applying overlays, because it
> just calls fdt_path_offset().
>
> So your only remainingly difficulty is /aliases versus /__symbols__.
> It would be fairly simple to make overlay application expand
> __symbols__ in much the same way as aliases.  Or, you could just have
> a copy of everything in __symbols__ in aliases as well (which might be
> a path to eventually deprecating /__symbols__).  dtc already has the
> -A flag which will but all labels into /aliases, very much like -@
> will put them all in /__symbols__.
>
> [snip]
>> Well, a lot of work is still going in this direction [1]. I myself
>> am trying to use it for mikroBUS connectors.
> Sure, and I can see why: it seems tantalizingly close to working
> simply.  But that doesn't mean it won't have limitations that will
> bite you down the track.

Well, my previous attempts at not using devicetree for the addon boards 
was met with 2 main arguments:

1. Hardware should be described with devicetree.

2. There can exist a fairly complicated addon board which will not work 
without devicetree.

Additionally, it was mentioned that if something is missing from the 
devicetree, I should look at extending device trees instead of trying to 
bypass it. So, here we are.

>> The reason for using devicetree overlays for such connectors is
>> because of their loose nature (mikroBUS is also open
>> connector). This means that as long as the sensor/ device can make
>> do with the pins provided by mikroBUS connector, it can be an addon
>> board. And there is no limitation of staking the boards. So one can
>> do rpi hat -> mikrbus connectors -> grove connector -> grove some
>> addon board.
> For example, the very fact that these are loose exposes you to one
> pretty obvious limitation here.  Suppose some future board has a
> connector with enough pins that you can hang two independent grove
> connectors off it, and someone makes a hat/shield/whatever that does
> exactly that.  But now the grove addon dtbs need to be different
> depending on whether they attach to grove connector 1 or grove
> connector 2.
>
> The old "connector binding" proposals I was describing aimed to
> decouple the type of the connector from the instance of the connector
> for exactly this sort of case.


Do you have a link to the "connector binding" proposal you are 
mentioning here? I really believe having a better way to support such 
connectors is really important for embedded systems. And I am okay with 
adding any missing bits to make it a reality.

With `PREEMPT_RT` patches being merged, it is probably a good time to 
improve embedded linux.


Ayush Singh

