From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 9/9] tests: Introduce DT overlay tests
Date: Thu, 9 Jun 2016 17:34:50 -0700
Message-ID: <CAPnjgZ09MJ4jRwd1pCZ=VSj7rhR20hQtzcZm3oUKVo04LG59VQ@mail.gmail.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-10-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4YY4/PDYLwWG5sTTGj7I56cXg3RApHrgx16Mk1Pi6Ec=;
        b=LTRqHIA4hTThrQgy39O0YGNxr/gEvzouMys8AgIDEAG5UY20s9I1qCZZ2GrlJE1QQF
         rM20lOOjF++ZdCFhnHxHWXv+CDKBGhvdh0ZHmRUW8OjtI+Ir+/2klJ9qjzPIb+wVtOaW
         O1lj+Rb8OT7IumX5uV26wbHr2ka3Ti9RqFAh6oISkZ4XulzMqui/yHImHM4+tdFxt/Gt
         SnDHm0PQU5bkSuvhwHF7E9IaAG/3KMTYXIPCgdSx9VlAzCIBXGgbJVtdNdHeJXf1YZWm
         9BRfkAhOqS+dSJHS+ZlE3jYu1AjWyezJ5nybtuSM8JFx7Wjc591P8ttVnUp+mIdIwBJS
         1Q2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4YY4/PDYLwWG5sTTGj7I56cXg3RApHrgx16Mk1Pi6Ec=;
        b=dLqi/wKFrQQzQ8G0JA+AmCC0SmKcLKWooM+uJJ5J42gk5CB9/BfGuqCfFgPlz3dRU7
         j+VtTCqqDy5E8MNRPl8/XfcumMBEAqn84rw6/n2nxhgELd2aMaLzZ7+y7NU46P7BrkLe
         SmkxzJ8+Lvqc8NzXIIZYWGu0Pf4yFkwj3Ds7E=
In-Reply-To: <1464340402-2249-10-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 27 May 2016 at 03:13, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> This adds a bunch of unit tests for the "fdt apply" command.
>
> They've all been run successfully in the sandbox. However, as you still
> require an out-of-tree dtc with overlay support, this is disabled by
> default.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Makefile                          |   1 +
>  include/test/overlay.h            |  16 ++++
>  include/test/suites.h             |   1 +
>  test/Kconfig                      |   1 +
>  test/cmd_ut.c                     |   6 ++
>  test/overlay/Kconfig              |  10 +++
>  test/overlay/Makefile             |  15 ++++
>  test/overlay/cmd_ut_overlay.c     | 176 ++++++++++++++++++++++++++++++++++++++
>  test/overlay/test-fdt-base.dts    |  17 ++++
>  test/overlay/test-fdt-overlay.dts |  60 +++++++++++++
>  10 files changed, 303 insertions(+)
>  create mode 100644 include/test/overlay.h
>  create mode 100644 test/overlay/Kconfig
>  create mode 100644 test/overlay/Makefile
>  create mode 100644 test/overlay/cmd_ut_overlay.c
>  create mode 100644 test/overlay/test-fdt-base.dts
>  create mode 100644 test/overlay/test-fdt-overlay.dts

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
