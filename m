From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 3/3] dtc: dts source location annotation, short
 location format
Date: Tue, 06 Oct 2015 00:32:26 -0700
Message-ID: <5613790A.3070605@gmail.com>
References: <560F5D15.9060606@gmail.com> <560F5FB5.3020602@gmail.com> <20151006050114.GL3861@voom.fritz.box>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=AxyUZVANpgkkkDp8eS96f49Ux0/lZD14JnZGWI5vnIo=;
        b=G5v98S0AWORWBQJ8G//Cb9C0UMdumA6n9z0G8hHSbnUesakyGDoOZkHJw13We+emYY
         Od2Liat5PQmwHLGOPZAGhYC6uyRQJjmmRrgwQbTyGKrrGc3m2ozn5GInNSzLS4n1u70K
         DdudpqQXZnmcAxb9++HlLWWl/kflxsEfS6v1E3jVa/a78JxgD7jR/e3Xu5xAE5qfmOMh
         H2xbTFRww9iKaOBz3M/isognjol4ZqxU4mPXf5naPE/IvKkpvDlubbaq+SsoMEZaKTFl
         LkdSeX+P4sw6EJIwM8kKbsxgT+iV6eROVFM8YbK3cvsWlFQrMDv9kFheyECGJrwPg7FS
         4vtQ==
In-Reply-To: <20151006050114.GL3861-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 10/5/2015 10:01 PM, David Gibson wrote:
> On Fri, Oct 02, 2015 at 09:55:17PM -0700, Frank Rowand wrote:
> 
> Uh.. the actual patch seems to be missing.
> 

Ah, the fun of broken email tools.  I'll be changing my email tools
in the near future.

This version of the patch is intended to show what is involved
in creating the short input, given the changes to the other
patches.  If it looks reasonable, I will add the modifications
to --annotate to allow a choice of either short or long format.

This version also has a totally awkward:

   srcpost_string_short()
   {
     if (pos)
        ...

     if (!pos)
        ...
     else
        ...

which I will fix in the next version.

-Frank




From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Show only the current line number in each source annotation instead
of the full range of the object.

TODO:
  - modify "--annotate" command line option to choose short or long annotation


Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 srcpos.c     |   34 ++++++++++++++++++++++++++++++++++
 srcpos.h     |    4 ++++
 treesource.c |    8 ++++----
 3 files changed, 42 insertions(+), 4 deletions(-)

Index: b/srcpos.c
===================================================================
--- a/srcpos.c
+++ b/srcpos.c
@@ -327,6 +327,40 @@ srcpos_string(struct srcpos *pos)
 	return pos_str;
 }
 
+char *
+srcpos_string_short(struct srcpos *pos, int first_line)
+{
+	const char *fname = "<no-file>";
+	char *pos_str;
+	int rc;
+
+	if (pos)
+		fname = pos->file->name;
+
+	if (!pos)
+		rc = asprintf(&pos_str, "%s:<no-line>", fname);
+	else
+		rc = asprintf(&pos_str, "%s:%d", fname,
+			      (first_line) ? pos->first_line: pos->last_line);
+
+	if (rc == -1)
+		die("Couldn't allocate in srcpos_string_short");
+
+	return pos_str;
+}
+
+char *
+srcpos_string_first(struct srcpos *pos)
+{
+	return srcpos_string_short(pos, 1);
+}
+
+char *
+srcpos_string_last(struct srcpos *pos)
+{
+	return srcpos_string_short(pos, 0);
+}
+
 void srcpos_verror(struct srcpos *pos, const char *prefix,
 		   const char *fmt, va_list va)
 {
Index: b/treesource.c
===================================================================
--- a/treesource.c
+++ b/treesource.c
@@ -204,7 +204,7 @@ static void write_propval(FILE *f, struc
 
 	if (len == 0) {
 		if (annotate) {
-			srcstr = srcpos_string(prop->srcpos);
+			srcstr = srcpos_string_first(prop->srcpos);
 			fprintf(f, "; /* %s */\n", srcstr);
 			free(srcstr);
 		} else {
@@ -238,7 +238,7 @@ static void write_propval(FILE *f, struc
 	}
 
 	if (annotate) {
-		srcstr = srcpos_string(prop->srcpos);
+		srcstr = srcpos_string_first(prop->srcpos);
 		fprintf(f, "; /* %s */\n", srcstr);
 		free(srcstr);
 	} else {
@@ -262,7 +262,7 @@ static void write_tree_source_node(FILE
 	else
 		fprintf(f, "/ {");
 	if (annotate) {
-		srcstr = srcpos_string(tree->srcpos);
+		srcstr = srcpos_string_first(tree->srcpos);
 		fprintf(f, " /* %s */\n", srcstr);
 		free(srcstr);
 	} else {
@@ -282,7 +282,7 @@ static void write_tree_source_node(FILE
 	}
 	write_prefix(f, level);
 	if (annotate) {
-		srcstr = srcpos_string(tree->srcpos);
+		srcstr = srcpos_string_last(tree->srcpos);
 		fprintf(f, "}; /* %s */\n", srcstr);
 		free(srcstr);
 	} else {
Index: b/srcpos.h
===================================================================
--- a/srcpos.h
+++ b/srcpos.h
@@ -107,6 +107,10 @@ extern struct srcpos *srcpos_copy(struct
 extern struct srcpos *srcpos_copy_all(struct srcpos *pos);
 extern struct srcpos *srcpos_combine(struct srcpos *left_srcpos, struct srcpos *right_srcpos);
 extern char *srcpos_string(struct srcpos *pos);
+extern char *srcpos_string_short(struct srcpos *pos, int line);
+extern char *srcpos_string_first(struct srcpos *pos);
+extern char *srcpos_string_last(struct srcpos *pos);
+
 extern void srcpos_dump(struct srcpos *pos);
 
 extern void srcpos_verror(struct srcpos *pos, const char *prefix,
