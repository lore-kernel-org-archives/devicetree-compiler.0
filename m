From: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] libfdt: Change last_comp_version to fit spec
Date: Tue, 1 Dec 2020 23:46:27 -0800
Message-ID: <20201202074627.GA87@DESKTOP-F375L8M.localdomain>
References: <20201124174945.5399-1-jujugoboom@gmail.com>
 <20201124174945.5399-2-jujugoboom@gmail.com>
 <CAL_Jsq+CZA8weCYPcJYOdY3-z8fnwibsKhfGwO8nuy+7RH=pvg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pMfG7mKpKPyocIGuKy1RGoIj1D1KpaG8Evd9ErGWj7M=;
        b=RfDy4jh1xKjSVtIsM44UVg3re2G/sEAvGrbvZuTj+SK93N7Ia3qaTGmg4FHYnBReOy
         HuInxQUhZBxG5C+NHwyd7BTFV1tTb1mafMg3Df4Il44Df36gihmkxCXEP56mH9fw0EMF
         u2e3QDP7q7xkMklq5E1c4AknDGKiq6ySDRir29QYVujP5nTPPAFCvyYLSDCM29r/JlnG
         oGWAGMVEQeqeHFc5dliBsoDX7NruahMgEso6ZmZZoSjaBIk7I32PHNJ8GB/BvyIy0B2M
         UAsJ64/A8tOFJeqUQbxAbvV11syDPA2BbxcFzYgKWgdXsMwDxVs2fOIQZCdmqWThkjvZ
         7gDg==
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+CZA8weCYPcJYOdY3-z8fnwibsKhfGwO8nuy+7RH=pvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Nov 30, 2020 at 10:22:09AM -0700, Rob Herring wrote:
> On Tue, Nov 24, 2020 at 10:50 AM Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> 
> Needs a commit message. For a single patch, you don't need a cover
> letter. The explanation should be here.
>
> Besides matching the spec, what problem are you trying to solve?
>

Sorry about that, first time contributing. I'm trying to help with
interoperability with other libraries that are made to read/write DTBs
by matching the spec.

> > ---
> >  libfdt/fdt_sw.c | 2 +-
> >  libfdt/libfdt.h | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> > index 68b543c..4c569ee 100644
> > --- a/libfdt/fdt_sw.c
> > +++ b/libfdt/fdt_sw.c
> > @@ -377,7 +377,7 @@ int fdt_finish(void *fdt)
> >         fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));
> >
> >         /* And fix up fields that were keeping intermediate state. */
> > -       fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
> > +       fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);
> >         fdt_set_magic(fdt, FDT_MAGIC);
> >
> >         return 0;
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index 89adee3..abad93b 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -14,6 +14,7 @@ extern "C" {
> >  #endif
> >
> >  #define FDT_FIRST_SUPPORTED_VERSION    0x02
> > +#define FDT_LAST_COMPATIBLE_VERSION 0x10
> 
> If the above change is correct (I'm not sure it is offhand), why not
> just bump up FDT_FIRST_SUPPORTED_VERSION value?
> 

I didn't want to bump the FDT_FIRST_SUPPORTED_VERSION to maintin
backwards compatability, and assumed that libfdt actually does support
working with DTBs down to version 2.

> >  #define FDT_LAST_SUPPORTED_VERSION     0x11
> >
> >  /* Error codes: informative error codes */
> > --
> > 2.25.1
> >
