From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/1] fdtdump.c: provide colored output
Date: Mon, 26 Dec 2016 18:24:15 +1300
Message-ID: <CAPnjgZ1SBwL+T7xwW+O-a9-zUZtc7NN3nzjw4jy4BTHV+1sSjw@mail.gmail.com>
References: <20161221215431.16862-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=oG9g/guxCn0m9wGSRX2Vd83vAm9ekwOllwu0QGAPdgc=;
        b=MEzFhohWUc1hjeWEaYo8Zr3R8qgJ/Gi8e3z5gwOsEfm3IHVEUsxtnIXDVY6fRrDamC
         YW7UpXhJKNbJ/oTNis21fRqXBmPGeSNAA548kS7TOzRP9rv391rG7ecGs3czm6Zhv/7C
         unA4Q+fhcoOX3ZBqAouICEZkcrW9WYGj13T9xyUDPVLQDLufyWE4+6bEm8uPkY4+vGJB
         vXMGlKgy8apJaS2wROV5iuxy07kAaVWPFeYiz/r+NWdrdiYAnA4BrOx940uBr/pNwyoZ
         iDFI5Xqy1/mkJePv+dDRKHWTbbARR/n5wdvSVAbd/Wd/0acCsZtQbg/hesx6ucdny7uc
         MoVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=oG9g/guxCn0m9wGSRX2Vd83vAm9ekwOllwu0QGAPdgc=;
        b=StPXHbFPhAZCRIJM9G1azvWBaBN7tegSsoJMePRECbEVGvbifcaLv8GoxJJapiwmKM
         5E7cAsVU/JIv7OTOVot0LqK/XK+2VV/w6mj3BPNKlxs0jVPwaCv3pgstv0rCnC8KrPA2
         WHuF6c21Xc/+HMnYutWqV3e53Xg68tD2uSeqw=
In-Reply-To: <20161221215431.16862-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Heinrich,

On 22 December 2016 at 10:54, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> A new command line option is added
>   -c, --color <arg> Colorize, argument can be auto, never or always
> which defaults to auto.
>
> For colored output in pipes use 'always', e.g.
>   fdtdump -c always file.dtb | less -R
>
> If you don't like colors use
> alias fdtdump="fdtdump -c none"
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  Makefile  |  2 +-
>  fdtdump.c | 37 +++++++++++++++++++++++++++++++++----
>  util.c    | 12 +++++++-----
>  util.h    |  8 ++++++++
>  4 files changed, 49 insertions(+), 10 deletions(-)
>

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

But please see below.

> diff --git a/Makefile b/Makefile
> index 32dcfcf..ee543b9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =
>  CPPFLAGS = -I libfdt -I .
>  WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
>         -Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
> -CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
> +CFLAGS = -g -Os -fPIC -Werror $(WARNINGS) -lncurses
>
>  BISON = bison
>  LEX = flex
> diff --git a/fdtdump.c b/fdtdump.c
> index 717fef5..59194cd 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -2,6 +2,9 @@
>   * fdtdump.c - Contributed by Pantelis Antoniou <pantelis.antoniou AT gmail.com>
>   */
>
> +#include <unistd.h>
> +#include <curses.h>
> +#include <term.h>
>  #include <stdbool.h>
>  #include <stdint.h>
>  #include <stdio.h>
> @@ -63,7 +66,7 @@ static void dump_blob(void *blob, bool debug)
>         depth = 0;
>         shift = 4;
>
> -       printf("/dts-v1/;\n");
> +       printf("%s/dts-v1/;\n", COLNONE);
>         printf("// magic:\t\t0x%x\n", fdt32_to_cpu(bph->magic));
>         printf("// totalsize:\t\t0x%x (%d)\n", totalsize, totalsize);
>         printf("// off_dt_struct:\t0x%x\n", off_dt);
> @@ -104,10 +107,11 @@ static void dump_blob(void *blob, bool debug)
>                         s = p;
>                         p = PALIGN(p + strlen(s) + 1, 4);
>
> +                       printf("%s", COLNODE);

Another option would be to make COLNODE a function that returns either
"" or an ANSI string, depending on the setting of 'colored'. Then you
can avoid the global variable.

E.g.:

char str[ANSI_LEN];

                      printf("%s", get_ansi(str, COL_NODE));

>                         if (*s == '\0')
>                                 s = "/";
>

Regards,
Simon
