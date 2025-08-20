Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF031B118
	for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695541; cv=none; b=oSrRMoi9RVEn5ST2ShzD5vj+O9YwxknY9Ltj3DIEQbKn9cf+nkAu0sv5HHkwCUAOC09vTLnhvbnQA54IhiM+NaNVBR4vkGMGhTE0T5d84cm/BmzglOVRCXPLHPYVj55yRPrfVdvTuEC9o/pqaCnaUyC0HQMBD8npCd5ZZFB/3Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695541; c=relaxed/simple;
	bh=gvFu5V0qLCwQkOydsyy10S9j8Vv2m+XLWp8YqbTIUEc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XgbYUiAbILmwCShri1Ac80y7EO10oyy1i5pDz813bwX5gg0Mpuve9PXuGpZJt6Ch4e/3hLGlVb9C6k4si4fdddwBUY86j1niY9MvXeCTeoTqkvh160tOmSSyNRdwJ6jXTbVoVdu1UnqS9ti3UniPFX+6Vs6carNAAoeJWTSXCQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TyZ5qgyE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TyZ5qgyE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so6152535e9.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755695536; x=1756300336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkYMdoOpWxZO6OmPYIL1TQIExJEmB48DlvlOiUD+IxM=;
        b=TyZ5qgyESdcDc2bar5FnB4er7H9arLlXWRSTunZ4giV0y3CAORoeSV/nzZXFEcynjG
         48qBF/Oox0em2FlTVZAxNhi6YIWPw/o90zhpCTNx9i20NKLTRGYcCJSa6lZ9DIH/9EMD
         A29oobB8H5McwkOzcexB4Z1/lf/QsdwEHy7yXOsr4FkegWsaqEZE1RlTySfwbZK1EYAn
         CAu6O75uMz//8X0EoueMCAim0SPg0Kjmu9oL9zDgkLyEhpUKQFkvs4+b7V/iFWBEGeht
         Ousgz5auKgj2VrjSDMaPYL+m16Cc4hYX7vAzIyU1Gi3HRzGTKBU+C6pCaT0JS0VsFvht
         WPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695536; x=1756300336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkYMdoOpWxZO6OmPYIL1TQIExJEmB48DlvlOiUD+IxM=;
        b=DAFOOfF5urs7ZoI1oLpTvarHhafk57kF1U8wQeNMFmKURyr/e50glEiU01XIk8d2cy
         24bCwbbnJcY6+OPLVGzd+7vg7piNBmP3KkgD5WuyQqizWUofETlHOBVfYqYiqxs8G5se
         Bq5OrIMf7rNZbHIpfcvUntgcWAjulWf4dunAfc/uBgryn/6xoZf8DsFaUsvB+vTPzF2G
         +mWcsSpSWvT+94Z+Tn9OYrNscQiTpSDvfpXakmSABRFf1Y3hPCQ8CMBvc2HqaR3gS5Yk
         AWnjphTxVkN5xBPiq3bQQLgBj2rHKQ/MLO0MLhURoDnGM101rwj7/nFc8r4oEDSsvyVd
         i41w==
X-Gm-Message-State: AOJu0YzQbrtdsSg3tYU/9m0TzN3US7dn7+r+YT3IwxLyK6mcp6RGmnMy
	tYj2m7gwIfH9a4BKEvzxL1xjz/PG/z4VrE3wvo+Vej9TP5sTdbmbuBZQeaEstAGuher3VmKlGQ7
	m2Xzt
