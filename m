From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Bug or feature? /somenode overwrites /somenode@17 in fdt-overlay
Date: Tue, 25 Apr 2023 16:55:04 +0200
Message-ID: <20230425145504.tswuitufzikuhmnz@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="blylpccocxl2rppm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--blylpccocxl2rppm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

TL;DR: The node &{/somenode} in my overlay overwrites &{/somenode@27}.
Is this expected?

I have the following base and overlay dts files:

	uwe@taurus:~/tmp/fdtoverlay$ cat base.dts
	/dts-v1/;

	/ {
		somenode@12 {
			property =3D <0x2a>;
		};

		somenode@27 {
			property =3D <0x20>;
		};
	};
	uwe@taurus:~/tmp/fdtoverlay$ cat overlay.dts
	/dts-v1/;
	/plugin/;

	&{/somenode} {
		property =3D <0x17>;
	};

When compiling these and using them with fdtoverlay I see that
/somenode@12 is overwritten(. And if I swap the order of /somenode@12
and /somenode@27 in base.dts, the latter is overwritten instead):

uwe@taurus:~/tmp/fdtoverlay$ dtc -I dts -O dtb -o base.dtb base.dts && dtc =
-I dts -O dtb -o overlay.dtb overlay.dts && fdtoverlay -i base.dtb -o base+=
overlay.dtb overlay.dtb && fdtdump base+overlay.dtb
base.dts:4.14-6.4: Warning (unit_address_vs_reg): /somenode@12: node has a =
unit name, but no reg or ranges property
base.dts:8.14-10.4: Warning (unit_address_vs_reg): /somenode@27: node has a=
 unit name, but no reg or ranges property

**** fdtdump is a low-level debugging tool, not meant for general use.
**** If you want to decompile a dtb, you probably want
****     dtc -I dtb -O dts <filename>

/dts-v1/;
// magic:		0xd00dfeed
// totalsize:		0x99 (153)
// off_dt_struct:	0x38
// off_dt_strings:	0x90
// off_mem_rsvmap:	0x28
// version:		17
// last_comp_version:	16
// boot_cpuid_phys:	0x0
// size_dt_strings:	0x9
// size_dt_struct:	0x58

/ {
    somenode@12 {
        property =3D <0x00000017>;
    };
    somenode@27 {
        property =3D <0x00000020>;
    };
};

I was surprised and wonder if this is as designed or if this is a bug
that should be fixed. Any insights?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--blylpccocxl2rppm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRH6cgACgkQj4D7WH0S
/k4txAgAiMTfqKTWIpiCJWA+jlls2thm47lqlxyPaTUuzOuxIa7+hqr4ZUpL4GJh
INybFrkZi7qtAxw9MTaWxmb/Un4fVVSE9J+HuA6aHb0QwUXAyEhlsoMVW19ks/hF
IK5sQRz2llmCeF4kvVbSJ0WTAAmGPAaFb8A2EsamgdYBogZmvvUfPdCTYEuYflbt
QEJ7IFzzBt9hrj71Ubzl7hdmMnFHtnhF3M6FLfcfQ01E6LFo0j+4ScKhlZ075tVr
SRRNaBDr5sk69xmFqAOiSh6wLNQtH7sb1o4SK0lO6ILDrmdavtJbPerhMxLZu3VU
EJuO+bvynFKD02YC4KCSd1dKrIGH0g==
=HnqP
-----END PGP SIGNATURE-----

--blylpccocxl2rppm--
