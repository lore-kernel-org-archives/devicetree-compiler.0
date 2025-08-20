Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF8C31AF33
	for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695539; cv=none; b=Jryk8h6Mn4bGnyxO1amghqIxPkB03LbsUxynYBgYn6iRw7AYQ/0mYYfXlIEBOH39ouzoGyUjdmgb/ehYFaQ4ra47AWPZq2AROdmWd8gL/k/O+0czwaDfBFF5Y72ESgMPn1M/JO6JgILEQZPnP+rdCE3AbTw7gNKsXFH8FTn8pOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695539; c=relaxed/simple;
	bh=4OXSgGPbRbgkaIU6+g8n619y4KDE8mgEfAYZFgkzS6U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MV5h1iC7FT5A1oyFElJsEdQA/s2F6nMg1khwEHvhj5F13IHFI+ppAzcUZ7JwIUXOrbyptjblG8YZOP45ZH9uYWqQubD6qRJlTgsCCK8GXFyBydwvTB0N2fl9cx8KAUD8/vYqgUGguHAPm/bqK9V0S58kffA0Pr0n9x4dBk23pzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OI1Kgu+f; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OI1Kgu+f"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e413a219so5151713f8f.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 06:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755695534; x=1756300334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+C7dWsSSRAJGcEB8aQ9dJv8jTakPkXDMUnYDOUpCb9s=;
        b=OI1Kgu+f7iKaxZOIArQ3Zo+HYlq8K4hbsFvwDYGfcbWCZCmEa/eON3b1syNGccR87u
         g1zRSGVFQneIi+o1FzNC9oSb6LWzLKt9yFFXhfeQdRQIYD2KUZlEru+dphqfBLpuG1Fu
         qijhTZttAMazc3IiDxvXk2ZA2klUDQZqISxZCeKZ6Fu/9Fnf1C6fjgETxFI3b+IsnVfs
         SQyGgtFIe5PNvsYhC76MPDAbNNa+cQ2nagkTpGdMkyw9sWc0xsidG6P7bxeEi4euTkz0
         lcqOLqm2lXQI4KRy1RYj6ckcjEOhnqdnl2I0r6VshCyBAHECj9cmj9xJ47A0wUdrtgX9
         k7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695534; x=1756300334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+C7dWsSSRAJGcEB8aQ9dJv8jTakPkXDMUnYDOUpCb9s=;
        b=awCW/ZIcK8Ojea6cZDjQVttd5xWjg93S4xKp85bcJ/ErX3HEYuuxm1Zoo+TDG31QVG
         Cm48SZ5NskdKqK4L6Z5TmuMLd0WSo1IAwXoRX9cR8LCY3PVYM3HNQ0NoLeQM83+irB6q
         qB7j3C/e2fdB5wUQo8Na00z76aYDxVjiBd48l1X/gC+/JCAghzoQvcJFX1Y+WnIaA/Fc
         waYO8Imsct1Sb2jGV/8s8X5ONvLlpC2FyG0LuDeEINJ2Johm3hbV4782630jaeCCop6I
         73RhJ/hHGPof98yhSBkOeNeRydt67TbeEq48C1+dGmHY4zkdP83FgmkS07jHtn+o3vKO
         zVjA==
X-Gm-Message-State: AOJu0YxCKx53Z0nkU3wzSxK53GpwgeyOx+Fb/MOcX3280VE0aQDiCYZB
	BEV+Y/Y6nmtIHOXwSaJqJSiIWznSjkUR8kjipvI0oeZZRwBNkpOEQoGFFltlXBixahJXDROemNT
	1yHQO
