Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994818;
	b=AYpZA6nmgxndEttTiTMgKiAqRewvQn/Bx70vh3OfqmHLgyLGn5ltVSsu60GyKFGb5dXp
	 sNaRlv/phOzEroBBryJ4a83UilZEfTvZJ/LtOSfXj07GoS0m3q9/qqPjSqR8csLAdiip6
	 zMe2am1Ce1GY4mkod8GhOI4lTzkKIYrWNVc32e8IEzU3L/IMQs5fG3DTnzfOjDTUCJB48
	 AybnCqR6qqti0uOX7h5i+t6Bwou95vYaabMkHVnGLz+Yj1TJOymBRMPf+zwT/BZFg2E+9
	 UHxs9sSb1VSKV36YbVyEZYfsgxRAyzu58KbUEt3UWQfaHk4JEqlf6CGlB+jB153DHQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lrUHoBbidwnclJwBdyKdoIs8NJD8rdJ0l/UCE9ndv30=;
	b=FjeEhlZROMrb9lfY6VR38n/N8omIt1p+TQCehKvjOqF+pejuQNMTJLdVO2r7F2VagQxm
	 V0RrsHEN/2Ixes8YRj2WXmJsKIFoTvJE7vM8zxwzyYXUj2U7oxPmMUIneLy8T/nTycjrN
	 +uGJy4g4aQLuaI2jUu0EX1QIXUnIpFaSVTVAFU/OUeLizAN4uOdueJfIKegPUeEuCA2dL
	 hxlpp0NeNsNTFucfP+UbIeriJOvz0M995ZYPqwsrIX6Hpg3onk6QUQ3hydVGCaNKQ6M7k
	 6P3A5Ro6ayzb9jaGY/6tgAzhNd6AR9Zv/wDCKg0TBYR3w5EiQBoTgvrvovIQGeoxY/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CONFOTmN;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F3606A337
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B8F3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CONFOTmN
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso15530fac.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994817; x=1794599617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lrUHoBbidwnclJwBdyKdoIs8NJD8rdJ0l/UCE9ndv30=;
        b=CONFOTmN6FQtWP1M55m9A4SC3DOWKxsOggEbSwMsp4TVwMelIWIxKrezHB+PDCfnSe
         uXD62bx2tI9LS5rUVa3jEJ54fPy0MvpSoRZZ33Czmcbsel/0oBV+NwEtC0dJnUcYh4f3
         4FlS67Kgp3AxolHPWCgNzx3/FDxEUQLHpEYN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994817; x=1794599617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lrUHoBbidwnclJwBdyKdoIs8NJD8rdJ0l/UCE9ndv30=;
        b=OMUk48oK/2yrDAHbXOBi2WlB+3B4K3MdHmv1EZRRvpwzvsnD4UVLazNFHenn4Tdy3z
         CzLfLn4QlWBEJDY6bUSwZPsWv2zi3p9k3wU3quoIS3P7qQ5UXnLB1waPGBBvGRow+UAb
         ssyZBiRgxS/VSk+JmY4yeZagHEd8A1d6AxBJlVDxoFRIcLPfEyvG72AuigDBarTnk+DA
         OIB/L6F0iZ5YDJmeaorLzNQGyHmXmL0morHR8HF4iiNLUWvXBVg257dKGHXVRrF5yZzD
         xvzzFe0x1zTYsMJWhdFZD0mth7B1zK7yKfz978MAgbbS0Upyq4nymyrIOHnmw+48jypp
         PZ+g==
X-Gm-Message-State: APuU4Z8SbRzyDwlNpue4xncx92AAiGVmFFZsa8Vozn3zHUUZ4oGYYF6f
	YmJv+zp44TzJtkVf0deVh9SGGK5+lf2MbVLKlWz8mGCKzTf7DIEFJsu3/FTBWR4k5srCtG+PqI+
	+aZmgDQ==
X-Gm-Gg: AYBFou1D4x/38QPxvRTHP/36JKuTIRO9TQLhLxbGNB8WxVkSaX0vABLxTQ3C2eqcGdQ
	RtYew48fiOTWObtCTblpSPO5cAGX+c+oT8uuxPy5cxAhBQfMVyjRf+Fsiu1Ztsa3we7RehuNAFe
	hRLpG8tPut81E9RqKzkuBtvthL0o6AvMzdYKW9xqxc1k7dn1BCx4C4t9FYr7NJ8AIiXsGHqHODT
	D1DmGcT4i91f+9/aGyCKKkMasLAURi/HtX90MLbBE+xTLTtfmFDsRwiSwQLeDqnCTa/4W2aAcsm
	aFULlSlHQk+pMRcK4BsTYt7NS3hTi05IusOFqCK6Ys/YTikZJzi9Cqm0DXHWaZt8bmIqf0Sd4yl
	aq3unAXpcE+vg79+zEhZ6TM/Qs4iYwjwsW0D+CwimyBAhfqwhJnVgei3PN0RoGNVyxXiWf1bLMG
	BLxSIh7OF+o1ls6D/lpV+IwaWphg4ABEhGV1G+lavLq4davJQzp46u8Tq1iRXRXPfj2K8zooday
	0SuSoo0IQDdOt3yI4cWmyIPzXuX57aBoQQsT+jRSs4t6EvKW+xankyY2ds3uGran7yUqM2yicpP
	JdnW4Na8ECngkcNErvBjI/1F7GjUEe9gu4vk6CuNnVd3A49xd2IhWUSKIcP7XNAKXUNkQmatAPV
	hGPj1llMWq5SfWlVPaxvByS7s81PeIjIVaifNMUdVzA==
