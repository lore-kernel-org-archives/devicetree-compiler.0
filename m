From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v3 0/4] Add meson build system
Date: Tue, 15 Sep 2020 23:27:01 +0400
Message-ID: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600198037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=P+YMm+L348u/i3G/DCXp8DqEFe9XTvUISR0EtdIyGBA=;
        b=fTZ9lshvkE9Zc4JYmB9L/wAN4XOMQ/6c1jf8GPH+Qu3wvd4ysBIZD9eYsSs6Ib2HjNl+sO
        KTYu4DMqaV8ZWMeNy0dloSgjFUnXQv8byPYvO0QgQjw7xqeT22geL1jEkyxv/o1vYrpcuu
        sMPPNIzJw9hGnF2QohJaep8cFlOkX4s=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=0D

Hi=0D
=0D
This series adds support for meson build system. The main reason for this,=
=0D
beside using a more modern and simpler build system, is to enable subprojec=
t()=0D
support in QEMU.=0D
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
Marc-Andr=C3=A9 Lureau (4):=0D
  pylibfdt: allow build out of tree=0D
  pylibfdt: fix build lib location=0D
  build-sys: add meson build=0D
  travis: test meson build=0D
=0D
 .travis.yml                |  16 +++++=0D
 libfdt/meson.build         |  50 ++++++++++++++=0D
 meson.build                | 127 ++++++++++++++++++++++++++++++++++++=0D
 meson_options.txt          |  10 +++=0D
 pylibfdt/Makefile.pylibfdt |   4 +-=0D
 pylibfdt/meson.build       |  13 ++++=0D
 pylibfdt/setup.py          |  25 ++++---=0D
 tests/meson.build          | 130 +++++++++++++++++++++++++++++++++++++=0D
 version_gen.h.in           |   1 +=0D
 9 files changed, 366 insertions(+), 10 deletions(-)=0D
 create mode 100644 libfdt/meson.build=0D
 create mode 100644 meson.build=0D
 create mode 100644 meson_options.txt=0D
 create mode 100644 pylibfdt/meson.build=0D
 create mode 100644 tests/meson.build=0D
 create mode 100644 version_gen.h.in=0D
=0D
-- =0D
2.26.2=0D
=0D