X-Gm-Gg: ASbGncumi0wmfWop1IFkVeITO0FqlM2i+wEox6Eqle6uJXgqu9T80mkcbCEiOwxFotv
	hcO8Vz4cdnvFJB+N4VNlEiv+5rCRVIYjEb/BR9SA/vWqvygZmB81nDDYO3zRhJrE8n04bAeOFsW
	4uO93ekI8ulIuSwnQyuAyV7HcbhHSyG2qTDbZ+c3qyUB6rXfhrtfQiGXFatWmbGxPx87o9NAO4W
	grVFJzBw1upD/ZNNjKIz5cAR8inVooS0zcb6Xm34Juy/E6IWxLdFYULIn2sp9KDbcs30qj8axHs
	oqLpKKZw22/FO362fUeHWCgxl7lnvlXxDiBEZ7vPfEjCfX3HVg7ZD1caYEbdksUfrWC/1jGsIK/
	Z6hHgKlSksiDNtOL4UJk9DmT77egA0NuYAwP5YYCYInsPPOsBw/l1oryZ1uZMuxX9
X-Google-Smtp-Source: AGHT+IH4LeWwu4DKbZ+za8hRYQVqibwJDvQM8TRrXxCE+I4jtbvGQu5oDIQ63DcDFx/rJFu5fgZnyg==
X-Received: by 2002:a05:6000:2089:b0:3b7:9d83:5104 with SMTP id ffacd0b85a97d-3c32ecce46emr1816170f8f.51.1755695534326;
        Wed, 20 Aug 2025 06:12:14 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0771c1aa3sm7371682f8f.32.2025.08.20.06.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:12:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 5/6] Restore phandle references from __local_fixups__ node
Date: Wed, 20 Aug 2025 15:11:31 +0200
Message-ID: <cf647c343aded75d394a49d86b3848fd9812f91e.1755692822.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
References: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4669; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4OXSgGPbRbgkaIU6+g8n619y4KDE8mgEfAYZFgkzS6U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBopcmZPUw442BpqmG6t+f8d79S/Iv+e9pJie1hH mpn66iCfCWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaKXJmQAKCRCPgPtYfRL+ TiHdB/0VVj5kL5hyeGLa47DsuDl2xhxu19g+Qt40wdClVLSFGQ99UOC6RMq2pcQjj71ZR5JcFwi uVfghGmXMGtCVstl1Xvi79ZfMsgATU6TDUYitWrvO5fW1OEcR63VAh+AUnxI+2mYBkZ/5A80ttb JuKizFiLvQcOP5yiYCWE/VrbPpWqkqTlmddNUOJ9Fg86JC5ISMtXhYVwb6T4jcwL/8QwQiuUK9n lypMfDdLNExh7+UUtlOHZvfNHAUzCeAClf5iZBDvZS2FhzS+ywKjluIujpsvm9OeW9hT+NB7DCW p4R5kaspzZ8hG7MrSUaQqjeBwUDGKtvPV0rLKzl3lNv7aPcx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The __local_fixups__ node contains information about phandles. Parse it
to improve the result when decompiling a device tree blob.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 dtc.c        |  2 ++
 dtc.h        |  2 ++
 livetree.c   | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 treesource.c | 33 ++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/dtc.c b/dtc.c
index 63a6c85da5cf..9f90b373967d 100644
--- a/dtc.c
+++ b/dtc.c
@@ -343,6 +343,8 @@ int main(int argc, char *argv[])
 	if (generate_symbols)
 		generate_label_tree(dti, "__symbols__", true);
 
+	local_fixup_phandles(dti, "__local_fixups__");
+
 	if (generate_fixups) {
 		generate_fixups_tree(dti, "__fixups__");
 		generate_local_fixups_tree(dti, "__local_fixups__");
diff --git a/dtc.h b/dtc.h
index f97f3c29e2d4..d07a583441f6 100644
--- a/dtc.h
+++ b/dtc.h
@@ -343,6 +343,7 @@ void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
 void generate_fixups_tree(struct dt_info *dti, const char *name);
 void generate_local_fixups_tree(struct dt_info *dti, const char *name);
+void local_fixup_phandles(struct dt_info *dti, const char *name);
 
 /* Checks */
 
@@ -358,6 +359,7 @@ struct dt_info *dt_from_blob(const char *fname);
 
 /* Tree source */
 
+void add_phandle_marker(struct dt_info *dti, struct property *prop, unsigned int offset);
 void dt_to_source(FILE *f, struct dt_info *dti);
 struct dt_info *dt_from_source(const char *f);
 
diff --git a/livetree.c b/livetree.c
index 8aafc9aa5cd6..3dbef9071017 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1160,3 +1160,60 @@ void generate_local_fixups_tree(struct dt_info *dti, const char *name)
 			"Warning: Preexisting data in %s malformed, some content could not be added.\n",
 			name);
 }
