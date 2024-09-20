Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF971E517
	for <devicetree-compiler@vger.kernel.org>; Fri, 20 Sep 2024 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726850106; cv=none; b=aljTqzDyg6+xR9k2n2/HMbMoHbib7HOLuwe185WVtY07de/2iYzF32qn9GZruCyFzssSnbwC5fCaS78jOwn8XlAoxnkDRZDHNsyYkVvyffe53V/ooKSKxWTeccZCefVAliuDvBqyQz7Q8DyMPBEkXvG1Y1FAKWDpZ7L2weXMXr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726850106; c=relaxed/simple;
	bh=XN65oSCtDN05f1Urv819EzULmZdZcueUEXHqg9YB/fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kttnHYYQgVD4+mDkG7GP7HiTfPqGWDk7E594tZq2UMwM51ttnSuMSTNJrhjkNbKxxK4370mLtbWGo/FjeuX9FfKvlFCc1u9Q/YB04EF43lM0/qdS6MfSVKAffHNOkM42Yj4/u18TtNTw/dewKj93tR37QpKyQFyOB4vv0SB0Mtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=mOk6pQ8M; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="mOk6pQ8M"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-71781f42f75so2133734b3a.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 20 Sep 2024 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1726850104; x=1727454904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VOfCzvPC+VU77MljiuuBs+HzNYa36awFwaMlnB+acc=;
        b=mOk6pQ8M7yEWIta1pIcdx14IAYbLXLElzAlPQ717s8IskqgIUQ34fUQ0Sbw+mrNiIw
         rfS7mNMB/NFGKci+0WUox1rdDaAOU/i6CzubraAsjQGz25ePuFT6aewH9lV7XLXB2qvS
         SuXkqbkqEOtpjgyYqdi5ohXgHKAwktDUlcb+vbg7ILxRZRAhpTpWak1R5kwJuFj9AHie
         kpfbTH9iTRNL6oagMMszQo3M98Sgyk+zZrL0Ph+FYMJVh6Oa+z96+OB6FR/yg99ydwGr
         YzLe12rt5wv3T372wjz3qSks7KJw+y7zqXVXcf/5225b3ii8yBlUhUSrV9XekoATWn2E
         spMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726850104; x=1727454904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VOfCzvPC+VU77MljiuuBs+HzNYa36awFwaMlnB+acc=;
        b=kCyktO8sV+q9qezW7SL9OufUu1OQ2AaUivrKDtHicXKh8hI4B1LNrojHcUtR/xeR6x
         unA+BFjc71FSHA31UNi2TEX+OMrbL8m2HjtF1Js6n1B/LXekgSmJ611WhiYgr5B283Qn
         00V6PyjafAooMOOuHMjGHe/dsJQ3JmPU6IMAWbIWPeSHNRGkkrx4bCIOav3PtMqlzU7h
         DS+KzUvp454hix9OXGcGwU29MVpAiWCLUjA0g+iTlk7+71hLiHfFwnU3UchdC+DX0Zmz
         dG9aFvD5JP6CUeQyVp3yOkDTfSaujTQY1haa6KsbDwND6/oryNYRm0vci52cGqp5n3XR
         1bBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa4HCrxxm9NANehrahdIMmp7njspQOEpc6P9aT03lO2yd5JnwNpjBl5p4gZsBAk85t4w72tUGp/CoxOR8hutU26KvJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ibBlhDmsy7yKvA4TROGEIoDVbqMfcTSp2Lp13jon/EllCOtd
	64nTjA7zY5bzeLzpyhbke5EvDn5pZ381QasjSUuTE2sZMxFtxcMStIG5fNNFMQ==
X-Google-Smtp-Source: AGHT+IEnuEFckwY4gEOYZpZu4pqdrJz8uACHT16GNBmHsVpjd/SJThDK3ajaz8xcfm8M1c9IzYR97g==
X-Received: by 2002:aa7:8894:0:b0:719:7475:f073 with SMTP id d2e1a72fcca58-7199cc45545mr5263822b3a.1.1726850103846;
        Fri, 20 Sep 2024 09:35:03 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a980bfsm9966511b3a.30.2024.09.20.09.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 09:35:03 -0700 (PDT)
Message-ID: <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
Date: Fri, 20 Sep 2024 22:04:56 +0530
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
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <Zuo8yWrRPGcqnEwN@zatzit.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/24 08:06, David Gibson wrote:

