From: "DHANAPAL, GNANACHANDRAN (G.)" <gnanachandran.dhanapal-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>
Subject: DTC: unaligned memory offset in FIT image
Date: Wed, 19 Jul 2017 13:56:58 +0000
Message-ID: <AM4PR06MB1588B92E62622B6F86973F8F82A60@AM4PR06MB1588.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
        boundary="_002_AM4PR06MB1588B92E62622B6F86973F8F82A60AM4PR06MB1588eurp_"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=visteon.onmicrosoft.com; s=selector1-visteon-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FiG5PAzs+uvCU2EH9CgCYQ4bhZMpdM1vbZCKDasIc7g=;
 b=koTRFnWmMXbHtTLWyBAorRI0pHKS1vUS1BOR5YZ8LsdhBMQ0gDkQvJ4dNNpf144BzhuM9hGSU/Sv/L5T6E5K6sYltexclMnJkGiuv99Q1Ia8pR7sk0BJVN6HWmQUL51KfK7wo3v20gnEJKHflr41/AcGrtxpKflS3O9ugpno1KQ=
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, "Babu, Viswanathan (V.)" <vbabu3-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, "Ravindran, Madhusudhanan (M.)" <mravindr-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, "Gujulan Elango, Hari Prasath (H.)" <hgujulan-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, "CN, Aananth (A.A.)" <aananth.cn-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>

--_002_AM4PR06MB1588B92E62622B6F86973F8F82A60AM4PR06MB1588eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi There,

In our  R-car H3 based customized automotive product, we are using  U-boot =
( bootloader), FIT image (Linux kernel + DTB) and root file system provided=
=20
by Renesas provide BSP 2.16.0.  FIT image has compressed Linux kernel and u=
ncompressed DTB. While loading the FIT image, system reboot happens with=20
following boot log.

reading fitImage_monarch
6627756 bytes read in 299 ms (21.1 MiB/s)
## Loading kernel from FIT Image at 4c000000 ...
   Using 'conf@1' configuration
   Trying 'kernel@1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image
     Compression:  gzip compressed
     Data Start:   0x4c000114
     Data Size:    6557502 Bytes =3D 6.3 MiB
     Architecture: AArch64
     OS:           Linux
     Load Address: 0x48080000
     Entry Point:  0x48080000
     Hash algo:    sha1
     Hash value:   2638b7ad761ed7c70d9053908f274e5617e7ae75
   Verifying Hash Integrity ... sha1+ OK
## Loading fdt from FIT Image at 4c000000 ...
   Using 'conf@1' configuration
   Trying 'fdt@1' fdt subimage
     Description:  Flattened Device Tree blob
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x4c64114c
     Data Size:    68887 Bytes =3D 67.3 KiB
     Architecture: AArch64
     Hash algo:    sha1
     Hash value:   c29c2b38626b8af9cfd5c1b513a179fc6dcd1db2
   Verifying Hash Integrity ... sha1+ OK
   Booting using the fdt blob at 0x4c64114c
   Uncompressing Kernel Image ... OK
"Synchronous Abort" handler, esr 0x96000021
ELR:     50029550
LR:      5001117c
x0 : 0000000000000000 x1 : 000000004c64117c
x2 : 0000000000000011 x3 : 0000000000000009
x4 : 0000000000000000 x5 : 0000000050038eed
x6 : 0000000000000002 x7 : 000000005005aa98
x8 : 0000000000000000 x9 : 00000000ffffffff
x10: 0000000048e2ba00 x11: 0000000000000001
x12: 0000000000000060 x13: 00000000000001ff
x14: 000000000000003f x15: 000000007fe61670
x16: 000000007fe61e70 x17: 0000000100000000
x18: 000000007fe5ae20 x19: 0000000000000000
x20: 000000004c64114c x21: 000000005003e3db
x22: 000000005005a898 x23: 000000005005a9d8
x24: 0000000000000000 x25: 000000005004e5f0
x26: 000000004c000114 x27: 00000000500018b0
x28: 0000000048080000 x29: 000000007fe5a580

Resetting CPU ...


From log, we observed that Data start address for both kernel (0x4C000114) =
and DTB (0x4c64114c) are not 64bit aligned.
DTC that generates the FIT image doesn't align FIT description text (shown =
below) hence offset of kernel and DTC are moved to=20
Non 64 bit align address=20

        description =3D "U-Boot fitImage for Poky (Yocto Project Reference =
Distro)/4.9.0+gitAUTOINC+13e7680774/smartcore2";
        #address-cells =3D <1>;

String len of description is 97 bytes.  By changing this description length=
 to multiple of 8, FIT image works properly.
Please find the attached .its file used for FIT image creation

