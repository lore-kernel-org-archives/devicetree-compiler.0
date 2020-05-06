From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: linux-next: build warning after merge of the aspeed tree
Date: Wed, 6 May 2020 23:13:47 +0000
Message-ID: <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
References: <20200507091008.1bd38185@canb.auug.org.au>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vh5sHkIk2ctB42dNaltmVdyOo6gu7M7B4FBlMbUP/78=;
        b=YZrb7LGmD+n+0wVJ2oxBjUDRo7Q+l5YL+EuBd+JHHr0T97aLS9wt1LuRXYAxG5hxrx
         91vy6KnrF5ec4Vh8kh7TdoG5yUcNScYVZoXLfmFCNv1OzNMhS5AfjcbZmnZqjlAQzsdQ
         9yWoSoV4QTqAiBHO25L9qlvP+8NmbNeyQYnts=
In-Reply-To: <20200507091008.1bd38185-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Manikandan Elumalai <manikandan.hcl.ers.epl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Vijay Khemka <vkhemka-b10kYP2dOMg@public.gmane.org>

Hi Rob,

On Wed, 6 May 2020 at 23:10, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wrote:
>
> Hi all,
>
> After merging the aspeed tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:

Thanks Stephen.

> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126.11-130.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10: I2C bus unit address format error, expected "40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:137.11-141.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10: I2C bus unit address format error, expected "40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:139.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:148.11-152.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10: I2C bus unit address format error, expected "40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:150.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:159.11-163.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10: I2C bus unit address format error, expected "40000010"
> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:161.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10:reg: I2C address must be less than 10-bits, got "0x40000010"

These are IPMB nodes with the SLAVE_ADDRESS bit set:

+&i2c5 {
+       //Host3 IPMB bus
+       status = "okay";
+       multi-master;
+       ipmb5@10 {
+               compatible = "ipmb-dev";
+               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+               i2c-protocol;
+       };

This is a correct entry, so dtc should not warn about it.

Cheers,

Joel

>
> Introduced by commit
>
>   266056d3c61d ("ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC")
>
> --
> Cheers,
> Stephen Rothwell
