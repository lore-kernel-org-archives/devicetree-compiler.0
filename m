From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] Fix Python crash on getprop deallocation
Date: Fri, 24 Dec 2021 06:17:25 -0700
Message-ID: <CAPnjgZ227FLO_UYqsq44dQwOYqa+vXuu5BGgmjoCThHnTGS5FA@mail.gmail.com>
References: <20211224102811.70695-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0TlbX3cXsQejFqUshXAO9a26nfdfX33RQOyq6TSohlY=;
        b=lhszg55VVtowoXWVfNkRf3DNfFMwsbQoqjRJSNVW2Xp0NsTCTRCXgHZ3uwdZiqNHqD
         LVjBxYlrJP2c7VpkgblEpzER/50/9k+wlEIOF4H+pu4ultfkVxV9fyF5TUSsc1AX5VCW
         T0shH1rdwmb3teOckF2tYhBkEwUCe3eqnI/gY=
In-Reply-To: <20211224102811.70695-1-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Luca,

On Fri, 24 Dec 2021 at 03:38, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> Fatal Python error: none_dealloc: deallocating None
> Python runtime state: finalizing (tstate=0x000055c9bac70920)
>
> Current thread 0x00007fbe34e47740 (most recent call first):
>   <no Python frame>
> Aborted (core dumped)
>
> This is caused by a missing Py_INCREF on the returned Py_None, as
> demonstrated e.g. in https://github.com/mythosil/swig-python-incref or
> described at https://edcjones.tripod.com/refcount.html ("Remember to
> INCREF Py_None!")
>
> A PoC for triggering this crash is uploaded to
> https://github.com/z3ntu/pylibfdt-crash .
> With this patch applied to pylibfdt the crash does not happen.
>
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> ---
> Unrelated but I've noticed that in this file the indentation is quite
> mixed between spaces and tabs. This patch tries to keep to the style in
> the lines around.
>
>  pylibfdt/libfdt.i | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

My original idea was to use tabs for the C code (to match the libfdt
style) and spaces for the Python code (for PEP8). Looking at it now,
that idea has not continued and I'm not even sure it was a good idea.

Regards,
Simon
