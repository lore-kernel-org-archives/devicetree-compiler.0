From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] pylibfdt: add FdtRo.getprop_or_none()
Date: Tue, 28 Dec 2021 01:34:57 -0700
Message-ID: <CAPnjgZ3wun92Q1vMSEem9CH6A8MWNbKZNaepf4j4Ttmf-GNPtQ@mail.gmail.com>
References: <20211225132558.167123-1-luca@z3ntu.xyz> <20211225132558.167123-5-luca@z3ntu.xyz>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g1CFnhrR14Kpmm0WiVZcoB5ebyA4ncgKrUyP0ovjZz8=;
        b=fN97LLp1OX6demlTEwx98t6oEUHouKMXJW5mNo1FznRxyF3Zm1fC1mBLTP1qtC2NCB
         3MkPF37VaFMCtWFEq0mBcvinyclYSQEKNYDsluDUUn/+X/jdRGV4+5DmknRS5cxfCZwp
         D9avhaYicAnudd7jacZoVT8WBG/Ls4ekxCe98=
In-Reply-To: <20211225132558.167123-5-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Luca,

On Sat, 25 Dec 2021 at 06:26, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> Add a new method that doesn't throw an exception when a property isn't
> found but returns None instead.
>
> Also add a test for the new method.

You can use

getprop(node, prop, quiet=QUIET_NOTFOUND)

>
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> ---
>  pylibfdt/libfdt.i       | 10 ++++++++++
>  tests/pylibfdt_tests.py |  2 ++
>  2 files changed, 12 insertions(+)

Regards,
Simon
