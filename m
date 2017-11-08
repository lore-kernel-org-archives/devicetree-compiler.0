From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: Fix install location of libfdt.py
Date: Wed, 8 Nov 2017 13:59:46 +1100
Message-ID: <20171108025946.GA7732@umbus.fritz.box>
References: <20171107141741.1733-1-tuomas@tuxera.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1510112903;
        bh=rsQP1Ch818yMDNa2eT9tILBgHmSLrNRHU31/WtL1pJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o2UTRxrDgBcbmEtJS8zewoVUjNS6jJUztUQSeU4bJJQGTkVFznlzT8fytzYfxIAc8
         m5SwchVdCaOrt9aa4qdOGUMGKhpY2m/AnPFkeUfdQeNi0u4KnGvekwJh9oTZ2sMhlZ
         tzBya/EjF3kwdqjgrjyBL71Ci9hRtGx3g+ESvAcM=
Content-Disposition: inline
In-Reply-To: <20171107141741.1733-1-tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 04:17:41PM +0200, Tuomas Tynkkynen wrote:
> Currently 'make install' produces a directory tree like this
> for the Python module:
>=20
> $PREFIX
> `-- lib
>     `-- python2.7
>         `-- site-packages
>             |-- _libfdt.so
>             |-- libfdt-1.4.5-py2.7.egg-info
>             `-- pylibfdt
>                 |-- libfdt.py
>                 `-- libfdt.pyc
>=20
> That is, libfdt.py is installed in an unexpected subdirectory pylibfdt
> so 'import libfdt' fails. Fix this by properly pointing package_dir to
> the root of the Python sources, producing the correct directory tree:
>=20
> $PREFIX
> `-- lib
>     `-- python2.7
>         `-- site-packages
>             |-- _libfdt.so
>             |-- libfdt-1.4.5-py2.7.egg-info
>             |-- libfdt.py
>             `-- libfdt.pyc

This doesn't seem like the right fix.  Shouldn't all the files go into
the pylibfdt subdirectory, rather than removing that subdirectory.

> Signed-off-by: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
> ---
>  pylibfdt/Makefile.pylibfdt | 1 -
>  pylibfdt/setup.py          | 4 ++--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> index 9507d3d..2843ef5 100644
> --- a/pylibfdt/Makefile.pylibfdt
> +++ b/pylibfdt/Makefile.pylibfdt
> @@ -14,7 +14,6 @@ endef
>  $(PYMODULE): $(PYLIBFDT_srcs)
>  	@$(VECHO) PYMOD $@
>  	$(call run_setup, $^, build_ext --inplace)
> -	mv _libfdt.so $@
> =20
>  install_pylibfdt: $(PYMODULE)
>  	$(VECHO) INSTALL-PYLIB; \
> diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> index 1a1e832..49ab3cc 100755
> --- a/pylibfdt/setup.py
> +++ b/pylibfdt/setup.py
> @@ -116,6 +116,6 @@ setup(
>      author=3D'Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>',
>      description=3D'Python binding for libfdt',
>      ext_modules=3D[libfdt_module],
> -    package_dir=3D{'': objdir},
> -    py_modules=3D['pylibfdt/libfdt'],
> +    package_dir=3D{'': 'pylibfdt'},
> +    py_modules=3D['libfdt'],
>  )

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloCcx8ACgkQbDjKyiDZ
s5JeSw//bsy/VtqkL2pJeW1KGyLo4l7Ku8NXQwJIIlPWyHiMWMif/40mY+CT1SGD
k+j7cu4hTwr0E7Gd0GdomKzls6DAkm8Wxp2XEAUEJO1+fyXou9hDQ1g0k1FL8Bbn
kQtftZN3WqzjBP5g/tokX1pNO+VdbBEME5rih3LyDnqT8E5HZyZILTC2nmemTIdt
3RgtVBFSjcoECo5FOK7+S1oou29BkV58LqeehurOin7r1a45mUZpGK80wutAbPKB
PCZSPcPargPY21aObvYYfhcD8y60G8praqkSj1xRlF8t22z/DgVr8t95WipykTEf
6tngWDsEUHyd2Zemg1Ff6UFCy4NIoYorywUVrcSkoP7gV/XrRaJs6HQLFLtwcJbH
Y2L9StE1PWoTtdFHnaCcCrMrecB8M9b7ZkA/7xXLk1BLtOFZCmG3sEtbvAtlL3TE
KES0hnqf/2JW2e198bwYk+5RDnMlC0ucXj7rIoZ1ZDSFBTVLE/IQMN01rQwBwRIy
ZFTsCDXarkCTKMaT4rXQgnVrVm4kYwA0oBB/f4KDWRqvUjLq3Ef9uN57X/Lvu4Nf
m3rl7khx1YC4O8gBkq2uW3zujf8p1BxfxUlsPRav+tGMReTJnmvr+QppuIGjqT77
vtad0ppcWF4UGxSfFpYjte3Hw0OZwQbe/6AulkOKNqFDKug8mGA=
=e3Gk
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
