Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D45C2ECD15
	for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274205; cv=none; b=cScFUeTJx4HcYHdvSfiqHHvk4hAyX2o/+7mnbShdqzuBK9hksLHcRUIKOocZ75W/DaTYW8rQaWsQ5MLe1SiLB4rlyHTyJ0zECKdVf9PiWzRoNSvSPxHyeKifDmQx/a18tX7HnZRq5n1V2Ad+/jeic96mevqg3V9ykzLuHa6/PN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274205; c=relaxed/simple;
	bh=43mwJ03fJ0VnK6oUUl5EywT/UufmzlDzCMqzVszTy7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WpKwLxX89fwRlvuhEBCRVMmlhUP4GayC+DJl3syjF+xRVPyNkT5ng29CWL/byRThxMGNTihE4Rez7pZEx4dAz/sDhHeqd+ob8F0409smHjYQLPI/nlPk8X/pdu2Pf8sK0GZDNlTbC7fzqtig+d4s3Z3gbtMDk1OUnmSjErXVMOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sdFO4yB+; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sdFO4yB+"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso1789480a12.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 02:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758274201; x=1758879001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K7HkhB9EBB5x2t/E4zG0Moy4Q3pMI1UzmTpfxc/mOc=;
        b=sdFO4yB+8BwpXv8UYsC7Ka8vPvGn7zGrhphnhHCaOadslqJy1aDbuoPXZCmedDNvge
         q8/Q8+bJlaXxvxttlWpfOfL2Pmzh+3KjL2JKtJtMcNvwfuUn47nV2D/7ApuYRTGUtECu
         EDc0BvgjmRtEAT++vRwaAQ2Om1P9FztdJOF/5fY1ObJ/8UBKV8oJ+uSChUgJmvYj7L30
         7zdwCE/c4J1USuLWknAttFRbwDKSqDxTFrGtUj6/J7itMczNHUThxZEwnzuc7uCCtSzS
         Ch6LUK+Y+tMUZo06p10KOHpGA0mCO27YXTUwj86Axr3Qiv7VO7I+RXyQDwQPjrchyyg/
         aPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274201; x=1758879001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+K7HkhB9EBB5x2t/E4zG0Moy4Q3pMI1UzmTpfxc/mOc=;
        b=lrPIQ4czCZKnvfV4gEoYCoLBfxi2Iyg0WaTmzMGrvTvFu9iPEWJBPMOUXjXdsnttca
         C6ol6e8FLT5AS9qpy1Pr6J8kUY2EBx9TBAdCnMa46sEd/eXuTEjZOMFOvZx7dTzvfGsZ
         G9zCR1XgXoc/4VRIViHJXZg1DmoIytt61jjtCF4vUzWmlO4UohzcewvVeoTLEqNu1i5I
         hOjZRQrDC2hfydl+Cq3WDgfXit+TAguNHoAU2W0WKF0uOL39lc+WwGFzvndLwLBcvVe9
         4QYZAgzK8ff2Z/ciWrIHhe4VAhwiK9UJoiUBIhBCziOcXGM+XF+q9VBKEPvA36qdVSPI
         SDWA==
X-Gm-Message-State: AOJu0YxQMl2LX5HIXEpL7zv1pzLNv1ubTVHTtZ4weMfBa+FME9DbiCSG
	sKRjBBjfdQ7rf/TioDnNJnzDClch+4c9FhdJvieuJ/toSkebaJiBxqh/5P226geMiBo8+wu8JNi
	2b2Zo
X-Gm-Gg: ASbGncscdPke6fCuMRGDP5ErcSRFLQVjmp4FKZ2ojE7s4NPbu1MdSSnjidtmrV3/z+U
	Z9qEgZdRqUFd/gM0ml9CK8hI1ANiG76MmQpnj4gz5GD3Kbf9fWliZtbbMJOvqs24XbPW0tguamd
	ZJnBpNE1hLoIVlaLF+ASAzsJDzMb3LDn1qQekPSgiDSgumbnTyiLFRt1o5cnByasIb8cGKY3xLe
	ScTiWhEbmpPVJIonyg1a7JuCDUNjVmaNNN6T1xbARXW3G6EBxLmRBIxm67zqWzQB/n5S40cwMcs
	93iRn6oLY7LlHF76WQm9b+XMuula7kS6QXHlFfF/VopnmQTDZyiPBIvzxsR9MTHkNZ8ZjGdOvXP
	3HcxVRTPeY3RHa0JEx+H2B847RM5UOGFJkkrzZ9uEvOQ1S6t1gPAZIYISUzVFGpFi
X-Google-Smtp-Source: AGHT+IFufZoKX+1V00Dj5WhuEsk7Dervho/hcPYuJrqjzE85AM73TCEgzvhZurSkSrXhCbYBdlXJKw==
X-Received: by 2002:a05:6402:1d51:b0:62f:3730:d05 with SMTP id 4fb4d7f45d1cf-62fc096083amr1966027a12.18.1758274200662;
        Fri, 19 Sep 2025 02:30:00 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62fa5f28672sm3013613a12.43.2025.09.19.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:30:00 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 6/6] Restore phandle references from __fixups__ node
Date: Fri, 19 Sep 2025 11:29:19 +0200
Message-ID: <20250919092912.663304-14-u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4933; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=43mwJ03fJ0VnK6oUUl5EywT/UufmzlDzCMqzVszTy7k=; b=owGbwMvMwMXY3/A7olbonx/jabUkhoyzSlWxx7/HNtq6pKj15PHp7slYVrdgb7DY3G6X8EDD3 g8npQw7GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjI9zb2v0I34k50NqZNUv7+ r1Vxv69lqklVnFfoep/kea8vXf3YYVk9e7fiHcGIQ5f54lJlPLwDzP43CUv3p8c0uBuK/9/zjre PwYYzzOJg1t+3nS8kczPbV7J/Tvdnb76R/k2561tGoNzD+lDRZKsUq89TfyqcvCt+lXu756wvPK vvrltU/3BV8v5jrk9vrQs2/zt9t5XHxtrXP1Yf3tVmmn87eWntIY8OrQ+CZmUJJ49s4XrnpcEda SlvYlKhZh/WEy+1Ko7hVSxn/96g7NdiPZ1l9y/XhUWqsjvURqunX7k+JbH9FG84x0aNx08eOO9Z syRv2WWzyT/uzrnrZXMscvZxxYI1Lg2/ko0bgy6xZu4BAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The __fixups__ node contains information about labels. Parse its
properties to create phandle markers which improve the resulting dts
when decompiling a device tree blob.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
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
index e2eca63030a4..bf648bf6c21a 100644
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
2.51.0

