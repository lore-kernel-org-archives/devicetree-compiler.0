Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3892F3C32
	for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274203; cv=none; b=FsX41bZg7jRd5Cuxc+Z+hX2TUroqTOLcFenOUaajWUDhrknZGa/LJIG+AGiHLw96+LESrNRllWKP1nrTBlTy3Oe/Qm/u1IZQ0arsOpxkG3qvwlpm/Ug3NEuZG59cKsM5YpaNMBm6PQEnZ58aNdAfHozRSepxUyxWUnPPNbt6sUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274203; c=relaxed/simple;
	bh=PXeAkH7V5jKhCuUBVGHFdhazTxIizlagH/aXnQdMRNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PEPs3dnJeWb5U+1tRswyLCcYYM0IYSRwUDBYQwRzfJpgnUX0xqcMNbfKLg/5i7omLCPAah2Wyt6Zmc1tn6VWp344Nn7G2O0o3SXa7PGPtecF1SLbnJVqYWPk9ic1tOjPA75UKNkW1fcdLPo43o1TeeWADjDK9f7RBQuRdFgeuyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Cq+Mak7G; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Cq+Mak7G"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso5612448a12.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 02:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758274199; x=1758878999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZR59lSjwyhwr6SmdEpX1GzHttoRvuLBf/h4dk8rrFmo=;
        b=Cq+Mak7GMmUjDRtxCfoMXaKjsf2/UXVDn1xouaYChxkU8VIoM45Ig2BNJnYiBPBFxg
         kE01DLl6fKPGvu08IeVaOY+lNkoloKUWZu6d1PF77B4PuEoYdvRJumjFtpIKk0Fj3KnF
         sm8DIX3PAOe4PdO1mIgFBxxKyflAD1emoluPHRKofKZUTlGGcHruSciIejquvZEuM0h8
         Q6cNCyaicszCJ/fWtTfuZvJXsDFCC7ZcYOthdNlM19mKsfQuuO5M5Tnl0xIvr8OAchOZ
         Me5rrDzd64v4bN9y8hhN5iHpntIZZMo2+SbDdiZob9qqoO/o7A3sQaWm5w2XOf4Loicf
         E2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274199; x=1758878999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZR59lSjwyhwr6SmdEpX1GzHttoRvuLBf/h4dk8rrFmo=;
        b=ZFBOEJwEClxwwBiYXewolxWVQFYwq6rsMMGMVe7o+gozFA/ytXjLRRfH2ZgfHz8aYk
         IY/0lRH79miFD2xUsmQPDe2WP+Oe9s7ZiD6PrHPfoMS808y4NZBpCN5g5PR4gXjqelPK
         /mm7j6que+X+HhL22HT84vXfM/y4kQ4nHe6dQ5yG8K5gDyZe3SdnKYio6fP3/lE1N+FE
         pPL3WrbjyftjticT4L/MqmdVY5CP+vPLgOZG1jbcCjZEIw3qwr3eZ45YHATxBLMGtIMu
         H9O/0kGdV28awRw+fMINSsGW4lbVFNR+Ls23bQO6xeajXqyKVNo1orCgxmOuvN2nET4/
         dwfA==
X-Gm-Message-State: AOJu0YzEuVNsA0H6BXryWGv+Iuhg5o84gwrt0w3JecoZ05In6zW7DPwb
	B0HI4+5dCBVtbK/4umeo0yxLzaOkkJLihgoZSzI0A+3w8upbLoqA/MqSsSQD08UwKF7vf4QO89I
	cEoYM
X-Gm-Gg: ASbGncvm1pk94DgeQOc8JLGIsU2ZCE/CsGhHnNoCeBvRTVuqBnIQHbZCll6b6P75JY7
	yItIxaPjJbb7d0g/8l8zy0kN0FsQ97uZwYaFVCi8Vz6HiUgqRvSD+h/c8nD0vskQKjqCXj29RIe
	RvGfhqYoTkrnpezZA4UIVcZ7e2l8tSuEzPWgRHtz+M9asr+yzdELqOUMSe9i+t9UbKVnOPudWVm
	GL6SoADf4V4pEIl0k1ksG4hrTwc6LWodZpE5wqMfbyPGXYINlejMNO6hJuIKS10pMMCt6TE6k7z
	VUCnbhOZXWayjKTrbthAAZwRsbLJqx+yJk2Orkw4ymc7OFyZm7MbNmIwiE5MsbfOrpbhevI9Atq
	SHu2qmb9Y4zTKwwn2xq7svcRIWFk+dTSSaXnqE/f5VyLQWkH44zY6tkx3Lj1Ma00x
X-Google-Smtp-Source: AGHT+IHbEdzOnp0oXH8ZGu17qVmtHOt+EHpGb/qKsAXUxVhZFnKIMGe0yKK/++T2MpoyiyM1fomYog==
X-Received: by 2002:a17:907:c09:b0:afe:6648:a243 with SMTP id a640c23a62f3a-b1fa844ee0bmr746282366b.3.1758274199155;
        Fri, 19 Sep 2025 02:29:59 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b23a1227bacsm237140266b.41.2025.09.19.02.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:29:58 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 5/6] Restore phandle references from __local_fixups__ node
Date: Fri, 19 Sep 2025 11:29:18 +0200
Message-ID: <20250919092912.663304-13-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
References: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4678; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=PXeAkH7V5jKhCuUBVGHFdhazTxIizlagH/aXnQdMRNc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBozSJ3prUnPQjToRm7k1fyrd2NKEgt0a/8Hu92W JCyO1HyYBmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaM0idwAKCRCPgPtYfRL+ TsYBB/wLTlVtOXvZdkiha49z0vRluQDZKWjSaO7lY9QJtMVKKDcW+uD5DfxrS6Y+tY0Fc5bBaBf 0jZYTEkrUjSv6YAS/PvLf1/sBbQjUisnTJUlbRzqRrDjUicpt2xbaNo9qfytJ6l/yGgz0Jan1ur xvAtFusLKkkFBSsxCGZVhNWcihoMMUo4pn5au4LP9Nm6lnXT6wzpYpLwF44HiyFhCLF5uyCKKNk yxdcTHKp8XCslLzzX3dw6ovI3qhrOC8Lc/k3VTI3i/an2A9cwBnxlONJukAKPj/JsInQLs1s2js uVuGBBeawf1T8ewd9kMoAO4ID2xoBf0ql8g0aik1lsYPdSh0
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
index 576495902f0d..e2eca63030a4 100644
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
+		return;
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
2.51.0

