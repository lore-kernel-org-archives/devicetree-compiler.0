From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] check: Add 10bit/slave i2c reg flags support
Date: Mon, 1 Jun 2020 11:08:37 -0600
Message-ID: <CAL_JsqJeod3Rm4K_7c3AcH8A4aMKKmT97CcbGpRbG4b0yWzrXA@mail.gmail.com>
References: <20200527122525.6929-1-Sergey.Semin@baikalelectronics.ru>
 <20200527141517.22677-1-Sergey.Semin@baikalelectronics.ru> <20200530093152.GA1038@ninjato>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591031329;
        bh=U4zySYo9+Zn4LG0NqTAIuOjQNwa7638vn5i7EqhQmGc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ni6vAZlZT4tj1xl51yOTbBxf5AwGuYWF7t8Rps7Sqztp3gZOZLVqUOrKv5yhUVa5Y
         qZlEnxrRdplCiICKkBvni4EjL4RXM5OQlcSmYIewhdE3iN8gFnlE5AUnW1H5Ql4qMl
         2MSFYfDkprtS06cQXSsTxuHUJiK4fn6SU1enW+AI=
In-Reply-To: <20200530093152.GA1038@ninjato>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Serge Semin <fancer.lancer@gmail.com>, Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, May 30, 2020 at 3:32 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > +     addr = reg & 0x3FFFFFFFU;
> > +     snprintf(unit_addr, sizeof(unit_addr), "%x", addr);
>
> Hmm, this hardcoded value will not work if we ever need to add another
> bit. I hope this will never happen, though.

I had this concern and requested the first time this was submitted
(and abandoned) to just mask out the top byte. However, Joel's version
of this fix[1] does some actual checks on 10-bit addressing, so I've
dropped that request.

> > +             if ((reg & (1U << 31)) && addr > 0x3ff)
>
> Same here with bit 31. I haven't checked DTC but can't we import the
> header with the defines into the project? Or is this then a circular
> dependency?

Easier to just duplicate the define here which Joel's patches do.

Rob

[1] https://www.spinics.net/lists/devicetree-compiler/msg03196.html
