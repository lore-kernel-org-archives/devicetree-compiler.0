From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Mon, 28 Apr 2014 13:12:39 -0500
Message-ID: <CAL_JsqJtHztzffaZZTQWngKEw4Z+wim7RvwdkTgc4zGiGG+tSA@mail.gmail.com>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
	<1396393358.32034.40.camel@snotra.buserror.net>
	<CAL_JsqKMUHiPeU7iQDHZ=E6GzMxvXBB4L8Arg+m0JrfQsRkhtg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=+2Kzc4bDwM/KG/13uLwlSjg2MK7jV0NqmKpCeYI9BM4=;
        b=rftdrT/VyN3agpr5dd530Y0pqJokAE1JBr+U4KnfixRmO+I/LuxPB28HW//5GMMwnC
         0bo3ghQMnxvfcWVISVh89o/svjqucckLZ9C/wLLFY0Wcoc2+8LOxv1K6vjYoGuuqSsqd
         XPQnF5qwCZBWmrhT59xyi9Dr/n3VAbJ/13HqWKHjg631AWPh17xjKQkpP0jcyexLOw7M
         uZCChO1oIB7REzn/Rd5MBMut1Yt0ReABw1FwIFC7iLjKIOamCqJv/mdWJvUV2JphXpjS
         Pv4gdal1xn7BTOZHry1einUSkDgokWocNnsVUmPav0HMknIIHiYZbTg0K45c9UbvWgxi
         eKjQ==
In-Reply-To: <CAL_JsqKMUHiPeU7iQDHZ=E6GzMxvXBB4L8Arg+m0JrfQsRkhtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

On Tue, Apr 15, 2014 at 9:03 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Ben,
>
> On Tue, Apr 1, 2014 at 6:02 PM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> On Tue, 2014-04-01 at 11:57 -0500, Rob Herring wrote:
>>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>
>>> Add FDT based address translation. Currently, only simple bus
>>> translations are supported, but the framework allows adding other
>>> buses like PCI. Adding this to libfdt allows the address
>>> translation code to be shared amongst u-boot, Linux kernel and other
>>> projects.
>>>
>>> This code is based on GPL only licensed code. It must first be
>>> re-licensed for dual GPL/BSD to add to libfdt which requires approval
>>> from the copyright holders.
>>>
>>> This code is copied from u-boot common/fdt_support.c. The portion used
>>> here was originally added to u-boot by Kumar Gala in 2010 and Freescale
>>> is the copyright holder. Later changes have also only been done by
>>> Freescale authors. The u-boot code appears to have been copied from the
>>> Linux kernel's address translation code in drivers/of/address.c which
>>> has no copyright. This code was moved by Grant Likely in 2010 and
>>> originated from arch/powerpc/kernel/prom_parse.c which was written by
>>> Ben Herrenschmidt. Who is the copyright holder on a file in the kernel
>>> with no copyright? Does this default to the author or Linus or nobody?
>>
>> ACK for the Freescale contribution (on copyright issues, not technical -- see below).
>
> Can you please comment on the re-licensing of this code.
>

Ping.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
