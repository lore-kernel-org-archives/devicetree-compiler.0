From: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [U-Boot,v4,01/13] cmd: fdt: Narrow the check for fdt addr
Date: Tue, 16 Aug 2016 10:52:04 +0900
Message-ID: <cf8fe411-8503-78d3-1603-05f1bacd0eb1@samsung.com>
References: <20160705082646.25044-2-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20160705082646.25044-2-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Hi,

On 07/05/2016 05:26 PM, Maxime Ripard wrote:
> The current code only checks if the fdt subcommand is fdt addr by checking
> whether it starts with 'a'.
> 
> Since this is a pretty widely used letter, narrow down that check a bit.
> 
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

I don't know what these patchset were delegated to me..I think it's not my scope.
Simon is FDT maintainer..Could you check these patch-set?

Best Regards,
Jaehoon Chung

> ---
>  cmd/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/cmd/fdt.c b/cmd/fdt.c
> index 898217ffe5f8..0f5923e75a41 100644
> --- a/cmd/fdt.c
> +++ b/cmd/fdt.c
> @@ -87,7 +87,7 @@ static int do_fdt(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
>  	/*
>  	 * Set the address of the fdt
>  	 */
> -	if (argv[1][0] == 'a') {
> +	if (strncmp(argv[1], "ad", 2) == 0) {
>  		unsigned long addr;
>  		int control = 0;
>  		struct fdt_header *blob;
> 
