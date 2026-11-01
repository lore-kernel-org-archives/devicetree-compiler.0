Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551113;
	b=oGMDqFMFG4nbGQlISX3KzBZ45xsEyanXSmz+lu4juEp4KgijULgc9gPP4LPaLOeSIpxT
	 tcMx2h+BObqF6U/C5GdKL6ULAWrgG27s3nmuoQqY7MVFjo5LP74oK36Ml532PfwyRIy7S
	 Jy2b6vgg1Uf1CfCFoepVl718vdctxn1uXSs5I69ApdPQI4Qlmzw7K3MkDWKHzb8sm7ar+
	 54HvCWRdFHIZ3BJ68nkxK1GfbTZGXzvY1SJQLsIwknoqgMCs1tkXrx7qHKDUlf+NAv7Kg
	 ebxxvEOdgxH8Dn5k0CaqrES9PZDh/xZUgkmx0TGlRmlIigVsQp/fqfYQAW7yXjOtoSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LhFrAZAWoIw5SdUYrPu3ToIVnNJoL5wpJsr77Jr4dtw=;
	b=SxtzjoP/Wn/RVy+2uyM6SmkXbwQVDAJulwXsgKpLkbZqtxsJ0BmkAo+IxXiwju4Sw0cl
	 3oxLfPWtQV/H3xp1xcpfQ162nyh2zLeMdJPY1U3QlpMGFgEGXg5BHmy5c/roXFqGIdmKS
	 KfJNstLhuhQPS9omKnIQFF/RhOzk6FlYRTwZ74FPujpwwpe6WHLLOoihoZiJJbYWMpsTr
	 rR9I7Ylpwso12mIWfT1L5HExyTtQ08lZ/53CBupUMMJ03+U0VwwloRxGpSisNdGO8Hx1w
	 0R12Y6GeETf4znCufTK4HEbl5I3UGDI/awdGLJoX/7vWhvl/uatpamy2ePPkzW0bffg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CmTrC801;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6643F606A32C
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6643F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CmTrC801
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-84d5e56f876so1659711a34.3
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551112; x=1794155912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhFrAZAWoIw5SdUYrPu3ToIVnNJoL5wpJsr77Jr4dtw=;
        b=CmTrC801b5qDjvnCNCsnPpY5JqwyLS9J0dnbc8E8qmbw0Vi+uPO8ZMmuOgQfOQJQZq
         e+9omHzP+g9/ZpZ4ZmhKZUEUAlFLq4045VjgQMdSdxCEpHJtP4KritoMxctDfDX4vxNO
         RPGuksrgEA0Qtea9vUd6Dy4uWciRrpiXqywlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551112; x=1794155912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhFrAZAWoIw5SdUYrPu3ToIVnNJoL5wpJsr77Jr4dtw=;
        b=rLDrTHxsYdoQx5M7eRwMDbZPtyapKf9HM85WUeEsglOIuMmtWgFEDVBFOi0OzoLyQ8
         KyZbbeafWVKNjHswyptjkaRmKPJAhBmbdNg/5wPDOloOXXFmjblXPbzrO1++73My3we4
         YsM/btgCrwv1U3XISFiyjuUzVM+EC8JRS4Fy7vv//mKcRRCBrbH+WLZh1Mo/FQUtrW+T
         dsMb/Q+69UKvQFDOM7PttjN9whxibUhjy0bEbARHL+x9Lxn2Yu2IOyn57FbMrFl9HEmU
         WtZW8KTnwJI8K5MNSyo6RKcnjSjVaWtV/iAAKH/2XVJPX/9OzMS/qftB1pOJ1bIAX0re
         y+IA==
X-Gm-Message-State: AFq9FYLMRpxrUWzYlDv4dlo+IiODLa1WjfrE4c6xffYfaM26HxenKWz7
	iX/QfcyGGyZxnOIjxm3+cVqXoDDjZ+l3CHXtKs5bp+zVdyZ2Ajwz9xGkGXIQoKY/5KAyji6jLDJ
	T5oWpXDJa
