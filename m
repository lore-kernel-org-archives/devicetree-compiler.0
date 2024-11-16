Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3181D515
	for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731769259; cv=none; b=ZlEOFyygK6QEV3ICmK/TQIQjJISmlR4SVlXreGAxJ+XSxQ6iv/oFaCddiggrWeufK2oqQA5PeYg1YvLpjkEnEpM9UgEW1h5lthfAgXg34P7QbDmOrYItkk+zGzGtnrclVF5oY1ZGqPkMtwc1xaRjJDzn75D4P3QQuO2oMBf7f6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731769259; c=relaxed/simple;
	bh=Uj4pJFY/H9cV+l1IepXMqJ8vocSCXDLs4p6vhsj8VrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjTMhuKvSWQFuGAsKGoHsuZ95Nv82f6QRWQNxXGlFIeu3mqiWGScVXOGKWzAUErcEcdL9y5ahL8O24FNKiWZy0j/ETnPFlQqqxanMZ6kC8SsLwBn4qKFQ9p/8SPmcHc87l6s2jev4yB84pbc14R4XblaXImnZFebbmtMFnZasIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=0iw1OgZ6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="0iw1OgZ6"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7f43259d220so429455a12.3
        for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 07:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731769257; x=1732374057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGAQfNnabracsGAPaQSNnE5OEoxjNi30dGxVupCdMmw=;
        b=0iw1OgZ6XKHWjWiG4zU74UQPTIY7yHzReb0IlGVlWmHFe+6+wXEfbIA9xkMWt0o3Ud
         1ry79LpdZd6xfOpZWHfya2Y8VhYl26roEUpWAc4FDo4hE7FXANA06G4Jk7qreI6/uENG
         vImLPP/opvfyxouiuIr6RLgmf3nCZb9eZaQrr/JquTq2mNo2QpcFjNQHFgNHBpXEaQ7j
         9828KJ/w63yiXHJgTq9GdXVd4HUZlcxscOGq2hEvyr3ts8dVqcJ1XQqDP9v/hLoOKrEJ
         wR3NavvBocRNaBgyKZ1Yj/42fw9x7qgUI2uf7OjopiOESIwACn/KZZTilsXpI5xhNpsG
         nFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731769257; x=1732374057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGAQfNnabracsGAPaQSNnE5OEoxjNi30dGxVupCdMmw=;
        b=XXSu0RU1zaPKA1M1gqdJWKo08iqgfLpjYlhlAUF7WEZH6ZE03FefXsknLoCO5vpgtv
         EpC1EumcwF0CW4A7EfzV89pWVBQ/BWk6AM6PBC3qcx3y/rT6Gg+3p3kw0ODY8eKQ1ICM
         5LxF3NGTNDYlGMCgMQggNULCSg1e7ivQatKmuS/Idygqy702ZcKDtDEf7YQrnLJq/+fd
         N25L0eIruPgFP4OInmcBGXSVAizlS7fV2ArasCSPeg7qIX216UhDWL6hdXnt77HrXBt1
         dEBj8fAkcbmms2kK0aNJ6lNdaQ0tRqmxZ2x6Vy5VypkHKNsvdigI8venxSdYQp3CUzG0
         bx6Q==
X-Gm-Message-State: AOJu0YxQAoD0E0s+MIRVmpPFWm2uZhA0kfcSxbd87MsXceOBrbTsJS22
	ZcjIoATHFgZiY8x/61cM0lYJO/lfZsLbo3V37k/DZYipIEHXaKT8rhu+/OZJhQ==
X-Google-Smtp-Source: AGHT+IGIge5akwUKT+J6Bh3Vb0TVO+YN64zxeEGbzlFjm94vm3krZDSKvi2nYRSfgS7MErV64S+F8A==
X-Received: by 2002:a17:902:ce81:b0:212:6a4:9b0 with SMTP id d9443c01a7336-21206a40f36mr2590635ad.43.1731769257087;
        Sat, 16 Nov 2024 07:00:57 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f4694bsm28492305ad.196.2024.11.16.07.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 07:00:56 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sat, 16 Nov 2024 20:30:19 +0530
