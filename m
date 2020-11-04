From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v6 0/4] Switch to meson build system
Date: Wed,  4 Nov 2020 23:45:23 +0400
Message-ID: <20201104194527.986901-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604519138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=pGnCMzRt6dfITaKEMjYPKT36stlnKsuwPI9M2H5gwUs=;
        b=FprQ5J2zbRXZLQlUcvOgMzBvofN883dBzbFP7LZagFg8XJjmkaT9RLgGX3d1q1zXZaA79N
        Iq9B7M56R+j+op25D71/pEiwXlsYiWTHvStJcpmjvZPEscgq0vZEntJkmfydSiVfZxJwQu
        8PbYjoT/mO1BgVOlTraMeP/r3cuifko=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=0D

Hi=0D
=0D
This series switches the build system to meson. The main reason for this, b=
es=3D=0D
ide=0D
using a more modern and simpler build system, is to enable subproject() sup=
po=3D=0D
rt=0D
in QEMU (atm, QEMU embedds a minimal meson build itself).=0D
=0D
v6:=0D
 - add "build-sys: replace makefiles to wrap meson/ninja", addressing=0D
   concerns about meson usage, and replacing the old build system.=0D
 - a few minor fixes to meson.build files (warnings and such)=0D
=0D
v5:=0D
 - squashed --build-lib change with "pylibfdt: allow build out of tree"=0D
   as the two are actually related=0D
=0D
v4:=0D
 - made setup.py --top-builddir option default to CWD=0D
 - extend commit messages=0D
 - rebased=0D
=0D
v3:=0D
 - remove workaround for meson#2992 which is now unnecessary=0D
 - add description to meson options=0D
 - pass NO_YAML & NO_PYTHON down to run_tests.sh=0D
 - commit comment tweaks=0D
 - rebased=0D
=0D
v2:=0D
 - various misc improvements after David Gibson v1 review=0D
 - add various meson_options.txt build options=0D
 - add editorconfig patch=0D
=0D
Marc-Andr=3DC3=3DA9 Lureau (4):=0D
  pylibfdt: allow build out of tree=0D
  build-sys: add meson build=0D
  travis: install meson=0D
  build-sys: replace makefiles to wrap meson/ninja=0D
=0D
 .travis.yml                |   6 +=0D
 Makefile                   | 385 ++-----------------------------------=0D
 Makefile.convert-dtsv0     |  14 --=0D
 Makefile.dtc               |  23 ---=0D
 Makefile.utils             |  31 ---=0D
 README                     |  24 ++-=0D
 libfdt/Makefile.libfdt     |  18 --=0D
 libfdt/meson.build         |  50 +++++=0D
 meson.build                | 129 +++++++++++++=0D
 meson_options.txt          |  10 +=0D
 pylibfdt/Makefile.pylibfdt |  30 ---=0D
 pylibfdt/meson.build       |  13 ++=0D
 pylibfdt/setup.py          |  27 ++-=0D
 tests/Makefile.tests       | 100 ----------=0D
 tests/meson.build          | 131 +++++++++++++=0D
 tests/run_tests.sh         |  10 +-=0D
 version_gen.h.in           |   1 +=0D
 17 files changed, 398 insertions(+), 604 deletions(-)=0D
 delete mode 100644 Makefile.convert-dtsv0=0D
 delete mode 100644 Makefile.dtc=0D
 delete mode 100644 Makefile.utils=0D
 delete mode 100644 libfdt/Makefile.libfdt=0D
 create mode 100644 libfdt/meson.build=0D
 create mode 100644 meson.build=0D
 create mode 100644 meson_options.txt=0D
 delete mode 100644 pylibfdt/Makefile.pylibfdt=0D
 create mode 100644 pylibfdt/meson.build=0D
 delete mode 100644 tests/Makefile.tests=0D
 create mode 100644 tests/meson.build=0D
 create mode 100644 version_gen.h.in=0D
=0D
--=3D20=0D
2.29.0=0D
=0D

