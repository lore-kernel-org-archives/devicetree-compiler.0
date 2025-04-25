Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8CC231A3B
	for <devicetree-compiler@vger.kernel.org>; Fri, 25 Apr 2025 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567833; cv=none; b=AN0rKjUv7K98Q0FotXxAINL5RJ1KGuMrh54TR4068OT8r3ZcNGqbBmDVx7CMqwpVSul0XZC93cdALt+NRuibAcU9eQvoalWMXkaxDVtkNLqIvAnI5/k/gy/4q3JPtM4ovC1z4Ky98kgI2zUIGpxfGKD+zUzvMzeqvhG27kzhVeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567833; c=relaxed/simple;
	bh=HMrWdCw+siN4Gu+6jLD/XNxcRiX8YjTr7bF6VAVLeUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6h9VB4McXJ7Pyc+/gaY6bEgER6GhvbOh2x/JDHfys/KAY+4dMqD7Y9KPnGq/eghz6HPdtST76mB4lzi6T4U/PILsGgNCl1O3Gg5wOzmoNaOMiZp5rSUE5YgwjyPe1wbBisoX47lJpPaCAKUxoGYqkTVBEDisPu3EEjrBQtyiXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=EgwhTVUE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="EgwhTVUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1745567819;
	bh=pPagoN3vGKruRI+Hf7SPs+7zQA2ele2UqqhzFGn4qBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgwhTVUE9K0DQzayTycd3LHUYYalQjd57G23jjqg6Na6iIOk+KuwgEMTqVfD5elPc
	 g0ME6i7dlij5REdPKkENkvVRWNz3hUgqQiIpdQ30ZPcQQWiHsThFqkXfyerh4vmFUj
	 VH34gJ0kUUhxSIeM8Y47ZbLJoHtGcXBfYQQJiFc7jINGfmm7vQWuT/esH/t2V3WPOk
	 GTMzYVBmFr2vUQBD6XeGlY9RIG5FzFDGC553ti/mVGbKu6B/M0qbVBssQMCCWEsLAH
	 dI5jhjla+7x2J/eWyfBWyqLou4cIVyd/YxUG0T1BX4uUSWzS10mYBKRWjfJukvagsn
	 SmWwWXAnfGZig==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ZkQCv3Ddwz4x8X; Fri, 25 Apr 2025 17:56:59 +1000 (AEST)
Date: Fri, 25 Apr 2025 14:56:48 +0700
From: David Gibson <david@gibson.dropbear.id.au>
To: Eli Schwartz <eschwartz@gentoo.org>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] meson: port python bindings to build natively via meson
 and meson-python
Message-ID: <aAtAQGz4HjrlR4-5@zatzit>
References: <20250317004056.14564-1-eschwartz@gentoo.org>
 <Z9pcREBBRThiamcB@zatzit>
 <71826390-c019-4a8c-9290-2d6ae9a4105d@gentoo.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AaNvGx0e3ZLTk0pc"
Content-Disposition: inline
In-Reply-To: <71826390-c019-4a8c-9290-2d6ae9a4105d@gentoo.org>


--AaNvGx0e3ZLTk0pc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Sorry, I haven't replied to this for ages.  I've had a lot of stuff
going on, both at work and otherwise.

On Wed, Mar 19, 2025 at 02:30:17AM -0400, Eli Schwartz wrote:
> On 3/19/25 1:55 AM, David Gibson wrote:
>=20
> >> diff --git a/MANIFEST.in b/MANIFEST.in
> >> deleted file mode 100644
> >> index 904d124..0000000
> >> --- a/MANIFEST.in
> >> +++ /dev/null
> >> @@ -1,12 +0,0 @@
> >> -# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> >> -
> >> -global-exclude *
> >> -include README.md
> >> -include GPL
> >> -include BSD-2-Clause
> >> -include setup.py
> >> -include pylibfdt/libfdt.i
> >> -include libfdt/libfdt.h
> >> -include libfdt/fdt.h
> >> -include libfdt/libfdt_env.h
> >> -include VERSION.txt
> >=20
> > We can't just delete the MANIFEST.in and setup.py, for now, because
> > they're still needed for the Makefile build.  I'm certainly
> > considering dropping support for make, but we're not there yet.
>=20
> If, as discussed in the previous emails, we drop support for *building
> python from Make* but don't drop Make for C, is that acceptable?

I'm conflicted.  I don't really like the idea of making make work for
only some things, without just removing it completely, or at least
having a concrete plan to do so.  On the other hand, I'd really like
to get rid of the confusing setuptools gunk.

