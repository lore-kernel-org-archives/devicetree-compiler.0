From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] Improve pylibfdt python packaging
Date: Wed, 10 Nov 2021 19:11:31 -0600
Message-ID: <20211111011135.2386773-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

I'm interested in getting pylibfdt into PyPI and ran into a few issues
with pylibfdt using the python packaging tools. Primarily, pip didn't
work nor did setup.py sdist and bdist_wheel subcommands. This series
fixes those issues.

I've left meson calling setup.py intact for now, but think it's the
wrong way around. In fact, there's actually some efforts to make meson
the backend for pip/setuptools. I made several attempts to completely
eliminate putting files in the source tree without success. Also, I
noticed a meson install builds pylibfdt twice (though make may too).

I don't think I broke anything. Tests and installs both work with make
and meson.

Rob


Rob Herring (4):
  pylibfdt: Use setuptools instead of distutils
  pylibfdt: Use setuptools_scm for the version
  pylibfdt: Split setup.py author name and email
  pylibfdt: Move setup.py to the top level

 .gitignore                    |  4 ++++
 MANIFEST.in                   |  9 +++++++++
 pylibfdt/Makefile.pylibfdt    |  5 ++---
 pylibfdt/meson.build          |  5 ++---
 pylibfdt/setup.py => setup.py | 34 +++++++++++++---------------------
 5 files changed, 30 insertions(+), 27 deletions(-)
 create mode 100644 MANIFEST.in
 rename pylibfdt/setup.py => setup.py (56%)

-- 
2.32.0

