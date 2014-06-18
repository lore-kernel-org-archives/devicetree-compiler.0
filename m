From: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Subject: [PATCH 4/4] Microsoft Visual C patches
Date: Wed, 18 Jun 2014 20:04:12 +0300
Message-ID: <53A1C68C.5010508@errapartengineering.com>
References: <539DBFC8.4050204@errapartengineering.com> <20140616104628.GB29264@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020706000101090906000904"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140616104628.GB29264-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is a multi-part message in MIME format.
--------------020706000101090906000904
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------020706000101090906000904
Content-Type: text/plain; charset=windows-1257;
 name="signed-char.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="signed-char.patch"

commit 50023c6f8717ee1939ebba885feb9f43fdb7dd33
Author: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Date:   Wed Jun 18 08:21:01 2014 +0200

    For Microsoft C compiler, char defaults to signed char.
    Signed-off-by: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>

diff --git a/treesource.c b/treesource.c
index bf7a626..2386b93 100644
--- a/treesource.c
+++ b/treesource.c
@@ -178,7 +178,7 @@ static void write_propval_bytes(FILE *f, struct data val)
 			m = m->next;
 		}
 
-		fprintf(f, "%02hhx", *bp++);
+		fprintf(f, "%02hhx", (unsigned char)(*bp++));
 		if ((const void *)bp >= propend)
 			break;
 		fprintf(f, " ");

--------------020706000101090906000904--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
