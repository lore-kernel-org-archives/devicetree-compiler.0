Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551110;
	b=uIxFKc/UQIV/ic8qDsIS5M/3GVL1eGrgsgZbtcRF54l6nsgWVBA7yaRaRnaA147yfBCv
	 BYj7L7WlHBtXpMQtsLc7Okee/pR244aIWZE9l08HBN2//RydX5K4e8tREeXRuI0mjx/Fk
	 ebAo2FE7Dw+nRLgsJM6adYOPtY8Zry/a0nT/Y10UR0veN/GR+j29c0XCFPzgg5BAAsMGp
	 saHqhVcyczflG/03nS0fzkn7YuEnVTz2S/l2dMs+bQYPNgIPNr17IpZ7ewxgKhD/ikG+O
	 ot0KBBZM+ZPLKu1wK1Y5/izIYeuiTITvc8fxgYPLLRJAuwT7k9IWtgneRc5W3i6hqbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FER6iW65BYBx4t+Dl6h4VxyICIYJnBSMRgiJY8VbUx0=;
	b=n1CCuYkbSkhlHS21+MLXUEdcyELv7pngZWPjSCoHhurJ4B5BXZg9EHKfK1FLHyN9gAru
	 8isdN0uCcy0+GYOV6YDGaNZTHzMyHEwxOYmBzqs/DZgxgQMqkvssCrMoQXo30RYrOX4WB
	 skPf3TUluCy2fUyPkbugpgl6SfLQiM6awDdFk0V0KNEGUGi1wSjxMTm3Dzf8RAcqeIlRR
	 3ZjtF5XtEiVCFYpuxw3cUxQyKzp9lixSjEiZakB15wsQwKsPaQPCiWlM9uXjZc0gtofaQ
	 a0SPm199lCJ8uw9DKHU0SPTtHY2GExXJ5Q40g5rkPC18a1aZ0sHbGy9kto4qzzmvJdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XsKEhxy0;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E7D606A324
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E7D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XsKEhxy0
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-85d363fb73cso1328580a34.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551109; x=1794155909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FER6iW65BYBx4t+Dl6h4VxyICIYJnBSMRgiJY8VbUx0=;
        b=XsKEhxy0h6NokgxXYOtaSGv6rv/Go+2zubaCEZs5nY8GYbAsw8Gh1GO/FXxGe/0du8
         Ps+0VHmihSCqT7FpCnnPf+oxRWlbaImLOs5eRWgyTUUmmHbpNlloosJNUyo1ldIbxdAH
         fXDkSnQ4PGnogb++vM34Yqx3pf1B1OM/Lk6Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551109; x=1794155909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FER6iW65BYBx4t+Dl6h4VxyICIYJnBSMRgiJY8VbUx0=;
        b=fK6nCnkk936tRZbJO3PBj4bLE6AWnIaYCa1YmGsKpx54xXoxkgmQCh0n1t9Emcdllj
         vPmlX0Ojb8uP15ontLr2y4Cdm+3e4O6VMXMda14eOOPOOOAIz1oT7aAcTPJrvJoqIUZX
         luigKQiUkhB3klslXdU4tEqDvpdBnMrQJUAYJkb4fSvnLSiw5LhyUnzGbyqSlxp0M4XN
         tNXthhUIuEdDPMKPAFDTXFfK58wJmN9CUDH8/fKb5/qmCGxLTwK1/Xf9hHfL54CIsFf+
         sjPXQYicUIVv38iNscGg9uaSEIdDZxYMjns3mDHwofAhY+oHKK7LxUm8yTfIXFE6XTK8
         TcmQ==
X-Gm-Message-State: AFq9FYKKTrxDKZBmh4blp/GgaOmoKoGllf8XZ854KLsB6FoDXXyL+X/5
	wawzRwfBWUWykmrFQJ78U7Oj1tMh23eEVJOnX6DNI3UaBKg3mD9pEN+8QxIsXJVMkiI/ajf8qYi
	4JetHaoAt
