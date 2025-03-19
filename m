Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DAD130A73
	for <devicetree-compiler@vger.kernel.org>; Wed, 19 Mar 2025 05:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742363728; cv=none; b=kYR/GpA9k6KLw6rHN5Dc3vcCeE5VPWv2IwhB38cGpWg+mxa/1jr1V35pQvWPx7BiTjjI/FsbR4h+66NQyHGw/X/WpFzM8mdJDIq4W6tYnL8eD6yqZi+1Y4p07kyxTo9N/2JV1VHf9yoRBNgGMjb2KCxNx6bQPoCnCpTqjw4iXWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742363728; c=relaxed/simple;
	bh=k/YweXdkHYwWh/ucUO3UVOmLSZh0XX+sU2tAeTEx0IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6MwKrqJSZktrHCaJh4wgl8FMsz9RkwIo3GnYlxnQVff2bRpcix7BB3lrkpe6OyqQxph5D3xvhlJ3jhtyseO0TLLYnNtRet5T6hiM1UF72CIIg4tVvknMIrPE52YfRMErsvHFcocssjZRySyzCCQSq/FN8zEWdBokTKRQVygLuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=IN/TY43E; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="IN/TY43E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202502; t=1742363721;
	bh=qA4xTAfHTwxJXdfwMvv48WKdD+plSJDRv2o66Cq2KqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IN/TY43E17PCHniwjkOQNyMosZyovNfcGoOHiYXKCA4mSwPb9H9x+opESvqwFBbN7
	 8XY0XJGyMOjMNDEsSuWP/jvACovn2qopdL3wf6gMw194CMVSfh0jvan7x3PLpVQaig
	 GD81X4apWq0KAaoBsumQ/4ZAwV92PDE956GkfDqjCgaNyEZ2f1ky3wZXXMyfwF38RV
	 OaC3GwfeZCyjQYMJrzKl8tyBQQHyLUmJb5QoF3ty7/1CSx8xPfzVgOFw141K7jIZAo
	 s11HRvcSf+iR2SvpXXYKIQJm3J/+F5sTCs1fKbbvew7bi3/AtZtY4Y39dXSFNcV25F
	 lO1I5rH+V4EvQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ZHdGd1d6Nz4x1t; Wed, 19 Mar 2025 16:55:21 +1100 (AEDT)
Date: Wed, 19 Mar 2025 16:55:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eli Schwartz <eschwartz@gentoo.org>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] meson: port python bindings to build natively via meson
 and meson-python
Message-ID: <Z9pcREBBRThiamcB@zatzit>
References: <20250317004056.14564-1-eschwartz@gentoo.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TwMkoOZqnE5GTBYp"
Content-Disposition: inline
In-Reply-To: <20250317004056.14564-1-eschwartz@gentoo.org>


--TwMkoOZqnE5GTBYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I find the setuptools / distutils stuff immensely confusing, so I
really like this idea.  However, there are a few issues in this draft.

On Sun, Mar 16, 2025 at 08:40:56PM -0400, Eli Schwartz wrote:
> We get full build parallelism and fewer confusing ancient distutils
> paths. The python wheels build fully standalone, including linking
> libfdt as a static library.

First, this description assumes that you're at least broadly familiar
with the distinction between distutils and meson-python.  As it
happens, I am, but the commit message is for posterity, so it would
really help to give a bit more background here.

> For convenience, when running pip install a meson option is passed that
> prevents building tools or installing headers/pkgconfig files.
> meson-python would otherwise include them in the wheel itself, in case
> they are needed, but this is essentially a bit useless so don't bother.
>=20
> Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>
> ---
>  MANIFEST.in          | 12 ------
>  libfdt/meson.build   | 32 ++++++++-------
>  meson.build          |  3 +-
>  meson_options.txt    |  2 +
>  pylibfdt/meson.build | 28 ++++++++-----
>  pyproject.toml       | 25 ++++++++++++
>  setup.py             | 97 --------------------------------------------
>  7 files changed, 64 insertions(+), 135 deletions(-)
>  delete mode 100644 MANIFEST.in
>  create mode 100644 pyproject.toml
>  delete mode 100755 setup.py
>=20
> diff --git a/MANIFEST.in b/MANIFEST.in
> deleted file mode 100644
> index 904d124..0000000
> --- a/MANIFEST.in
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> -
> -global-exclude *
> -include README.md
> -include GPL
> -include BSD-2-Clause
> -include setup.py
> -include pylibfdt/libfdt.i
> -include libfdt/libfdt.h
> -include libfdt/fdt.h
> -include libfdt/libfdt_env.h
> -include VERSION.txt

