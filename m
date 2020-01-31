From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 2/6] Add a way to control the level of checks in the code
Date: Fri, 31 Jan 2020 11:14:26 -0700
Message-ID: <CAPnjgZ2x7yi3tgzRkM9m-2JBpYVqaXz42KLNiyUA6nPHu3KjqA@mail.gmail.com>
References: <20191113015422.67210-1-sjg@chromium.org> <20191113015422.67210-3-sjg@chromium.org>
 <20200128082819.GH42099@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8XodFi/xLeluxzFKWZevxeVajOJEcIH9F7cpltQQdYw=;
        b=Xf8l1SM8CwFODbJHOvuTPZSxtJwcyO7ckQM/oY1ylrxi0b7/v3AGTBBGlIs2hfnufW
         PK5KsLjrAR4wH+6QFrjkR2al6NY65O9h+pirwyL0N+eYW/OtFtzPA0Ftze5WPKGWkJej
         imRoEvmOWWveLg4XOSOycoTB+AUvTVCziPEWE=
In-Reply-To: <20200128082819.GH42099-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On Tue, 28 Jan 2020 at 01:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Nov 12, 2019 at 06:54:18PM -0700, Simon Glass wrote:
> > Add a new ASSUME_MASK option, which allows for some control over the
> > checks used in libfdt. With all assumptions enabled, libfdt assumes that
> > the input data and parameters are all correct and that internal errors
> > cannot happen.
> >
> > By default no assumptions are made and all checks are enabled.
> >
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> >
> > Changes in v4:
> > - Add a can_assume() macros and squash the inline functions into one
> > - Drop unnecessary FDT_ prefix
> > - Fix 'Incosistencies' typo
> > - Merge the 'friendly' and 'sane' checks into one
> > - Update and expand comments
> >
> > Changes in v3:
> > - Expand the comments about each check option
> > - Invert the checks to be called assumptions
> > - Move header-version code to fdt.c
> > - Move the comments on check options to the enum
> > - Use hex for CHK_MASK
> >
> > Changes in v2:
> > - Add an fdt_ prefix to avoid namespace conflicts
> > - Use symbolic names for _check functions and drop leading underscores
> >
> >  Makefile                 |  6 ++-
> >  libfdt/libfdt_internal.h | 88 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 93 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 4d88157..bdeaf93 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -16,7 +16,11 @@ EXTRAVERSION =
> >  LOCAL_VERSION =
> >  CONFIG_LOCALVERSION =
> >
> > -CPPFLAGS = -I libfdt -I .
> > +# Control the assumptions made (e.g. risking security issues) in the code.
> > +# See libfdt_internal.h for details
> > +ASSUME_MASK ?= 0
> > +
> > +CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
> >  WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> >       -Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
> >  CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
> > diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> > index 058c735..198480c 100644
> > --- a/libfdt/libfdt_internal.h
> > +++ b/libfdt/libfdt_internal.h
> > @@ -48,4 +48,92 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(void *fdt, int n)
> >
> >  #define FDT_SW_MAGIC         (~FDT_MAGIC)
> >
> > +/**********************************************************************/
> > +/* Checking controls                                                  */
> > +/**********************************************************************/
> > +
> > +#ifndef FDT_ASSUME_MASK
> > +#define FDT_ASSUME_MASK 0
> > +#endif
> > +
> > +/*
> > + * Defines assumptions which can be enabled. Each of these can be enabled
> > + * individually. For maximum saftey, don't enable any assumptions!
> > + *
> > + * For minimal code size and no safety, use ASSUME_PERFECT at your own risk.
> > + * You should have another method of validating the device tree, such as a
> > + * signature or hash check before using libfdt.
> > + *
> > + * For situations where security is not a concern it may be safe to enable
> > + * ASSUME_SANE.
> > + */
> > +enum {
> > +     /*
> > +      * This does essentially no checks. Only the latest device-tree
> > +      * version is correctly handled. Inconsistencies or errors in the device
> > +      * tree may cause undefined behaviour or crashes.
>
> Likewise for errors in parameters, yes?

Will add

>
> > +      * If an error occurs when modifying the tree it may leave the tree in
> > +      * an intermediate (but valid) state. As an example, adding a property
> > +      * where there is insufficient space may result in the property name
> > +      * being added to the string table even though the property itself is
> > +      * not added to the struct section.
> > +      *
> > +      * Only use this if you have a fully validated device tree with
> > +      * the latest supported version and wish to minimise code size.
> > +      */
> > +     ASSUME_PERFECT          = 0xff,
> > +
> > +     /*
> > +      * This assumes that the device tree is sane. i.e. header metadata
> > +      * and basic hierarchy are correct.
> > +      *
> > +      * It also assumes libfdt functions are called with valid parameters,
> > +      * i.e. not trigger FDT_ERR_BADOFFSET or offsets that are out of bounds.
> > +      * It disables any extensive checking of parameters and the device
> > +      * tree, making various assumptions about correctness. Normal device
> > +      * trees produced by libfdt and the compiler should be handled safely.
> > +      * Malicious device trees and complete garbage may cause libfdt to
> > +      * behave badly or crash.
> > +      *
> > +      * These checks will be sufficient if you have a valid device tree with
> > +      * no internal inconsistencies and call libfdt with correct parameters.
> > +      * With this assumption, libfdt will generally not return
> > +      * -FDT_ERR_INTERNAL, -FDT_ERR_BADLAYOUT, etc.
> > +      */
> > +     ASSUME_SANE             = 1 << 0,
>
> How tricky would it be to split this into ASSUME_VALID_DTB and
> ASSUME_VALID_PARAMETERS?  I don't know useful those are on their own,
> but it seems to me it might be easier to define the effect of this if
> split that way.

From my reading of the checks I've added, we could split out the
ASSUME_VALID_DTB assumption and that would have some checks in it
(e.g. in fdt_check_header()).

But for parameters the code doesn't currently check whether the DT or
the argument is wrong. E.g.:

const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
{
unsigned absoffset = offset + fdt_off_dt_struct(fdt);

if (!can_assume(SANE))
if ((absoffset < offset)
    || ((absoffset + len) < absoffset)
    || (absoffset + len) > fdt_totalsize(fdt))
return NULL;

Either the struct offset or @offset could be wrong here.

I think we could use ASSUME_VALID_DTB for the checks where it makes
sense. For the others we could perhaps assume that the DTB is valid
and blame any failure on parameters. So:

- anything that has no parameters in the check would use ASSUME_VALID_DTB
- anything else would use ASSUME_VALID_PARAMETERS

What do you think?

>
> > +
> > +     /*
> > +      * This disables checks for device-tree version and removes all code
> > +      * which handles older versions.
> > +      *
> > +      * Only enable this if you know you have a device tree with the latest
> > +      * version.
> > +      */
> > +     ASSUME_LATEST           = 1 << 1,
> > +
> > +     /*
> > +      * This assume that it is OK for a failed additional to the device tree
> > +      * due to lack of space or some other problem can skip any rollback
> > +      * steps (such as dropping the property name from the string table).
> > +      * This is safe to enable in most circumstances, even though it may
> > +      * leave the tree in a sub-optimal state.
> > +      */
> > +     ASSUME_NO_ROLLBACK      = 1 << 2,
> > +};
> > +
> > +/**
> > + * _can_assume() - check if a particular assumption is enabled
>
> Don't use a leading _ please, that's reserved for system libraries.
> I've moved to trailing _ for that reason.

OK.

>
> > + *
> > + * @mask: Mask to check (ASSUME_...)
> > + * @return true if that assumption is enabled, else false
> > + */
> > +static inline bool _can_assume(int mask)
> > +{
> > +     return FDT_ASSUME_MASK & mask;
> > +}
> > +
> > +/** helper macros for checking assumptions */
> > +#define can_assume(_assume)  _can_assume(ASSUME_ ## _assume)
> > +
> >  #endif /* LIBFDT_INTERNAL_H */

Regards,
Simon
