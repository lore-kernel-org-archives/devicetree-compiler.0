From: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Subject: [PATCH] Attempt to auto-detect stat(1) being used if not given proper invocation
Date: Wed,  3 Jan 2018 10:34:44 -0600
Message-ID: <20180103163444.68928-1-kevans@FreeBSD.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

GNU stat(1) uses '-c "%s"' as the proper invocation to print filesize of the
file in question, while BSD stat(1) uses '-f "%Uz"'. Do some trivial
autodetection to check if we're using GNU stat(1) and assume we're using BSD
stat(1) if we don't detect otherwise.

This should allow the test suite to run properly out-of-the-box on *BSDs and
MacOS in addition to the current Linux support.

Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
---

I should also note here that I've not tested this on Linux, given that I don't
really have any Linux boxes, but I don't see any reason why it wouldn't work.

 tests/run_tests.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 3fa7c0a..0d30edf 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -8,7 +8,14 @@ fi
 
 # stat differs between platforms
 if [ -z "$STATSZ" ]; then
-	STATSZ="stat -c %s"
+	stat --version 2>/dev/null | grep -q 'GNU'
+	GNUSTAT=$?
+	if [ "$GNUSTAT" -ne 0 ]; then
+		# Assume BSD stat if we can't detect as GNU stat
+		STATSZ="stat -f %Uz"
+	else
+		STATSZ="stat -c %s"
+	fi
 fi
 
 export QUIET_TEST=1
-- 
2.15.1
