From: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v3] implement strnlen for systems
 that need it
Date: Tue, 24 Oct 2017 14:18:22 +0200
Message-ID: <20171024121822.GE18756@stefanha-x1.localdomain>
References: <20171023025016.3088-1-programmingkidx@gmail.com>
 <20171023160959.GC10220@stefanha-x1.localdomain>
 <CAFEAcA_13y2-uM11Ko_79TpEsfpFWMTz2-mAiwFseHfAM5CPgA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rn4MKyhl3A5BcS9HkESyb2Or5cEveiF12eZ4HektTK8=;
        b=UIGzSlWsv4kVpRN1GovY0BliUViTCwBHhtiA0FvasDE6I7ZVBUJNcknk741LZ66aek
         UFv2z8lb2Gfg05USoAdvXahaGL7JQ0mKrHs7rnTA1DCUp2oLoaAz+ihn6qw/5oug2E3j
         gxquYAv+MzZaUBTQlmI9ReNzrZs1p1qn7Xfa8aWf5njJravuj2PMEEic0wmD4UpBZ70J
         pT0DqWEyDDYUm4lLLHF3atduEEMY+ppGGp1xpx4w4Mc5qF1VxOSjZiS8eeyKQ6uB/uFY
         mqBKUsb1v0zVAOosRvtZLrEwV4fXdgzYcUCHm7hmIN6q2CUQmkmACa/QjzOLNvczIWrz
         jSPQ==
Content-Disposition: inline
In-Reply-To: <CAFEAcA_13y2-uM11Ko_79TpEsfpFWMTz2-mAiwFseHfAM5CPgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, QEMU Developers <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org" <qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org

On Mon, Oct 23, 2017 at 05:27:26PM +0100, Peter Maydell wrote:
> On 23 October 2017 at 17:09, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> +/* strnlen() is not available on Mac OS < 10.7 */
> >> +# if (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_7)
> >
> > Does this cover the case where MAC_OS_X_VERSION_MAX_ALLOWED is set to
> > <1070 on a 10.7+ build machine?  It's possible that the <string.h>
> > header would define strnlen() and your code redefines the function
> > (compiler error).
> 
> In that case you don't want to use the strnlen() declaration
> from the header, you want the inline somehow, because even if
> the declaration is present and using it doesn't fail compile
> the definition won't be around at runtime.

Perhaps one way around this case is to:

# if !defined(MAC_OS_X_VERSION_10_7) || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_7)
#  include <string.h> /* make sure it isn't included again */
#  define strnlen fdt_strnlen
static inline fdt_strnlen(...) { ... }

This way the symbol strnlen() isn't used and the system headers cannot
cause problems.

Stefan
