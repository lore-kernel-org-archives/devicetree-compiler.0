From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 0/5] Introduce Python bindings for libfdt
Date: Sun,  5 Feb 2017 13:13:18 -0700
Message-ID: <20170205201323.15411-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=//cTQHI0S6JOzIChRfPdIHSyT0jYy8jxqCeA1mr7m/8=;
        b=nDIqqWxP0rhLubUhGEUtFXZTe1uMTpSJy8eXj6HL/Pu/UN4zMaU8ujn3MwOgFI5kF0
         f/fgQJPKHfdrbzt2pYg7rV2ezkygo/zMqoyX3klKjHXbUaHM3soqKtXPX1PvDMU5KIvM
         tBa2ABUCv6YyF446wWjvXdWHkeU/oe0/Fmo4dWD+6rHutdOzGL1bnSSkkXiR5BlUnW77
         qPGsBzbp0qdGVMJ8Us6x4Mmk09QBEyebujP3KEXDy84kPo/L+a6Ajt9xf+CfRve78Btx
         UO1T3NQJtDoDHKwk37NPi2mzd3RaYwJnV+efyWzgLetgVLbCH09mXmarNXrVoNkuXVsR
         VAoA==
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
bare-bones set of methods.

The v4 series provides binding that can be used like this:

    fdt = libfdt.Fdt(open(fname).read())
    node = fdt.path_offset('/subnode@1')
    print fdt.get_prop(node, 'compatible')
    subnode = fdt.first_subnode_quiet(node)
    while subnode > 0:
        print fdt.get_name(subnode)
        subnode = fdt.next_subnode_quiet(subnode)

This version does not include a class for properties. That can be added
if it is felt to be useful, but I want to get some basic functionality
agreed first. The get_property_by_offset() function would likely benefit
from this.

Changes in v4:
- Make the library less pythonic to avoid a shaky illusion
- Drop classes for Node and Prop, along with associated methods
- Include libfdt.h instead of repeating it
- Add support for fdt_getprop()
- Bring in all libfdt functions (but Python support is missing for many)
- Add full comments for Python methods
- Drop tests that are no-longer applicable
- Add a get for getprop()
- Add new patch to adjust libfdt.h to work with swig

Changes in v3:
- Make the library more pythonic
- Add classes for Node and Prop along with methods
- Add an exception class
- Use Python to generate exeptions instead of SWIG
- Add some more tests

Changes in v2:
- Add exceptions when functions return an error
- Correct Python naming to following PEP8
- Use a class to encapsulate the various methods
- Include fdt.h instead of redefining struct fdt_property
- Use bytearray to avoid the SWIG warning 454
- Add comments
- Update tests for new pylibfdt
- Add a few more tests to increase coverage
- Add details on how to obtain full help and code coverage

Simon Glass (5):
  Add an initial Python library for libfdt
  Add tests for pylibfdt
  Mention pylibfdt in the documentation
  Adjust libfdt.h to work with swig
  Build pylibfdt as part of the normal build process

 Makefile                   |  16 +-
 README                     |  33 +++
 libfdt/libfdt.h            |   7 +-
 pylibfdt/.gitignore        |   3 +
 pylibfdt/Makefile.pylibfdt |  18 ++
 pylibfdt/libfdt.swig       | 565 +++++++++++++++++++++++++++++++++++++++++++++
 pylibfdt/setup.py          |  34 +++
 tests/pylibfdt_tests.py    | 275 ++++++++++++++++++++++
 tests/run_tests.sh         |  19 +-
 9 files changed, 967 insertions(+), 3 deletions(-)
 create mode 100644 pylibfdt/.gitignore
 create mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pylibfdt/libfdt.swig
 create mode 100644 pylibfdt/setup.py
 create mode 100644 tests/pylibfdt_tests.py

-- 
2.11.0.483.g087da7b7c-goog
