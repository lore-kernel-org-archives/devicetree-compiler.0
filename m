From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 4/9] libfdt: Add new headers and defines
Date: Fri, 10 Jun 2016 17:03:36 +0300
Message-ID: <D44ABB0F-69B9-4DA6-8F8B-6F74A5B4BFE1@konsulko.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com> <1464340402-2249-5-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:mime-version:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=iUj5ZwXfvxbw8vvbeiOYZ/fEWxA4lhWxLFSstdzLK8s=;
        b=j9HpqjDLoNq+za0En3v0zkkUXE7LNLUCtFM4eITVlsvS9nkxhwdShTnsmgxV77GmcA
         +BE5P5mSm1f9OUgcuMh7tdxwEa0IOd8WspjABJMHBuB63uF3d5WhsK622kI1JffiTIS2
         9RzrE/CSfCrHcLIja/fzrqe6BY/k9hCEmT4MQ=
In-Reply-To: <1464340402-2249-5-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Hi Maxime,

> On May 27, 2016, at 12:13 , Maxime Ripard <maxime.ripard@free-electro=
ns.com> wrote:
>=20
> The libfdt overlay support introduces a bunch of new includes and
> functions.
>=20
> Make sure we are able to build it by adding the needed glue.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> include/libfdt_env.h | 7 +++++++
> 1 file changed, 7 insertions(+)
>=20
> diff --git a/include/libfdt_env.h b/include/libfdt_env.h
> index 273b5d30f867..2d2196031332 100644
> --- a/include/libfdt_env.h
> +++ b/include/libfdt_env.h
> @@ -23,6 +23,13 @@ typedef __be64 fdt64_t;
> #define fdt64_to_cpu(x)		be64_to_cpu(x)
> #define cpu_to_fdt64(x)		cpu_to_be64(x)
>=20
> +#ifdef __UBOOT__
> +#include "malloc.h"
> +#include "vsprintf.h"
> +
> +#define strtol(cp, endp, base)	simple_strtol(cp, endp, base)
> +#endif
> +
> /* adding a ramdisk needs 0x44 bytes in version 2008.10 */
> #define FDT_RAMDISK_OVERHEAD	0x80
>=20

We need to figure out what the upstream libfdt/dtc maintainer=E2=80=99s=
 take is on this is.
=46or u-boot we=E2=80=99re fine and for now it=E2=80=99s OK.

Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

> --=20
> 2.8.2
>=20
