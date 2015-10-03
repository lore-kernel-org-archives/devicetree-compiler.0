From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v6 1/3] dtc: protect against null pointer dereference
 in srcpos_string()
Date: Fri, 02 Oct 2015 21:49:08 -0700
Message-ID: <560F5E44.9080006@gmail.com>
References: <560F5D15.9060606@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=b3WhDFfqB8v95TRTqtlsiAf6P72+Upg6IdzOWYP8yvY=;
        b=KNOj/WNUp09nNAZc4ZsVu0tRODdJXrlsK5XaWoO4+6AHEF/JzgcsZD3peDBP3REBiI
         IjP48sh0t34vb/mPBdd8d5TtXDVdsBZZ7UuGCImt5+p/Eukn+iagMFQT9GgRCyiHhr1y
         rUOTfbkE0kD1vBOE4HUzDG19UwzRp3GdrxLTgs0p4hkxk/MzXIlb/i8f9UuIgQbx93yN
         og2wnFIu9ne1n24abju+iBaHz4ufeaEU6ZzJgKJnm4wRmdL7qbPzDnkWbNF91mKSUzqR
         MB8EW9jdZSxg3XE5XyI3ejpi0afRIsna8y+Pno69ZW6yjKuXZA62JgV5Yxkl6GElsNKw
         +T9Q==
In-Reply-To: <560F5D15.9060606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Check for NULL pos before dereferencing it in srcpos_string().

Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 srcpos.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Index: b/srcpos.c
===================================================================
--- a/srcpos.c
+++ b/srcpos.c
@@ -268,11 +268,13 @@ srcpos_string(struct srcpos *pos)
 	char *pos_str;
 	int rc;
 
-	if (pos)
+	if (pos && pos->file)
 		fname = pos->file->name;
 
 
-	if (pos->first_line != pos->last_line)
+	if (!pos)
+		rc = asprintf(&pos_str, "%s:<no-line>", fname);
+	else if (pos->first_line != pos->last_line)
 		rc = asprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
 			      pos->first_line, pos->first_column,
 			      pos->last_line, pos->last_column);
