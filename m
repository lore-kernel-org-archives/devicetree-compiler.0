From: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Fix the undefined behavior in fdt_num_mem_rsv()
Date: Thu, 8 Apr 2021 11:21:52 +0800
Message-ID: <CAEUhbmWeTpRHPdqMtcNWdF-ORJ0OXcMi1YJeN+KUpbkqGKvFGg@mail.gmail.com>
References: <20210330095645.515056-1-bmeng.cn@gmail.com> <YGU9FH3WccMBrfl1@yekko.fritz.box>
 <CAEUhbmVsszFcUC8tEYmJ4djPvyDmXspDg-gb9rYZpm8zWwxc1g@mail.gmail.com> <YG5wZa/ti6klXEZQ@yekko.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kyzo++s9uhnuqS4HC68ozKY/wgszjziCxgwM/8ogWFM=;
        b=NQoJbHM+fmNHtfQ+DCnKFfRLGQ2aNgKGy5f4OHc86XQrqwvBdmLwBNaLQbyl0QdVQ8
         O8bG22bungEDBMNxHRcjwvaJcgNqPCWo3KAObIXz4dgd6Z6hM15KVDo0H9aynmI2sNSo
         +ITG1y/p07Gmj6GcLDBvoeES16iRr5jVahqJZu/R7/c57QmsDU5gAU/R4J/DA1nkXMXq
         aElYuvGju19j6yY9upf/vIhCG2MHm6KoC784qeqiXeTb6meUX2egCRv+JEouTE7dBlDj
         IFz36et4F/pw7L5E4ney7Jjm3mRArLerFaT9u6eVTDoggoOfPHkSYQD+dUtFRYBlOII6
         PTLA==
In-Reply-To: <YG5wZa/ti6klXEZQ-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Fangrui Song <maskray-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,

On Thu, Apr 8, 2021 at 10:59 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Fri, Apr 02, 2021 at 12:52:43PM +0800, Bin Meng wrote:
> > Hi David,
> >
> > On Thu, Apr 1, 2021 at 12:30 PM David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Tue, Mar 30, 2021 at 05:56:45PM +0800, Bin Meng wrote:
> > > > With LLVM 10.0.0+, the following codes in fdt_num_mem_rsv() does not
> > > > work any more for an fdt that is at address 0:
> > > >
> > > >     for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
> > > >         if (fdt64_ld_(&re->size) == 0)
> > > >             return i;
> > > >     }
> > > >
> > > > Due to LLVM's optimization engine utilizing a UB in C, the following
> > > > code pattern:
> > > >
> > > >     if ((pointer + offset) != NULL)
> > > >
> > > > is transformed into:
> > > >
> > > >     if (pointer != NULL)
> > > >
> > > > because if pointer is NULL and offset is non-zero, the result of
> > > > (pointer + offset) is UB. So LLVM is free to exploit such UB to
> > > > perform some optimization.
> > > >
> > > > In this case, fdt_mem_rsv() gets inlined and returns (pointer + offset).
> > > > And LLVM in turns emits codes to check fdt against NULL, which won't
> > > > work for fdt at address 0.
> > >
> > > I don't think this really fixes anything.  It might fool LLVM into
> > > doing what you need right now, but I don't see any reason to expect it
> > > will keep doing so.
> >
> > This specific UB optimizer changes [1] have been merged in LLVM for at
> > least 1.5 years, and it has been there since LLVM 10/11.
>
> Ok, but that doesn't change the basic fact that this is just fooling
> the compiler into behaving differently - it doesn't actually remove
> the UB.

As I explained, it removes the pre-condition of the UB optimizer
effect. The UB of (pointer + offset) when pointer is NULL, is safe as
long as it is not in the statement of flow control.

>
> > > IIUC, you're saying that the specific problem is that adding a
> > > non-zero offset to a NULL pointer is UB, which happens inside
> > > fdt_mem_rsv_() if n != 0.  But with your patch, that UB still exists..
> > >
> >
> > The UB exists only when the fdt pointer is NULL.
>
> Yes...
>
> > > > Signed-off-by: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > ---
> > > >
> > > >  libfdt/fdt_ro.c | 17 +++++++++++++----
> > > >  1 file changed, 13 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > > index 17584da..4db4013 100644
> > > > --- a/libfdt/fdt_ro.c
> > > > +++ b/libfdt/fdt_ro.c
> > > > @@ -157,18 +157,26 @@ int fdt_generate_phandle(const void *fdt, uint32_t *phandle)
> > > >       return 0;
> > > >  }
> > > >
> > > > -static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
> > > > +static bool fdt_is_mem_rsv(const void *fdt, int n)
> > > >  {
> > > >       unsigned int offset = n * sizeof(struct fdt_reserve_entry);
> > > >       unsigned int absoffset = fdt_off_mem_rsvmap(fdt) + offset;
> > > >
> > > >       if (!can_assume(VALID_INPUT)) {
> > > >               if (absoffset < fdt_off_mem_rsvmap(fdt))
> > > > -                     return NULL;
> > > > +                     return false;
> > > >               if (absoffset > fdt_totalsize(fdt) -
> > > >                   sizeof(struct fdt_reserve_entry))
> > > > -                     return NULL;
> > > > +                     return false;
> > > >       }
> > > > +
> > > > +     return true;
> > > > +}
> > > > +
> > > > +static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
> > > > +{
> > > > +     if (!fdt_is_mem_rsv(fdt, n))
> > > > +             return NULL;
> > > >       return fdt_mem_rsv_(fdt, n);
> > > >  }
> > > >
> > > > @@ -191,7 +199,8 @@ int fdt_num_mem_rsv(const void *fdt)
> > > >       int i;
> > > >       const struct fdt_reserve_entry *re;
> > > >
> > > > -     for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
> > > > +     for (i = 0; fdt_is_mem_rsv(fdt, i); i++) {
> > > > +             re = fdt_mem_rsv_(fdt, i);
> > >
> > > .. here ^^.
> > >
> > >
> > > Basically if your compiled is going to optimized based on (NULL +
> > > something) being UB, and the NULL pointer is address 0, that's
> > > fundamentally incompatible with storing a device tree at address 0.
> >
> > As long as we don't put (pointer + offset) into a statement of flow
> > control, it is fine. You can still get the correct value of (pointer +
> > offset) when pointer is NULL and yes, it is still a UB but we can
> > expect such usage is safe.
>
> People always say that about UB until it isn't.  This is just way to
> subtle a distinction for me to be comfortable relying on it.
>
> Fundamentally the problem is that you want to store your fdt at
> address zero, but that is just not compatible with your compiler,

I am not sure it is a compatibility issue when language layers were
defining the C spec without considering the fact that RAM address zero
is absolutely OK on some systems. In normal programming environment we
don't store data at address zero so NULL can be used as an indication
of invalid pointer, but this practice may not apply on low-level
environment like for example, when bootloader passes the FDT at
address zero for kernel to handle it, or a bootloader environment
where FDT is placed at a ROM address 0 ...

> since it considers that a NULL pointer.

Regards,
Bin
