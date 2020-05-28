From: Joel Stanley <joel@jms.id.au>
Subject: Re: linux-next: build warning after merge of the aspeed tree
Date: Thu, 28 May 2020 07:21:56 +0000
Message-ID: <CACPK8Xf=cH4JY6Jd0ep4-KKQLDuV30Z_NbvuO=op8xJ5NHHJkQ@mail.gmail.com>
References: <20200507091008.1bd38185@canb.auug.org.au> <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
 <CACPK8XcUydETZvJEkWPvLnLXatAg3D-MfA1yeDzE0epc-hisJQ@mail.gmail.com>
 <CAL_JsqJWXH4JMZgRQa9r_aPLW6Muz6BRtf_NmeqJv21Aefji1A@mail.gmail.com>
 <CACPK8Xd4651vtBTbBoGk0G7daunmF2CCOsDZ-ceto7Yu6A5z5g@mail.gmail.com>
 <20200522101638.052bd0a2@canb.auug.org.au> <CAK8P3a323rPCDDws+us4UYo7ZO6XvkZ13hBChZ40_DwCxBZj_g@mail.gmail.com>
 <CACPK8Xdm91DwuKcm_d9xh_+8gPzxWpWWAzJzq8pAFVc79x-q1A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n4tBqrHHH015OrQnVw44NXP8wN1moQE/VCGYfLYhYdM=;
        b=nDJk+/ilcTY5g3WooqU4ASS72DOIy/+CsGkeFXI6o5HqLogDfJueIM6ZQKHkg3Ojcl
         gnPnvgdOMCm9ixt3t4fHxUqqBNZo8GuaHbybuNVbJOh1huL0IKFtoVPt0NGFheVnskTM
         9K1gjCVQ5K9hg6BAy6DRt5824wcrgyrdWUeGA=
In-Reply-To: <CACPK8Xdm91DwuKcm_d9xh_+8gPzxWpWWAzJzq8pAFVc79x-q1A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vkhemka@fb.com>, David Gibson <david@gibson.dropbear.id.au>

On Thu, 28 May 2020 at 06:09, Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 22 May 2020 at 08:16, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, May 22, 2020 at 2:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > On Wed, 20 May 2020 07:56:36 +0000 Joel Stanley <joel@jms.id.au> wrote:
> > > > I've sent the patch so it applies to the dtc tree. It would be good to
> > > > see that change propagate over to -next as others have reported this
> > > > warning.
> > >
> > > These warnings now appear in the arm-soc tree.
> >
> > Right, I also saw them earlier.
> >
> > Joel, have you sent your patch to David Gibson for integration into
> > upstream dtc?
> > I don't know who sent the other patch, but as long as one of them
> > gets merged, I'd hope we can pull that into kernel as well.
>
> David asked for some extra features (and a typo fix) before he would
> merge it. I'll take a look at that now.

Here we go:

https://lore.kernel.org/lkml/20200528072037.1402346-1-joel@jms.id.au/
