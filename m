From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v4 1/2] dtc: protect against null pointer dereference
 in srcpos_string()
Date: Wed, 30 Sep 2015 19:52:10 -0700
Message-ID: <560C9FDA.1090403@gmail.com>
References: <560C9D4B.1040603@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=xk9U2AF7v+GrnU70g8x6idhvLrVZT9m7zu5eO5GKb5k=;
        b=bYsKgQxV+aXBApSo+MNBKZqs1Tv+u3cRiZx9N1kLIpnBKhHT6M3+dBHigUmbjG3cDu
         lBVQya7C9Eov2lauRKkqBL2mRUUhARzryYxpRrsIwKhR2d3EB3tIKQokBBsTkoVbC6rj
         0tBTXZ2IF+iBMfbrSIbLmacuA0AJgJ0tGORF68U5oQ7D9oo6eUt74+mu2HAAdov2lWXK
         VAaggqoQYuddfKRQZ6aR8WpROoKiqzoN+gencWc5AruZDYc5komlUAxToXnWMpdFs5f4
         98NFn1XAH/QiTFkXqG/mttmXp/YyeiEk7KywhunTZ7v2jxdbDy5HNkE+jLsVi4OomPV2
         kzkQ==
In-Reply-To: <560C9D4B.1040603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Check for NULL pos before dereferencing is in srcpos_string().

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
