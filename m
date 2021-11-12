From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/6] More pylibfdt updates
Date: Thu, 11 Nov 2021 22:16:27 -0600
Message-ID: <20211112041633.741598-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Another batch of pylibfdt updates. This series updates the README for 
installing, adds metadata for packaging, and reworks the tests to be 
able to run standalone using python test programs (pytest and tox).

A test package is uploaded here: https://test.pypi.org/project/libfdt/

Rob

Rob Herring (6):
  README: Update pylibfdt install instructions
  pylibfdt: Add packaging metadata
  pylibfdt_tests: Don't depend on built dtbs
  tests: rename pylibfdt_tests.py to test_pylibfdt.py
  pylibfdt: Include tests and test data in packaging
  pylibfdt: Add tox support

 MANIFEST.in                                   |  7 ++++++
 README                                        | 24 ++++++++++++-------
 setup.py                                      | 17 +++++++++++++
 tests/run_tests.sh                            |  3 +--
 tests/{pylibfdt_tests.py => test_pylibfdt.py} | 22 ++++++++++-------
 tox.ini                                       |  6 +++++
 6 files changed, 60 insertions(+), 19 deletions(-)
 rename tests/{pylibfdt_tests.py => test_pylibfdt.py} (97%)
 create mode 100644 tox.ini

-- 
2.32.0

