From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3] checks: tigthen up nr-gpios prop exception
Date: Thu, 8 Apr 2021 12:50:43 +1000
Message-ID: <YG5vgwadkwHBoTsQ@yekko.fritz.box>
References: <20210405052617.2471954-1-ilya.lipnitskiy@gmail.com>
 <20210405232855.51816-1-ilya.lipnitskiy@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NYYm6MnsMZwFfDXt"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1617850792;
        bh=wxO4OQrNDDRB5PmVpKhiWx2/VMEp0T3Zye+9kOs1Ue0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gqEO7n1WUdBNjU4KDHAVDhE9I/sZwLnE74zhY8oohYkNxrUTQ6d7gM7QXkjwFxxS/
         GbBzeGLrjzXVvJGk0joWtocrvF4fpa0sHU4abVvccECmFtNaerNItwRhSqpEOlnmdB
         LqOoezI2WuaKhk/kKpWYTY4M1oh598UTO6BEBU3g=
Content-Disposition: inline
In-Reply-To: <20210405232855.51816-1-ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


--NYYm6MnsMZwFfDXt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2021 at 04:28:55PM -0700, Ilya Lipnitskiy wrote:
> There are no instances of nr-gpio in the Linux kernel tree, only
> "[<vendor>,]nr-gpios", so make the check stricter.
>=20
> nr-gpios without a "vendor," prefix is also invalid, according to the DT
> spec[0], and there are no DT files in the Linux kernel tree with
> non-vendor nr-gpios. There are some drivers, but they are not DT spec
> compliant, so don't suppress the check for them.
>=20
> [0]:
> Link: https://github.com/devicetree-org/dt-schema/blob/cb53a16a1eb3e2169c=
e170c071e47940845ec26e/schemas/gpio/gpio-consumer.yaml#L20
>=20
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, since it looks like it definitely improves the current
situation.

The use of strstr() at all seems kind of bogus to me.  Shouldn't we
explicitly be checking that ",nr-gpios" forms the *end* of the
property name?

> ---
>  checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index c4207720ce8c..7e9d73af02a3 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1494,7 +1494,7 @@ static bool prop_is_gpio(struct property *prop)
>  	 * *-gpios and *-gpio can appear in property names,
>  	 * so skip over any false matches (only one known ATM)
>  	 */
> -	if (strstr(prop->name, "nr-gpio"))
> +	if (strstr(prop->name, ",nr-gpios"))
>  		return false;
> =20
>  	str =3D strrchr(prop->name, '-');

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NYYm6MnsMZwFfDXt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBub4MACgkQbDjKyiDZ
s5LShhAAnuA09vU5gDAF9xHbZBPZSKsAjT1J938gzqq3urtqsqTsBW0dGj2XDktK
ds/p4gOknArDKZYJZd9lGA/he1K2BnwNoBzM3oKBu/b66KB8sfKBFr81b4/XRiXv
RYvoBkKZ+qvCg1MviBkCr1cg+8fEeHlAE/5nSkoprwKMoT5hdtjhnct1tkXwQzdx
d3Z7mCR62TskUuI5S/yl5BZmfMlU8K6PUk/M4zZUl0NNHEkb5MfvaMyrJNbQjJAQ
pnLiy/G9YYHMKnIAipjcfEmz9R4aGHKn4RIimbnpdteuT5nDfkBn54ZlI/LdQnHJ
NyWWDKfBoXVMp4WzTd4Gpwv+6yWsnGHjFn1MsfKAttsLf7Qc2hi030jdarDB0xTF
Wk4xw/LHLi7q6PEHuKDOxGHbZeIatb5lPpAGVhgtKmdX6H+rF7h2gb3MEFakA9we
Qwmj3jZuGOnTc1GL6i9v4qAyM43Q4i1SAH6BEcLbF96CWL+hi5WWvsz5y4/De538
0iMEI8+oX5DbvHDR0umPYzlwwZg2Ivr/lIiuk8gDwGbiJEi10dffIUE0wmPbvduy
sozApn4NP8eVh2g6ik4xe8nKLgF18dKBNHEA4uDJY+uUdUEqx8u9j6SwuzRrpWO/
ck6sEmMvOvzHFYmWOF4E5bWdMyWcEEahveRFYGa4kPypybi/pRs=
=bN/D
-----END PGP SIGNATURE-----

--NYYm6MnsMZwFfDXt--
