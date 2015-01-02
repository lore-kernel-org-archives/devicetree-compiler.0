From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [RFC/PATCH] libfdt: Use quotes to include header files
Date: Sat,  3 Jan 2015 10:10:23 +1300
Message-ID: <1420233023-12710-1-git-send-email-chris.packham@alliedtelesis.co.nz>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail; t=1420233052;
	bh=kGuNfShhvzsA9UEl5LK7RjckJLl1HR36SFd18kWE96s=;
	h=From:To:Cc:Subject:Date;
	b=JUIpvpgsa0P8Fp2pMjSSaIhhqmKdCCVN4sx7ereo8qIoqigy5Nl0eXWgyWHrrE/TP
	 pNdaiUfXvxRmv9U8mTqCBYFvB+odnuosSdvPX/TvdcMG6Kjdjxkd472IaKCZKU4bjX
	 tUOFhgzTLfbKff8PtyyhRU6UE3IIua2nc3+35Mmg=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>

The linux kernel which carries the source of the device-tree-compiler
and libfdt verbatim makes use of the include guards in libfdt_env.h and
fdt.h to substitute kernel specific versions of the files. Unfortunately
because these hare included in libfdt.h using angle brackets they are
looked for in the "system" header location instead of the same directory
as libfdt.h. This means that any file that includes libfdt.h needs to
have special CFLAGS to add the path containing libfdt_env.h and fdt.h
just so that their contents can be discarded by the include guards.

By using quotes in libfdt/libfdt.h it picks up fdt.h and libfdt_env.h
from the source directory without needing to add CFLAGS for the sources
that happen to include linux/libfdt.h.

Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
---
Hi,

This patch has bounced around a couple of other mailing lists[1] and I've
been directed here. This is a fairly linux-kernel centric problem so I'm
open to other suggestions. The desire has been expressed to avoid having
to have custom CFLAGS[2] just because a file needs to operate on the
flattened device tree.

Jon had previously mentioned a recollection that the angle brackets were
intentional[3] can anyone confirm or deny this?

Regards,
Chris
--
[1] - http://www.spinics.net/lists/devicetree/msg62553.html
[2] - http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/310297.html
[3] - http://www.spinics.net/lists/devicetree/msg62604.html

 libfdt/libfdt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 32d5227..020e760 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -51,8 +51,8 @@
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#include <libfdt_env.h>
-#include <fdt.h>
+#include "libfdt_env.h"
+#include "fdt.h"
 
 #define FDT_FIRST_SUPPORTED_VERSION	0x10
 #define FDT_LAST_SUPPORTED_VERSION	0x11
-- 
2.2.0.rc0

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
