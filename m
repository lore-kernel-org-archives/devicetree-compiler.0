From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 3/5] pylibfdt: Allow setup.py to operate stand-alone
Date: Fri, 7 Apr 2017 15:46:40 +1000
Message-ID: <20170407054640.GB27571@umbus>
References: <20170405160142.10564-1-sjg@chromium.org>
 <20170405160142.10564-4-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1491544188;
        bh=T9+VgutOdg+Ur4HQDm1T0OMWN3DNGvjC1YoTYldoiis=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ii81PqCqSLbAWhACymWGbXfR9iqepZ3pGvmCwrWC828ioYFe4kHZ+zI0sPb1/EhXJ
         /wcsw9ru+u0InfOpsOJtTiAmM0RzXFxpby9TsSO59oRCIManKAHtAnSqSQHLOF67JL
         /Fa5WWXh1cPAWpaQT6OftY9GwP5ouTelMcZN0nz8=
Content-Disposition: inline
In-Reply-To: <20170405160142.10564-4-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 10:01:40AM -0600, Simon Glass wrote:
> At present we require that setup.py is executed from the Makefile, which
> sets up various important things like the list of files to build and the
> version number.
>=20
> However many installation systems expect to be able to change to the
> directory containing setup.py and run it. This allows them to support (for
> example) building/installing for multiple Python versions, varying
> installation paths, particular C flags, etc.
>=20
> The problem in implementing this is that we don't want to duplicate the
> information in the Makefile. A common solution (so I am told) is to parse
> the Makefile to obtain the required information.
>=20
> Update the setup.py script to read a few Makefiles when it does not see
> the required information in its environment. This allows installation
> using:
>=20
>    ./pylibfdt/setup.py install
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I'm not sure quite how or why, but this patch has the side-effect of
stopping the Python tests from running with "make check".

