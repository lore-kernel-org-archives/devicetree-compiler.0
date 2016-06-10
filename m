From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 4/9] libfdt: Add new headers and defines
Date: Thu, 9 Jun 2016 17:34:42 -0700
Message-ID: <CAPnjgZ1M3ko-ovjSuLcO-dpW2XuZ-dRSTkzr76+VeUBfau6brw@mail.gmail.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-5-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=EzkpAgx9Kh5QEuVdBXqhcW54xsp+K+PK8Uj1KPANsf0=;
        b=VoPrYJ3oE+DcNd3bUGwqC4qphYGuNetUrSVw47iAfwENsfjMWczUwnb8yTfK6JsETU
         a8VJXXXpUIZ1OiRySXu+3nf5FlwFXNr8DfwlV/N2Hp6AZeR4fjOJ/lLBUVmNtnqkDZ++
         DGcM1Ydyqz88kjjM67FVUGFmU2TT8K8/XcmSdGVMaH3+VLLWzYw7H15hQg7r86myVAij
         kk93CjpYvN7hlttmB4VAzJtWg6oBqjLzHTCD/KtcdeXeVcR7lEI6Y2PoDeEciyZWVlP8
         hJxDnlFKDQSWZC1fX+rWs4U+Hf1GfUnZK+3a3Nk7QHJCG7JarqMsJQkVbWQ8W8oHX8qv
         zs6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=EzkpAgx9Kh5QEuVdBXqhcW54xsp+K+PK8Uj1KPANsf0=;
        b=oLpA8CLOiHv0kTLIQq9iS7CNDVsre9vPGCp3asyQ4rbffp7pMBvRfumKyvzDHKGa4y
         c46MlDl1cCcw6XgUi+ATcVFr3j1gZcYlKbqFMUZPW+7p659Knaf4XOd4bRIE3M0v1VLV
         KnlcMYZv7o1mfhwVEzBuu5/D9HxJqElLTpnss=
In-Reply-To: <1464340402-2249-5-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Hi Maxime,

On 27 May 2016 at 03:13, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The libfdt overlay support introduces a bunch of new includes and
> functions.
>
> Make sure we are able to build it by adding the needed glue.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/libfdt_env.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/libfdt_env.h b/include/libfdt_env.h
> index 273b5d30f867..2d2196031332 100644
> --- a/include/libfdt_env.h
> +++ b/include/libfdt_env.h
> @@ -23,6 +23,13 @@ typedef __be64 fdt64_t;
>  #define fdt64_to_cpu(x)                be64_to_cpu(x)
>  #define cpu_to_fdt64(x)                cpu_to_be64(x)
>
> +#ifdef __UBOOT__
> +#include "malloc.h"
> +#include "vsprintf.h"

Can we use <malloc.h> and <vsprintf.h> instead?

> +
> +#define strtol(cp, endp, base) simple_strtol(cp, endp, base)
> +#endif
> +
>  /* adding a ramdisk needs 0x44 bytes in version 2008.10 */
>  #define FDT_RAMDISK_OVERHEAD   0x80
>
> --
> 2.8.2
>

Regards,
Simon
