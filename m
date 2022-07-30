From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] manual.txt: Follow README.md and remove Jon
Date: Sat, 30 Jul 2022 13:51:09 +1000
Message-ID: <YuSqrXnvVOgcPyHO@yekko>
References: <20220729131019.806164-1-ptosi@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Gh3yd0tgCHVLMPtj"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1659155696;
        bh=wGkFS1MWGw5mRzkV6yRuSfc39xq3DO7yTLzPT6PzPBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EgR0CL9gY9mM/ekipnNUBb0DDWNaMgv4n5jHmA3kj8VWLP3mRid6esUWkf9jaoBsH
         PCNLN9nIIRCzXyDiSU9IssjU/ZG0rAxCmoSNwo71Fsj+lUjH/MprMAGDOy5wEiNMh8
         fe+RpnaQ5+2cvdjvpYWgifs4JWuZNNdBgB2l4NCI=
Content-Disposition: inline
In-Reply-To: <20220729131019.806164-1-ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--Gh3yd0tgCHVLMPtj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2022 at 02:10:19PM +0100, Pierre-Cl=E9ment Tosi wrote:
11;rgb:ffff/ffff/ffff> Following 0ee1d479b23a ("Remove Jon Loeliger from ma=
intainers list"),
> make the "Submitting Patches" section of the manual.txt consistent with
> the README by requesting patches to only be sent to David.
>=20
> Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> ---
>  Documentation/manual.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index cf4b253..2087a4d 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -43,9 +43,8 @@ The gitweb interface for the upstream repository is:
> =20
>  1.1) Submitting Patches
> =20
> -Patches should be sent to the maintainers:
> +Patches should be sent to the maintainer:
>  	David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> -	Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  and CCed to <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>.
> =20
>  2) Description

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Gh3yd0tgCHVLMPtj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLkqo4ACgkQgypY4gEw
YSKv5BAAxRzHEyyAmAYtSrSH2boX7+9FSFHfFtB+qZSErdEwpwQ3NXvEivgxiD5p
egQmfRzgzpOQ9/8oEVfTu8czxOSGii63f4w5KUdKLWWcZmaXgrrTGFt8ihbIZoTi
4QG+uiq7k5p2yivPM/NWIdNWNljaqqXnxS3+xPivnAes/6F0EEOMpqum2d0ILIWA
2q3dpu9DkPOQVuWF1St4IcP68pZwgA9I0sQmyGS2M9BK9bi/sWus7FV6wYPzWFOG
4TI8jdlPt7RYMo0Y5th4S04H725o6q/aNsmIDFmces2uVuahI8OxyjtrgfJyzWO6
u5OCVwSWjz/4jMbbIL4Et3GQnLoT5pPh9oqBpyCeVmYI/zWcptUrQQa8jjQMYEin
0Ng5uP2cqV29gnZuLDqo4zPwybD62LGwqLsiiubU7ijvrWOv4RNa+i4lJhMKqiCd
59PrQemw0QF1q7lGM8RzfUF/S9vG3JwovuqvR7cWpoJbCrRu9yBrwFfSIgU2H8wA
I5xQcVRfIWCXmTt3qKyiFkI2/dUYi8mwlgmeFAy6Ju0VhLz8L/mLL0QDQj/pqS/a
JYM2VXfYxL9Abkg5A8fx3lH1is9uqIwIqdYmfa+i1pMQJtSVIf5cKynkQAQDH8X4
AMLjDVJ4AoUcRUP+jViHPI3gcXIRqntZMyv7ARrBvU/lgfathcQ=
=viCN
-----END PGP SIGNATURE-----

--Gh3yd0tgCHVLMPtj--
