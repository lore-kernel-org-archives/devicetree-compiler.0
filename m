From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 07/12] libfdt: Add fdt_setprop_inplace_by_index
Date: Sat, 25 Jun 2016 20:53:50 -0600
Message-ID: <CAPnjgZ2iperwdKGa=+BF8ypH+yRJ8NnP24Fti-PbXDs5bfg3dA@mail.gmail.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com> <20160624142757.32735-8-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=rBs5DYGG62E53yNdnW2D72Fayp9V9dD8pxw+vhzKZJQ=;
        b=Gxe2wxoQhGkwf34sfP4AylpAyLjh1pvxPSkqJ7M9reWhSIPfzlwBRTZ3I2pQN9C+xN
         Ao/77aF6cAXhZGi6CHbu12MPcQDw3NQADPqr0pmYg/hqRu1pOEDp+5Z5Ubh/lmzqFf14
         nNNkiKw1hqigjVWhUx/KfQNtp0v26W/famyz7zdI2a6mIQiDaw6yVYGFSEefdA9XSkKA
         xOJeBZO6pCvJx0bD89MQBv7Z+dcEHTlTsZkZkbG7MAp/bQFQrCeH7rrWFashOj/UO1qm
         im7gJplTtlZUpGhQI31LsykGcuxrd4Ou4W0V4/EEbqkmKxYCPOSBpGh8ufM/EkJ+Lg5U
         0vFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=rBs5DYGG62E53yNdnW2D72Fayp9V9dD8pxw+vhzKZJQ=;
        b=OZw1pZRySi2mDB3d+GWfhCtk/26f1YY32KS81/zCpio0IA7EpcfhTJf21LGbLSLd8i
         FI4wRD5CPmaoRuAyBy8ScZQeddD11ZCuIwIf5dFZmLFLVhn2jHpLrUJOSycAHu/7/eo1
         3NjLES7NGKvsxF/O0VBzWxK4aWb5KIcz6WWCQ=
In-Reply-To: <20160624142757.32735-8-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 24 June 2016 at 08:27, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Add a function to modify inplace a property starting from a given index.
>
> This is especially useful when the property is an array of values, and you
> want to update one of them without changing the DT size.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/libfdt.h     | 34 +++++++++++++++++++++++++++++++---
>  lib/libfdt/fdt_wip.c | 13 ++++++++-----
>  2 files changed, 39 insertions(+), 8 deletions(-)

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I need to get fdt_setprop_inplace() upstream.

- Simon