X-Received: by 2002:a05:6870:5b99:b0:470:e96b:43e5 with SMTP id 586e51a60fabf-4adc0c230famr6616fac.17.1793994817488;
        Fri, 06 Nov 2026 11:53:37 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:35 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 13/18] dtc: Add helpers for the errors when merging a fragment
Date: Fri,  6 Nov 2026 12:51:40 -0700
Message-ID: <20261106195159.2623314-14-sjg@chromium.org>
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

Three of the merge functions look up the node which a fragment refers to
and report 'Label or path not found' if it is missing, and two check
for a label-relative reference in a plugin. Each of these has its own
copy of the error, so a change to a message or its position must be made
in several places.

Add lookup_ref() to look up the node, reporting an error if it is not
found, and check_relative_ref() to report a label-relative reference.
Use these in the merge functions.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- Return true from check_relative_ref() if the reference is OK

 livetree.c | 75 +++++++++++++++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/livetree.c b/livetree.c
index a1d5d71..a70a7ba 100644
--- a/livetree.c
+++ b/livetree.c
@@ -573,6 +573,40 @@ static bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Report an error at pos if a fragment uses a label-relative reference, which
+ * a plugin does not support
+ *
+ * Returns true if the reference is OK, false if there is an error
+ */
+static bool check_relative_ref(struct fragment *f, struct srcpos *pos)
+{
+	if (!is_ref_relative(f->ref))
+		return true;
+	srcpos_error(pos, "Error",
+		     "Label-relative reference %s not supported in plugin",
+		     f->ref);
+
+	return false;
+}
+
+/*
+ * Look up the node which a fragment refers to, reporting an error if it is
+ * not found
+ *
+ * Returns the node, or NULL if it is not found
+ */
+static struct node *lookup_ref(struct node *dt, struct fragment *f)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	if (!target)
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+
+	return target;
+}
+
 /*
  * Make the tree at *dtp from a first fragment which refers to a label or path,
  * rather than being the root node. This is only valid in a plugin, where the
@@ -582,17 +616,14 @@ static bool is_ref_relative(const char *ref)
  */
 static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
 {
-	bool ok = true;
+	bool ok;
 
-	if (!plugin) {
+	if (plugin) {
+		ok = check_relative_ref(f, f->node->srcpos);
+	} else {
 		srcpos_error(f->node->srcpos, "Error",
 			     "Label or path %s not found", f->ref);
 		ok = false;
-	} else if (is_ref_relative(f->ref)) {
-		srcpos_error(f->node->srcpos, "Error",
-			     "Label-relative reference %s not supported in plugin",
-			     f->ref);
-		ok = false;
 	}
 	/* Make a new, empty tree with a fragment@N node for the reference */
 	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
@@ -618,13 +649,8 @@ static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 
 	assert(f->type == FRAGMENT_NODE);
 	if (plugin) {
-		if (is_ref_relative(f->ref)) {
-			srcpos_error(f->label ? f->label_srcpos : f->ref_srcpos,
-				     "Error",
-				     "Label-relative reference %s not supported in plugin",
-				     f->ref);
-			ok = false;
-		}
+		ok = check_relative_ref(f, f->label ? f->label_srcpos :
+					f->ref_srcpos);
 		if (!f->label &&
 		    (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref))) {
 			/* Add a fragment@N node for the reference */
@@ -633,12 +659,9 @@ static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 		}
 	}
 
-	target = get_node_by_ref(dt, f->ref);
-	if (!target) {
-		srcpos_error(f->ref_srcpos, "Error",
-			     "Label or path %s not found", f->ref);
+	target = lookup_ref(dt, f);
+	if (!target)
 		return false;
-	}
 	if (f->label)
 		add_label(&target->labels, f->label);
 	merge_nodes(target, f->node);
@@ -653,14 +676,11 @@ static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
  */
 static bool merge_delete_node(struct node *dt, struct fragment *f)
 {
-	struct node *target = get_node_by_ref(dt, f->ref);
+	struct node *target = lookup_ref(dt, f);
 
 	assert(f->type == FRAGMENT_DELETE_NODE);
-	if (!target) {
-		srcpos_error(f->ref_srcpos, "Error",
-			     "Label or path %s not found", f->ref);
+	if (!target)
 		return false;
-	}
 	delete_node(target);
 
 	return true;
@@ -674,14 +694,11 @@ static bool merge_delete_node(struct node *dt, struct fragment *f)
  */
 static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
 {
-	struct node *target = get_node_by_ref(dt, f->ref);
+	struct node *target = lookup_ref(dt, f);
 
 	assert(f->type == FRAGMENT_OMIT_IF_NO_REF);
-	if (!target) {
-		srcpos_error(f->ref_srcpos, "Error",
-			     "Label or path %s not found", f->ref);
+	if (!target)
 		return false;
-	}
 	omit_node_if_unused(target);
 
 	return true;
-- 
2.43.0

