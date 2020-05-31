From: Serge Semin <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>
Subject: Re: [PATCH v2] check: Add 10bit/slave i2c reg flags support
Date: Sun, 31 May 2020 22:07:04 +0300
Message-ID: <20200531190704.2kluwj3nipvdfccs@mobilestation>
References: <20200527122525.6929-1-Sergey.Semin@baikalelectronics.ru>
 <20200527141517.22677-1-Sergey.Semin@baikalelectronics.ru>
 <20200530093152.GA1038@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200530093152.GA1038@ninjato>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Malahov <Alexey.Malahov-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, Jarkko Nikula <jarkko.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sat, May 30, 2020 at 11:31:52AM +0200, Wolfram Sang wrote:
> 
> > +	addr = reg & 0x3FFFFFFFU;
> > +	snprintf(unit_addr, sizeof(unit_addr), "%x", addr);
> 
> Hmm, this hardcoded value will not work if we ever need to add another
> bit. I hope this will never happen, though.
> 
> > +		if ((reg & (1U << 31)) && addr > 0x3ff)
> 
> Same here with bit 31.

I'd be glad to use a macro or some helper here, but alas there is no
ready-to-use i2c-related one in the dtc code. See, there are hard-coded
literals in the PCI nodes checkers (check_pci_device_reg(),
check_pci_device_bus_num()) and the hard-coded literals've been in the
i2c-nodes checkers even before this patch.

> I haven't checked DTC but can't we import the
> header with the defines into the project? Or is this then a circular
> dependency?
> 

I guess importing header would be much better than the hard-coded values
currently used. What do the code maintainers say about that? Any idea how it
is supposed to be implemented?

-Sergey
