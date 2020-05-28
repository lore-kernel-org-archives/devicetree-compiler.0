From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 2/2] checks: Improve i2c reg property checking
Date: Thu, 28 May 2020 08:44:52 +0000
Message-ID: <CACPK8XeXt3fzrMiq4=+8k9+9t2am4k=YZLJ4FUYkn2k1=2AMsQ@mail.gmail.com>
References: <20200528072037.1402346-1-joel@jms.id.au> <20200528072037.1402346-3-joel@jms.id.au>
 <20200528183115.05b2519a@canb.auug.org.au>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZQcXBvkMwxE9iWumM/mUqdHHLaKvFZVd13/D5ygOhgs=;
        b=DYXl7VpDckkXySt6oIMOto7vbGkR/j9ZvZuaVoM5E30/q7xewNL00ENVJVete8+3vB
         XQuufPVh+h4SM3LX6Ie53tIL46EwxtUEOruqy7Qy0NpVdLeuE9UZgzTH0uMrO/j5cMRj
         pnTfzu78X29iv3qXom6T4Yu04Yfre4i8mnXm8=
In-Reply-To: <20200528183115.05b2519a-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

On Thu, 28 May 2020 at 08:31, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wrote:
>
> Hi Joel,
>
> On Thu, 28 May 2020 16:50:37 +0930 Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
> >
> >
> >  #define I2C_OWN_SLAVE_ADDRESS        (1 << 30)
> > +#define I2C_TEN_BIT_ADDRESS  (1 << 31)
> >
> >  static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node *node)
> >  {
> > @@ -1057,10 +1058,13 @@ static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node
> >               reg = fdt32_to_cpu(*(cells++));
> >               /* Ignore I2C_OWN_SLAVE_ADDRESS */
> >               reg &= ~I2C_OWN_SLAVE_ADDRESS;
> > -             if (reg > 0x3ff)
> > +
> > +             if ((reg & I2C_TEN_BIT_ADDRESS) && reg > 0x3ff)
>
> Shouldn't this be
>
>                 if ((reg & I2C_TEN_BIT_ADDRESS) && ((reg & ~I2C_TEN_BIT_ADDRESS) > 0x3ff))

Yes, good catch.

There are no device trees that set the I2C_TEN_BIT_ADDRESS flag in the
kernel, so it is untested.
