From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 8/9] cmd: fdt: add fdt overlay application subcommand
Date: Thu, 9 Jun 2016 17:34:47 -0700
Message-ID: <CAPnjgZ1UhKxLcOUU3y52JBPwHyP4DJhsdXsCnbMh9nYQKDX8eA@mail.gmail.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-9-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=0abv9lrMumutVJLemPZa35dh5dLcpn1JlJ2lkr+813I=;
        b=GHbEUg3OHJ5AyOHTrUhYd11i6P4TwAGTu9t2Bhi63tAkmh4hAaPHyuxzEsl+478up2
         FXq+T4vrYWAeXb/7XLpd9p68rbUN1VNp86RF5lEhBhyjW1BNiuxLXT2fOoIvk7i0olTJ
         Lu9gd0t+aqqLbmFV8LnRvvVLStvnCphkjG+AH+rZMoPT9iw/3SJyGfudCvebWlJtoGxh
         DXKHT7S4i+hZ5c2EprH3Y1pH88ljSri1EqvIo8IEHtBo3ILrsW5EEvvTlM0d9Yq+Evpp
         9QGufIh8YRK8GafOe0XwFsuOckZaQfetW5zT7A6ZIhNYkqDwlZ+vh5hhHZgGUdG3RYgz
         4MyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=0abv9lrMumutVJLemPZa35dh5dLcpn1JlJ2lkr+813I=;
        b=cXjyfMo8VRXVe/93opbLRboAjLx9wfWrSWOyHLj+xSI/62Xucs8PNeXaDA7PoN/REx
         4kGLZ8DZjIl4nfl6/n8TYbd037BJW0DJX5fuMR+pC+Ulyfd6N+KvWOeg8CkhF5Cd373w
         Y+aUwUhZvWmzrxqCYCSLZxwF37Z+OpohrB0d8=
In-Reply-To: <1464340402-2249-9-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Hi Maxime,

On 27 May 2016 at 03:13, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The device tree overlays are a good way to deal with user-modifyable

nit: modifiable

> boards or boards with some kind of an expansion mechanism where we can
> easily plug new board in (like the BBB or the raspberry pi).
>
> However, so far, the usual mechanism to deal with it was to have in Linux
> some driver detecting the expansion boards plugged in and then request
> these overlays using the firmware interface.
>
> That works in most cases, but in some cases, you might want to have the
> overlays applied before the userspace comes in. Either because the new
> board requires some kind of an early initialization, or because your root
> filesystem is accessed through that expansion board.
>
> The easiest solution in such a case is to simply have the component before
> Linux applying that overlay, removing all these drawbacks.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  cmd/fdt.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
