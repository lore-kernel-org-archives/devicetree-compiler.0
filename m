Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C03FBA7
	for <devicetree-compiler@vger.kernel.org>; Thu,  3 Oct 2024 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727940918; cv=none; b=sjHAD3/gAPghFxNzsX3Y+w6aCK478P0jk+IUwgEYAjUAqSHCZGQLuGmxjdEbh0PQq4FqJPCCpKlRmZnBdmXsoxv98y1njNiAjDSLTcdn9a78vDshQ/Q87Kk+5ex7pDct1efc5GO19tphvxnhfsDZKnmFLXc+gtkJBpLarr2yi+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727940918; c=relaxed/simple;
	bh=Uds0OW+BQbPE81OEhOukGcuptL0KWbXANZlu6SRsx3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoEnbL8tRsyNSmrRpAjajNHyhyPxYGGU2x4nH2/oOxrktw9AjCaBobPsoWpHtmsmLCK4d5rIcyRx3+QTX/OsfCHU430//7Wczc7nZufDzNdAbbvRWmdO8/tpRDn/THRzCYUeeM0A02szIAqXfsn4mFY3lQ78VszUAQNhqdwqLnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=M++PtyjL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="M++PtyjL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20bc2970df5so4234495ad.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 03 Oct 2024 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1727940916; x=1728545716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=waSDiHLMRzmETmro01OT7VMrpfEhHFT2WRjwc2XBaJQ=;
        b=M++PtyjLcxGywSaAMpZ0KVSGpYv6P3/iXjX7Do89HAL5xbf9wFS079vdh8IuEz2vnq
         tu/InDz8XVAXCMnAqw/A9T+QPsG6HWgfjFPvp+axYvgjlWRrS1j5RjrZs796dMpfz3BD
         RgmnDYtZwh00MSAbH+geZ5xrXQuC9Kk1pvltkWXi0pHaNmvxbqms4zRujQaLMhPUnMxs
         5GORe8GxEXEqay5mxjfDb5a1Scpbt8iZwEWE8lKX00zcnQXYIEWZqdEFd8RJbRJFiprp
         zuKdNPHMuS6/7KvBt3PpAkLOSVgW9YJvyb1CKAx7byiWvcZLY61H7GlJKnjsI2Sv2VlO
         gMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727940916; x=1728545716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waSDiHLMRzmETmro01OT7VMrpfEhHFT2WRjwc2XBaJQ=;
        b=OS8ivERgM+BbPPRrXYB1sSencJtYj2J0WTW2vt3ldxt3wDkMGy7TPKRcs/99qrsznw
         J6GMWoxlOTjx5c91B9KTlRrEYLiOXu3krHvsUreMPW8Wnc8hq0BQNZ+399W13dewAYU3
         YnI5D2pgn0I5qG6v8O8frbdY6G7tIm7Zky9KlMI+yHfcSVc7FENW1prPzw/x2fck2+c4
         VI4ZcURt1o6pFMVl19WBngm3HKAjpFc6tyxY6NnqcLP6Umsbxx1dOfoVtpVXQRRdm4Hs
         jRi9Sr3CTOaILa1MuMBPfeMe2aBbMfw7wGEvF9p7WSEJFFPHABFrwZIKDFixiI4DDNBJ
         +1rA==
X-Forwarded-Encrypted: i=1; AJvYcCWL0S+1xB5902cbpjG3K0kf8YU7hokF9xBWeabKaRaMNs1JUD1dp14etAwGnfDyVsmp1265izWpYgGc5Tv7CgnC44rO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+J+dQGCybW8H9dm81d1VUZQItu6umshveV//kSt+VvNCXbge
	CIB8sBSBElreNFVL0JRRMMMbf6EKCCVbPuEuzWheieDzfbRzxGkS3PSmqxEPlQ==
X-Google-Smtp-Source: AGHT+IGmC3q/S5/PXLa3b2pvHnLdbIcr7LAgA+heL+1RM4rBYpTHWJ8N4FiyJg7UFxJncokhAU1WdA==
X-Received: by 2002:a17:902:f691:b0:20b:b238:9d28 with SMTP id d9443c01a7336-20bc59bd141mr87279145ad.15.1727940916154;
        Thu, 03 Oct 2024 00:35:16 -0700 (PDT)
