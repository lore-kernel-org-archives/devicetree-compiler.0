From: Chris Packham <chrisp-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [RFC/PATCHv2 1/5] dtc: Use quotes to include header files
Date: Sat, 3 Jan 2015 10:21:24 +1300 (NZDT)
Message-ID: <alpine.DEB.2.10.1501031016150.12776@chrisp-dl.ws.atlnz.lc>
References: <1419369212-17047-1-git-send-email-chris.packham@alliedtelesis.co.nz> <1419369212-17047-2-git-send-email-chris.packham@alliedtelesis.co.nz> <CAL_JsqLegL1jT4rtNtum1RabXvd3NbS_G1EkkVjCcN-aPg975A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail; t=1420233698;
	bh=O8gJ+Q5BYCRjIfuRFcuOFaU1hd8jQvygl6jgr8xypFY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=G1QV46VjKCIASFslbljZXp6+CX7rMHB9tPyRVO8c6VMP0lil6OFFexTjDss/tXr4R
	 Qr+zPUD4FW2OO0JbDecUqrc/QQR1/Me1UUmdrwHQWL5cfOx6ufh+284f4Y1TXM/t8H
	 S/TZLVNwmBXRFm6H4e1tluwbw6LmF40LgsAX/baE=
In-Reply-To: <CAL_JsqLegL1jT4rtNtum1RabXvd3NbS_G1EkkVjCcN-aPg975A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


Hi Rob,

On Sat, 27 Dec 2014, Rob Herring wrote:

> On Tue, Dec 23, 2014 at 3:13 PM, Chris Packham
> <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> wrote:
>> Currently in arch and driver code that needs early access to the
>> flattened device tree it is necessary to add specific CFLAGS so that
>> when scripts/dtc/libfdt/libfdt.h is included the C preprocessor is able
>> to locate the libfdt versions of libfdt_env.h and fdt.h without
>> generating an error.
>>
>> We already provide an alternative linux-specific
>> version of libfdt_env.h and directly include scripts/dtc/libfdt/fdt.h
>> so the inclusion by scripts/dtc/libfdt/libfdt.h is a no-op thanks to the
>> inclusion guards.
>>
>> By using quotes in scripts/dtc/libfdt/libfdt.h it picks up fdt.h and
>> libfdt_env.h from the source directory without needing to add CFLAGS for
>> the sources that happen to include linux/libfdt.h.
>>
>> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
>> ---
>> For the files that include linux/libfdt.h we currently also have to
>> specify additional CFLAGS to satisfy the CPP.
>>
>>   $ git grep '<linux/libfdt.h>'
>>   arch/mips/cavium-octeon/octeon-platform.c:#include <linux/libfdt.h>
>>   arch/mips/cavium-octeon/setup.c:#include <linux/libfdt.h>
>>   arch/mips/mti-sead3/sead3-setup.c:#include <linux/libfdt.h>
>>   arch/powerpc/kernel/prom.c:#include <linux/libfdt.h>
>>   drivers/firmware/efi/libstub/fdt.c:#include <linux/libfdt.h>
>>   drivers/of/fdt.c:#include <linux/libfdt.h>
>>   drivers/of/fdt_address.c:#include <linux/libfdt.h>
>>
>>   $ git grep -e '-I.*dtc/libfdt'
>>   arch/mips/cavium-octeon/Makefile:CFLAGS_octeon-platform.o = -I$(src)/../../../scripts/dtc/libfdt
>>   arch/mips/cavium-octeon/Makefile:CFLAGS_setup.o = -I$(src)/../../../scripts/dtc/libfdt
>>   arch/mips/mti-sead3/Makefile:CFLAGS_sead3-setup.o = -I$(src)/../../../scripts/dtc/libfdt
>>   arch/powerpc/kernel/Makefile:CFLAGS_prom.o              = -I$(src)/../../../scripts/dtc/libfdt
>>   drivers/firmware/efi/libstub/Makefile:CFLAGS_fdt.o += -I$(srctree)/scripts/dtc/libfdt/
>>   drivers/of/Makefile:CFLAGS_fdt.o = -I$(src)/../../scripts/dtc/libfdt
>>   drivers/of/Makefile:CFLAGS_fdt_address.o = -I$(src)/../../scripts/dtc/libfdt
>>   lib/Makefile:   $(eval CFLAGS_$(file) = -I$(src)/../scripts/dtc/libfdt))
>>
>> Simply by switching to using quotes we can avoid having this extra step.
>
> Nice, but I would like to see all of these CFLAGS removed as well.
>

If/when this is accepted I'll send a follow up patch removing these. Given 
the comment below about getting the patch in the upstream dtc repository 
it make take some time for it to be accepted there and then sync'd with 
the kernel source.

>>  scripts/dtc/libfdt/libfdt.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> This is an import of dtc/libfdt and patches to it should be sent
> upstream and to devicetree-compiler list.

Have done so now.

>
> Rob
>
>> diff --git a/scripts/dtc/libfdt/libfdt.h b/scripts/dtc/libfdt/libfdt.h
>> index 73f4975..ea1ddcd 100644
>> --- a/scripts/dtc/libfdt/libfdt.h
>> +++ b/scripts/dtc/libfdt/libfdt.h
>> @@ -51,8 +51,8 @@
>>   *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>>   */
>>
>> -#include <libfdt_env.h>
>> -#include <fdt.h>
>> +#include "libfdt_env.h"
>> +#include "fdt.h"
>>
>>  #define FDT_FIRST_SUPPORTED_VERSION    0x10
>>  #define FDT_LAST_SUPPORTED_VERSION     0x11
>> --
>> 2.2.0.rc0
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
