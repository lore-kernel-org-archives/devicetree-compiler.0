From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/7] pylibfdt: Add installation support
Date: Sun, 26 Mar 2017 13:06:16 -0600
Message-ID: <20170326190623.27518-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=awPCXDU+emDFPm4TfhC2pAobnQz9/DUsDFn4mBpV+uo=;
        b=I5AhFPGJih8cNgtjpD0WXF0YYibztGM4cfUhO/79CNL66gjCE+Nk+9XXTBzBy77GO0
         eTDmV4B2dQnxcwnBWv09nZFAAL/mfRMCv96UsDBz/MTJpd0FMAoIG73nXts9oCNCUt8o
         CkCP4zhokSuEK3u28x7GzrGW/lCN5n1fvPcgLdSa0b72xewj9TjEP5u/hRa/zFflkbtd
         4JhOs3eVvnW4dsyvDmEpfCSCt2LOnOXD1nKal2LhXctER0wxssDHSBtXyjidQH2zIyvt
         tUJiJbLfWSrPnNjw3TzJk05KSwvS8JkdrcRwhiNT98tWC9N0qMiFSocTCB7GWNOym51j
         0UFQ==
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


Simon Glass (7):
  pylibfdt: Allow pkg-config to be supplied in the environment
  pylibfdt: Allow building to be disabled
  pylibfdt: Use environment to pass C flags and files
  pylibfdt: Use package_dir to set the package directory
  pylibfdt: Enable installation of Python module
  pylibfdt: Use the correct libfdt version in the module
  pylibfdt: Use the call function to simplify the Makefile

 Makefile                   |  6 ++++--
 README                     | 13 +++++++++++++
 pylibfdt/Makefile.pylibfdt | 19 +++++++++++++++++--
 pylibfdt/setup.py          | 22 +++++++++++-----------
 4 files changed, 45 insertions(+), 15 deletions(-)

-- 
2.12.1.578.ge9c3154ca4-goog
