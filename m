From: Serge Semin <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>
Subject: Re: [PATCH v3 2/2] checks: Improve i2c reg property checking
Date: Tue, 2 Jun 2020 11:01:04 +0300
Message-ID: <20200602080104.4vqobktck357j52v@mobilestation>
References: <20200528085650.1417942-1-joel@jms.id.au>
 <20200528085650.1417942-3-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200528085650.1417942-3-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

On Thu, May 28, 2020 at 06:26:50PM +0930, Joel Stanley wrote:
> The i2c bindings in the kernel tree describe support for 10 bit
> addressing, which must be indicated with the I2C_TEN_BIT_ADDRESS flag.
> When this is set the address can be up to 10 bits. When it is not set
> the address is a maximum of 7 bits.
> 
> See Documentation/devicetree/bindings/i2c/i2c.txt.
> 
> Take into account this flag when checking the address is valid.
> 
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> ---
> v2: Mask reg when checking the 10-bit size
> ---
>  checks.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/checks.c b/checks.c
> index feb1721f2603..3fe979a63290 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1023,6 +1023,7 @@ static void check_i2c_bus_bridge(struct check *c, struct dt_info *dti, struct no
>  WARNING(i2c_bus_bridge, check_i2c_bus_bridge, NULL, &addr_size_cells);
>  
>  #define I2C_OWN_SLAVE_ADDRESS	(1 << 30)

> +#define I2C_TEN_BIT_ADDRESS	(1 << 31)

As Andy neatly pointed out here:
https://lore.kernel.org/lkml/20200527133656.GV1634618-XvqNBM/wLWRrdx17CPfAsdBPR1lH4CV8@public.gmane.org/
(1 << 31) is UB.

-Sergey

>  
>  static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node *node)
>  {
> @@ -1057,10 +1058,13 @@ static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node
>  		reg = fdt32_to_cpu(*(cells++));
>  		/* Ignore I2C_OWN_SLAVE_ADDRESS */
>  		reg &= ~I2C_OWN_SLAVE_ADDRESS;
> -		if (reg > 0x3ff)
> +
> +		if ((reg & I2C_TEN_BIT_ADDRESS) && ((reg & ~I2C_TEN_BIT_ADDRESS) > 0x3ff))
>  			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 10-bits, got \"0x%x\"",
>  				  reg);
> -
> +		else if (reg > 0x7f)
> +			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 7-bits, got \"0x%x\". Set I2C_TEN_BIT_ADDRESS for 10 bit addresses or fix the property",
> +				  reg);
>  	}
>  }
>  WARNING(i2c_bus_reg, check_i2c_bus_reg, NULL, &reg_format, &i2c_bus_bridge);
> -- 
> 2.26.2
> 
