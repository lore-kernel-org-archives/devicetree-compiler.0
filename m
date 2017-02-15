From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 0/5] Introduce Python bindings for libfdt
Date: Tue, 14 Feb 2017 20:51:55 -0700
Message-ID: <20170215035200.29934-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=oAhXX1LxGpd7Bc/Q5KE2iK9XjXioa/Sq7pPMWjHsifg=;
        b=r+/RX3rBXonFj6pry/PnBRhofpGxkSZsWgAMhodeiNRADicbgnjlKaa0zmHTBiIR2o
         KtYfuYM3yWVYP1dPSJr0gZgvMI7SFBFJPvIEcIZGnHv/URhakAkbCyksi45v8yddrR9z
         G8krad/0M3D7JGawQrRk9gWmPik8U95ZCn3ewPOvOrBQjp+AymlrhZRalYcIYLWi6OUG
         tdsE//FB2eB/y5AUhhzDoDxPL5NzxEy6PEYFTSw8HytnGII9aF0YeMrWu2IxqEJa/rUw
         LJ0yW7GYEgybAr0l/2Wb4VeiQNbkn+r8NFKUKioCx9Tl5FBnJC7O9NIzt6LM2HKmRBu5
         tmZw==
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

The v5 series provides binding that can be used like this:

    fdt = libfdt.Fdt(open(fname).read())
    node = fdt.path_offset('/subnode@1')
    print fdt.get_prop(node, 'compatible')
    subnode = fdt.first_subnode(node, quiet=[libfdt.NOTFOUND])
    while subnode > 0:
        print fdt.get_name(subnode)
        subnode = fdt.next_subnode(subnode, quiet=[libfdt.NOTFOUND])

This version includes a simple class for properties.

Changes in v5:
- Use a 'quiet' parameter instead of quiet versions of functions
- Add a Property object to hold a property's name and value
- Drop the data() and string() functions which are not needed now
- Rename pylibfdt_copy_data() tp pylibfdt_copy_value()
- Change order of libfdt.h inclusion to avoid #ifdef around libfdt macros
- Drop fdt_offset_ptr() and fdt_getprop_namelen() from the swig interface
- Use $(SWIG) to call swig from the Makefile
- Review function comments
- Adjust tests to match new swig bindings
- Use an interactive session to demonstrate pylibfdt
- Mention that more work remains
- Update commit message
- Drop #ifdef around fdt_get_header() macros
- Fix 'possible' typo

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

 Makefile                   |  17 +-
 README                     |  43 +++++
 libfdt/libfdt.h            |   5 +-
 pylibfdt/.gitignore        |   3 +
 pylibfdt/Makefile.pylibfdt |  18 ++
 pylibfdt/libfdt.swig       | 465 +++++++++++++++++++++++++++++++++++++++++++++
 pylibfdt/setup.py          |  34 ++++
 tests/pylibfdt_tests.py    | 267 ++++++++++++++++++++++++++
 tests/run_tests.sh         |  19 +-
 9 files changed, 868 insertions(+), 3 deletions(-)
 create mode 100644 pylibfdt/.gitignore
 create mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pylibfdt/libfdt.swig
 create mode 100644 pylibfdt/setup.py
 create mode 100644 tests/pylibfdt_tests.py

-- 
2.11.0.483.g087da7b7c-goog
