From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: linux-next: build warning after merge of the aspeed tree
Date: Thu, 28 May 2020 06:09:06 +0000
Message-ID: <CACPK8Xdm91DwuKcm_d9xh_+8gPzxWpWWAzJzq8pAFVc79x-q1A@mail.gmail.com>
References: <20200507091008.1bd38185@canb.auug.org.au> <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
 <CACPK8XcUydETZvJEkWPvLnLXatAg3D-MfA1yeDzE0epc-hisJQ@mail.gmail.com>
 <CAL_JsqJWXH4JMZgRQa9r_aPLW6Muz6BRtf_NmeqJv21Aefji1A@mail.gmail.com>
 <CACPK8Xd4651vtBTbBoGk0G7daunmF2CCOsDZ-ceto7Yu6A5z5g@mail.gmail.com>
 <20200522101638.052bd0a2@canb.auug.org.au> <CAK8P3a323rPCDDws+us4UYo7ZO6XvkZ13hBChZ40_DwCxBZj_g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AFkvUrZ53K38iM6K70Bw5BpYtWPs5fTKAiJKykq/90E=;
        b=EMACQIRRY/P23fjlJGO2UQeQf22ld2CCr6OmhYHqxzorlBalEfk3VGwP2VlKG0rhak
         K2zv43+W/YL2Ebniw7ttQmRfIOw5csqY/r/i5sosJfIPYe0sx7GjxlKU6Pn4Ujjg0R9i
         AEGOQRlJAh32jxh6ElxMREnz1Yu/6raWjNA7A=
In-Reply-To: <CAK8P3a323rPCDDws+us4UYo7ZO6XvkZ13hBChZ40_DwCxBZj_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Manikandan Elumalai <manikandan.hcl.ers.epl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Vijay Khemka <vkhemka-b10kYP2dOMg@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Fri, 22 May 2020 at 08:16, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>
> On Fri, May 22, 2020 at 2:16 AM Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wrote:
> > On Wed, 20 May 2020 07:56:36 +0000 Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
> > > I've sent the patch so it applies to the dtc tree. It would be good to
> > > see that change propagate over to -next as others have reported this
> > > warning.
> >
> > These warnings now appear in the arm-soc tree.
>
> Right, I also saw them earlier.
>
> Joel, have you sent your patch to David Gibson for integration into
> upstream dtc?
> I don't know who sent the other patch, but as long as one of them
> gets merged, I'd hope we can pull that into kernel as well.

David asked for some extra features (and a typo fix) before he would
merge it. I'll take a look at that now.

The patch is 20200520075134.1048589-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org on
devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, which doesn't appear to be
archived on lore.
