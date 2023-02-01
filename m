From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] pylibfdt: Work-around SWIG limitations with flexible arrays
Date: Wed,  1 Feb 2023 16:44:41 -0600
Message-ID: <20230201224441.305757-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Commit a41509bea3e7 ("libfdt: Replace deprecated 0-length arrays with
proper flexible arrays") fails to build pylibfdt:

./pylibfdt/libfdt_wrap.c: In function ‘_wrap_fdt_node_header_name_set’:
./pylibfdt/libfdt_wrap.c:4350:18: error: cast specifies array type
 4350 |     arg1->name = (char [])(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
      |                  ^
./pylibfdt/libfdt_wrap.c:4350:16: error: invalid use of flexible array member
 4350 |     arg1->name = (char [])(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
      |                ^
./pylibfdt/libfdt_wrap.c:4352:16: error: invalid use of flexible array member
 4352 |     arg1->name = 0;
      |                ^
./pylibfdt/libfdt_wrap.c: In function ‘_wrap_fdt_property_data_set’:
./pylibfdt/libfdt_wrap.c:4613:18: error: cast specifies array type
 4613 |     arg1->data = (char [])(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
      |                  ^
./pylibfdt/libfdt_wrap.c:4613:16: error: invalid use of flexible array member
 4613 |     arg1->data = (char [])(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
      |                ^
./pylibfdt/libfdt_wrap.c:4615:16: error: invalid use of flexible array member
 4615 |     arg1->data = 0;
      |                ^

Turns out this is known issue with SWIG: https://github.com/swig/swig/issues/1699

Implement the work-around to ignore the flexible array member.

Fixes: a41509bea3e7 ("libfdt: Replace deprecated 0-length arrays with proper flexible arrays")
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 pylibfdt/libfdt.i | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index f9f7e7e66d13..987f7b9c3339 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -1036,6 +1036,9 @@ class NodeAdder():
 
 %rename(fdt_property) fdt_property_func;
 
+%immutable fdt_property::data;
+%immutable fdt_node_header::name;
+
 /*
  * fdt32_t is a big-endian 32-bit value defined to uint32_t in libfdt_env.h
  * so use the same type here.
-- 
2.39.0

