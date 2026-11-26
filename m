Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718503;
	b=abZwIkamRBeInWLnFSQSKLHrvnSODGJGRcaSd+O26MpiJOiiEbin8YzmouApMuFRseb2
	 MFpWRnkPuWl3TEqGcIrahdgtXMLPeYOfKQyj2TYJCfq+YcZKNzTiKEUKHL6BbV2zRosw/
	 DQAH4M/ZOJPm6Be7ctcpLfeFl3ybF+Tf4LPs4NbGA1Ffe1n76SwgddqUIkhTS3cyQc5bm
	 8aDPd53YWPctAH8v/keoMc6mpdhvQgYIacuSM0j9tdjEZ2l0u5aQMH4GqDbPzfN7Wvxtr
	 D3N2xDzEXZcC2aYC6zlBCT/r70yLbQYhuwOb4Y+9UMMrT8vnrRcR42/N/c44gWSxfHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BmKh98xxAfWm4+q9Is8OS07gqho8Y1Z6W4BwPmuwv6A=;
	b=SIOWR/qcXwOCFPdF9cAumTxzED7fbQcs9fRkIInoKqFmwPiZOXXY1hPQzyuhtSA9qcIA
	 XUSzfvUGKM7qsA1gxWaRpVvTaAoLHW78Vcv7aUTt6XFc9nEM/hSQEhMwBqSu2Ug135b3X
	 NnK1xjCWyJI7O15JsDo2Lus0MRup38Bu/jUMh/BBGQlam4cL23mqTYmcMiIgTvZvEzZii
	 QPAnF3zwlbkk0rCjN9fzGLm8Ff8z847qVAmU+EK/8qL7TrW1prHORKiWOstd1fXEwbURg
	 vKXGYVumgtCMutRH9ZW0eR9fpMWf2gfgtw8H4Ck1AU3B2lOOOX4GbZ/El17dJ7Drh3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SWJUDJgi;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BF3606A321
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22BF3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SWJUDJgi
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-862b98b2e47so2856787a34.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718502; x=1796323302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmKh98xxAfWm4+q9Is8OS07gqho8Y1Z6W4BwPmuwv6A=;
        b=SWJUDJgifudTimTy1zUycgskOs7KaOUSUtofl8EGhw/5fjRIN1UazBnYfMfZMIRIb6
         0hJB/8WfyYCUF1foAGE6f5YZxg+Br/pGxtLT28yH21Y8r7jdU+ImPnwYv/mctyr9i1Nq
         tC6Agz+joKdhz/AIZ/h+0p3eushDKVkF8Dqj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718502; x=1796323302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BmKh98xxAfWm4+q9Is8OS07gqho8Y1Z6W4BwPmuwv6A=;
        b=rMErTIDv4FZXombnfm2goKLb9ctfczfv25/1VnhHgl28XK8GG3D8DDfXAIh4j+o475
         ID7fZ5zwdw9pa4LBrLIh/5CMEG/8fy28wI/tlpdvCfJU2nALsS25cqcLsURUKVGyMOPF
         TGDnc9S2H05C4pcgzZZKEBoTl+id+9L7NfytYF8UjDQMgbKVAAQtMIWBbebV7T0lOUjP
         AkHZ3HiKxoYNjPIU1bomy2YsAN9kCHWrYvWMzHVdF3XbNA+u0mdgizdNRPGIOysj6VOK
         BdmFsJgu1XLBTCyEGF5Lox60TeE58WeSOsYQUzUUeLetC0y3NhWjUu+yv6sLRmo0+Nig
         +15A==
X-Gm-Message-State: APuU4Z+LOTcX7pHDM3BIRKnOmtkmh+scSymLdrL0BJOV5z5ma2Bxlmuf
	Gy5I6hT9UA/6t7ObEyccdzT0xdsgizQDtFNIfYhhDWEOAwhOKGYZnGOuXVZwNOqK+ePrcAKEt8E
	/K02Tkg==
X-Gm-Gg: AZFdTZfkvEgiTa7sPis5KvRZScya0S/MXrXZSuPCdUWQ0n/Dk7eQe8vDDzu3dSE471o
	lP134cdiijGWot56rGG617WeryuvnE66bOnOy+RE4l0z4j5nubURT+Owb1MCMh99W/bLsMuL5+b
	zg8NkeHxmmG7V8CZVP/lpE2G+ajV+kcKo2j3EvbHeXImJdSTiaPhJwVa1KMJ8gDH4GTQLF7UNSr
	d9tuZbe9GoBNVLI7mTLcMJ1VXnnOPKVoQ6le4ITxhvTUOl/YbJntK2wNwao9OsIqyv5gaDk3kcJ
	DmYAU0YzxwO+hIAAPAETwoYDPa5+QzipmSmJ8da6NW48QVqe497HHeDng2Cl9nsR0YoL4spNsCh
	HC33JTQ+2jf8LRzK7Dmk98VulcDR+Odlk/7f3IRScK5WlZTrt8L3FhKbDWMBQc2LOULXvE+KFt+
	72bWCYD4yJrDjtL5Ei48q7A40wB1FNWhdjqRfLVjyIOR/67cRqYHBJB67zndw1AHmhWIKwFP1YA
	MnXVPwaNFighbVXL0Hxw74dbPCoCYcl4BxbotNdB6X1sCBDtXbemUDtWjN6NxhmW5GHwLLpxwra
	E3uGyYDdq5mXEHaz+kN6DmHppottFNjuwDpGCWKQh9kBAXEeWJ6VD2Bbj8BHIROx4cbtwt0Uvll
	C7hCywVknOmMqp96wAQix5O0=
