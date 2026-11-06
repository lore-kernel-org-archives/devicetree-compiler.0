Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994812;
	b=RUtmhncgAZ8L0EpMAWSe3Sq5W1MSZswwr9EHb5IZLbF74aKHZGDkv6b1zNzVW2pYxEH9
	 Duv9xn7vr97s0jp+jzrmE1+R4/GgfGHUWtnOXN4R8zHKQl9OZWWlrk7AZY33CO1/4andG
	 TC7r34TAgkDHbgBKt39ZofNPD/5o6Go53EltrYwVPeYbU6GSrGWxJkzp+gto3B346YbAJ
	 o64RW+gOEWAeOroRoHAGj3FGKbp7i1+zx3+9/Qh6BrWnaNaqLppJqPKAEf96m46y7VJI7
	 UZUEB/Xyz1ppi57YhYx5oKg9586JtiBNqJ4y5mLIo3pj+J6djf9xcqpPgTZXQnsvCxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U7QPr+T3OI38Z6RDEcerSXpYIx7/DkyhioKUfULelaY=;
	b=tuzPOrkqYR3HukE5c44rRmPoBEmoB6VBkvYRbrw3o/ry4rjCajEr8lHdaoSsjQG6nKs8
	 RaeAgTN9zAz7Ry0DfAB0YeLPu5a/b7EUsmH7zMZmcWT6nXigZVEv1dlikeQekd5yCKoxY
	 EmvfqBNKss3s+UWrw3j4DHKsTJQxAhtGHnWhWVXMJlAfJJDUjtWPLnBMjUQR+5j53wLC5
	 k7oMwFkmEnl7mf2koiKqiJh2gpN8FFT4za/Am+WKCLEX9tGGXCD/pJnlAkCnOzS313KBP
	 wlIXLSiXSL6oA/zGuj5yYdXQuV+ssufUW6H1jItajQPTDndKaspvaDPXmKgjv6s6b1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XLOKMbNl;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1903D606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1903D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XLOKMbNl
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4adba7b3399so161720fac.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994811; x=1794599611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7QPr+T3OI38Z6RDEcerSXpYIx7/DkyhioKUfULelaY=;
        b=XLOKMbNlj8AoTtZsZKs2ZC2OLpZdf4CBbEQDaGNJfeYsGyVcwxJev5xTpzgYX/OO1C
         TWzSG2p0lh3W/u3XQj2i/g0yklMc0gA0ehqGQW24hdXWvOWMwA/TUNRm6mdhCH91UFX8
         8QePr4GqYwuG48QNBtewlMJ+O4G1agkAZ/tK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994811; x=1794599611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7QPr+T3OI38Z6RDEcerSXpYIx7/DkyhioKUfULelaY=;
        b=mZWQz8/wR+2XLw3chJmqhUMIECAy7hVrZBVjIGiL/8LRX39csXAb7ZAQypXbbPiBz1
         YO+BNFwyS9NcGzIr7S07MUVLXgTwzQC/dF07iolXB6/ecgTy4ZUKUV/9FooaKAUxPgZe
         AKkVGCtjU9aMjO7jbMaiN5J9aNkF0WRgWfGp91tjNZZXCvXplwIzVIvSVwg4Ostl/jZ1
         E+5ZF0KHPUgzgCffgmbQwQ5JqeQnn7bn/eoun948bAIA+WZXicGJlk+KCqjpPijZKqLJ
         TLIKIP3TtLP5jIJeTSaQnRnBeOC3XcwTlaCX44Ee7Svw9AtySSaQlw1Olv1Xi4D3NQEG
         5smA==
X-Gm-Message-State: APuU4Z9AEZ+CNLJ4y9Q0+RzrSfSLk1IwdFG5PPzelWF3ruyGyzu7U7f6
	Y/Y850FfPmRn3dsH3Szu+BqKpPidZKiiCQY+sk4bYItmSDg1X6CQ6lnMrz6sGWrFMvGaktsGWNJ
	TubA7bA==