+
+static void local_fixup_phandles_node(struct dt_info *dti, struct node *lf, struct node *n)
+{
+	struct property *lfp;
+	struct node *lfsubnode;
+
+	for_each_property(lf, lfp) {
+		struct property *p = get_property(n, lfp->name);
+		fdt32_t *offsets = (fdt32_t *)lfp->val.val;
+		size_t i;
+
+		if (!p) {
+			if (quiet < 1)
+				fprintf(stderr, "Warning: Property %s in %s referenced in __local_fixups__ missing\n",
+					lfp->name, n->fullpath);
+			continue;
+		}
+
+		/*
+		 * Each property in the __local_fixups__ tree is a concatenation
+		 * of offsets, so it must be a multiple of sizeof(fdt32_t).
+		 */
+		if (lfp->val.len % sizeof(fdt32_t)) {
+			if (quiet < 1)
+				fprintf(stderr, "Warning: property %s in /__local_fixups__%s malformed\n",
+					lfp->name, n->fullpath);
+			continue;
+		}
+
+		for (i = 0; i < lfp->val.len / sizeof(fdt32_t); i++)
+			add_phandle_marker(dti, p, dtb_ld32(offsets + i));
+	}
+
+	for_each_child(lf, lfsubnode) {
+		struct node *subnode = get_subnode(n, lfsubnode->name);
+
+		if (!subnode) {
+			if (quiet < 1)
+				fprintf(stderr, "Warning: node %s/%s referenced in __local_fixups__ missing\n",
+					lfsubnode->name, n->fullpath);
+			continue;
+		}
+
+		local_fixup_phandles_node(dti, lfsubnode, subnode);
+	}
+}
+
+void local_fixup_phandles(struct dt_info *dti, const char *name)
+{
+	struct node *an;
+
+	an = get_subnode(dti->dt, name);
+	if (!an)
+		return;
+
+	local_fixup_phandles_node(dti, an, dti->dt);
+}
diff --git a/treesource.c b/treesource.c
index 576495902f0d..5b8d7a679519 100644
--- a/treesource.c
+++ b/treesource.c
@@ -183,6 +183,39 @@ static void add_string_markers(struct property *prop, unsigned int offset, int l
 		mi = add_marker(mi, TYPE_STRING, offset + l, NULL);
 }
 
+void add_phandle_marker(struct dt_info *dti, struct property *prop, unsigned int offset)
+{
+	cell_t phandle;
+	struct node *refn;
+	char *ref;
+
+	if (prop->val.len < offset + 4) {
+		if (quiet < 1)
+			fprintf(stderr,
+				"Warning: property %s too short to contain a phandle at offset %u\n",
+				prop->name, offset);
+
+	}
+
+	phandle = dtb_ld32(prop->val.val + offset);
+	refn = get_node_by_phandle(dti->dt, phandle);
+
+	if (!refn) {
+		if (quiet < 1)
+			fprintf(stderr,
+				"Warning: node referenced by phandle 0x%x in property %s not found\n",
+				phandle, prop->name);
+		return;
+	}
+
+	if (refn->labels)
+		ref = refn->labels->label;
+	else
+		ref = refn->fullpath;
+
+	add_marker(&prop->val.markers, REF_PHANDLE, offset, ref);
+}
+
 static enum markertype guess_value_type(struct property *prop, unsigned int offset, int len)
 {
 	const char *p = prop->val.val + offset;
-- 
2.50.1

