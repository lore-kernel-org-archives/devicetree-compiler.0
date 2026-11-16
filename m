Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873521;
	b=0qvsuVGfpSfku1BFuvQqeKq/awnfiL+HuxDygHAnn8jtzd6AG4Wa2JLSgUMV+yJRid43
	 stCnRN6k3WS3wXAzJvGdwKTkNeTr6O+/7IpjYF1V8P+/HPP5xU4c1WVKFWB9TV+Sr8O2e
	 9vCUd0BddVb6aTDttSWDt+aA/ZYvMbBdFxAFkgXABqkX42IjzlZhfdV3yPglPNzxVlnsU
	 kVmLVwJZuHj2j6/zrDar8rpS6y/hUS2QrPqfWVGDmDF4gFXIJjoJOiicknmMnPdDhj1md
	 +JKxLkSjNPgLQ06jV1mjtbOf+wm6FzWWxpRfGHQU/xHtY0nSVptPFpwGyeGE7Nm5byg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cCsJCacpxbD9lUQ/cI5e2m6Qoq7fyrpcfNo4g5+TxyM=;
	b=VDWqqPnD15sj8502F+ZrGaEmXkbU86F7Dv1MGC+S//6+eZoFB0MYCHdYtVgdTkog/jp/
	 taJMR6T+LC/vYCA0HLw/obkXM4/hmHvNnw0eAiHdSsFlHJJFANqX9m16p5z/JXdQ5t8sG
	 wu+9Cb71Ok0dXK5uARiXBhich+TSK8g8YApq5VX0ZbuV/eiGoN5rSvCYMd6ofrnbicrq3
	 8k32CGCCbeGiO5bJsXNffYxDOfYhm6cW+tteptnQ2lbfEhCM7Q9kmVawZ7uexl0PPdbLW
	 NdyHeUAqbG65S9zv45U9Ji+0mWo9U88njJRIltftdTUvEJB5Xc2aG1gJ53JwauW0+sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IPhek8Ln;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F51606A31C
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F51606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IPhek8Ln
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-862b090e41eso1285545a34.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873520; x=1795478320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cCsJCacpxbD9lUQ/cI5e2m6Qoq7fyrpcfNo4g5+TxyM=;
        b=IPhek8Ln20zlKqJmVOHeHHj0oML/LASNkA6AAndfnpjiu8viNWAWMwYkj4PpUA8lj2
         8qJ6B/xpDuVdmUMeUzdVm0zzQmSYCcTjmznM9MICQJqkLjsuFe8HjeiuSpOBuZVtqV1J
         62UskhQ5vUqvRunnIxXaKasVydQMBGwgXu1rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873520; x=1795478320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cCsJCacpxbD9lUQ/cI5e2m6Qoq7fyrpcfNo4g5+TxyM=;
        b=xJHvHPS8Kst+XxH/oaS5spbTPZ68A61Q6Kq2hm5Zc88xpFrpQl5+LL/Vw7xkqx75al
         wQ+gzSUo22J8HVq6E7Ooc82hrFhYnUn5hqsuD+aOCu1mCjXr7q669I3r1tw4Ju9Vt+TP
         PjYzsOpJ60ixTVKi2JaXhpeg+qrCYsJUy9/GsQf9i2rSBWufozn2vW1JuYz5vqBmPHE0
         YKr4FUJ4nctPGfHm5y7IyTKJWj73BEWFHZwXCN2YbKSGtPfq+NxuN+PySZKDbSs31Lpr
         3rYWYddiHrzbuV0cRQy6ovTK07ZAD6HNYX8rh+Ky44kayjx5nUV5Qns8Hqp1vzPuHa95
         UV+g==
X-Gm-Message-State: APuU4Z/UD2NoxURMTxSHb5sb1X8gYBZ8jCPGYseY0dqOw2FjaD6c21uh
	bYjT2wi6wUss9ci1VIumk5Bl3Riqmc3wN2FKQ4bf+j6HpHBlAb22FAcGlYFhQi0daL6S2qXL36f
	+w8YQfA==
