From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCHv2 1/5] dtc: Use quotes to include header files
Date: Sat, 27 Dec 2014 20:08:32 -0600
Message-ID: <CAL_JsqLegL1jT4rtNtum1RabXvd3NbS_G1EkkVjCcN-aPg975A@mail.gmail.com>
References: <1419369212-17047-1-git-send-email-chris.packham@alliedtelesis.co.nz>
 <1419369212-17047-2-git-send-email-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=nF9lBsfnLcleVwoiaRT0UtEs+9sChfuO1TWh4Ov/wlc=;
        b=ZVxEtddCjJu9sKUgycWf5G7FjfZwmiQgEAKskegPg1jKX9eXvKalkEXhCCWSCdqX8A
         RbAWO8u9OcbBsA9vbrdMOxQDxgNJylufwhNp6xEmQ4TB6muj88Qw/FObdo+O/rgiCEk8
         8+FVIQZq8+fN3EkK8A0Su9H15wgfL0bJURLNMEjoR7MYvQGI/QUmw+4xD6zYAan0txrc
         6kytPY8Iyf/svxBWkhm/mHcqQ/mPx9Ovnl6znH2Y49fe95PmEEYBrcgAnJfcGuaSV5Ir
         A/CdEm9tohsufcKW5+9FkDDTUUTsn0UqL/v7bYd5eOM7QRhA84EUZnTjJHxBxIq80iC2
         gpOw==
In-Reply-To: <1419369212-17047-2-git-send-email-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Dec 23, 2014 at 3:13 PM, Chris Packham
<chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> wrote:
> Currently in arch and driver code that needs early access to the
> flattened device tree it is necessary to add specific CFLAGS so that
> when scripts/dtc/libfdt/libfdt.h is included the C preprocessor is able
> to locate the libfdt versions of libfdt_env.h and fdt.h without
> generating an error.
>
> We already provide an alternative linux-specific
> version of libfdt_env.h and directly include scripts/dtc/libfdt/fdt.h
> so the inclusion by scripts/dtc/libfdt/libfdt.h is a no-op thanks to the
> inclusion guards.
>
> By using quotes in scripts/dtc/libfdt/libfdt.h it picks up fdt.h and
> libfdt_env.h from the source directory without needing to add CFLAGS for
> the sources that happen to include linux/libfdt.h.
>
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
> For the files that include linux/libfdt.h we currently also have to
> specify additional CFLAGS to satisfy the CPP.
>
>   $ git grep '<linux/libfdt.h>'
>   arch/mips/cavium-octeon/octeon-platform.c:#include <linux/libfdt.h>
>   arch/mips/cavium-octeon/setup.c:#include <linux/libfdt.h>
>   arch/mips/mti-sead3/sead3-setup.c:#include <linux/libfdt.h>
>   arch/powerpc/kernel/prom.c:#include <linux/libfdt.h>
>   drivers/firmware/efi/libstub/fdt.c:#include <linux/libfdt.h>
>   drivers/of/fdt.c:#include <linux/libfdt.h>
>   drivers/of/fdt_address.c:#include <linux/libfdt.h>
>
>   $ git grep -e '-I.*dtc/libfdt'
>   arch/mips/cavium-octeon/Makefile:CFLAGS_octeon-platform.o = -I$(src)/../../../scripts/dtc/libfdt
>   arch/mips/cavium-octeon/Makefile:CFLAGS_setup.o = -I$(src)/../../../scripts/dtc/libfdt
>   arch/mips/mti-sead3/Makefile:CFLAGS_sead3-setup.o = -I$(src)/../../../scripts/dtc/libfdt
>   arch/powerpc/kernel/Makefile:CFLAGS_prom.o              = -I$(src)/../../../scripts/dtc/libfdt
>   drivers/firmware/efi/libstub/Makefile:CFLAGS_fdt.o += -I$(srctree)/scripts/dtc/libfdt/
>   drivers/of/Makefile:CFLAGS_fdt.o = -I$(src)/../../scripts/dtc/libfdt
>   drivers/of/Makefile:CFLAGS_fdt_address.o = -I$(src)/../../scripts/dtc/libfdt
>   lib/Makefile:   $(eval CFLAGS_$(file) = -I$(src)/../scripts/dtc/libfdt))
>
> Simply by switching to using quotes we can avoid having this extra step.

Nice, but I would like to see all of these CFLAGS removed as well.

>  scripts/dtc/libfdt/libfdt.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This is an import of dtc/libfdt and patches to it should be sent
upstream and to devicetree-compiler list.

Rob

> diff --git a/scripts/dtc/libfdt/libfdt.h b/scripts/dtc/libfdt/libfdt.h
> index 73f4975..ea1ddcd 100644
> --- a/scripts/dtc/libfdt/libfdt.h
> +++ b/scripts/dtc/libfdt/libfdt.h
> @@ -51,8 +51,8 @@
>   *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>   */
>
> -#include <libfdt_env.h>
> -#include <fdt.h>
> +#include "libfdt_env.h"
> +#include "fdt.h"
>
>  #define FDT_FIRST_SUPPORTED_VERSION    0x10
>  #define FDT_LAST_SUPPORTED_VERSION     0x11
> --
> 2.2.0.rc0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
