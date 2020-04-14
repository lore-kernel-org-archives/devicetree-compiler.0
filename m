From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: bus error on sparc64 running type-preservation test
Date: Tue, 14 Apr 2020 16:25:34 +1000
Message-ID: <20200414062534.GL48061@umbus.fritz.box>
References: <001f01d611ad$f1f44420$d5dccc60$@turelinckx.be>
 <002001d611b0$c2dd7d20$48987760$@turelinckx.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sWvRP97dwRHm9fX+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1586845544;
        bh=28OLAX+9G67GT7pzsa+plRKEl1sM0jza6zAv+IZkw5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bc/x2lxCP5qKRhsn6q/t4m7EaODiTVtzTrliTTXjUoBZ0GfJiK2hFtBeRhBXxwyvT
         z5abgwt1/kSYjXw8hfuAzWY/sdh2MjMLFNthQC2zg5Y7nITDxVQLNcJVwjTA0W+HMd
         NoqaRaPCMuznY8WU4zAqimqh5sPMHK2q2GC3NRzk=
Content-Disposition: inline
In-Reply-To: <002001d611b0$c2dd7d20$48987760$@turelinckx.be>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Turelinckx <tom-HiypchcOusz53ZRCpReHOg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--sWvRP97dwRHm9fX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2020 at 06:29:52PM +0200, Tom Turelinckx wrote:
> I wrote:
>=20
> > I have no idea how to fix this, but the following gdb backtrace (from v=
1.6.0) may help someone else:
>=20
> With -O0:
>=20
> Reading symbols from dtc...
> (gdb) r -I dts -O dts -o tests/type-preservation.dts.test.dts tests/type-=
preservation.dts
> Starting program: /build/device-tree-compiler-1.6.0/dtc -I dts -O dts -o =
tests/type-preservation.dts.test.dts tests/type-preservation.dts
>=20
> Program received signal SIGBUS, Bus error.
> 0x0000010000017f2c in write_propval_int (f=3D0x1000012e300, p=3D0x1000013=
48af "", len=3D4, width=3D4) at treesource.c:116
> 116                             fprintf(f, "0x%02"PRIx32, fdt32_to_cpu(*(=
const fdt32_t*)p));
> (gdb) bt
> #0  0x0000010000017f2c in write_propval_int (f=3D0x1000012e300, p=3D0x100=
001348af "", len=3D4, width=3D4) at treesource.c:116
> #1  0x0000010000018704 in write_propval (f=3D0x1000012e300, prop=3D0x1000=
01348e0) at treesource.c:251
> #2  0x0000010000018b8c in write_tree_source_node (f=3D0x1000012e300, tree=
=3D0x10000134960, level=3D3) at treesource.c:310
> #3  0x0000010000018c04 in write_tree_source_node (f=3D0x1000012e300, tree=
=3D0x10000134a30, level=3D2) at treesource.c:314
> #4  0x0000010000018c04 in write_tree_source_node (f=3D0x1000012e300, tree=
=3D0x10000134b20, level=3D1) at treesource.c:314
> #5  0x0000010000018c04 in write_tree_source_node (f=3D0x1000012e300, tree=
=3D0x10000134c10, level=3D0) at treesource.c:314
> #6  0x0000010000018e28 in dt_to_source (f=3D0x1000012e300, dti=3D0x100001=
325c0) at treesource.c:344
> #7  0x0000010000005f1c in main (argc=3D8, argv=3D0x7fefffff528) at dtc.c:=
351

Yeah, it definitely looks like an alignment problem.  The 'p'
parameter to write_propval_int() is not 4-byte aligned, but width =3D=3D
4, which means it will attempt to read from p as a 32-bit integer
pointer.

Some grepping also suggests several other places in dtc which could
suffer from the same problem, though I suspect they're less likely to
trigger.

I've just merged and pushed a change which I think will fix this to
the master branch.  Could you build and test that please?

If you can make a minimal testcase which triggers this problem and
submit it as an addition to the dtc testsuite, that would be terrific.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sWvRP97dwRHm9fX+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6VV10ACgkQbDjKyiDZ
s5K0/Q//TNDVhmu+xALxVuIB4kOuMbWBr9TqNHnSaUpIa68f8Nm++HPVZnGGeMNV
sD3orylm7mqSukun5sZOvwF4cDiiuDKzpFnM4K1JFrttLqCd93GSJgMaDMTJKBe0
41VOVzWxQR53yGEGzfiHxnX41/24cundXgwI78JFK/8iP5kItAJLd4//lkCACKBP
ZrE/j51NvPqABoABlnSUnk3UpIEp4QnKv9jdnpDm1ewQZDOFTGt/H0DMtIdS9f2J
FEEUvbv+wv70b6zOgsRvG1YiPyJr8v7it7G5pfBFIJNdc90kMlLzzmp8okRuBtq9
u3zn5Er3g0H0SxL4GOxgJWs0fj6yhOxZ5PcwpFsgYC4h8vhzZid0ZR8rM+I0KrzM
JSwdvU/cR2IRTe8gYflqxe9cuUApTlEEn3iDfaHUexwaVsA0pdgyhk2lS5SpP2rm
Ym7ux6j5MdvzUBKNjZPibX/BM1dsfg5TAUMCK/7bcY4L9uuMmXyVcOqcingydX6r
J0G/YFGllb4pEAh1M7krcSbtMV4RtUjPkqrS+oKR9ZTa64Ni+E6MaFj/YiyqZZFj
MkvZT/Bly+Rr/sT+78qVdyAc4XotHXWKDSGGxrD4IDN209T0/CumhmAeJGcQOvx+
lmU/V6/uFmCdcLxjG9Ymu5b+5y9Gvcl+EANL0uVyToWrTvy6isg=
=m0me
-----END PGP SIGNATURE-----

--sWvRP97dwRHm9fX+--