In DTC source code, function flatten_tree in file flattree.c, 8 bytes align=
ment is skipped for DTC version 17.

if ((vi->flags & FTF_VARALIGN) && (prop->val.len >=3D 8))
                        emit->align(etarget, 8);


May I know reason why FTF_VARALIGN is skipped for version 17 or =20
Is  there other way  this can be handle in latest DTC.


Cheers
Gnana

--_002_AM4PR06MB1588B92E62622B6F86973F8F82A60AM4PR06MB1588eurp_
Content-Type: application/octet-stream; name="fit-image.its"
Content-Description: fit-image.its
Content-Disposition: attachment; filename="fit-image.its"; size=1458;
	creation-date="Wed, 19 Jul 2017 13:33:14 GMT";
	modification-date="Tue, 18 Jul 2017 12:01:36 GMT"
Content-Transfer-Encoding: base64

L2R0cy12MS87CgovIHsKICAgICAgICBkZXNjcmlwdGlvbiA9ICJVLUJvb3QgZml0SW1hZ2UgZm9y
IFBva3kgKFlvY3RvIFByb2plY3QgUmVmZXJlbmNlIERpc3RybykvNC45LjArZ2l0QVVUT0lOQysx
M2U3NjgwNzc0L3NtYXJ0Y29yZTIiOwogICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OwoKICAg
ICAgICBpbWFnZXMgewogICAgICAgICAgICAgICAga2VybmVsQDEgewogICAgICAgICAgICAgICAg
ICAgICAgICBkZXNjcmlwdGlvbiA9ICJMaW51eCBrZXJuZWwiOwogICAgICAgICAgICAgICAgICAg
ICAgICBkYXRhID0gL2luY2Jpbi8oIi4vbGludXguYmluIik7CiAgICAgICAgICAgICAgICAgICAg
ICAgIHR5cGUgPSAia2VybmVsIjsKICAgICAgICAgICAgICAgICAgICAgICAgYXJjaCA9ICJhcm02
NCI7CiAgICAgICAgICAgICAgICAgICAgICAgIG9zID0gImxpbnV4IjsKICAgICAgICAgICAgICAg
ICAgICAgICAgY29tcHJlc3Npb24gPSAiZ3ppcCI7CiAgICAgICAgICAgICAgICAgICAgICAgIGxv
YWQgPSA8MHg0ODA4MDAwMD47CiAgICAgICAgICAgICAgICAgICAgICAgIGVudHJ5ID0gPDB4NDgw
ODAwMDA+OwogICAgICAgICAgICAgICAgICAgICAgICBoYXNoQDEgewogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMSI7CiAgICAgICAgICAgICAgICAgICAgICAgIH07
CiAgICAgICAgICAgICAgICB9OwogICAgICAgICAgICAgICAgZmR0QDEgewogICAgICAgICAgICAg
ICAgICAgICAgICBkZXNjcmlwdGlvbiA9ICJGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiI7CiAg
ICAgICAgICAgICAgICAgICAgICAgIGRhdGEgPSAvaW5jYmluLygiLi9yOGE3Nzk1LXNtYXJ0Y29y
ZTIuZHRiIik7CiAgICAgICAgICAgICAgICAgICAgICAgIHR5cGUgPSAiZmxhdF9kdCI7CiAgICAg
ICAgICAgICAgICAgICAgICAgIGFyY2ggPSAiYXJtNjQiOwogICAgICAgICAgICAgICAgICAgICAg
ICBjb21wcmVzc2lvbiA9ICJub25lIjsKICAgICAgICAgICAgICAgICAgICAgICAgaGFzaEAxIHsK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbGdvID0gInNoYTEiOwogICAgICAgICAg
ICAgICAgICAgICAgICB9OwogICAgICAgICAgICAgICAgfTsKCX07CgogICAgICAgIGNvbmZpZ3Vy
YXRpb25zIHsKICAgICAgICAgICAgICAgIGRlZmF1bHQgPSAiY29uZkAxIjsKICAgICAgICAgICAg
ICAgIGNvbmZAMSB7CiAgICAgICAgICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uID0gIkJvb3Qg
TGludXgga2VybmVsIHdpdGggRkRUIGJsb2IiOwoJCQlrZXJuZWwgPSAia2VybmVsQDEiOwoJCQlm
ZHQgPSAiZmR0QDEiOwogICAgICAgICAgICAgICAgICAgICAgICBoYXNoQDEgewogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGFsZ28gPSAic2hhMSI7CiAgICAgICAgICAgICAgICAgICAg
ICAgIH07CiAgICAgICAgICAgICAgICB9OwoJfTsKfTsK

--_002_AM4PR06MB1588B92E62622B6F86973F8F82A60AM4PR06MB1588eurp_--
