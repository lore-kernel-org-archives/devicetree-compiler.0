Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551099;
	b=OpybZPEeKnaJVCX5rNGjKg/crm1Nub5xMObgvomQcl8iyC36jBi+axiaLLy6dvo+WcLz
	 AB03zu8QOq+MwXm9CB7/xAMiCJAJOAgtO6qEph8SDWD5mkHYTIsLfUhomFHnnDprLvTzw
	 1cWmoa6wO05oHj/d3gPzKN3+3n6gk3QsDV6GniZMsTJoD6mQ3XkWuh2rUclOjjGJZilco
	 Bi+9fDIeWfXVNQAgSfEB9WYm8UU/dCMgPxq03HGSyr1x10GT5iSJ/kmXHqWbMBt7G/nx1
	 JYTrsUPpLxOGps2WU5txKeJmn0cBby68llQBcDhM3cSvUwgAQo4hRn+rYe0SVxFLUkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pIIjgCVwYZkynPhD/W0ov+vnN4cRON4gqj5+mS7JnHQ=;
	b=UZIifS+HxGoELAT9AeEF1t4OBjWitnraf9PlSKfvSXebxtbbpCOgluipYLJkH7UV7jMK
	 iy3wJC5LNZhk5XLiegq7j8JbK8JqLSMdi8O4853kCJ62oEeBUPFZTJLg0X0d3fu+h6Vne
	 oW0k0vPhbBl7YNXKx7tzQhHPqbTXzRCc6mECrWs50IbrjBzrO8IADXNqxoWhIros68jD1
	 JQonIGW8tb1m0JAHfu0XCnypjHeNXUYRnqxIVWwn52yNF52qe/4Ftq3WvrH69OzwALVGB
	 JY9Ozy6uV2h6QzkjDgPYSDKIHGOMA57JiJkPsJYDVz8tk2mZKrQn03SjQlnfjR0qWxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IjCT9Rye;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B251606A324
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B251606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IjCT9Rye
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-833e671ee9fso2495745a34.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551097; x=1794155897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIIjgCVwYZkynPhD/W0ov+vnN4cRON4gqj5+mS7JnHQ=;
        b=IjCT9Ryei6kwzN6+G3kuZRMHBMtAe0c/s+xe6xrqjOqx+zPaPzz8ll/cfWaCQ3dSiq
         z3xz//8g4Cza3t2iXUlC5JtBTs8i5qDIRvw6uCei5lyyL6qeXbjtjNtd/RSS0ZOH3JqZ
         D3WkTRpAL9Zr5++zbTeIK4fiIKahCk3sdVaRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551097; x=1794155897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIIjgCVwYZkynPhD/W0ov+vnN4cRON4gqj5+mS7JnHQ=;
        b=NYZ2xAHXlHjFi6tbw/644AgGVuRAy+C5HYfEMpXgop+v5UQujJunNvgLmGwIUv3MGy
         SexD8dwi+DAv+NiSvbM/bBXDoslybQ0eXPwTtmoiwd+Lr/dYKHQQIe7/6lb3I86tLkFH
         0Qy5qVjDGlJimJ9dW8M1ietSg4zB43DjhmGw6Wzbyg9qSqWaZMPaQtd/4pufrbGrCX17
         e8oyHIBACmiF1rKgPqyCb61d0E4XYuAevsLVhoPzvn3hm4+rSWMcU215EmwZ9/WzBq+P
         qSF2aTrVsJfFY3DmU+SMQUf7SG7AqPqpl8AckF77g09Qykmx2WQujcEnfwKvdJz8inwp
         UhUA==
X-Gm-Message-State: AFq9FYKp3OTnSJO5KX+wyLfeFS1sZeWSKq7Ni7u+wfkIUhWuU4v8wQMb
	il36fyEKY7bYeVzrRVP4IlniQ1ClH2aRgsov0sW5IDAWuCQhv1nuq7gxXp53WIBuR1SnDXGWt0N
	trUavDsXN
