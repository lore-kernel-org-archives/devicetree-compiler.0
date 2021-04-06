From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] dtc: Update the build rule for pylibfdt
Date: Mon, 5 Apr 2021 21:34:13 -0700
Message-ID: <CAPnjgZ1_YY84U_1-cGHF_tMjwM79pJAUJdwttL5XLpXcB=fdKQ@mail.gmail.com>
References: <20210327222718.1721931-1-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:from:in-reply-to:references:date:message-id
         :subject:to:cc;
        bh=RPSY+I+tZOX0oeJi3EQhhkBoIQtAMvdjwgLNAGUp9PE=;
        b=auMk+6/S7n74GQaTV+0tNulcMmCE8Is+j9bpFxaCe/Cew4k6z3zOnUFF/GwuXF5hc4
         VlQ4YTduBYf5scDKUPnlOFCZfqrO6FMCeDXsxIjQPHxEE41+louRuDC2GupVCnLDHoTE
         3ZFklgYGBlkPMxkurvvXQDkVfWlMfzzFLABKo=
Sender: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20210327222718.1721931-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>

Some versions of make complain about using a grouped target without a
recipe:

.../pylibfdt/Makefile:36: *** grouped targets must provide a recipe.  Stop.

Fix this by adding a dummy recipe.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 scripts/dtc/pylibfdt/Makefile | 1 +
 1 file changed, 1 insertion(+)

Applied to u-boot-dm, thanks!
