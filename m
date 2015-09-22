From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v2 0/3] dtc: dts source location annotation
Date: Mon, 21 Sep 2015 22:05:21 -0700
Message-ID: <5600E191.9020903@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=J2MhLQNPoyuzQhNYzskOBbutm1w6i6F1XByLRnGG2yg=;
        b=WRKxoOI0JviSQx/eWsiIsrFLr87m/Azh1JdcmAkvjbcVfzN5w9028jaROAZm4ywRod
         G7Gnk2K3U15eIR36tBx1O22NcOXm7BLTvN1UM3sJ0W51ljDcBBiq1Es9VMRRVZ+5Oh7B
         xsGWFvWI6x02kKGqPZfwfdUd0KiijhFFVj2jcnfSPa4mRQzjdH43qX9Za56Vn6Efq4f2
         soslXjZtDdSYm8RgAcXcpmLFR83yHJqHm7pGugYodw27MKWacVSUQa04+cx8Srq9HUvh
         7xNVKfs92LprkPr0ulPzDNmQ24zr71AOUsdYFaOGK2PJ6PXP64tUxa6va5tMS7n+Lgkd
         lZKA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Annotate input source file and line number of nodes and properties
as comments in output .dts file when --annotate flag is supplied.

A common dts source file convention is for a system .dts file
to include default SOC and/or device .dtsi files and then add
additional system specific properties or over-ride property values
from the .dtsi files.  It can be a time consuming and error prone
exercise to determine exactly what nodes, properties, and property
values are in the final .dtb binary blob and where they originated.

Modify the dtc compiler to read a (possibly cpp pre-processed) .dts
file and for the output .dts annotate each node and property with
the corresponding source location.

As an example, one device tree node for the dragonboard in the
Linux kernel source tree is:

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


When the dtc compiler is run within the Linux kernel build system,
the path of the source files will be the full absolute path, just
as seen for gcc warnings and errors.  I always trim away the path
leading up to the Linux kernel source tree by passing the kernel
build output through a sed pipe.  I have done the same to the
above example to remove the excessive verbosity in the source paths.

Implementation notes:

  - The source location of each node and property is saved in the
    respective node or property during the parse phase because
    the source location information from current_srcfile is no longer
    available when the final values are written out from dt_to_source()
    and the functions that it calls.

  - A check is added to dtc.c to ensure that input and output format
    are both device tree source.  An alternate choice would be to
    turn off the --annotate flag if either the input file or the
    output file is not device tree source.  In the alternate case,
    the disabling of --annotate could be silent or a warning could
    be issued.

Changes from v1:

  - Removed the new global stack that was used to track the location
    of the beginning of each node.  To replace this, added new token
    openbrace to get the source location of the opening brace of a
    node.
  - Various cleanups.
  - Add "make check" tests to verify that an annotated .dts can be stripped,
    and the result will be the same as if compiled without --annotate.

Version v2 still creates a new structure "struct src" instead of using
the existing "struct srcpos".  This is because, as far as I know, the
"struct srcpos" information in current_srcfile is not available at the
point where the new annotation is output.  If I am wrong, please give me
some hints.