X-Gm-Gg: ASbGncuAPHRVNjxZxuxrCOw02DPShJzotsRd9zFu7saqeZk4jGmRfWlmiUCyGdmydKr
	TIPnkIp0u6QB8bJeY4PwHpDI0Fhi7gXGuyTUkFilO5Kn79IamTIzbl5DqGabW4ziAPVCoT6crDz
	3O3w7jZ6GsFr8+TcAf2Qc2wE3tcmwV48332jc3nmHFPoEVLBWEzQQRzemtzUeBcVF6FuKx4CB1R
	LVXGFcHNj1Zkjlzh/5bOypAhJjUatNAU8SpsDZd2YGZIBfvC3fALpqNS8Hlir0+OTXgFaC/4s4i
	VIJmTCsoCtX8u4Q1+Z4HNLigu+XePs3D9vG6jHlWuZQawtFfQAiARvBXpOQ9N+9tPzDb4G72v8+
	ONDyVbPBs7Z4/EV7kFKtDxqqe452T98ucDgiQbXjNf7RLFLCc4iG7vK26vG5qEKu6
X-Google-Smtp-Source: AGHT+IGqclaAGUMHcoMqOb2Uqj5egq8jAthqJKuwWcx/rOeemUvP+eb4Oy383DTXMxvU9HMbORx+ZA==
X-Received: by 2002:a05:6000:2c0d:b0:3b7:775d:e923 with SMTP id ffacd0b85a97d-3c12a803871mr4882808f8f.4.1755695536083;
        Wed, 20 Aug 2025 06:12:16 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074d43bc6sm7672988f8f.25.2025.08.20.06.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:12:15 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 6/6] Restore phandle references from __fixups__ node
Date: Wed, 20 Aug 2025 15:11:32 +0200
Message-ID: <f3fa240e296b08e68b990d995da12978058c97f9.1755692822.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4876; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=gvFu5V0qLCwQkOydsyy10S9j8Vv2m+XLWp8YqbTIUEc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBopcmb8hmX/Tcm3dj1PoZwvCQ17SIF/P3ytHm4k nCHZo9RHlGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaKXJmwAKCRCPgPtYfRL+ Ti5ECACA9sIy+LPajOrzTApXfCT6seNHZgmIFed00GEnBf38x2DR0y2t5NYSf97bLPPVjBR1n8C dPo7pLZZ1NeTcwLJQOURyPsbVQdd+0vlIBk3PPk7y4KbOJLTqmSSD6x7dS4lMqqowX5ct+VW0lg 4tKdAvrgW+hd0yuzix7WbCYAIIRpy6xKNAxSlvBIZ/TzK+W/GsWsuyE25Mda2WhXqn7285zP0Ty K3sOcAafrqNgLnUnUoetiukRrW7rwMgwYihUMSRAkwaVLOq/2OCaKhS8DMbNQHXc1rPUHi8vw90 X3AV53yLorXRRbo33UF/ghAAua6LeaaDlkPm8cGPD+UqoTJ8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The __fixups__ node contains information about labels. Parse its
properties to create phandle markers which improve the resulting dts
when decompiling a device tree blob.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 dtc.c        |  1 +
 dtc.h        |  3 ++
 livetree.c   | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 treesource.c |  6 ++++
 4 files changed, 106 insertions(+)

diff --git a/dtc.c b/dtc.c
index 9f90b373967d..6dae60de0ea5 100644
--- a/dtc.c
+++ b/dtc.c
@@ -343,6 +343,7 @@ int main(int argc, char *argv[])
 	if (generate_symbols)
 		generate_label_tree(dti, "__symbols__", true);
 
+	fixup_phandles(dti, "__fixups__");
 	local_fixup_phandles(dti, "__local_fixups__");
 
 	if (generate_fixups) {
diff --git a/dtc.h b/dtc.h
index d07a583441f6..7231200e5d02 100644
--- a/dtc.h
+++ b/dtc.h
@@ -342,6 +342,7 @@ void sort_tree(struct dt_info *dti);
 void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
 void generate_fixups_tree(struct dt_info *dti, const char *name);
+void fixup_phandles(struct dt_info *dti, const char *name);
 void generate_local_fixups_tree(struct dt_info *dti, const char *name);
 void local_fixup_phandles(struct dt_info *dti, const char *name);
 
@@ -359,6 +360,8 @@ struct dt_info *dt_from_blob(const char *fname);
 
 /* Tree source */
 
+void property_add_marker(struct property *prop,
+			 enum markertype type, unsigned int offset, char *ref);
 void add_phandle_marker(struct dt_info *dti, struct property *prop, unsigned int offset);
 void dt_to_source(FILE *f, struct dt_info *dti);
 struct dt_info *dt_from_source(const char *f);
diff --git a/livetree.c b/livetree.c
index 3dbef9071017..5d72abceb526 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1151,6 +1151,102 @@ void generate_fixups_tree(struct dt_info *dti, const char *name)
 			name);
 }
 
