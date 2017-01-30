From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Warnings do include offending filename
Date: Mon, 30 Jan 2017 09:13:05 +0000
Message-ID: <1485767585.7612.23.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello,

I wasn't sure how/where to make a wishlist bug report, so I hope this
will suffice, am happy to be pointed in a different direction though.

I recently[0] stumbled over around 1,000 of these:
    Warning (unit_address_vs_reg): Node /soc has a reg or ranges property, but no unit name
    Warning (unit_address_vs_reg): Node /soc/main-oscillator has a reg or ranges property, but no unit name
    Warning (unit_address_vs_reg): Node /soc has a reg or ranges property, but no unit name
    Warning (unit_address_vs_reg): Node /soc has a reg or ranges property, but no unit name
    Warning (unit_address_vs_reg): Node /soc/main-oscillator has a reg or ranges property, but no unit name
    Warning (unit_address_vs_reg): Node /soc has a reg or ranges property, but no unit name
    Warning (unit_address_vs_reg): Node /soc/main-oscillator has a reg or ranges property, but no unit name

When building the split device tree repo[1] from the Linux source
(essential it's a build of every single dts in the kernel source).

The cause of the warning is an issue which needs to be fixed but I
thought I would mention that it would be very useful (I expect) if dtc
would include the offending file in warnings (like e.g. gcc would), not
just because of the number of *.dtb being built here but also due to
#include and /include/ of .dtsi files.

Thanks,
Ian.

[0] <1485765782.7612.21.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org> on devicetree@vger at
Mon, 30 Jan 2017 08:43:02 +0000, it still hasn't hit the archives it
seems.
[1] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/
