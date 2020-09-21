From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] libfdt: Correct signed/unsigned comparisons
Date: Mon, 21 Sep 2020 12:12:46 -0600
Message-ID: <CAPnjgZ2kHMC6QqnSescvNRr1AcW640W-FSwPUquZWmLCfw0VgA@mail.gmail.com>
References: <20200112185209.75847-1-sjg@chromium.org> <20200116064955.GR54439@umbus>
 <CAPnjgZ2vbphSbvohBD3YTswX2WtKdVxgs9Ltg9vFfrEQyr2LGw@mail.gmail.com>
 <20200117092332.GW54439@umbus> <a6622ba6-71f5-135a-f215-bc3741d9b721@arm.com>
 <20200921060008.GB11979@yekko.fritz.box> <bc44bc93-0356-8e15-20f7-4cce77edba27@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zoFQ2yokWAjqIBRsR1jVQay1ZE+LLwaxwyJtEZGUcgc=;
        b=Wk1fkhJuTF782G+HNADhYs9kd4tcnL1HcLjHC48Sy9CbmpQMbZEEn5F3LFk/Y9KadW
         FzqXfGiU37ShLBTyq8nmMi49rzw/VObJm38kPAk6Ua3STaT0a/uiOSzFF3WrG6sFmpG9
         H51G6rTCd6GnzFYXiW/jTw+uI6YynNiFg/8w4=
In-Reply-To: <bc44bc93-0356-8e15-20f7-4cce77edba27-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Andr=C3=A9,

On Mon, 21 Sep 2020 at 03:55, Andr=C3=A9 Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =
wrote:
>
> On 21/09/2020 07:00, David Gibson wrote:
>
> Hi David,
>
> > On Thu, Sep 17, 2020 at 11:26:44AM +0100, Andr=C3=A9 Przywara wrote:
> >> On 17/01/2020 09:23, David Gibson wrote:
> >>
> >> Hi,
> >>
> >>> On Thu, Jan 16, 2020 at 08:58:12PM +1300, Simon Glass wrote:
> >>>> Hi David,
> >>>>
> >>>> On Thu, 16 Jan 2020 at 19:50, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6ryscVyMRj84@public.gmane.org=
.au> wrote:
> >>>>>
> >>>>> On Sun, Jan 12, 2020 at 11:52:08AM -0700, Simon Glass wrote:
> >>>>>> These warnings appear when building U-Boot on x86 and some other t=
argets.
> >>>>>> Correct them by adding casts.
> >>>>>>
> >>>>>> Example:
> >>>>>>
> >>>>>> scripts/dtc/libfdt/fdt.c: In function =E2=80=98fdt_offset_ptr=E2=
=80=99:
> >>>>>> scripts/dtc/libfdt/fdt.c:137:18: warning: comparison of integer ex=
pressions of different signedness: =E2=80=98unsigned int=E2=80=99 and =E2=
=80=98int=E2=80=99 [-Wsign-compare]
> >>>>>>    if ((absoffset < offset)
> >>>>>>
> >>>>>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>>>>
> >>>>> Hmm.  So squashing warnings is certainly a good thing in general.
> >>>>>
> >>>>> Unfortunately, I'm really uncomfortable with most of these changes.
> >>>>> In a number of cases they are outright wrong.  In most of the other=
s,
> >>>>> the code was already correct.  I dislike adding casts to suppress
> >>>>> spurious warnings on correct code because that can end up hiding re=
al
> >>>>> problems which might be introduced by future changes.
> >>>>>
> >>>>> Case by case details below.
> >>>>
> >>>> Thanks for the review. I agree this is all really horrible,
> >>>> particularly in light of the fact that it doesn't fix bugs and perha=
ps
> >>>> introduces some.
> >>>>
> >>>> This was just a quick patch to silence the warnings. If we do make
> >>>> fixes here we should really make sure that there are test cases to
> >>>> trigger each check. I suspect we have some but not all.
> >>>
> >>> Yeah, adding some safety test cases for egregiously bad input like
> >>> negative buffer sizes is probably a good idea.
> >>>
> >>>> What do you think we should do? The warnings are going to be very
> >>>> annoying for people. I could perhaps split the patch up and work
> >>>> through things one by one.
> >>>
> >>> Yeah, we want to find some way to remove the warnings, and I think
> >>> splitting up and working piece by piece will be necessary.
> >>
> >> Has anyone done anything on that front?
> >> If not, I would take a deep breath and try to tackle this one by one. =
I
> >> was grudgingly ignoring this in U-Boot so far, but it popped up in
> >> Trusted Firmware now as well, so I have a business reason (TM).
> >
> >>> I think the very first step, is to find definitive info on what
> >>> exactly the defined behaviour of C is with a signed vs. unsigned
> >>> comparison.
> >>>
> >>> The help text of -Wsign-compare seems to imply that assuming:
> >>>
> >>>     signed int a;
> >>>     unsigned int b;
> >>>
> >>> then
> >>>     if (a < b) ...
> >>>
> >>> is equivalent to
> >>>     if ((unsigned int)a < b) ...
> >>>
> >>> But I thought that this was not the case.  Rather, I thought it was
> >>> supposed to always evaluate to true if b > INT_MAX.  We need to know
> >>> which is the case as a starting point.
> >
> > I since had a brief look at this, and it appears I was wrong about
> > this behaviour, which makes this whole project rather more urgent.
> > I'd still appreciate someone looking at the standards to double check,
> > though.
> >
> > I'm unlikely to have time to look at this myself, though, so I'd be
> > very happy if you took this on, and I'll do my absolute best to review
> > and merge promptly.
> >
> > Fwiw, the more "bite-size" the patches are, the easier it is for me to
> > review.  So I'd suggest fixing just a small set of related cases at a
> > time, with a clear justification for why the new semantics are correct
> > in the commit message.
>
> Yes, breaking this down (as suggested earlier) was the plan. Either by
> group of functions or by type of fix used, not decided yet. And I will
> try to add as much rationale to the commit messages as possible.
>
> - I guess I can't change the external interface, to amend the signedness
> in function parameters?
>
> - Can we assume (or stipulate?) that a DTB is always smaller than 2GB?
> The DT spec doesn't explicitly mention a limit, but the header uses
> uint32_t for size fields. libfdt seems to assume the the actual
> structure block is smaller than 2GB already (by using ints for node
> offsets). So that leaves the corner case of totalsize being potentially
> larger than 2GB only. Do we care about this?

I feel that 2GB should be enough for everyone(TM). U-Boot supports
images being outside the FIT as well.

Regards,
Simon