> ---
>=20
> Changes in v3:
> - Update README to suggest using setup.py for an easy install
> - Allow setup.py to be run from the base directory
> - Make setup.py executable
> - Use define..endef instead of line continuations
>=20
> Changes in v2:
> - Add new patch to allow setup.py to operation stand-alone
> - Rebase to master
>=20
>  README                     | 14 +++++--
>  pylibfdt/Makefile.pylibfdt |  8 ++--
>  pylibfdt/setup.py          | 98 ++++++++++++++++++++++++++++++++++++++++=
+++---
>  3 files changed, 107 insertions(+), 13 deletions(-)
>  mode change 100644 =3D> 100755 pylibfdt/setup.py
>=20
> diff --git a/README b/README
> index 5add557..17dc845 100644
> --- a/README
> +++ b/README
> @@ -50,12 +50,18 @@ If you add new features, please check code coverage:
>      # Open 'htmlcov/index.html' in your browser
> =20
> =20
> -To install the library use:
> +To install the library via the normal setup.py method, use:
> =20
> -    make install_pylibfdt SETUP_PREFIX=3D/path/to/install_dir
> +    ./pylibfdt/setup.py [--prefix=3D/path/to/install_dir]
> =20
> -If SETUP_PREFIX is not provided, the default prefix is used, typically '=
/usr'
> -or '/usr/local'. See Python's distutils documentation for details.
> +If --prefix is not provided, the default prefix is used, typically '/usr'
> +or '/usr/local'. See Python's distutils documentation for details. You c=
an
> +also install via the Makefile if you like, but the above is more common.
> +
> +To install both libfdt and pylibfdt you can use:
> +
> +    make install [SETUP_PREFIX=3D/path/to/install_dir] \
> +            [PREFIX=3D/path/to/install_dir]
> =20
>  To disable building the python library, even if swig and Python are avai=
lable,
>  use:
> diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> index 06f9296..f7f9d5e 100644
> --- a/pylibfdt/Makefile.pylibfdt
> +++ b/pylibfdt/Makefile.pylibfdt
> @@ -5,9 +5,11 @@ PYLIBFDT_srcs =3D $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT=
_SRCS))
>  WRAP =3D $(PYLIBFDT_objdir)/libfdt_wrap.c
>  PYMODULE =3D $(PYLIBFDT_objdir)/_libfdt.so
> =20
> -run_setup =3D SOURCES=3D"$(1)" CPPFLAGS=3D"$(CPPFLAGS)" OBJDIR=3D"$(PYLI=
BFDT_objdir)" \
> -	VERSION=3D"$(dtc_version)" \
> -	python $(PYLIBFDT_objdir)/setup.py --quiet $(2)
> +define run_setup
> +	SOURCES=3D"$(1)" CPPFLAGS=3D"$(CPPFLAGS)" OBJDIR=3D"$(PYLIBFDT_objdir)"
> +	VERSION=3D"$(dtc_version)"
> +	$(PYLIBFDT_objdir)/setup.py --quiet $(2)
> +endef
> =20
>  $(PYMODULE): $(PYLIBFDT_srcs) $(WRAP)
>  	@$(VECHO) PYMOD $@
> diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> old mode 100644
> new mode 100755
> index 1597b44..90e80f3
> --- a/pylibfdt/setup.py
> +++ b/pylibfdt/setup.py
> @@ -2,26 +2,112 @@
> =20
>  """
>  setup.py file for SWIG libfdt
> +Copyright (C) 2017 Google, Inc.
> +Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> =20
>  Files to be built into the extension are provided in SOURCES
>  C flags to use are provided in CPPFLAGS
>  Object file directory is provided in OBJDIR
> +Version is provided in VERSION
> +
> +If these variables are not given they are parsed from the Makefiles. This
> +allows this script to be run stand-alone, e.g.:
> +
> +    ./pylibfdt/setup.py install [--prefix=3D...]
>  """
> =20
>  from distutils.core import setup, Extension
>  import os
> +import re
>  import sys
> =20
> +# Decodes a Makefile assignment line into key and value (and plus for +=
=3D)
> +RE_KEY_VALUE =3D re.compile('(?P<key>\w+) *(?P<plus>[+])?=3D *(?P<value>=
=2E*)$')
> +
> +
> +def ParseMakefile(fname):
> +    """Parse a Makefile to obtain its variables.
> +
> +    This collects variable assigments of the form:
> +
> +        VAR =3D value
> +        VAR +=3D more
> +
> +    It does not pick out :=3D assignments, as these are not needed here.=
 It does
> +    handle line continuation.
> +
> +    Returns a dict:
> +        key: Variable name (e.g. 'VAR')
> +        value: Variable value (e.g. 'value more')
> +    """
> +    makevars =3D {}
> +    with open(fname) as fd:
> +        prev_text =3D ''  # Continuation text from previous line(s)
> +        for line in fd.read().splitlines():
> +          if line and line[-1] =3D=3D '\\':  # Deal with line continuati=
on
> +            prev_text +=3D line[:-1]
> +            continue
> +          elif prev_text:
> +            line =3D prev_text + line
> +            prev_text =3D ''  # Continuation is now used up
> +          m =3D RE_KEY_VALUE.match(line)
> +          if m:
> +            value =3D m.group('value') or ''
> +            key =3D m.group('key')
> +
> +            # Appending to a variable inserts a space beforehand
> +            if 'plus' in m.groupdict() and key in makevars:
> +              makevars[key] +=3D ' ' + value
> +            else:
> +              makevars[key] =3D value
> +    return makevars
> +
> +def GetEnvFromMakefiles():
> +    """Scan the Makefiles to obtain the settings we need.
> +
> +    This assumes that this script is being run from the top-level direct=
ory,
> +    not the pylibfdt directory.
> +
> +    Returns:
> +        Tuple with:
> +            List of swig options
> +            Version string
> +            List of files to build
> +            List of extra C preprocessor flags needed
> +            Object directory to use (always '')
> +    """
> +    basedir =3D os.path.dirname(os.path.dirname(os.path.abspath(sys.argv=
[0])))
> +    swig_opts =3D ['-I%s' % basedir]
> +    makevars =3D ParseMakefile(os.path.join(basedir, 'Makefile'))
> +    version =3D '%s.%s.%s' % (makevars['VERSION'], makevars['PATCHLEVEL'=
],
> +                            makevars['SUBLEVEL'])
> +    makevars =3D ParseMakefile(os.path.join(basedir, 'libfdt', 'Makefile=
=2Elibfdt'))
> +    files =3D makevars['LIBFDT_SRCS'].split()
> +    files =3D [os.path.join(basedir, 'libfdt', fname) for fname in files]
> +    files.append('pylibfdt/libfdt.i')
> +    cflags =3D ['-I%s' % basedir, '-I%s/libfdt' % basedir]
> +    objdir =3D ''
> +    return swig_opts, version, files, cflags, objdir
> +
> +
>  progname =3D sys.argv[0]
> -files =3D os.environ['SOURCES'].split()
> -cflags =3D os.environ['CPPFLAGS'].split()
> -objdir =3D os.environ['OBJDIR']
> -version =3D os.environ['VERSION']
> +files =3D os.environ.get('SOURCES', '').split()
> +cflags =3D os.environ.get('CPPFLAGS', '').split()
> +objdir =3D os.environ.get('OBJDIR')
> +version =3D os.environ.get('VERSION')
> +swig_opts =3D []
> +
> +# If we were called directly rather than through our Makefile (which is =
often
> +# the case with Python module installation), read the settings from the
> +# Makefile.
> +if not all((version, files, cflags, objdir)):
> +    swig_opts, version, files, cflags, objdir =3D GetEnvFromMakefiles()
> =20
>  libfdt_module =3D Extension(
>      '_libfdt',
>      sources =3D files,
> -    extra_compile_args =3D cflags
> +    extra_compile_args =3D cflags,
> +    swig_opts =3D swig_opts,
>  )
> =20
>  setup(
> @@ -31,5 +117,5 @@ setup(
>      description=3D'Python binding for libfdt',
>      ext_modules=3D[libfdt_module],
>      package_dir=3D{'': objdir},
> -    py_modules=3D['libfdt'],
> +    py_modules=3D['pylibfdt/libfdt'],
>  )

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY5ye9AAoJEGw4ysog2bOSZ34P+gIac7nht0O2K7JGO3Exrgtr
YR2/QzfMGoRzLUau+gFYSLefDnsXBZjhAfb+c88HSwFx5IDZNrDl0aE6EZsits9M
PE5+rMSAEmdLZDrKvzrfTG0UlLTq7rOLAafhsEFZV3LQ/w4jZwwkujjLczcFS5wl
fEqatkOj96Jgyes6I8P7DHBWXYmVyCJdvoPGACJQQrLlfPYJFHXJnbANdg3DQLa3
/n8ZoBdcGsD40jW9PN7CZtV9fbeKwa8B1/OhIdWR5skszyhZ8s9w6mjy+xcqDPUK
URURf5hxlBCXnC0ctSqfFkNljslgpqqIrn64rA9rvx4kuo53RSgZMaV+xcbvDggF
6mvGRba2Rv5WhpSuPFYHIhfsV7Mdw8oO2/yZ7bpxTjthH+yux8VOV1i+6XF+4c0t
dPllnCxR8iqY8DtG+ZHSNlwEEs8vMMyj+N5cQ9LFcCG7WxEJLWGtZw+lfVbLKMF0
O9pHf2KPfO81HjOOZ1W4NmxEOcttlnmmXb8T51lU5Kwdd9ity1nRt5zSd9mCD3NM
wQTGKJKkterjOB5kFbJRO/+Fg0woAOLCt6rSleEKuroL8KWoHLs7BAYT59s9K4Ye
tWWJj50+p+YMfKc0lLVsGzeqqRM7V8+hEFhYZCwm3usweIV8NdzKM1t7tB5TVeDG
yIztBnhAHnNNGodk/EU0
=fZza
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
