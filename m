Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD66165EE3
	for <devicetree-compiler@vger.kernel.org>; Wed, 13 Nov 2024 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731491200; cv=none; b=Tf0Swd8l4qhyHGMMRhQYGM5roNjiUULrXF7Ep0wd0J/PtMvNjrIB0844K/6NY9wOGIGDr0FuniLnlNuryRVDuuS8uA3q+2uaYcEg0XjhGmU3WsiNeOTLAr8izSzVuzNEKPQl22M2U3hF0D4f0hjLc2OTzzARPJT+rZTN0u2kbdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731491200; c=relaxed/simple;
	bh=Vkc+AUpUN2aqdxrjA1r4K8EAhgPVpAKbmQEZorI4Vao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9kYXJXTtz5eHSsII75ihQrr1YK6gHAdRnr1vfADnpPeSDil2uFwdfJai0B/M0OFcYvM/ZLPFR2Nh5ah610h4JX7K5KAddm6Ws/8krM6timLkbyFWxhx0h300wCyIoIIoaoWP5R85vm86JsgWQb7qRAKS8GQ4zWjDaLdaoi15a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=Y7E3tK0V; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="Y7E3tK0V"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71ec997ad06so5580563b3a.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 13 Nov 2024 01:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731491197; x=1732095997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+R57hQJ+uKYdUsKx63+uERYmmbs351ZfIyNdXtbdc3k=;
        b=Y7E3tK0VSyGEL8B0+2M/4gd6DXM3JUiQH+f6B/8os42DIt8H0QOt114qV+nN3HGmbz
         /yn5mWpqar4uM/bYl+NHwQYrZJfwKIZeR+u97pzsDxguPVtSXie6kHxTWdAWX7nantYg
         5128L5aVrzHVPlVGoZ0ys1KPzee9WM/jzCG5gMB845SlmKwk/w/dsps1eRJFPZutyHXS
         xJCzrPo+InEx/3oDcIMTad41zrXOMiu+ueV1+rvIg3EAoiBs9N+RinClOgsAxhMsS+oE
         dpq7SO0fyuI2tqzNoX4MzpKxdYELVKiADfz7KM8pgb7tH/V5yMvR3qh92zY5C4+4CNNI
         xGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731491197; x=1732095997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+R57hQJ+uKYdUsKx63+uERYmmbs351ZfIyNdXtbdc3k=;
        b=EUcJNwDyC+jUe106lOhQXHOmfGUs/v6ah/Q+O4dHgRkYiTBNvBOlQmv4KfL2Sw0LkH
         Ox6JIPscwNR1Vg2V6ZpNVN3FsyeQVM4UfHBcSvByvX7vudI/zOAnbWNm8G7nL+qJn90a
         8HX+9PNnH4cbCXOM2HU0sHNaLWWWGhn788Z6vn9uw15MXNpm1yCzghrtORvBM78BA36Y
         NSopwL6elRaPhjutC/LVq3MB17Wj0E0BL9BNvBkpNpbqFzcu8RbjkrckDbOK6J1QK7J2
         4XeK98Kdz/TBsU026v28Db3BzwgSWnvCgURmbF8QERu0cHgXKEqggEuQrRtjwvgsyy/q
         a4sQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1L09EWX6WEyWcJafEKyRXZNNRgJpLd9xmn8fx+NmBEkhNq3o0zY/bH4f05IuUncUhga55BmVf29P/RW7DNhsfOYoR@vger.kernel.org
X-Gm-Message-State: AOJu0YyRmxEFA/T2tfF1FXAEeK92kxwGpHei/tVIbStdJZ0O/Uan/sE9
	bGx/2DostS7a8xWOy9x79ntV0V06A5g5g0/1p3uC8d0H5wxVq00dtxw7bZQXTw==
X-Google-Smtp-Source: AGHT+IEycbldwlbSmNy/F/nBFqSJ7ujDeClMiVESKRwJsF/PvnB84Q9MjVm7+JD0myVhGpCSgpzRog==
X-Received: by 2002:a05:6a00:6ca7:b0:724:5815:62c1 with SMTP id d2e1a72fcca58-72458156e02mr2294382b3a.19.1731491197523;
        Wed, 13 Nov 2024 01:46:37 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7245acda43fsm953276b3a.188.2024.11.13.01.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 01:46:36 -0800 (PST)
Message-ID: <21d28bc0-da17-4cb8-b205-fa3c101a0ff0@beagleboard.org>
Date: Wed, 13 Nov 2024 15:16:30 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>,
 devicetree-compiler@vger.kernel.org
References: <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
 <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
 <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box>
 <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
 <ZvDjW7W1096FW8XL@zatzit.fritz.box>
 <CAMuHMdXG32pj=nO9iGTD69QSLY7p9BoASqnMi87LBmBuQg0GAA@mail.gmail.com>
 <ZvEpHCeKDi_8XGcz@zatzit.fritz.box>
 <CAMuHMdWsKQZw+pDZ7t3X3amCV6ms76v4o_FsdZ6-XJEDrv4Gvg@mail.gmail.com>
 <ZvE5atmdWXhGwLdQ@zatzit.fritz.box>
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <ZvE5atmdWXhGwLdQ@zatzit.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/23/24 15:18, David Gibson wrote:

> On Mon, Sep 23, 2024 at 11:12:02AM +0200, Geert Uytterhoeven wrote:
>> Hi David,
>>
>> On Mon, Sep 23, 2024 at 10:41 AM David Gibson
>> <david@gibson.dropbear.id.au> wrote:
>>> On Mon, Sep 23, 2024 at 10:22:03AM +0200, Geert Uytterhoeven wrote:
>>>> On Mon, Sep 23, 2024 at 5:41 AM David Gibson
>>>> <david@gibson.dropbear.id.au> wrote:
>>>>> So, essentially you're just adding new labels as aliases to existing
>>>>> labels?
>>>>>
>>>>> Ok, I can see at least two ways of doing that which I think are a more
>>>>> natural fit than allowing symbols to be phandles.
>>>> [...]
>>>>
>>>>> # Method 2: /aliases
>>>> Does the (Linux) DT overlay code support updating aliases?
>>>> Last time I needed that (almost a decade ago), it did not.
>>> Huh.  I hadn't realised the kernel kept a separate cache of aliases
>>> that wasn't updated.  Assuming that's still the case, that would
>>> complicate matters a bit.
>> Indeed.
> Actually, in a sense this is just an aspect of a more general thing:
> libfdt's is not the only relevant implementation of overlays.  If you
> want to extend what overlays can do, you need to consider the kernel
> implementation too.
>

So, I don't think we can go the aliases route. I posted an updated  
of_alias patch [0], but as Rob pointed out:

```

Drivers use the non-existent alias numbers for instances without an
alias. So what happens if an index is already in use and then an
overlay uses the same index.

I don't see how this can work reliably unless the alias name doesn't
exist in the base DT.

```


Not really sure how alias overloading can be supported in kernel without 
breaking existing drivers.

Overlays are starting to feel more like a hack the longer I work on this.


I guess I can try out implementing `foo = &bar;` approach and see how 
that goes.


[0]: 
https://lore.kernel.org/all/20241110-of-alias-v2-0-16da9844a93e@beagleboard.org/T/#t


Ayush Singh

