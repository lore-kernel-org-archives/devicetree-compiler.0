Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551123;
	b=eqbp7Iry6hi6dje3CeRtJMUmegflvGdWdI/CP0D0fFL/adtpa1FxvN1SA72XyxDoQ1mE
	 awbx2/LeA/KjQacpjqWfU5lSGotXzS81ZO+aq0ZNc9R0VbJTGOCcwVFyP2CfcH5zy7Lj1
	 QAuKeOp4HFoe3mARACi9d2RUomdqOw5brs8o7I3NbaUWewjhTWWi9KOgdeBAuVWOPl1gb
	 VxoYaRp54qeJ4nL59lQIMBLRxHzWFY4VgnlZm1kHeGuaeklHmR7xVtmnEIAm9xnNdvtR1
	 qthfeujpPKhuo3u9zh45UsVcaqoxj1M1XHCP0W/1DtuTN4i9gGrUP/BFbefHXOcmxXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J1iNxBv4jmVSQ6Y8FTcGzIM8SDDY332XYFWLKLVU0UU=;
	b=XoilqeSscxjhR4fR6/iWTAEtFvMDzlGhG/ezENwimXidwN5gAg4uMdl+dYWVdQ0egItp
	 mSQ2+G9s9Ici8JF4cxEAVgtd22J2UC5BBWtduroG93QjiVa/6jwApk6cMxc8+iidyUv01
	 CgEh5ZzriyxcOpQfpR9ihaGoPR210AtlHMXC88UYSFwqp1MUSKlgHBYB73ZSkk9BzQSY7
	 zFDTNadU1KX7HP6W9gmzQVN2YnW49rVDZLyqmhuKM0qnD/hoR0zn+F50uX4jNocXgpWki
	 X37n6AAW25HQN35HFQYGSRY3bsrn5VVNuCJZQKykvVd9ixLc9pt4z9UuLM8FtNjnrnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LSne+MnV;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6EE606A325
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6EE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LSne+MnV
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-84621d8c7aaso1003733a34.2
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551121; x=1794155921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1iNxBv4jmVSQ6Y8FTcGzIM8SDDY332XYFWLKLVU0UU=;
        b=LSne+MnVUfK4KVIB0COynBYeAjiq5Kmm7W0FIdIVT+3DjZ0EGnMWMleAvGBO+Y4K6r
         Wf3hkUiZMEsFBTWOr6ooduWsZ3ADXW+/oNM2qaTWQ++nBSnU0xlcFD1QGHv6gpAmx9eN
         RHVS5wyAdrewXDIplugN14Nf8b7l2PxCeq7IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551121; x=1794155921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1iNxBv4jmVSQ6Y8FTcGzIM8SDDY332XYFWLKLVU0UU=;
        b=v1iVhLyCv+hdp4SCRWbs5IHtQw6QdSlN6+bngSq/FhcyvghDfeZPkv5nu3t+M2593K
         bJ8kgFi48y68IqXEzISSZ358pRRCE4bzqV8q+8ytKVHPockQVNJS+dvObXl4SwqnGJX3
         1odati5ucbUpB1DyndD/5qC5urn9cbH675/lwA4/aZnSAzkxo2sikHa2ziModR3bgxt7
         ATt3RxWwXnIXBDtOdv9i/ppOFp2g828nO5Z/j/4X6E03BEEH1OZpNGMhAS2+5DgtbmHL
         7RrjSrAFnBZO6i0HC08VeiZZHWoKS7/ZwM5XCbqYiEjTU9KZoaBNLvpQcinBPiFe5qhr
         C8gA==
X-Gm-Message-State: AFq9FYJv4HGVJQQ4Vjq8efsiEh2i/J+4gRKRtrwpx4fz6Ta3X5NnYj4v
	LTs1zwtukbNi7mUa7/jm6cox0jVCC6vVVxUgGcH8LW4mInK6J6wrAc6Gh733s9jqJh8f3ypxWhA
	1jaKijJ0z
X-Gm-Gg: AYBFou3bTQ6Gq7zDQ2BN5jiqFbN+VVb3V2z45172bNyFb7SHyxga5QS5h+jIk/HJ04X
	Amnzh9pbyjLFvoBjH+gd2Ib4q5finNjVSX85JfiOGMuuVmv8QXCV6ZHtooiVdXQYJ6rrcBpAV5k
	PPhSKjRDljd6wMSa+EAMPIo2tfilnDjwniY+y3BGnB8yqb4xM6coNP7xMMwEtJ2ADWfkr3rFASH
	Ke+tNpto3MrLYo8G5YniBVhA2JxodoWjqAgOr6sgtKMfbUqi/uQkQEeRbjpYlNRO5gE0INi4IMy
	5sqdZbMHwC7uzaH6EeluxLnghFEGBlQrfxb4Qgf7JJ7hCqxpjF43YW7ob9QMnJjt9YMVjMvyOxp
	tjEBf4U5KQrDbXMCEsu1HLSs689YUHT3TuRzBguTwzvbQr/gAeMnHmEYMsZiG2x6qk73gCf5QQf
	0hW2J8cyE/w0m1FvPBMve/h6x4kwrFG9r6mPp3FDwNx/bL/mdX2IZGY7KmIN6bdotMV9Wcr3VJQ
	+6prgcgsPVqbz+gRlSw84Zu1fpuNzlo9KyBhPJ/d0ECvKHbTPrx93vSDbx2gwXR1dlaUL6jH/OT
	18oGOg8957MHqYJMYDr5dR5Z7GA10zU3CG4Y1FK068Z6dOg4QNDq4U9gGP5dauoQVbhzbNjZ41M
	gyuxdAlnyGrFlqUFEKaXcJw==
