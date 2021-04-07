From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add FDT alignment check to fdt_check_header()
Date: Thu, 8 Apr 2021 06:36:53 +1200
Message-ID: <CAPnjgZ2rGyCVQwQ3aP+=wF99R+2C_POV1Y=18jd8eAd+sOqSZQ@mail.gmail.com>
References: <20210406190712.2118098-1-robh@kernel.org> <CAPnjgZ3fmzymABa4orPYxVQG4SaprSXZa+4AT9=yBYm8B6Md_Q@mail.gmail.com>
 <20210407180913.GU1310@bill-the-cat>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XaTce+IY51vr7bCY9dQdCXquSy5Hj2er7Iure9f4p3s=;
        b=Ggxh7svYY416pGN/UQxLyLtG91xr2Zkn3KQFirlyIvuYfyyhC1bOJ4frp1ciykVyVP
         m6HTRhs2Lx969s54o/GrYTk4tsKKKkdJwpMx4QiRs4Wgjm6H7jczFkiMIC9TqU/MDTOn
         rxaTBy/YMhsco7REW6k+P603+pjCpM+PPjmdk=
In-Reply-To: <20210407180913.GU1310@bill-the-cat>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi Tom & Rob,

On Thu, 8 Apr 2021 at 06:09, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>
> On Thu, Apr 08, 2021 at 03:35:35AM +1200, Simon Glass wrote:
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
> It's 8 byte, not 4 byte and I have nothing good to say about places that
> get by with 4-and-not-8 alignment.

I am thinking of this in arch/arm/cpu/u-boot.lds :

. = ALIGN(4);

.image_copy_end : {

At least for now, we use 4-byte alignment on 32-bit ARM, for example.

Regards,
Simon
