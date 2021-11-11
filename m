From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: fix with Python 3.10
Date: Thu, 11 Nov 2021 15:58:11 -0600
Message-ID: <CAL_JsqJJJn21GTaSuZ0jVtauOMNT34-NzopSV8pve9xJnP+jFA@mail.gmail.com>
References: <20211111160536.2516573-1-ross.burton@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636667904;
        bh=P9BsDU154LRYDbub4GwNAy2Fd2TScVjhWiGRLDBIxC4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SADTIX/CXV+7H6RncypW/iTtogYuKUXcUUm7xKmtgAGE+D2ofNgothPiF7F/7mBGo
         RI8lNtsc1uCO++ewsbl7mOHaL1+7T3V1iCs26d54fEslxvSNOR9D09RjkyL63HwpSb
         4QBupVREAXUgaEEY5BPauRhzecdFtrFoUSMlhvps6jv7RVnBmxXAAD6S0HYshgybwV
         /2tuVGxK2BZ+1gf7RAAzgyWhdoQCMcTnjRfl/uGSdh1TjGnNlFvkPOQExu3cYNfLZ3
         mjt9xdbGwdXhf81jMWbxatjsMmUAt4Qdwn9mCIbCeScp5I0Legt9h4ia/lSMy5AjW0
         wLFHmY+qPfLgg==
In-Reply-To: <20211111160536.2516573-1-ross.burton-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ross Burton <ross.burton-5wv7dgnIgG8@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Nov 11, 2021 at 10:05 AM Ross Burton <ross.burton-5wv7dgnIgG8@public.gmane.org> wrote:
>
> Since Python 2.5 the argument parsing functions when parsing expressions
> such as s# (string plus length) expect the length to be an int or a
> ssize_t, depending on whether PY_SSIZE_T_CLEAN is defined or not.
>
> Python 3.8 deprecated the use of int, and with Python 3.10 this symbol
> must be defined and ssize_t used[1].
>
> Define the magic symbol when building the extension, and cast the ints
> from the libfdt API to ssize_t as appropriate.
>
> [1] https://docs.python.org/3.10/whatsnew/3.10.html#id2
>
> Signed-off-by: Ross Burton <ross.burton-5wv7dgnIgG8@public.gmane.org>
> ---
>  pylibfdt/libfdt.i | 4 ++--
>  pylibfdt/setup.py | 1 +

setup.py just moved up a level.

With that fixed up,

Tested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
