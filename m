Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873513;
	b=UsvoOHF/K1telcNWLJc6n24jonAuuvFEmojp+vpivQrL5PClt0y9GEjevF0j4lyvViCG
	 MTzspVnHXoWr/ROZCZCSW88YB2La0G5fqNtwHyhwFlAY3JC8v6051uXSl1vtDdEaDgWHP
	 B0Rzo1Sw3btsdf1z5SJrHErJh74p4oY44aJKga0xS5gZ95kP5DdMvh2T549GozzVV+zhn
	 qW8e/FSnVPDh6ZjOV5UfGokorltRX3kBjz4yxgqlxMx6w44d7IdBHOvkFhWheMT1vVhYK
	 nJQkR/fKzeNh5ItMu00Qmk5mxPT3MPTslalW0dRS+09SeOzd72SVY0jrTXZkeWhBjNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=idnHPPkykVRQ1cd8tRCzeWivMkx+tLIQZtVpTHI8NfM=;
	b=cSQgZPR6ladxH2a7wxarqDLHDfXhaufITvp2nZVCiQTrdZEOH8LQfSZa6ZAkJOU/ACYt
	 LcLMR+zvmUF3iy6+Yo5r0DQJ1kP92c31aRqczvAQkILQD3+RoG4gfnBmVtXETLLs7oNCN
	 XevkrdMeOHqOGm7nR1fZKazwFNomqweNzUjT+qHE1gN4yo5R2tawJ/Qy4EI/uPBaF9U43
	 oQVz7uuldUjQfQGay/dAhp455WjQEBQqYZtgqYmFGxuwEfwqtyfbAlu2p/AEJYUVUwdk0
	 OjLo3tsDH8Ya5ZZjHk+BTPdVvQJlMUR+jZgSk3ca4i/qajH9Nzg7zUVReCv3kFIyOqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nzDPmOlj;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD28C606A323
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD28C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nzDPmOlj
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-86288992de5so288709a34.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873512; x=1795478312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idnHPPkykVRQ1cd8tRCzeWivMkx+tLIQZtVpTHI8NfM=;
        b=nzDPmOljmP4SH45vqRB0XVu0Zt81CDV7AgiOSSvIuHnK45Vfy0Uy1mCssBBPLSKwsS
         OqknR82xD+Q9EBXHLYO/q7GONs7FLkbFYOYfu89drF+pSzdTmnkB4ZznVe11TxOmfOTk
         vDeYMDXDYiOkCfSqeeQpy8Io/ovJP9VqQcdQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873512; x=1795478312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idnHPPkykVRQ1cd8tRCzeWivMkx+tLIQZtVpTHI8NfM=;
        b=U9aTlxXDjpSdEY9woCrwwiGWohLxBoBfyVVjQZa8oZINV/3LDw2/0Sgk/Ia82zDr2O
         pqmTYyrsS0VWdCTlq3L8bbUksjuIWwh2WodJxeMg1xUN8rkEl9Pfp0If3tREqlXtsXVn
         tBShYFxCzxFUFaQzP5UlsGxYlPF2/x6lKynNPjijGuUhXtSS7ifzbjfwg0DjB6Wm0DWv
         yAQOu5o6BUB+G6d056mjOnJPNmEGV0HrkKYw+mS8qyZYKLRN/XQcwaG2BTq1sZlbcu0z
         a9VOoGhjgaT8Z4Q64Q/TBOqRfkphfPMLCUCXvEuX/1797lIIzGad+Gj35Gh9LnPBhbUP
         eJCA==
X-Gm-Message-State: APuU4Z/RK15oVcRjlhuGaEfYmZE/9ocS8wgck4znWX+NrPDmgeAZn88y
	89mkkQXgyZUSTjVM5ViIycFua771yIs7YSBakREXAq/2S6KA2lrHutiwy/9nt9He+CpewqhTri3
	B3A4Rnw==
X-Gm-Gg: AYBFou2kFnb/eRIBxIORdllQ7Bs8VJVK2Be/wpM5zxAMMO6y+0lLOMTGwewbkxhpN4V
	1MKVa9D6lnIcCkKjoNtCs5m4HwsQNsVpWR/gA0P/EzuSOWFfE0LIjp8Pm36EeePJzXn0Dbjn8yz
	HaIngU/AoZ5WJ6gS9DrQq96EpULYnVOkT6dNno6yuGNy499ib+J37PRb4qL9kuqdeJx8x2FrOUV
	rwKYzgzCJWOoMc46gW/ao5p8sX+5+dBFEPBwDmwerrvyl3WgZBNeTZ3Urog6R7LidQELmtu19uj
	28J4d1hf4gLEffwNxkC6IkQHCHpj0xQeW0cPZ9x8cQJ35zjZfHripJp57Jfp8HD/Xe7CAP++S4g
	Y8lcX2rA2nBcPSQ5FsOkiq1O/kc82jsMh9SUvge3M46YEtvf0VnHghvoyCL1dLkaeQDJmUl//rr
	w2Ms/lkUBjFGf5n9zlED0+8zEINg66DweDQ2ws0FN8HVQ4X5umhtGctVhaCRZd1hHajqYspPFjX
	Zk+eZCF0YDpp2oQek2LnZok1y8gKIjJHBVVPeZJKy2O/cXI8rMRPaQBwYUeC60evH33PxYy9nTd
	EimhLTT6Mz98hXOhNufOs62tNDjdkC9EgmoTUrspuem1+hHdSJUxWzVORYCC+S0waSwvwHXCDCN
	z8/Hpys1yni3QVc+CX1ORFQ==
