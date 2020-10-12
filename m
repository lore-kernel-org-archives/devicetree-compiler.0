From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v5 0/3] Add meson build system
Date: Mon, 12 Oct 2020 11:34:02 +0400
Message-ID: <20201012073405.1682782-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602488058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=8HcbbptQHmM3e+AHmA6MkfTvFPE9nEfFodzxpt/RJw4=;
        b=KHm5t6y2TvacF0EvVTukNjD540kXriIp8/Ea3FOuilUwqHX8H/DJ1HyFzvEasdB3c4sdIM
        NaAI9uRIDBm/9i5n3XhXex5ZPy3coKgFfkIMneYAm5zbebPc6IHKC57GsDqZBbEj0QspM0
        sATqml1Ap3mILgKK0RKcZ8B6sYQct24=
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=0D

Hi=0D
=0D
This series adds support for meson build system. The main reason for this,=
=0D
beside using a more modern and simpler build system, is to enable subprojec=
t()=0D
support in QEMU.=0D
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
Marc-Andr=C3=A9 Lureau (3):=0D
  pylibfdt: allow build out of tree=0D
  build-sys: add meson build=0D
  travis: test meson build=0D
=0D
 .travis.yml                |  16 +++++=0D
 libfdt/meson.build         |  50 ++++++++++++++=0D
 meson.build                | 127 ++++++++++++++++++++++++++++++++++++=0D
 meson_options.txt          |  10 +++=0D
 pylibfdt/Makefile.pylibfdt |   4 +-=0D
 pylibfdt/meson.build       |  13 ++++=0D
 pylibfdt/setup.py          |  27 +++++---=0D
 tests/meson.build          | 130 +++++++++++++++++++++++++++++++++++++=0D
 version_gen.h.in           |   1 +=0D
 9 files changed, 368 insertions(+), 10 deletions(-)=0D
 create mode 100644 libfdt/meson.build=0D
 create mode 100644 meson.build=0D
 create mode 100644 meson_options.txt=0D
 create mode 100644 pylibfdt/meson.build=0D
 create mode 100644 tests/meson.build=0D
 create mode 100644 version_gen.h.in=0D
=0D
-- =0D
2.28.0=0D
=0D

