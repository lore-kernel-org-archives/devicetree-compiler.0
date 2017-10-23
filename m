From: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v3] implement strnlen for systems
 that need it
Date: Mon, 23 Oct 2017 18:09:59 +0200
Message-ID: <20171023160959.GC10220@stefanha-x1.localdomain>
References: <20171023025016.3088-1-programmingkidx@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jpXbwZgXUkrL1yIVc5nCU9K4aKvi+DhoAnPL41sz21E=;
        b=s3PsoT0rgqYxxpBTgB4ZQVAVvWCSC9Axppl7SMHwur7kzdreRzsvikV/XgLJDvidA2
         9Gyn35KKHb2pywJoJeNGO1Gir/yt55soDLZfi0MwDjGS6EavG/k5VlAYlbxyFmvn94IX
         ApK+BgsH6YG0Sj0A+EmyF3oiRnmcEv9z/SLoBlYYSkw1+mzePffIB0hpSE4Bp45N+QHD
         VKMAR+tWzXE++zoK/nI60jQHVtlib+ss/5aSddYrqCZAmJkZXk9FRjX8RyPS78D6TuM8
         8FNeeg0VQqJXa0abz2eu9XfGZgnoEYEGla1oUHpaWOVQcNtwYoHzYRRzliqqyR/5Yja4
         6JHg==
Content-Disposition: inline
In-Reply-To: <20171023025016.3088-1-programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org

On Sun, Oct 22, 2017 at 10:50:16PM -0400, John Arbuckle wrote:
> Prior the Mac OS 10.7, the function strnlen() was not available. This patch
> implements strnlen() on Mac OS X versions that are below 10.7.
> 
> Signed-off-by: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> v3 changes:
> - Replaced loop with memchr()
> 
> v2 changes:
> - Simplified the code to make it static inline'ed
> - Changed the type of count to size_t
> 
>  libfdt/libfdt_env.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
> index 952056c..d43b66b 100644
> --- a/libfdt/libfdt_env.h
> +++ b/libfdt/libfdt_env.h
> @@ -109,4 +109,28 @@ static inline fdt64_t cpu_to_fdt64(uint64_t x)
>  #undef CPU_TO_FDT16
>  #undef EXTRACT_BYTE
>  
> +#ifdef __APPLE__
> +#include <AvailabilityMacros.h>
> +
> +#define MAC_OS_X_VERSION_10_7 1070

Apple has already defined MAC_OS_X_VERSION_10_7 here:
https://opensource.apple.com/source/xnu/xnu-1699.24.8/EXTERNAL_HEADERS/AvailabilityMacros.h

To avoid a compiler warning, please use:

#ifndef MAC_OS_X_VERSION_10_7
#define MAC_OS_X_VERSION_10_7 1070
#endif

> +/* strnlen() is not available on Mac OS < 10.7 */
> +# if (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_7)

Does this cover the case where MAC_OS_X_VERSION_MAX_ALLOWED is set to
<1070 on a 10.7+ build machine?  It's possible that the <string.h>
header would define strnlen() and your code redefines the function
(compiler error).

It would be best to check how <string.h>, <Availability.h>, and
<AvailabilityMacros.h> work to make sure that all cases are handled.  I
don't have access to a Mac right now, sorry.

Perhaps this approach works better:

# ifndef MAC_OS_X_VERSION_10_7
