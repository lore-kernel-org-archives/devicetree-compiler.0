From: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v3] implement strnlen for systems
 that need it
Date: Tue, 24 Oct 2017 14:09:56 +0200
Message-ID: <20171024120956.GD18756@stefanha-x1.localdomain>
References: <20171023025016.3088-1-programmingkidx@gmail.com>
 <20171023160959.GC10220@stefanha-x1.localdomain>
 <2ACA132F-70DF-488A-AE41-59FFF08E8755@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vFgLib2lBtTkRSm0uu0DhaLRYi1boeUk0p0S45a1w58=;
        b=BsZFcdpljrTxI19hNxqTIbHS9xtjmGEfGv39BO7b8v3Xih95R4vur2luDD2ygP8BzO
         bmC8lMRIkvivEsxMZlnfDBCwkzLUuEVQeGTzsAQzlz7nJUMpYoAZbb5o05LJYpJVIFEe
         pn1BzIS81ep1U/duZZys1lEPZApmhhkJIoYu+orb6KqarYvQyv54J0TOb+cM0BjppU4z
         RynI3t0GTmlQUi+w/y85G9w8DWqz/zRMkjpmphzJAPRZPcukSD4v8sfxAU1kA+QO5Sy/
         d+pkh0DTDo5qnwRHDfAKOydxh2mVQDo457fFgg4j+mwqPfE3jT3V1C5dORKhVLjWPo2Q
         QkgQ==
Content-Disposition: inline
In-Reply-To: <2ACA132F-70DF-488A-AE41-59FFF08E8755-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Programmingkid <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org

On Mon, Oct 23, 2017 at 11:13:13PM -0400, Programmingkid wrote:
> 
> > On Oct 23, 2017, at 12:09 PM, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > 
> > On Sun, Oct 22, 2017 at 10:50:16PM -0400, John Arbuckle wrote:
> >> Prior the Mac OS 10.7, the function strnlen() was not available. This patch
> >> implements strnlen() on Mac OS X versions that are below 10.7.
> >> 
> >> Signed-off-by: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >> v3 changes:
> >> - Replaced loop with memchr()
> >> 
> >> v2 changes:
> >> - Simplified the code to make it static inline'ed
> >> - Changed the type of count to size_t
> >> 
> >> libfdt/libfdt_env.h | 24 ++++++++++++++++++++++++
> >> 1 file changed, 24 insertions(+)
> >> 
> >> diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
> >> index 952056c..d43b66b 100644
> >> --- a/libfdt/libfdt_env.h
> >> +++ b/libfdt/libfdt_env.h
> >> @@ -109,4 +109,28 @@ static inline fdt64_t cpu_to_fdt64(uint64_t x)
> >> #undef CPU_TO_FDT16
> >> #undef EXTRACT_BYTE
> >> 
> >> +#ifdef __APPLE__
> >> +#include <AvailabilityMacros.h>
> >> +
> >> +#define MAC_OS_X_VERSION_10_7 1070
> > 
> > Apple has already defined MAC_OS_X_VERSION_10_7 here:
> > https://opensource.apple.com/source/xnu/xnu-1699.24.8/EXTERNAL_HEADERS/AvailabilityMacros.h
> > 
> > To avoid a compiler warning, please use:
> > 
> > #ifndef MAC_OS_X_VERSION_10_7
> > #define MAC_OS_X_VERSION_10_7 1070
> > #endif
> 
> Sounds logical.
> 
> > 
> >> +/* strnlen() is not available on Mac OS < 10.7 */
> >> +# if (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_7)
> > 
> > Does this cover the case where MAC_OS_X_VERSION_MAX_ALLOWED is set to
> > <1070 on a 10.7+ build machine?  It's possible that the <string.h>
> > header would define strnlen() and your code redefines the function
> > (compiler error).
> 
> If MAC_OS_X_VERSION_MAX_ALLOWED is equal to 1070 then this code would not be executed. This branch would only be taken if MAC_OS_X_VERSION_MAX_ALLOWED is less than 1070. So there would not be a compiler error.
> 
> > 
> > It would be best to check how <string.h>, <Availability.h>, and
> > <AvailabilityMacros.h> work to make sure that all cases are handled.  I
> > don't have access to a Mac right now, sorry.
> > 
> > Perhaps this approach works better:
> > 
> > # ifndef MAC_OS_X_VERSION_10_7
> 
> I think you are saying I should remove the "#ifdef __APPLE__" code and just check to see if MAC_OS_X_VERSION_10_7 is defined. That might work on Mac OS 10.6 and 10.5, but it would probably cause problems with non-Mac-OS platforms. 

No, the ifndef is still "indented" and it would be like this:

#ifdef __APPLE_
...
# ifndef MAC_OS_X_VERSION_10_7
