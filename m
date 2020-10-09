From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/4] pylibfdt: fix build-lib location
Date: Fri, 9 Oct 2020 12:00:52 +1100
Message-ID: <20201009010052.GF1025389@yekko.fritz.box>
References: <20201006082712.241224-1-marcandre.lureau@redhat.com>
 <20201006082712.241224-2-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="V4b9U9vrdWczvw78"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602205280;
        bh=Ivz5hQeLaIrpJat0ShhP11LwwisFhghBStFqlh81z2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H9pmlauc17qYTQ3iW/uXeal87/XXVRjYArpMZocvZ9XDonEdRoLL+fI/xCftNLSnc
         RSVetRxChLQCUtK3/7QJJTFjGaKwRo+891T4wGKUzcqXWRxmQ3GWUtlWOI3M/MCsGf
         9vzvtwQC3znVAFpNk1c5NWIhm6p0rkArOVCKs99E=
Content-Disposition: inline
In-Reply-To: <20201006082712.241224-2-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--V4b9U9vrdWczvw78
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 12:27:09PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> setup.py build_ext is run from top_srcdir with the Makefile
> build-system, due to Makefile.pylibfdt inclusion in top_srcdir/Makefile.
>=20
> --build-lib=3D../pylibfdt will produce output files in the parent
> directory of the current directory. Ex:
>=20
> ~/src/dtc$ make && ls ../pylibfdt
> _libfdt.cpython-38-x86_64-linux-gnu.so

So... this doesn't happen for me

$ git rev-parse HEAD
cbca977ea121d7483b0c2351b17dca08a21cb1ca
$ make
[...]
$ ls ../pylibfdt
ls: cannot access '../pylibfdt': No such file or directory
$ ls pylibfdt/
build/  _libfdt.cpython-38-x86_64-linux-gnu.so*  libfdt.i  libfdt.py  libfd=
t_wrap.c  Makefile.pylibfdt  pylibfdt/  setup.py*

If I apply your patch, then the module ends up in
$topdir/pylibfdt/pylibfdt instead, and make check no longer runs the
python tests.

So.. why it's behaving incorrectly for you but not me, I don't know :/

> Fix it by changing the build-lib directory to $(cwd)/pylibfdt instead.
>=20
> (note that setup.py install will rebuild it with the default 'build'
> directory, there doesn't seem to be a way to override that)
>=20
> Fixes: 1e4a0928f3b3b827824222572e551a60935607e3 ("pylibfdt: Don't have
> setup.py depend on where it's invoked from")
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  pylibfdt/Makefile.pylibfdt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> index 6866a0b..0c07224 100644
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

--V4b9U9vrdWczvw78
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9/tkIACgkQbDjKyiDZ
s5Lfgw//StBvyuUbzPbyLd08dShToz14lD7zPFCxG6vznNr6/3LnCBImy1AtxXpy
z2lLnoqoTrynZefi0fUhzf7YMLcE3wuncEFM6sSte+L3AEE5RmrztY4NtB4RY5Rl
FFF47E7/8Ic0k3fWPw2qhd5m+SkjipFmQa5szhn6OqQpbsxRl0rwtPoYBcjAiPH2
U6UDVT24kfzJ+JoCTtLV3vB0KntISqso1NHkAAOWJyLxvpj6hraarO0Vl9wK7LX+
frfjDZ1cFO3xtwW5guMWsoqYAqGm6hvL0NxvqiDLicw1wrM3YYkv+7zv87bq5bSY
wm+SP9VJRApgyat+NYSjlAUSikHXNYtRqiSaaFPszj3GMese05MxWMUOqDpCiWcH
On+wOuyY1d+I8/mEpQWgZlp3J5jnpJUsi+S3cCP9ou7Ncg71UHjNzmVgF2IVImav
aDNtJhRB6o/NdvpESXdDuxBN3bNTnsIrvlAZmNr5oQIt3Dk6Zq8Hu306s5w7UJsa
DpoGDEDzlDzQj6t8A13w4bKa9RoB2GpITHGoPtKvEwFkdKLhQIrh8hBZx9A+96xc
7BI6AsrLUF6QVWcNj77UKmJzCjAiiNvL73FamfDs3Xtkt0rpobs5OWMNnO4jWRpb
jVhAghNwplGMinAFAtjeIRnJ55ic6qvxaFCoK2UqHXl+8PADHls=
=2viw
-----END PGP SIGNATURE-----

--V4b9U9vrdWczvw78--
