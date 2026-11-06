Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994789;
	b=wtOcjcpc8c9d1fBHIZ3VS+BNYKiz7ru1EXZwBwwQQVJtWJSIagDPAN7tU/sah49ePGWV
	 mTJT2y1SMtR2TC3qdfaxF/TdpUlleS7Q7+5w6XVhf1pKAjwD8ykQoUuJhya9Ta9NkkJoz
	 COltDIcRfGA07mIc38Uyy7fRc7YDlBP85e8i8Amd5tNEHgJrhxZx/HnbOPZLV16Wn7NAo
	 yEvOQ8bC3WJ9rf0f0dvJYfTqPCais8GJaZujVvX9MXzrYUTNSH9KDz8G1nwCkpBMkudqT
	 GDipaCy2jfHth1fEIcaP3/5X8N0mKaNFeCljUm47qyj/CYAK0K4MIvoaoNYeETjOvjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5ksl0T/Kr+odLMDmBDDIz6kTP/lfTfJbE4u/dZNzIgU=;
	b=tuaLPjMoR97UNAivyWZ5MpuEUdzq984ODiqiOKFr6Nj5EvYj0bb9oJRshT01DAn2ZNBv
	 Z3dbcEsob2oACXKNbl6+1ACXK2MXnHxNc2A9vDJJpeIKXAqquTbEMUcRazsLr99Er+05G
	 Ero0AFIj68qloCnpQgXxW9VP3UBg9MbLSTnl5QGjrTTusZxYkiLv1sdYy8WO5H+RdNJMS
	 8ViuVpic+prRJPb/hYvJpAmzbHcGgNvSAmfB1oozD5GEYw3tcIhUQ2HxgAcEqqN0ssLop
	 tPI6kDENMDqihH6HPPUd3Gy3q37hkbpkgBZa86IKlBC2auTpwsHwNOLGnRrhW1Biy4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="iA3/zlOD";
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045A4606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 045A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iA3/zlOD
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4877837890fso501716fac.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994788; x=1794599588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ksl0T/Kr+odLMDmBDDIz6kTP/lfTfJbE4u/dZNzIgU=;
        b=iA3/zlODcF40El0MP/Y0C9WmVH3tP4Aa0RDFKzgHSBL26+n3vnDNWPQbd9v+6e9wHC
         Iu+Uaor+cjIzeAFYiLQUbbiAJyTznIqZfdtWQt5mp4co6SjdUWOhBTsBKpvvporW+fhD
         gxzvyJfI3Xgh5wZONa8zvVQXlpw/Ma6KJ/9t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994788; x=1794599588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ksl0T/Kr+odLMDmBDDIz6kTP/lfTfJbE4u/dZNzIgU=;
        b=XerCeTYaFGTsKLEOeFMZABmTk2ae6V00m3hDSADKBpAr7yXFjvm9Pye8wLofHg8BKH
         wKjyT83gwieCzimS+5qAfSIJMybqDTk8aE+LFQ0pVDJlDJtWKQUzlU31fXCmsth+qH3L
         eICxZTDX4/PWYRxfeoi74MhBVOe4ocAODU8pO1dQyn/Zw/1Mvg4tz1T520iqeOY9mZ0S
         ki4QXrm/F5Zxj/5Ng6kkpWBpuaMpmhWE49+lsZ7MJs4hkgAd4Ox2HsdyRwfVoYQm80R8
         C2oBLu7bEH0CcsUq0ejEC1SCrVCoRAzA5xn57ieCRYgraUW0vqB31V7yFxJzxLILFe/d
         XBQQ==
X-Gm-Message-State: APuU4Z/tOvIxYBQiffOayDr+Cifs2VnEVOLWyZgR3yvUHLt3z87GMg6O
	t6FWUZ6n1SZbPnLe2XSdHshhBbfqBoC4HQpuQNexhulehBfWXKlFGLhDwBqtmwmZUbzMNNdezub
	eKNwLew==
X-Gm-Gg: AYBFou3ECzcbygFEc+vAzHjAOmHdvW3vbGn+UT91YHaRtHpwDV+keHrJzr3QtTJ6aE+
	D4DsVPRI2Mb9PEt7h5uInDEwQ4zqlOF/kQukpZ3GObz7ALxz9QfBf/XO9jMan66yDxrGFXS3DQ3
	ioKFmlkFvEeFztxPUH6aNzPnS0VWVM0PdlbWIxsFQd60sLiOMUBP5sLDs1wcxkeioKxqemyY1JR
	0r64ICcaxhHs9x8tnlaznr4fk1Kez37BxlC2JALZJUK36OCeEhdT/vsO/arUHYYnGeohn5bkKrB
	TLwfCz/evLsZZKDi1wZ6q9hPZ5VSpW4ghVIGqE2A3nsZVKWHYSkRnd0DoEMVWpLakwzfSUcOt2G
	bqz8Lo7cxRjANhsAXtifsRe+5L429zCClOsQIi1pGGtwrYkmuX+gBdtD/EMYtHSbkngkVivCwXo
	GRiDZRAu8KsQRd1FB5SF19D2oVcaq3eOpZgxXm7YXCuEIPUrwhhc/pfKKmXwOtRrECjP1FMGgKV
	+FibCiK1xfRQLz6xN53vznr1oiBswThfuHoEX9kRKPHTcB8mnBadQgbiJVvnqHLkWS+X9v+WU8L
	RGahxQtd3+hNb5gjRSRYe+M0zAineyPdTA40ystaC55FdrtGNi335A6st07RK3YHyvdpIq89GGw
	uzO0UFdNwuSTzxZoKFQ/A
X-Received: by 2002:a05:6870:218c:b0:475:a153:2dce with SMTP id 586e51a60fabf-4ad98b37fcfmr2162105fac.36.1793994787714;
        Fri, 06 Nov 2026 11:53:07 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:05 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 03/18] dtc: Add a struct for the top-level fragments of a dts file
Date: Fri,  6 Nov 2026 12:51:30 -0700
Message-ID: <20261106195159.2623314-4-sjg@chromium.org>
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

(no changes since v2)

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

