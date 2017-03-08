From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/5] tests: Make realloc_fdt() really allocate *fdt
Date: Wed, 8 Mar 2017 14:01:47 -0700
Message-ID: <CAPnjgZ0=jfYeYZSZUeQRf00wyHaQwDBRYvqAQqO6Bu0B2VA5NA@mail.gmail.com>
References: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org> <20170304132647.23286-3-nicolas.iooss_linux@m4x.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=3xhaX5EYMYE/RCoLfmQM0a+93Z+wFns8r2QKMJh7fZU=;
        b=U3WELXhC+I3mmRngTHKCX8DK4AuAcD5NCSbDu0MNLM9m0HvI3bqYuBhwOkGRA39UAJ
         QlalsbtiKapvZXYu8EUkIydiHi4/VZzBLFM5v43VfdyBg6qzSKYJoSBXHTx8nKAIa0Lx
         hD+JlCohaRRzpm63m3xuzQSQvUdDDlPory9fVI11MNDJzmcbk7jmPPOh4jhxw2V4WiPZ
         4keA75VT1nw77HT7GpxiWqWvgRnkCYZxT8gSXRj+rqV0tdKGgKQD9RRnLoSPxdfloomz
         cHsuoimxefxdseRUnziv7pqei14vo7i7BS6Mu/ERVXreaOQ6iBvBPWjE0zJmgkEb00z4
         mQKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=3xhaX5EYMYE/RCoLfmQM0a+93Z+wFns8r2QKMJh7fZU=;
        b=h+z1LOxOfb2ErgRxTMzqTjDfTjNaWrWk6aqTQ3FfLkhM/8hQonLrkfwNIn/MEep3ZE
         HG/8t4ziQTQdsX9oYBbM/HOZy0gK79GJ+0qEsHDZFJa0s9/hFeVuBPnBiSIlrBG2PCAb
         qo+IFgRSoZfVjRDoQovFu4/6U7b3GH3AC8gm8=
In-Reply-To: <20170304132647.23286-3-nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 4 March 2017 at 06:26, Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org> wrote:
> This bug has been found by using clang Static Analyzer: it reported that
> the value stored to fdt was never read.
>
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
> ---
>  tests/sw_tree1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I suggest changing the code in main() so it starts with a 0 size. Then
the test would catch this problem.

>
> diff --git a/tests/sw_tree1.c b/tests/sw_tree1.c
> index 6d4c53102967..4887dc3e1172 100644
> --- a/tests/sw_tree1.c
> +++ b/tests/sw_tree1.c
> @@ -42,14 +42,14 @@ static void realloc_fdt(void **fdt, size_t *size, bool created)
>         switch (alloc_mode) {
>         case FIXED:
>                 if (!(*fdt))
> -                       fdt = xmalloc(*size);
> +                       *fdt = xmalloc(*size);
>                 else
>                         FAIL("Ran out of space");
>                 return;
>
>         case RESIZE:
>                 if (!(*fdt)) {
> -                       fdt = xmalloc(SPACE);
> +                       *fdt = xmalloc(SPACE);
>                 } else if (*size < SPACE) {
>                         *size += 1;
>                         fdt_resize(*fdt, *fdt, *size);
> --
> 2.11.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
