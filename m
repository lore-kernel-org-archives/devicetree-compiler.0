From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] dtc: Preserve negative integers in yaml and dts
 output
Date: Sun, 5 Jul 2020 18:59:40 +1000
Message-ID: <20200705085940.GB12576@umbus.fritz.box>
References: <20200626162528.2129-1-andrei.ziureaev@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1593939586;
        bh=QNtg+/5RVwt0RhFrQzlQ467pmLq52/rNIWHayy+Xelg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fFa0yGrwNOmtxceY+OygPJ9nQCHwDhe0xvxPzZu1zIpCEX1bTAaAfVQcXHfad0a0t
         f220djlOThCXfoMl2eJKYzqOSyW+CuUkJr67mE4SqauYoQq30xoTsgl1UIMQmxjDNi
         ZXraQ33HsjPyDqrJa4MRiNcRJPkNjcomdR+7zHuc=
Content-Disposition: inline
In-Reply-To: <20200626162528.2129-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 05:25:25PM +0100, Andrei Ziureaev wrote:
> Currently, in yaml output, negative values are indistinguishable from
> positive ones. Some bindings (for example
> Documentation/devicetree/bindings/iio/accel/lis302.txt) mention negative
> values. If those binding are converted to yaml, dt-schema validation
> wouldn't work with them.

> The first patch is a mechanical change and shouldn't affect dtc's
> behaviour.
>=20
> The second one is the functional change. When applied, dts to dts and
> dts to yaml conversions preserve the '-' sign in front of integers.
>=20
> For now, in dts parsing, only the unary '-' operator creates negative
> values (the other operators just set the 'is_negative' flag to false),
> but it should be easy to add support for other operators if needed.

Hmmmmm.  I'm really not convinced by this.  It seems like a lot of
fiddly work to preserve the sign only in a pretty narrow set of cases.
Basically it will only be reliably correct in the case of just
(-literal).  Something like (5-3) will still show as 0xfe rather than
-0x2, and if you do -(3-5) or (-3+5) you'll get the very strange
looking "-0xfe".

I also don't see why this is vital to schema validation.  The
validator should know the binding, and will therefore know which
values are signed, and can appropriately treat 0xfe and -2 (or
equivalent at whatever width) as the same.

> One issue is that there are two ways to format an array of bytes in dts:
> '/bits/ 8 <...>' and '[...]'.

So, these are intended for different purposes.  If you want to think
of your bytes as a bunch of 8-bit numbers, the former is appropriate.
The [ ... ] notation is more intended to be a compact way of putting
in "untyped" binary data.  For example, a blob of information which
gets verbatim copied into a device without interpretation by the
driver would make sense to use this form.

> Only the former supports negative
> integers. But, in dts output, only the latter is used. Therefore, I
> didn't include support for negative 8-bit values in dts output (I did
> add support for them in yaml output). Some possible alternatives are:
>=20
> - switch to the '/bits/ 8 <>' format in dts output
>=20
> - only switch to the '/bits/ 8 <>' format if the array contains negative
>   values
>=20
> - add another marker to differentiate between the two formats

I'd be ok with this, given the distinction above.  This is similar to
putting different for markers for say "abc" and <0x61626300> which
likewise represent the same bytes.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8BlnkACgkQbDjKyiDZ
s5KajA/9GrkVytLw05J5zESIus+as0DAApqQM/hpVjDlE7bblRnOiL2U+R4oSMV6
sXK7pJda9nlJdHoHUPtr+Z/X93tZu0Xt4GYCVR9qxq1FqPJMNvGmQ1tBAed3rBYD
Cnzr1RI9NECz/GwDBeFbqMDGMUIEvXYpF8aJIRQzWujLmszxmo3QqBHsp1959EZI
uzYGJCbw8JDN4rMzy7kFH/jS4f4z57WeZ0aJKdbFHmjfh+5WSllNFtOe8DEgrdvk
UexAEiT3A0B8BtL9iethxyK69hEf3o0g8+Oqtr6mgfob2BOTurIuwM22HYk+Tvu2
vTWD4CfQg2eDPHTFTeB2i7V7rQqc1vC7W/QKpsLBxEDNxj6UDtkLu4YJavFZZTJr
i5NANpZzw6Qk8P46dI0KTdho0o9mZJ/ACB65EhlWNSvjUOHZY07VPQNcq0SK3UbP
d8QAru9klUePFokIl2FJuU5DKc+ya4bslmv5zsVZMbQMdkDQbVDZ871mJNlWIkfS
amkED5HzEyIF/vug9XAbSNp+cw4OdnQHu84XBFjGzKTfQ4GPfnrHwMC4E+HYvQfP
VUx8tQQpoSzxDDKt6qWEF/Ple0xmsu7v/33oDxCzSx89Yg0LrhoXEvS4oZECGSD+
NukmNbmOlWbH+3nXEGSAXh7MF0aryxEeFfVNRUDjdxZbNOtbbuQ=
=Ry3i
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
