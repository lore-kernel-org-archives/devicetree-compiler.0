From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] annotations: add --annotate-full option
Date: Tue, 9 Jan 2018 22:32:36 -0800
Message-ID: <e249131c-5a60-f17c-a0ad-3a9aa3db8570@gmail.com>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-6-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=jSOyaFhF7Nrpu1EZMC7NPoNouTrqNiQt/DlSmXKF1rg=;
        b=MLJcAHXPlgD1Qe8/twdl12b61oS/rti7rsfYOM3eLv0Aql/27FmRV9MiP2R4kbraIM
         Yb1oZFvdeMIHB+3e4Axfs9t+d/VxWVNxBVdxH0AUJcB9xgcWyLKxWkDnJPbTbc8iC4tG
         TmppRPaL80wnBx+gtB1r46AFfdwmQ7UdGCZGqi74xU8RcPRypEOJGDFadeP5sNNeX7mv
         kgtEowXdYtNluQN9oTwxiQ5ospfhvHyuAhZSpPG0yVRrFOHQTaxQ0SxddWnjtP6klpnG
         2C2UJyPYHPmwMSEF8NejL0hzPeRQfj10mKN3jG0mChJsU/Pk5h+W4p3xsJErXwwVTe92
         Go8Q==
In-Reply-To: <1515418607-26764-6-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 01/08/18 05:36, Julia Lawall wrote:
> With --annotate, one gets only short file names and line numbers.
> 
> With --annotate-full, one gets complete paths, starting and ending line
> numbers and starting and ending columns.
> 
> --annotate-full indicates no-file and no-line for things that are not
> connected to the source code (fixups, symbols, aliases, etc.).
> --annotate simply has nothing in those cases.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> ---
>  dtc.c        | 13 +++++++++----
>  dtc.h        |  1 +
>  srcpos.c     | 27 +++++++++++++++++++--------
>  srcpos.h     |  4 ++--
>  treesource.c | 48 ++++++++++++++++++++++++++++--------------------
>  5 files changed, 59 insertions(+), 34 deletions(-)
> 
> diff --git a/dtc.c b/dtc.c
> index 371d04c..24b58eb 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -35,7 +35,8 @@ int phandle_format = PHANDLE_EPAPR;	/* Use linux,phandle or phandle properties *
>  int generate_symbols;	/* enable symbols & fixup support */
>  int generate_fixups;		/* suppress generation of fixups on symbol support */
>  int auto_label_aliases;		/* auto generate labels -> aliases */
> -bool annotate = false; /* annotate .dts with input source location */
> +bool annotate = false;		/* annotate .dts with input source location */
> +bool annotate_full = false; /* annotate .dts with full input source location */
>  
>  static int is_power_of_2(int x)
>  {
> @@ -61,7 +62,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
>  
>  /* Usage related data. */
>  static const char usage_synopsis[] = "dtc [options] <input file>";
> -static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@Ahv";
> +static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@ATFhv";
>  static struct option const usage_long_opts[] = {
>  	{"quiet",            no_argument, NULL, 'q'},
>  	{"in-format",         a_argument, NULL, 'I'},
> @@ -82,9 +83,10 @@ static struct option const usage_long_opts[] = {
>  	{"error",             a_argument, NULL, 'E'},
>  	{"symbols",	     no_argument, NULL, '@'},
>  	{"auto-alias",       no_argument, NULL, 'A'},
> +	{"annotate",         no_argument, NULL, 'T'},
> +	{"annotate-full",    no_argument, NULL, 'F'},
>  	{"help",             no_argument, NULL, 'h'},
>  	{"version",          no_argument, NULL, 'v'},
> -	{"annotate",         no_argument, NULL, 'T'},
>  	{NULL,               no_argument, NULL, 0x0},
>  };
>  static const char * const usage_opts_help[] = {
> @@ -119,6 +121,7 @@ static const char * const usage_opts_help[] = {
>  	"\n\tPrint this help and exit",

I am getting a really weird result.  This patch fragment is clearly moving
the "annotate" and "annotate-full" lines to before the "help" line.  But
for some reason my version of patch is placing the "annotate" and
"annotate-full" lines after the "version" line.  So the patch tool seems
to be broken ?????


$ patch -v
GNU patch 2.7.1


-Frank
