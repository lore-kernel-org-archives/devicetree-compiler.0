From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 5/8] dtc: Fix signedness comparisons warnings: reservednum
Date: Fri, 11 Jun 2021 18:10:37 +0100
Message-ID: <20210611171040.25524-6-andre.przywara@arm.com>
References: <20210611171040.25524-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210611171040.25524-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness
in comparisons in code using the "reservednum" variable.

There is obviously little sense in having a negative number of reserved
memory entries, so let's make this variable and all its users unsigned.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 dtc.c      | 4 ++--
 dtc.h      | 2 +-
 flattree.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/dtc.c b/dtc.c
index 3962d3f..bc786c5 100644
--- a/dtc.c
+++ b/dtc.c
@@ -12,7 +12,7 @@
  * Command line options
  */
 int quiet;		/* Level of quietness */
-int reservenum;		/* Number of memory reservation slots */
+unsigned int reservenum;/* Number of memory reservation slots */
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
 int alignsize;		/* Additional padding to blob accroding to the alignsize */
@@ -197,7 +197,7 @@ int main(int argc, char *argv[])
 			depname = optarg;
 			break;
 		case 'R':
-			reservenum = strtol(optarg, NULL, 0);
+			reservenum = strtoul(optarg, NULL, 0);
 			break;
 		case 'S':
 			minsize = strtol(optarg, NULL, 0);
diff --git a/dtc.h b/dtc.h
index 3357300..0ceeeba 100644
--- a/dtc.h
+++ b/dtc.h
@@ -35,7 +35,7 @@
  * Command line options
  */
 extern int quiet;		/* Level of quietness */
-extern int reservenum;		/* Number of memory reservation slots */
+extern unsigned int reservenum;	/* Number of memory reservation slots */
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
 extern int alignsize;		/* Additional padding to blob accroding to the alignsize */
diff --git a/flattree.c b/flattree.c
index 4659afb..3d0204f 100644
--- a/flattree.c
+++ b/flattree.c
@@ -295,7 +295,7 @@ static struct data flatten_reserve_list(struct reserve_info *reservelist,
 {
 	struct reserve_info *re;
 	struct data d = empty_data;
-	int    j;
+	unsigned int j;
 
 	for (re = reservelist; re; re = re->next) {
 		d = data_append_re(d, re->address, re->size);
-- 
2.17.5