X-Gm-Gg: AYBFou2a/zsdwACWPZ5HINBPKjeo3LXx4Mu50DOOlUKXnouxjJUnHhgjKvXs+VvIG+f
	1l58WoeHsgRErQkNHIX4ag7T4T9Zz1+ROn6xjtmU5tm4gNfW+RaHqNd+mLTNENbC71DAFX0dZhu
	HtSesaWi6GWugoqt4aaGq5+f7JrUvIxqaNRM2uTGEV3a+Asvsh3zJEtSeFN6KTeWNG6V1w49lWf
	2+ffrhz6MpZFX+fDLYnNRXbGQj4+LF4JM9gjlnuNk2BuCMfug1jnqyIiC1qAfsP8EMmFjyk/Wcs
	CA64XhhvGWJhEhjh927tfwfz7MVV7Igz/iUqzy4goCGcxhv/1qNexaYiox2RNtYFOuMBQeFEiH8
	w8swqypG0B4NCsTq5Li2L/ZxV4FzsAGdOIMTaNbH2J3l8p/j1ktuejmzOOzA7xTLDvA0gWiQwpo
	NSbZsXQhc4EjJfkl4FR3j4PisCXUS/lgP2SQVruApxM9JueRvJRlnnkLX9P3Xx2OaY83FBlYUY0
	DSACpw03OMa0J5SB3gGLWcpfzSJXuvhKjJzsN4P2kOaHPDoP60vb33IQ1+P2JfK0hbWK/FYfbLT
	iaaTTVI+hnLWz0yAV00iF8D9evDbH4ZvqWjcgni+jgDIH4bWBf+BPVcevThHtRQtUBKJl/ndKzZ
	mMdXcjS7j03qRk4xnASDHq4Q=
X-Received: by 2002:a05:6830:4116:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-85d3634481amr5556224a34.6.1793551108691;
        Sun, 01 Nov 2026 08:38:28 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:27 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 06/13] dtc: Move label-reference handling out of the grammar
Date: Sun,  1 Nov 2026 09:37:00 -0700
Message-ID: <20261101163721.2458982-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101163721.2458982-1-sjg@chromium.org>
References: <20261101163721.2458982-1-sjg@chromium.org>
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

The grammar action for a top-level &label { ... } holds its merge logic,
including making an overlay fragment in a plugin when the label is not
found.

Move it into a new merge_label_ref(), passing it a struct fragment for
the reference and node. The rule cannot use fragment_ref yet, since a
path reference still has its own rule, so it builds the fragment itself.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc-parser.y | 23 +++++++++--------------
 dtc.h        |  1 +
 livetree.c   | 25 +++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 7545895..1a5ad12 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -227,21 +227,16 @@ devicetree:
 		}
 	| devicetree DT_LABEL_REF nodedef
 		{
-			struct node *target = get_node_by_ref($1, $2);
+			struct fragment *f = build_fragment_ref($2, false, &@2);
 
-			if (target) {
-				merge_nodes(target, $3);
-			} else {
-				/*
-				 * We rely on the rule being always:
-				 *   versioninfo plugindecl memreserves devicetree
-				 * so $-1 is what we want (plugindecl)
-				 */
-				if ($<flags>-1 & DTSF_PLUGIN)
-					add_orphan_node($1, $3, $2);
-				else
-					ERROR(&@2, "Label or path %s not found", $2);
-			}
+			f->node = $3;
+			/*
+			 * We rely on the rule being always:
+			 *   versioninfo plugindecl memreserves devicetree
+			 * so $-1 is what we want (plugindecl)
+			 */
+			if (merge_label_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE fragment_ref ';'
diff --git a/dtc.h b/dtc.h
index d145b03..256017f 100644
--- a/dtc.h
+++ b/dtc.h
@@ -369,6 +369,7 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
 bool is_ref_relative(const char *ref);
+bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin);
 bool merge_delete_node(struct node *dt, struct fragment *f);
 bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
 
diff --git a/livetree.c b/livetree.c
index 027682a..2a01d49 100644
--- a/livetree.c
+++ b/livetree.c
@@ -548,6 +548,31 @@ bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Merge a fragment which refers to a label into the node with that label. In
+ * a plugin, a label which is not found becomes an overlay fragment.
+ *
+ * Returns true if there is an error, which has been reported.
+ */
+bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	if (target) {
+		merge_nodes(target, f->node);
+		return false;
+	}
+	if (!plugin) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return true;
+	}
+	/* The label may be in the base tree, so add a fragment@N node for it */
+	add_orphan_node(dt, f->node, f->ref);
+
+	return false;
+}
+
 /*
  * Delete the node which a /delete-node/ fragment refers to
  *
-- 
2.43.0

