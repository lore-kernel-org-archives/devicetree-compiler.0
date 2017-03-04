From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v9 0/5] Introduce Python bindings for libfdt
Date: Sat,  4 Mar 2017 16:52:23 -0700
Message-ID: <20170304235229.5343-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=opwn/o93LI/kkRPzzkh2HJXFNQIVqXF87gTfBCxY0GA=;
        b=oDL6xVozdi9i2nH6ImYBTF+vHUVfGTxg9zs/CMaAd5rZQ43JO7uaCSHDm7q/JM1Val
         GQoA4DRxBF+/XnNoZ37ri00LPWquvMEF8ZDOObr73X1GENjwlmgLnhlViEERYiPLISoh
         qcjvKyZ4i/E1H/bjmhSijMOMvWzVl/0XVAncvCX7NivhgE9TRQgViprVxh4Dlpwk213b
         8U2tuRPbfPpPRpT6cev49n2IK9yGcMlolYUEDk+NWVECcc5ZLI7I5YqbYZulI3Y93R6p
         rWDfAp0Hs0bwrjnmjLnk8jnBR1NBexoLBQwojkyWfjLTIBrdBtxLXcTZzv8li0tY4Hev
         y59g==
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

The v8 series provides binding that can be used like this:

    fdt = libfdt.Fdt(open(fname).read())
    node = fdt.path_offset('/subnode@1')
    print fdt.get_prop(node, 'compatible')
    subnode = fdt.first_subnode(node, quiet=[libfdt.NOTFOUND])
    while subnode > 0:
        print fdt.get_name(subnode)
        subnode = fdt.next_subnode(subnode, quiet=[libfdt.NOTFOUND])

This version includes a simple class for properties.

Changes in v9:
- Drop PYLIBFDT_CLEANFILES
- Add _libfdt.so to PYLIBFDT_cleanfiles
- Support 'make clean' properly with pylibfdt
- Move run_tests.sh updates to this patch
- Only run the pylibfdt tests automatically if we can build pylibfdt
- Update commit message to reflect swig/Python.h detection
- Update Makefile shell command to support dash shell

Changes in v8:
- Fix up setup.py name and author
- Move QUITE_ALL into a single assignment
- Drop fdt32_to_cpu()
- Adjust fdt_get_property_by_offset() to rely on the typemap more
- Move pylibfdt_copy_value(() functionality into a typemap
- Add an fdt parameter to the [const] void * typemaps
- Create an output typemap for struct fdt_property *
- Drop the arg4 TODO comment
- Avoid using hard-coded offsets (ROOT_PROPS)
- Use types.ModuleType instead of type(str)
- Compare exception number instead of using a regex
- Avoid using hard-coded size
- Drop testEndian()
- Move the changes to run_tests.sh to a later commit
- Add comments to testPropertyOffsetExceptions()
- Drop all the namelen functions from the Python bindings
- Only build pylibfdt if we have swig and Python.h

Changes in v7:
- Add QUIET_ALL to silence all exceptions
- Add a test for QUIET_ALL

Changes in v6:
- Use a tuple instead of list for the default quiet parameter
- Use a tuple instead of list for QUIET_NOTFOUND
- Use 'list' instead of 'tuple' for the comment in check_err_null()
- Return a bytearray from getprop()
- Adjust the Property constructor to accept the name and value
- Use uint8_t for pylibfdt_copy_value
- Adjust tests to avoid checking a hard-coded offset
- Use 0 instead of self.fdt.path_offset('/')
- Adjust the totalsize() test to compare against the file size
- Adjust test result processing to avoid using awk
- Update example to print the node value as an integer
- Update example to print the bytestring as well as the string

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

 Makefile                   |  35 +++-
 README                     |  47 +++++
 libfdt/libfdt.h            |  21 ++-
 pylibfdt/.gitignore        |   3 +
 pylibfdt/Makefile.pylibfdt |  17 ++
 pylibfdt/libfdt.swig       | 433 +++++++++++++++++++++++++++++++++++++++++++++
 pylibfdt/setup.py          |  34 ++++
 tests/pylibfdt_tests.py    | 288 ++++++++++++++++++++++++++++++
 tests/run_tests.sh         |  19 ++
 9 files changed, 894 insertions(+), 3 deletions(-)
 create mode 100644 pylibfdt/.gitignore
 create mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pylibfdt/libfdt.swig
 create mode 100644 pylibfdt/setup.py
 create mode 100644 tests/pylibfdt_tests.py

-- 
2.12.0.rc1.440.g5b76565f74-goog
