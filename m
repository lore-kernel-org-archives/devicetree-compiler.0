From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 06/12] libfdt: Add max phandle retrieval function
Date: Sat, 25 Jun 2016 20:53:46 -0600
Message-ID: <CAPnjgZ3rfd5q9BRVwWsq978b74xs8-DJUd_ktBjRvGpA_9zpeg@mail.gmail.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com> <20160624142757.32735-7-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=zRL/a6KyLWCU3xmfrhBhkgzLyL4y4DjgfeNIE1xUQYk=;
        b=jjodnRJl/yf/OveWOhz0IcPpLNGlek6FrCGzMn8eI/07YWYMM44U9RkSCxjd2SmCSm
         UNqSjUxAzeWUqRTvzz7lBs+xsIMcu6tVrfkmML5J8oyiXur6cPG7cLEagNqiHeIK2tWR
         xyqbGVuyFSpKy1e2sXHKiLdS1cf8gNjcIXVL4vSQBlNVlcce2vYwNlEAd5TWturoIR7V
         NuyfQ2t3LhpP2WrXImtpt0STNd+LX9B4afJssL6GalMDRB1kQCXJDTRI1p2S5Bg28QXH
         321oqN5cEXK8d16iwmDEh12EVzXLHPRaIk8rBWpKH/x+3ntuDhWa+2mQbqQmQc7tE3XA
         RPiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=zRL/a6KyLWCU3xmfrhBhkgzLyL4y4DjgfeNIE1xUQYk=;
        b=WWV+6R9DRvov7s1P2pl6cfqCLRK5Oav/W3g3sCnaLJFTXDl5il1UAbQbDQZPumNopZ
         PTPEO8A0XLcExjGGtCwfQEz7m4L9FjjIMOizJ01f2VRIfbG2MyvUB7dg9bRTTpl+WLug
         93f22SJ73dOILSSKmW3l44eA/7T/f2YseDsbU=
In-Reply-To: <20160624142757.32735-7-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 24 June 2016 at 08:27, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Add a function to retrieve the highest phandle in a given device tree.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  include/libfdt.h    | 13 +++++++++++++
>  lib/libfdt/fdt_ro.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
