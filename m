From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 08/11] dtc: Fix signedness comparisons warnings: Wrap (-1)
Date: Mon, 12 Oct 2020 17:19:45 +0100
Message-ID: <20201012161948.23994-9-andre.przywara@arm.com>
References: <20201012161948.23994-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201012161948.23994-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness
in a comparison in dtc's data_copy_file().

Even though maxlen is of an unsigned type, we compare against "-1",
which is passed in from the parser to indicate an unknown size.

Cast the "-1" to an unsigned size to make the comparison match.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/data.c b/data.c
index fdb0407..1473423 100644
--- a/data.c
+++ b/data.c
@@ -84,7 +84,7 @@ struct data data_copy_file(FILE *f, size_t maxlen)
 	while (!feof(f) && (d.len < maxlen)) {
 		size_t chunksize, ret;
 
-		if (maxlen == -1)
+		if (maxlen == (size_t)-1)
 			chunksize = 4096;
 		else
 			chunksize = maxlen - d.len;
-- 
2.17.5

