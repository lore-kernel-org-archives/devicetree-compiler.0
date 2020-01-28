From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Tue, 28 Jan 2020 08:08:53 -0600
Message-ID: <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw@mail.gmail.com>
References: <20200117153106.29909-1-trini@konsulko.com> <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat> <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat> <20200128085918.GO42099@umbus.fritz.box> <20200128134304.GQ13379@bill-the-cat>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580220546;
        bh=arvVMPsYdW4si0ZKVanm+sizAFOE78sTNc5y8IkvzN8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EIJvuiizzArX2oEu3z46uHVOy2wfdNkrNjajIhlESEKZ+De977ayKF9UB41TN4L98
         pN2+pSwf5TLCI9hJC5QNKqQ/GyXKh95FWtfzH0V1GI2+8OWDkxB1MQvfF6agzNcZ3N
         dakGiX9Ve9GKMnbgXl/3o5QJPRkLVMX9PDXjoFcI=
In-Reply-To: <20200128134304.GQ13379@bill-the-cat>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>

On Tue, Jan 28, 2020 at 7:43 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>
> On Tue, Jan 28, 2020 at 07:59:18PM +1100, David Gibson wrote:
> > On Mon, Jan 27, 2020 at 10:04:34AM -0500, Tom Rini wrote:
> > > On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> > > > On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> > > > > On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> > > > > > On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > > > > > > 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" introduced
> > > > > > > changes to support unaligned reads for ARM platforms and 11738cf01f15
> > > > > > > "libfdt: Don't use memcpy to handle unaligned reads on ARM" improved the
> > > > > > > performance of these helpers.
> > > > > > >
> > > > > > > Ultimately however, these helpers should not exist.  Unaligned access
> > > > > > > only occurs when images are forced out of alignment by the user.  This
> > > > > > > unalignment is not supported and introduces problems later on as other
> > > > > > > parts of the system image are unaligned and they too require alignment.
> > > > > > >
> > > > > > > Revert both of these changes.
> > > > > > >
> > > > > > > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > > > > > ---
> > > > > > > By way of a little more explanation, looking at the archives it seems
> > > > > > > that the initial bug reporter said that they had a platform that was
> > > > > > > using U-Boot and had the "fdt_high=0xffffffff" set in the environment.
> > > > > > > What that does is to tell U-Boot to not do any of the sanity checks and
> > > > > > > relocation to ensure alignment that it would normally do because the
> > > > > > > user knows best.  This later came up on the U-Boot list as once the DTB
> > > > > > > was loaded, Linux is unhappy because it demands correct alignment.
> > > > > > >
> > > > > > > I only realized libfdt had introduced changes here when it was reported
> > > > > > > that boot time had gotten much slower once we merged this change in.  It
> > > > > > > would be best to just drop it.
> > > > > >
> > > > > > Hmm.  I'm not sure about this.  The commit message makes a case for
> > > > > > why the unaligned handling isn't necessary, but not a case for why
> > > > > > it's bad.  Even if handling an unaligned tree isn't a common case,
> > > > > > isn't it better to be able to than not?
> > > > > >
> > > > > > I gather from the previous discussion that there's a significant
> > > > > > performance impact, but that rationale needs to go into the commit
> > > > > > message for posterity.
> > > > >
> > > > > I wanted to emphasize that the code simply isn't ever needed, not that
> > > > > it's a performance problem.  A performance problem implies that we would
> > > > > keep this, if it was fast enough.  That's why people noticed it (it
> > > > > slows things down to an unusable level).  But it's functionally wrong.
> > > > >
> > > > > > [snip]
> > > > > > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > > > > > index fc4c4962a01c..d4ebe915cf46 100644
> > > > > > > --- a/libfdt/libfdt.h
> > > > > > > +++ b/libfdt/libfdt.h
> > > > > > > @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
> > > > > > >
> > > > > > >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> > > > > > >
> > > > > > > -/*
> > > > > > > - * Alignment helpers:
> > > > > > > - *     These helpers access words from a device tree blob.  They're
> > > > > > > - *     built to work even with unaligned pointers on platforms (ike
> > > > > > > - *     ARM) that don't like unaligned loads and stores
> > > > > > > - */
> > > > > > > -
> > > > > > > -static inline uint32_t fdt32_ld(const fdt32_t *p)
> > > > > > > -{
> > > > > > > -   const uint8_t *bp = (const uint8_t *)p;
> > > > > > > -
> > > > > > > -   return ((uint32_t)bp[0] << 24)
> > > > > > > -           | ((uint32_t)bp[1] << 16)
> > > > > > > -           | ((uint32_t)bp[2] << 8)
> > > > > > > -           | bp[3];
> > > > > > > -}
> > > > > >
> > > > > > In particular, I definitely think removing the helpers entirely is a
> > > > > > no go.  They're now part of the published interface of the library.
> > > > >
> > > > > Perhaps "mistakes were made" ?  I don't think we need to worry about
> > > > > removing an interface here as projects are avoiding upgrading libfdt
> > > > > now (TF-A, formerly ATF) or reverting the change (U-Boot).
> > > > >
> > > > > > Even if they're not used for reading the internal tags, they can be
> > > > > > used to load integers from within particular properties.  Those are
> > > > > > frequently unaligned, since properties generally have packed
> > > > > > representations.
> > > > >
> > > > > I don't see the relevance.  Go back to the initial problem report.  It's
> > > > > not "I have a new unique platform I'm using libfdt on and I have
> > > > > problems".  It's "I keep jabbing myself with a rusty nail and now I have
> > > > > problems".
> > > >
> > > > The initial report isn't the only relevant thing here.  Although it
> > > > prompted the change, it wasn't the only consideration in making it.
> > > >
> > > > There's also two separate questions here:
> > > >   1) Do we want byteswapping integer load helpers?
> > > >   2) Should those handle unaligned accesses?
> > > >
> > > > In working out how to address the (as it turns out, non existent)
> > > > problem, I realized an abstraction for loading big-endian integers
> > > > from the blob would be a useful thing in its own right.  I also
> > > > realized that it's a useful thing not just inside the libfdt code, but
> > > > as an external interface.  Callers have always needed to interpret the
> > > > contents of individual dt properties, and loading integers from them
> > > > is often a part of that.
> > > >
> > > > I know of people using those fdtXX_ld() helpers right now, so I'm not
> > > > going to take them away.
> > > >
> > > > For the case of external users we absolutely do need to handle
> > > > unaligned accesses.  There are a number of existing bindings that mix
> > > > strings and integers in packed format, in a single encoded property.
> > > > So regardless of the alignment of the whole property, we can easily
> > > > get unaligned integers in there, and I don't want to expose multiple
> > > > different helpers for different cases.
> > > >
> > > > Now, we don't *have* to use the same helpers for internal use.  We
> > > > could open code the internal loads, or use a special aligned-only
> > > > version inside.  But using the existing external helpers is the
> > > > obvious and simple choice.
> > > >
> > > > So, we're back to: I need a case for changing this now, not just a
> > > > case for claiming it wasn't needed in the first place.
> > >
> > > For U-Boot, I'm just going to revert this part of the changes.  I would
> >
> > That seems reasonable for the interim.
> >
> > > suggest that you look in to some way to fix the "fast path" here to go
> > > back to the previous way of working so that other project can continue
> > > to use libfdt as well and when callers need to access these helpers and
> > > are not otherwise in the fast path can do so.
> > >
> > > You're adding visible boot time delay with things the way they exist
> > > today.  That's not OK.
> >
> > That's a fair point, but you need to make that case in the commit
> > message and merge request, not just expect me to find and collate the
> > arguments from other threads.
>
> If you want me to leave the helpers alone but otherwise revert things, I
> can do a v2 and expand the commit message.  And perhaps I'm too nice
> sometimes then but I do pickup and tweak things that are close enough to
> what I want and reword as needed for clarity.

Why not just fix the helpers for the aligned case and be done with it:

static inline uint32_t fdt32_ld(const fdt32_t *p)
{
       const uint8_t *bp = (const uint8_t *)p;

+       if (!((unsigned long)p & 0x3))
+               return fdt32_to_cpu(*p);
+
       return ((uint32_t)bp[0] << 24)
               | ((uint32_t)bp[1] << 16)
               | ((uint32_t)bp[2] << 8)
               | bp[3];
}


> I still believe you have things wrong.  There's not an unaligned access
> problem that libfdt needs to care about.  ARM doesn't need help handling
> unaligned accesses.  The only problem that's been reported is from when
> a user got themselves so far off in the weeds that nothing else matters.

I think while the vast majority of DTBs don't have anything that would
cause unaligned accesses, that's not guaranteed by the FDT format.
libfdt needs to handle the worst case.

What about ARMv5 and v4 which don't universally support unaligned
accesses or any other architecture. Do all mips, openrisc, riscv, arc,
microblaze, xtenza, etc. support unaligned accesses?

Rob