How about this: could you author a patch deprecating make, which
prints a message saying so if you build with make (anything, not just
the Python pieces).  It should say that meson is preferred and give
example meson commands to use instead.

If we start with that, then I'd be ok making the Python build meson
only, followed by the changes you're suggesting here.

> >> diff --git a/libfdt/meson.build b/libfdt/meson.build
> >> index c2f4bd6..9c6ef54 100644
> >> --- a/libfdt/meson.build
> >> +++ b/libfdt/meson.build
> >> @@ -31,7 +31,7 @@ libfdt =3D library(
> >>    version: meson.project_version(),
> >>    link_args: link_args,
> >>    link_depends: 'version.lds',
> >> -  install: true,
> >> +  install: get_option('default_library') !=3D 'static' or not wheel_o=
nly,
> >=20
> > The first clause doesn't quite make sense to me.  Why would we not
> > install a static library?
>=20
>=20
> Read this the other way around.
>=20
> We *do* install, if either (or both) conditions are true:
>=20
> - we are building a non-static library, so we certainly need it at
>   runtime (thus it has to be installed at runtime)
>=20
> - we are NOT building a special wheel-specific build, which is to say,
>   we assume we need this installed if we aren't running from pip install
>=20
>=20
> i.e. the purpose of this is that we assume the end goal for python
> wheels is as I'm going to describe in the latter half of this email, and
> this specific conditional over here is just trying to detect "PyPI mode".
>=20
>=20
> >> +[tool.meson-python.args]
> >> +'setup' =3D ['-Ddefault_library=3Dstatic', '-Dwheel-only=3Dtrue']
> >=20
> > Shouldn't the python library use the shared library, at least by
> > default?
>=20
>=20
> This isn't about building the python library. If I'm building the python
> library, I just use "meson setup" like normal, and it builds the full
> dtc stack, including tools, library, python bindings and all.
>=20
> meson-python is *specifically* about building a python wheel. Python
> wheels have two choices:
>=20
> - the shared library is copied into the wheel
> - don't use the shared library
>=20
> Without setting these options, a wheel uploaded to PyPI ends up looking
> like this:
>=20
> $ bsdtar -tf dist/libfdt-1.7.2-cp312-cp312-linux_x86_64.whl
> libfdt-1.7.2.dist-info/METADATA
> libfdt-1.7.2.dist-info/WHEEL
> .libfdt.mesonpy.libs/libfdt.so.1.7.2
> .libfdt.mesonpy.libs/pkgconfig/libfdt.pc
> libfdt-1.7.2.data/scripts/convert-dtsv0
> libfdt-1.7.2.data/scripts/dtc
> libfdt-1.7.2.data/scripts/fdtdump
> libfdt-1.7.2.data/scripts/fdtget
> libfdt-1.7.2.data/scripts/fdtput
> libfdt-1.7.2.data/scripts/fdtoverlay
> libfdt-1.7.2.data/scripts/dtdiff
> libfdt.py
> _libfdt.cpython-312-x86_64-linux-gnu.so
> libfdt-1.7.2.data/headers/fdt.h
> libfdt-1.7.2.data/headers/libfdt.h
> libfdt-1.7.2.data/headers/libfdt_env.h
> libfdt-1.7.2.dist-info/RECORD
>=20
> And,
>=20
> $ readelf -d _libfdt.cpython-312-x86_64-linux-gnu.so
>=20
>     Library runpath: [$ORIGIN/.libfdt.mesonpy.libs]
>=20
> This is all necessary since pip install can't know that libfdt is
> already installed via a package manager (dpkg, rpm, portage, pacman,
> xbps, apk, etc), so it has to ship its own just in case.
>=20
> Building statically simplifies distribution as a PyPI wheel.

Ah, thanks for the explanation.  Thank makes sense.  If you can word
something sufficiently succinct, a comment for posterity explaining
that reasoning would be nice.  But if you can't find a way to explain
that briefly, I won't insist.

> If you really want to build bloated wheels, you can still do it:
>=20
>=20
> python -m build --wheel \
>     -Csetup-args=3D-Ddefault_library=3Dstatic \
>     -Csetup-args=3Dwheel-only=3Dfalse
>=20
>=20
>=20
> By the way, the locations that the files get installed to when building
> via pip aren't great either. The *.data/headers/ gets installed to
>=20
> /usr/include/python3.12/libfdt/
>=20
> and the library and pkg-config files end up in
>=20
> /usr/lib/python3.12/site-packages/.libfdt.mesonpy.libs/libfdt.so.1.7.2
> /usr/lib/python3.12/site-packages/.libfdt.mesonpy.libs/pkgconfig/libfdt.pc
>=20
> The pkg-config file doesn't even get remapped, it still says
> -I/usr/include and -L/usr/lib64
>=20
> If you install with pip install --user (default when not running with
> sudo), then you even end up with this:
>=20
>=20
>     /home/eschwartz/.local/bin/convert-dtsv0
>     /home/eschwartz/.local/bin/dtc
>     /home/eschwartz/.local/bin/dtdiff
>     /home/eschwartz/.local/bin/fdtdump
>     /home/eschwartz/.local/bin/fdtget
>     /home/eschwartz/.local/bin/fdtoverlay
>     /home/eschwartz/.local/bin/fdtput
>     /home/eschwartz/.local/include/python3.12/libfdt/fdt.h
>     /home/eschwartz/.local/include/python3.12/libfdt/libfdt.h
>     /home/eschwartz/.local/include/python3.12/libfdt/libfdt_env.h
>=20
> /home/eschwartz/.local/lib/python3.12/site-packages/.libfdt.mesonpy.libs/=
libfdt.so.1.7.2
>=20
> /home/eschwartz/.local/lib/python3.12/site-packages/.libfdt.mesonpy.libs/=
pkgconfig/libfdt.pc
>=20
> /home/eschwartz/.local/lib/python3.12/site-packages/_libfdt.cpython-312-x=
86_64-linux-gnu.so
>     /home/eschwartz/.local/lib/python3.12/site-packages/libfdt.py
>=20
>=20
> So yeah, IMO all of this cruft is out of place for pypi.org / pip.
>=20
>=20
> Python packaging *cannot*, in any way shape or form be used outside of
> its closed-in silo. They literally forbid, via their standards body, the
> possibility of installing outside of the locations I described. The only
> way to install to arbitrary locations the way Make or Meson can, is to
> use what they describe as "the legacy install route" of running
>=20
> ```
> python setup.py install
> ```
>=20
> and then having the equivalent of Makefile
>=20
> `cp XXXX ${DESTDIR}${PREFIX}/bin`
>=20
> i.e. completely disrespecting the pip install approach.
>=20
>=20
> The point of distributing on PyPI is so that people can get a
> python-specific copy of the bindings easily, with a minimum of fuss, and
> nothing else. You can always get the complete set using a real build
> system and installing with "meson install" instead of pip, and usually
> using a distro package manager even. But people installing via pip
> install aren't necessarily interested in that. They just want to
> download a binary package which their python scripts depend on.

Ok, understood.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--AaNvGx0e3ZLTk0pc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmgLQC0ACgkQzQJF27ox
2GcSug/9FxjmRSDPyOLHOOUenURtLOygFlyhMiYlh5YK6tsTtg+dBo608NScLIZt
xnGvvRWVReRTDaf9oioSg8x9zywxWHPJHnhiyO58DuQHLB91nB5KY7Gbgi6Kvt17
/sK5rXPjL1mSH6jmcUZ3oQZmsgblfigzJ4EXFaws/G7cqRhHY3wlF5kvOfb4+FAA
8IKqSIrLJgc383ky/ZQDVTeUeYU/F7pgA98rLVDyjbSrPNBK4lejkE7z28YPYzx9
VJ1sv4AENPrplCh1TcXEG1AMegLtp22c/OB7mfeMyafHWhVIcpqa1mzIWitJRv9r
+BAwDyRG3FYhuX5D/6Sg7B8ZArYMXFlIJiSjIyKXZ5OEJ7lB89QCFFfQeEbeoSE2
Oz+WwmlagsZSG0TXzYV7lfcNzR/nSVjYEtVSsED0qA9PKS3WSReRY5UItnMuTO2q
czBNh5SUlo/5sxLeeh05siLzVVgwOeH65oukt8DAGDXt9QolEw2VUGTk6MfGA3Lz
zobl1eTuvvvBo1MBEYYjdTtPD99vW8khw3u0r/jz/shLjIr0yWEYZj0LFEPxbxLo
qHTbMpqvZcvkEdeZ1nt04XTY5bzGDi7im1w+GcHg93rYC2UZCMtzvfCnLwSNw+dY
XKfn1jT4G173B8ys+8Z3CBSsYgo/wKOXb9RtGxx8oVmXZ2VpkFg=
=DIZQ
-----END PGP SIGNATURE-----

--AaNvGx0e3ZLTk0pc--
