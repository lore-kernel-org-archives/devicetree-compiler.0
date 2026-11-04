Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827113;
	b=SzXYFqDboM1XYgHSAZLa+yUdWq9Fl9SP+NrbK8SP/CXc/SLszF/1TEj3UU0HvfDMRdI6
	 3X30lrtdkGWcs6tVyxFltVkLRtsuZDJXn8mLOopG6HyJMGgE/9FdS7oX6TbpKjv7R43dL
	 se2cITqC4RbDZgpBz65x46LvB6ujhhp2pq0OMJMW1WryR5dnTZ87f0KErE1oWb8MpH7tK
	 xRvCsYn1fMtFIHtH/zQlcFdDIc3X2+Ia2yAVoMr6bx5zLwcR+pVGKYnWWloxhJHHDGwpq
	 mIsNOGz2SomO0Qp1kUovoRDgaeykOBP+ilQINCzET5jEzWs/vZMvP5COZfUnOGliqsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aUbTYFLlorKy60oSSqbZw8VCkhcaviAMqr45hQHsxu4=;
	b=KQirn62rIIWWeWf2c5BDaUAVl0ujk4JzV1msRSWcNdUe1gw6Th/1ETCeh+0SM/mXkVJf
	 Ln5PKvyrOaE6TpaJ8B+1SMDGAXPUBYZ+Iz4fkdula589PBUf0mBsmFrky5owtOZzo47fR
	 U62yXIrgMfZ4ll48Z+zyWIg6GfN1teV1BDm9WJImeOk13ae6VbrzrQYXzz+nGO1+P0ENB
	 JH5D5KdATSt1ViSIpFloOIJmbkEHS9wsERmOsEMDgLsZv2Gp5t82gXhrqD2MVzH+eMczp
	 7HvmSp3/JVUMQoMoHWBa+RW2+1HIDvnXLZ15cQjuAGkg45AIkxyXkgAfWgs/GKvGprA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C2z5IC0N;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C8C606A861
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C8C606A861
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C2z5IC0N
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6df7f544919so686469eaf.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827112; x=1794431912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUbTYFLlorKy60oSSqbZw8VCkhcaviAMqr45hQHsxu4=;
        b=C2z5IC0NswB8ArVPxnT8hYFBv0qqTSQXCeHzRI3IPxLGOo91jJK84oPe3S+UmTD9oP
         JijOQo4XK7fn445iSpQBPzfv1AakmN4iDhLUf8F2gxjcAQuV8+U00Heo+HCIsirOoAd5
         VC6HRn288x4zWyR7AcmzrjZ+E2O3qPLbgSnuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827112; x=1794431912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUbTYFLlorKy60oSSqbZw8VCkhcaviAMqr45hQHsxu4=;
        b=JOvRX63P2wt7w/iVsn7UUeZ4zh6k5T3KHwPahoPZVzLUs4ZKXnxnVRpUfMhn+AoFlB
         DLANtv+WtD0+VTDkn+JUjozHJ8uweNIdP8nlVjfeW/82L4Pe8/BNHfUpW1ormCOGZBjW
         cflrTE5QtbMrvn/TitgN1jvO5wnwqkURlItFUh4tYpIuKtLQT6LaiwtdJyu29LJVQ7uM
         Ti+00cU0DYV0FjsrRDl/47h5iUHOd5CL6ktzglHHFjjfU+GczY1pA6ZnfO9G5+f9BF/S
         Qu28O7ia13daWOl88QWk6JJYSzFYnnMqLGZVB2QVQu6qkrJcGj7KLtYmfd2j1/tJ/VMJ
         tSag==
X-Gm-Message-State: APuU4Z9q80kO43K+3hngQxzgvSKAB7+NTwqBBAKC8MEm/lZlgnexNNqZ
	gWDaA9CNiFkRdvL8Sr3W1kIxj/bJf4v8wMRQYdK1S9oWTD0IYrdn61xAfEWcRnDO0O5/0XfdxJ+
	ZSzH7OQ==
