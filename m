From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 3/7] libfdt: Add support for disabling dtb checks
Date: Tue, 11 Feb 2020 18:20:56 -0700
Message-ID: <CAPnjgZ2m+XuenNZaFAB5MJdo0W99JLDR3J_=eDFBFUDZZCiS4g@mail.gmail.com>
References: <20200206054034.162732-1-sjg@chromium.org> <20200206054034.162732-4-sjg@chromium.org>
 <20200210040201.GA22584@umbus.fritz.box> <CAPnjgZ3Ut2CCVqDnRiafMqR+sV0eMn_obhcXYLfbuQgXhhPS1Q@mail.gmail.com>
 <20200211014254.GJ22584@umbus.fritz.box> <CAPnjgZ2M+Y7ExHar2+iCinW+w8DniNUFn=_VRs+-_+zfRuoG7Q@mail.gmail.com>
 <20200212005316.GM22584@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ef83j8ZZMnWy+2TH+4yOtrjpxlp15IKMPvjLH6f9pws=;
        b=dtLZtKh3qky18Qwm90N36Wlt0c9t63Uw5/tMZw58u3bj3vu0Ihf8/QhcaZWJqPQSRX
         kA4ZQb9FTMlWiOlaKX+jwtdo61hjVFl4KbSBs3EvxpoKOo5U5VauSQL/H7ADfWR+FrO/
         yXhVvfTropfHFynKkahfT6Aj6LHYXUIJwJfCk=
In-Reply-To: <20200212005316.GM22584-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi David,

