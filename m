From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: Re: [PATCH 4/4] pylibfdt: add FdtRo.getprop_or_none()
Date: Sat, 22 Jan 2022 11:36:01 +0100
Message-ID: <5532817.DvuYhMxLoT@g550jk>
References: <20211225132558.167123-1-luca@z3ntu.xyz> <20211225132558.167123-5-luca@z3ntu.xyz> <CAPnjgZ3wun92Q1vMSEem9CH6A8MWNbKZNaepf4j4Ttmf-GNPtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1642847762; bh=Rbu/K4vZVEajzZrv2CJcH8ty8mtzR76fcNE7jbPgfds=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BWAR7MBeua7STwGUwbDqejQjYsPETHlPIB34IoZnx1+7gutLZSs1p90RMLMx1jzOS
         Jf9fqDd7667vktNF2BaP3PRlQIKrYGgn0ljZtjX1yYS8xHtumecoTP0KPkzB+vf5uy
         FEdGJjNILMxXyZ9ggtbdwZ3Tl32qHl9s7RnI7n4E=
In-Reply-To: <CAPnjgZ3wun92Q1vMSEem9CH6A8MWNbKZNaepf4j4Ttmf-GNPtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Simon,

On Dienstag, 28. Dezember 2021 09:34:57 CET Simon Glass wrote:
> Hi Luca,
> 
> On Sat, 25 Dec 2021 at 06:26, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > Add a new method that doesn't throw an exception when a property isn't
> > found but returns None instead.
> > 
> > Also add a test for the new method.
> 
> You can use
> 
> getprop(node, prop, quiet=QUIET_NOTFOUND)
> 

This returns -1 when not found which I found quite un-pythonic (not that 
pylibfdt is currently super pythonic ;) ).
Having None returned if not found is much nicer to use and much more clear to 
use

    if foobar is None:

 instead of having to use

    if foobar == -QUIET_NOTFOUND:


Are there any changes I can do for you to reconsider your position on this 
patch?

Regards
Luca

> > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > ---
> > 
> >  pylibfdt/libfdt.i       | 10 ++++++++++
> >  tests/pylibfdt_tests.py |  2 ++
> >  2 files changed, 12 insertions(+)
> 
> Regards,
> Simon