X-Gm-Gg: AYBFou10ky52w/CoX2bBNEuRwaRh6vAoCMd3SRdmfE9F2xgQiozRr9szM9SkhpKOWrm
	xIdJd0x4MUmOd3zGDRNuzcRec0///Zz0M1iQ8WgWam3DDvQuXgGbQIW+NRQ/vrg07aVOpZhI+4t
	XWBA3jr1VXQJSOLX1bXWHs+E25nAgSIk4ww+jLFGsikKCyrofM1wro4q/sg/QBZmuAdT93U5KLw
	fibjSdMAB7gtc5JLcp11/B31OITfyOn+It2aOoOBq6l0w1mSoOBOux1XgVNqQh8ufA5NslT8Z08
	Yz659Wc1jhJgn+xq8EgKjKyTe+EsaezjdMi2DwvPUo1QJgm0i20KnZ7X7NGyhLSlar+oV3cE3Gt
	+8bcPwdiAwrfNkHH7jhHVb65vc7VRLcz2xgC5OKkxV58GgCVxE5wbnG5ZxtU+7saaFSX7MHbXJk
	1Lwb/JuhKiJ/nws8mQOY6S8as6t4fhrQUgtGBjSYf6c5h/qPBeHdwgMixUH5kCT9ppEKynXVeHV
	/Lnm3aFgY0c1TNszA1zhEA/J1DzO3yliummUzQCNDb+uy4oBPhZuY0ChHX0xTv3QnNVmrUz/tvi
	4F4iZ/Tf6L4BDaJ54qBEuy7RWSMJZEzP0czPdTpjvxAfJ63t7gOq2zo+eVeabsmGs5s1GmwUq69
	UC8XmKAtpXC9GM+huPh6JJI1pK0amf+ng6+wZvc0iY1Y=
X-Received: by 2002:a05:6820:c0c5:20b0:713:9556:565 with SMTP id 006d021491bc7-714f288a138mr7303841eaf.24.1793827111789;
        Wed, 04 Nov 2026 13:18:31 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:31 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 03/15] dtc: Add a struct for the top-level fragments of a dts file
Date: Wed,  4 Nov 2026 14:17:42 -0700
Message-ID: <20261104211807.972610-4-sjg@chromium.org>
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

A dts file is made up of top-level fragments: the root node, later
definitions of a node by label or path, and /delete-node/ or
/omit-if-no-ref/ with a reference. We would like to deal with each
fragment on its own before it is merged, for example to apply deletes
consistently or to run some checks on each one, but that requires
keeping the fragments apart. At present the parser merges each one into
the tree as soon as it is parsed.

Add a struct fragment to hold one of these, with a function to build
each kind, and functions to append one to a list and to free it.

These are not used yet.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---
David, you asked why the root needs a special type, rather than setting
ref to "/". This drops the type, but uses a NULL ref rather than "/",
since the two differ in a plugin: / { ... } adds to the plugin's own
root, whereas &{/} { ... } becomes a fragment@N node for the root of the
base tree. Using "/" for both would change the output.
merge-root-plugin.dts checks this.

Changes in v2:
- Replace FRAGMENT_ROOT and FRAGMENT_REF with FRAGMENT_NODE
- Use a NULL ref for the root node
- Drop path_ref in favour of checking the ref for a leading '/'
- Add a constructor for each kind of fragment, taking all its fields
- Add the list to struct dt_info later, when it is first used
- Change the subject from 'Add a list' to 'Add a struct'

 dtc.h      | 50 ++++++++++++++++++++++++++++++++
 livetree.c | 85 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/dtc.h b/dtc.h
