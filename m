From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 0/5] pylibfdt: Add installation support
Date: Wed,  5 Apr 2017 10:01:37 -0600
Message-ID: <20170405160142.10564-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=FB3UVXkh0U3Nj4h6t9eXyALfo8KrD8uMC80bAvDxoCk=;
        b=BFFtlYbYt5NlJysru7N7BWsHs6QxwOhzZYwj1/g2orUfdKrYzOTyr/jZUg4PW5lC7Z
         Lt1IYumr6pX3ow3CbahaRaL7UenHCrz/1m4GQWeE3nvcSclit1iN0+f/zil7aW4hRS64
         nIw8zDxsmTYRCbSNG4TX7lHhuWxEF8fjoxx2fwE0PHEXdAQ9zH7P4knkj+1uEVwBItiI
         QUHcHQwcBxb2Wo60z/CML2is3dE1F0TO/qWH2/XlapS4rYq+ZsSHrZBPz5aPNv4CNfgO
         C6J3nhwFABFh+mM7Ph8CqWKBjWkLxjImVVJ4ydzLFx6dnUn4Om21cCQddyt9PNZFbUQT
         SEAQ==
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

Changes in v3:
- Add new patch to fix code style in setup.py
- Update README to suggest using setup.py for an easy install
- Allow setup.py to be run from the base directory
- Make setup.py executable
- Use define..endef instead of line continuations
- Add new patch to move to Makefile constructs for NO_PYTHON
- Add a new patch to use setup.py to build the swig file

Changes in v2:
- Add new patch to rename libfdt.swig to libfdt.i
- Add new patch to allow setup.py to operation stand-alone
- Rebase to master

Simon Glass (5):
  pylibfdt: Rename libfdt.swig to libfdt.i
  pylibfdt: Fix code style in setup.py
  pylibfdt: Allow setup.py to operate stand-alone
  pylibfdt: Use Makefile constructs to implement NO_PYTHON
  pylibfdt: Use setup.py to build the swig file

 Makefile                           |  13 ++++-
 README                             |  14 +++--
 pylibfdt/Makefile.pylibfdt         |  29 ++++------
 pylibfdt/{libfdt.swig => libfdt.i} |   0
 pylibfdt/setup.py                  | 113 ++++++++++++++++++++++++++++++++-----
 5 files changed, 130 insertions(+), 39 deletions(-)
 rename pylibfdt/{libfdt.swig => libfdt.i} (100%)
 mode change 100644 => 100755 pylibfdt/setup.py

-- 
2.12.2.715.g7642488e1d-goog
