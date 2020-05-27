From: Serge Semin <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>
Subject: Re: [PATCH] check: Add 10bit/slave i2c reg flags support
Date: Wed, 27 May 2020 17:00:27 +0300
Message-ID: <20200527140027.elc4vkbrzjrq4gqh@mobilestation>
References: <20200527122525.6929-1-Sergey.Semin@baikalelectronics.ru>
 <20200527133656.GV1634618@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200527133656.GV1634618-XvqNBM/wLWRrdx17CPfAsdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Malahov <Alexey.Malahov-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jarkko Nikula <jarkko.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, May 27, 2020 at 04:36:56PM +0300, Andy Shevchenko wrote:
> On Wed, May 27, 2020 at 03:25:25PM +0300, Serge Semin wrote:
> > Recently the I2C-controllers slave interface support was added to the
> > kernel I2C subsystem. In this case Linux can be used as, for example,
> > a I2C EEPROM machine. See [1] for details. Other than instantiating
> > the EEPROM-slave device from user-space there is a way to declare the
> > device in dts. In this case firstly the I2C bus controller must support
> > the slave interface. Secondly I2C-slave sub-node of that controller
> > must have "reg"-property with flag I2C_OWN_SLAVE_ADDRESS set (flag is
> > declared in [2]). That flag is declared as (1 << 30), which when set
> > makes dtc unhappy about too big address set for a I2C-slave:
> > 
> > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> > Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
> > 
> > Similar problem would have happened if we had set the 10-bit address
> > flag I2C_TEN_BIT_ADDRESS in the "reg"-property.
> > 
> > In order to fix the problem we suggest to alter the I2C-bus reg-check
> > algorithm, so one would be aware of the upper bits set. Normally if no
> > flag specified, the 7-bit address is expected in the "reg"-property.
> > If I2C_TEN_BIT_ADDRESS is set, then the 10-bit address check will be
> > performed. The I2C_OWN_SLAVE_ADDRESS flag will be just ignored.
> > 
> > [1] kernel/Documentation/i2c/slave-interface.rst
> > [2] kernel/include/dt-bindings/i2c/i2c.h
> 
> ...
> 

> > +		addr = reg & 0x3FFFFFFFU;
> > +		if ((reg & (1 << 31)) && addr > 0x3ff)
> >  			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 10-bits, got \"0x%x\"",
> > -				  reg);
> > -
> > +				  addr);
> > +		else if (!(reg & (1 << 31)) && addr > 0x7f)
> > +			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 7-bits, got \"0x%x\"",
> > +				  addr);
> 
> 1 << 31 is UB.

Good point. Thanks.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
