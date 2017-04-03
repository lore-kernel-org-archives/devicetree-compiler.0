From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/7] pylibfdt: Use environment to pass C flags and files
Date: Mon, 3 Apr 2017 14:42:22 -0400
Message-ID: <20170403184222.GY24205@vapier>
References: <20170326190623.27518-1-sjg@chromium.org>
 <20170326190623.27518-4-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ghgy3zzpkChQqL5M"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170326190623.27518-4-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


--ghgy3zzpkChQqL5M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 26 Mar 2017 13:06, Simon Glass wrote:
> --- a/pylibfdt/Makefile.pylibfdt
> +++ b/pylibfdt/Makefile.pylibfdt
> @@ -7,7 +7,8 @@ PYMODULE =3D $(PYLIBFDT_objdir)/_libfdt.so
> =20
>  $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
>  	@$(VECHO) PYMOD $@
> -	python $(PYLIBFDT_objdir)/setup.py "$(CPPFLAGS)" $^
> +	SOURCES=3D"$^" CPPFLAGS=3D"$(CPPFLAGS)" \
> +	python $(PYLIBFDT_objdir)/setup.py --quiet build_ext --inplace

you should make setup.py executable and drop the `python` call here

> +files =3D os.environ['SOURCES'].split()

you could parse this from the Makefile

> +cflags =3D os.environ['CPPFLAGS'].split()

this should be:
cflags =3D os.environ.get('CPPFLAGS', '').split()

>  libfdt_module =3D Extension(
>      '_libfdt',
>      sources =3D files,

python style says to not put spaces around =3D when it comes to args
-mike

--ghgy3zzpkChQqL5M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAljil44ACgkQQWM7n+g3
9YEgjg//W2Bfj8U+rcJDW+NuNN15YVMJdGWJS+nk3Cf4Pn8ad2j8Ql1y2Q7+OzcU
ZIt7KUJP1G+o7t7iMDq5svpv8b+VNABbD9BkImqddQojRga1D9ORJIr3Dt5jGIn5
3zBDF3d4NY8PE5bLJ8y4bXCRyJMK1xTI/YN7ltmwwqlpcRGIKxsQr4OC/noATORc
EDdQzE79Pyv0AEYpUZuuOmR5GjkaDbF8xvMx4CjLySoS8eMQk23kNjEK05TwhlSf
xeflVgYj2HJelk1FB0bblZrxfVwwgUv2wMUkLzhbKUXn6lyjnrSq9gb0v5ufwvqA
uBWLGzrv9iH/uqaoQY7tQ2zkSef5r0K4QCsm3gsHZ9eYTqn2ZxRtxNfk5Tov+h72
A/1Y9hXX36bSbj+YQ2GvrPy3RpQN4tNlzJrZ9QITbh77fjhrnpIMwrjh+BBqttOk
8ytuI3i0BV/8J0GQj8l3lrDs/6/O0Q+4XFooJMf7NtGT5EL0Oqjs1MgKuNVB4mnu
vaoGS59PwF+bwRAWkqydMHb1ElGqShknnBuFQuFs/0m3PQZ8/i/0MmbyvD2oReYw
pdfKosUQHcUJvWCzx2VNSxuVy+fOQ9tlPGt9xLokZi/pzX1IAn2r9fDcfHh+HY7j
+I+YTgKhRUdpSopR4j9Y768fKulCN+jh8g1xnfEvgERtXeBG8uk=
=pd0Y
-----END PGP SIGNATURE-----

--ghgy3zzpkChQqL5M--
