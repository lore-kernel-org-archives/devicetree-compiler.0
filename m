From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] gitignore: Add cscope files
Date: Wed, 3 Feb 2021 21:18:52 +1100
Message-ID: <20210203101852.GG2251@yekko.fritz.box>
References: <3c39a6324ef2be64f839e6e6205f4afc63486216.1612338199.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XaUbO9McV5wPQijU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612348577;
        bh=yOes0cb9EdY33OohFDJD8sd0UqosrZo6JjCCV7pjlfE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Aal6jvvuhFlf2vFyNVxRBU9pUBZou5+Rf7KGCYTUnAY6ibKpN9Tvy0tnpjIO0SXTR
         u3iKi2STP/0gZg/CtooXjrhBsVCHoF5IUucaoIAiFgcUMlb/tDKJM9ReKKoHsFCDB2
         9Dvt5ZzEIFnJ6cnxim/onX9+GKtvGGqtBB/yYw9A=
Content-Disposition: inline
In-Reply-To: <3c39a6324ef2be64f839e6e6205f4afc63486216.1612338199.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


--XaUbO9McV5wPQijU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 01:14:22PM +0530, Viresh Kumar wrote:
> Add cscope files in gitignore.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>  .gitignore | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/.gitignore b/.gitignore
> index 1f2a0f250a61..cfea8a434eed 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -17,3 +17,7 @@ lex.yy.c
>  /fdtoverlay
>  /patches
>  /.pc
> +
> +# cscope files
> +cscope.*
> +ncscope.*

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XaUbO9McV5wPQijU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAaeIoACgkQbDjKyiDZ
s5Kdsw/+Jsjk1x7PueIW61PijzBEoI6lniciu2vUZ5enTCSQZRuJ7Yl4rFJ7CLyv
SolTBZ/6pw9dWQrc5gQXF27rUEz6OoZQzMgC84SiQRyc0Ocr+wQK2g2/1B4LYp5Y
jm/FmBQCdK7E7uHQ+vNc9WKowoAPti9L0DKCFh3Umr2ryYbqVm/6rOsUlTMcXgpA
si0TBnlp9Rf+EI7edf08hksa1GLnx5LLnFkBlq2Cyfr1e6Un7Ri8lxiwbz7Ha8py
o2il1ja9z+CbwdquvET31Tnkl9PyzHvD+6YBXIGPqXQsjwgdiL4JvYtso89V9M4d
IPiq6FNLMDHiGVYOlhvsOElZJ297mFimRERv8qg0mXIucYbqKARyqOgRM7qcawJa
iAP3vEurx2vrkbZK0XC1IfNjN74alT+ICH4UwKxhTvqiaadFCViJ50Y6nJHF5odW
HyKkUN244qTbpt1TApdEJhAlRJmKfU+IoDZOvTTjH724Fztjy2LDEMpy36qGJUIK
YE6Qj5MJG5PaZivRHVDz6229GDuw5SmrOBDf0k2bSEDwXhxLW9/JubuYCLRVXq9u
LL0+2ry+WcFhF+9tPVEvSsLdyJgUSvyhoTEetqMQPhPAbBwxY3aicsG0KuJH1kIT
Mm+wbYi99EZrUDNDh8kFreCqQpUxVpk3nbKgEEIiEnSRAUWtJNY=
=KGv+
-----END PGP SIGNATURE-----

--XaUbO9McV5wPQijU--
