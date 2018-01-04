From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Makefile: Split INSTALL out into
 INSTALL_{PROGRAM,LIB,DATA,SCRIPT}
Date: Thu, 4 Jan 2018 18:25:00 +1100
Message-ID: <20180104072500.GC24581@umbus.fritz.box>
References: <20180104034923.2919-1-kevans@FreeBSD.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EpsErgVOvBDllgej"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515051605;
        bh=a/SPl2eTGrcvEoARUbIAO0RsLS4AgL+v48deXM1Ouvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I3aOZ4c4LrpRWKNaLp9u7REJvFuCdnaXnLjgbtRHzfHma4P5jqGXCfxd5lRN+GotA
         XyvUnkSuQCn3B+BXOYXAReeaFduE26nqOprVt2DOGSaMeokgbNPAVUuL/t31hJBzOb
         NC89reM/7VapPfBLsuJDRaof4/hptSIpmXj3S6r4=
Content-Disposition: inline
In-Reply-To: <20180104034923.2919-1-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--EpsErgVOvBDllgej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2018 at 09:49:23PM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
> For adoption into systems that may have additional arguments to be passed=
 into
> install(1) upon install, split out INSTALL into the different types of fi=
les to
> be installed and use them appropriately. This allows, for instance, passi=
ng -s
> to strip binaries and libs while not botching directory installs or data/=
script
> installations.
>=20
> Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

Applied, thanks.

> ---
>  Makefile | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 9ba8121..5f1c274 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -26,6 +26,10 @@ SWIG =3D swig
>  PKG_CONFIG ?=3D pkg-config
> =20
>  INSTALL =3D /usr/bin/install
> +INSTALL_PROGRAM =3D $(INSTALL)
> +INSTALL_LIB =3D $(INSTALL)
> +INSTALL_DATA =3D $(INSTALL) -m 644
> +INSTALL_SCRIPT =3D $(INSTALL)
>  DESTDIR =3D
>  PREFIX =3D $(HOME)
>  BINDIR =3D $(PREFIX)/bin
> @@ -191,20 +195,21 @@ endif
>  install-bin: all $(SCRIPTS)
>  	@$(VECHO) INSTALL-BIN
>  	$(INSTALL) -d $(DESTDIR)$(BINDIR)
> -	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
> +	$(INSTALL_PROGRAM) $(BIN) $(DESTDIR)$(BINDIR)
> +	$(INSTALL_SCRIPT) $(SCRIPTS) $(DESTDIR)$(BINDIR)
> =20
>  install-lib: all
>  	@$(VECHO) INSTALL-LIB
>  	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
> -	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
> +	$(INSTALL_LIB) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
>  	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
>  	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/libfdt.$(SHAREDLIB_EXT)
> -	$(INSTALL) -m 644 $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
> +	$(INSTALL_DATA) $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
> =20
>  install-includes:
>  	@$(VECHO) INSTALL-INC
>  	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
> -	$(INSTALL) -m 644 $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
> +	$(INSTALL_DATA) $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
> =20
>  install: install-bin install-lib install-includes
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EpsErgVOvBDllgej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpN1skACgkQbDjKyiDZ
s5LE9RAAtbCIOvVVB5WzEWgOlZFayNGv/XiLlTfCnKrpLOLQErBb+PELdaqmWGz6
UxL2dTnVe7rpNSfqpEn4OjbjgvoCFhVUXXREPAnmAROYu8B7n9T8s7k51HcG2PHI
X0N8x/UAi0tZwI963hPB7pdipAsKSP+r9W7K0wGZRfKTpkPhV/iB8Cy+JdUJR9ud
QnUJjFtooz5ukHcZosvb6HXl4vdzQZxhuz6pbQ/N72KcELslg9wRdfMIYMS+ppZ9
07/dph1a3KoVJ85qVQSQ+9INlABz8MI7NepMA2saJHGuoshPLAiM+awH+sVokvyt
+45QJ9uk8NKL+1T4k4t7ODXrZyBHtGzoo0uTpmxd3ZOfjk1S0R/qNRgwpi3eddVp
0d5IYflgXbZUYFfYEsDqK+BhpygrMwY/Jnoe/riW2oAh48rWiTfFOmYsNfc3qEFt
x3NFUxtxoVmxMAh+vgxkJYV1Y1CIfe6D+SgRAmg3dPamgYtU4wOrgbFw5mZZC72Z
BIIJQy4xJSNNRWkSKADk7LmmrCsEJXCQNbwPtanib1imf0+y7sOQgx/8Ki21q8yG
a7fv1X7Ci50g/6TmLHCqbfwi+PsBmqFdyEMYV5my9wRrd7WCBKO7VTQkwmrus0UO
IKXNVJ6tc0ojzs0Uq4K9KS9EbovXcIyVbUoY+abzGHR7pnf36W0=
=uI/p
-----END PGP SIGNATURE-----

--EpsErgVOvBDllgej--
