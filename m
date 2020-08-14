From: Adrian Fiergolski <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
Subject: error when compiling dts preprocessed with -g3
Date: Fri, 14 Aug 2020 20:13:22 +0200
Message-ID: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2@fastree3d.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=YWbb4mX9HAIUtzL7uWEw7PA7cu1Tj+qmoHkBYAcTp9Y=;
        b=r2QtKJr4/tIsc3lbHuaBFOagnvptbI/m8Ig7JbVuC7bDUa9UxZvaY94BJAf9mOmNan
         bHFc5ujK7T933XTSyV+678762CCN1pov+xAd7iOBgZjdiz2XsnSTpqZ9B5hl+QvHyDa7
         x43iRSD3utJ+1tbFnABA7ykrDEp+kYB3J97cixJGPN0n5r3FgQAvJFjGGoGyQ007KMLy
         xRjKn0mPdoa24kq3TXsAMvJ6lkYi6zMtNxZffahNA1nz+3vuG4ZAkfpwibOfTF1KWBPB
         INLHCuXoT7/QXEYAaUhugXCn10X2dmKzSXrz2ftQACqzVv2p3EmfDxjK+qdHrqrDho16
         95wQ==
Content-Language: en-GB
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

I am using yocto to build my custom distribution targetting arm64 on
Ubuntu 18.04.4.

I have an issue compiling dts which was preprocessed with gcc version
7.5.0 (I haven't tried other version) and '-g3' flag. The error message:

    ./scripts/dtc/dtc -O dtb -o
    arch/arm64/boot/dts/xilinx/zynqmp-falcon.dtb -b 0
    -i/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqm=
p/kernel-source/arch/arm64/boot/dts/xilinx/
    -i/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqm=
p/kernel-source/scripts/dtc/include-prefixes
    -Wno-unit_address_vs_reg -Wno-unit_address_format
    -Wno-avoid_unnecessary_addr_size -Wno-alias_paths
    -Wno-graph_child_address -Wno-simple_bus_reg
    -Wno-unique_unit_address -Wno-pci_device_reg=C2=A0 -d
    arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.d.dtc.tmp
    arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.dts.tmp

    Error: <built-in>:1.1-2 syntax error
    FATAL ERROR: Unable to parse input tree

The part of a preprocessed dts causing issue:

    # 1
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
    # 1
    "/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zynqmp-poky-l=
inux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/linux-falcon_zynqmp-standard-b=
uild//"
    # 1 "<built-in>"
    #define __STDC__ 1
    #define __ASSEMBLER__ 1
    #define __STDC_HOSTED__ 1
    # 1 "<command-line>"
    #define __DTS__ 1
    # 1
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
    # 11
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
    /dts-v1/;

    # 1
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
    1
    # 15
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
    # 1
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/scripts/dtc/include-prefixes/dt-bindings/power/xlnx-zynqmp-p=
ower.h"
    1

The full command preprocessing dts:

    gcc -O0 -g3 -fno-omit-frame-pointer
    -L/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zynqmp-poky-=
linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroot-native/usr/lib
    -L/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zynqmp-poky-=
linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroot-native/lib
    -Wl,--enable-new-dtags
    -Wl,-rpath-link,/home/afiergol/fastree/falcon/poky/build/tmp/work/falco=
n_zynqmp-poky-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroot-=
native/usr/lib
    -Wl,-rpath-link,/home/afiergol/fastree/falcon/poky/build/tmp/work/falco=
n_zynqmp-poky-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroot-=
native/lib
    -Wl,-rpath,/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zyn=
qmp-poky-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroot-nativ=
e/usr/lib
    -Wl,-rpath,/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zyn=
qmp-poky-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroot-nativ=
e/lib
    -Wl,-O1 -Wl,--allow-shlib-undefined
    -Wl,--dynamic-linker=3D/home/afiergol/fastree/falcon/poky/build/tmp/sys=
roots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
    -E $(dtc_cpp_flags) -x assembler-with-cpp -o
    arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.dts.tmp

Once the '-g3' flag is removed, the part of the preprocessed DTS looks
like this:

    # 1
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
    # 1 "<built-in>"
    # 1 "<command-line>"
    # 1
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
    # 11
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
    /dts-v1/;

    # 1
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
    1
    # 15
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
    # 1
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/scripts/dtc/include-prefixes/dt-bindings/power/xlnx-zynqmp-p=
ower.h"
    1
    # 16
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
    2
    # 1
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/scripts/dtc/include-prefixes/dt-bindings/reset/xlnx-zynqmp-r=
esets.h"
    1
    # 17
    "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynqmp=
/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
    2

And the device compiler succeeds.

Is it a known behaviour?

Regards,

Adrian