X-Gm-Gg: AYBFou3hNZvL0PTw7verMLEWXCvaFmwRaPrTU7EF+6472xluvO/hJXWVb/TcGyM686f
	xMKOOUkXI/MwrkhLa47GF3fmTbQG9zLmagHMAKvgJU/gjsXFv2xWxPlTpiK5F81kjE5sw7kin7y
	Q2uoDw412bnZ+CERuZ4qEg66lB7b0m+ETEJR9QyECuaYYMFgGb9qRo7b57Ez02SQ5ePUnxPsOxS
	Z7W+bsaH9IM/D5f3+5J7yIV8rTJ+lvbsCL50YHhTplwMPKBY7mVjZDnQ50KYHe3wCml3GpQawg5
	SKL2QV2QUlEppr4VOFge5fVEToRw/w9DCteVu/GCwh5ZLcIMfwNVgx9VVpOtwtW5A+9SQlV9mHr
	poKE40N1H0WZOYCblk+wleNecnSAEzp89MOKIGcpNqF24NhaZJi4pX0NLS3iAIT1fRVQ31SdN/T
	10BncizedN+LbuF6ZpQJkyE5xuqIoKwoz5N8Y4vAXmriOXbkqty5Ua1Y0e5zpzALWrcQfzU6ABo
	dhcIM+wuQnSm7ibPcER8o4VErXAGEupIFs31yOtn8nKi5BSmMdyCGKanoDq9tMtjG/mnhySEynh
	6J58c9970JWAsDNbGDC6V/Vovza5O3oqpfVWTF3xcZ4f2Tk+KCQA1vkBe0Q52TUTFsdapx9Bx/9
	5AsN6EY7RwbEh/YkRDyBd+w==
X-Received: by 2002:a05:6830:2648:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-85d365e00camr5071247a34.25.1793551097418;
        Sun, 01 Nov 2026 08:38:17 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:15 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 02/13] dtc: Add a list for the top-level fragments of a dts file
Date: Sun,  1 Nov 2026 09:36:56 -0700
Message-ID: <20261101163721.2458982-3-sjg@chromium.org>
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

A dts file is made up of top-level fragments: the root node, later
definitions of a node by label or path, and /delete-node/ or
/omit-if-no-ref/ with a reference. We would like to deal with each
fragment on its own before it is merged, for example to apply deletes
consistently or to run some checks on each one, but that requires
keeping the fragments apart. At present the parser merges each one into
the tree as soon as it is parsed.

Add a struct fragment to hold one of these, functions to build one, to
append it to a list and to free it, and a list of them in struct dt_info

These are not used yet.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc.h      | 47 ++++++++++++++++++++++++++++++++++++++++++
 livetree.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/dtc.h b/dtc.h
