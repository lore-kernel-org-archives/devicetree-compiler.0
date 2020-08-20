From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: error when compiling dts preprocessed with -g3
Date: Thu, 20 Aug 2020 20:27:34 +1000
Message-ID: <20200820102734.GR271315@yekko.fritz.box>
References: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2@fastree3d.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="K3vkeaB0MlFjg8U+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1597922568;
        bh=PJgj7DLBRyACcS6gJBlnIix99vxVE8r9wYYk7cfR3Og=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p/2gCiZSdTfo8SWLkkOHrM9Q7upTYlcLpSvbqGyuSzVmPH8HirTVnwo6xHpbhzNHm
         4RDfK0dXNHcqxKZSnAIukq8Q3rvfnGkfKGhRjvjDvT18vl7dVX+TaRNIYNhdy2k7uu
         4OTkgYvdeakRNvFn1IHrm5Osb/QtWjpMgiEgu7KU=
Content-Disposition: inline
In-Reply-To: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Adrian Fiergolski <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--K3vkeaB0MlFjg8U+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 08:13:22PM +0200, Adrian Fiergolski wrote:
> Hi,
>=20
> I am using yocto to build my custom distribution targetting arm64 on
> Ubuntu 18.04.4.
>=20
> I have an issue compiling dts which was preprocessed with gcc version
> 7.5.0 (I haven't tried other version) and '-g3' flag. The error message:

Huh.  It's surprising to me that -g options affect the preprocessor
behavior at all.

>     ./scripts/dtc/dtc -O dtb -o
>     arch/arm64/boot/dts/xilinx/zynqmp-falcon.dtb -b 0
>     -i/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zyn=
qmp/kernel-source/arch/arm64/boot/dts/xilinx/
>     -i/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zyn=
qmp/kernel-source/scripts/dtc/include-prefixes
>     -Wno-unit_address_vs_reg -Wno-unit_address_format
>     -Wno-avoid_unnecessary_addr_size -Wno-alias_paths
>     -Wno-graph_child_address -Wno-simple_bus_reg
>     -Wno-unique_unit_address -Wno-pci_device_reg=A0 -d
>     arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.d.dtc.tmp
>     arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.dts.tmp
>=20
>     Error: <built-in>:1.1-2 syntax error
>     FATAL ERROR: Unable to parse input tree
>=20
> The part of a preprocessed dts causing issue:
>=20
>     # 1
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
>     # 1
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zynqmp-poky=
-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/linux-falcon_zynqmp-standard=
-build//"
>     # 1 "<built-in>"
>     #define __STDC__ 1

If it's preprocessed already, why does it still have #defines?

This is the cause of the problem - the dtc lexer can hande the lines
in the preprocessor output with file/linue number information, but it
doesn't expect there to be remaining preprocessor directives.

>     #define __ASSEMBLER__ 1
>     #define __STDC_HOSTED__ 1
>     # 1 "<command-line>"
>     #define __DTS__ 1
>     # 1
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
>     # 11
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
>     /dts-v1/;
>=20
>     # 1
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
>     1
>     # 15
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
>     # 1
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/scripts/dtc/include-prefixes/dt-bindings/power/xlnx-zynqmp=
-power.h"
>     1
>=20
> The full command preprocessing dts:
>=20
>     gcc -O0 -g3 -fno-omit-frame-pointer
>     -L/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zynqmp-pok=
y-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroot-native/usr/l=
ib
>     -L/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zynqmp-pok=
y-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroot-native/lib
>     -Wl,--enable-new-dtags
>     -Wl,-rpath-link,/home/afiergol/fastree/falcon/poky/build/tmp/work/fal=
con_zynqmp-poky-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroo=
t-native/usr/lib
>     -Wl,-rpath-link,/home/afiergol/fastree/falcon/poky/build/tmp/work/fal=
con_zynqmp-poky-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroo=
t-native/lib
>     -Wl,-rpath,/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_z=
ynqmp-poky-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroot-nat=
ive/usr/lib
>     -Wl,-rpath,/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_z=
ynqmp-poky-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/recipe-sysroot-nat=
ive/lib
>     -Wl,-O1 -Wl,--allow-shlib-undefined
>     -Wl,--dynamic-linker=3D/home/afiergol/fastree/falcon/poky/build/tmp/s=
ysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
>     -E $(dtc_cpp_flags) -x assembler-with-cpp -o
>     arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.dts.tmp
>=20
> Once the '-g3' flag is removed, the part of the preprocessed DTS looks
> like this:
>=20
>     # 1
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
>     # 1 "<built-in>"
>     # 1 "<command-line>"
>     # 1
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
>     # 11
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
>     /dts-v1/;
>=20
>     # 1
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
>     1
>     # 15
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
>     # 1
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/scripts/dtc/include-prefixes/dt-bindings/power/xlnx-zynqmp=
-power.h"
>     1
>     # 16
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
>     2
>     # 1
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/scripts/dtc/include-prefixes/dt-bindings/reset/xlnx-zynqmp=
-resets.h"
>     1
>     # 17
>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-zynq=
mp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp.dtsi"
>     2
>=20
> And the device compiler succeeds.
>=20
> Is it a known behaviour?

Not to me.  I don't think I've ever tried using -g3.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--K3vkeaB0MlFjg8U+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8+UBUACgkQbDjKyiDZ
s5LXhA//UE3Vu+W/IkRWlrfcQxw5RJM/QAwT8zTYwNhF9sIIwAukYOF8u3tPbGua
UO93MGRBeLlrmZR2BuzWKqLiXWR83QgG9ls2RuziaEdppmJ6H7UerLyNMBn2elEl
8JHIbi5SQOoQSHDKT5talEZbkrXlIhz3zqm1YYGnrZss60eHr4+fDvk0YaGdzh6g
tUgtjBzxp3dV/AqQO+TRVaGTkWmY9wz1s3kQXDq0cHPXAS1EeYvNuXaHCwmX9dkF
GQGFw66wbqahlzAkqEtIUfdMXRBu2ZPYLtas4JE8DnX3uElAW8sh6ZYq16LTx9o5
Ob/rjFg7NG+8nc6jm7RMC/6iHdOY0vIGoL7Z5P8GnQy7cGkr8K0xGg6vclpxzZpH
TQBP9IHs9hjaItEhGCbv3qxguDQM0RhTfG1OSeS1Pitb9Uu5OtqhiWey+/fycri5
bx4VdDBSH9l5BOMOO8R5oa8qQVsqzjx+D6m8OkaczYKPsUAIRJmrs3s/dWao55/v
2P3WC+aq/NerwxovO7tnrtgj7ZkAaGpbE5vix81x2cUWxKnDVnS5j8N/RvaCSReZ
V2zwJCkWpCcpHHXiIWKlxBYDpdSmd1cqpgDfPb9Cy5HsFXf6Xs0vYYZ/5ko0sQLs
Iw5niLnXdt6ybXooEry8uV+aP6F1ql8er5ymGbCwCgMrkzIXu/c=
=93rj
-----END PGP SIGNATURE-----

--K3vkeaB0MlFjg8U+--
