From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] Add a couple of string-related functions
Date: Wed, 15 Jul 2015 13:13:56 +0200
Message-ID: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=sDKdwaaQcnNrTm1DwnWLJcSCc/gogLDXEEGbyPkMZJU=;
        b=hBPj4dw2izCCBxRhPCDjXEDMz/a9zc7Hc6xNMlKE3yCt5O63klrd/nvpwvO+cwiS9H
         95snj/oc806JzoOd7jwOOnhYlf3RGbZ/6QyJjEzfx9zvDnVQBvWCWqDx1aAi3dcCXWaU
         9hnjGCWcgHk41OR6+SiKQAn2w3/Mim6Z9Vw8GMdCsFwXTEcvhHLrs0rolZjCUsV5FmMC
         t2YF9qSG0BJXSR0aMaDbdffc6uqmpIRJV2tsxzG7urkUps+UysXroxdujG4QVNr0g9or
         /4gdkPJq8BYCIZR4wnbyt8euuSO1AqNH6tQ1KNSnfaSCEU8AUNKoq7IW+aQvAdY2cSCE
         Jbsw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

These three patches add a couple of string functions that have proven
useful in U-Boot's copy of libfdt, so they are likely to be useful for
other users as well.

Patch 1 adds a function to count the number of strings in a property's
value. This also adds a new DTS sample along with a small test program
to validate the implemented functions.

Patch 2 adds a function to retrieve the index of a given string in any
given property's value. This adds code to the test program introduced in
the previous patch to exercise the new functionality.

Patch 3 adds a function to retrieve a string by index from a property's
value along with a shortcut for index 0. This extends the test program
introduced in patch 1 to validate the new functionality.

Thierry

Thierry Reding (3):
  fdt: Add a function to count strings
  fdt: Add a function to get the index of a string
  fdt: Add functions to retrieve strings

 libfdt/fdt_ro.c      |  76 +++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h      |  47 ++++++++++++++++++++++
 tests/.gitignore     |   1 +
 tests/Makefile.tests |   1 +
 tests/run_tests.sh   |   3 ++
 tests/strings.c      | 110 +++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/strings.dts    |  10 +++++
 7 files changed, 248 insertions(+)
 create mode 100644 tests/strings.c
 create mode 100644 tests/strings.dts

-- 
2.4.5
