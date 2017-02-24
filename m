From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 5/5] Build pylibfdt as part of the normal build process
Date: Fri, 24 Feb 2017 13:55:53 +1100
Message-ID: <20170224025553.GM17615@umbus.fritz.box>
References: <20170222043340.17008-1-sjg@chromium.org>
 <20170222043340.17008-6-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YS7t75H5cNTCpbja"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487904959;
        bh=9yxqyxlht/1fTizL2nwKAJqAr+KcxvMq2rf+IMNc7NM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kaMFlJvAK4tZPbew8e27+i4UwxRxhLrRjDmYCUa3qNIXaf0wa0bLINYEe2rGCuhRf
         70qFnC1w0pev1YBeBoeow6IxA2D0jMbHcEVWG/mDjYM+oV+I8Vm82qjcURGVPSGmmW
         CP3zMwiSdfe7+koUPnl7pupz60fCMuui4TpEGMkA=
Content-Disposition: inline
In-Reply-To: <20170222043340.17008-6-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--YS7t75H5cNTCpbja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 09:33:40PM -0700, Simon Glass wrote:
> Possibly this needs to be made optional. For now just hook it up.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

My one concern is that I don't want to add extra dependencies to the
regular build, particularly not ones as substantial as Python and
swig.  Can we rig the Makefile to only build the Python library if
Python headers and swig are available, otherwise just turn it off?

> ---
>=20
> Changes in v7: None
> Changes in v6: None
> Changes in v5:
> - Fix 'possible' typo
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  Makefile | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index 1c48210..4adba10 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -116,7 +116,7 @@ BIN +=3D fdtput
> =20
>  SCRIPTS =3D dtdiff
> =20
> -all: $(BIN) libfdt
> +all: $(BIN) libfdt pylibfdt
> =20
> =20
>  ifneq ($(DEPTARGETS),)
> @@ -203,6 +203,19 @@ dist:
>  	cat ../dtc-$(dtc_version).tar | \
>  		gzip -9 > ../dtc-$(dtc_version).tar.gz
> =20
> +
> +#
> +# Rules for pylibfdt
> +#
> +PYLIBFDT_srcdir =3D pylibfdt
> +PYLIBFDT_objdir =3D pylibfdt
> +
> +include $(PYLIBFDT_srcdir)/Makefile.pylibfdt
> +
> +.PHONY: pylibfdt
> +pylibfdt: $(PYLIBFDT_objdir)/_libfdt.so
> +
> +
>  #
>  # Release signing and uploading
>  # This is for maintainer convenience, don't try this at home.
> @@ -247,6 +260,7 @@ STD_CLEANFILES =3D *~ *.o *.$(SHAREDLIB_EXT) *.d *.a =
*.i *.s core a.out vgcore.* \
>  clean: libfdt_clean tests_clean
>  	@$(VECHO) CLEAN
>  	rm -f $(STD_CLEANFILES)
> +	rm -f $(PYLIBFDT_CLEANFILES)
>  	rm -f $(VERSION_FILE)
>  	rm -f $(BIN)
>  	rm -f dtc-*.tar dtc-*.tar.sign dtc-*.tar.asc

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YS7t75H5cNTCpbja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYr6C4AAoJEGw4ysog2bOSyOsP/28r7pcVIJpeY3HBs1YMjJ02
VpsKzM+lpI6wM9Vr1uhxJJicAsaFnAT3+K1j5VfXG7A+N6mqP4UVGIt1C/98Dcvx
bvLqms5Eu/2v+lQr7kG2B/+Fn41OkiYeGgbTp+fFcFWaIsEqhSPu+duBaGxY0t9C
plLISBqpgICxzXcIw4pFqL2+C5clozp+fSqvYeZPZJO5044BnfPny17n+vjSGtUq
ynhQPpXFLWY7vWtA/ic6BTTeqvLXbnpztcshKcwO94Et9TUir3SrHd8xfj7ZyaA4
/IjKLgXsRjat146suA191+Xm3WwH/rqFlK6i36V2BOyppoo+ArSKXbPtWgt97Vjf
i8iixuZXPtN/S8r74oEls+r6kZVrMEU/m+2Ek/e2y/ENwwtwZ1uOyt8ziTalLaSx
9znFnOJIOCfwTOB/YrlT8cvxH4Qg30oZA3UcjDB+klyZ53hwh51ZUbs5O21NcwUc
Kaq9+5nui3WW1siH+h6dPU218n7nceFqcqVmAbl6W0UfdOw3QS9zKtk63lSZoHBA
A5TwDc+ZipY5lF5Gjhv+oB7EIHUV5LMV6jMtcp48Eg1b8/oHvd0f1Ov5I2w16uBs
+kFpfQ70P+YeKhYB8IAY8chlCb5qyW0V5ZEtxFv2LF72fWHm4tmle48qcllrpgzr
LE3+lE/xHg12kAzFJk7q
=tu6b
-----END PGP SIGNATURE-----

--YS7t75H5cNTCpbja--
