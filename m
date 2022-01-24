From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] pylibfdt: add FdtRo.getprop_or_none()
Date: Mon, 24 Jan 2022 10:57:45 -0700
Message-ID: <CAPnjgZ1NX2Q884T_LNUOLJT8=RKZXEj2z7uxzQF4MrHiKObZvA@mail.gmail.com>
References: <20211225132558.167123-1-luca@z3ntu.xyz> <20211225132558.167123-5-luca@z3ntu.xyz>
 <CAPnjgZ3wun92Q1vMSEem9CH6A8MWNbKZNaepf4j4Ttmf-GNPtQ@mail.gmail.com> <5532817.DvuYhMxLoT@g550jk>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6x5QuPkRuMVQ5L7xYnpsNCBdpH0ofNDGAZICHuKfAI8=;
        b=IMBvoWxKebrb1DJdc5QvE4kTMphW+CKtT8SAfjzH1w1RygkmY1R/cdrc6tm1k54cmG
         Ij/Jqj4BBpx+TuSEFoM2g5q3FYmQiGUAJBvZwDKVUXQpvL/x4LELHtjMGoqk7muRfCiu
         Lv3CwNXhiegK2+do8q6qUkshQ5hG51KDKVrN4=
In-Reply-To: <5532817.DvuYhMxLoT@g550jk>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Luca,

On Sat, 22 Jan 2022 at 03:36, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> Hi Simon,
>
> On Dienstag, 28. Dezember 2021 09:34:57 CET Simon Glass wrote:
> > Hi Luca,
> >
> > On Sat, 25 Dec 2021 at 06:26, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > Add a new method that doesn't throw an exception when a property isn't
> > > found but returns None instead.
> > >
> > > Also add a test for the new method.
> >
> > You can use
> >
> > getprop(node, prop, quiet=QUIET_NOTFOUND)
> >
>
> This returns -1 when not found which I found quite un-pythonic (not that
> pylibfdt is currently super pythonic ;) ).
> Having None returned if not found is much nicer to use and much more clear to
> use
>
>     if foobar is None:
>
>  instead of having to use
>
>     if foobar == -QUIET_NOTFOUND:
>
>
> Are there any changes I can do for you to reconsider your position on this
> patch?

I think I was put off by the mention of an exception in the commit
message. Really all you are doing is trying to make this function more
pythonic. I suppose we could change the getprop() function to return
None if there is no property (with QUIET_NOTFOUND supplied for the
'quiet' argument). That makes not-found special, but I suppose if the
error were anything else, e.g. -FDT_ERR_BADSTRUCTURE and
quiet=[BADSTRUCTURE] were passed, we could return None in that case
too?

I agree it is more pythonic.

David, what do you think?

Failing that I'm OK with this function, but with the commit message
updated to not mention exceptions, as we already have that mechanism,
so it is confusing.

BTW you can use QUIET_NOTFOUND instead of [FDT_ERR_NOTFOUND]

Regards,
Simon
