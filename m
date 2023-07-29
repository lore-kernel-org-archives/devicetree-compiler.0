From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Makefile: allow to install libfdt without building
 executables
Date: Sat, 29 Jul 2023 13:08:29 +1000
Message-ID: <ZMSCrQzkV9zTZ6LM@zatzit>
References: <20230726144336.677135-1-nico.escande@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+JTENWKzkvYz090G"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1690603110;
        bh=g2GhgN6croHekyDtmzTTH8VdPmeO1qjqOJh2F7J0UYM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h2Vlm+7E9qZYFco6Wdvdr4kVwMM7h9nLKvMumrQsOkAkd0lEvM2y25kXMXOxv5Blj
         qT1Zdz5H2sHaPVVbwKp9Whui+WhiXw48r4hPw/gQDXB2PnTnBPFB7hcTOMNr0QIvGV
         WDzEvPoO55WJFMNxY77kcDubEeL6bWQGCJd9+G5I=
Content-Disposition: inline
In-Reply-To: <20230726144336.677135-1-nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Nicolas Escande <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--+JTENWKzkvYz090G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 04:43:11PM +0200, Nicolas Escande wrote:
> When we only need the libfdt calling the target install-lib also builds t=
he
> executables listed in $(BINS) because this target depends on all
> Instead lets make install-lib only depend on libfdt.
>=20
> Signed-off-by: Nicolas Escande <nico.escande-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Merged, thanks.


> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index 784e2f8..c0b68a2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -238,7 +238,7 @@ install-bin: all $(SCRIPTS)
>  	$(INSTALL_PROGRAM) $(BIN) $(DESTDIR)$(BINDIR)
>  	$(INSTALL_SCRIPT) $(SCRIPTS) $(DESTDIR)$(BINDIR)
> =20
> -install-lib: all
> +install-lib: libfdt
>  	@$(VECHO) INSTALL-LIB
>  	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
>  	$(INSTALL_LIB) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+JTENWKzkvYz090G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmTEgpcACgkQzQJF27ox
2Ge6wA/7BurffGjit0JT4arD5W986e6jCvDlSHUUpFy+uGAMh7O+MJVP2Ej08ZZ1
6Y5xAY+gUX7sMy8yT0oR4zBmok8rzlEulZIebk/FGA9YGXJICWPmWERP2UgQo5yB
JxRcDXvgGLKe6LZ+/3bNJElqw5w7X5L9zLA6mrveK4KzRV54EQGZN10DIjFIdder
HcS65VzolgZXbv0415hiDZI9Dj2DOdNBjkV4+/B4awYCO/KSUfasbMXzbZiLkWXD
RxzuxawdGmEIV445hlC5qSl7aYEWW85LNy3cgPaUTsIqSkWqJwBgW6ANBA6bbukA
WK8WGHoN9xrxoJAGTaoNz3KnetKU0kDSY+RiAnTJ3zsqFS/sbJ88VjjfdNHXcgX5
WiatXXNa4NeK2XYy62Q4m4AF1M9vPP7acX64xunK8Z9WHHut/FxOIGZbBDJDc48R
kXdEohyOioA5FqUMuhoWF7NJwMzxuXiZQoGGLDs2J0AXSm1DSEdbthX8yEqhoUqO
uRJxOTLMEe/KFiDQeIu4hrN+9sAJ2fkklfp5K0dZkP31pf1qIfk7qEAD6qs6YvLz
Dj2Jw6FnV9HOqFIzW1NJbogwpvp7dIKoVaMEzc84AbWd7ADhWfIeW9GpPuC6hAu0
UPvHql3eP5nF0f8A2uxLObjfecVHjSiq0Yt+S+LEPMn7Ocovg4c=
=A0tF
-----END PGP SIGNATURE-----

--+JTENWKzkvYz090G--
