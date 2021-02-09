From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checks: Error on node-name and property name being the same
Date: Tue, 9 Feb 2021 12:29:22 -0600
Message-ID: <CAL_JsqLafFu15gcaU=QmaUr0VaURmt+6iC2d9yJrd1EXKxhVZw@mail.gmail.com>
References: <20210209175059.60057-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612895380;
        bh=Dka52GafeRXRGQfWq4MpKz1kIpJyQ5G7Goehwd9HNNo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ixymajZ17GHcvB8i0Te3/lNm5hmIx2D+m1sooGgjQUDBDxHNofIEn0aNEPr8xUqkX
         Ku9QMe8KU0Ndrbg1K3OY/nyDSOX2Ks/uSwguVId1YcMrEhzcHe88yKjrxAjsofjefY
         93Nxt5QpeNSHE48iHJ1GT3j2rVmrhzr8qHNnvA4Xk2VZhsPdypblWqRAE01XyFAR0C
         saH+03o8fbYHiamYO6hIaDJphnBDV+93zN+Omg9wQimr86Jys+XpnH5N3DtFibC5xE
         BIGk5DtPyCC6hD+RLtxBg8dLDXJ/QQgXzqSkc2NjR4Z1u+7S9ppg+pd2La5/Nf7Axn
         PyAXUZUk/daOQ==
In-Reply-To: <20210209175059.60057-1-kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-5wv7dgnIgG8@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Tue, Feb 9, 2021 at 12:06 PM Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> Treat a node-name and property name at the same level of tree as
> an error.
>
> Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/checks.c b/checks.c
> index 17cb689..3f46043 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -330,6 +330,22 @@ static void check_node_name_format(struct check *c, struct dt_info *dti,
>  }
>  ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
>
> +static void check_node_name_vs_property_name(struct check *c,
> +                                            struct dt_info *dti,
> +                                            struct node *node)
> +{
> +       struct property *prop;
> +
> +       if (node->parent) {

To save some indentation:

if (!node->parent)
  return;

> +               for_each_property(node->parent, prop) {
> +                       if (strcmp(node->name, prop->name) == 0)

streq() is the dtc way.

> +                               FAIL(c, dti, node, "node name and property name conflict");
> +               }
> +       }
> +}
> +ERROR(node_name_vs_property_name, check_node_name_vs_property_name,
> +      NULL, &node_name_chars);
> +
>  static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
>                                       struct node *node)
>  {
> @@ -1796,7 +1812,7 @@ WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
>  static struct check *check_table[] = {
>         &duplicate_node_names, &duplicate_property_names,
>         &node_name_chars, &node_name_format, &property_name_chars,
> -       &name_is_string, &name_properties,
> +       &name_is_string, &name_properties, &node_name_vs_property_name,
>
>         &duplicate_label,
>
> --
> 2.29.2
>
