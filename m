From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 0/5] Introduce Python bindings for libfdt
Date: Sat,  3 Dec 2016 17:47:27 -0700
Message-ID: <1480812452-7561-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=7OUgWs6loSvZq2T3rrrHW92ZIBN3IRCT8mHecLbajxA=;
        b=e98athQKy5Vfdcw+sCU9gTQukhx+SeQ0FOdDGbyvigS3KFfqF5wTs8xE9dySK0rlo7
         Y3GharZP0iFiZYTD9Ire33Zor1i9tXVKw/71KBCT47UxXzABbd67vTUUEa5dVGOFQidh
         fWbz9RBz1yS8FFEKCyveSRoOltxfcOIW1aOM6vYUG8PsEUrTWHOzK7eHelibVgT9UP1P
         aw4uCX6aa7U1aCEsPzzPHuv7qP7jzwxe3RwkA8ySxZP2Lz6zXi0RbLU23km2P0Kxrp92
         YDihAgXjtkQu4FwECHwigvfC63Q99LA3AFYEDU9tZEGeC4ExBJ3uCjK7dhixbXYli0qk
         /9/A==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

At present libfdt consists of only a C implementation. Many scripts are
written using Python so it useful to have Python bindings for libfdt.
Apparently this has never been attempted before, or if so I cannot find a
reference.

This series starts the process of adding this support, with just a
bare-bones set of methods, to attract initial comments.

The v3 series makes the binding more pythonic, allowing things like:

    fdt = libfdt.Fdt(open(fname).read())
    node = fdt.path('/subnode@1')
    print node.prop('compatible').data()
    subnode = node.first_subnode_quiet()
    while subnode:
        print subnode.name()
        subnode = subnode.next_subnode_quiet()

There are still some open question, particularly around naming.

Changes in v3:
- Make the library more pythonic
- Add classes for Node and Prop along with methods
- Add an exception class
- Use Python to generate exeptions instead of SWIG

Changes in v2:
- Add exceptions when functions return an error
- Correct Python naming to following PEP8
- Use a class to encapsulate the various methods
- Include fdt.h instead of redefining struct fdt_property
- Use bytearray to avoid the SWIG warning 454
- Add comments
- Update tests for new pylibfdt
- Add a few more tests to increase coverage
- Add some more tests
- Add details on how to obtain full help and code coverage

Pantelis Antoniou (1):
  checks: Pass boot_info instead of root node

Simon Glass (4):
  Add an initial Python library for libfdt
  Add tests for pylibfdt
  Mention pylibfdt in the documentation
  Build pylibfdt as part of the normal build process

 Makefile                   |  16 +-
 README                     |  33 +++
 checks.c                   |  78 +++---
 pylibfdt/.gitignore        |   3 +
 pylibfdt/Makefile.pylibfdt |  18 ++
 pylibfdt/libfdt.swig       | 602 +++++++++++++++++++++++++++++++++++++++++++++
 pylibfdt/setup.py          |  34 +++
 tests/pylibfdt_tests.py    | 389 +++++++++++++++++++++++++++++
 tests/run_tests.sh         |  19 +-
 9 files changed, 1154 insertions(+), 38 deletions(-)
 create mode 100644 pylibfdt/.gitignore
 create mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pylibfdt/libfdt.swig
 create mode 100644 pylibfdt/setup.py
 create mode 100644 tests/pylibfdt_tests.py

-- 
2.8.0.rc3.226.g39d4020
