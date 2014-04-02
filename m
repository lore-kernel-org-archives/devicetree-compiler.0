From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Wed, 2 Apr 2014 16:01:38 -0500
Message-ID: <CAL_JsqL9_8ADL+EKb0ZTzrDWhnk+qaNiB0n33pO+DQRVMb1kzg@mail.gmail.com>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
	<1396393358.32034.40.camel@snotra.buserror.net>
	<20140402142403.9d3316f14520252a4a3474e0@freescale.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=Iyz3qYNm6ksmUNVNaUwoScaLiSgsIeiPb9C6CUVJaUM=;
        b=mYKRSTtsWN9lVlubpp2mN0lszy0nabbtEIfx3rkZnGIYyb1EvgaUxNbp4VYzO3KJct
         f8BjteXLHvdBpwWN+DH4Z7TWtjqlsh1xWELqoTQhUOqSDNK8txYrsZbdYOLIGYZgr5w6
         HmTQ/PhGzs7eIBRJ9sesGzXXrWnE29Mar+WaF2BHGl3IVxbzHmzQ1VQF90YDtuMhRJG7
         7PRQbbyDQKd8DldBUR6z8kDA+JMgY+pGZnCk5gV9TvwYij7bAmGzP66I7Sj3YiQmJzXW
         6GecqgjYjtj9xooMgwQXCIPs8ATrcnoVVRFS7gTrplIFq3RbTtx2ex0LJHfTyjb4ZHpw
         3oaA==
In-Reply-To: <20140402142403.9d3316f14520252a4a3474e0-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

On Wed, Apr 2, 2014 at 2:24 PM, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Tue, 1 Apr 2014 18:02:38 -0500
> Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>> On Tue, 2014-04-01 at 11:57 -0500, Rob Herring wrote:
>> > From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> >
>> > Add FDT based address translation. Currently, only simple bus
>> > translations are supported, but the framework allows adding other
>> > buses like PCI. Adding this to libfdt allows the address
>> > translation code to be shared amongst u-boot, Linux kernel and other
>> > projects.
>> >
>> > This code is based on GPL only licensed code. It must first be
>> > re-licensed for dual GPL/BSD to add to libfdt which requires approval
>> > from the copyright holders.
>> >
>> > This code is copied from u-boot common/fdt_support.c. The portion used
>> > here was originally added to u-boot by Kumar Gala in 2010 and Freescale
>> > is the copyright holder. Later changes have also only been done by
>> > Freescale authors. The u-boot code appears to have been copied from the
>> > Linux kernel's address translation code in drivers/of/address.c which
>> > has no copyright. This code was moved by Grant Likely in 2010 and
>> > originated from arch/powerpc/kernel/prom_parse.c which was written by
>> > Ben Herrenschmidt. Who is the copyright holder on a file in the kernel
>> > with no copyright? Does this default to the author or Linus or nobody?
>>
>> ACK for the Freescale contribution (on copyright issues, not technical -- see below).
>
> FWIW, ack from me too.

Thanks.

>> +/* Default translator (generic bus) */
>> +static void fdt_bus_default_count_cells(void *blob, int parentoffset,
>> +                                     int *addrc, int *sizec)
>
> space before tab in indent (git am).
>
> Also, thanks for not introducing new sparse warnings :)

I believe that's mainly because someone already did on the u-boot source. :)

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
