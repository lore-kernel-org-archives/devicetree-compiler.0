From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 0/3] dtc: dts source location annotation
Date: Tue, 15 Sep 2015 21:08:21 -0700
Message-ID: <55F8EB35.5010601@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=uwgmhK5t8Z1Xh/yz66P5G2tcebg2+6NMXUj6vVspgDs=;
        b=V+iV+6XxiOAwOVZWngZpqAAH8VYKtHMHrs+IYRXqWsTkJro0b8daSkrOsS57NlIvBq
         Wb4xqktVtOxZzubOzazbkpgALyHjXOgNuN1POfeq7d5EC+Vw4KIkUfbYvKA9xawtyCDt
         umWqAZ6cTFol/bJQtWiWvhJPPB4HPtwUIEA/ntPIF20DUSa54N2TpY2XC0vP5HX+UUf6
         1iaAw8LUo/J2bV56SXxdCFk8SDOq1Sif7k5JNlnyYrNV4l1RhI7DGhk5HK/HF8/D/HgD
         hjSCwD+E0gnyEiP3DcYXlpmQS6eH0iBbGe5eaVGTjI9pr5DNE8hK+Oqn1T9wbul+T2YJ
         c1bw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

A common dts source file convention is for a system .dts file
to include default SOC and/or device .dtsi files and then add
additional system specific properties or over-ride property values
from the .dtsi files.  It can be a time consuming and error prone
exercise to determine exactly what nodes, properties, and property
values are in the final .dtb binary blob and where they originated.

The purpose of this proof of concept patch series is to modify
the dtc compiler to be able to create an output .dts with
annotations describing the source location of each node and
property that would exist in the .dtb if the .dts was compiled.

I am looking for feedback first on the concept, and secondly on
the implementation.  I am totally bison ignorant and will not
be offended if told that I took an entirely wrong approach to
implement the concept (although in that case pointers to a
more correct approach would be appreciated).

As an example, one device tree node for the dragonboard is:

 sdhci@f9824900 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:14 */
                        compatible = "qcom,sdhci-msm-v4"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:240 */
                        reg = <0xf9824900 0x11c 0xf9824000 0x800>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:241 */
                        reg-names = "hc_mem", "core_mem"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:242 */
                        interrupts = <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:243 */
                        interrupt-names = "hc_irq", "pwr_irq"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:244 */
                        clocks = <0xd 0xd8 0xd 0xd7>; /* arch/arm/boot/dts/qcom-msm8974.dtsi:245 */
                        clock-names = "core", "iface"; /* arch/arm/boot/dts/qcom-msm8974.dtsi:246 */
                        status = "ok"; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:17 */
                        bus-width = <0x8>; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:15 */
                        non-removable; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:16 */
                }; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:18 */


qcom-apq8074-dragonboard.dts:
   - last referenced the sdhci node
   - changed the value of the "status" property from "disabled" to "ok"
   - added two properties, "bus-width" and "non-removable"

qcom-msm8974.dtsi:
   - initially set the value the "status" property to "disabled"
     (not visible in the annotated .dts)
   - provided all of the other property values

I will provide the entire annotated .dts file that I extracted the
example node from as a reply to this email.

When the dtc compiler is run within the Linux kernel build system,
the path of the source files will be the full absolute path, just
as seen for gcc warnings and errors.  I always trim away the path
leading up to the Linux kernel source tree by passing the kernel
build output through a sed pipe.  I have done the same to the
annotated .dts file to remove the excessive verbosity in the
source paths.

The annotated .dts file can be created automatically in the Linux
kernel build directory as file .XXX.dtb.annotate.dts.tmp as a
by-product of building the dtb binary blob file XXX.dtb.  The patch
to the Linux kernel build system to enable this is the final patch
in the series.  That patch is not intended to be submitted to the
Linux kernel yet, but is included here to allow easier testing of
the other patches.  If you want to use that patch to build an
annotated .dts file then you will have to copy the updated version
of the dtc compiler into the kernel build directory at
scripts/dtc/dtc first.
