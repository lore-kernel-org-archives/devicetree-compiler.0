From: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Fix the undefined behavior in fdt_num_mem_rsv()
Date: Fri, 2 Apr 2021 12:52:43 +0800
Message-ID: <CAEUhbmVsszFcUC8tEYmJ4djPvyDmXspDg-gb9rYZpm8zWwxc1g@mail.gmail.com>
References: <20210330095645.515056-1-bmeng.cn@gmail.com> <YGU9FH3WccMBrfl1@yekko.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yv/mVmyxY4tW4bUVJoVEnA15ciIFvsb/TsxjNtkP8PU=;
        b=UJemmo5pPd6+sE55sIsa3pQ9bjxa6CiYbem1SR5vUl82ptK0eOzC8DEakterle7kOm
         sJhZfzS4V1wUBxh2dAB1Dgs2jp9UeJGowx524agWUlkkkSQFzLDpQbKBYb+d1PH+BHyK
         IjsijQHMWvF4e15ZGBvur5fxJQZ/FiKPrpgzkrWRW7TDbmhrqRDYcYIGYJEaPN/eGYDB
         37neLFJojFc4MjWmE8X51546E4jkbDG4QRb54BjjMek/guQCZxNRS5jZjButy+w6hQAn
         nGY1vmsn1Wvqd9p8wmLWpz/cU0f9GIlTtbzYldYRL67ODDK4N1moIyZWdIziXsA4RDyP
         i7Sg==
In-Reply-To: <YGU9FH3WccMBrfl1-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Fangrui Song <maskray-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,

On Thu, Apr 1, 2021 at 12:30 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Mar 30, 2021 at 05:56:45PM +0800, Bin Meng wrote:
> > With LLVM 10.0.0+, the following codes in fdt_num_mem_rsv() does not
> > work any more for an fdt that is at address 0:
> >
> >     for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
> >         if (fdt64_ld_(&re->size) == 0)
> >             return i;
> >     }
> >
> > Due to LLVM's optimization engine utilizing a UB in C, the following
> > code pattern:
> >
> >     if ((pointer + offset) != NULL)
> >
> > is transformed into:
> >
> >     if (pointer != NULL)
> >
> > because if pointer is NULL and offset is non-zero, the result of
> > (pointer + offset) is UB. So LLVM is free to exploit such UB to
> > perform some optimization.
> >
> > In this case, fdt_mem_rsv() gets inlined and returns (pointer + offset).
> > And LLVM in turns emits codes to check fdt against NULL, which won't
> > work for fdt at address 0.
>
> I don't think this really fixes anything.  It might fool LLVM into
> doing what you need right now, but I don't see any reason to expect it
> will keep doing so.

This specific UB optimizer changes [1] have been merged in LLVM for at
least 1.5 years, and it has been there since LLVM 10/11.

>
> IIUC, you're saying that the specific problem is that adding a
> non-zero offset to a NULL pointer is UB, which happens inside
> fdt_mem_rsv_() if n != 0.  But with your patch, that UB still exists..
>

The UB exists only when the fdt pointer is NULL.

>
> >
> > Signed-off-by: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >
> >  libfdt/fdt_ro.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index 17584da..4db4013 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -157,18 +157,26 @@ int fdt_generate_phandle(const void *fdt, uint32_t *phandle)
> >       return 0;
> >  }
> >
> > -static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
> > +static bool fdt_is_mem_rsv(const void *fdt, int n)
> >  {
> >       unsigned int offset = n * sizeof(struct fdt_reserve_entry);
> >       unsigned int absoffset = fdt_off_mem_rsvmap(fdt) + offset;
> >
> >       if (!can_assume(VALID_INPUT)) {
> >               if (absoffset < fdt_off_mem_rsvmap(fdt))
> > -                     return NULL;
> > +                     return false;
> >               if (absoffset > fdt_totalsize(fdt) -
> >                   sizeof(struct fdt_reserve_entry))
> > -                     return NULL;
> > +                     return false;
> >       }
> > +
> > +     return true;
> > +}
> > +
> > +static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
> > +{
> > +     if (!fdt_is_mem_rsv(fdt, n))
> > +             return NULL;
> >       return fdt_mem_rsv_(fdt, n);
> >  }
> >
> > @@ -191,7 +199,8 @@ int fdt_num_mem_rsv(const void *fdt)
> >       int i;
> >       const struct fdt_reserve_entry *re;
> >
> > -     for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
> > +     for (i = 0; fdt_is_mem_rsv(fdt, i); i++) {
> > +             re = fdt_mem_rsv_(fdt, i);
>
> .. here ^^.
>
>
> Basically if your compiled is going to optimized based on (NULL +
> something) being UB, and the NULL pointer is address 0, that's
> fundamentally incompatible with storing a device tree at address 0.

As long as we don't put (pointer + offset) into a statement of flow
control, it is fine. You can still get the correct value of (pointer +
offset) when pointer is NULL and yes, it is still a UB but we can
expect such usage is safe.

>
> >               if (fdt64_ld_(&re->size) == 0)
> >                       return i;
> >       }
>

PS: I added Fangrui who is an LLVM developer to this loop and he can
provide a better explanation than me from the LLVM perspective.

[1] https://reviews.llvm.org/D66608

Regards,
Bin
