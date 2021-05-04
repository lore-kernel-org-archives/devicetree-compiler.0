From: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] dtc.h: add strends for suffix matching
Date: Mon,  3 May 2021 20:59:42 -0700
Message-ID: <20210504035944.8453-3-ilya.lipnitskiy@gmail.com>
References: <20210504035944.8453-1-ilya.lipnitskiy@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gSJ2Qk7XnNsNafM6Jmvgp/c4wPb98spc51NWk5eRo3A=;
        b=UsPbQiptv43WN3Fx2OZxr2pubkYUIc/slZ0heCbucVPZJt9Qnub+avNeyNumLBaI/E
         lstPzHF0GQBNI/9YcnhnI/zCESBKXpRuU32qYoBBU9mP/V0hIjyPsBQhT7Nblhr/2Oh1
         vOO2NAPuR9IovHd07N36qBk7+9mvTccMjO713mmWQe2v7ku6cwHhO18cptVF/gJ5/SKN
         nrkHY7JOhYQBZUS9skyCFSH+r/EiW6vlNwTdezhHMNZkn9iThetEAquhausw+SCKl5ZV
         QT+KEgjHbNRHk6QceDO0Tb0Xkdy2PxHuAQKDBgBO4LwgEAorIN53Mz29PfqAKGKYbYTY
         wdWA==
In-Reply-To: <20210504035944.8453-1-ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Logic is similar to strcmp_suffix in <kernel>/drivers/of/property.c with
the exception that strends allows string length to equal suffix length.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 dtc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/dtc.h b/dtc.h
index d3e82fb8e3db..62963617c79a 100644
--- a/dtc.h
+++ b/dtc.h
@@ -86,6 +86,16 @@ static inline uint64_t dtb_ld64(const void *p)
 #define streq(a, b)	(strcmp((a), (b)) == 0)
 #define strstarts(s, prefix)	(strncmp((s), (prefix), strlen(prefix)) == 0)
 #define strprefixeq(a, n, b)	(strlen(b) == (n) && (memcmp(a, b, n) == 0))
+static inline bool strends(const char *str, const char *suffix)
+{
+	unsigned int len, suffix_len;
+
+	len = strlen(str);
+	suffix_len = strlen(suffix);
+	if (len < suffix_len)
+		return false;
+	return streq(str + len - suffix_len, suffix);
+}
 
 #define ALIGN(x, a)	(((x) + (a) - 1) & ~((a) - 1))
 
-- 
2.31.1

