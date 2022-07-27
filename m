From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Allow static building with meson
Date: Wed, 27 Jul 2022 16:50:07 +1000
Message-ID: <YuDgH5orPfls1RmW@yekko>
References: <20220629163557.932298-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ttIXeKaWA39JVocp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1658904669;
        bh=ubW7RcwVTFzpdGWvOxzOVvhhMBFC8V/Fzute+6zL+r0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ItWbi+utnfhTszdkljZhMLaxpJyyw92qSthlqmAkaBtgwEmgrsYSbE1hutTII/BG6
         fcnPIi6F/NGjLD6A0yjU6EOCzL3ypBYezj5+ugwPTHInfJ+tGQ36uhvt0hbX5wYRCs
         IsTY4rmwNVEH6egihD8b3O08YLeqWAX9c5X11B3E=
Content-Disposition: inline
In-Reply-To: <20220629163557.932298-1-tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ttIXeKaWA39JVocp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 07:35:57PM +0300, Tero Tervala wrote:
> Added "static-build" option in the meson_options.txt.
> Setting it to "true" allows static building.
>=20
> Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>

Thanks for adding the meson support, I've merged this as well.

It took me way too long to figure out how you actually *set* these
options with meson :(.  Neither meson --help nor the online meson
documentation are as helpful as onw would hope.

We really need instructions for invoking meson in the README.

> ---
>  libfdt/meson.build |  8 +++++++-
>  meson.build        | 14 ++++++++++++--
>  meson_options.txt  |  2 ++
>  tests/meson.build  |  9 +++++++--
>  4 files changed, 28 insertions(+), 5 deletions(-)
>=20
> diff --git a/libfdt/meson.build b/libfdt/meson.build
> index 71f29b6..240bdf4 100644
> --- a/libfdt/meson.build
> +++ b/libfdt/meson.build
> @@ -31,9 +31,15 @@ libfdt_a =3D static_library(
> =20
>  libfdt_inc =3D include_directories('.')
> =20
> +if static_build
> +  link_with =3D libfdt_a
> +else
> +  link_with =3D libfdt
> +endif
> +
>  libfdt_dep =3D declare_dependency(
>    include_directories: libfdt_inc,
> -  link_with: libfdt,
> +  link_with: link_with,
>  )
> =20
>  install_headers(
> diff --git a/meson.build b/meson.build
> index b23ea1b..78251eb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -31,8 +31,16 @@ add_project_arguments(
>    language: 'c'
>  )
> =20
> +if get_option('static-build')
> +  static_build =3D true
> +  extra_link_args =3D ['-static']
> +else
> +  static_build =3D false
> +  extra_link_args =3D []
> +endif
> +
>  yamltree =3D 'yamltree.c'
> -yaml =3D dependency('yaml-0.1', required: get_option('yaml'))
> +yaml =3D dependency('yaml-0.1', required: get_option('yaml'), static: st=
atic_build)
>  if not yaml.found()
>    add_project_arguments('-DNO_YAML', language: 'c')
>    yamltree =3D []
> @@ -85,6 +93,7 @@ if get_option('tools')
>        ],
>        dependencies: util_dep,
>        install: true,
> +      link_args: extra_link_args,
>      )
>    endif
> =20
> @@ -105,10 +114,11 @@ if get_option('tools')
>      ],
>      dependencies: [util_dep, yaml],
>      install: true,
> +    link_args: extra_link_args,
>    )
> =20
>    foreach e: ['fdtdump', 'fdtget', 'fdtput', 'fdtoverlay']
> -    executable(e, files(e + '.c'), dependencies: util_dep, install: true)
> +    executable(e, files(e + '.c'), dependencies: util_dep, install: true=
, link_args: extra_link_args)
>    endforeach
> =20
>    install_data(
> diff --git a/meson_options.txt b/meson_options.txt
> index ea59c28..82621c3 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -8,3 +8,5 @@ option('valgrind', type: 'feature', value: 'auto',
>         description: 'Valgrind support')
>  option('python', type: 'feature', value: 'auto',
>         description: 'Build pylibfdt Python library')
> +option('static-build', type: 'boolean', value: false,
> +       description: 'Build static binaries')
> diff --git a/tests/meson.build b/tests/meson.build
> index 3776fef..4ac154a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -96,15 +96,20 @@ tests +=3D [
>  ]
> =20
>  dl =3D cc.find_library('dl', required: false)
> -if dl.found()
> +if dl.found() and not static_build
>    tests +=3D [
>      'asm_tree_dump',
>      'value-labels',
>    ]
>  endif
> =20
> +test_deps =3D [testutil_dep, util_dep, libfdt_dep]
> +if not static_build
> +  test_deps +=3D [dl]
> +endif
> +
>  foreach t: tests
> -  executable(t, files(t + '.c'), dependencies: [testutil_dep, util_dep, =
libfdt_dep, dl])
> +  executable(t, files(t + '.c'), dependencies: test_deps, link_args: ext=
ra_link_args)
>  endforeach
> =20
>  run_tests =3D find_program('run_tests.sh')

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ttIXeKaWA39JVocp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLg4BcACgkQgypY4gEw
YSJVDBAAlDJa7vLfWeLXU+n9XGAJD9p/lCA4Q19LnOYfLsmASIMm77GpC98Els9D
F2qg6hqKEGtA7y7aRh6W2qJ7HCOhmDkmVwEygj+KGlPf71BzuMhlU+k+EMyPxv0v
TMFjTswj3ZUBQKA8/N2bQCoerR42m11ndhBRrF7NfEdlt90wVFHjzvMk9cpy/raE
6+5gazPz4n750wfasSIcPkxvkPYpHzsWtlhWm/7RTPd2ft0Rt/UHrKtXlYyeHKb7
+dnS7tsV73b91YpDvd116Efz3/1ldugNDonvb7DvMU7J/kwkBv+Ak3c2sUPjQ1ie
ZnLz05lPuvG2H3WO1Qn4mgJytU2OmlfIZrpFgS+y+oi3aVchjMJ6IyqnP2zfUaCM
ya3q41N9Nwrq3RHm8+/ngP9dVgs2c03fy5i7u30jzdpyGbE+vN6Hi0nP/t+Ww8oK
zeA8VxL2wQuhIENoDNcB6/9nXLGu/W/9nU8JS+L+DvyKZcbxyB5jcD37QfE0cYMB
xgnL0G8R3zCZUgBeK0d9SP7i79DuT2PXolo4e026a6DOkB/j8unM2ofkTzkyFlpm
/id/F+/oxV7BaIEXjnbYNg8lti0WZsFaGDALgujPUBEjtLFcHcKFqvwPmXDOoenI
Fr5sEZzaqY/P8cI90B2Ktn59l1myn3f/UAw8oh4BQm19rCLqznQ=
=R1sH
-----END PGP SIGNATURE-----

--ttIXeKaWA39JVocp--
