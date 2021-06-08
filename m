From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: error when compiling dts preprocessed with -g3
Date: Tue, 8 Jun 2021 14:18:15 +1000
Message-ID: <YL7vh7JkjymjKsQD@yekko>
References: <f03fc1a5-14c9-5f87-84ee-0936f7e13ad2@fastree3d.com>
 <20200820102734.GR271315@yekko.fritz.box>
 <594ead88-fd44-76ac-8c63-6337ac77a032@fastree3d.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rr7vGWTGhgghSsEl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623129493;
        bh=Xg4wzcEHD6H49N3lg0oLUwlJMhGEZOOWMfHNCsJWUHU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QRPkjd/gw6BbC5RlCYYPSyod+JQohM2QVXHK73wmvRK9Tf1uDyaL3HUQc1yykwWSC
         jnjE97O5eGQ64soZrsZNMGn1KD4jKFefBWNeEAafq3gF39pP0cg/vPc7Yzh1bAI7en
         8WTZPNZ+yVPMiRjgmFYLhZL9yS2t2ccR/00xwMyM=
Content-Disposition: inline
In-Reply-To: <594ead88-fd44-76ac-8c63-6337ac77a032-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Adrian Fiergolski <adrian.fiergolski-/A8SZzjb9pj2eFz/2MeuCQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--rr7vGWTGhgghSsEl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2020 at 01:32:17PM +0200, Adrian Fiergolski wrote:
> Hi David,
>=20
> Thank you for your reply.
>=20
> On 20.08.2020=A012:27, David Gibson wrote:
> > On Fri, Aug 14, 2020 at 08:13:22PM +0200, Adrian Fiergolski wrote:
> >> Hi,
> >>
> >> I am using yocto to build my custom distribution targetting arm64 on
> >> Ubuntu 18.04.4.
> >>
> >> I have an issue compiling dts which was preprocessed with gcc version
> >> 7.5.0 (I haven't tried other version) and '-g3' flag. The error messag=
e:
> > Huh.  It's surprising to me that -g options affect the preprocessor
> > behavior at all.
> >
> >>     ./scripts/dtc/dtc -O dtb -o
> >>     arch/arm64/boot/dts/xilinx/zynqmp-falcon.dtb -b 0
> >>     -i/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-=
zynqmp/kernel-source/arch/arm64/boot/dts/xilinx/
> >>     -i/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-=
zynqmp/kernel-source/scripts/dtc/include-prefixes
> >>     -Wno-unit_address_vs_reg -Wno-unit_address_format
> >>     -Wno-avoid_unnecessary_addr_size -Wno-alias_paths
> >>     -Wno-graph_child_address -Wno-simple_bus_reg
> >>     -Wno-unique_unit_address -Wno-pci_device_reg=A0 -d
> >>     arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.d.dtc.tmp
> >>     arch/arm64/boot/dts/xilinx/.zynqmp-falcon.dtb.dts.tmp
> >>
> >>     Error: <built-in>:1.1-2 syntax error
> >>     FATAL ERROR: Unable to parse input tree
> >>
> >> The part of a preprocessed dts causing issue:
> >>
> >>     # 1
> >>     "/home/afiergol/fastree/falcon/poky/build/tmp/work-shared/falcon-z=
ynqmp/kernel-source/arch/arm64/boot/dts/xilinx/zynqmp-falcon.dts"
> >>     # 1
> >>     "/home/afiergol/fastree/falcon/poky/build/tmp/work/falcon_zynqmp-p=
oky-linux/linux-xlnx/5.4+gitAUTOINC+22b71b4162-r0/linux-falcon_zynqmp-stand=
ard-build//"
> >>     # 1 "<built-in>"
> >>     #define __STDC__ 1
> > If it's preprocessed already, why does it still have #defines?
> >
> > This is the cause of the problem - the dtc lexer can hande the lines
> > in the preprocessor output with file/linue number information, but it
> > doesn't expect there to be remaining preprocessor directives.
>=20
> Yes, it's preprocessed already by gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0.
>=20
> Are you able to reproduce the issue (any dts including dtsi should give
> similar results)?

No, I haven't been able to reproduce this problem.  I did hit a
different problem in the area, where cpp was generating line number
information in a format the dtc lexer didn't expect.  I've just pushed
a fix for that.

But leaving in #defines in preprocessed code really looks like a
problem with how the preprocessor is invoked, not with dtc.  If I'm
going to debug this without more messing around than I have time for,
please give me *specific* dts/dtsi files to attempt this, and
*exactly* how the preprocessor is being invoked.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rr7vGWTGhgghSsEl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC+74UACgkQbDjKyiDZ
s5Iqrg//UeVtdutA8NDsRxUf+5mpP3olGq3e1Y/OUJpjnL6rkypH+HiKw3VV4Ux5
6jq9TDq1k0l7ylsBpUl7zX8t1rmH5M+0WPUc+GHKR0N9h0SvH6+sfRB1QrKHfbgW
cNa1N9sXmukqCSQn2YiI5fdyKmRf0mer+jE/pj8gM8fI07kTqKcFzjPaeZ0s3wl2
H/hO9uqFoaqX51GUW8T/Trix2RwgDqy4Fa/v0QuMM6eD9Rf75kXY/CmXTvCphDqS
HRJsMuFKUIVGS9Q0/QhvGOSev41RWLUVIRDjvj4aA4lF+eNPwfFVINXTceCQT/Ah
O7qOa6RQ9jPWCuSbZf5TIexYlXtjmexQK/JRLL7C4v09ZjXHYK9Rs4zh9tkBoDiI
20YVzNyn9erFeTxClfLKc9MF6ytH0a/8XHB0oSUsxLOJ3uTXTF1xali7X/aaMtXv
s00WqH88s74zLLGx6++SLYwoldOM8fCesTIAcBHUZJcKXQWC4K0/262JHgZxJ66n
SbnteZuGE8GWL5N50xZfGeWUu1R2YCcyo3d1p99KiAbSmoBxS+AXLFYUZ/9cVr9t
ffLC17MFAn/P0yUspKHT2LdSLblqxF2gvkxt22yC85IKMcUfPFTK89tvGUhvWMnE
tnuHocL8Yi8q0gSQ/iOb6aOP+eiQW6nuUgwlwcHa8Ea0mMtP2Z0=
=hfsU
-----END PGP SIGNATURE-----

--rr7vGWTGhgghSsEl--