X-Gm-Gg: AYBFou2Q4dXcAeQycyodyKOYCktnJc/ImQGxGK+2x7QZ99/iplMivl2ypVIaLihQ9WV
	g7aAoTYiRJu6prPq+5AQelGAvFf8GCul/vbjqZp58leVt+OUkx9tLdqgzoecdtik9Sql5rHih1O
	keTI5qPWLFSih804DkKPos3lajEvbCX17mHdbdUbzjiO9ooQlhnRAEwQSn//WmOKAXRHsXY8TyO
	1B+/9Wz0MSOFAHmuBp3BObSl2Oba8ioDWeeX98Zoktifxw3riiOI+AePOSOmKV9YskNuqgaIVUy
	gEDM/wC8uO3t80A40m+giJV3O/wXMcz6AZWzftVORToJZqdwjX9fbjMdm6AhkZQeBm2/BVYjjPg
	9Pju0CrFyfUq81mSogRWeMzZZcNgLAHRxoQ4Uq3AjSf/pahcJPVVvP/wO9m/tVyJjjZV/zQ0Or9
	biwnzNKkkn5/l/z5w45Jwi3F6ImBWsNAkrigkWm5kxBiGb7Q0EjnqeDzaikbbOQeBJPO5AplVuf
	TE1qRkLN5RDBnQqcpnzkCPrFmn/AYzPzVul6hQ/PvGcTB6SVcrUQBqgE9Jw7mnCflnPpvAYmnIj
	8zRCAl3JpvDQOfO5VOJB+eoyvjn2yfyZLuvx303GZfhXiuU8kHtepPqrfdsmjBr/UGi5RYdLIZk
	GKvlAk5uqrE+2+bhZUFsN/A==
X-Received: by 2002:a05:6830:3115:b0:806:e047:cd6e with SMTP id 46e09a7af769-85d36344439mr6866091a34.8.1793551112257;
        Sun, 01 Nov 2026 08:38:32 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:30 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 07/13] dtc: Move path-reference handling out of the grammar
Date: Sun,  1 Nov 2026 09:37:01 -0700
Message-ID: <20261101163721.2458982-8-sjg@chromium.org>
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

The grammar action for a top-level &{/path} { ... } holds its merge
logic, including making an overlay fragment in a plugin.

Move it into a new merge_path_ref(), passing it a struct fragment for
the reference and node, built in the same way as for a label reference.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc-parser.y | 17 +++++------------
 dtc.h        |  1 +
 livetree.c   | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 1a5ad12..cca3ce1 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -206,23 +206,16 @@ devicetree:
 		}
 	| devicetree DT_PATH_REF nodedef
 		{
+			struct fragment *f = build_fragment_ref($2, true, &@2);
+
+			f->node = $3;
 			/*
 			 * We rely on the rule being always:
 			 *   versioninfo plugindecl memreserves devicetree
 			 * so $-1 is what we want (plugindecl)
 			 */
-			if ($<flags>-1 & DTSF_PLUGIN) {
-				if (is_ref_relative($2))
-					ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
-				add_orphan_node($1, $3, $2);
-			} else {
-				struct node *target = get_node_by_ref($1, $2);
-
-				if (target)
-					merge_nodes(target, $3);
-				else
-					ERROR(&@2, "Label or path %s not found", $2);
-			}
+			if (merge_path_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
 			$$ = $1;
 		}
 	| devicetree DT_LABEL_REF nodedef
diff --git a/dtc.h b/dtc.h
index 256017f..5af1d1f 100644
--- a/dtc.h
+++ b/dtc.h
@@ -369,6 +369,7 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
 bool is_ref_relative(const char *ref);
+bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin);
 bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin);
 bool merge_delete_node(struct node *dt, struct fragment *f);
 bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
diff --git a/livetree.c b/livetree.c
index 2a01d49..b0362e4 100644
--- a/livetree.c
+++ b/livetree.c
@@ -548,6 +548,42 @@ bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Merge a fragment which refers to a path into the node at that path. In a
+ * plugin, the fragment becomes an overlay fragment instead.
+ *
+ * Returns true if there is an error, which has been reported.
+ */
+bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin)
+{
+	struct node *target;
+
+	if (plugin) {
+		bool error = false;
+
+		if (is_ref_relative(f->ref)) {
+			srcpos_error(f->ref_srcpos, "Error",
+				     "Label-relative reference %s not supported in plugin",
+				     f->ref);
+			error = true;
+		}
+		/* Add a fragment@N node which applies the node at the path */
+		add_orphan_node(dt, f->node, f->ref);
+
+		return error;
+	}
+
+	target = get_node_by_ref(dt, f->ref);
+	if (!target) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return true;
+	}
+	merge_nodes(target, f->node);
+
+	return false;
+}
+
 /*
  * Merge a fragment which refers to a label into the node with that label. In
  * a plugin, a label which is not found becomes an overlay fragment.
-- 
2.43.0

