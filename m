From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 04/12] libfdt: Add new headers and defines
Date: Sat, 25 Jun 2016 20:53:37 -0600
Message-ID: <CAPnjgZ3z=1i2+FkSD2XAujv00WLQ9zsq5Fe2cnWE+ox2LrH3hA@mail.gmail.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com> <20160624142757.32735-5-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=MwlGoRbO5sFUQ9fk9SFO7iIZ0bgnNVLT6jG4qauoSIY=;
        b=j26laD7eWq60BzoWg9p5rIJR+J7EbNhwJZ9s4K+9M+RaXqv3PH9do4jEcH+2rgIiqn
         XWTgiFaXm2Dw3nyQIHkyIelQlD51Iio/I2I5OI8rtnxT1yHKjPEKf9w41xfUWYJ4oUyg
         WLa6bxqPixjHpPzTx4oBpoqdz6ZWsNVNnF+sUrXDWMFudsio/4a2dal22veC75hQkHe0
         9quNrirBmizpfi02+8IzaSHSZiohPLgHKgDVsujHT/tRQs0q+0SkpM5+xoWQb1vZSte0
         VxQlz2W0KJbogZZYAAluAJOXZ2dVg2yzKXYdmXB5eqFrdMtyWyLq9OxIp2KLz0hWvPg2
         lkJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=MwlGoRbO5sFUQ9fk9SFO7iIZ0bgnNVLT6jG4qauoSIY=;
        b=Uc2e7K1to3N6xMSXEI0A/ZgND/pvbZB3oE4thRGhjaPoDw4vwU0Ji9COZ8ejNkhhu5
         HnjjHuBBTcMEtPmsH09wN7UA1E+r+F2qLOXJRPiPCAU6Fu5t5J+b2Cf/oWbSm5fW7Bn1
         KrB42Qnq/C/95RNg6FJuskNSUBdXtFvG5MKQk=
In-Reply-To: <20160624142757.32735-5-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 24 June 2016 at 08:27, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The libfdt overlay support introduces a bunch of new includes and
> functions.
>
> Make sure we are able to build it by adding the needed glue.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/libfdt_env.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