On Tue, 11 Feb 2020 at 18:12, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Feb 11, 2020 at 01:08:41PM -0700, Simon Glass wrote:
> > Hi David,
> >
> > On Mon, 10 Feb 2020 at 18:43, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Mon, Feb 10, 2020 at 06:04:47PM -0700, Simon Glass wrote:
> > > > Hi David,
> > > >
> > > > On Sun, 9 Feb 2020 at 23:31, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > >
> > > > > On Wed, Feb 05, 2020 at 10:40:30PM -0700, Simon Glass wrote:
> > > > > > Support ASSUME_VALID_DTB to disable some sanity checks
> > > > > >
> > > > > > If we assume that the DTB itself is valid then we can skip some checks and
> > > > > > save code space. Add various conditions to handle this.
> > > > > >
> > > > > > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > > > ---
> > > > > >
> > > > > > Changes in v5:
> > > > > > - Split out VALID_DTB checks into a separate patch
> > > > > >
> > > > > > Changes in v4: None
> > > > > > Changes in v3: None
> > > > > > Changes in v2: None
> > > > > >
> > > > > >  libfdt/fdt.c             | 50 ++++++++++++++++++++++------------------
> > > > > >  libfdt/fdt_ro.c          |  7 ++++--
> > > > > >  libfdt/fdt_rw.c          |  7 +++++-
> > > > > >  libfdt/fdt_sw.c          | 30 ++++++++++++++++--------
> > > > > >  libfdt/libfdt_internal.h |  7 ++++--
> > > > > >  5 files changed, 64 insertions(+), 37 deletions(-)
> > > > > >
> > > > > > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > > > > > index 3e37a4b..03f2b7d 100644
> > > > > > --- a/libfdt/fdt.c
> > > > > > +++ b/libfdt/fdt.c
> > > > > > @@ -81,38 +81,44 @@ int fdt_check_header(const void *fdt)
> > > > > >
> > > > > >       if (fdt_magic(fdt) != FDT_MAGIC)
> > > > > >               return -FDT_ERR_BADMAGIC;
> > > > > > -     hdrsize = fdt_header_size(fdt);
> > > > > >       if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> > > > > >           || (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION))
> > > > > >               return -FDT_ERR_BADVERSION;
> > > > > >       if (fdt_version(fdt) < fdt_last_comp_version(fdt))
> > > > > >               return -FDT_ERR_BADVERSION;
> > > > > > +     hdrsize = fdt_header_size(fdt);
> > > > > > +     if (!can_assume(VALID_DTB)) {
> > > > > >
> > > > > > -     if ((fdt_totalsize(fdt) < hdrsize)
> > > > > > -         || (fdt_totalsize(fdt) > INT_MAX))
> > > > > > -             return -FDT_ERR_TRUNCATED;
> > > > > > -
> > > > > > -     /* Bounds check memrsv block */
> > > > > > -     if (!check_off_(hdrsize, fdt_totalsize(fdt), fdt_off_mem_rsvmap(fdt)))
> > > > > > -             return -FDT_ERR_TRUNCATED;
> > > > > > +             if ((fdt_totalsize(fdt) < hdrsize)
> > > > > > +                 || (fdt_totalsize(fdt) > INT_MAX))
> > > > > > +                     return -FDT_ERR_TRUNCATED;
> > > > > >
> > > > > > -     /* Bounds check structure block */
> > > > > > -     if (fdt_version(fdt) < 17) {
> > > > > > +             /* Bounds check memrsv block */
> > > > > >               if (!check_off_(hdrsize, fdt_totalsize(fdt),
> > > > > > -                             fdt_off_dt_struct(fdt)))
> > > > > > +                             fdt_off_mem_rsvmap(fdt)))
> > > > > >                       return -FDT_ERR_TRUNCATED;
> > > > > > -     } else {
> > > > > > +     }
> > > > > > +
> > > > > > +     if (!can_assume(VALID_DTB)) {
> > > > > > +             /* Bounds check structure block */
> > > > > > +             if (fdt_version(fdt) < 17) {
> > > > > > +                     if (!check_off_(hdrsize, fdt_totalsize(fdt),
> > > > > > +                                     fdt_off_dt_struct(fdt)))
> > > > > > +                             return -FDT_ERR_TRUNCATED;
> > > > > > +             } else {
> > > > > > +                     if (!check_block_(hdrsize, fdt_totalsize(fdt),
> > > > > > +                                       fdt_off_dt_struct(fdt),
> > > > > > +                                       fdt_size_dt_struct(fdt)))
> > > > > > +                             return -FDT_ERR_TRUNCATED;
> > > > > > +             }
> > > > > > +
> > > > > > +             /* Bounds check strings block */
> > > > > >               if (!check_block_(hdrsize, fdt_totalsize(fdt),
> > > > > > -                               fdt_off_dt_struct(fdt),
> > > > > > -                               fdt_size_dt_struct(fdt)))
> > > > > > +                               fdt_off_dt_strings(fdt),
> > > > > > +                               fdt_size_dt_strings(fdt)))
> > > > > >                       return -FDT_ERR_TRUNCATED;
> > > > > >       }
> > > > > >
> > > > > > -     /* Bounds check strings block */
> > > > > > -     if (!check_block_(hdrsize, fdt_totalsize(fdt),
> > > > > > -                       fdt_off_dt_strings(fdt), fdt_size_dt_strings(fdt)))
> > > > > > -             return -FDT_ERR_TRUNCATED;
> > > > > > -
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > @@ -142,7 +148,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> > > > > >
> > > > > >       *nextoffset = -FDT_ERR_TRUNCATED;
> > > > > >       tagp = fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
> > > > > > -     if (!tagp)
> > > > > > +     if (!can_assume(VALID_DTB) && !tagp)
> > > > > >               return FDT_END; /* premature end */
> > > > > >       tag = fdt32_to_cpu(*tagp);
> > > > > >       offset += FDT_TAGSIZE;
> > > > > > @@ -154,13 +160,13 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> > > > > >               do {
> > > > > >                       p = fdt_offset_ptr(fdt, offset++, 1);
> > > > > >               } while (p && (*p != '\0'));
> > > > > > -             if (!p)
> > > > > > +             if (!can_assume(VALID_DTB) && !p)
> > > > > >                       return FDT_END; /* premature end */
> > > > > >               break;
> > > > > >
> > > > > >       case FDT_PROP:
> > > > > >               lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> > > > > > -             if (!lenp)
> > > > > > +             if (!can_assume(VALID_DTB) && !lenp)
> > > > > >                       return FDT_END; /* premature end */
> > > > > >               /* skip-name offset, length and value */
> > > > > >               offset += sizeof(struct fdt_property) - FDT_TAGSIZE
> > > > > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > > > > index a5c2797..b41083f 100644
> > > > > > --- a/libfdt/fdt_ro.c
> > > > > > +++ b/libfdt/fdt_ro.c
> > > > > > @@ -289,9 +289,12 @@ const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
> > > > > >       const char *nameptr;
> > > > > >       int err;
> > > > > >
> > > > > > -     if (((err = fdt_ro_probe_(fdt)) < 0)
> > > > > > -         || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0))
> > > > > > +     if (!can_assume(VALID_DTB)) {
> > > > > > +             if ((err = fdt_ro_probe_(fdt)) < 0)
> > > > >
> > > > > Seems like it might be cleaner to include the can_assume() check into
> > > > > fdt_ro_probe_().
> > > >
> > > > OK.
> > > >
> > > > >
> > > > > >                       goto fail;
> > > > > > +             if ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> > > > > > +                     goto fail;
> > > > > > +     }
> > > > > >
> > > > > >       nameptr = nh->name;
> > > > > >
> > > > > > diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> > > > > > index 8795947..7a41a31 100644
> > > > > > --- a/libfdt/fdt_rw.c
> > > > > > +++ b/libfdt/fdt_rw.c
> > > > > > @@ -13,6 +13,8 @@
> > > > > >  static int fdt_blocks_misordered_(const void *fdt,
> > > > > >                                 int mem_rsv_size, int struct_size)
> > > > > >  {
> > > > > > +     if (can_assume(VALID_DTB))
> > > > > > +             return false;
> > > > >
> > > > > Urgh... the spec doesn't actually specify a block order, so I'm not
> > > > > sure we can put this one under VALID_DTB.
> > > >
> > > > But if this returns true then we return -FDT_ERR_BADLAYOUT in
> > > > fdt_rw_probe_() below. So it does seem to be wrong.
> > >
> > > Ah, right.  So, that's true for all cases, except the call in
> > > fdt_open_into().  The idea is that you have to call fdt_open_into()
> > > before any of the other rw functions.  fdt_open_into() will re-order
> > > the blocks, if necessary, subsequent functions then require them in
> > > the "standard" order.
> > >
> > > So for the cases other than open_into() you can probably put this
> > > under VALID_INPUT, I think it's reasonable to include "you've called
> > > prerequisite functions correctly" under requiring suitable input.
> > >
> > > You almost certainly also want to elide the block reordering code in
> > > fdt_open_into(), though.  That one probably wants another flag
> >
> > OK, v6.
> >
> > >
> > > > > >       return (fdt_off_mem_rsvmap(fdt) < FDT_ALIGN(sizeof(struct fdt_header), 8))
> > > > > >               || (fdt_off_dt_struct(fdt) <
> > > > > >                   (fdt_off_mem_rsvmap(fdt) + mem_rsv_size))
> > > > > > @@ -24,6 +26,8 @@ static int fdt_blocks_misordered_(const void *fdt,
> > > > > >
> > > > > >  static int fdt_rw_probe_(void *fdt)
> > > > > >  {
> > > > > > +     if (can_assume(VALID_DTB))
> > > > > > +             return 0;
> > > > > >       FDT_RO_PROBE(fdt);
> > > > > >
> > > > > >       if (fdt_version(fdt) < 17)
> > > > > > @@ -40,7 +44,8 @@ static int fdt_rw_probe_(void *fdt)
> > > > > >  #define FDT_RW_PROBE(fdt) \
> > > > > >       { \
> > > > > >               int err_; \
> > > > > > -             if ((err_ = fdt_rw_probe_(fdt)) != 0) \
> > > > > > +             if (!can_assume(VALID_DTB) && \
> > > > > > +                 (err_ = fdt_rw_probe_(fdt)) != 0) \
> > > > >
> > > > >
> > > > > You shouldn't need the test both inside fdt_rw_probe_() and in the
> > > > > FDT_RW_PROBE() macro, no?
> > > >
> > > > OK. It saves a small amount of code space but we can look at it once
> > > > we get something applied...
> > >
> > > Ok, do you know why that is?
> >
> > Well just that if fdt_rw_probe_() is called it consumes a few bytes.
> > If it is never called it won't be included in the SPL image.
>
> That's surprising to me.  fdt_rw_probe_() is local, and with the
> assume flag on it becomes essentially a no-op.  So I would have
> expected the compiler to inline it to nothing.

Ah yes I was thinking of fdt_ro_probe_(). Well, once we get something
in I'll look at things in detail again and see what can be improved
without too much pain.

Regards,
Simon
