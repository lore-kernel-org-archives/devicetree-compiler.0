From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the aspeed tree
Date: Fri, 22 May 2020 10:15:58 +0200
Message-ID: <CAK8P3a323rPCDDws+us4UYo7ZO6XvkZ13hBChZ40_DwCxBZj_g@mail.gmail.com>
References: <20200507091008.1bd38185@canb.auug.org.au> <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
 <CACPK8XcUydETZvJEkWPvLnLXatAg3D-MfA1yeDzE0epc-hisJQ@mail.gmail.com>
 <CAL_JsqJWXH4JMZgRQa9r_aPLW6Muz6BRtf_NmeqJv21Aefji1A@mail.gmail.com>
 <CACPK8Xd4651vtBTbBoGk0G7daunmF2CCOsDZ-ceto7Yu6A5z5g@mail.gmail.com> <20200522101638.052bd0a2@canb.auug.org.au>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200522101638.052bd0a2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vkhemka@fb.com>, David Gibson <david@gibson.dropbear.id.au>

On Fri, May 22, 2020 at 2:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Wed, 20 May 2020 07:56:36 +0000 Joel Stanley <joel@jms.id.au> wrote:
> > On Mon, 11 May 2020 at 15:19, Rob Herring <robh+dt@kernel.org> wrote:
> > > On Wed, 6 May 2020 at 23:13, Joel Stanley <joel@jms.id.au> wrote:
> > > > > These are IPMB nodes with the SLAVE_ADDRESS bit set:
> > > > >
> > > > > +&i2c5 {
> > > > > +       //Host3 IPMB bus
> > > > > +       status = "okay";
> > > > > +       multi-master;
> > > > > +       ipmb5@10 {
> > > > > +               compatible = "ipmb-dev";
> > > > > +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> > > > > +               i2c-protocol;
> > > > > +       };
> > > > >
> > > > > This is a correct entry, so dtc should not warn about it.
> > > >
> > > > I sent a patch for dtc here:
> > > > https://lore.kernel.org/lkml/20200508063904.60162-1-joel@jms.id.au/
> > >
> > > Patches for dtc need to be against upstream dtc. There's already a
> > > similar patch posted for it which I commented on and never saw a
> > > respin.
> >
> > Can I suggest some instructions in scsripts/dtc explaining that you
> > don't take patches in the kernel tree for this code?
> >
> > I've sent the patch so it applies to the dtc tree. It would be good to
> > see that change propagate over to -next as others have reported this
> > warning.
>
> These warnings now appear in the arm-soc tree.

Right, I also saw them earlier.

Joel, have you sent your patch to David Gibson for integration into
upstream dtc?
I don't know who sent the other patch, but as long as one of them
gets merged, I'd hope we can pull that into kernel as well.

        Arnd
