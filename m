From: Quentin Kaiser <quentin.kaiser-JH/mD2RVu8LQT0dZR+AlfA@public.gmane.org>
Subject: potential regression between 1.6.0 and 1.6.1
Date: Thu, 13 Oct 2022 16:36:30 +0000
Message-ID: <AM6PR10MB2102BC4BB6C50FBC26F10557F3259@AM6PR10MB2102.EURPRD10.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onekey.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8Lpn2Tm4/b669veePYY9Er3KMgYAcgpPmzGggLUiR4=;
 b=a2FIJDHntxMHZApstYpU4X+uC8gshKhnmlTgUeUGsm3EZ2lQ23e9NiYyvHbo1iKTIKRA0vvU481D1BLSIkvs+Ls6+gfqDwkP2xzTOMpsX0EB5+6IALTaH0sY6VTLc8MzTNg4jIjVi4TnqkXtzq2a8qUvqt91srML0NmE3ahTJtQ+mZyUlbfsP10hNPwqel1Xq3auCCHNv/tTaU2PcZzckCUpehZ5IHGGDqR7JkjI5VTEVNiEr71FZzBeHUYoDhfrOEESCErhupwirCvxybEJISN2BiMF+psivGdMu3BNabPpb2UHl3wXlea+hpIxg3CeOhf4D4/qpagzLI6vUeWDJw==
Content-Language: en-US
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi,

We identified a =93regression=94 between dtc 1.6.0 and 1.6.1 introduced by =
commit 9d7888cbf19c2930992844e69a097dc71e5a7354.

As part of a firmware extraction framework that we built and open sourced (=
https://unblob.org), we have integration test files making sure our changes=
 do not modify the way we extract specific file types.
We do so by extracting integration test files and identifying changes using=
 diff. Within this extraction framework, we have a handler that convert DTB=
s to DTS using the dtc command line tool.

The test suite was failing on one of our colleague=92s machine but not on o=
urs, and we identified that the only difference was the DTC version (1.5.0 =
vs 1.6.1).

You can reproduce it with the iMX6 Sabrelite DTB file available at https://=
github.com/FAlinux-SoftwareinLife/silfa/blob/master/OS/kernel/imx6q-sabreli=
te.dtb using this command:

dtc -I dtb -O dts imx6q-sabrelite.dtb 2>/dev/null | grep min-voltage

Here=92s a diff showing the difference between the two generated DTS (one w=
ith 1.5.0, the other with 1.6.1):

diff /tmp/1.5.0.dts /tmp/1.6.1.dts=20
852c852
< 			regulator-min-microvolt =3D <0xc3500>;
---
> 			regulator-min-microvolt =3D "\0\f5";
859c859
< 			min-voltage =3D <0xc3500>;
---
> 			min-voltage =3D "\0\f5";



I have a very limited knowledge of dtc source code internals so I leave the=
 root cause analysis to you. I just identified the breaking change as part =
of commit 9d7888cbf19c2930992844e69a097dc71e5a7354.

Cheers,
Quentin=20