X-Received: by 2002:a05:6830:916:b0:846:5d82:8bc8 with SMTP id 46e09a7af769-85d35ee701fmr7625359a34.0.1793551121548;
        Sun, 01 Nov 2026 08:38:41 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:40 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 11/13] dtc: Add helpers for the errors when merging a fragment
Date: Sun,  1 Nov 2026 09:37:05 -0700
Message-ID: <20261101163721.2458982-12-sjg@chromium.org>
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

Four of the merge functions look up the node which a fragment refers to
and report 'Label or path not found' if it is missing, and three check
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

 livetree.c | 90 +++++++++++++++++++++++++++++-------------------------
 1 file changed, 49 insertions(+), 41 deletions(-)

diff --git a/livetree.c b/livetree.c
index 6a290fb..1e012d4 100644
--- a/livetree.c
+++ b/livetree.c
@@ -548,6 +548,40 @@ static bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Report an error at pos if a fragment uses a label-relative reference, which
+ * a plugin does not support
+ *
+ * Returns true if there is an error
+ */
+static bool check_relative_ref(struct fragment *f, struct srcpos *pos)
+{
+	if (!is_ref_relative(f->ref))
+		return false;
+	srcpos_error(pos, "Error",
+		     "Label-relative reference %s not supported in plugin",
+		     f->ref);
+
+	return true;
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
@@ -557,17 +591,14 @@ static bool is_ref_relative(const char *ref)
  */
 static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
 {
-	bool error = false;
+	bool error;
 
-	if (!plugin) {
+	if (plugin) {
+		error = check_relative_ref(f, f->node->srcpos);
+	} else {
 		srcpos_error(f->node->srcpos, "Error",
 			     "Label or path %s not found", f->ref);
 		error = true;
-	} else if (is_ref_relative(f->ref)) {
-		srcpos_error(f->node->srcpos, "Error",
-			     "Label-relative reference %s not supported in plugin",
-			     f->ref);
-		error = true;
 	}
 	/* Make a new, empty tree with a fragment@N node for the reference */
 	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
@@ -584,20 +615,12 @@ static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
  */
 static bool merge_labelled_ref(struct node *dt, struct fragment *f, bool plugin)
 {
-	struct node *target = get_node_by_ref(dt, f->ref);
-	bool error = false;
+	struct node *target;
+	bool error = plugin && check_relative_ref(f, f->label_srcpos);
 
-	if (plugin && is_ref_relative(f->ref)) {
-		srcpos_error(f->label_srcpos, "Error",
-			     "Label-relative reference %s not supported in plugin",
-			     f->ref);
-		error = true;
-	}
-	if (!target) {
-		srcpos_error(f->ref_srcpos, "Error",
-			     "Label or path %s not found", f->ref);
+	target = lookup_ref(dt, f);
+	if (!target)
 		return true;
-	}
 	add_label(&target->labels, f->label);
 	merge_nodes(target, f->node);
 
@@ -615,26 +638,17 @@ static bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin)
 	struct node *target;
 
 	if (plugin) {
-		bool error = false;
+		bool error = check_relative_ref(f, f->ref_srcpos);
 
-		if (is_ref_relative(f->ref)) {
-			srcpos_error(f->ref_srcpos, "Error",
-				     "Label-relative reference %s not supported in plugin",
-				     f->ref);
-			error = true;
-		}
 		/* Add a fragment@N node which applies the node at the path */
 		add_orphan_node(dt, f->node, f->ref);
 
 		return error;
 	}
 
-	target = get_node_by_ref(dt, f->ref);
-	if (!target) {
-		srcpos_error(f->ref_srcpos, "Error",
-			     "Label or path %s not found", f->ref);
+	target = lookup_ref(dt, f);
+	if (!target)
 		return true;
-	}
 	merge_nodes(target, f->node);
 
 	return false;
@@ -672,13 +686,10 @@ static bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin)
  */
 static bool merge_delete_node(struct node *dt, struct fragment *f)
 {
-	struct node *target = get_node_by_ref(dt, f->ref);
+	struct node *target = lookup_ref(dt, f);
 
-	if (!target) {
-		srcpos_error(f->ref_srcpos, "Error",
-			     "Label or path %s not found", f->ref);
+	if (!target)
 		return true;
-	}
 	delete_node(target);
 
 	return false;
@@ -692,13 +703,10 @@ static bool merge_delete_node(struct node *dt, struct fragment *f)
  */
 static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
 {
-	struct node *target = get_node_by_ref(dt, f->ref);
+	struct node *target = lookup_ref(dt, f);
 
-	if (!target) {
-		srcpos_error(f->ref_srcpos, "Error",
-			     "Label or path %s not found", f->ref);
+	if (!target)
 		return true;
-	}
 	omit_node_if_unused(target);
 
 	return false;
-- 
2.43.0