We can't just delete the MANIFEST.in and setup.py, for now, because
they're still needed for the Makefile build.  I'm certainly
considering dropping support for make, but we're not there yet.

> diff --git a/libfdt/meson.build b/libfdt/meson.build
> index c2f4bd6..9c6ef54 100644
> --- a/libfdt/meson.build
> +++ b/libfdt/meson.build
> @@ -31,7 +31,7 @@ libfdt =3D library(
>    version: meson.project_version(),
>    link_args: link_args,
>    link_depends: 'version.lds',
> -  install: true,
> +  install: get_option('default_library') !=3D 'static' or not wheel_only,

The first clause doesn't quite make sense to me.  Why would we not
install a static library?

>  )
> =20
>  libfdt_inc =3D include_directories('.')
> @@ -41,20 +41,22 @@ libfdt_dep =3D declare_dependency(
>    link_with: libfdt,
>  )
> =20
> -install_headers(
> -  files(
> -    'fdt.h',
> -    'libfdt.h',
> -    'libfdt_env.h',
> +if not wheel_only
> +  install_headers(
> +    files(
> +      'fdt.h',
> +      'libfdt.h',
> +      'libfdt_env.h',
> +    )
>    )
> -)
> =20
> -pkgconfig =3D import('pkgconfig')
> +  pkgconfig =3D import('pkgconfig')
> =20
> -pkgconfig.generate(
> -  libraries: libfdt,
> -  version: meson.project_version(),
> -  filebase: 'libfdt',
> -  name: 'libfdt',
> -  description: 'Flat Device Tree manipulation',
> -)
> +  pkgconfig.generate(
> +    libraries: libfdt,
> +    version: meson.project_version(),
> +    filebase: 'libfdt',
> +    name: 'libfdt',
> +    description: 'Flat Device Tree manipulation',
> +  )
> +endif
> diff --git a/meson.build b/meson.build
> index 3026f88..ed4a39d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -43,6 +43,7 @@ py =3D import('python')
>  py =3D py.find_installation(required: get_option('python'))
>  swig =3D find_program('swig', required: get_option('python'))
>  pylibfdt_enabled =3D not meson.is_cross_build() and py.found() and swig.=
found() ? true : false
> +wheel_only =3D get_option('wheel-only')
> =20
>  version_gen_h =3D vcs_tag(
>    command: ['git', 'describe', '--dirty=3D+'],
> @@ -59,7 +60,7 @@ util_dep =3D declare_dependency(
>    dependencies: libfdt_dep
>  )
> =20
> -if get_option('tools')
> +if get_option('tools') and not wheel_only
>    flex =3D find_program('flex', required: true)
>    bison =3D find_program('bison', required: true)
> =20
> diff --git a/meson_options.txt b/meson_options.txt
> index 62b31b3..a866b17 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -10,3 +10,5 @@ option('python', type: 'feature', value: 'auto',
>         description: 'Build pylibfdt Python library')
>  option('tests', type: 'boolean', value: true,
>         description: 'Build tests')
> +option('wheel-only', type: 'boolean', value: false,
> +       description: 'building from meson-python')
> diff --git a/pylibfdt/meson.build b/pylibfdt/meson.build
> index 6157f8d..b13d802 100644
> --- a/pylibfdt/meson.build
> +++ b/pylibfdt/meson.build
> @@ -1,13 +1,21 @@
> -setup_py =3D find_program('../setup.py')
> -setup_py =3D [setup_py, '--quiet', '--top-builddir', meson.project_build=
_root()]
> -
> -pylibfdt =3D custom_target(
> -  'pylibfdt',
> +libfdt_c =3D custom_target(
> +  'swig',
>    input: 'libfdt.i',
> -  depends: libfdt,
> -  output: '_libfdt.so',
> -  command: [setup_py, 'build_ext'],
> -  build_by_default: true,
> +  output: ['libfdt.c', 'libfdt.py'],
> +  install: true,
> +  install_dir: [false, py.get_install_dir(pure: false)],
> +  command: [swig, '-python', '-I'+meson.current_source_dir() / '../libfd=
t', '-o', '@OUTPUT0@', '@INPUT@']
>  )
> =20
> -meson.add_install_script(setup_py, 'install', '--prefix=3D' + get_option=
('prefix'), '--root=3D$DESTDIR')
> +nowarn_gen =3D cc.get_supported_arguments(
> +  '-Wno-cast-qual',
> +  '-Wno-missing-prototypes',
> +  '-Wno-redundant-decls',
> +)
> +pylibfdt =3D py.extension_module(
> +  '_libfdt',
> +  libfdt_c,
> +  c_args: ['-DPY_SSIZE_T_CLEAN'] + nowarn_gen,
> +  dependencies: [libfdt_dep, py.dependency()],
> +  install: true,
> +)
> diff --git a/pyproject.toml b/pyproject.toml
> new file mode 100644
> index 0000000..0929bd0
> --- /dev/null
> +++ b/pyproject.toml
> @@ -0,0 +1,25 @@
> +[build-system]
> +build-backend =3D 'mesonpy'
> +requires =3D ['meson-python']
> +
> +[project]
> +name =3D 'libfdt'
> +authors =3D [
> +    {name =3D 'Simon Glass', email =3D 'sjg@chromium.org'},
> +]
> +classifiers =3D [
> +    'Programming Language :: Python :: 3',
> +    'License :: OSI Approved :: BSD License',
> +    'License :: OSI Approved :: GNU General Public License v2 or later (=
GPLv2+)',
> +    'Operating System :: OS Independent',
> +]
> +description =3D 'Pthon binding for libfdt'
> +readme =3D 'README.md'
> +requires-python =3D '>=3D3.8'
> +dynamic =3D ['version']
> +
> +[project.urls]
> +'homepage' =3D 'https://git.kernel.org/pub/scm/utils/dtc/dtc.git'
> +
> +[tool.meson-python.args]
> +'setup' =3D ['-Ddefault_library=3Dstatic', '-Dwheel-only=3Dtrue']

Shouldn't the python library use the shared library, at least by
default?

> diff --git a/setup.py b/setup.py
> deleted file mode 100755
> index 52844ce..0000000
> --- a/setup.py
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -#!/usr/bin/env python3
> -# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> -
> -"""
> -setup.py file for SWIG libfdt
> -Copyright (C) 2017 Google, Inc.
> -Written by Simon Glass <sjg@chromium.org>
> -"""
> -
> -import os
> -import sys
> -
> -from setuptools import setup, Extension
> -from setuptools.command.build_py import build_py as _build_py
> -
> -
> -def scan_for_info(srcdir):
> -    """Scan for the version and long_description fields
> -
> -    Args:
> -        srcdir (str): Source-directory path
> -
> -    Returns: tuple
> -        str: Full description (contents of README.md)
> -        str: Version string
> -    """
> -    with open(os.path.join(srcdir, "VERSION.txt"), "r", encoding=3D'utf-=
8') as fh:
> -        version =3D fh.readline().strip()
> -
> -    with open(os.path.join(srcdir, "README.md"), "r", encoding=3D'utf-8'=
) as fh:
> -        long_description =3D fh.read()
> -
> -    return version, long_description
> -
> -
> -def get_top_builddir(srcdir):
> -    """Figure out the top-level directory containing the source code
> -
> -    Args:
> -        srcdir (str): Source-directory path
> -
> -    Returns:
> -        str: Directory to build in
> -    """
> -    if '--top-builddir' in sys.argv:
> -        index =3D sys.argv.index('--top-builddir')
> -        sys.argv.pop(index)
> -        return sys.argv.pop(index)
> -    return srcdir
> -
> -
> -class BuildPy(_build_py):
> -    """Small class to run the build_ext command"""
> -    def run(self):
> -        self.run_command("build_ext")
> -        return super().run()
> -
> -
> -srcdir =3D os.path.dirname(__file__)
> -version, long_description =3D scan_for_info(srcdir)
> -
> -libfdt_module =3D Extension(
> -    '_libfdt',
> -    sources=3D[os.path.join(srcdir, 'pylibfdt/libfdt.i')],
> -    define_macros=3D[('PY_SSIZE_T_CLEAN', None)],
> -    include_dirs=3D[os.path.join(srcdir, 'libfdt')],
> -    libraries=3D['fdt'],
> -    library_dirs=3D[os.path.join(get_top_builddir(srcdir), 'libfdt')],
> -    swig_opts=3D['-I' + os.path.join(srcdir, 'libfdt')],
> -)
> -
> -
> -setup(
> -    name=3D'libfdt',
> -    version=3Dversion,
> -    cmdclass =3D {'build_py' : BuildPy},
> -    author=3D'Simon Glass',
> -    author_email=3D'sjg@chromium.org',
> -    description=3D'Python binding for libfdt',
> -    ext_modules=3D[libfdt_module],
> -    package_dir=3D{'': os.path.join(srcdir, 'pylibfdt')},
> -    py_modules=3D['libfdt'],
> -    python_requires=3D">=3D3.8",
> -
> -    long_description=3Dlong_description,
> -    long_description_content_type=3D"text/plain",
> -    url=3D"https://git.kernel.org/pub/scm/utils/dtc/dtc.git",
> -    license=3D"BSD",
> -    license_files=3D["GPL", "BSD-2-Clause"],
> -
> -    classifiers=3D[
> -        "Programming Language :: Python :: 3",
> -        "License :: OSI Approved :: BSD License",
> -        "License :: OSI Approved :: GNU General Public License v2 or lat=
er (GPLv2+)",
> -        "Operating System :: OS Independent",
> -    ],
> -)

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--TwMkoOZqnE5GTBYp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmfaXEMACgkQzQJF27ox
2Gc5jA/+NkieX3+32Zfv9guOoeJK8RY00aKwkrSV9nyhyuCsX5HvwAr2BXrfI5Hr
KlGd2MwJwyfM1gHTbPGPRASs966vpQZHKAMpaKwJZ2KD6DOa7FggFRxmb1DR2NXV
V7RQFdIcdZ72dDUVb8Gkq9G1DaoiMZqi1D5Baw+STBMMVp4u9t8gYzxW55PFzz3Z
XkCCrlQyEiLL+iWjU3GiL+YQKuBrh/Tgz0UejyKQAYQVD0cysx0Prsu1edRBZnYO
0OskQKMttP5F7HIpNtEizs9MnezbXUqiC3BmwtnLgeT9elQuoPXyywPvGAfMV9Ak
IRaOo+KcKR5SJOH4utLwWWOLqXSIgDTI9VLXBxcEKzi4hnsSKFoeAvwswYSBgSYh
jGG+Vz+NCBAWbeumv81DOZzLOJucob4mb78jGyfWPSrOpNtE/zhouksel1GacQyp
yGmPhNgT9nxBquYjhd05nGtA1V4Cg8cir3OTNm5ZmXrdePPazfGvJp0b+El3trBY
rTGp5gKePeXNVMa7C01dbqwiuc7MRNokKha1Ph6e66zVUl4YR0W9/H7EzRF5Z7gY
pJpM/846GFDG/S/jX4NcJtyKzAC0d1oS38gQ5sO4mUhfWeWZlyr9L3ogG69LTukw
woKkycP47UGUnSUAkGy8WYO5N0a8PDNe0j7cZGvPGa6sL5AY2Bw=
=5m6h
-----END PGP SIGNATURE-----

--TwMkoOZqnE5GTBYp--
