From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/4] Introduce Python bindings for libfdt
Date: Thu, 17 Nov 2016 15:53:21 -0700
Message-ID: <1479423205-9817-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=HE1Mb94ZRYtpTp9sUzUDM85qGwMvfY6rfm86JBB7Z2A=;
        b=Dt9twz/SqusxBXQt/Rpv4XiETGzZMS+e+kVdemSVR74iw7+yN8pHk/NB6hBTEzl3uw
         GfPUwTZob6QOp2Nz/+kheWh8De/Ax8bYnLTycbtfwymstMN5NWfmC4rzFGMN0VZYhUJJ
         QazkDj8sKip8l6jL2mLr7Sjq+iUCJVfX8dQIaWOdvQaGdq38DM0rbDTiKgSCDEvknUay
         DRmsvlRUJZuvD0fIWOH0jMyw/wyxIxLBjsEOtnohH/IGGRa07LTglBjyK+EFeQEYebqI
         hDhnZBYIbUeksNHte3LgrvS2FI7bVJIgZ3aivW1fdnHPXhaEMtyhIf4+QkWK7iEtToit
         m4Bw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

At present libfdt consists of only a C implementation. Many scripts are
written using Python so it useful to have Python bindings for libfdt.
Apparently this has never been attempted before, or if so I cannot find a
reference.

This series starts the process of adding this support, with just a
bare-bones set of methods, to attract initial comments.


Simon Glass (4):
  Add an initial Python library for libfdt
  Add tests for pylibfdt
  Mention pylibfdt in the documentation
  RFC: Build pylibfdt as part of the normal build process

 Makefile                   |  16 +++-
 README                     |   6 ++
 pylibfdt/.gitignore        |   3 +
 pylibfdt/Makefile.pylibfdt |  21 ++++++
 pylibfdt/libfdt.swig       | 157 +++++++++++++++++++++++++++++++++++++++
 pylibfdt/setup.py          |  34 +++++++++
 tests/pylibfdt_tests.py    | 179 +++++++++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh         |  19 ++++-
 8 files changed, 433 insertions(+), 2 deletions(-)
 create mode 100644 pylibfdt/.gitignore
 create mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pylibfdt/libfdt.swig
 create mode 100644 pylibfdt/setup.py
 create mode 100644 tests/pylibfdt_tests.py

-- 
2.8.0.rc3.226.g39d4020
