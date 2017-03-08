From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/5] libfdt: overlay: Check the value of the right variable
Date: Wed, 8 Mar 2017 14:01:44 -0700
Message-ID: <CAPnjgZ2Lon3e-NV-FH76QpXFP2tAcc=Ex48hG7OMQxbcjzBfig@mail.gmail.com>
References: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org> <20170304132647.23286-2-nicolas.iooss_linux@m4x.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=2lOPukRpDpIKbJ5imVCZoCxvUBhZm6HgnTgVWN2lwtc=;
        b=cmqlzMb+xEsWwaI156Vajp+4k281BG2ffgZ9Flw/J4bO9kZqdvueoxKTegFZK9A6iJ
         EdaaV2SVLCYbZX8T/6FHtyoVr8bnSc7AEwCeWNmHnquiscvhIlg4uU/rzWv6CpKbc0II
         /jU6vv9X2S1b7AXNkpOmDzLob3agAlkJntshrXNrba6ZnlqKs6ff+ZdaqXo8oG5OgfJ2
         h6pMrSkd1+0W1QOGF/O0OaApvEgAwdOYnGdwBF0DvJ5gJS3xi/IwrMQDA6nGikDOEiqQ
         4B3uGUuQLAYf2enaaOesM5oDBh/9i0VaTRb1he0NOT8v86iBgXsP8yFL9UI+y4Qnp64E
         esDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=2lOPukRpDpIKbJ5imVCZoCxvUBhZm6HgnTgVWN2lwtc=;
        b=Gzp6YtybT6bIH4me5jZaD1T/yw8jKAU6dTrvWzkHrzC3pYagwukk4N+8JsySzIbOs3
         88rW7D1FIKuxIsA44y+sO6/nbRkNwkzMT6g8PUP7yj1IPm/8he554rKkEefW3tOpiVKv
         wYiefIkPvawlVten+nUi56sYQRaOBkUY/zazY=
In-Reply-To: <20170304132647.23286-2-nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 4 March 2017 at 06:26, Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org> wrote:
> overlay_update_local_node_references() saves the result of
> fdt_subnode_offset() into variable tree_child but checks for variable
> ret afterwards. As this does not make sense, check tree_child instead of
> ret.
>
> This bug has been found by compiling with clang. The compiler reported
> the following warning:
>
>     libfdt/fdt_overlay.c:275:7: error: variable 'ret' may be
>     uninitialized when used here
>           [-Werror,-Wconditional-uninitialized]
>                     if (ret == -FDT_ERR_NOTFOUND)
>                         ^~~
>     libfdt/fdt_overlay.c:210:9: note: initialize the variable 'ret' to
>     silence this
>           warning
>             int ret;
>                    ^
>                     = 0
>
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
> ---
>  libfdt/fdt_overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This suggests we need a new test case.

>
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 56cb70ed4445..b2fb5d970ccc 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -272,7 +272,7 @@ static int overlay_update_local_node_references(void *fdto,
>
>                 tree_child = fdt_subnode_offset(fdto, tree_node,
>                                                 fixup_child_name);
> -               if (ret == -FDT_ERR_NOTFOUND)
> +               if (tree_child == -FDT_ERR_NOTFOUND)
>                         return -FDT_ERR_BADOVERLAY;
>                 if (tree_child < 0)
>                         return tree_child;
> --
> 2.11.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