> On Mon, Sep 16, 2024 at 03:10:52PM +0530, Ayush Singh wrote:
>> On 9/12/24 09:08, David Gibson wrote:
>>
>>> On Mon, Sep 09, 2024 at 12:54:34PM +0530, Ayush Singh wrote:
>>>> On 9/9/24 10:33, David Gibson wrote:
>>>>
>>>>> On Mon, Sep 02, 2024 at 05:47:55PM +0530, Ayush Singh wrote:
>>>>>> Add ability to resolve symbols pointing to phandles instead of strings.
>>>>>>
>>>>>> Combining this with existing fixups infrastructure allows creating
>>>>>> symbols in overlays that refer to undefined phandles. This is planned to
>>>>>> be used for addon board chaining [1].
>>>>> I don't think this "autodetection" of whether the value is a phandle
>>>>> or path is a good idea.  Yes, it's probably unlikely to get it wrong
>>>>> in practice, but sloppy cases like this have a habit of coming back to
>>>>> bite you later on.  If you want this, I think you need to design a new
>>>>> way of encoding the new options.
>>>> Would something like `__symbols_phandle__` work?
>>> Preferable to the overloaded values in the original version, certainly.
>> I can whip it up if that would be sufficient. But if we are talking about
>> any big rewrite, well, I would like to get the details for that sorted out
>> first.
> Fair enough.
>
>>>> It should be fairly
>>>> straightforward to do. I am not sure how old devicetree compilers will react
>>>> to it though?
>>> Well, the devicetree compiler itself never actually looks at the
>>> overlay encoding stuff.  The relevant thing is libfdt's overlay
>>> application logic... and any other implementations of overlay handling
>>> that are out there.
>>>
>>> At which I should probably emphasize that changes to the overlay
>>> format aren't really mine to approve or not.  It's more or less an
>>> open standard, although not one with a particularly formal definition.
>>> Of course, libfdt's implementation - and therefore I - do have a fair
>>> bit of influence on what's considered the standard.
>> So do I need to start a discussion for this somewhere other than the
>> devicetree-compiler mailing list? Since ZephyrRTOS is also using devicetree,
>> maybe things need to be discussed with them as well?
> <devicetree-spec@vger.kernel.org> and <devicetree@vger.kernel.org> are
> the obvious candidate places.  There will be substantial overlap with
> devicetree-compiler of course, but not total probably.
>
>>>> I really do not think having a different syntax for phandle symbols would be
>>>> good since that would mean we will have 2 ways to represent phandles:
>>>>
>>>> 1. For __symbols__
>>>>
>>>> 2. For every other node.
>>> I'm really not sure what you're getting at here.
>> I just meant that I would like to keep the syntax the same:
>>
>> sym = <&abc>;
> Ok, the syntax for creating them in dts, rather than the encoding
> within the dtb.  Why are you manually creating symbols?
>
> So.. aside from all the rest, I don't really understand why you want
> to encode the symbols as phandles rather than paths.

It's for connector stacking using the approach described here [0].

To go into more detail, let us assume that we have a mikrobus connector 
on the base board. We connect an addon board that exposes a grove 
connector. Now to describe the parent i2c adapter of the grove 
connector, we cannot really specify the full node path. However, having 
support for phandles would make writing the overlay for such an addon 
board possible.

In practice it might look as follows:


mikrobus-connector.dtso


&{/} {

    __symbols__ {

         MIKROBUS_SCL_I2C = "path";

         ...

     };

}


grove-connector-addon.dtso


&{/} {

     __symbols__ {

         GROVE_PIN1_I2C = <&MIKROBUS_SCL_I2C>;

     };

};


grove-addon-board.dtso


&MIKROBUS_SCL_I2C {

     dev {

         ...

     };

};

