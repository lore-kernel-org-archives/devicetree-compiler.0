Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994801;
	b=21FMj4fV6e54Y+Dt376VBjr5hIBSGUnlnOOfD02453Im3qwdI40GKy175gt1/hLATCEn
	 BqNf5hBg4IFyf84lfJD1Qqw9UjRRBMe9dcwFuROHW8jyuiBviN8U5FuR3/PyG6IS3Zm+L
	 wN0KYiienrT2D3vxwLykuN9c7zaq6M1JbQjk8SUrNsvTRgefE0VXjnrS3wHuEC9/9wHcY
	 dDcKnsQhBpuvUvr9g7RLGunH4ogP7k2REsVgp6Qudf4wxfvchsGvdm5Wu42lBhuPTk2EJ
	 nxXswDcsWh6qC+IaVwWpQc0LwsEVtnR5JER2dk14b3uioDpd4bDeysCqr1HORMgrmtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=auRkAlORUokm590P65Pi6l4aJ0Ix1Wgrgur2/FlLhMs=;
	b=BgBZez1WQUK90kCpIkAnOn3bC8wx4AT6j4Rspq5Vyv5ZRTX0JGjEJve6+7cdbBTMc2kB
	 Shwe80Nd3X6JGht5iF7zlGrrs/JDGwfUj8WoSsBqGQzArQlEDedOO0/SEI26o2hcQQvKJ
	 79j9zZdVmdU8rt2BSvHH+piDLazfUJYnV/9DhGuUmREJn17NpDDKa5ke5LeDSn9uo3klQ
	 ZuL6vvL2OLyha66hrVBSoEevW+55oCLYXJYu4oD4MTX6mUfIIXv/4kFhkujoasVlXSGOP
	 WmiijBfJFZyTIn4h64gjeuMi0JhyXP2nNDqy7sL+d6g2nnDdH9sO2FQZYdfyWUOLm5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AByDAig0;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BB4606A329
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84BB4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AByDAig0
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-716ea2598eeso594514eaf.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994799; x=1794599599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auRkAlORUokm590P65Pi6l4aJ0Ix1Wgrgur2/FlLhMs=;
        b=AByDAig0Dc6AlOxipp5/Ol6vM83GNt7QJNyB5cesV4O157+Dqgmpt4YvgeL4FJYJk7
         of7gVd724+x3MfZCS1bhraUrn+cJt1VJnYeyzL2deibd03lLZ4T4bgUil6AUInRnitIQ
         cQ4fRZB6I1mQruXgeNxWxPqDduMn28Q3liilc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994799; x=1794599599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auRkAlORUokm590P65Pi6l4aJ0Ix1Wgrgur2/FlLhMs=;
        b=TL8pYSyUutjkAVRlg9aONxUQq5PuLbVsFZmw0W54HO+8N54zd3DEQAUKMWv7xD2eo3
         YP4ynE7d53fhcj5m46OqXVtV0gp+Fih+TZcotAywc8Q0ZOYOl3qqxpz7VRb73CC1XRZg
         oiY4XKFemPult0Ol49NbWrp7AK4sJ8djyvvcL8sMSrh8nYmrH9QXFctOqtOxZc8GnZ8C
         4qTj7K+QrJPux/E3gdn5GV26A3nc2s3s2IuSgMvc/FukWjERCyxb0/OUygGikJsm5Zwq
         keAxB744mAJTXIOnB2VaJ+kahJRAj5J6Q+/5dPwAL1F0eQz59y4ThNU4uIkF1aCmwW9C
         BmXA==
X-Gm-Message-State: APuU4Z+csuH8dxi4MqRS9YKbJbh8C1yCoGRJZvZQ/KRMdhdOovCeD/k4
	KWIVd/KVQVEFugv8DiuNplQuGbEwxlEDQqkSosjACTSZTSamoRNa4PtZSbUKJS5ggZqdB3xiTP7
	PAY+K+Q==
