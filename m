From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add FDT alignment check to fdt_check_header()
Date: Thu, 8 Apr 2021 06:35:32 +1200
Message-ID: <CAPnjgZ2q8Hudq456ZLhNG6seLhcAVpdHyB5Ceyq5LV+ZFy2khw@mail.gmail.com>
References: <20210406190712.2118098-1-robh@kernel.org> <CAPnjgZ3fmzymABa4orPYxVQG4SaprSXZa+4AT9=yBYm8B6Md_Q@mail.gmail.com>
 <CAL_JsqK+h8v2PY9W2jzoAihFwb+7T0oqkoSKrtOSf1mgYfU1mA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UbMlKSicTYuGJQkFz+VWOv7LmChTqU08ORcpmhamhX8=;
        b=VzHmF0nDmXY05YcQxx65GHxgpbiv2iHi8eNHWZcwgKxW81oOHa63JxuYwaLMJrUQDe
         pn55YsUqSle4Xie9DSzjhsY01ReeSSXJQ96KMZ3AN8XT+wu9YE+GSxvjFybhej2j5pI9
         CJi/aDDa+3V9c1pew2saWic0N1/+pbA+WvgIY=
In-Reply-To: <CAL_JsqK+h8v2PY9W2jzoAihFwb+7T0oqkoSKrtOSf1mgYfU1mA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi Rob,

On Thu, 8 Apr 2021 at 05:26, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Wed, Apr 7, 2021 at 10:35 AM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > Hi Rob,
> >
> > On Wed, 7 Apr 2021 at 07:07, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > >
> > > Only checking the FDT alignment in fdt_ro_probe_() means that
> > > fdt_check_header() can pass, but then subsequent API calls fail on
> > > alignment checks. Let's add an alignment check to fdt_check_header() so
> > > alignment errors are found up front.
> > >
> > > Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > ---
> > > For background, the new alignment check triggered a crash in the
> > > linux kernel. Yes, we should fix the error handling, but
> > > fdt_check_header() shouldn't tell us the FDT is valid only to fail
> > > later on.
> > >
> > > Maybe we should move the check instead, but fdt_ro_probe_() and
> > > fdt_check_header() already have a lot of the same checks.
> > >
> > >  libfdt/fdt.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> >
> > At present U-Boot uses a 4-byte alignment, so far as I know, so this
> > will break things.
>
> It was the u-boot folks that wanted this in the first place... Look at
> the recent commits from Tom and the discussion on the list about them.

OK I guess I just missed that. I recall the push-back against
supporting unaligned access but not the 8-byte stuff.

>
> > Is this because of the need to align the memory-reservation block?
>
> But yes, the spec does require some sections to be 8-byte aligned
> which implies the whole thing has to be.

I was looking at that but from what I could tell it is not stated
anywhere. In fact it is, but I missed it.

I sent:

https://github.com/devicetree-org/devicetree-specification/pull/43

Regards,
Simon
