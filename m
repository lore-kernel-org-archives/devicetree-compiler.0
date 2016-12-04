From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 0/4] Introduce Python bindings for libfdt
Date: Sat,  3 Dec 2016 17:48:06 -0700
Message-ID: <1480812490-11926-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=TN1fy+2gPCAxnrFNkRvuZw0uNF7aTNzL1UZ7nKc+xPI=;
        b=RPDsKc9FQwOf3cdWZCl40PSqhTC9HmVwIohxwrnG/fRbUCg5kJc1d1PUiT+r6cD3gs
         oY7n9M8PZwvVa1bESz1ktGPY63y281/0U0hAEP78IAn8QuQbWDn82zjVQz/T+xScjxdt
         W7CfMKxveR/ePQhFsxNNavkn2/Nn6Gh6wUdTMMcHdjUhFRLc74636IIX6RELo+mwF4Fi
         vjHrn32bhXXuEdOkFsV0Byx7H6Gs6ck0fhvuIKp0unJezWyjPT+OteiXJzq8cuRA8eh0
         qydnBs2+49VxmJETaodI8X1SajTjQnSNLZSw8pzVgX6OpWv8o1yRSI43pH3GzoRg/0Cj
         XKuQ==
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

Simon Glass (4):
  Add an initial Python library for libfdt
  Add tests for pylibfdt
  Mention pylibfdt in the documentation
  Build pylibfdt as part of the normal build process

 Makefile                   |  16 +-
 README                     |  33 +++
 pylibfdt/.gitignore        |   3 +
 pylibfdt/Makefile.pylibfdt |  18 ++
 pylibfdt/libfdt.swig       | 602 +++++++++++++++++++++++++++++++++++++++++++++
 pylibfdt/setup.py          |  34 +++
 tests/pylibfdt_tests.py    | 389 +++++++++++++++++++++++++++++
 tests/run_tests.sh         |  19 +-
 8 files changed, 1112 insertions(+), 2 deletions(-)
 create mode 100644 pylibfdt/.gitignore
 create mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pylibfdt/libfdt.swig
 create mode 100644 pylibfdt/setup.py
 create mode 100644 tests/pylibfdt_tests.py

-- 
2.8.0.rc3.226.g39d4020
