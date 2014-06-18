From: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Subject: [PATCH 3/4] Microsoft Visual C patches
Date: Wed, 18 Jun 2014 20:03:18 +0300
Message-ID: <53A1C656.7050608@errapartengineering.com>
References: <539DBFC8.4050204@errapartengineering.com> <20140616104628.GB29264@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010503080806060300040006"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140616104628.GB29264-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is a multi-part message in MIME format.
--------------010503080806060300040006
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------010503080806060300040006
Content-Type: text/plain; charset=windows-1257;
 name="fopen.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fopen.patch"

commit 446c8c45fffdb46a53a6ff9fdfe85311d1209747
Author: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>
Date:   Wed Jun 18 17:58:22 2014 +0200

    Open binary files in binary mode.
    Signed-off-by: Andrei Errapart <andrei-VvktuG2w+SIZux3j3Bed6fC9HSW9iNxf@public.gmane.org>

diff --git a/dtc.c b/dtc.c
index d36ccdc..e3665b6 100644
--- a/dtc.c
+++ b/dtc.c
@@ -237,7 +237,7 @@ int main(int argc, char *argv[])
 	if (streq(outname, "-")) {
 		outf = stdout;
 	} else {
-		outf = fopen(outname, "w");
+		outf = fopen(outname, "wb");
 		if (! outf)
 			die("Couldn't open output file %s: %s\n",
 			    outname, strerror(errno));
diff --git a/fstree.c b/fstree.c
index 4d2791c..6d1beec 100644
--- a/fstree.c
+++ b/fstree.c
@@ -52,7 +52,7 @@ static struct node *read_fstree(const char *dirname)
 			struct property *prop;
 			FILE *pfile;
 
-			pfile = fopen(tmpname, "r");
+			pfile = fopen(tmpname, "rb");
 			if (! pfile) {
 				fprintf(stderr,
 					"WARNING: Cannot open %s: %s\n",
diff --git a/srcpos.c b/srcpos.c
index 4549773..f534c22 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -77,7 +77,7 @@ static char *try_open(const char *dirname, const char *fname, FILE **fp)
 	else
 		fullname = join_path(dirname, fname);
 
-	*fp = fopen(fullname, "r");
+	*fp = fopen(fullname, "rb");
 	if (!*fp) {
 		free(fullname);
 		fullname = NULL;

--------------010503080806060300040006--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
