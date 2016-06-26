From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 08/12] libfdt: Add fdt_path_offset_namelen
Date: Sat, 25 Jun 2016 20:53:53 -0600
Message-ID: <CAPnjgZ1ErVW+kN_Jypaf88BUDfBPW9pScgbtqufeDpatPO5oHg@mail.gmail.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com> <20160624142757.32735-9-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=NvhNr90grWi4q/UJFo3ZRuhu0NqdteSBliyN1/p4Mlo=;
        b=CW3+R9XoDCRjt1P2W1NrHCbCivubmoe4fdKNMGFnVpbkPgHpoZJ0hVFOdI658P16qW
         kUxNTNa79fO9sWklKDUeyYv0WSj0CQrjotesl030wS1cgBErmoecMacAbO2ZbIAevLwk
         Ww4vMBjdkUHdDjFalNP8qRMrQRv7ZoeV3GtloHNBbyzIsf69D7ZBhBjnCP+onCAnOOnU
         so9mEXLxiUNs9EU/jKrpaRzaVUajLfeZA8saJzHriNDSQ6vYBz4Ez2czYELPQdbvPNU1
         MFA4/xbhphbqvGGYv0vwGHuRBVmlnji3g8rcKJiN1vFOUIp8Y0aCT2YUBiD8jdeoARht
         JqXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=NvhNr90grWi4q/UJFo3ZRuhu0NqdteSBliyN1/p4Mlo=;
        b=IfVoeyZTGhbVaj4ujHXSPsY4cmoafwO7Tly6BmcWL7btX/43dA6eWyMSnO9/PGzGrY
         VfKo9/MjqZU9gI9j6rZzjvduA6lBESykb4cnzdLeocsgiqN0wCESjsMXO2neylDFC9J5
         IvbX9LYblxgsegboZrUO6aNe0UVGTqFn395kM=
In-Reply-To: <20160624142757.32735-9-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 24 June 2016 at 08:27, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Add a namelen variant of fdt_path_offset to retrieve the node offset using
> only a fixed number of characters.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/libfdt.h    | 16 +++++++++++++++-
>  lib/libfdt/fdt_ro.c | 18 ++++++++++--------
>  2 files changed, 25 insertions(+), 9 deletions(-)

fdt_setprop_inplace
