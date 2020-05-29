From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/2] dtc: Improve checks for i2c reg properties
Date: Fri, 29 May 2020 16:33:30 -0600
Message-ID: <CAL_Jsq+1dtBtY0fd1XZ0BFqwzwz26WU3cVKwyR7H+MtxE+hJBA@mail.gmail.com>
References: <20200528085650.1417942-1-joel@jms.id.au>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590791622;
        bh=DZ1HDwCj+CJ7ngO6dIiPzILmvtMM8AsDswbq/ID7FzA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QYPOGsk3oeLV0aKww7opPiF8/10mcztg1cLICQxa916usvGPf06xrT+GqWFS/NBEM
         eb8r6RN34SzvpDPJm7vFSGJPJ/Vijhsujx04/Bdv083Nd5aWwvG5KlaFEfWe/QDnGQ
         boxpx5d0YP/XJAKDZRHKWdiLudWPg8EpHyf2RR2Y=
In-Reply-To: <20200528085650.1417942-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

On Thu, May 28, 2020 at 2:57 AM Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
>
> This is to fix a build warning in the Linux kernel caused by dtc
> incorrectly warning about I2C_OWN_SLAVE_ADDRESS.
>
> v3 fixes the 10 bit size check
> v2 contains a second patch to check for 10 bit vs 7 bit addresses.
>
> Joel Stanley (2):
>   checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
>   checks: Improve i2c reg property checking

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I'll sync the kernel copy when David applies.

Rob
