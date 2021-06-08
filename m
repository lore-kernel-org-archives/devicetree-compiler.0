From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: DTC 1.6.1 released
Date: Tue, 8 Jun 2021 20:38:48 +1000
Message-ID: <YL9IuEauvI81YQOY@yekko>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h4QSfnjQYgSYvkk0"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623148735;
        bh=l4CxAosohB07BsCeU5ViMVgp/aS2wa/+IkE0bW5vvvs=;
        h=Date:From:To:Subject:From;
        b=LYZS+ckWzUwP4WJ/c723dXSJNsgc2ogMqEBmb2y4k028Y1K1fTxqDi+xZkHDUDF0T
         pdXfup2xdk5FZUbXRAQnMpyg79rco0VVDh2S4mkLZXAw54e3YICwD976dx1wOk/nlm
         VFITGw5SXpwcToBjRfg2tzJ3qIjtE4bYOvvnoDPE=
Content-Disposition: inline
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--h4QSfnjQYgSYvkk0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks,

It's been a while, and someone asked for it, so I've wrapped up
another numbered release, v1.6.1/

Changes since v1.6.0 include:
 * A number of bugfixes
 * Fix many warnings with -Wsign-compare
 * Add compilation with meson (not used by default so far)
 * Yet another revamp of how we handle unaligned accesses
 * Added a number of extra checks for common tree errors
   * Checks for interrupt providers
   * i2c reg properties
   * Tighten checking of gpio properties
 * Reduce dependencies when building libfdt only
 * Allow libfdt.h header to be used from C++ more easily
 * Accept .dtbo extension for overlays
 * Update valid node and property characters to match current devicetree sp=
ec
 * Add several checks for root node sanity in fdt_check_full()
 * Somewhat more robust type labelling for the benefit of yaml output

You can get it from the v1.6.1 tag in the git tree at
    git://git.kernel.org/pub/scm/utils/dtc/dtc.git

Or, you can get tarballs at
    https://mirrors.edge.kernel.org/pub/software/utils/dtc/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--h4QSfnjQYgSYvkk0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC/SLIACgkQbDjKyiDZ
s5KwqxAAwBB4Q9LBWqhR4bxr88ZOrQWv4cjdDZ6L1NYohHIy0pQeBFOeWxvGgNGt
FuQoHKGEPWxk0NCjPNPjSatVtmHTW+xZVrlrGvUu1L+UA5mPaeuVhGCzOHltaCAJ
7tPVCQk2dXiwMLoxhD04nmQrZzzhkhU61KqpzbiYvEbO9cw3r+hfZb1e9mzCPX1p
Ssei9uifNDhRrPk9SduNsFvFrRRf4BsT4oGHnQSEhIN0d6Li5gHb+bmQSmnRBtwo
2l9KQMIvd03KeB/IQnOZ9QwLFn9INFzKVIP6og1ugpCH893kDPe6CwwMcJ6CODu6
TPq2ajLs4wg52MBFq1sUhDBHuyT5MJVB7eq4ZajI4/kZFv/zKD3C4nKoy65b+6Zz
+oGh4PVKqp8b9WTrUl/wcuh+ZXlPBgKPIpZ8tl14/CC/4prN6LPKYEe/Al/0x3jP
L9KxmPrSnkpGSrqWvb/f5ONZ8OUL0RrcVVA5w4i6K3QFMQxzfnrKDplefWSUjwga
5rA73ePbUorMOMSPk+ckgCUG5wIVx+F77W9kcrmyNfZ6khuiPidCjTSvvhYT0lxq
F62EbscRymxvAKLqFXUtgkL71M5brabFs/2ERK2tBu7qC5p4lBrb1w8EmnPcuRg+
9kqPSYe1KJOGx+f5iLJd+NpbJrGzm/rGgIe/lFrEezdTfIX/YPk=
=mBZC
-----END PGP SIGNATURE-----

--h4QSfnjQYgSYvkk0--
