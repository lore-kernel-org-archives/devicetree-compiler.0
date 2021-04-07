From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add FDT alignment check to fdt_check_header()
Date: Wed, 7 Apr 2021 12:25:52 -0500
Message-ID: <CAL_JsqK+h8v2PY9W2jzoAihFwb+7T0oqkoSKrtOSf1mgYfU1mA@mail.gmail.com>
References: <20210406190712.2118098-1-robh@kernel.org> <CAPnjgZ3fmzymABa4orPYxVQG4SaprSXZa+4AT9=yBYm8B6Md_Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617816365;
        bh=rJZ5ujHc1sFuS0Ytd1Cu/L+6Y8fIgeFC8IrMGPcWckA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NI0uWNIA/Bdr21xeIIKk+ipzWGuMMrYZIPIp8PcZPQbAeO1JNURL5Gf/WLdt56JS6
         bzCK0KT82aSWpxcEvI+/w25Y315A3GlD0VWrCoDVXxZV7GIdS8u1auxK5ZPEBbDufV
         ejvL4gWj1X3GiSqrmIyWjF2sdqBhTM90654DHxXZBJRtVndBWeeYza+5khI+d1oO7O
         FELwM4Y5NO37xkRSPkimiDKpb/AzRL3SpCLMcQ+XACHgmzBD8ZQZLAO/Ud4r1hGIVf
         Tj7TpfFrsSy1oPYqFMIS/wzc8JJZAxNYZJ3rB6pxa9YR3Mjn/OO2XDoNYixstRiTIL
         lbIYWx+y2+XUQ==
In-Reply-To: <CAPnjgZ3fmzymABa4orPYxVQG4SaprSXZa+4AT9=yBYm8B6Md_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Wed, Apr 7, 2021 at 10:35 AM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Hi Rob,
>
> On Wed, 7 Apr 2021 at 07:07, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > Only checking the FDT alignment in fdt_ro_probe_() means that
> > fdt_check_header() can pass, but then subsequent API calls fail on
> > alignment checks. Let's add an alignment check to fdt_check_header() so
> > alignment errors are found up front.
> >
> > Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> > For background, the new alignment check triggered a crash in the
> > linux kernel. Yes, we should fix the error handling, but
> > fdt_check_header() shouldn't tell us the FDT is valid only to fail
> > later on.
> >
> > Maybe we should move the check instead, but fdt_ro_probe_() and
> > fdt_check_header() already have a lot of the same checks.
> >
> >  libfdt/fdt.c | 4 ++++
> >  1 file changed, 4 insertions(+)
>
> At present U-Boot uses a 4-byte alignment, so far as I know, so this
> will break things.

It was the u-boot folks that wanted this in the first place... Look at
the recent commits from Tom and the discussion on the list about them.

> Is this because of the need to align the memory-reservation block?

But yes, the spec does require some sections to be 8-byte aligned
which implies the whole thing has to be.

Rob
