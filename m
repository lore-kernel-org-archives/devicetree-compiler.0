From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v5 1/2] dtc: protect against null pointer dereference
 in srcpos_string()
Date: Wed, 30 Sep 2015 20:32:44 -0700
Message-ID: <560CA95C.6010109@gmail.com>
References: <560CA87E.1010103@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=oipM9eFCFR3iQZ0TW9+Kypsu8xtyyJ2qRd3Ga1MGxvM=;
        b=oyiIvStn0AEk5tiwjB2d7UNA/Ugn1Fp9Ymi8HBfDqblzg8v4uj/fX2Q76WYzFzolnO
         5RpfpGS7riuOCOEqmcGsYAYU3WcscKWT8BW2qsqDUWrMsJ4SMkJYHyt9VXIqlQEmnvSN
         +kvbty1HhcX1j10nvyVB0xzIxPpnB660qlFlKesULjtici42s/CsCV6/NngkNVOZojvv
         cWNeOVqowXBb6fDXdABV2nMgv5LRnaJ+IFolvfh6gm2UttefSj6fs/LyGjEPIWLVGBS/
         hu7px11WcKh0nx452mUrPxI0fJCsJmVV7gVvdpp+KcinRwLockIm/JjKhrlFCxU4KuzJ
         Muyg==
In-Reply-To: <560CA87E.1010103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Check for NULL pos before dereferencing it in srcpos_string().

Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 srcpos.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: b/srcpos.c
===================================================================
--- a/srcpos.c
+++ b/srcpos.c
@@ -272,7 +272,9 @@ srcpos_string(struct srcpos *pos)
 		fname = pos->file->name;
 
 
-	if (pos->first_line != pos->last_line)
+	if (!pos)
+		rc = asprintf(&pos_str, "%s:0", fname);
+	else if (pos->first_line != pos->last_line)
 		rc = asprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
 			      pos->first_line, pos->first_column,
 			      pos->last_line, pos->last_column);
