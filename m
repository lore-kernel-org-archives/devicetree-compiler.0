From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 0/4] Switch to meson build system
Date: Thu, 26 Nov 2020 16:39:00 +0400
Message-ID: <CAMxuvazBvmGo+SXREbzq3Yp3=CYbW8B9M67P5oS1ttdJBwRQfA@mail.gmail.com>
References: <20201104194527.986901-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606394355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1ujVLMU2qJZyvpAYyQehIJ4W+DBaL6dgcSTASqiZQrI=;
        b=J8qvwalblalmnfHH2+uXBB0DArFmxsekFQG55rhmgg6u3ISpkjXeUk/CYGFt8fvwS5tRJX
        IFFLxqv1UuCoaUwYrKZKX72odp9oXWTcyZWFosHqTNBmUcedzmcbbnRz+obPE7mBuiLxfZ
        DXlgua+66E29pO30KVLLfzfhXvOx19A=
In-Reply-To: <20201104194527.986901-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Hi David,

On Wed, Nov 4, 2020 at 11:45 PM <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> Hi
>
> This series switches the build system to meson. The main reason for this,=
 bes=3D
> ide
> using a more modern and simpler build system, is to enable subproject() s=
uppo=3D
> rt
> in QEMU (atm, QEMU embedds a minimal meson build itself).
>
> v6:
>  - add "build-sys: replace makefiles to wrap meson/ninja", addressing
>    concerns about meson usage, and replacing the old build system.
>  - a few minor fixes to meson.build files (warnings and such)
>
> v5:
>  - squashed --build-lib change with "pylibfdt: allow build out of tree"
>    as the two are actually related

>
> v4:
>  - made setup.py --top-builddir option default to CWD
>  - extend commit messages
>  - rebased

Apparently you committed some patches from v4. Was this intentional?


>
> v3:
>  - remove workaround for meson#2992 which is now unnecessary
>  - add description to meson options
>  - pass NO_YAML & NO_PYTHON down to run_tests.sh
>  - commit comment tweaks
>  - rebased
>
> v2:
>  - various misc improvements after David Gibson v1 review
>  - add various meson_options.txt build options
>  - add editorconfig patch
>
> Marc-Andr=3DC3=3DA9 Lureau (4):
>   pylibfdt: allow build out of tree
>   build-sys: add meson build
>   travis: install meson
>   build-sys: replace makefiles to wrap meson/ninja
>
>  .travis.yml                |   6 +
>  Makefile                   | 385 ++-----------------------------------
>  Makefile.convert-dtsv0     |  14 --
>  Makefile.dtc               |  23 ---
>  Makefile.utils             |  31 ---
>  README                     |  24 ++-
>  libfdt/Makefile.libfdt     |  18 --
>  libfdt/meson.build         |  50 +++++
>  meson.build                | 129 +++++++++++++
>  meson_options.txt          |  10 +
>  pylibfdt/Makefile.pylibfdt |  30 ---
>  pylibfdt/meson.build       |  13 ++
>  pylibfdt/setup.py          |  27 ++-
>  tests/Makefile.tests       | 100 ----------
>  tests/meson.build          | 131 +++++++++++++
>  tests/run_tests.sh         |  10 +-
>  version_gen.h.in           |   1 +
>  17 files changed, 398 insertions(+), 604 deletions(-)
>  delete mode 100644 Makefile.convert-dtsv0
>  delete mode 100644 Makefile.dtc
>  delete mode 100644 Makefile.utils
>  delete mode 100644 libfdt/Makefile.libfdt
>  create mode 100644 libfdt/meson.build
>  create mode 100644 meson.build
>  create mode 100644 meson_options.txt
>  delete mode 100644 pylibfdt/Makefile.pylibfdt
>  create mode 100644 pylibfdt/meson.build
>  delete mode 100644 tests/Makefile.tests
>  create mode 100644 tests/meson.build
>  create mode 100644 version_gen.h.in
>
> --=3D20
> 2.29.0
>
>

