From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checks: Suppress warnings on overlay fragments
Date: Wed, 1 Feb 2023 14:29:47 -0600
Message-ID: <CAL_JsqJMtHivS1Tu2nJHytpkeW0qwmhVhhZvHwHQ0ZgHus8xxQ@mail.gmail.com>
References: <20230111023417.24141-1-qun-wei.lin@mediatek.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675283399;
        bh=o9k3F0y3Hy6lRDPoFKW50C1UG4bmwumohS+PCNxNMug=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HSkr9bjPmVJ4DQmOXNaxJGg7tGdUvwiRqQbkufRcA1if8A+kG3WVmrYcxnpcoNoi6
         t7iIdUYrwdGJ5yFBUJuwswA0f8shV0+QA9TqEbgU9UUUHhXPEpMPyPeCzBTnjzSej4
         3Pj7OWmkTkf/oE0tjHVnTClMInprxhj9l6Cpo2Hf4AuhvGIHKdVo/7joasGGF5thay
         mweHVzansnWVOF9ySjY0Dmf9/OQ1T0+nudcclGhKjE7i2vA8lVnb/w4347odPs2Q5U
         Pnga30ZpPCsm81K0eiPWMZadDNphGyBzWDwwHPe15J81GeE/bcjduBsNoWDEljrwWO
         n2apq944evA6w==
In-Reply-To: <20230111023417.24141-1-qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, casper.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chinwen.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kuan-ying.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ivan.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ladon.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org

On Tue, Jan 10, 2023 at 8:35 PM Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> The overlay fragment is a speial case where some properties are not

special

> present in the overlay source file, but in the base file.
>
> example:
> +-----------------------------+--------------------+
> | base.dts                    | overlay.dts        |
> +-----------------------------+--------------------+
> | /dts-v1/;                   | /dts-v1/;          |
> |                             | /plugin/;          |
> | /{                          |                    |
> |   parent: test {            | &parent {          |
> |     #address-cells = <1>;   |   child@0 {        |
> |     #size-cells = <0>;      |     reg = <0x0>;   |
> |   };                        |   };               |
> | };                          | };                 |
> +-----------------------------+--------------------+
>
> It will cause the following false alarms when compiling the overlay dts.
>
> 1. /fragment@0/__overlay__: Character '_' not recommended in node name
> 2. /fragment@0/__overlay__: Relying on default #address-cells value
> 3. /fragment@0/__overlay__: Relying on default #size-cells value
> 4. /fragment@0/__overlay__:reg: property has invalid length (4 bytes)
>    (#address-cells == 2, #size-cells == 1)
>
> This workaround will fix them by skip checking for node named __overlay__.
>
> Signed-off-by: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  checks.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/checks.c b/checks.c
> index 9f31d26..afa8f23 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -325,6 +325,9 @@ static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
>  {
>         int n = strspn(node->name, c->data);
>
> +       if (streq(node->name, "__overlay__"))

Do we hit the same thing with __fixups__ or __local_fixups__? If so,
just skip anything starting with "__".

> +               return;
> +
>         if (n < node->basenamelen)
>                 FAIL(c, dti, node, "Character '%c' not recommended in node name",
>                      node->name[n]);
> @@ -767,6 +770,9 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
>                 return;
>         }
>
> +       if (streq(node->parent->name, "__overlay__"))

Move this to a helper: is_overlay_node(node->parent)

> +               return;
> +
>         if (prop->val.len == 0)
>                 FAIL_PROP(c, dti, node, prop, "property is empty");
>
> @@ -1197,6 +1203,10 @@ static void check_avoid_default_addr_size(struct check *c, struct dt_info *dti,
>         if (!node->parent)
>                 return; /* Ignore root node */
>
> +

Extra blank line.

> +       if (streq(node->parent->name, "__overlay__"))
> +               return;
> +
>         reg = get_property(node, "reg");
>         ranges = get_property(node, "ranges");
>
> --
> 2.18.0
>
