From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 1/4] pylibfdt: allow build out of tree
Date: Mon, 8 Nov 2021 16:14:01 +1100
Message-ID: <YYiyGZme2j3qGrbt@yekko>
References: <20201104194527.986901-1-marcandre.lureau@redhat.com>
 <20201104194527.986901-2-marcandre.lureau@redhat.com>
 <CAL_JsqL=panX9EW+41vTwsaWLtJbsY=opPPbwH+nnEGZSVnYsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QBfH0/FkjifinvRu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1636348446;
        bh=hYdaQy/WkoRyjZmSNdaCZ9pH9fGCHLDDrYtjqZSXyIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gKsX0n9vLDo0KqV6ZB1tER5p1ivhJIX2f/ejFMiI5dJQsEbo+ce3UeX3vFiKgGWVP
         T35X6VEgzLdvAF/8nCLrVzE01jsk/oO8Y9TRmHK5zhKYEN3Zp+KoROYby/EPDmvJoV
         QZx7PaajWG/R1mA29WvOOoyXs2EdTHRKvfRb32kU=
Content-Disposition: inline
In-Reply-To: <CAL_JsqL=panX9EW+41vTwsaWLtJbsY=opPPbwH+nnEGZSVnYsQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--QBfH0/FkjifinvRu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 05, 2021 at 04:01:38PM -0500, Rob Herring wrote:
> On Wed, Nov 4, 2020 at 1:45 PM <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > With meson, we have to support out-of-tree build.
>=20
> I noticed that meson still builds pylibfdt/libfdt.py and
> pylibfdt/libfdt_wrap.c in tree. And it makes the result unusable
> without installing. For example the README instructions don't work:
>=20
>     $ cd pylibfdt
>     $ python3 -c "import libfdt; help(libfdt)"
>=20
> I tried to fix the in tree part with swig option '-outdir', but that
> didn't work.

Urgh.  This has always fit poorly with the rest of the build system.
In addition, I've discovered that with Fedora 35, I now get this scary warn=
ing:

	 PYMOD pylibfdt/_libfdt.so
/usr/lib/python3.10/site-packages/setuptools/dist.py:498: UserWarning: The =
version specified ('1.6.1-g4eda2590-dirty') is an invalid version, this may=
 not work as expected with newer versions of setuptools, pip, and PyPI. Ple=
ase see PEP 440 for more details.
  warnings.warn(
make[1]: Leaving directory '/home/dwg/src/dtc'

Merely replacing 'distutils' with 'setuptools' in the code does not
fix this.


> Really what I'm after is what uses need to be supported? I'm looking
> at getting pip and pypi packaging to work. I'm actually wondering if
> pylibfdt needs to be so tightly coupled to the build system(s!) and
> source tree. The dependencies are really just libfdt headers and
> library which are easily installed either from source or a distro pkg.
> The '..libfdt/' references are problematic with the packaging tools.
> The easier route may be a standalone repo with a copy of libfdt.i and
> a different setup.py.

Unfortunately, I don't know enough about either Meson or Python
packaging to fix this.  Simon?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QBfH0/FkjifinvRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGIshcACgkQbDjKyiDZ
s5JK9BAAr+ocJLXJ/4RSAYtuUAwZiTW7QCPq7QUnTz2nLZuj40KlzbHAGn4njF1A
fPAfkScti5Mbririd9sv4jNdGRH5ScJ2InRag2fuas14PBzI5om/2dI9gWSwOUgh
aME1sEYADBCvXVNbUUFGL5a7tgrhnEyUelO2Sx2Kcccm//lPMwUW4d0UfOBH2hOu
tKusHvx8QFvKJhtZuzQqkt8kCNMdOsjMCsdl5QlAMm8vTgsE4ec1+PbaiIlTHzTj
mJv6h+H4CaCjX3jnu620vNWRD5D7NuP0XZwbzE/DqfB5pLWzz7+C63fYjmf2CWr7
FlQ7BzzlY8AU7hRLZe9Wdi7upTs9xUs7tmEhTFVuR6dwJOc6v4fWBq4etNkygk3P
3qiYxGh5z6lbImeDc8pdgmgZJDrS8Sk/PKEfoklrVUCe4GJDh5yhB7QihhWdDP0V
bVy5wu+kWtgIDc4CzpJzxRoVy9gzoo9U5niw5YpK22YBsOlztAtbQwZRxeKmZVCz
LieLRVN1jQxu6392HY1JbPEruDooWvz1uMtkvRFH8zih5fvJW4Jd68Kbr6TZcj4J
1tcoqSvfyXh1kLBeWl1xazSVHXcszdhDkAVtRL0SlFYw2YyDCAjNYwxqxgVmopie
D9Mc6Twu4RcTrkUS7UH1Gb0i75IZmOXKIwNCg9hqfqsxwynu9wU=
=BGBD
-----END PGP SIGNATURE-----

--QBfH0/FkjifinvRu--
