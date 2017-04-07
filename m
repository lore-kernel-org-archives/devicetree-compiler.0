From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 0/3] pylibfdt: Add installation support
Date: Fri,  7 Apr 2017 15:51:31 -0600
Message-ID: <20170407215134.2477-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=XMJEeiUH/vPIH/pLQj7U8PYTLW995cLlcAVii0aITpA=;
        b=N5sBKvn9ttQKtLhLhyuMYGxd0gpAiyYjTif9Hh1mvSELGsZu7Er8J67B5DIKcOaey1
         kf/Nc6w7qgmImAGdbj20EfgUjoDzqgxvy5PQ1Hd72t+eglyJ94k6x9giZEEJ6Lln5kpY
         +/xR2F6JKxp6W9KPb+1C2j1/J1Ho8S9zEP0h9BEA4Q2MEwaxHh+k0B/rL67z810ARgM1
         XSDFlcwUbmRIQ7iNuaGD+fsz2t8Bby+wiPlzQdQNwzaRnHU3iYDUEhaEy4S9hlbk1z/a
         aGKLehdpNa10XEV0ZFGlKoUCbr41wOXvF61v1QJ1YjA16y5UgFcvew2k7NVJNaPYylpF
         4DpA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This series adds support for installation of the Pylib module. It adjusts
the setup.py file to provide this functionality and the Makefile rules
to call it correctly.

It also adds a way to disable building the Python module. This is useful
since some build systems want to use setup.py to do both the build and
the install step. In this case the correct build commands would be:

   make NO_PYTHON=1
   make install_pylibfdt SETUP_PREFIX=/path/to/install_prefix

Version 3 adds support for running setup.py stand-alone:

   ./pylibfdt/setup.py --install_path [--prefix=/path/to/install_dir]

Changes in v4:
- Fix dependencies to allow Python tests to run from a clean tree
- Install Python library in pylibfdt/ correctly

Changes in v3:
- Update README to suggest using setup.py for an easy install
- Allow setup.py to be run from the base directory
- Make setup.py executable
- Use define..endef instead of line continuations
- Add new patch to move to Makefile constructs for NO_PYTHON
- Update for new test dependency
- Add a new patch to use setup.py to build the swig file

Changes in v2:
- Add new patch to allow setup.py to operation stand-alone
- Rebase to master

Simon Glass (3):
  pylibfdt: Allow setup.py to operate stand-alone
  pylibfdt: Use Makefile constructs to implement NO_PYTHON
  pylibfdt: Use setup.py to build the swig file

 Makefile                   | 16 ++++++--
 README                     | 14 +++++--
 pylibfdt/Makefile.pylibfdt | 30 ++++++--------
 pylibfdt/setup.py          | 98 +++++++++++++++++++++++++++++++++++++++++++---
 tests/Makefile.tests       |  6 +--
 5 files changed, 129 insertions(+), 35 deletions(-)
 mode change 100644 => 100755 pylibfdt/setup.py

-- 
2.12.2.715.g7642488e1d-goog
