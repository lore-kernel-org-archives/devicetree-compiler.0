Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827130;
	b=kOUDq/PuDSpucYaVZZ6VUc9X+9rWcuwE6DGufQXnRL80AvQx2UnArZ8dC5k/f6lA5yHZ
	 Y92dAI3QLzPeRYWPu4cS7pSKvzfOudXGFZlnVNrYTZDckHDWD4T4rtG7TKi2gs7un6BqT
	 ya5qph57PdZP7bo96bfKZOJatbW3uCdtqsGc1MgbiKSc8qf8ZAOuGd947YpBUI9NTT2vs
	 2E5j4rpPGpNJUUQNfJ4k34Aq56GqycMadSjBG+xcyqeUgVBcMaqEstmCd1xbRll4lXiOv
	 /+raJy38f3NlK80/xE09tZQ4KZml1ZfgIn7a1nMhHxvYG9QKg8t+/4lZgXFasYQLFpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UNl2arx63+dUBibf2InHGOCmoD11NezYK4VxL6teI1o=;
	b=tVOXOvErJJaCzBCelkGDNxD2ULOtNejjFGdVvzUbcHEoZB4xd/TjmRK4dOxVgQmoqiv/
	 fcqrtrTsX1xiZ8XrryE0CUyDR1iTSV4KYfSsgqhgL/7e+X+Rq1V9SCa6qx/zfDnn5thBf
	 suXBGnHUtwbamVCxKTcIdKP3OVTNwp38QuJuuoPtNcts2wds1Ywrd105zr8RAa9q459fP
	 7kV75rPaAwH0TNm9G24YZhJgputiMLVs7iZVKV7u+w33hAZSbyCWVdIXha+WXYfHu+Hc2
	 FsXKnuk5ontS+CHU37BsTXz8NZEmS6KK7ppkYQM6/u+s3gzlVdetY2gmqefmWRWMoqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lMC62Z5H;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE26608C988
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE26608C988
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lMC62Z5H
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6aa9606ddadso811747eaf.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827129; x=1794431929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNl2arx63+dUBibf2InHGOCmoD11NezYK4VxL6teI1o=;
        b=lMC62Z5H4KzQahss7TXc5d6f08Sxj/zO43RFpQF3SoB0euV9w7Gn9yIUznxx6+Xm9d
         BULlFdW3Nk4jm3hhQLAM0uVQ3vy2+d25qAWROTDU7oYApu2Eno2pZKMQCnGAjUOaNoMs
         YvFU1qV2iceJlUEAEGcjppDIMFY7Wg5Rvb6dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827129; x=1794431929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNl2arx63+dUBibf2InHGOCmoD11NezYK4VxL6teI1o=;
        b=GmfZUuicsAafE9gJVwSN3veIMVYYfhEmZGPa4GxYw4tpns+FfnACuLy1wRAh1SvWSz
         N7ParPY0NXTRBzjHtdJDYCxHkHkYVPAcTEfoX5OUdRGDoDo978/GRsOMVI3ukSXK/rcr
         eDdTVHMtzI8u8z5PbFS971oCduBsJKl9ZBtf4rYe8i0tFE+ZPAsF/CREhXdZlVCpd7i4
         TqsU0D134e2L0f/O+8zKsF/C0j/HTtrsdF0eEiGhapifeOuUfJ7YUx59RewAjYwsd13j
         yqukqh0tERJ8l6uPSNyr27xqBfp4CBbgi2jBRTO3vf1CFDjy7kBkpvTf6GBiIqKmgv/c
         7olw==
X-Gm-Message-State: APuU4Z/jG+VNWeugheySoCPhFOe5i44gGBT3/BCC7BY3AenHea5ZGdzx
	3/yANpKShegy94zO2k+lWNwdYu1yjk1f6uhwKLpPTUn+hTbYLnXhg/p1y1MUa0RpPN14beWOxg1
	QU+4pjQ==
X-Gm-Gg: AYBFou3mGe7Xks4WWvM3CMDA0JASmixRvXcImcOBMP5TxAOwXgvDRycGILBFoFwJx2A
	VANyMJ78QyXc2EgP0/hj7a3R4cUi6sYlCZ/4bSWIICZLq0m9Wvg4qYKETgREPTgUdrM9xcjy//Y
	osX+oc+JR+LRUmXK40lEckEPwBSzF5QZyLdN7k3Gq/2bk0uBVEUVZiE9jkSOojB6t/WZu30OW4I
	s7fzIaw3hjxOS/niGLvh12EDuKzYxjs2bbrzZq2eHed28h8/RE+ZJKiAM30oMGz2qvE4gjOtLEI
	9NpzFZuuOTjoYsH+Uw+nsx63mk5qeSWRkBfPKE86o4OiqAv9RRXk4xQLjfxo/dilBrS1sTAadu3
	hftJuWwsBqGTIeWHHkieVNo84p4QVfjlcolY8UO5ULE8lv1q2/iIYk+hOFsX61PLh5p01anZMdl
	IFEuR521ADuoGVGEVtYxl1Bu6hXWN5CCv4qGMsFCGolRbAZq/t0tzmqbkLU7TaehLdh9T7NxWrC
	C4KmoQE3my4Ogl+rx7s1OmbeVPteuXh8oIBEe4aGdTpKwDMEN72vSZoTchsm8BPDIVl0YkALdKK
	D9cBoTSU0HtZrMI3pFHD7+baVdD9Gxwk9rPK7hw8I7Yw6NWDAoL0VLaHyS0hViA3R/GTixMIeht
	ODLpVQ/jx8tn6RqggerEVYQ==
X-Received: by 2002:a05:6820:3519:20b0:6b7:8415:d796 with SMTP id 006d021491bc7-714f2a5b065mr6757414eaf.65.1793827128915;
        Wed, 04 Nov 2026 13:18:48 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:48 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 11/15] dtc: Move first-reference handling out of the grammar
Date: Wed,  4 Nov 2026 14:17:50 -0700
Message-ID: <20261104211807.972610-12-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104211807.972610-1-sjg@chromium.org>
References: <20261104211807.972610-1-sjg@chromium.org>
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

