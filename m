From: Jonathan Gray <jsg-pTb1tGJk1dCHXe+LvDLADg@public.gmane.org>
Subject: [PATCH] util: limit gnu_printf format attribute to gcc >= 4.4.0
Date: Sat,  6 Feb 2021 21:01:10 +1100
Message-ID: <20210206100110.75228-1-jsg@jsg.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The gnu_printf format attribute was introduced in gcc 4.4.0
https://gcc.gnu.org/legacy-ml/gcc-help/2012-02/msg00225.html.

Use the printf format attribute on earlier versions of gcc and clang
(which claims to be gcc 4.2.1 in builtin defines) to fix the build with
gcc 4.2.1.

Fixes: 588a29f ("util: use gnu_printf format attribute")
Signed-off-by: Jonathan Gray <jsg-pTb1tGJk1dCHXe+LvDLADg@public.gmane.org>
---
 util.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util.h b/util.h
index a771b46..c45b2c2 100644
--- a/util.h
+++ b/util.h
@@ -13,10 +13,10 @@
  */
 
 #ifdef __GNUC__
-#ifdef __clang__
-#define PRINTF(i, j)	__attribute__((format (printf, i, j)))
-#else
+#if __GNUC__ >= 5 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
 #define PRINTF(i, j)	__attribute__((format (gnu_printf, i, j)))
+#else
+#define PRINTF(i, j)	__attribute__((format (printf, i, j)))
 #endif
 #define NORETURN	__attribute__((noreturn))
 #else
-- 
2.30.0