X-Gm-Gg: AYBFou3qe34YNmrny6xwl4iZsTnydcDH9BlzvrpP83FdiFgVh19KGdrHHgoD1SCqR4G
	PxtYC9J4ZD/zAlnH6Of48011yKdAjhU16BRioxK7LZC8o5NimVEUdS7a89GMm+7JTmpenbUH0AD
	UQXQ/xZwAD6flYb088DPoDK8dUIySideSsI0qTb/xzOC3MNtN+WWYyyVMQu0a/cOXbyagUSnL7P
	TKzGqfB/fEfej3faplur8W3H/X6fTq1aDY7WavW5yTjuCyfUXrRWTGWh3NFgQtWGbnXHWHeDqM6
	/62CF0DD7nPG0laqLlDw/yepVli2WoHLKXBsDBzcuqZ/qnYuNLScDUJvUbgcnRRw9HloSsJGt2G
	F5+wAXEXut9UxT/ofc1NIidVAEnUdjNj5GOXj4vKhNWS7Pc1IN71Y01oXJThFCAxMQLYeFJEECp
	ZA/0KvLJl4BUnbI/KuRvX4Q5Fyhf7bzyO4iBwqbJ8DLGGmPH1+tLd8ETIM825R4bq2jfC0ny9df
	7saN4HvIzvRtuPxY/9Gkb8ndkieI8ErJUzZh0SwKqCiJkOabDF4y0cxx5TPGjgYHitZgz2BeuLD
	X5SbP5KxVnU6fSbHF829YYlyf3LNVNiiHN4kzCx2Ms/8HVz/6xZEFufpBD644nigsOtvTot0R04
	4/nV9crKgnq8WdJo4I9Ix4ro=
X-Received: by 2002:a05:6830:448b:b0:845:156f:58b1 with SMTP id 46e09a7af769-862898997camr11166021a34.24.1794873520004;
        Mon, 16 Nov 2026 15:58:40 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:38 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 04/10] dtc: Move the /omit-if-no-ref/ handling out of the grammar
Date: Mon, 16 Nov 2026 16:57:58 -0700
Message-ID: <20261116235813.935070-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116235813.935070-1-sjg@chromium.org>
References: <20261116235813.935070-1-sjg@chromium.org>
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

The grammar action for a top-level /omit-if-no-ref/ still holds its
merge logic.

Move it into a new merge_omit_if_no_ref(), passing it a struct fragment
for the reference.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---

Changes in v4:
- Free the fragment after merging it

Changes in v2:
- Check the fragment type with assert()
- Return true on success from merge_omit_if_no_ref()
- Use dt_ref instead of fragment_ref

 dtc-parser.y | 12 +++++-------
 dtc.h        |  1 +
 livetree.c   | 21 +++++++++++++++++++++
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 6bf96a7..1a1a52d 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -249,14 +249,12 @@ devicetree:
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (target)
-				omit_node_if_unused(target);
-			else
-				ERROR(&@3, "Label or path %s not found", $3);
-
+			struct fragment *f;
 
+			f = build_fragment_omit_if_no_ref($3, &@3);
+			if (!merge_omit_if_no_ref($1, f))
+				treesource_error = true;
+			free_fragment(f);
 			$$ = $1;
 		}
 	;
diff --git a/dtc.h b/dtc.h
index 41ba438..b9cb5f9 100644
--- a/dtc.h
+++ b/dtc.h
@@ -352,6 +352,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
 					       struct srcpos *ref_srcpos);
 void free_fragment(struct fragment *f);
 bool merge_delete_node(struct node *dt, struct fragment *f);
+bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index ce47fe2..669d8ba 100644
--- a/livetree.c
+++ b/livetree.c
@@ -554,6 +554,27 @@ bool merge_delete_node(struct node *dt, struct fragment *f)
 	return true;
 }
 
+/*
+ * Mark the node which an /omit-if-no-ref/ fragment refers to, so that it is
+ * dropped if nothing refers to it
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	assert(f->type == FRAGMENT_OMIT_IF_NO_REF);
+	if (!target) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return false;
+	}
+	omit_node_if_unused(target);
+
+	return true;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

