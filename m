From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/9] cmd: fdt: Narrow the check for fdt addr
Date: Thu, 9 Jun 2016 17:34:34 -0700
Message-ID: <CAPnjgZ10-O3FxaAg6YCbC4sJAhAsZ8RL8M1qz5Y0AXknmSpgiA@mail.gmail.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-2-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4eGqyNg98NgMIWqIGkGjJQ2qk2EHKAcFy7E8X1508QM=;
        b=iaVxRauKeR1gM1rAkx3zeAB8HiAmWmkBsLnQdnnkPbLO7kDw3/pngyRJxsiwNez1OJ
         Gnk8DCxaMTQgCVBmb66O3a9vkOgtWxfoq0wSSQwj9YnMdBVT2xUmOh61c5OghfncPRVE
         CYgl/tuAflwKIpcGSiv2ad5WlcF7r2mNfQscY5IYYULCiQcpuuRvMLwGtCbIyRxY46dL
         ViS+yGH+vKFn7FM2gZ/6bV23CPs9lxzJxFrMZw4rp1NW9Tnx5KWXHA1yoKxy+/SFMEg2
         1xZSomHqSKQ2A6J2dwPkfDjQBwlEKuSXucrkV2syL6F7LyQrnQr1GIjaiZweHTBEpnSj
         D9GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4eGqyNg98NgMIWqIGkGjJQ2qk2EHKAcFy7E8X1508QM=;
        b=MD0PSoQwqEN6THPJyxan+cNtyN45WriKuD0j9fhozm5Gs7e+FZh2BfwVAit5C/vY6y
         fKQUHe5iqlixdUk00QkcUO9aCO5PdbBOFHaDlp//91cEikJdZOgYWFszvlhA5c5oNn0D
         2aZBodIN04UuV6ynPHASZBnRVsv2U4+32CfKA=
In-Reply-To: <1464340402-2249-2-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

On 27 May 2016 at 03:13, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The current code only checks if the fdt subcommand is fdt addr by checking
> whether it starts with 'a'.
>
> Since this is a pretty widely used letter, narrow down that check a bit.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  cmd/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
