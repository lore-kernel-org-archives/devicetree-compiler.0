From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: get_node_by_path bug
Date: Mon, 17 Apr 2017 15:42:22 -0500
Message-ID: <CAL_JsqJBJxp1ZsJbAD9o+fzCw5yYnj0XgeW-S=Gw-8R-6Fh6ag@mail.gmail.com>
References: <f62d5a85dc174f259429a00bd49c168f@exsvr1.ghs.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f62d5a85dc174f259429a00bd49c168f-xbOadlNgr96L7B8feK0ILA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Montague <tmontague-5j0BnJlmnLM@public.gmane.org>
Cc: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Fri, Apr 14, 2017 at 2:34 PM, Tim Montague <tmontague-5j0BnJlmnLM@public.gmane.org> wrote:
> Hello dtc developers,
>
> My apologies if this is the incorrect place for this, I'm new here.

It is the right place.

>
> With the following device tree, dtc fails to find the /foo/baz node:
> $ cat broken.dts
> /dts-v1/;
> / {
>     ref = <&{/foo/baz}>;
>     food {
>     };
>     foo {
>         baz {
>         };
>     };
> };
> $ dtc -I dts -O dtb -o broken.dtb broken.dts
> broken.dtb: ERROR (phandle_references): Reference to non-existent node or label "/foo/baz"
>
> ERROR: Input tree has errors, aborting (use -f to force output)
> $ dtc -v
> Version: DTC 1.4.4-g9067ee4b
>
> The issue is in get_node_by_path, where it recurses into a child node without properly checking that the path strings are equal. This change fixes the issue for me:
>
> diff --git a/livetree.c b/livetree.c
> index 3673de0..aecd278 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -478,7 +478,8 @@ struct node *get_node_by_path(struct node *tree, const char *path)
>         p = strchr(path, '/');
>
>         for_each_child(tree, child) {
> -               if (p && strneq(path, child->name, p-path))
> +               if (p && (strlen(child->name) == p-path) &&
> +                               strneq(path, child->name, p-path))
>                         return get_node_by_path(child, p+1);
>                 else if (!p && streq(path, child->name))
>                         return child;
>
> Let me know if there is a better place to submit bug reports, or if you need anything more from me.

Can you send a proper patch for David to apply. The change looks good to me.

Rob
