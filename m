From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Sat, 18 Jan 2020 13:32:48 +1300
Message-ID: <CAPnjgZ1neFeKyPp3ZE5+p00AJaYtdVHouZHUfv2cg56KOiKL8Q@mail.gmail.com>
References: <20200117153106.29909-1-trini@konsulko.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r+QPlgpGoePUqxV0z1ESNGDD0H8TAxGEJLRW4bWXva0=;
        b=klJGlGBtObhaIMCCO1c+FugaclIyrrSmyUbP5jRotQBm7hatRZ5BykUpBUwHsKa4l3
         f/StrdzU87WQ6wCVUxKECIjLsj8M4LXimuEb5L17P7RMOVnXUEu02SOi+foU/rD0pJQc
         uTIwtSLQi/LeS6mrMTusZNkV/J78Y2XdZYH6o=
In-Reply-To: <20200117153106.29909-1-trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>

On Sat, 18 Jan 2020 at 04:31, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>
> 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" introduced
> changes to support unaligned reads for ARM platforms and 11738cf01f15
> "libfdt: Don't use memcpy to handle unaligned reads on ARM" improved the
> performance of these helpers.
>
> Ultimately however, these helpers should not exist.  Unaligned access
> only occurs when images are forced out of alignment by the user.  This
> unalignment is not supported and introduces problems later on as other
> parts of the system image are unaligned and they too require alignment.
>
> Revert both of these changes.
>
> Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
> By way of a little more explanation, looking at the archives it seems
> that the initial bug reporter said that they had a platform that was
> using U-Boot and had the "fdt_high=0xffffffff" set in the environment.
> What that does is to tell U-Boot to not do any of the sanity checks and
> relocation to ensure alignment that it would normally do because the
> user knows best.  This later came up on the U-Boot list as once the DTB
> was loaded, Linux is unhappy because it demands correct alignment.
>
> I only realized libfdt had introduced changes here when it was reported
> that boot time had gotten much slower once we merged this change in.  It
> would be best to just drop it.
> ---
>  fdtget.c        |  2 +-
>  libfdt/fdt_ro.c | 18 +++++++++---------
>  libfdt/libfdt.h | 33 +--------------------------------
>  3 files changed, 11 insertions(+), 42 deletions(-)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

(I note this commit had no test coverage anyway)
