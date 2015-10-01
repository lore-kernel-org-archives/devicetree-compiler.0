From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v5 0/2] dtc: dts source location annotation
Date: Wed, 30 Sep 2015 20:29:02 -0700
Message-ID: <560CA87E.1010103@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=2/iBXxjhL5k/Mwwx89J0Pg8YacyMkA1fkUJlJg3qmbQ=;
        b=zp4f49wcPAnRztm9AclEUSOXK2AZrpeMYRRhQLjfFylKgd7fYI/9s3EZLroBdUhUnx
         P2WbQPfr32s2mUWzCmOTVHVKG6+xNwZewx6YworKzVpsWESk63Ge0Luhzvba4Y7Wgcgp
         XSGzCPUeyJuVCnjvNtCQ1u0pQLiLkNs5S4T8kRG145+fnKK415GmI8wShhLqkPuk0quW
         qTrjlTYUeFsyPVMb8M1ZWHg5krLSRfYlzNTEjh4CoHXbGmtkq8QO1wcsmPrUG5cNO8A8
         io6spjL2jKpiFRqUre7bhmJ1xtCReCXisMBo28vQNT9weyQ7hQjOWpyrZfja7sxIP0wA
         4r7g==
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
Linux kernel source tree is:

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


Changes from v3:
  - Some extra calls to name_node() crept into dtc-parser.y.
    Remove them.
Changes from v2:
  - v3 was not published.
  - FINALLY removed the new structure "struct src".  Now using the
    existing structure "struct srcpos"
  - "make check" tests are not yet updated
  - Added new patch 1 to protect against a null pointer de-reference.
    (The function fixed is not currently used in this patch series,
    but one alternative implementation would use it.)
  - Properties that are generated internally are now reported as
    file "<no-file>" (instead of "__builtin__") to match other dtc
    messages.
  - Changed the short form of the --annotate flag to "-A".
  - The "make check" patch is not included since it is not updated.
  - The Linux kernel build changes patch is not included.  It was
    present only for the convenience of testers and is still
    available from v2.