+void fixup_phandles(struct dt_info *dti, const char *name)
+{
+	struct node *an;
+	struct property *fp;
+
+	an = get_subnode(dti->dt, name);
+	if (!an)
+		return;
+
+	for_each_property(an, fp) {
+		char *fnext = fp->val.val;
+		char *fv;
+		unsigned int fl;
+
+		while ((fl = fp->val.len - (fnext - fp->val.val))) {
+			char *propname, *soffset;
+			struct node *n;
+			struct property *p;
+			long offset;
+
+			fv = fnext;
+			fnext = memchr(fv, 0, fl);
+
+			if (!fnext) {
+				if (quiet < 1)
+					fprintf(stderr, "Warning: Malformed fixup entry for label %s\n",
+						fp->name);
+				break;
+			}
+			fnext += 1;
+
+			propname = memchr(fv, ':', fnext - 1 - fv);
+			if (!propname) {
+				if (quiet < 1)
+					fprintf(stderr, "Warning: Malformed fixup entry for label %s\n",
+						fp->name);
+				continue;
+			}
+			propname++;
+
+			soffset = memchr(propname, ':', fnext - 1 - propname);
+			if (!soffset) {
+				if (quiet < 1)
+					fprintf(stderr, "Warning: Malformed fixup entry for label %s\n",
+						fp->name);
+				continue;
+			}
+			soffset++;
+
+			/*
+			 * temporarily modify the property to not have to create
+			 * a copy for the node path.
+			 */
+			*(propname - 1) = '\0';
+
+			n = get_node_by_path(dti->dt, fv);
+			if (!n && quiet < 1)
+				fprintf(stderr, "Warning: Label %s references non-existing node %s\n",
+					fp->name, fv);
+
+			*(propname - 1) = ':';
+
+			if (!n)
+				continue;
+
+			/*
+			 * temporarily modify the property to not have to create
+			 * a copy for the property name.
+			 */
+			*(soffset - 1) = '\0';
+
+			p = get_property(n, propname);
+
+			if (!p && quiet < 1)
+				fprintf(stderr, "Warning: Label %s references non-existing property %s in node %s\n",
+					fp->name, n->fullpath, propname);
+
+			*(soffset - 1) = ':';
+
+			if (!p)
+				continue;
+
+			offset = strtol(soffset, NULL, 0);
+			if (offset < 0 || offset + 4 > p->val.len) {
+				if (quiet < 1)
+					fprintf(stderr,
+						"Warning: Label %s contains invalid offset for property %s in node %s\n",
+						fp->name, p->name, n->fullpath);
+				continue;
+			}
+
+			property_add_marker(p, REF_PHANDLE, offset, fp->name);
+		}
+	}
+}
+
 void generate_local_fixups_tree(struct dt_info *dti, const char *name)
 {
 	if (!any_local_fixup_tree(dti, dti->dt))
diff --git a/treesource.c b/treesource.c
index 5b8d7a679519..6cd996f0d17b 100644
--- a/treesource.c
+++ b/treesource.c
@@ -173,6 +173,12 @@ static struct marker **add_marker(struct marker **mi,
 	return &nm->next;
 }
 
+void property_add_marker(struct property *prop,
+			 enum markertype type, unsigned int offset, char *ref)
+{
+	add_marker(&prop->val.markers, type, offset, ref);
+}
+
 static void add_string_markers(struct property *prop, unsigned int offset, int len)
 {
 	int l;
-- 
2.50.1

