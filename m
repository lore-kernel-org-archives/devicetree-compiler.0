From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] gitignore: Ignore the swp files
Date: Wed, 3 Feb 2021 21:21:54 +1100
Message-ID: <20210203102154.GH2251@yekko.fritz.box>
References: <15496f8669ac2bb3b4b61a1a7c978947623cb7c3.1612346186.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="54u2kuW9sGWg/X+X"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612348577;
        bh=hQwrRjpu6as1W+5WFKllKS4GVG0VrvXkraAjgYayxic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=StryB/JeFCrVe4VPox/bvOmtYfjKVyphbohDw9YBEkdt79BwJpJbyPIO8FhK7WgJF
         U6zCz3uzoXimtl9OMAlvStJViCNdvcTozokjgdMa2Iw6N8Sivlq9tcC5dFdfO4lNm9
         CXcVoVf2jgwCqHq5j6yQX+QoN9GtKv6zTR0UiGrQ=
Content-Disposition: inline
In-Reply-To: <15496f8669ac2bb3b4b61a1a7c978947623cb7c3.1612346186.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


--54u2kuW9sGWg/X+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 03:26:36PM +0530, Viresh Kumar wrote:
> Ignore the temporary .*.swp files.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks

> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/.gitignore b/.gitignore
> index cfea8a434eed..8e332d8d8e07 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -8,6 +8,7 @@
>  *.tab.[ch]
>  lex.yy.c
>  *.lex.c
> +.*.swp
>  /dtc
>  /fdtdump
>  /convert-dtsv0

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--54u2kuW9sGWg/X+X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAaeUIACgkQbDjKyiDZ
s5KXARAAiqV6Z+UT+vi3Z9Icce74R+9jYlg7Zwbf/W/ZfP9NVBB9JWS6Ap27fWLR
rX20jTr7sLajnSrsjIbmERv/KyGGoxqVJvCjuZ8TUjLJc2HIA1KMHkecAqNYcKrm
5zFMUKVxU00GqEjDtP9DKzm1nBLB6IP5LRZ5Gl8XB+U+2cIy1NfJ9gq1rGoxiU72
ev+edPamdX+7jsEI/uNipp41jH2QJiVE7GD/Tkmb7GZI3eAzjaRZ7y0OJ/oD0vVJ
Xzact4sHKHrq93LXCKur/DBrd8dXV9XBpk7H2aRqIE0FaQBMfQCxEcFmAS2rIYuH
mO4EELMKTz8azK7YS4UCqvC01+9D1eAsAwcirGt0L0uOx/QHwbqDbvsC+sXiWerv
nVwrZq6uaxyJ90wlTO8gzz/wKfCdUMoUV9oLWIhOZptUVTb2I07l3y8BiAfO7Od+
AlSKB2RqTBzUM/KipRbcqXGpVIU6gnfZDtoHjYflkIt52nbwnkQHkLxc7iQGGhjO
0LzqP7o7qOfCuzXl6YmR8zyKx93HUQhy7PL3qgcWHS7E4O4V41DVIgSt17LmI/sP
3yWkNHJm1z9V+AuKM6hm5eCmb01orSyOgxb9KoPEUKMhJQc/Wb+asNHr+FqW372D
g4esiqlc69jviUIRpu3tonR3RKJVV0OcwLCnDedA5w48h8dCOrk=
=DZGl
-----END PGP SIGNATURE-----

--54u2kuW9sGWg/X+X--
