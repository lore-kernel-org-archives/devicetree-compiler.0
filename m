From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 2/9] scripts: Makefile.lib: Sanitize DTB names
Date: Thu, 9 Jun 2016 17:34:36 -0700
Message-ID: <CAPnjgZ24xVpDhaxwuinj2uxWG1uWyp+3ZY0MnQfukF9MYXdSfA@mail.gmail.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-3-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=s7WnKmcTETD4uFfQSju9iY4HOJXrDJmkfsrGDf8YrYk=;
        b=mIcF6HeDv6yrcJLbEDUQ71juZ3ub8DvGrQknYfKeJ378JJ7u9hKemSam91LlLXWqOJ
         Yg6/GkI1zopuix2ub9hZw0bKXlLRR4CoLfJeH//1dcYQ6RWnb2ft/pFXjdn7Sy/Np9m4
         vZbXyQpt14zsuPoaWDJsFJgcApmulAyRbQRsZbeqKAFTbQ6vx2frUPp+0SVJ8rmEoaJt
         nvjDYk/fuwHW21FSk+k/isGVfJ5XNQMoYBVvh1kze9HWLJhVkJK+Ph9yGaQOHlGpu6/A
         ep6IbZA4hvgoMbV1y/prlLHis0+CG22iGTF5uuC7IQ8/ZWO0MdbScTJ60Ym55qFW1srY
         WHvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=s7WnKmcTETD4uFfQSju9iY4HOJXrDJmkfsrGDf8YrYk=;
        b=hECIoNXtbu5Ran0mxdJ0KdBvG3TVMZEWrEl/iqL2NDuoTy1Hc0UWdTNnkKdxkrDgZg
         mFEE4dnfWMGd643N3qIlPVPdNin7oNtxsCTj9CHFAGD5f8AuA1LkwJDcf8llVJOX02wi
         ozVjktSBx6Xy2asEjcEROgB4FJuFWgPUuSTA4=
In-Reply-To: <1464340402-2249-3-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 27 May 2016 at 03:13, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Having dashes as a separator in the DTB name is a quite common practice.
>
> However, the current code to generate objects from DTBs assumes the
> separator is an underscore, leading to a compilation error when building a
> device tree with dashes.
>
> Replace all the dashes in the DTB name to generate the symbols name, which
> should solve this issue.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  scripts/Makefile.lib | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
