From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: [PATCH v2] write_propval_string: Use a list of strings instead of "\0" in a string
Date: Fri, 28 Apr 2023 13:32:17 +0200
Message-ID: <20230428113217.744447-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324; i=uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org; h=from:subject; bh=vcjtFa2ahqN2tWf9jIuliX5rkqVfY+AElYfe9IIcWNE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkS67ANtWofGA+BW9A8FOl4g3KwW4hdFLmOtpxM 2wwLolvIr+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZEuuwAAKCRCPgPtYfRL+ TtCSB/9vaa3+WlAw3s3ptDhmu0tl7rnIUfh+ebghj/1/R+fJ9GhJ8tHf9s3bC+3VnZT6fB4iiLL YhxwIOz+lFbElJh/EGi4fWD4WbxyI/zeubPuLsm//PHnYxOqun4gT7/1biZ+/3Hbugj8OwTLurd CyNHX7O+WAkPvluKAJbQXTWV9e6F1Qd9xY5/TrVjcnIYNuswghJ8ROGGYM8oIXUppAZazOsJ7vG 24NWQLCw2z1cmLbeDUkk3dCZYhQ5Cr7/atmMIUtMxjFIorl5fU4lxyiszB6zmVIltB2t7FjuJAB LewOVNadqCkN2+z2V7iR7zNVQRO9KUSl1U3/sgroDd7pQXYQ
X-Developer-Key: i=uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

From: Uwe Kleine-König <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

A string that contains '\0' can be written as a list of strings e.g.

	clock-names = "di0_pll\0di1_pll\0di0_sel\0di1_sel\0di2_sel\0di3_sel\0di0\0di1";

is equivalent to

	clock-names = "di0_pll", "di1_pll", "di0_sel", "di1_sel", "di2_sel", "di3_sel", "di0", "di1";

The latter is easier to read, to use this format instead.

Two test files are adapted accordingly to keep the test suite happy.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Changes since (implicit) v1, sent with Message-Id:
20230426182405.572729-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org:

 - Adapt the test suite

 tests/type-preservation.dt.yaml | 2 +-
 tests/type-preservation.dts     | 2 +-
 treesource.c                    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/type-preservation.dt.yaml b/tests/type-preservation.dt.yaml
index a0cc64cc4b69..e238d395aa02 100644
--- a/tests/type-preservation.dt.yaml
+++ b/tests/type-preservation.dt.yaml
@@ -12,7 +12,7 @@
     int16-matrix: [!u16 [0x1234, 0x5678], [0x90ab, 0xcdef]]
     int64: [!u64 [0x200000000]]
     int64-array: [!u64 [0x100000000, 0x0]]
-    a-string-with-nulls: ["foo\0bar", "baz"]
+    a-string-array: ["foo", "bar", "baz"]
     a-phandle: [[!phandle 0x1]]
     a-phandle-with-args: [[!phandle 0x1, 0x0, 0x1], [!phandle 0x1, 0x2, 0x3]]
     subsubnode:
diff --git a/tests/type-preservation.dts b/tests/type-preservation.dts
index 921ea21172d1..443424dc28ec 100644
--- a/tests/type-preservation.dts
+++ b/tests/type-preservation.dts
@@ -15,7 +15,7 @@
 		int16-matrix = /bits/ 16 <0x1234 0x5678>, <0x90ab 0xcdef>;
 		int64 = /bits/ 64 <0x200000000>;
 		int64-array = /bits/ 64 <0x100000000 0x00> int64_array_label_end:;
-		a-string-with-nulls = "foo\0bar", "baz";
+		a-string-array = "foo", "bar", "baz";
 		a-phandle = <&subsub1>;
 		a-phandle-with-args = <&subsub1 0x00 0x01>, <&subsub1 0x02 0x03>;
 
diff --git a/treesource.c b/treesource.c
index 33fedee82d58..de30188189fb 100644
--- a/treesource.c
+++ b/treesource.c
@@ -87,7 +87,7 @@ static void write_propval_string(FILE *f, const char *s, size_t len)
 			fprintf(f, "\\\"");
 			break;
 		case '\0':
-			fprintf(f, "\\0");
+			fprintf(f, "\", \"");
 			break;
 		default:
 			if (isprint((unsigned char)c))
-- 
2.39.2