index 473552e..c0d8e8f 100644
--- a/dtc.h
+++ b/dtc.h
@@ -322,12 +322,59 @@ struct reserve_info *chain_reserve_entry(struct reserve_info *first,
 struct reserve_info *add_reserve_entry(struct reserve_info *list,
 				       struct reserve_info *new);
 
+/*
+ * A fragment is one top-level part of a dts file, after the header and any
+ * memory reservations: the root node, a later definition of a node which
+ * refers to it by label or path, or a /delete-node/ or /omit-if-no-ref/ with
+ * a reference. Fragments are kept apart until they are merged into a single
+ * tree.
+ *
+ * This is not the same as an overlay fragment (a fragment@N node), although
+ * in a plugin a fragment may become one when it is merged.
+ */
+
+enum fragment_type {
+	FRAGMENT_ROOT,		/* / { ... }; */
+	FRAGMENT_REF,		/* [label:] &ref { ... }; */
+	FRAGMENT_DELETE_NODE,	/* /delete-node/ &ref; */
+	FRAGMENT_OMIT_IF_NO_REF, /* /omit-if-no-ref/ &ref; */
+};
+
+/*
+ * Which fields are used depends on the type:
+ *
+ *   FRAGMENT_ROOT            node
+ *   FRAGMENT_REF             ref, path_ref, ref_srcpos and node, plus label
+ *                            and label_srcpos if there is a label
+ *   FRAGMENT_DELETE_NODE     ref, path_ref and ref_srcpos
+ *   FRAGMENT_OMIT_IF_NO_REF  ref, path_ref and ref_srcpos
+ *
+ * Unused fields are NULL or false.
+ */
+struct fragment {
+	enum fragment_type type;
+	char *ref;			/* label or path referred to */
+	bool path_ref;			/* ref is a path, i.e. &{...} */
+	struct srcpos *ref_srcpos;	/* position of ref */
+	char *label;			/* label to add to the target */
+	struct srcpos *label_srcpos;	/* position of label */
+	struct node *node;		/* the node definition */
+
+	struct fragment *next;		/* NULL at the end of the list */
+};
+
+struct fragment *build_fragment(enum fragment_type type, struct node *node);
+struct fragment *build_fragment_ref(char *ref, bool path_ref,
+				    struct srcpos *srcpos);
+struct fragment *append_fragment(struct fragment *list, struct fragment *new);
+void free_fragment(struct fragment *f);
 
 struct dt_info {
 	unsigned int dtsflags;
 	struct reserve_info *reservelist;
 	uint32_t boot_cpuid_phys;
 	struct node *dt;		/* the device tree */
+	struct fragment *fragments;	/* not yet merged into dt */
 	const char *outname;		/* filename being written to, "-" for stdout */
 };
 
diff --git a/livetree.c b/livetree.c
index abe73de..982f0a6 100644
--- a/livetree.c
+++ b/livetree.c
@@ -448,6 +448,65 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 	return list;
 }
 
+/* Create a fragment of the given type, holding an optional node */
+struct fragment *build_fragment(enum fragment_type type, struct node *node)
+{
+	struct fragment *new = xmalloc(sizeof(*new));
+
+	memset(new, '\0', sizeof(*new));
+
+	new->type = type;
+	new->node = node;
+
+	return new;
+}
+
+/*
+ * Create a fragment which refers to a label, or to a path if path_ref. Its
+ * node is NULL, so the caller must either set the node or change the type to
+ * FRAGMENT_DELETE_NODE or FRAGMENT_OMIT_IF_NO_REF
+ */
+struct fragment *build_fragment_ref(char *ref, bool path_ref,
+				    struct srcpos *srcpos)
+{
+	struct fragment *new = build_fragment(FRAGMENT_REF, NULL);
+
+	new->ref = ref;
+	new->path_ref = path_ref;
+	new->ref_srcpos = srcpos_copy(srcpos);
+
+	return new;
+}
+
+/* Add a fragment to the end of a list, returning the new head */
+struct fragment *append_fragment(struct fragment *list, struct fragment *new)
+{
+	struct fragment *last;
+
+	new->next = NULL;
+
+	if (!list)
+		return new;
+
+	for (last = list; last->next; last = last->next)
+		;
+
+	last->next = new;
+
+	return list;
+}
+
+/*
+ * Free a fragment, but not its node, reference or label, since the tree may
+ * still use these
+ */
+void free_fragment(struct fragment *f)
+{
+	srcpos_free(f->ref_srcpos);
+	srcpos_free(f->label_srcpos);
+	free(f);
+}
+
 static void fill_fullpaths(struct node *tree, const char *prefix)
 {
 	struct node *child;
@@ -475,6 +534,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	dti->dtsflags = dtsflags;
 	dti->reservelist = reservelist;
 	dti->dt = tree;
+	dti->fragments = NULL;
 	dti->boot_cpuid_phys = boot_cpuid_phys;
 
 	fill_fullpaths(dti->dt, "");
-- 
2.43.0

