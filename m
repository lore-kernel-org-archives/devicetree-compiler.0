From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 09/10] README: Add a note about test_tree1.dts
Date: Mon, 21 Aug 2017 10:25:57 +1000
Message-ID: <20170821002557.GD12356@umbus.fritz.box>
References: <20170819171803.195806-1-sjg@chromium.org>
 <20170819171803.195806-9-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1503279685;
        bh=vWIy436TfkMsT6YIWXymwK23+qcKhqVptDDjxRvkgus=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GELzRCxvc4/7bbsKVnQ+BYTWyMVORotVjgHukSTJYDo63yXPVraJiYATBgBxKTt7n
         dJTuvkxTt8/esFLxwYk5ldrHtXgoIQQNyBKOfyiyMCp9F62Deq/r8/m8u1++o5HzHD
         vH7Q+xNcmNaBUscwB8hMHLUdjUnjvhjA4gYfsOdo=
Content-Disposition: inline
In-Reply-To: <20170819171803.195806-9-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 19, 2017 at 11:18:02AM -0600, Simon Glass wrote:
> Add a little note in the README about something which confused me.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I've applied patches 8 & 9.

> ---
>=20
>  README | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/README b/README
> index 17dc845..15232ab 100644
> --- a/README
> +++ b/README
> @@ -73,6 +73,17 @@ More work remains to support all of libfdt, including =
access to numeric
>  values.
> =20
> =20
> +Tests
> +-----
> +
> +Test files are kept in the tests/ directory. Use 'make check' to build a=
nd run
> +all tests.
> +
> +If you want to adjust a test file, be aware that tree_tree1.dts is compi=
led
> +and checked against a binary tree from assembler macros in trees.S. So
> +if you change that file you must change tree.S also.
> +
> +
>  Mailing list
>  ------------
>  The following list is for discussion about dtc and libfdt implementation

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmaKJUACgkQbDjKyiDZ
s5IyohAAyfV8ONkUAXmxEk/hVu4pCL/ohTKUQSeCc2OulKWBO6STMf0cADDmTDK6
F2NEEd57PH5HK+lhNRyTb6457C3zfiIXcl61gAo/jTjkdGdJpMQ8I5gIPrFIYrjy
H3hRzkFuN+qtjdOrpPHROJB1LqP9mpWbQSbK224Fj7/Y1rVHQ5fp9EZtyg7jAcTj
1Kt+7qZDT30UMDtB7XBjvcfV1PJuzo92c7DF6+GUpges1+RQEM8+SNegPzQmDuQF
IFt3Lfj9hiFPGZsEbesnXlUTg23FuehPWCvE7yznRhnlh5JxWwgK5534+gUwr3T7
kbhuTwUb2/IN7MqCDF2iSU6Qk+4eS6KgPyhc8CQLvc2Qfq8R2ho8Bdv+fM7DRx9R
DU8RXE9Su7tZRKWy3MQZTP8dzN/IZ4DhO5qGmDXahphktjEl7guAcnNWO5It4jpb
wHlrJ5hrjc05bF3DfG6UM6KpTtHgD4+7q24t1+QY3g7sEpJggwRqt1qzNqDUjDuB
RnL9PDJdj52Qm8wYCyT7nFpjRTk+u4C0pxghn6prh79UZmVrUFmIigP5+ir9AwDJ
suecqsDC5oe8zQf+Py38ivHCXZ6ARoIe+wet9DX2VFygtsAg/8aS1nl7Mnq/dekq
6p9ocX5R/8y4GbscBpAmbQoUG12iIXaNEnxqktqskqSqwhuR9Nw=
=zdJ/
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--