Subject: [PATCH 1/5] dtc: Allow path fixups in overlays
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-overlay-path-v1-1-ac3e121359e9@beagleboard.org>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
In-Reply-To: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=Uj4pJFY/H9cV+l1IepXMqJ8vocSCXDLs4p6vhsj8VrI=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnOLOhqbF400YiR211jNI5wdGdDS8WzeaS+ThSz
 RmUHkS6W6GJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZzizoQAKCRAFzvXHieVa
 dBu8EACzTQOA4b+94WBvwUo8uXcxphGz6YxlnABTcXfEggnqpGRi0HauGa/gXtD2ZPvy4/NF7CM
 JyCW3Nm5RAvXlvwlia6TwSECF3QDLAPvrRew//P5pI4klyENwx3Cir6GZF+CifbM6Pk5YjK/qsJ
 PKdnjrsXPhckZH6oScQl7Ffr7qo0+xX3XY76qzty6RLtwSIqe7HIbnErsEbBWnDfnDFEikAMYY3
 1GH5N8BXl5tWQxW6WejKKTMFPrLcraYj5BCUjdWr1bml/CBM5VhEx+WQm4B3vQDTq0VSwvi6g1W
 nQYhaHYMP/paT2A3no+KPIToByJl9nuq4r9V3LBscFbYVuzN/tHKyKFj0Lkq1CtGHDez7Y7U4+f
 xEsi+KeaQIFRHOsO7a0Lrl2IfSoSXJZtD35anioB86QPuGVAaftr6VUifGmjFCucdfw6NgdUVhY
 NKnIxq9jEqSQPuwfCP1h06H5wNn1PJ5PMxP3spWY4t1O4DcZjNIaQBffE/142UCLTIBDPhLYyUM
 aMd9H2VUxwAP8an3MOGbKilzG9KnxYlJVHuj+BSjXp81MW0UMEHAbEZ0tyqEjeA0t56NS/HGmWE
 2Ojx1hLHOjUivlZ7Xj7kkVZtRAgKcDM0Dp9Ey1NSuKjvW8goK5YSOayrb+TuDwvCG97nKFZ7LfR
 5IhVut4ccdA5JWw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Enable generating fixups entries for path references. These are the same
as the entries for phandles.

Path properties have empty value in generated overlay. This allows easy
differentiation between path references (size > 0) and path references
(size == 0).

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 checks.c   |  6 ++++--
 livetree.c | 19 +++++++++++++++++--
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/checks.c b/checks.c
index 6e06aeab5503f78c8a969f8d1d0e96be7b91749e..1ec59c6a1be375e1695b68203a0782cf23ee33fa 100644
--- a/checks.c
+++ b/checks.c
@@ -651,8 +651,10 @@ static void fixup_path_references(struct check *c, struct dt_info *dti,
 
 			refnode = get_node_by_ref(dt, m->ref);
 			if (!refnode) {
-				FAIL(c, dti, node, "Reference to non-existent node or label \"%s\"\n",
-				     m->ref);
+				if (!(dti->dtsflags & DTSF_PLUGIN))
+					FAIL(c, dti, node,
+					     "Reference to non-existent node or label \"%s\"\n",
+					     m->ref);
 				continue;
 			}
 
diff --git a/livetree.c b/livetree.c
index 49f723002f855764452b30b5a979b6096730a33b..4e26d378e09407d6a395c2f1bbd73c1874de4ae0 100644
--- a/livetree.c
+++ b/livetree.c
@@ -908,6 +908,13 @@ static bool any_fixup_tree(struct dt_info *dti, struct node *node)
 			if (!get_node_by_ref(dti->dt, m->ref))
 				return true;
 		}
+		m = prop->val.markers;
+		for_each_marker_of_type(m, REF_PATH)
+		{
+			if (m->ref) {
+				return true;
+			}
+		}
 	}
 
 	for_each_child(node, c) {
@@ -924,8 +931,8 @@ static void add_fixup_entry(struct dt_info *dti, struct node *fn,
 {
 	char *entry;
 
-	/* m->ref can only be a REF_PHANDLE, but check anyway */
-	assert(m->type == REF_PHANDLE);
+	/* m->ref can only be a REF_PHANDLE or REF_PATH, but check anyway */
+	assert(m->type == REF_PHANDLE || m->type == REF_PATH);
 
 	/* The format only permits fixups for references to label, not
 	 * references to path */
@@ -961,6 +968,14 @@ static void generate_fixups_tree_internal(struct dt_info *dti,
 			if (!refnode)
 				add_fixup_entry(dti, fn, node, prop, m);
 		}
+
+		m = prop->val.markers;
+		for_each_marker_of_type(m, REF_PATH)
+		{
+			refnode = get_node_by_ref(dt, m->ref);
+			if (!refnode)
+				add_fixup_entry(dti, fn, node, prop, m);
+		}
 	}
 
 	for_each_child(node, c)

-- 
2.47.0

