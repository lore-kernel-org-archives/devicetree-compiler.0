From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checks: fix handling of unresolved phandles for dts plugins
Date: Thu, 19 Oct 2017 11:18:26 -0500
Message-ID: <CANk1AXTmumWwbDTXSkY61VkaWjsZphSe4F36Y9hx6fW94Zd-Gw@mail.gmail.com>
References: <20171018212914.13703-1-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171018212914.13703-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Wed, Oct 18, 2017 at 4:29 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> In dts plugins, it is valid to have unresolved phandle values. The
> check_property_phandle_args and check_interrupts_property checks failed to
> account for this resulting in spurious warnings or asserts, respectively.
> Fix this by bailing from the checks if we're checking a dts plugin as
> there is no way to further validate the properties.
>
> Fixes: ee3d26f6960b ("checks: add interrupts property check")
> Fixes: b3bbac02d5e3 ("checks: add phandle with arg property checks")
> Reported-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Hi Rob,

Thanks for the fix!

Alan

>
> diff --git a/checks.c b/checks.c
> index 08a3a29edae3..e66138449886 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -988,6 +988,10 @@ static void check_property_phandle_args(struct check *c,
>                  * entries when each index position has a specific definition.
>                  */
>                 if (phandle == 0 || phandle == -1) {
> +                       /* Give up if this is an overlay with external references */
> +                       if (dti->dtsflags & DTSF_PLUGIN)
> +                               break;
> +
>                         cellsize = 0;
>                         continue;
>                 }
> @@ -1176,6 +1180,11 @@ static void check_interrupts_property(struct check *c,
>                 prop = get_property(parent, "interrupt-parent");
>                 if (prop) {
>                         phandle = propval_cell(prop);
> +                       /* Give up if this is an overlay with external references */
> +                       if ((phandle == 0 || phandle == -1) &&
> +                           (dti->dtsflags & DTSF_PLUGIN))
> +                                       return;
> +
>                         irq_node = get_node_by_phandle(root, phandle);
>                         if (!irq_node) {
>                                 FAIL(c, dti, "Bad interrupt-parent phandle for %s",
> --
> 2.11.0
>
