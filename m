From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checks: add graph binding checks
Date: Tue, 12 Dec 2017 18:46:58 -0600
Message-ID: <CAL_JsqLfpqp=XrKWymYUfBVaLXZEjaFh=u4_j54fz3vZBbN4fA@mail.gmail.com>
References: <20171212155900.32311-1-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212155900.32311-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Dec 12, 2017 at 9:59 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> Add checks for DT graph bindings. These checks check node names,
> unit-addresses and link connections on ports, port, and endpoint nodes.
>
> The graph nodes are matched by finding nodes named 'endpoint' or with a
> 'remote-endpoint' property. We can't match on 'ports' or 'port' nodes
> because those names are used for non-graph nodes. While the graph nodes
> aren't really buses, using the bus pointer to tag matched nodes is
> convenient.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)

[...]

> +static void check_graph_port(struct check *c, struct dt_info *dti,
> +                            struct node *node)
> +{
> +       struct property *prop;

Missed dropping this before sending.

> +
> +       if (node->bus != &graph_port_bus)
> +               return;
> +
> +       if (!strprefixeq(node->name, node->basenamelen, "port"))
> +               FAIL(c, dti, "graph port node '%s' name should be 'port'",
> +                    node->fullpath);
> +
> +       check_graph_reg(c, dti, node);
> +}
> +WARNING(graph_port, check_graph_port, NULL, &graph_nodes);
