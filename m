From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 5/6] libfdt: Add support for disabling version checks
Date: Fri, 31 Jan 2020 11:14:27 -0700
Message-ID: <CAPnjgZ02B2pu9vSh2uUf-4e5HZCWq2nOcpMXrrnXJTv98oScEw@mail.gmail.com>
References: <20191113015422.67210-1-sjg@chromium.org> <20191113015422.67210-6-sjg@chromium.org>
 <20200128083709.GK42099@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hb2SjFU172cZhtfvK5mjlcZ2GELbpRNzVL/1gKZTKFU=;
        b=kOS+ipblGDZ1qQKvYHVXQx1xCDIIctHryD11mU4Fm1QBu60PGvHG+xuMd8qa1nrtEp
         78uKQTMIdCTXscjisSrz1111V+YNNe+XOhXKSH4oK+D8VxlH+Jfa7c+vRc2XAV9JlinG
         +J3tNGIxglj0BgWTb82QUql4HfLTnDiwE4+w4=
In-Reply-To: <20200128083709.GK42099-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On Tue, 28 Jan 2020 at 01:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Nov 12, 2019 at 06:54:21PM -0700, Simon Glass wrote:
> > Allow enabling FDT_ASSUME_LATEST to disable version checks.
> >
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> LGTM, one minor comment below.
>
> > ---
> >
> > Changes in v4: None
> > Changes in v3: None
> > Changes in v2: None
> >
> >  libfdt/fdt.c    | 34 +++++++++++++++++++++-------------
> >  libfdt/fdt_ro.c | 16 ++++++++--------
> >  libfdt/fdt_rw.c |  6 +++---
> >  3 files changed, 32 insertions(+), 24 deletions(-)
> >
> > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > index d89c0e0..78dbe58 100644
> > --- a/libfdt/fdt.c
> > +++ b/libfdt/fdt.c
> > @@ -21,10 +21,13 @@ int32_t fdt_ro_probe_(const void *fdt)
> >
> >       if (fdt_magic(fdt) == FDT_MAGIC) {
> >               /* Complete tree */
> > -             if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> > -                     return -FDT_ERR_BADVERSION;
> > -             if (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION)
> > -                     return -FDT_ERR_BADVERSION;
> > +             if (!can_assume(LATEST)) {
> > +                     if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> > +                             return -FDT_ERR_BADVERSION;
> > +                     if (fdt_last_comp_version(fdt) >
> > +                                     FDT_LAST_SUPPORTED_VERSION)
> > +                             return -FDT_ERR_BADVERSION;
> > +             }
> >       } else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
> >               /* Unfinished sequential-write blob */
> >               if (fdt_size_dt_struct(fdt) == 0)
> > @@ -72,7 +75,8 @@ size_t fdt_header_size_(uint32_t version)
> >
> >  size_t fdt_header_size(const void *fdt)
> >  {
> > -     return fdt_header_size_(fdt_version(fdt));
> > +     return can_assume(LATEST) ? FDT_V17_SIZE :
> > +             fdt_header_size_(fdt_version(fdt));
> >  }
> >
> >  int fdt_check_header(const void *fdt)
> > @@ -81,11 +85,14 @@ int fdt_check_header(const void *fdt)
> >
> >       if (fdt_magic(fdt) != FDT_MAGIC)
> >               return -FDT_ERR_BADMAGIC;
> > -     if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> > -         || (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION))
> > -             return -FDT_ERR_BADVERSION;
> > -     if (fdt_version(fdt) < fdt_last_comp_version(fdt))
> > -             return -FDT_ERR_BADVERSION;
> > +     if (!can_assume(LATEST)) {
> > +             if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> > +                 || (fdt_last_comp_version(fdt) >
> > +                     FDT_LAST_SUPPORTED_VERSION))
> > +                     return -FDT_ERR_BADVERSION;
> > +             if (fdt_version(fdt) < fdt_last_comp_version(fdt))
> > +                     return -FDT_ERR_BADVERSION;
> > +     }
> >       hdrsize = fdt_header_size(fdt);
> >       if (!can_assume(SANE)) {
> >
> > @@ -101,7 +108,7 @@ int fdt_check_header(const void *fdt)
> >
> >       if (!can_assume(SANE)) {
> >               /* Bounds check structure block */
> > -             if (fdt_version(fdt) < 17) {
> > +             if (!can_assume(LATEST) && fdt_version(fdt) < 17) {
>
> I wonder if we should make fdt_version() return 17 unconditionally in
> the can_assume() case, which might make some of these tests redundant.

I think that would require fdt_version() to change from being a macro,
since we cannot check assumptions in libfdt.h without including
libfdt_internal.h in libfdt.h

Is that acceptable?

Regards,
Simon
