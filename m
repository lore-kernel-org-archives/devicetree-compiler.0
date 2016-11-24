From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 0/4] Introduce Python bindings for libfdt
Date: Thu, 24 Nov 2016 11:07:18 -0700
Message-ID: <1480010842-13957-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=NV23UaRmWkE2TEJXzX3BXLBm7GoxTUhiwGCff9ymrxk=;
        b=W6F2WBO5sNXmbAK5QZN0LJG1510Uw3Lm3rv73KXcPWlv7Pn4hO/eKAhxR3QK6yYdS9
         2mUkJWmBT8Q3Se921hRvnQ75UYK2NOFQJnpB5Bkgz33wnpMcrhHzI541EgruuilOZQV5
         yHoOzb3eEFWlw31evPY61wsZsvwCDTCV3zsuEmiUKAu+pPNp3e9cBom4Go78narrBIR9
         9+2YzF2L8UcQT1svBlB2t7fkHlZ7rXFmSLQCjh0Qz3Cx8KgdMnA+d4ur9XuG9Cz3xFaC
         WsKGMolTRdudk+P6GqHwonRG60Pgras8siocyQ0NUmg5w5J6iLvfI/qdKAs0LIxJ9303
         snAQ==
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

Simon Glass (4):
  Add an initial Python library for libfdt
  Add tests for pylibfdt
  Mention pylibfdt in the documentation
  RFC: Build pylibfdt as part of the normal build process

 Makefile                   |  16 +-
 README                     |  33 ++++
 pylibfdt/.gitignore        |   3 +
 pylibfdt/Makefile.pylibfdt |  21 +++
 pylibfdt/libfdt.swig       | 427 +++++++++++++++++++++++++++++++++++++++++++++
 pylibfdt/setup.py          |  34 ++++
 tests/pylibfdt_tests.py    | 245 ++++++++++++++++++++++++++
 tests/run_tests.sh         |  19 +-
 8 files changed, 796 insertions(+), 2 deletions(-)
 create mode 100644 pylibfdt/.gitignore
 create mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pylibfdt/libfdt.swig
 create mode 100644 pylibfdt/setup.py
 create mode 100644 tests/pylibfdt_tests.py

-- 
2.8.0.rc3.226.g39d4020
