From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/3] Add a couple of string-related functions
Date: Thu, 16 Jul 2015 13:10:18 +0200
Message-ID: <1437045021-4549-1-git-send-email-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=slssykVgzLuecumfn1SayNWNl75icY3s5AQyWpuGRNo=;
        b=A5bM8WXs1U16YeY/LGRcNtH1s6PjHhxzPihxqRA+GqThKYuzlimYa5HLcTs2UyheIt
         N7N6queMBc+H3TRaBYpfqX5OK6pyyiKEy8uH2tRuI4dYvPrf2dvc8VZhtvUB15+mnLmh
         kozQxs2ryU2z2+vmL6jd+CkwC64J1QOGq0EtjH21TBCmZykhkoZi8EqwAk1X4joswSgf
         gjGhXsyQL9TzUtw7RzvpGajUixF4wQmbdxSph01iRYMW+/NhL422tWHOUfncJA/JdARd
         8bi8eyIpkd21Z4UbdV1At4az1u3tyRPvHceeEiomEiZRGmpwthpJcOrzxKL75P72Vbsm
         ck/g==
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

Changes in v2:
- Safely handle non-NUL-terminated values. Uses strnlen() instead of
  strlen() to restrict accesses to the property value.
- Return FDT_ERR_BADVALUE if a non-NUL-terminated value is detected.
  Note that for performance reasons this doesn't always work. Cell or
  byte properties can look very much like NUL-terminated strings. The
  fdt_find_string() and fdt_get_string_index() functions can return a
  valid index or string, respectively, because they don't look at the
  complete value to determine validity. This could of course be fixed
  but the cases in which this succeeds the user did ask for trouble,
  so I didn't think it worth the extra effort.
- Improve documentation and tests.

Thierry

Thierry Reding (3):
  fdt: Add a function to count strings
  fdt: Add a function to get the index of a string
  fdt: Add functions to retrieve strings

 libfdt/fdt_ro.c      |  92 ++++++++++++++++++++++++++++++
 libfdt/libfdt.h      |  82 ++++++++++++++++++++++++++-
 tests/.gitignore     |   1 +
 tests/Makefile.tests |   1 +
 tests/run_tests.sh   |   3 +
 tests/strings.c      | 154 +++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/strings.dts    |  12 ++++
 7 files changed, 344 insertions(+), 1 deletion(-)
 create mode 100644 tests/strings.c
 create mode 100644 tests/strings.dts

-- 
2.4.5