>>>> I also am not in the favor of doing something bespoke that does not play
>>>> nice with the existing __fixups__ infra since that has already been
>>>> thoroughly tested, and already creates __fixups__ for symbols.
>>> Hmm.  Honestly, the (runtime) overlay format was pretty a hack that's
>>> already trying to do rather more than it was really designed for.  I'm
>>> a bit sceptical of any attempt to extend it further without
>>> redesigning the whole thing with a bit more care and forethought.  I
>>> believe Rob Herring has some thoughts along these lines too.
>> Well, if we are really redesigning stuff, does that mean something like
>> dts-v2, or everything should still be backward compatible?
> Well.. it depends.  There are actually 3 or 4 different layers to consider:
>
> 1) The basic data model of the device tree as consumed by the kernel
>
> This is layer which "properties are just bytestrings" comes from.
>
> There is a case for redesigning this, since it comes from IEEE1275 and
> shows its age.  A modern format would likely be self-describing, so
> type information would be preserved.  A json-derivative would be the
> obvious choice here, except that json can't safely transport 64-bit
> integers, which is kind of a fatal flaw for this application.
>
> This would be a fundamentally incompatible change for all current
> consumers of the device tree, though.  And when I say consumers, I
> don't just mean the kernel base platform code, I mean all the
> individual drivers which actually need the device tree information.
> I'm not suggesting this layer be changed.
>
> 2) The "dtb" format: The linearized encoding of the data model above
>
> Changing this is much more tractable.  The dtb header includes version
> numbers, allowing some degree of backwards compatibility.  There have
> been, IIRC, 5 versions in total (v1, v2, v3, v16 & v17), though we've
> been on v17 for a long time (10+ years) now.
>
> There's not a heap you that can be changed here - at least neatly -
> without requiring an incompatible version bump.  However dealing with
> even an incompatible change at this layer is *much* easier.  As long
> as the base data model remains the same you can mechanically convert
> between versions, at least as long as you're not actively using new
> features.  In particular it's pretty feasible to have a whole set of
> tooling using a newer version that as a last step converts a final
> tree to an old version for consumption by the kernel or whatever.
>
> 3) The "dts" format: the human readable / writable format
>
> Being parsed text, it's relatively easy to extend this in backwards
> compatible ways.  Note that this is more influenced by (1) than the
> details of (2).  To this day, dtc can input and output the
> long-obsolete v1 dtb format, and that doesn't add a lot of complexity
> to it.
>
> Any change to the other layers would likely require extensions here as
> well, but I don't think there would be a need for backwards
> incompatible changes.  Using certain features in the source might
> impose a minimum dtb output version though.
>
> Note that dts isn't in one to one correspondance with either (1) or
> (2): there are multiple ways of specifying identical output, as there
> would be in most languages.  That is a recurring source of confusion,
> but I can't see a reasonable way of changing it short of a complete
> redesign of (1), in which case "dts" would likely simply be obsoleted.
>
> 4) The overlay specific encoding
>
> Overlays first existed purely as a dts construct: a different way of
> arranging things in the source that would compile to the same final
> tree.  Runtime overlays (a.k.a. dtbo) came later.  This is by far the
> most poorly designed layer, IMO.
>
> Basically when dtbos were invented, it was done as a quick and dirty
> encoding of the dts level overlay features into the data model of (1),
> which was then just encoded using (2), thereby blurring the layers a
> bit.  No real thought was given to versioning or backwards
> compatibility.
>
> This is where I think a redesign would make most sense.  However, the
> most sensible (IMO) ways of doing so would also require some redesign
> to (2).  Basically rather than encoding the overlay specific
> information "in band" as specially named and encoded properties, it
> would be carried "out of band" as new special tags in the updated dtb
> format.  You can think of this as a bit like relocation information
> that a C compiler emits alongside the actual instruction stream.
>
>> The problem with guessing type can probably be fixed with a tagged union for
>> the type (so an extra byte for every prop).
> Yeah, it's not so simple.  As things stand this would imply a change
> to (1), which as noted probably isn't really feasible.  Plus, just a
> one-byte type per property wouldn't cut it: some bindings have complex
> encoded values in properties that are a mixture of integers and
> strings and so forth.
>
>> With more and more emphasis on runtime devicetree [0], it would be great to
>> have a design that allows tackling more complex use cases.
>>
>> [0]: https://lpc.events/event/18/contributions/1696/
> Oof.   I don't think overlays as currently designed are a great choice
> for hotplug: overlays essentially allow rewriting any part of the
> whole device tree, which isn't a great model for a hotplug bus.  A
> long time ago some ideas were floated to define "connectors" in the
> device tree that more specifically described a way things could be
> plugged in that could cover several busses / interrupt controllers /
> etc.  That would provide a more structured way of describing plug in
> devices that can actually validate what they can do.
>
> Of course, such a scheme is a lot more work to design and implement,
> which is why the simple hack of overlays have become dominant instead.

Well, a lot of work is still going in this direction [1]. I myself am 
trying to use it for mikroBUS connectors.

The reason for using devicetree overlays for such connectors is because 
of their loose nature (mikroBUS is also open connector). This means that 
as long as the sensor/ device can make do with the pins provided by 
mikroBUS connector, it can be an addon board. And there is no limitation 
of staking the boards. So one can do rpi hat -> mikrbus connectors -> 
grove connector -> grove some addon board.


[0]: 
https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/

[1]: https://lpc.events/event/18/contributions/1696/


Ayush Singh

