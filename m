From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 07/10] pylibfdt: Add a method to access the device tree directly
Date: Sun, 20 Aug 2017 21:04:43 -0600
Message-ID: <CAPnjgZ1BEvqFU4V1j5cXzjON+N-+oFEx7e1MdZKu7840x0KZeg@mail.gmail.com>
References: <20170819171803.195806-1-sjg@chromium.org> <20170819171803.195806-7-sjg@chromium.org>
 <20170821001714.GC12356@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=SkYrwAM7pldeyHtyGfPRGrLEnBfLUaj8+sD7RvdC7hs=;
        b=SuDQG+QV2f1pwPrWc22xigdJf733ZGUcJf1AOoN/+6zUxyLC3PY1/ZwJ1dDYygBXhs
         Rel15u8PTCD4XC6+6AfQoFkXTrjB5hrUgv1wrrNpM9wyK2w6IxHiicxhz76NDx3AJmRD
         eVmlBaYrTn5+5dXj/i088Zr35Y5z52UiMNsGRTIWqY4n4pamt0x/944p+vZ12q0EFcs6
         KbBH/NdRHgxD2uE9VBJwKUJUbh2TSt66SDb9S6dFJq65tMV6mjPITBJEkDfY43coIcVA
         Xc33HtQittfv4ijN1TtDaIKtmDi3YgV2ffXbqTdpo4Fr4Dc/n5sQAGLREEHN5Eq+js+J
         0GOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=SkYrwAM7pldeyHtyGfPRGrLEnBfLUaj8+sD7RvdC7hs=;
        b=cv9QfYcZecSUbks9oSU62uXgBAcFdyPJtygnXoexfOAM3P+KLnjQCZ+IIJlRhwmWbz
         2x8wzM9gBy0HypOUXQigXXfFTe2DlHz2Q5GzypxIovZOaePfjLhYLbTFMXsPoYkxElNI
         WUJ5tdfkvQEjzSqwg+vncYrfBIKJ8sAWJUuWI=
In-Reply-To: <20170821001714.GC12356-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: hg-K0bRW+63XPQe6aEkudXLsA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On 20 August 2017 at 18:17, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Sat, Aug 19, 2017 at 11:18:00AM -0600, Simon Glass wrote:
>> When calling libfdt functions which are not supported by the Fdt class it
>> is necessary to get direct access to the device tree data. At present this
>> requries using the internal _fdt member. Add a new method to provide
>> public access to this.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> I've applied patches 1-6 already.
>
> This looks fine, except I'm dubious about the name.  "get_fdt" from an
> fdt object seems a bit.. tautological?  How about "as_bytestring"?

Well, sure it is.

It is the only way to get something that can be passed to the libfdt
function. So as_bytestring() seems a bit obscure, even though it is
more descriptive. I would suggest get_blob() except we don't really
use that name in libfdt.h.

I will have a think and then send v2.

Regards,
Simon
