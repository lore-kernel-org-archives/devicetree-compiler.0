Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0B13DDD3
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Sep 2024 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726479661; cv=none; b=oOYRffaWKiZZLPfZE0G+H5NpoumL2WDXkrnaYfuyeBgkxH2eg7op6loga7OO6FZxk1o3wz69kQJOiAra8qMTw/KqZDmAhrFxraJmZ7KuQ0f5LLxPfK4ZKZuwntHzblq4k107dbtoRuXQrxmAhc5FWQoOj17ClnB9qbyP59mHRaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726479661; c=relaxed/simple;
	bh=bBQ6fnoqOrcmSKp+66633GZTAINBxE0I7BFsrew0afI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYtm58El39zdBLB5dld6KyZ4ceAGxGOocqBmVFibjGagIocjkSBAH7oZXa6EMArjOisKyODuSw7dNRy9c58OLVxR0oZRyeYBj8DJ3WnUCT+gE03TP+VvoDpwhXYD8+QIzrOPbjtWD4t8o/V8R/hWVdXVOzxRi8RXgiQocM66Ps8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=bilfpTCN; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="bilfpTCN"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7194cca5811so921937b3a.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Sep 2024 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1726479659; x=1727084459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IV1RT8Gnqjgo9OrhqWRsrYpKhIIVvFLShJdloVL4vXQ=;
        b=bilfpTCN8UvJ9Taiug9+WNuoFDPQsdKe1WrQQr74wp8NKgc2F/dOMBUxaezJT+70ux
         ACI2MahhEM6b6CbEUrrxPKkdjzM2foroIF1tM0Mzr5i2Tm78BI3ugkzHCI+1CvVVDlOq
         3UVaxbeO0MPdyrDCByQ9+OJys/wU2d+EHl3LWgMDZRSIkOaWNBt46tubSQNr2yLbVBcd
         H6ZFpFQb1MktxkWGOZWxsBDF7535crU9ks7vBPqPpeYo05e9gcqY5h3dK3accjWbaVCU
         a3n6jqCAdUp641tJs1bt3706uVP8OtVO8fZ15xG4GJaujSU1KSrRE5IpMLPxKaKLnytB
         Wa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726479659; x=1727084459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IV1RT8Gnqjgo9OrhqWRsrYpKhIIVvFLShJdloVL4vXQ=;
        b=AfIQFCxY9XFYVi/r9P6QlYNZTQkyFVz6A4HvnaWf6QlSX/7aZGD5B8BaXWFPV8Nk0q
         JaUGiGRtwH6u17Yn1yE/0xqDp4bBRAn2/CARM7IMIWRK0mxM4h3UjaHMc3g5D3Pjwqcc
         kfmLLINA68wsUzYotQ3KQv+dcvr1bq+zUgFUI0Pic9W9r3Yv4v2tjHxuISiGYVkwQ3pg
         V/tIEcKT4Z0q7TEdTa11DjJKN4rPULohjCUIy9lZhe4vVWHFHaGQ7VQZcqK8HoI9O4JO
         8WDXS8/pNBA9dcRxIX2PKIHbASKK3nmBj8VR6JNcgp9LEq7dKSHCch2wW7N+jsqivb+S
         gN1g==
X-Forwarded-Encrypted: i=1; AJvYcCUYc3p77DWyKfTGSVlQQTkxXUIoAWhUDsWEfbOnCat1hr5AzocSfxZm/u+MP4h+apkbCncXLe80R27BQ5QGHlyMTVAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzymOo3c7xGGQNQiURj/humb3mAGUu+oV/Z7rmrJk+ViMl2C7sV
	g8lAk7Hni11TDdqoaFU052URsvx8q/f07Jk1LAjIov8mKJwRIwGGGklvgbfnzw==
X-Google-Smtp-Source: AGHT+IH9kkz0ExbPp+xI8icfRYeM0g0GQyKs0AubOoDf6mZ+z52GOH2o4LMPz3BtFLcdiQYN3VBwlA==
X-Received: by 2002:a05:6a00:399f:b0:718:f026:6c78 with SMTP id d2e1a72fcca58-71936a5aa33mr15076375b3a.13.1726479658552;
        Mon, 16 Sep 2024 02:40:58 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a9ac19sm3389772b3a.29.2024.09.16.02.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 02:40:57 -0700 (PDT)
Message-ID: <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
Date: Mon, 16 Sep 2024 15:10:52 +0530
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
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 09:08, David Gibson wrote:

> On Mon, Sep 09, 2024 at 12:54:34PM +0530, Ayush Singh wrote:
>> On 9/9/24 10:33, David Gibson wrote:
>>
>>> On Mon, Sep 02, 2024 at 05:47:55PM +0530, Ayush Singh wrote:
>>>> Add ability to resolve symbols pointing to phandles instead of strings.
>>>>
>>>> Combining this with existing fixups infrastructure allows creating
>>>> symbols in overlays that refer to undefined phandles. This is planned to
>>>> be used for addon board chaining [1].
>>> I don't think this "autodetection" of whether the value is a phandle
>>> or path is a good idea.  Yes, it's probably unlikely to get it wrong
>>> in practice, but sloppy cases like this have a habit of coming back to
>>> bite you later on.  If you want this, I think you need to design a new
>>> way of encoding the new options.
>> Would something like `__symbols_phandle__` work?
> Preferable to the overloaded values in the original version, certainly.

I can whip it up if that would be sufficient. But if we are talking 
about any big rewrite, well, I would like to get the details for that 
sorted out first.

>> It should be fairly
>> straightforward to do. I am not sure how old devicetree compilers will react
>> to it though?
> Well, the devicetree compiler itself never actually looks at the
> overlay encoding stuff.  The relevant thing is libfdt's overlay
> application logic... and any other implementations of overlay handling
> that are out there.
>
> At which I should probably emphasize that changes to the overlay
> format aren't really mine to approve or not.  It's more or less an
> open standard, although not one with a particularly formal definition.
> Of course, libfdt's implementation - and therefore I - do have a fair
> bit of influence on what's considered the standard.

So do I need to start a discussion for this somewhere other than the 
devicetree-compiler mailing list? Since ZephyrRTOS is also using 
devicetree, maybe things need to be discussed with them as well?

>> I really do not think having a different syntax for phandle symbols would be
>> good since that would mean we will have 2 ways to represent phandles:
>>
>> 1. For __symbols__
>>
>> 2. For every other node.
> I'm really not sure what you're getting at here.

I just meant that I would like to keep the syntax the same:

sym = <&abc>;

>> I also am not in the favor of doing something bespoke that does not play
>> nice with the existing __fixups__ infra since that has already been
>> thoroughly tested, and already creates __fixups__ for symbols.
> Hmm.  Honestly, the (runtime) overlay format was pretty a hack that's
> already trying to do rather more than it was really designed for.  I'm
> a bit sceptical of any attempt to extend it further without
> redesigning the whole thing with a bit more care and forethought.  I
> believe Rob Herring has some thoughts along these lines too.


Well, if we are really redesigning stuff, does that mean something like 
dts-v2, or everything should still be backward compatible?

The problem with guessing type can probably be fixed with a tagged union 
for the type (so an extra byte for every prop).

With more and more emphasis on runtime devicetree [0], it would be great 
to have a design that allows tackling more complex use cases.

[0]: https://lpc.events/event/18/contributions/1696/

Ayush Singh

