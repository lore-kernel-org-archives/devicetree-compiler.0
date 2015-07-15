From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/3] Add a couple of string-related functions
Date: Wed, 15 Jul 2015 15:45:07 -0600
Message-ID: <CAPnjgZ12VVSDkALDDg31Sgwo1PpFPfE10GFtrseHWpRX1re-HQ@mail.gmail.com>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com> <E1ZFMkd-0002ir-O5@mylo.jdl.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=9XpbXPgfr3Ed92jvWuWLs0c04l6yaAyspgKenFA5E8A=;
        b=BW8N7VM3+MjjXdibmq9ukf/CL+Tn5r5gVGKOwRiPXtU0QmiRQ0791neakPaq40DYvy
         lmOICoYCzg9X7gp2l3Iqoq4B7p85EE4HqjMdJiDq2mUMBtsIQH+4af7pKg7t3x/X+AIb
         0dbLgij/PyoaeznAHZwonPjUxqaaFQOEpFCkmnLJQDtOZpfpLvOvybhUEj8km6+mNaMF
         VzfciuMjrehW/W1qbtTOMsnh9B4Zzfd0DUT0AHiiCvtuow/LTOHVntzczqc05A7qCvIQ
         GRGTMXbvOp+kKhlJxbzqztCmwWYKlHlAiXxFuf9ZGNXPTu7U9iJgvUatFXZlwutkFV7S
         SN+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=9XpbXPgfr3Ed92jvWuWLs0c04l6yaAyspgKenFA5E8A=;
        b=IBo1DTBsKmvHBIdpgwP8Zlol7J6y3NnnKjVc0CB6bLECLIpZxenmBiySb8bgb2SCiR
         IT2lO2udXCyq7+M4kW7gfpPMArsFwm26Ba9SXzynXG2BbIJ/eW6WEskMzUDgUoSBOVw0
         TSrdIw3klzqK/AssQG5mmW3RcZd9m+fa/klSQ=
In-Reply-To: <E1ZFMkd-0002ir-O5-h9b8CULRd+FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

Hi Jon,

On 15 July 2015 at 07:29, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
>
> So, like, Thierry Reding said:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > These three patches add a couple of string functions that have proven
> > useful in U-Boot's copy of libfdt, so they are likely to be useful for
> > other users as well.
> >
> > Patch 1 adds a function to count the number of strings in a property's
> > value. This also adds a new DTS sample along with a small test program
> > to validate the implemented functions.
> >
> > Patch 2 adds a function to retrieve the index of a given string in any
> > given property's value. This adds code to the test program introduced in
> > the previous patch to exercise the new functionality.
> >
> > Patch 3 adds a function to retrieve a string by index from a property's
> > value along with a shortcut for index 0. This extends the test program
> > introduced in patch 1 to validate the new functionality.
> >
> > Thierry
>
>
> Hi Thierry,
>
> While I am generally fine with this patch set, I have
> a large-scope question.  Is there a larger plan to
> consolidate or unify the U-Boot and DTC libfdts?

I maintain the fdt tree for U-Boot at present. About once a quarter I
check what has changed and do a bit of a sync. But there are things
that libfdt upstream has not accepted - e.g. the grep functionality
used by verified boot hashing stuff. I wish we could figure that out.
Perhaps a cut-down fdtgrep tool would meet with favour. We're using it
even more now since SPL (the minimal U-Boot loader) wants to run with
a subset of the full board FDT for SRAM space reasons.

I do ask people to send things upstream, and if rejected we then have
to work out what to do...there are recent U-Boot mailing list threads
on this.

Regards,
Simon
