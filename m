From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] checks: Improve i2c reg property checking
Date: Tue, 2 Jun 2020 11:28:05 +0300
Message-ID: <CAHp75VdkBbDhFSYQYxuej=XH1MYAq-p6AWZZRLpW_iKt9D31_w@mail.gmail.com>
References: <20200528085650.1417942-1-joel@jms.id.au> <20200528085650.1417942-3-joel@jms.id.au>
 <20200602080104.4vqobktck357j52v@mobilestation>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GmJnjfSc4JBo+pcTz02oCEU40mYDg3IUGWJSm6oIOSY=;
        b=CHvGvOzNEpuC5aopZ+9w47SY1ODLARyi1kPMyiV44kKQrQPgaNy+y/f/jccKQNzP6T
         JxT9hhqr3egPf86ZTMCIDoaFHd0wiXdMowqMfgdfd/ljrhxtStssCkYTC7p/ft219IJM
         75MTbE6040w9ApY/zUJjtTXvoAxFf01vfuu91tZSsmq+OUhO1bUfRiVDZgIrd5Uc7XIz
         GHtbNsC8PSk9HSO1NtOtzLk1PD5nuRTRUcSSrq6kdUWpL/2f8bevSSzkTJVfdSqq2LcJ
         VbbWdybSbnwLggmYwBnLrhNYUPzhL3+fy9yBd2GkP+ANz9+uWrpfJrr138q5IkMFMOeu
         OKHw==
In-Reply-To: <20200602080104.4vqobktck357j52v@mobilestation>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Serge Semin <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

On Tue, Jun 2, 2020 at 11:03 AM Serge Semin
<Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org> wrote:
> On Thu, May 28, 2020 at 06:26:50PM +0930, Joel Stanley wrote:

...

> > +#define I2C_TEN_BIT_ADDRESS  (1 << 31)
>
> As Andy neatly pointed out here:
> https://lore.kernel.org/lkml/20200527133656.GV1634618-XvqNBM/wLWRrdx17CPfAsdBPR1lH4CV8@public.gmane.org/
> (1 << 31) is UB.

Thanks, Serge. Yes, we have to use 1U in the definitions (for 31 is
necessary, for the rest is for the sake of consistency).

-- 
With Best Regards,
Andy Shevchenko
