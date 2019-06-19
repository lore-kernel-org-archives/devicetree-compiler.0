From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: SPDX conversion under scripts/dtc/ of Linux Kernel
Date: Wed, 19 Jun 2019 14:59:48 +0200
Message-ID: <20190619125948.GA27090@kroah.com>
References: <CAK7LNARHHXv5Tu4BHN1avKOExS6HmPfd2c0ELZiQaxtmETOsDw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560949191;
        bh=lExPXXI3rTL+3XGQzahMDAHFeeLapk/EQ7ah0G0ClWk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ywKv2dLRCVzhjsb7smAKa+I6bkRaz89pB3DygNdRe+chU8GP0aNazw0Kz7VMdN5hE
         q9mopAsGfGh1t1AzCFBh6wtkZ4Sib2h21sHC1GvmYqLjuXQPOByz1VuTWL2aJjfLy9
         u28H2MW8XJ6DAZd3yUHWcKZxruYwkCSQuk0Vft4M=
Content-Disposition: inline
In-Reply-To: <CAK7LNARHHXv5Tu4BHN1avKOExS6HmPfd2c0ELZiQaxtmETOsDw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh+dt@kernel.org>, linux-spdx@vger.kernel.org, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>

On Wed, Jun 19, 2019 at 07:23:19PM +0900, Masahiro Yamada wrote:
> Hi.
> 
> In this development cycle of Linux kernel,
> lots of files were converted to use SPDX
> instead of the license boilerplate.
> 
> However.
> 
> Some files were imported from a different project,
> and are periodically synchronized with the upstream.
> Have we discussed what to do about this case?
> 
> 
> For example, scripts/dtc/ is the case.
> 
> The files in scripts/dtc/ are synced with the upstream
> device tree compiler.
> 
> Rob Herring periodically runs scripts/dtc/update-dtc-source.sh
> to import outcome from the upstream.
> 
> 
> The upstream DTC has not adopted SPDX yet.
> 
> Some files in Linux (e.g. scripts/dtc/dtc.c)
> have been converted to SPDX.
> 
> So, they are out of sync now.
> 
> The license boilerplate will come back
> when Rob runs scripts/dtc/update-dtc-source.sh
> next time.
> 
> What shall we do?
> 
> [1] Convert upstream DTC to SPDX
> 
> This will be a happy solution if it is acceptable in DTC.
> Since we cannot push the decision of the kernel to a different
> project, this is totally up to David Gibson.

That's fine with me :)

> [2] Change scripts/dtc/update-dtc-source.sh to
>     take care of the license block somehow

That would also be good.

> [3] Go back to license boilerplate, and keep the files
>     synced with the upstream
>     (and scripts/dtc/ should be excluded from the
>      SPDX conversion tool.)

nothing is being excluded from the SPDX conversions, sorry.  The goal is
to do this for every file in the kernel tree.  Otherwise it's pointless.

> Or, what else?

Rob remembers to keep those first lines of the files intact when doing
the next sync?

thanks,

greg k-h
