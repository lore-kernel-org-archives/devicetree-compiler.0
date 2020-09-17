From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] libfdt: Correct signed/unsigned comparisons
Date: Thu, 17 Sep 2020 09:19:22 -0600
Message-ID: <CAPnjgZ2kVMyai=GxLZ88wARu-zWToDibyG6ustSh4K0q8S54+w@mail.gmail.com>
References: <20200112185209.75847-1-sjg@chromium.org> <20200116064955.GR54439@umbus>
 <CAPnjgZ2vbphSbvohBD3YTswX2WtKdVxgs9Ltg9vFfrEQyr2LGw@mail.gmail.com>
 <20200117092332.GW54439@umbus> <a6622ba6-71f5-135a-f215-bc3741d9b721@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y3iCiF/xFJTgqhKEeJHdB5aimlSJefT0OkrlpaJN2r0=;
        b=PVOQrHdXuFy1Phzs7rqhcoVuQV+zAd1PXUR6yUNOxHSjtj228S0n7yf1zo40hUZnYe
         6QGd7ir9WMB6yUMTl8mGaFsjYZShVYY3AFn3f81OcV4QgmHEeOPyL1W8KbCH6o/cI9mE
         vLeOk20U6bt4m5hVmtcfVzdhEozcAbL9NbSw4=
In-Reply-To: <a6622ba6-71f5-135a-f215-bc3741d9b721-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Andr=C3=A9,

On Thu, 17 Sep 2020 at 04:27, Andr=C3=A9 Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =
wrote:
>
> On 17/01/2020 09:23, David Gibson wrote:
>
> Hi,
>
> > On Thu, Jan 16, 2020 at 08:58:12PM +1300, Simon Glass wrote:
> >> Hi David,
> >>
> >> On Thu, 16 Jan 2020 at 19:50, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u> wrote:
> >>>
> >>> On Sun, Jan 12, 2020 at 11:52:08AM -0700, Simon Glass wrote:
> >>>> These warnings appear when building U-Boot on x86 and some other tar=
gets.
> >>>> Correct them by adding casts.
> >>>>
> >>>> Example:
> >>>>
> >>>> scripts/dtc/libfdt/fdt.c: In function =E2=80=98fdt_offset_ptr=E2=80=
=99:
> >>>> scripts/dtc/libfdt/fdt.c:137:18: warning: comparison of integer expr=
essions of different signedness: =E2=80=98unsigned int=E2=80=99 and =E2=80=
=98int=E2=80=99 [-Wsign-compare]
> >>>>    if ((absoffset < offset)
> >>>>
> >>>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>>
> >>> Hmm.  So squashing warnings is certainly a good thing in general.
> >>>
> >>> Unfortunately, I'm really uncomfortable with most of these changes.
> >>> In a number of cases they are outright wrong.  In most of the others,
> >>> the code was already correct.  I dislike adding casts to suppress
> >>> spurious warnings on correct code because that can end up hiding real
> >>> problems which might be introduced by future changes.
> >>>
> >>> Case by case details below.
> >>
> >> Thanks for the review. I agree this is all really horrible,
> >> particularly in light of the fact that it doesn't fix bugs and perhaps
> >> introduces some.
> >>
> >> This was just a quick patch to silence the warnings. If we do make
> >> fixes here we should really make sure that there are test cases to
> >> trigger each check. I suspect we have some but not all.
> >
> > Yeah, adding some safety test cases for egregiously bad input like
> > negative buffer sizes is probably a good idea.
> >
> >> What do you think we should do? The warnings are going to be very
> >> annoying for people. I could perhaps split the patch up and work
> >> through things one by one.
> >
> > Yeah, we want to find some way to remove the warnings, and I think
> > splitting up and working piece by piece will be necessary.
>
> Has anyone done anything on that front?
> If not, I would take a deep breath and try to tackle this one by one. I
> was grudgingly ignoring this in U-Boot so far, but it popped up in
> Trusted Firmware now as well, so I have a business reason (TM).

No, I never got back to it. It would be great if you could take it on!

Regards,
Simon
