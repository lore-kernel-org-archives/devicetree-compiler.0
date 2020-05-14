From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Makefile: when building libfdt only, do not add unneeded
 deps
Date: Thu, 14 May 2020 17:12:18 +1000
Message-ID: <20200514071218.GE2183@umbus.fritz.box>
References: <20200512103315.1926-1-cfontana@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YgGp9RfepglW4nsE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1589440386;
        bh=lCT/lBtovxCeB6Khp8VqKiOXDEVBDpD0ZR0k9L0ztCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JNOcDm4/05Vh0HDvV5QaVHSfrXyNli5lS+Wg6WoKs6pDNpYn+wC0aAuYQfJ0Wihd0
         Q/jwELojh8AEKFa70Wwz8dejQQIkZsK/sM2hVaf8NzVpY0+sMnaEiAw499vwbLJYmi
         48M8Lo61cc2k8QW8HJylpZpzdPxRTjlpLfl4kNlU=
Content-Disposition: inline
In-Reply-To: <20200512103315.1926-1-cfontana-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Claudio Fontana <cfontana-l3A5Bk7waGM@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--YgGp9RfepglW4nsE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2020 at 12:33:15PM +0200, Claudio Fontana wrote:
> implemented originally for the QEMU consumer of libfdt.
>=20
> Signed-off-by: Claudio Fontana <cfontana-l3A5Bk7waGM@public.gmane.org>

Applied, thanks.

> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Makefile b/Makefile
> index f02aa19..cb256e8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -176,6 +176,7 @@ endif
> =20
> =20
>  ifneq ($(DEPTARGETS),)
> +ifneq ($(MAKECMDGOALS),libfdt)
>  -include $(DTC_OBJS:%.o=3D%.d)
>  -include $(CONVERT_OBJS:%.o=3D%.d)
>  -include $(FDTDUMP_OBJS:%.o=3D%.d)
> @@ -183,6 +184,7 @@ ifneq ($(DEPTARGETS),)
>  -include $(FDTPUT_OBJS:%.o=3D%.d)
>  -include $(FDTOVERLAY_OBJS:%.o=3D%.d)
>  endif
> +endif
> =20
> =20
> =20
> @@ -318,7 +320,9 @@ ifeq ($(NO_PYTHON),0)
>  TESTS_PYLIBFDT +=3D maybe_pylibfdt
>  endif
> =20
> +ifneq ($(MAKECMDGOALS),libfdt)
>  include tests/Makefile.tests
> +endif
> =20
>  #
>  # Clean rules

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YgGp9RfepglW4nsE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6871IACgkQbDjKyiDZ
s5JdjQ/9G+hiUdP4G81vt1Xjs9Pb4jRy0T0i3vuldE2hVjuLDDqIexEkiLD+eHkL
sGwaq026c8Iqlsa6/F94VJMvNMEBZZJB+at8fvGcRAFfRThtw/1ZNHjtLUZikO8T
vD88qURdWwPv79+RdqWzQm/6hAXhXFllQGXs/k2IhbT/TqY807+tq/hLRqy2QoMf
5b6fX515EjIUOKe/miIqtJ6z+pISt3pc53mVBn7g6S64IjGp89qUgGYwHDyc+5F9
vHz/2PO8H+yZiLPayNoIdEOs1mPN4Nw2fUZLcQhHYLMPYmeyu2ayua4gYnz64ik/
5y3NfcYlZ4R9Z0tBkLdmteV/dSr2MtgHGQRIpTEhvuuxDa2LcxGxLonyw2WmmeMR
QCC0oXoiCK4fGpV/BYqaw+rgbSpD+4XlBDBsA0xdRfh40sPCci3nK7imXwBvfocU
i9MN5+5yxJw7CyI9BlwzeFx5iGYQy/0WuH7umYpoZtcYGWvcbyIr5QJQlvuyzQs8
x0obN84YQRv5G7FyMmaxqTW9h++whzZdcyyYYkYYatXrQ2m9cjBnytGuMKbEiEwE
/7JciuIfgEqMVhmpxtbfEulw2J/BULr4JBPnwWSH4jSSRgmiFJ7RdCdws/q5HDKP
Hoq1na0GHAOfzo6yDd1P/usEoa25/nmNXBaqLk/mnSwCUfJ7+Io=
=PL/0
-----END PGP SIGNATURE-----

--YgGp9RfepglW4nsE--
