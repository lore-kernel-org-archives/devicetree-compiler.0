From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v6 0/2] dtc: dts source location annotation
Date: Fri, 02 Oct 2015 21:44:05 -0700
Message-ID: <560F5D15.9060606@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=QgZrlsmqV0pXF43NwTA+p76p2c5qlGMUN/oAYYS3DAc=;
        b=LdzpVHFcDBOeKopD8O0rJDGXxbp0CHqtDOnuUXkDTEO+f5bJ4RXSRE/eQj3Ha4VMkU
         IBAqNzuZYWlU9O9nFLzD2WE3eKyMFL8YeQEe+v0VQPsP82Ha0JGOBt/Ez66alsX2mIhQ
         x0R0ZT3tta8l0DcX5ULAuacuXZRK+qubVc7vWaS3p8UUOp/DteCa7UtXbggbuWonZP0e
         RwqibjjJO9TECO2sNHM7yHUtu0fNSFeyvDEzf9b+QWdbu+voxY9syP5LlfdE8wP7dk0Y
         Q8HVm+PrC/y4rSKNIjIwHlCpaUNz7R2YqqHw4bQ6wXSZ4YzjjFGgiO/s63J1rL8U5rmP
         fphg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Proof of concept patch.

Annotates input source file and line number of nodes and properties
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
Linux kernel source tree (hand edited to remove leading path
components) is:

  -----  long format  -----

  sdhci@f9824900 { /* qcom-apq8074-dragonboard.dts:14.3-18.5 */
        compatible = "qcom,sdhci-msm-v4"; /* qcom-msm8974.dtsi:240.4-37 */
        reg = <0xf9824900 0x11c 0xf9824000 0x800>; /* qcom-msm8974.dtsi:241.4-49 */
        reg-names = "hc_mem", "core_mem"; /* qcom-msm8974.dtsi:242.4-37 */
        interrupts = <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* qcom-msm8974.dtsi:243.4-38 */
        interrupt-names = "hc_irq", "pwr_irq"; /* qcom-msm8974.dtsi:244.4-42 */
        clocks = <0xd 0xd8 0xd 0xd7>; /* qcom-msm8974.dtsi:245.4-36 */
        clock-names = "core", "iface"; /* qcom-msm8974.dtsi:246.4-34 */
        status = "ok"; /* qcom-apq8074-dragonboard.dts:17.4-18 */
        bus-width = <0x8>; /* qcom-apq8074-dragonboard.dts:15.4-20 */
        non-removable; /* qcom-apq8074-dragonboard.dts:16.4-18 */
  }; /* qcom-apq8074-dragonboard.dts:14.3-18.5 */


  ----- short format  -----

  sdhci@f9824900 { /* qcom-apq8074-dragonboard.dts:14 */
        compatible = "qcom,sdhci-msm-v4"; /* qcom-msm8974.dtsi:240 */
        reg = <0xf9824900 0x11c 0xf9824000 0x800>; /* qcom-msm8974.dtsi:241 */
        reg-names = "hc_mem", "core_mem"; /* qcom-msm8974.dtsi:242 */
        interrupts = <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* qcom-msm8974.dtsi:243 */
        interrupt-names = "hc_irq", "pwr_irq"; /* qcom-msm8974.dtsi:244 */
        clocks = <0xd 0xd8 0xd 0xd7>; /* qcom-msm8974.dtsi:245 */
        clock-names = "core", "iface"; /* qcom-msm8974.dtsi:246 */
        status = "ok"; /* qcom-apq8074-dragonboard.dts:17 */
        bus-width = <0x8>; /* qcom-apq8074-dragonboard.dts:15 */
        non-removable; /* qcom-apq8074-dragonboard.dts:16 */
  }; /* qcom-apq8074-dragonboard.dts:18 */


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

  - Added new function srcpos_string_short() which is similar to
    srcpos_string() but limits the location information to one
    line number.  The fuller output of srcpos_string() adds noise
    to the annotation which (in my opinion) is not especially
    useful in this specific context.

    The one downside to this choice is that the column numbers for
    multiple properties on the same input line will not be reported.
    This is unlikely to be an issue unless a .dts contains all of
    the properties on a single line (which might be the case for
    a machine generated .dts).  I do not think that the extra
    noise for the common case justifies handling this case.

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


TODO:
  - Update "make check" tests to reflect review comments.
  - Test against a wider set of .dts files.  There are some rules
    that I did not test extensively (and some rules, such as delete
    that I did not test at all in this version).
  - Change the --annotate option to choose either long or short format.
  - Fix location for:  devicetree: '/' nodedef


Changes from v5:
  - Add more pointer checking to patch 1.
  - Change from two to one srcpos fields in struct node.  Move the
    logic to choose begin or end to the annotation print logic for
    the case of short location format.
  - Move the setting of srcpos back to name_node() and build_prop()
    instead of adding new functions to save that information.
  - Patch 2 reports the location in long format (beginning and end
    of the object).  Adding patch 3 changes for format to short (the
    current source line only).