index 473552e..f15a162 100644
--- a/dtc.h
+++ b/dtc.h
@@ -322,6 +322,56 @@ struct reserve_info *chain_reserve_entry(struct reserve_info *first,
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
+	FRAGMENT_NODE,		/* / { ... }; or [label:] &ref { ... }; */
+	FRAGMENT_DELETE_NODE,	/* /delete-node/ &ref; */
+	FRAGMENT_OMIT_IF_NO_REF, /* /omit-if-no-ref/ &ref; */
+};
+
+/*
+ * Which fields are used depends on the type:
+ *
+ *   FRAGMENT_NODE            node, plus ref and ref_srcpos unless it is the
+ *                            root node, plus label and label_srcpos if there
+ *                            is a label
+ *   FRAGMENT_DELETE_NODE     ref and ref_srcpos
+ *   FRAGMENT_OMIT_IF_NO_REF  ref and ref_srcpos
+ *
+ * Unused fields are NULL. For / { ... }; the ref is NULL rather than "/", since
+ * in a plugin &{/} { ... }; refers to the root of the base tree instead.
+ */
+struct fragment {
+	enum fragment_type type;
+	char *ref;			/* label or path referred to */
+	struct srcpos *ref_srcpos;	/* position of ref */
+	char *label;			/* label to add to the target */
+	struct srcpos *label_srcpos;	/* position of label */
+	struct node *node;		/* the node definition */
+
+	struct fragment *next;		/* NULL at the end of the list */
+};
+
+struct fragment *build_fragment_root(struct node *node);
+struct fragment *build_fragment_ref(char *label, struct srcpos *label_srcpos,
+				    char *ref, struct srcpos *ref_srcpos,
+				    struct node *node);
+struct fragment *build_fragment_delete_node(char *ref,
+					    struct srcpos *ref_srcpos);
+struct fragment *build_fragment_omit_if_no_ref(char *ref,
+					       struct srcpos *ref_srcpos);
+struct fragment *append_fragment(struct fragment *list, struct fragment *new);
+void free_fragment(struct fragment *f);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index abe73de..85725d3 100644
--- a/livetree.c
+++ b/livetree.c
@@ -448,6 +448,91 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 	return list;
 }
 
+/* Create a fragment of the given type, with its other fields NULL */
+static struct fragment *new_fragment(enum fragment_type type, char *ref,
+				     struct srcpos *ref_srcpos)
+{
+	struct fragment *new = xmalloc(sizeof(*new));
+
+	memset(new, '\0', sizeof(*new));
+
+	new->type = type;
+	new->ref = ref;
+	new->ref_srcpos = srcpos_copy(ref_srcpos);
+
+	return new;
+}
+
+/* Create a fragment for / { ... }; */
+struct fragment *build_fragment_root(struct node *node)
+{
+	struct fragment *new = new_fragment(FRAGMENT_NODE, NULL, NULL);
+
+	new->node = node;
+
+	return new;
+}
+
+/*
+ * Create a fragment for [label:] &ref { ... }; where label and label_srcpos are
+ * NULL if there is no label
+ */
+struct fragment *build_fragment_ref(char *label, struct srcpos *label_srcpos,
+				    char *ref, struct srcpos *ref_srcpos,
+				    struct node *node)
+{
+	struct fragment *new = new_fragment(FRAGMENT_NODE, ref, ref_srcpos);
+
+	new->label = label;
+	new->label_srcpos = srcpos_copy(label_srcpos);
+	new->node = node;
+
+	return new;
+}
+
+/* Create a fragment for /delete-node/ &ref; */
+struct fragment *build_fragment_delete_node(char *ref,
+					    struct srcpos *ref_srcpos)
+{
+	return new_fragment(FRAGMENT_DELETE_NODE, ref, ref_srcpos);
+}
+
+/* Create a fragment for /omit-if-no-ref/ &ref; */
+struct fragment *build_fragment_omit_if_no_ref(char *ref,
+					       struct srcpos *ref_srcpos)
+{
+	return new_fragment(FRAGMENT_OMIT_IF_NO_REF, ref, ref_srcpos);
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
-- 
2.43.0

