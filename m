From: "Chan Kim" <ckim-mINagvnPBMnWF1p7bDn8Kw@public.gmane.org>
Subject: A question about generated phandle during dtb=>dts conversion
Date: Tue, 2 Nov 2021 18:03:27 +0900
Message-ID: <005e01d7cfc8$8034c5f0$809e51d0$@etri.re.kr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: a=rsa-sha256;
 b=MNNLwkbZnnSMAvRxjqr1zV0ryIrLiiiMIT8G5JzyRwV/rOvkex9ipWqR20DG5W4rfLx+hii6AR
  pNrjvSl8B2pjAowloIP2Swy/8pg/3w34T3szHRaiIzCwrpl2jbHoChwS6WQCZ2AikrxmHKccmaKD
  lIkWJpWvhyNYH+V/CwgiWWTNwrGAmzQGFnh5Tw+5uN9NuWBx/SVJ/+qtFp9Wa7gEc21GQ35qE2QT
  Dwh+g0LpD4mXj/Th7giKmGwCUmPpa/bw4LTfftm4fHxh6V0FWmy1VYYxNqMOmSO2hQ8xS/8XHkLF
  /2dCcsoUrfjdP/Q2w4oqSSCb1arz3NQK/vjrPTXA==;
 c=relaxed/relaxed; s=selector; d=dooray.com; v=1;
 bh=On4TfW3Z80qW+k6cGYqze6eQedMCfmWPVHY3acVrBjQ=;
 h=From:To:Subject:Message-ID;
Content-Language: ko
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello, all
I extracted a dtb file from qemu execution (arm virt machine) and =
converted
the dtb file to dts file using dtc.
But for some node that is referenced by other nodes, the phandle is
generated like =93phandle =3D <0x8000>=94 as shown below.

apb-pclk {
=A0=A0=A0=A0=A0=A0=A0 phandle =3D <0x8000>;
=A0=A0=A0=A0=A0=A0=A0 clock-output-names =3D "clk24mhz";
=A0=A0=A0=A0=A0=A0=A0 clock-frequency =3D <0x16e3600>;
=A0=A0=A0=A0=A0=A0=A0 #clock-cells =3D <0x00>;
=A0=A0=A0=A0=A0=A0=A0 compatible =3D "fixed-clock";
=A0=A0=A0 };

And another node is using this phandle like this. (the clocks is the =
phandle
for the apb-pclk above.)

pl061@9030000 {
=A0=A0=A0=A0=A0=A0=A0 phandle =3D <0x8003>;
=A0=A0=A0=A0=A0=A0=A0 clock-names =3D "apb_pclk";
=A0=A0=A0=A0=A0=A0=A0 clocks =3D <0x8000>;
=A0=A0=A0=A0=A0=A0=A0 interrupts =3D <0x00 0x07 0x04>;
=A0=A0=A0=A0=A0=A0=A0 gpio-controller;
=A0=A0=A0=A0=A0=A0=A0 #gpio-cells =3D <0x02>;
=A0=A0=A0=A0=A0=A0=A0 compatible =3D "arm,pl061\0arm,primecell";
=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x00 0x9030000 0x00 0x1000>;
=A0=A0=A0 };

When I convert the dts back to the dtb, dtc doesn=92t understand the =
phandle
and complains that it is not a phandle referenece.

dts.dts:276.3-21: Warning (clocks_property): /pl061@9030000:clocks: cell =
0
is not a phandle reference

I=92ve checked event with this warning, the phandle reference is being
preserved through out the procedure.
So, if I want to extract a dtb and convert it to dts, edit some and =
convert
it back to dtb, how can I prevent this kind of phandle warning?=20
And why doesn't dtc add labels to the referenced nodes and let other =
nodes
use that label as phandle?

Thank you!
Regards,

Chan Kim



