From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v2 8/9] cmd: fdt: add fdt overlay application subcommand
Date: Thu, 09 Jun 2016 20:45:35 -0700
Message-ID: <356d7b74b13a49ecbbf43aa51feba534@agner.ch>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-9-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464340402-2249-9-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim; t=1465530406; bh=XNC2TzwGB1aes4FRX9Uz9aWaodk8Xc9u8WL8EqRgAQ8=; h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID; b=pVj1288FYipRGpbBsuc9yvH5v8eIynp9iSkM1mbvxTwUF96Pz+n+Njml9f/tZryO8zW9pjS914brt/lAeimEXmD+HD3vsqmOXTFJQTJ1RORUEAUq5z7aCkGQgJ4VWcWOAQD7bgHoIAw6TrUadqr5Rfhf+vyjhTXVoCyXzpHrLiA=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org

On 2016-05-27 02:13, Maxime Ripard wrote:
> The device tree overlays are a good way to deal with user-modifyable
> boards or boards with some kind of an expansion mechanism where we can
> easily plug new board in (like the BBB or the raspberry pi).
> 
> However, so far, the usual mechanism to deal with it was to have in Linux
> some driver detecting the expansion boards plugged in and then request
> these overlays using the firmware interface.
> 
> That works in most cases, but in some cases, you might want to have the
> overlays applied before the userspace comes in. Either because the new
> board requires some kind of an early initialization, or because your root
> filesystem is accessed through that expansion board.
> 
> The easiest solution in such a case is to simply have the component before
> Linux applying that overlay, removing all these drawbacks.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  cmd/fdt.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

> 
> diff --git a/cmd/fdt.c b/cmd/fdt.c
> index 0f5923e75a41..6cbc9e525d6c 100644
> --- a/cmd/fdt.c
> +++ b/cmd/fdt.c
> @@ -639,6 +639,25 @@ static int do_fdt(cmd_tbl_t *cmdtp, int flag, int
> argc, char * const argv[])
>  #endif
>  
>  	}
> +	/* apply an overlay */
> +	else if (strncmp(argv[1], "ap", 2) == 0) {
> +		unsigned long addr;
> +		struct fdt_header *blob;
> +
> +		if (argc != 3)
> +			return CMD_RET_USAGE;
> +
> +		if (!working_fdt)
> +			return CMD_RET_FAILURE;
> +
> +		addr = simple_strtoul(argv[2], NULL, 16);
> +		blob = map_sysmem(addr, 0);
> +		if (!fdt_valid(&blob))
> +			return CMD_RET_FAILURE;
> +
> +		if (fdt_overlay_apply(working_fdt, blob))
> +			return CMD_RET_FAILURE;
> +	}
>  	/* resize the fdt */
>  	else if (strncmp(argv[1], "re", 2) == 0) {
>  		fdt_shrink_to_minimum(working_fdt);
> @@ -1025,6 +1044,7 @@ static int fdt_print(const char *pathp, char
> *prop, int depth)
>  #ifdef CONFIG_SYS_LONGHELP
>  static char fdt_help_text[] =
>  	"addr [-c]  <addr> [<length>]   - Set the [control] fdt location to <addr>\n"
> +	"fdt apply <addr>                    - Apply overlay to the DT\n"
>  #ifdef CONFIG_OF_BOARD_SETUP
>  	"fdt boardsetup                      - Do board-specific set up\n"
>  #endif
