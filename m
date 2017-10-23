From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v3] implement strnlen for systems
 that need it
Date: Mon, 23 Oct 2017 17:27:26 +0100
Message-ID: <CAFEAcA_13y2-uM11Ko_79TpEsfpFWMTz2-mAiwFseHfAM5CPgA@mail.gmail.com>
References: <20171023025016.3088-1-programmingkidx@gmail.com> <20171023160959.GC10220@stefanha-x1.localdomain>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=k2a/jTjrl0p2Qzq0ohozmFZuAo157UihC3F2vrYcKKM=;
        b=ZXKqddsFhlu2v7FwHrWcgn8y+39peUj+ixv/wOByuCmdbw48h3i9VFbKU3fs6s0LmU
         GfBzP6MJhKL+GGhvJhwgOGzsuwQHPuxCBP+YVDlUmrjOilXYlEL20VX7wr3rLqb5qjGQ
         159/a+DpIDUQhLAS6onziXoLRxWIB+qYGw/10=
In-Reply-To: <20171023160959.GC10220-lxVrvc10SDRcolVlb+j0YCZi+YwRKgec@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, QEMU Developers <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org" <qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org

On 23 October 2017 at 17:09, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> +/* strnlen() is not available on Mac OS < 10.7 */
>> +# if (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_7)
>
> Does this cover the case where MAC_OS_X_VERSION_MAX_ALLOWED is set to
> <1070 on a 10.7+ build machine?  It's possible that the <string.h>
> header would define strnlen() and your code redefines the function
> (compiler error).

In that case you don't want to use the strnlen() declaration
from the header, you want the inline somehow, because even if
the declaration is present and using it doesn't fail compile
the definition won't be around at runtime.

> It would be best to check how <string.h>, <Availability.h>, and
> <AvailabilityMacros.h> work to make sure that all cases are handled.  I
> don't have access to a Mac right now, sorry.

It uses the clang 'attribute availability' syntax:
https://clang.llvm.org/docs/AttributeReference.html#availability

thanks
-- PMM