X-Received: by 2002:a05:6830:2e13:b0:822:95ff:43f3 with SMTP id 46e09a7af769-863157b02famr28367244a34.24.1795718502018;
        Thu, 26 Nov 2026 10:41:42 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:41 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 03/10] dtc: Add a struct for the source layers of a dts file
Date: Thu, 26 Nov 2026 11:41:02 -0700
Message-ID: <20261126184126.1472738-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126184126.1472738-1-sjg@chromium.org>
References: <20261126184126.1472738-1-sjg@chromium.org>
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

A dts file is made up of source layers: the root node, later definitions
of a node by label or path, and /delete-node/ or /omit-if-no-ref/ with a
reference. We would like to deal with each source layer on its own
before it is merged, for example to apply deletes consistently or to run
some checks on each one, but that requires keeping the source layers
apart. At present the parser merges each one into the tree as soon as it
is parsed.

Add a struct source_layer to hold one which refers to a node, with a
function to build each kind and one to free it.

These are not used yet.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---

Changes in v5:
- Use the term 'source layer' rather than 'fragment'

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

 dtc.h      | 33 ++++++++++++++++++++++++++++++++
 livetree.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/dtc.h b/dtc.h
index 8e02b2f..0992b66 100644
--- a/dtc.h
+++ b/dtc.h
@@ -318,6 +318,39 @@ struct reserve_info *chain_reserve_entry(struct reserve_info *first,
 struct reserve_info *add_reserve_entry(struct reserve_info *list,
 				       struct reserve_info *new);
 
+/*
+ * A source layer is one top-level part of a dts file, after the header and any
+ * memory reservations, which refers to a node by label or path: a later
+ * definition of the node, or a /delete-node/ or /omit-if-no-ref/. The root
+ * node, / { ... };, is not held as a source layer.
+ *
+ * This is not the same as an overlay fragment (a fragment@N node), although in
+ * a plugin a source layer may become one when it is merged.
+ */
+
+enum layer_type {
+	LAYER_NODE,		/* [label:] &ref { ... }; */
+	LAYER_DELETE_NODE,	/* /delete-node/ &ref; */
+	LAYER_OMIT_IF_NO_REF,	/* /omit-if-no-ref/ &ref; */
+};
+
+/* The label and node are NULL if the source layer does not have them */
+struct source_layer {
+	enum layer_type type;
+	char *ref;			/* label or path referred to */
+	struct srcpos *ref_srcpos;	/* position of ref */
+	char *label;			/* label to add to the target */
+	struct node *node;		/* the node definition */
+};
+
+struct source_layer *build_layer_ref(char *label, char *ref,
+				     struct srcpos *ref_srcpos,
+				     struct node *node);
+struct source_layer *build_layer_delete_node(char *ref,
+					     struct srcpos *ref_srcpos);
+struct source_layer *build_layer_omit_if_no_ref(char *ref,
+						struct srcpos *ref_srcpos);
+void free_layer(struct source_layer *layer);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index dca2b0c..e858866 100644
--- a/livetree.c
+++ b/livetree.c
@@ -448,6 +448,61 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 	return list;
 }
 
+/* Create a source layer of the given type, with its other fields NULL */
+static struct source_layer *new_layer(enum layer_type type, char *ref,
+				      struct srcpos *ref_srcpos)
+{
+	struct source_layer *new = xmalloc(sizeof(*new));
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
+/*
+ * Create a source layer for [label:] &ref { ... }; where label is NULL if
+ * absent
+ */
+struct source_layer *build_layer_ref(char *label, char *ref,
+				     struct srcpos *ref_srcpos,
+				     struct node *node)
+{
+	struct source_layer *new = new_layer(LAYER_NODE, ref, ref_srcpos);
+
+	new->label = label;
+	new->node = node;
+
+	return new;
+}
+
+/* Create a source layer for /delete-node/ &ref; */
+struct source_layer *build_layer_delete_node(char *ref,
+					     struct srcpos *ref_srcpos)
+{
+	return new_layer(LAYER_DELETE_NODE, ref, ref_srcpos);
+}
+
+/* Create a source layer for /omit-if-no-ref/ &ref; */
+struct source_layer *build_layer_omit_if_no_ref(char *ref,
+						struct srcpos *ref_srcpos)
+{
+	return new_layer(LAYER_OMIT_IF_NO_REF, ref, ref_srcpos);
+}
+
+/*
+ * Free a source layer, but not its node, reference or label, since the tree may
+ * still use these
+ */
+void free_layer(struct source_layer *layer)
+{
+	srcpos_free(layer->ref_srcpos);
+	free(layer);
+}
+
 static void fill_fullpaths(struct node *tree, const char *prefix)
 {
 	struct node *child;
-- 
2.43.0

