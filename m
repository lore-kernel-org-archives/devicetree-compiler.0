Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B60920AF7C
	for <devicetree-compiler@vger.kernel.org>; Tue, 18 Mar 2025 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742307363; cv=none; b=RE0a8VyHQ2BvcVtH4JnfzyC5bCTIcVSPHHyZotFoJogt8RTRBOXnxbLaB1+3uHHd/7jQWPFvo3Y5f/4sCgX6VO/noVdPTnkPoJjOe8mKC09mveCCF4zFGFkcWuR4pFD4urjv6yB7YhF1PbmUkUVZvJyh/mCVQzffyfIODn1D9tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742307363; c=relaxed/simple;
	bh=C1HLivGDvz6NYeLga8LyGzKYT7HglIIB2fTID1OvGyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyEhuEm1NTRRIu5mgOJDegLQGkZYK2u6NRsFLL7esWd9mD0/RolQKXpwWH2qV9AxTpjRZpCA/grgRsKjnitmezvlvgPablp1cpwGqSrxJn9mJrlRc7HUNWDsc+G8ceEUsq8DmkHYZaHxBhQzeWQW3FEJEZB1FWfJFMEF/GUcWuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trnilpqL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trnilpqL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACC0C4CEEE
	for <devicetree-compiler@vger.kernel.org>; Tue, 18 Mar 2025 14:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742307362;
	bh=C1HLivGDvz6NYeLga8LyGzKYT7HglIIB2fTID1OvGyE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=trnilpqL5h4zrcDnhpuVuszKDVzh6GFCcCuS4E48OZ+iXCN+cUmckJPtGkq6u3dcJ
	 JLETMQoc2ewAATyXYHpbi5cNyvymNWNZgVaSE5I5DsQZSNSlAZWLjXpjdXQcRLrQLu
	 qKn4L2KodrLZGIYNTRB1DRr1O3ja8FSJkfzZho0P8ZWOtWWOT7c6icQyZuXWQHmGgS
	 CJ3DuP8atx0hkFeg9CNe/WSituWgviBMFuzRiN36wIv4noBS8yr769e78IUuu3m1Dp
	 NbQCgTgQtd9tu05ZwZQnsvwbF/39YLYG1sxZAQVqvSEixJPMXiPBawTP1BLcIOymwN
	 PyACw4elVs2yg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso7125100a12.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 18 Mar 2025 07:16:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YzSM+xWYf0PrwOyn9lAQSnTXDybHp3XVCcpR3eDJ/DTOPvPLEaD
	vE6pbECbxqXR3fgbl/BAG90j8Kvb8ywLaLT9yiWJZPiKGftB4fnIaUXQi5mbstLcMoUwfrBd7N3
	Qr9XNd76Ieo/qCAt4KlM2YSKcBQ==
X-Google-Smtp-Source: AGHT+IHDd2wXtAhL08+A+9+4tBNdYFsPdnM5miowgQzwyI1WFgJsGqkogaBsmyo0UoXxsColHCOo87wk2woPcFaW4Eg=
X-Received: by 2002:a05:6402:3483:b0:5e7:b081:8b2f with SMTP id
 4fb4d7f45d1cf-5e89f1531b0mr14267014a12.8.1742307361328; Tue, 18 Mar 2025
 07:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317004056.14564-1-eschwartz@gentoo.org>
In-Reply-To: <20250317004056.14564-1-eschwartz@gentoo.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Mar 2025 09:15:49 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+nsJ1yU=o7ADCJ6U55xb_HVJaYReZHUSNgeWyXCH3mtg@mail.gmail.com>
X-Gm-Features: AQ5f1Jra-1Dbxj35VXPEjf_C8d9594s3mc0AzMeckl3RjGWGaqoXl7mNAlQTlco
Message-ID: <CAL_Jsq+nsJ1yU=o7ADCJ6U55xb_HVJaYReZHUSNgeWyXCH3mtg@mail.gmail.com>
Subject: Re: [PATCH] meson: port python bindings to build natively via meson
 and meson-python
To: Eli Schwartz <eschwartz@gentoo.org>
Cc: devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 7:42=E2=80=AFPM Eli Schwartz <eschwartz@gentoo.org>=
 wrote:
>
> We get full build parallelism and fewer confusing ancient distutils
> paths. The python wheels build fully standalone, including linking
> libfdt as a static library.
>
> For convenience, when running pip install a meson option is passed that g
> prevents building tools or installing headers/pkgconfig files.
> meson-python would otherwise include them in the wheel itself, in case
> they are needed, but this is essentially a bit useless so don't bother.

This is great as building a sdist that can be uploaded to pypi works.
I've been maintaining a separate repo solely for that purpose.

>
> Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>
> ---
>  MANIFEST.in          | 12 ------
>  libfdt/meson.build   | 32 ++++++++-------
>  meson.build          |  3 +-
>  meson_options.txt    |  2 +
>  pylibfdt/meson.build | 28 ++++++++-----
>  pyproject.toml       | 25 ++++++++++++
>  setup.py             | 97 --------------------------------------------

Isn't removing this going to break make based builds as that calls
setup.py directly? Personally, I think that's fine because I think
python things should be built "the Python way", rather than trying to
wrap them in make or meson. David didn't agree though. I think the
only somewhat sane path is making the make support purely a wrapper to
call meson so we're not maintaining 2 parallel build systems.

>  7 files changed, 64 insertions(+), 135 deletions(-)
>  delete mode 100644 MANIFEST.in
>  create mode 100644 pyproject.toml
>  delete mode 100755 setup.py
>
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
> diff --git a/libfdt/meson.build b/libfdt/meson.build
> index c2f4bd6..9c6ef54 100644
> --- a/libfdt/meson.build
> +++ b/libfdt/meson.build
> @@ -31,7 +31,7 @@ libfdt =3D library(
>    version: meson.project_version(),
>    link_args: link_args,
>    link_depends: 'version.lds',
> -  install: true,
> +  install: get_option('default_library') !=3D 'static' or not wheel_only=
,
>  )
>
>  libfdt_inc =3D include_directories('.')
> @@ -41,20 +41,22 @@ libfdt_dep =3D declare_dependency(
>    link_with: libfdt,
>  )
>
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
>
> -pkgconfig =3D import('pkgconfig')
> +  pkgconfig =3D import('pkgconfig')
>
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
>
>  version_gen_h =3D vcs_tag(
>    command: ['git', 'describe', '--dirty=3D+'],
> @@ -59,7 +60,7 @@ util_dep =3D declare_dependency(
>    dependencies: libfdt_dep
>  )
>
> -if get_option('tools')
> +if get_option('tools') and not wheel_only
>    flex =3D find_program('flex', required: true)
>    bison =3D find_program('bison', required: true)
>
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
>
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

typo