Received: from ?IPV6:2401:4900:7781:240c:9d28:8c5d:5e6d:4043? ([2401:4900:7781:240c:9d28:8c5d:5e6d:4043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beead4eeasm4104605ad.13.2024.10.03.00.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 00:35:15 -0700 (PDT)
Message-ID: <b2922a54-dc89-4433-9a50-6ece53690df9@beagleboard.org>
Date: Thu, 3 Oct 2024 13:05:08 +0530
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Content-Language: en-US
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
 <99c2b16b-a9bc-4808-966c-96b60889876f@beagleboard.org>
 <ZvO7iUv06vxIvdpX@zatzit.fritz.box>
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <ZvO7iUv06vxIvdpX@zatzit.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/24 12:58, David Gibson wrote:

> On Tue, Sep 24, 2024 at 12:11:36PM +0530, Ayush Singh wrote:
>> On 9/23/24 09:11, David Gibson wrote:
>>> On Fri, Sep 20, 2024 at 10:04:56PM +0530, Ayush Singh wrote:
>>>> On 9/18/24 08:06, David Gibson wrote:
> [snip]
>>>> Well, a lot of work is still going in this direction [1]. I myself
>>>> am trying to use it for mikroBUS connectors.
>>> Sure, and I can see why: it seems tantalizingly close to working
>>> simply.  But that doesn't mean it won't have limitations that will
>>> bite you down the track.
>> Well, my previous attempts at not using devicetree for the addon boards was
>> met with 2 main arguments:
>>
>> 1. Hardware should be described with devicetree.
>>
>> 2. There can exist a fairly complicated addon board which will not work
>> without devicetree.
>>
>> Additionally, it was mentioned that if something is missing from the
>> devicetree, I should look at extending device trees instead of trying to
>> bypass it. So, here we are.
> Absolutely.  This isn't about not using a devicetree, it's about the
> mechanism for updating the devicetree with plug in components.
> Overlays, as they're currently specced, are simple and easy... but
> also crude, limited and sloppily designed.
>
>
>>>> The reason for using devicetree overlays for such connectors is
>>>> because of their loose nature (mikroBUS is also open
>>>> connector). This means that as long as the sensor/ device can make
>>>> do with the pins provided by mikroBUS connector, it can be an addon
>>>> board. And there is no limitation of staking the boards. So one can
>>>> do rpi hat -> mikrbus connectors -> grove connector -> grove some
>>>> addon board.
>>> For example, the very fact that these are loose exposes you to one
>>> pretty obvious limitation here.  Suppose some future board has a
>>> connector with enough pins that you can hang two independent grove
>>> connectors off it, and someone makes a hat/shield/whatever that does
>>> exactly that.  But now the grove addon dtbs need to be different
>>> depending on whether they attach to grove connector 1 or grove
>>> connector 2.
>>>
>>> The old "connector binding" proposals I was describing aimed to
>>> decouple the type of the connector from the instance of the connector
>>> for exactly this sort of case.
>>
>> Do you have a link to the "connector binding" proposal you are mentioning
>> here? I really believe having a better way to support such connectors is
>> really important for embedded systems. And I am okay with adding any missing
>> bits to make it a reality.
>>
>> With `PREEMPT_RT` patches being merged, it is probably a good time to
>> improve embedded linux.
> I don't think there was ever a proposal written up as such.  It was
> just an idea floating around the mailing lists.  I did manage to dig
> up what were meant to be some illustrative examples of the idea.
> Alas, without any explanatory notes.  It was last modified in 2016,
> but let's see what I can remember in terms of context.  Note that all
> of the below was a quick draft - it would certainly need polish and
> all syntax is negotiable.  In particular the use of the /plugin/
> keyword might not be compatible with its current use for overlays, so
> that would probably need changing.

Thanks. I also personally would be interested in an approach that can 
avoid symbols. The reason being I would like to be able to use the same 
addon board overlays to support mikroBUS on Zephyr.

I also like the prospect of doing connector versioning.

> The idea is that a base board could define specific "connectors",
> which could describe what buses / pins / interrupts / whatever were
> exposed on that connector.  Each connector instance had some local
> aliases referencing the nodes in the base board the connector could
> alter.
>
> So, a board with a "widget" socket which exposes two interrupt lines,
> an I2C bus and an MMIO bus might look roughly like this:
>
> /dts-v1/;
>
> / {
> 	compatible = "foo,oldboard";
> 	ranges;
> 	soc@... {
> 		ranges;
> 		mmio: mmio-bus@... {
> 			#address-cells = <2>;
> 			#size-cells = <2>;
> 			ranges;
> 		};
> 		i2c: i2c@... {
> 		};
> 		intc: intc@... {
> 			#interrupt-cells = <2>;
> 		};
> 	};
>
> 	connectors {
> 		widget1 {
> 			compatible = "foo,widget-socket";
> 			w1_irqs: irqs {
> 				interrupt-controller;
> 				#address-cells = <0>;
> 				#interrupt-cells = <1>;
> 				interrupt-map-mask = <0xffffffff>;
> 				interrupt-map = <
> 					0 &intc 7 0
> 					1 &intc 8 0
> 				>;
> 			};
> 			aliases = {
> 				i2c = &i2c;
> 				intc = &w1_irqs;
> 				mmio = &mmio;
> 			};
> 		};
> 	};
> };
>
>
> A later version of the board might expose two widget sockets that are
> backwards compatible with the original widget but also add some new
> features.  It might look like this:
>
> /dts-v1/;
>
> / {
> 	compatible = "foo,newboard";
> 	ranges;
> 	soc@... {
> 		ranges;	
> 		mmio: mmio-bus@... {
> 			#address-cells = <2>;
> 			#size-cells = <2>;
> 			ranges;
> 		};
> 		i2c0: i2c@... {
> 		};
> 		i2c1: i2c@... {
> 		};
> 		intc: intc@... {
> 		};
> 	};
>
> 	connectors {
> 		widget1 {
> 			compatible = "foo,widget-socket-v2", "foo,widget-socket";
> 			w1_irqs: irqs {
> 				interrupt-controller;
> 				#address-cells = <0>;
> 				#interrupt-cells = <1>;
> 				interrupt-map-mask = <0xffffffff>;
> 				interrupt-map = <
> 					0 &intc 17 0
> 					1 &intc 8 0
> 				>;
> 			};
> 			aliases = {
> 				i2c = &i2c0;
> 				intc = &w1_irqs;
> 				mmio = &mmio;
> 			};
> 		};
> 		widget2 {
> 			compatible = "foo,widget-socket-v2", "foo,widget-socket";
> 			w2_irqs: irqs {
> 				interrupt-controller;
> 				#address-cells = <0>;
> 				#interrupt-cells = <1>;
> 				interrupt-map-mask = <0xffffffff>;
> 				interrupt-map = <
> 					0 &intc 9 0
> 					1 &intc 10 0
> 				>;
> 			};
> 			aliases = {
> 				i2c = &i2c1;
> 				widget-irqs = &w2_irqs;
> 				mmio = &mmio;
> 			};
> 		};
> 	};
> };
>
>
> A plugin device tree describing something which plugs into a widget
> socket might look like this.  Note that it specifies the *type* of
> socket it goes into ("foo,widget-socket"), but not the specific
> instance of a socket it goes into.  When plugging this into a
> "foo,newboard" you'd have to specify whether this is attaching to the
> widget1 or widget2 socket.
>
> /dts-v1/;
>
> /plugin/ foo,widget-socket {
> 	compatible = "foo,whirligig-widget";
> };
>
> &i2c {
> 	whirligig-controller@... {
> 		...
> 		interrupt-parent = <&widget-irqs>;
> 		interrupts = <0>;
> 	};
> };

I do have a few questions regarding this approach:

1. How do you propose selecting the connector should be done? We can 
rely on the connector driver for this, but the symbols [0] based 
approach does have an interesting benefit. It can work with applying 
overlays from uboot, or well any other static method where we already 
know which board we want to use. This is quite useful in embedded context.

2. Where would `compatible = "foo,whirligig-widget";` be applied to? 
Will it override the compatible property of the `widget{n}`? If I am 
right, then I guess the connector will have a single driver instead of 
each widget having a unique driver attached to it.

> A plugin could also expose a secondary connector.  Here's one which
> adds a "superbus" controller mapped into the parent's MMIO bus.
>
> /dts-v1/;
>
> /plugin/ foo,widget-socket-v2 {
> 	compatible = "foo,superduper-widget};
>
> 	connectors {
> 		compatible = "foo,super-socket";
> 		aliases {
> 			superbus = &superbus;
> 		};	
> 	};
> };
>
> &mmio {
> 	superbus: super-bridge@100000000 {
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		ranges = <0x0  0xabcd0000 0x12345600  0x100>;
> 	};
> };
>
> &i2c {
> 	super-controller@... {
> 		...
> 	};
> 	duper-controller@... {
> 	};
> };
>
>

[0]: 
https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/


Ayush Singh

