From: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Subject: [PATCH 2/4] Microsoft Visual C patches
Date: Wed, 18 Jun 2014 20:02:28 +0300
Message-ID: <53A1C624.60608@errapartengineering.com>
References: <539DBFC8.4050204@errapartengineering.com> <20140616104628.GB29264@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080400070003010207000203"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140616104628.GB29264-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is a multi-part message in MIME format.
--------------080400070003010207000203
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------080400070003010207000203
Content-Type: text/plain; charset=windows-1257;
 name="dtc-header.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dtc-header.patch"

commit 8216d97ee62aadac330c9ff85f3775fcd3c760d3
Author: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Date:   Wed Jun 18 18:07:04 2014 +0200

    Work around MSVC limitations:
    1) No variadic macros in the form "args..."; this is a GCC extension.
    2) No empty struct initializers. In any case, there is very little to win: { } vs. { 0 }.
    Signed-off-by: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>

diff --git a/dtc.h b/dtc.h
index 20de073..56212c8 100644
--- a/dtc.h
+++ b/dtc.h
@@ -38,9 +38,9 @@
 #include "util.h"
 
 #ifdef DEBUG
-#define debug(fmt,args...)	printf(fmt, ##args)
+#define debug(...)	printf(__VA_ARGS__)
 #else
-#define debug(fmt,args...)
+#define debug(...)
 #endif
 
 
@@ -88,7 +88,7 @@ struct data {
 };
 
 
-#define empty_data ((struct data){ /* all .members = 0 or NULL */ })
+#define empty_data ((struct data){ 0 /* all .members = 0 or NULL */ })
 
 #define for_each_marker(m) \
 	for (; (m); (m) = (m)->next)

--------------080400070003010207000203--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
