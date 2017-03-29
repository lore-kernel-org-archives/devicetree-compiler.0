From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 0/6] pylibfdt: Add installation support
Date: Wed, 29 Mar 2017 12:15:35 -0600
Message-ID: <20170329181541.28856-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=jqh/ABb2SRa36/dou9m0bQlYsNCNBrvAX6MvcpAmgDw=;
        b=HtnABnh+rE3iKYXlagJq9Axm1f1kf7BRDjTTXOXCQZJ9RH31Rh3g28fm0qQDzQqYQ5
         nSJ21lGgXCbosCwgm5OsGClvzKrK0fRi+4yG6DGbfsiTtCa9Wujz57Pcmn5JymP5Peuk
         0urRzj06zNSbm/HpvAh5PvoLgM1C2FsydPBtppXYBoNq8Fizl+13h9u5WkEu4C/hTsgA
         bJprHOeTCn1uwxaEsmeRID+URvWyU7rq/lS4d2zp1cbAUF6VegshHRSwNAzsd5wcZ44f
         OQWicQnIuglZlxgoN44/gL+zuePb1dZQDVD5LWPTsg+zYOgr9jGskQcbAyfvhrEe7v21
         SUmg==
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

Version 2 adds support for running setup.py stand-alone.

Changes in v2:
- Add a comment about the VERSION environment variable
- Add new patch to rename libfdt.swig to libfdt.i
- Add new patch to allow setup.py to operation stand-alone
- Rebase to master

Simon Glass (6):
  pylibfdt: Allow building to be disabled
  pylibfdt: Enable installation of Python module
  pylibfdt: Use the correct libfdt version in the module
  pylibfdt: Use the call function to simplify the Makefile
  pylibfdt: Rename libfdt.swig to libfdt.i
  pylibfdt: Allow setup.py to operation stand-alone

 Makefile                           |  3 +-
 README                             | 21 +++++++++
 pylibfdt/Makefile.pylibfdt         | 21 +++++++--
 pylibfdt/{libfdt.swig => libfdt.i} |  0
 pylibfdt/setup.py                  | 97 ++++++++++++++++++++++++++++++++++++--
 5 files changed, 133 insertions(+), 9 deletions(-)
 rename pylibfdt/{libfdt.swig => libfdt.i} (100%)

-- 
2.12.2.564.g063fe858b8-goog
