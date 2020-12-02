From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] libfdt: Change last_comp_version to fit spec
Date: Wed, 2 Dec 2020 08:25:04 -0700
Message-ID: <CAL_Jsq+aio50a18QrwA6VbxZmOYyzcC+tRkkxPkBPyLNcfh-5w@mail.gmail.com>
References: <20201124174945.5399-1-jujugoboom@gmail.com> <20201124174945.5399-2-jujugoboom@gmail.com>
 <CAL_Jsq+CZA8weCYPcJYOdY3-z8fnwibsKhfGwO8nuy+7RH=pvg@mail.gmail.com> <20201202074627.GA87@DESKTOP-F375L8M.localdomain>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606922718;
        bh=nW+xTzJ8CsukPMCQUPJScL5wxOQLI2OjFyauwWBA+xY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kzW3v8zAzQ3X6scAvLaPaA4WP9JWJIuKmERoSLwQpIvzOJ2oX5uL17S4Fw58B4yDM
         Q9snvIECIRkK7uCGZfk98LOJwaXjjaaJBmDiSdEt2C3gvpmE57uqi0FqG25JPCev55
         ubZm5OTy5tRagiPLKM7ssFwFwTWBkYJgDX92S3ow=
In-Reply-To: <20201202074627.GA87-cyTpl0DnfLBQ0J4zD59KJAH0AcctZ4a01BehtkLrGTY@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Dec 2, 2020 at 12:46 AM Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Mon, Nov 30, 2020 at 10:22:09AM -0700, Rob Herring wrote:
> > On Tue, Nov 24, 2020 at 10:50 AM Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> >
> > Needs a commit message. For a single patch, you don't need a cover
> > letter. The explanation should be here.
> >
> > Besides matching the spec, what problem are you trying to solve?
> >
>
> Sorry about that, first time contributing. I'm trying to help with
> interoperability with other libraries that are made to read/write DTBs
> by matching the spec.

What library? Why does libfdt not work?

> > > ---
> > >  libfdt/fdt_sw.c | 2 +-
> > >  libfdt/libfdt.h | 1 +
> > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> > > index 68b543c..4c569ee 100644
> > > --- a/libfdt/fdt_sw.c
> > > +++ b/libfdt/fdt_sw.c
> > > @@ -377,7 +377,7 @@ int fdt_finish(void *fdt)
> > >         fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));
> > >
> > >         /* And fix up fields that were keeping intermediate state. */
> > > -       fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
> > > +       fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);
> > >         fdt_set_magic(fdt, FDT_MAGIC);
> > >
> > >         return 0;
> > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > index 89adee3..abad93b 100644
> > > --- a/libfdt/libfdt.h
> > > +++ b/libfdt/libfdt.h
> > > @@ -14,6 +14,7 @@ extern "C" {
> > >  #endif
> > >
> > >  #define FDT_FIRST_SUPPORTED_VERSION    0x02
> > > +#define FDT_LAST_COMPATIBLE_VERSION 0x10
> >
> > If the above change is correct (I'm not sure it is offhand), why not
> > just bump up FDT_FIRST_SUPPORTED_VERSION value?
> >
>
> I didn't want to bump the FDT_FIRST_SUPPORTED_VERSION to maintin
> backwards compatability, and assumed that libfdt actually does support
> working with DTBs down to version 2.

Looking at this more closely, I think your change is correct. It's
actually fixing a regression. Prior to commit f1879e1a50eb ("Add
limited read-only support for older (V2 and V3) device tree to
libfdt."), libfdt would set last_comp_version to 16. Now it sets it to
2, but really 2 is what libfdt can read, not what should be in
last_comp_version.

Also, I'm not certain what happens if you tried to modify a version 2
dtb. It doesn't look like we do anything to fail gracefully.

Rob
