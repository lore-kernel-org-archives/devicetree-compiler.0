From: Danny Milosavljevic <dannym-bxPqe3T81XXwRsdMLXbzog@public.gmane.org>
Subject: Missing exports in dtc 1.4.1 release - Make new release adding
 them?
Date: Thu, 1 Sep 2016 20:08:21 +0200
Message-ID: <20160901200821.373f862c@scratchpost.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

I'm packaging dtc for the GNU Guix distribution.

In the process we found that Debian patches dtc 1.4.1 in order to add missing exports fdt_first_subnode, fdt_next_subnode, fdt_address_cells, fdt_size_cells, fdt_stringlist_contains, fdt_resize.

Are these supposed to be exported?

If so, could you make a bugfix release tarball with just these added?

The patches are:
From a4b093f7366fdb429ca1781144d3985fa50d0fbb Mon Sep 17 00:00:00 2001
From: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Tue, 17 Mar 2015 16:00:34 +0000
Subject: [PATCH] libfdt: Add missing functions to shared library

The commit 4e76ec7 "libfdt: Add fdt_next_subnode() to permit easy
subnode iteration" adds new functions (fdt_{first,next}_subnode) but
forgot to mark them as 'global' in the shared library.

Signed-off-by: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 libfdt/version.lds | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libfdt/version.lds b/libfdt/version.lds
index 80b322b..941208e 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -54,6 +54,8 @@ LIBFDT_1.2 {
 		fdt_get_property_by_offset;
 		fdt_getprop_by_offset;
 		fdt_next_property_offset;
+		fdt_first_subnode;
+		fdt_next_subnode;
 
 	local:
 		*;
-- 
2.8.1
From f58799be130e27cc729cb2d45566daa0bb3b8605 Mon Sep 17 00:00:00 2001
From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Date: Tue, 1 Dec 2015 12:55:21 +1100
Subject: [PATCH] libfdt: Add some missing symbols to version.lds

Several functions in the header file were missing from the version.lds
script, meaning that they couldn't be used from a libfdt shared library.

Reported by Ken Aaker, via github issue tracker.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 libfdt/version.lds | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/libfdt/version.lds b/libfdt/version.lds
index f19f157..1f4e1ea 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -57,6 +57,10 @@ LIBFDT_1.2 {
 		fdt_next_property_offset;
 		fdt_first_subnode;
 		fdt_next_subnode;
+		fdt_address_cells;
+		fdt_size_cells;
+		fdt_stringlist_contains;
+		fdt_resize;
 
 	local:
 		*;
-- 
2.8.1

Thanks,
   Danny