X-Gm-Gg: AYBFou01sU/xkwUivvkByZhRvGaWgzzhcN5ysUlpsU/jcsMX8A/ZmpnZeGxRsMfxAev
	CiqTkhCMSdI6LWdcNTHOjW+vzGAXqiOTfQuJ6DxIfKrQMEqMHKHeC72Oviehn2wRVVY1O9f9q9l
	0YBMmMRed1fRH3wbhvfZZ18zGAW85Pp3HaBszujbJPBjaSeZw8n1/xMyIECy3gkp3B6Cff4cL4Y
	Cm/mtwdBgK9S33ZPUp+a43Nviz8GzeS5p1XAuHKERHNanNMmYVCgyz+0G/ywKU2VYbuL52lf7xp
	6eQtDniq9sZYrb7T4bWp5oklBD4sIgj52qZbOzSyO/cJCJd+F61hz0qq6CiEAw3Hc+NGt2viEeM
	MZtGWCsI5PKkSxjZpojB3oC0QpGVb3mVQysuURH97SwGHRWMBH9CYPpApDkIexurAaH4DsdCzzy
	xJFP9IG8WoX3eLlHgPBUYTv1l0vD/Hmn8OYwMQP8wJsPwE++jJ8oyk+nSvPIPzD8qMmZRqb1RhX
	JC0oARtScOt5lJsi2RPomTsK2j6lhbqgrWFNqhlPpnPFImiGxl/vJsZyCNaocbWX2jh3ucBUq2R
	XowXSO38ZpGz96sCs72m9BrHZkyJ3wtkClSr9YQ3jVO7TYNcyV8vlt1w0C6KKizeRl2SkVoRxAB
	zzH2sPVrx0K47ob0d+2vGq51cpuu3v+Zyx9uQq+tXLg==
X-Received: by 2002:a05:6820:2402:b0:6da:29e4:35a6 with SMTP id 006d021491bc7-716e79e63f2mr1792603eaf.52.1793994799456;
        Fri, 06 Nov 2026 11:53:19 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:18 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 07/18] dtc: Move label-reference handling out of the grammar
Date: Fri,  6 Nov 2026 12:51:34 -0700
Message-ID: <20261106195159.2623314-8-sjg@chromium.org>
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

The grammar action for a top-level &label { ... } holds its merge logic,
including making an overlay fragment in a plugin when the label is not
found.

Move it into a new merge_ref(), passing it a struct fragment for the
reference and node.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- Rename merge_label_ref() to merge_ref()
- Build the fragment in one step, with build_fragment_ref()
- Return true on success from merge_ref()
- Check the fragment type with assert()

 dtc-parser.y | 23 +++++++++--------------
 dtc.h        |  1 +
 livetree.c   | 26 ++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 9b9b6db..c58a66d 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -214,21 +214,16 @@ devicetree:
 		}
 	| devicetree DT_LABEL_REF nodedef
 		{
-			struct node *target = get_node_by_ref($1, $2);
+			struct fragment *f;
 
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
+			f = build_fragment_ref(NULL, NULL, $2, &@2, $3);
+			/*
+			 * We rely on the rule being always:
+			 *   versioninfo plugindecl memreserves devicetree
+			 * so $-1 is what we want (plugindecl)
+			 */
+			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
diff --git a/dtc.h b/dtc.h
index 8c4d7bf..9b4389b 100644
--- a/dtc.h
+++ b/dtc.h
@@ -373,6 +373,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
 bool is_ref_relative(const char *ref);
+bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
 bool merge_delete_node(struct node *dt, struct fragment *f);
 bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
 
diff --git a/livetree.c b/livetree.c
index 3ff4e14..179866d 100644
--- a/livetree.c
+++ b/livetree.c
@@ -573,6 +573,32 @@ bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Merge a fragment which refers to a label into the node with that label. In
+ * a plugin, a label which is not found becomes an overlay fragment.
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	assert(f->type == FRAGMENT_NODE);
+	if (target) {
+		merge_nodes(target, f->node);
+		return true;
+	}
+	if (!plugin) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return false;
+	}
+	/* The label may be in the base tree, so add a fragment@N node for it */
+	add_orphan_node(dt, f->node, f->ref);
+
+	return true;
+}
+
 /*
  * Delete the node which a /delete-node/ fragment refers to
  *
-- 
2.43.0

