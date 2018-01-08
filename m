From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Avoid installing pylibfdt when dependencies are missing
Date: Mon, 8 Jan 2018 17:55:17 +1100
Message-ID: <20180108065517.GE2131@umbus.fritz.box>
References: <20180105185412.167666-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515394771;
        bh=6k9o9PRUi5+y5TmsN64ql0cUkdz+qH5Dv/HH+8odNvA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dwpWtd0OvPHhNwIsWT5fgyizAPfTjvT1iGIx3iN2yX+o45JVy0uhR4VnNR9oLs/fQ
         cz1BrqwE81nYWQCwPodfs+Lty2BPY5E7uvC7dneKwkDtfg5UT2BK778alRXDJ84ccm
         FJg58tq6rBD2MjQVFoi/Hayp/Zf19cg38dcjvs4U=
Content-Disposition: inline
In-Reply-To: <20180105185412.167666-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2018 at 11:54:12AM -0700, Simon Glass wrote:
> At present we have a build check that python-dev and swig are available.
> If they are not, we print a message and skip building pylibfdt.
>=20
> However this check is not currently present with 'make install'. The
> install is attempted, and fails. See crbug.com/789189
>=20
> Split the check out into a separate script and use it twice, once for the
> build and once for the install. This corrects the error.
>=20
> Reported-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied, thanks.

> ---
>=20
>  Makefile | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 9ba8121..fffb80e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -126,19 +126,23 @@ SCRIPTS =3D dtdiff
> =20
>  all: $(BIN) libfdt
> =20
> -# We need both Python and swig to build pylibfdt.
> -.PHONY: maybe_pylibfdt
> -maybe_pylibfdt: FORCE
> +# We need both Python and swig to build/install pylibfdt.
> +# This builds the given make ${target} if those deps are found.
> +check_python_deps =3D \
>  	if $(PKG_CONFIG) --cflags python2 >/dev/null 2>&1; then \
>  		if which swig >/dev/null 2>&1; then \
>  			can_build=3Dyes; \
>  		fi; \
>  	fi; \
> -	if [ "$$can_build" =3D "yes" ]; then \
> -		$(MAKE) pylibfdt; \
> +	if [ "$${can_build}" =3D "yes" ]; then \
> +		$(MAKE) $${target}; \
>  	else \
> -		echo "## Skipping pylibfdt (install python dev and swig to build)"; \
> -	fi
> +		echo "\#\# Skipping pylibfdt (install python dev and swig to build)"; \
> +	fi ;
> +
> +.PHONY: maybe_pylibfdt
> +maybe_pylibfdt: FORCE
> +	target=3Dpylibfdt; $(check_python_deps)
> =20
>  ifeq ($(NO_PYTHON),)
>  all: maybe_pylibfdt
> @@ -208,8 +212,12 @@ install-includes:
> =20
>  install: install-bin install-lib install-includes
> =20
> +.PHONY: maybe_install_pylibfdt
> +maybe_install_pylibfdt: FORCE
> +	target=3Dinstall_pylibfdt; $(check_python_deps)
> +
>  ifeq ($(NO_PYTHON),)
> -install: install_pylibfdt
> +install: maybe_install_pylibfdt
>  endif
> =20
>  $(VERSION_FILE): Makefile FORCE

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpTFdUACgkQbDjKyiDZ
s5KqFA//WUxf0pLCLOkcJ5HPHWtYeVEdolhHqnCQtq0gTwaxMZZd945JfVYkmux6
8tcj1vbxAxc2VDLgQtmYE1iIrqUlRIoakg2zWYD7u05E961zth4UASrYUpdQtIKB
28vMsD5ugBD4DCOvjqNdmA+N6OSiHRnfAua6ec+vCpTe0RjqgBRZxQIExeeOt9Uv
pvA5ucuwMY+sCDndHiglECs4dN2bwKietgZbrmMpamOhKgw/Hq8w8O+dywwFXfWR
BWOhgq1nkXJMKHUXgM41fkE0nIASsq5e6j/ATr6Rg0kh2mTxS5TxTsD9NUjCKLRQ
FV4rkzk/AvCoGjcyntz62HLqxHzI5k5G9PMjXLTjT33L0HtqtwWXVXLsEJ6NMV/V
A9ZSEFMef9C45z5qRakn6oD50I7jCPkXQNFPEZVPOV44c40ZnVFBBasQrV3Ydlvp
H/sk8QwsNDDh9sZpvPqW3xNScC5JAnsf8KgaLVOpDCEsg5/WdMW4BWK609OtHcct
OVQHc+xFaW+Zd9ZIdQ+MUf9gvMX7YBwrE0h3hs9T4tlEJcArj0BoLJsN/JBcbNXC
i0OITP1B4PGVq5KEPS97HrLaGQlkTNzLBimDvBbLYDki7VZta4yZcbdPElq3I1YC
PJIcU/Ucg1TMadV+9wsu6kUhR4MhvsvSB35GGrdewz1fpmXMr1A=
=TZ01
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--
