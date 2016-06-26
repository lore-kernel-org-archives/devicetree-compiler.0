From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 05/12] libfdt: Add iterator over properties
Date: Sat, 25 Jun 2016 20:53:41 -0600
Message-ID: <CAPnjgZ3tQS23mnNkzVSme8nkEtPJoxnyVcVPFR1zgcmtpU7Dog@mail.gmail.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com> <20160624142757.32735-6-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=736xHRJHiL6Yfs8S82IMkfywPdwEZiOyh1wKkeT42jo=;
        b=PW/hrcAk2Zl09qnWxB/7cnIVZ0x4SYkgGstlwmpm4euI7q7XIU+Y13aBWyYeQkjf1V
         IwXuUKLxTA80I6wDyYDZJFrRpQyDP/OYtWmLI2CicHr7jPdLulN7DfvKg9y2RQ8LFykV
         DZLICi2dibM+tdVv7FVANpyICMu4juNgxtpUqnh8iHDWf99RaxJ0GNTQsZEAkrMfuLuN
         OEa+nRo8rVNbO1wgK6uef0gAOF8FHZlMxsljqPBUMqASXPRDLL42xzyVD6ZVMglCipwk
         JyEo57LSv7YRCV3YUQBHEARWjK23u2gRVgPiB7VAF4hHzAUu12CDQbk5Y+P9vVS57GCR
         b6pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=736xHRJHiL6Yfs8S82IMkfywPdwEZiOyh1wKkeT42jo=;
        b=kuOwC7SQWNBpr1D5qbNxb4ZOZNO6FCdiaRd5BnRdrSANUoDNIuVVSeLvWDLWwYyRqD
         9i++Fz21ZsyAQ+Abw5Dktfw9ofIbc8u3pmAMcmfdbnG6pcUIrz5Qt3e9mB5600L3f+IY
         DLzQoewdEnBda3jXScyNl2ddjTOCIytnhkaX8=
In-Reply-To: <20160624142757.32735-6-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 24 June 2016 at 08:27, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Implement a macro based on fdt_first_property_offset and
> fdt_next_property_offset that provides a convenience to iterate over all
> the properties of a given node.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/libfdt.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
