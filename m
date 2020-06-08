From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/3] checks: Add interrupt provider test
Date: Mon, 8 Jun 2020 13:48:37 -0600
Message-ID: <CAL_JsqK4Lzdp7vO_dO-R42fuoY_8mpS0+W9enG9u9Sso0sFpzw@mail.gmail.com>
References: <20200602110419.22488-1-andre.przywara@arm.com> <20200602110419.22488-2-andre.przywara@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591645729;
        bh=1CaQ68bVQsH13ubKdyhl6gmvt4tAkYKAL3/J2y4N7mA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kmu+IWDY+j/xGNTfSjPNdNoe199Mq4AQaLIv1uKDtJO+ef9pKBCq25EBmB/+nOTm5
         1riDabRzsXgo/2VyAV+S7PHun34M/TKE9cPQXn9BpMiGn3xm+35wZaDGaAYcltZCTM
         ipzCz+0Zz8Xok/k4Tx786BPdx1giAb0KS8SHqmL0=
In-Reply-To: <20200602110419.22488-2-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Jun 2, 2020 at 5:05 AM Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
>
> An interrupt provider (an actual interrupt-controller node or an
> interrupt nexus) should have both #address-cells and #interrupt-cells
> properties explicitly defined.
>
> Add an extra test for this. We check for the #interrupt-cells property
> already, but this does not cover every controller so far, only those that
> get referenced by an interrupts property in some node. Also we miss
> interrupt nexus nodes.
>
> A missing #address-cells property is less critical, but creates
> ambiguities when used in interrupt-map properties, so warn about this as
> well now.
> This removes the now redundant warning in the existing interrupts test.
>
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  checks.c                           | 32 ++++++++++++++++++++++++++------
>  tests/bad-interrupt-controller.dts |  7 +++++++
>  tests/run_tests.sh                 |  1 +
>  3 files changed, 34 insertions(+), 6 deletions(-)
>  create mode 100644 tests/bad-interrupt-controller.dts
>
> diff --git a/checks.c b/checks.c
> index 4b3c486..23faca5 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1547,6 +1547,28 @@ static bool node_is_interrupt_provider(struct node *node)
>
>         return false;
>  }
> +
> +static void check_interrupt_provider(struct check *c,
> +                                    struct dt_info *dti,
> +                                    struct node *node)
> +{
> +       struct property *prop;
> +
> +       if (!node_is_interrupt_provider(node))
> +               return;
> +
> +       prop = get_property(node, "#interrupt-cells");
> +       if (!prop)
> +               FAIL(c, dti, node,
> +                    "Missing #interrupt-cells in interrupt provider");
> +
> +       prop = get_property(node, "#address-cells");
> +       if (!prop)
> +               FAIL(c, dti, node,
> +                    "Missing #address-cells in interrupt provider");

This is still not a separate test. We should be able to continue
checking for '#interrupt-cells' while turning the '#address-cells'
check on or off. IOW, we can't test for what the Linux kernel cares
about. Though if there's only a handful of warnings to fix, then it's
fine for me as-is.

Rob