X-Received: by 2002:a05:6830:440d:b0:862:c617:3f42 with SMTP id 46e09a7af769-862ddadbc72mr910149a34.9.1794873511814;
        Mon, 16 Nov 2026 15:58:31 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:30 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 02/10] dtc: Add a struct for the top-level fragments of a dts file
Date: Mon, 16 Nov 2026 16:57:56 -0700
Message-ID: <20261116235813.935070-3-sjg@chromium.org>
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

A dts file is made up of top-level fragments: the root node, later
definitions of a node by label or path, and /delete-node/ or
/omit-if-no-ref/ with a reference. We would like to deal with each
fragment on its own before it is merged, for example to apply deletes
consistently or to run some checks on each one, but that requires
keeping the fragments apart. At present the parser merges each one into
the tree as soon as it is parsed.

Add a struct fragment to hold one which refers to a node, with a
function to build each kind and one to free it.

These are not used yet.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v4:
- Drop build_fragment_root(), append_fragment() and the next pointer
- Drop label_srcpos, since the position of the reference is enough
- Shorten the comment on struct fragment
- Use 0 rather than '\0' in memset()

Changes in v2:
- Add a constructor for each kind of fragment, taking all its fields
- Add the list to struct dt_info later, when it is first used
- Change the subject from 'Add a list' to 'Add a struct'
- Drop path_ref in favour of checking the ref for a leading '/'
- Replace FRAGMENT_ROOT and FRAGMENT_REF with FRAGMENT_NODE
- Use a NULL ref for the root node

 dtc.h      | 33 +++++++++++++++++++++++++++++++++
 livetree.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/dtc.h b/dtc.h
index 791f815..ac18616 100644
--- a/dtc.h
+++ b/dtc.h
@@ -318,6 +318,39 @@ struct reserve_info *chain_reserve_entry(struct reserve_info *first,
 struct reserve_info *add_reserve_entry(struct reserve_info *list,
 				       struct reserve_info *new);
 
+/*
+ * A fragment is one top-level part of a dts file, after the header and any
+ * memory reservations, which refers to a node by label or path: a later
+ * definition of the node, or a /delete-node/ or /omit-if-no-ref/. The root
+ * node, / { ... };, is not held as a fragment.
+ *
+ * This is not the same as an overlay fragment (a fragment@N node), although
+ * in a plugin a fragment may become one when it is merged.
+ */
+
+enum fragment_type {
+	FRAGMENT_NODE,		/* [label:] &ref { ... }; */
+	FRAGMENT_DELETE_NODE,	/* /delete-node/ &ref; */
+	FRAGMENT_OMIT_IF_NO_REF, /* /omit-if-no-ref/ &ref; */
+};
+
+/* The label and node are NULL if the fragment does not have them */
+struct fragment {
+	enum fragment_type type;
+	char *ref;			/* label or path referred to */
+	struct srcpos *ref_srcpos;	/* position of ref */
+	char *label;			/* label to add to the target */
+	struct node *node;		/* the node definition */
+};
+
+struct fragment *build_fragment_ref(char *label, char *ref,
+				    struct srcpos *ref_srcpos,
+				    struct node *node);
+struct fragment *build_fragment_delete_node(char *ref,
+					    struct srcpos *ref_srcpos);
+struct fragment *build_fragment_omit_if_no_ref(char *ref,
+					       struct srcpos *ref_srcpos);
+void free_fragment(struct fragment *f);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index abe73de..4231c64 100644
--- a/livetree.c
+++ b/livetree.c
@@ -448,6 +448,58 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 	return list;
 }
 
+/* Create a fragment of the given type, with its other fields NULL */
+static struct fragment *new_fragment(enum fragment_type type, char *ref,
+				     struct srcpos *ref_srcpos)
+{
+	struct fragment *new = xmalloc(sizeof(*new));
+
+	memset(new, 0, sizeof(*new));
+
+	new->type = type;
+	new->ref = ref;
+	new->ref_srcpos = srcpos_copy(ref_srcpos);
+
+	return new;
+}
+
+/* Create a fragment for [label:] &ref { ... }; where label is NULL if absent */
+struct fragment *build_fragment_ref(char *label, char *ref,
+				    struct srcpos *ref_srcpos,
+				    struct node *node)
+{
+	struct fragment *new = new_fragment(FRAGMENT_NODE, ref, ref_srcpos);
+
+	new->label = label;
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
+/*
+ * Free a fragment, but not its node, reference or label, since the tree may
+ * still use these
+ */
+void free_fragment(struct fragment *f)
+{
+	srcpos_free(f->ref_srcpos);
+	free(f);
+}
+
 static void fill_fullpaths(struct node *tree, const char *prefix)
 {
 	struct node *child;
-- 
2.43.0

