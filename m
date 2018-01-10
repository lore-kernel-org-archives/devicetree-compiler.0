From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dtdiff: change to POSIX shell
Date: Wed, 10 Jan 2018 00:47:56 -0500
Message-ID: <20180110054756.23464-1-vapier@gentoo.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This changes from the bash-specific process substitution feature to
reading with pipes.  It relies on /dev/fd or /proc/self/fd existing.

URL: https://crbug.com/756559
Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 dtdiff | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/dtdiff b/dtdiff
index 5fa772b0ab62..4d1b71756c2f 100644
--- a/dtdiff
+++ b/dtdiff
@@ -1,8 +1,4 @@
-#! /bin/bash
-
-# This script uses the bash <(...) extension.
-# If you want to change this to work with a generic /bin/sh, make sure
-# you fix that.
+#! /bin/sh
 
 
 DTC=dtc
@@ -35,4 +31,15 @@ if [ $# != 2 ]; then
     exit 1
 fi
 
-diff -u <(source_and_sort "$1") <(source_and_sort "$2")
+for dir in /dev/fd /proc/self/fd; do
+    if [ -d "${dir}" ]; then
+        break
+    fi
+done
+
+source_and_sort "$1" | (
+    # Duplicate current stdin from the first file to fd 3 so we can change fd 0
+    # to the second file.
+    exec 3<&0
+    source_and_sort "$2" | diff -u "${dir}/3" "${dir}/0"
+)
-- 
2.15.1
