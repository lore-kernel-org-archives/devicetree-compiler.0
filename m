From: Joel Stanley <joel@jms.id.au>
Subject: Re: linux-next: build warning after merge of the aspeed tree
Date: Fri, 8 May 2020 06:40:31 +0000
Message-ID: <CACPK8XcUydETZvJEkWPvLnLXatAg3D-MfA1yeDzE0epc-hisJQ@mail.gmail.com>
References: <20200507091008.1bd38185@canb.auug.org.au> <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jrb5SpxBpfxnJarYhbVR8JuF3xmhz+iatL9rlTHsEyY=;
        b=Foo79FwS3ejJHJvHDvjZDXSJfa/QxQXrU0lzOnmBQ9WcsEwGV0ll49OPXx0ySElUd/
         Vjc3F0YYJ7a4sgcg2y/Ny/Mz+A81AMCIpV5kcql4HDcGNqFVf8hJg7DQpuz8DrMN/5JF
         jAlfdNkr4BgDV/HIDfkeoBKHpBGf607JsE6hA=
In-Reply-To: <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, devicetree-compiler@vger.kernel.org
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vkhemka@fb.com>

On Wed, 6 May 2020 at 23:13, Joel Stanley <joel@jms.id.au> wrote:
>
> Hi Rob,
>
> On Wed, 6 May 2020 at 23:10, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the aspeed tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
>
> Thanks Stephen.
>
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126.11-130.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10: I2C bus unit address format error, expected "40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:137.11-141.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10: I2C bus unit address format error, expected "40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:139.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:148.11-152.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10: I2C bus unit address format error, expected "40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:150.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10:reg: I2C address must be less than 10-bits, got "0x40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:159.11-163.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10: I2C bus unit address format error, expected "40000010"
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:161.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10:reg: I2C address must be less than 10-bits, got "0x40000010"
>
> These are IPMB nodes with the SLAVE_ADDRESS bit set:
>
> +&i2c5 {
> +       //Host3 IPMB bus
> +       status = "okay";
> +       multi-master;
> +       ipmb5@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
>
> This is a correct entry, so dtc should not warn about it.

I sent a patch for dtc here:
https://lore.kernel.org/lkml/20200508063904.60162-1-joel@jms.id.au/

Cheers,

Joel