X-Gm-Gg: AYBFou1eKHVYmZhKcrUDwkatsRMtkDFhLa8CzcCjFIX+nnLANwc/8soB8VyL2cQaeMQ
	kyQX8kUH/gFahB78F5C7ongiA8IR3cJv6WxKHvmUoRwL+dsNFXEpmKr7qEgpVyiu6EeyvEOg06A
	eroE6CWmXJI+r0cvz4i524mrV4SXxT3B0zYV91cNGx8+myXc8luLnwv2JQzs6MxmrWPegne26gy
	FF4iLnyyGdDxF6/ALNBMBaDDb72T2NEXxIOmtvP3JP60O+dWZkxiMm6roUVpMIhN4uCUga847yt
	Iy/mg9hESt+r1hSCKQAtz7uFkxqBwjo+XK1X+GeR9J9/FBcp+pquL4rlcDumiRUEae+RFk9IjiK
	ZNCUurDdcrgKmVGNTlQr8cevQTFuKHUNibkmBaqqC8m4a6JPG1l2Y/wmcPITDbGPgHypsenkfRF
	dJN2IoHNIIgyBqSgKmJ9Pmdsg4BBt8e0Ilma7W7f8vzqktaCA79cIEgi5hJtQqVbWO3Zz89kHYn
	U9wYhcMP6UKEsRR0QoaZtg72SxbCKFEVO5nuSjYef9kGF9odxggchHOrT+gxkOkKs74LoiF1Bbn
	q4/aeo9JaCOexDhiDBB+yUVvoVpzx9sq4qxyVwUPS3g32+66Ph9jz3OFc0GUC8M2LOgXM5EUW8Z
	ARoOp0r5X7dTbX5QoXVA7
X-Received: by 2002:a05:6808:2382:b0:55c:a67:d111 with SMTP id 5614622812f47-567e145b5d1mr2339410b6e.19.1793994811114;
        Fri, 06 Nov 2026 11:53:31 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:29 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 11/18] dtc: Move first-reference handling out of the grammar
Date: Fri,  6 Nov 2026 12:51:38 -0700
Message-ID: <20261106195159.2623314-12-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106195159.2623314-1-sjg@chromium.org>
References: <20261106195159.2623314-1-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a plugin, the first top-level fragment can refer to a label or path
instead of being the root node. The grammar action for this holds its
merge logic, which makes an overlay fragment in a new tree.

Move it into a new merge_first_ref(), passing it a struct fragment for
the reference and node. This is the last user of is_ref_relative() in
the grammar, so make that function static.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- Use dt_ref instead of fragment_ref
- Return true on success from merge_first_ref()

 dtc-parser.y | 13 +++++--------
 dtc.h        |  2 +-
 livetree.c   | 30 +++++++++++++++++++++++++++++-
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 8d505a1..abeee0d 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -163,19 +163,16 @@ devicetree:
 		}
 	| dt_ref nodedef
 		{
+			struct fragment *f;
+
+			f = build_fragment_ref(NULL, NULL, $1, &@1, $2);
 			/*
 			 * We rely on the rule being always:
 			 *   versioninfo plugindecl memreserves devicetree
 			 * so $-1 is what we want (plugindecl)
 			 */
-			if (!($<flags>-1 & DTSF_PLUGIN))
-				ERROR(&@2, "Label or path %s not found", $1);
-			else if (is_ref_relative($1))
-				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1);
-			$$ = add_orphan_node(
-					name_node(build_node(NULL, NULL, NULL),
-						  ""),
-					$2, $1);
+			if (!merge_first_ref(&$$, f, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
diff --git a/dtc.h b/dtc.h
index 9b4389b..1befd5c 100644
--- a/dtc.h
+++ b/dtc.h
@@ -372,7 +372,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
 					       struct srcpos *ref_srcpos);
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
-bool is_ref_relative(const char *ref);
+bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin);
 bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
 bool merge_delete_node(struct node *dt, struct fragment *f);
 bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
diff --git a/livetree.c b/livetree.c
index 7ab9437..26d39df 100644
--- a/livetree.c
+++ b/livetree.c
@@ -568,11 +568,39 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 }
 
 /* Check whether a reference is relative to a label, e.g. &{label/node} */
-bool is_ref_relative(const char *ref)
+static bool is_ref_relative(const char *ref)
 {
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Make the tree at *dtp from a first fragment which refers to a label or path,
+ * rather than being the root node. This is only valid in a plugin, where the
+ * fragment becomes an overlay fragment.
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
+{
+	bool ok = true;
+
+	if (!plugin) {
+		srcpos_error(f->node->srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		ok = false;
+	} else if (is_ref_relative(f->ref)) {
+		srcpos_error(f->node->srcpos, "Error",
+			     "Label-relative reference %s not supported in plugin",
+			     f->ref);
+		ok = false;
+	}
+	/* Make a new, empty tree with a fragment@N node for the reference */
+	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
+			       f->node, f->ref);
+
+	return ok;
+}
+
 /*
  * Merge a fragment which refers to a label or path into the node it refers to,
  * adding any label in the fragment to that node.
-- 
2.43.0

