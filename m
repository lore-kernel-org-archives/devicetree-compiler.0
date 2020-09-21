From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/4] pylibfdt: fix build lib location
Date: Mon, 21 Sep 2020 16:33:25 +1000
Message-ID: <20200921063325.GC17169@yekko.fritz.box>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
 <20200915192705.1716282-3-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600670767;
        bh=2eUXTr4vJY3GQtvpGp1HjkHbggfv2jx2WtpLgSEOy8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KSv2AleHO8yvinWCFlhWGXeO5ltVbfCFclfxx7NkznyJBkXq8rh1wz4eUwum8k0Va
         DGz765ss5twLslMmzaRt9QAALQ1fDwZbBtXo/2/SMlDmBgbhnoMY5Ermk6iKmC4i/B
         dU4EnuOqqG8D2RKHRZrnkg8R+Mq3O2qjuBLBbE6I=
Content-Disposition: inline
In-Reply-To: <20200915192705.1716282-3-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 11:27:03PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> setup.py build_ext is run from top_srcdir with Makefile.
>=20
> ../pylibfdt will produce output files in parent directory.

Uh.. can you elaborate a bit on what exactly ends up where, and why
the new behaviour you're setting up is better.

> Note that setup.py install will rebuild it with the default 'build'
> directory. There doesn't seem to be a way to override that.

That rings a bell.  ISTR it being a real PITA.

>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

> ---
>  pylibfdt/Makefile.pylibfdt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> index 32ae1c5..1b5f236 100644
> --- a/pylibfdt/Makefile.pylibfdt
> +++ b/pylibfdt/Makefile.pylibfdt
> @@ -18,7 +18,7 @@ endif
> =20
>  $(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP) $(VERSION_FILE)
>  	@$(VECHO) PYMOD $@
> -	$(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=3D../$(PYLIBFDT_=
dir)
> +	$(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=3D$(PYLIBFDT_dir)
> =20
>  install_pylibfdt: $(PYMODULE)
>  	@$(VECHO) INSTALL-PYLIB

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9oSTUACgkQbDjKyiDZ
s5ICfhAAlOg0DsFzNSKo878W6s2YHkElXeypB+7m+OAAdkCylBqPVyKoERUva4jd
eHPfUX5dNks3ElZyggeE20d7vfzl/t/5owjq5MZzMGA/tzxJlWPuwT9zNDMc9KXj
7oWXlHBwwscGudFptuRgaBtAfsj/+IpjOoMdvnDH7Nhi+ZLvZ8cVstfgZ4Sgx8CW
Sh6nUjlLAvQ4hJI042OaMwjaZx8mM3/400jY7pJbqHbFi0jtCxxniUZFWcMdg9Ft
brWuINe4bPIUZHh5zK1KvwBa3EHksW0Gny2LMThN+MFUOqP2Iex+NE1nAN2wcyjM
JpXpH+OW2TPJJZV/dbI1fp9ijJtfYA2PPzBdMdUCepqu7GTxpWK+ceSSWRLxpPj9
0m0ukdR2t/32DJAd85DG4tYngg30blCc5SC+HT4rO63xZojU1Ge0GCHnJQ8u1bzK
IFQusEWh0wSiv3t6kxpZ7CAulfrDGKTdkISorAbwWwidw/OcTjD6Sh0XBt23D6+a
msIcFoiivAlkTePE3hZ9ZPmlDekPSWW5Hw0uvqpr88muBIYqHbQgQo01Qc98AxyL
FBWMVMssETdSBAh+rksaQYDd6WJAeF+Jo9HNmHMSww4Z7JMjqhoqlomDbFLhqy15
AzbFtfKpyrRtCx1kAhmfl478/lG8dHWmERfKffw7EjunU7fC4fk=
=hN0c
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
