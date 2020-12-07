From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH 0/5] Follow-up on meson
Date: Mon,  7 Dec 2020 17:00:50 +0400
Message-ID: <20201207130055.462734-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607346214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=dLZgZMjrdejkQkh0QiXWqQJztlZIl1+vuccYIRGb6bI=;
        b=jMSHPzZoMG68Ef9VaGOsJwqKb+CiwbpPiGk+AMNZoMJMf31X147AHMkCIQ3SO+iLgMulZ4
        2iLDpZzuhRbONHCmKQvF2esWCIHOvRyRsC2N35l4OPaXhmFYlmmsuQTSBpICFd20vvB6zX
        QaG9DLVkGa4lBkOFcbTPgRUuFG5UWOk=
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=0D

Hi,=0D
=0D
Some v4 patches of the series "Add meson subsystem" were pushed, while v5 a=
nd v6=0D
were posted on the list. Here is the remaining changes I have on top of=0D
upstream. There are a few misc fixes, and the last patch removes the=0D
Makefile-based system, while keeping the traditional make all/check/install=
/clean=0D
interface to ease the transition.=0D
=0D
Marc-Andr=C3=A9 Lureau (5):=0D
  meson: fix -Wall warning=0D
  meson: do not assume python is installed, skip tests=0D
  meson: increase default timeout for tests=0D
  travis: install meson=0D
  build-sys: replace makefiles to wrap meson/ninja=0D
=0D
 .travis.yml                |   6 +=0D
 Makefile                   | 380 ++-----------------------------------=0D
 Makefile.convert-dtsv0     |  14 --=0D
 Makefile.dtc               |  23 ---=0D
 Makefile.utils             |  31 ---=0D
 README                     |  24 ++-=0D
 libfdt/Makefile.libfdt     |  18 --=0D
 meson.build                |  22 ++-=0D
 pylibfdt/Makefile.pylibfdt |  30 ---=0D
 tests/Makefile.tests       | 100 ----------=0D
 tests/meson.build          |  13 +-=0D
 tests/run_tests.sh         |  10 +-=0D
 12 files changed, 71 insertions(+), 600 deletions(-)=0D
 delete mode 100644 Makefile.convert-dtsv0=0D
 delete mode 100644 Makefile.dtc=0D
 delete mode 100644 Makefile.utils=0D
 delete mode 100644 libfdt/Makefile.libfdt=0D
 delete mode 100644 pylibfdt/Makefile.pylibfdt=0D
 delete mode 100644 tests/Makefile.tests=0D
=0D
-- =0D
2.29.0=0D
=0D

