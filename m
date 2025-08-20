Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0772BEC5C
	for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 13:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695536; cv=none; b=ScTfyVHpTLJGx5W2mMlIrkoZECE+Eu7RVF8nFouZfO0fdiZ332R/+WzAbbbSSNSUI977c/9zQXI8QRAViUesp/4jG7/fe/A8LyeE0uEeyekWyrOsXu2KIRBKT7CEBfgJIhmtU8i27vvS355fXZBuN5za7RUYgVhVou4+hJlYfrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695536; c=relaxed/simple;
	bh=TMKj+Eo/LiEoZ71DwgRMHkcjuBSoZUIBIBYDulT/0P0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sK2QwptH2ttewQvWbacDbsHFKLfUA0J1frHJhaQFLyVYfh/xuAKzFA4hWKSeMK7YprLWaEeP9wWbJZthDAzcfnlDctI0oK3qed5q9VBqd+j9ju4j88uDuyKj1863sTNOOZYlYW+ilPZ11hJl+es0tBjp4q5vuVClLj+rmxAzviM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OujF1iw3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OujF1iw3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9d41bea3cso6570458f8f.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755695533; x=1756300333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6B4W4N1AC7XphjGoiPONapBCEyHWyaX4KyaI+mW4mbQ=;
        b=OujF1iw3K9Px+fWFa0LBWRfB9tAzgyzf3i1HaYniWXJTxRQAUD0eogBugUCaCb1S1L
         i8yidFGcwOn+p0tath4+AhirF5GM3827eSP858dY29lEg1kGYLTCqSQFuPtFsoyLKFqD
         aQaT2KZPzovgN37IX0/qAykjSZ6ngBhFACwlNQOerzYKxSCj6qhGrQDKjDiVKP+Hu7q/
         LVuEEaTtMlibyWLNIbibAr/UJYjnUGG6bBe+ZY41VBbPCqvlNU9KeFHve2clh8XEDWDD
         0pf0a9z+oW6iUlTo+PMCcWXlNzylx5QD1UDxZgog/gF1vMkTc/lQXJHt2Jz0VmiFyWY1
         I/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695533; x=1756300333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6B4W4N1AC7XphjGoiPONapBCEyHWyaX4KyaI+mW4mbQ=;
        b=gvYu94EEzXoMwgCD0i2i1KR8AQjMKwr2w42LcCScOf3vbFbW3WgO8FDB1Xw/AmzafQ
         Wx0u4Fc9z2ax7QFh2q+he8a8RYoYIke9Zf5XuxuQpDWJ9ekrXgrnh7XvyZduAT/wH7Gp
         tlctuy7taFimL3WPaqN0kH/yLtFxoQ/OywUflwUAwLYsO0Xs1OghMwLtoaHtwmKt92Tp
         jHpfTQIkb4qKo0jLgs6sO4mWQjbSy8jXCl09P/2y3vdBoGuXQgEuQmNRTYHZGdIObzTR
         ZXWb8KGREkSjvJRAm9fW8W38FNGop/mh3Dq7q9nmEkVxLxp63AUZouZF2RnIgP+bAvJw
         Xs/g==
X-Gm-Message-State: AOJu0YxCUkIU82KdVv6rDGEpwQBxWAnt18LNufg55hNIRw9oYpe0N4f0
	OIzGJjBcbtQUbB7m+/X2J9iZSDyEzGbL6U2tjkbNtQAb5wMoDQrlYmFkB1qpwyElvKZmeZi7430
	ZBp2R
X-Gm-Gg: ASbGncv9Wbmck2r5C+hpOij0kSzjFBvXq5IZ19CuDDfNWV6nT8vMENJryYwf9OpLPHw
	KZe5j5Q0qFDkVnjIDHL20Yd5uOJebsnmnQhOIRQhbQnPB+SFgVh4SEhEPFp72jYVL7VVnnADbLU
	K3gSgyRwnRSCtCNf/FYjabIgrqf4Z0yFt+AkQx/BWvVNml1SstYucFpDHltjJp0AioH9IwWcIz2
	mvoB+DGRXtsF+0lK88ub2i6zscngGH9fnkQQH9+l04spwMjVFt+C6K6o23J4H6qm2O1oEOakiXk
	yDyU/l6NZqvLbk0PJg7kxny3iNvnvyBP9f8sIiMqi8cWIRaqgU+J2pk1Y+g71UJHrowEpVEt8RD
	YMg8V+lz7/P1SJopWeVf5GDwoohlgAtVLkeN4OkQaRMnoW04WRH3YsPj758gJaADc
X-Google-Smtp-Source: AGHT+IFLJwgNRytUJu1+qzhiQ+VgY20ErOibyMzNZTclkH1qaReRla0X3E8btaaxtk3NDfXWD3e8Lg==
X-Received: by 2002:a05:6000:2307:b0:3b8:d4ad:6af0 with SMTP id ffacd0b85a97d-3c32e6fe5bamr1894303f8f.40.1755695532903;
        Wed, 20 Aug 2025 06:12:12 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b47c64984sm32406555e9.23.2025.08.20.06.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:12:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 4/6] Restore labels from __symbols__ node
Date: Wed, 20 Aug 2025 15:11:30 +0200
Message-ID: <79aef5658c9105c6d6891fcdf930e5a073a06699.1755692822.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=TMKj+Eo/LiEoZ71DwgRMHkcjuBSoZUIBIBYDulT/0P0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBopcmWbsm2O6xMHzflt4/xWeJAjGMvUk/rGDFYl bzC0iYL4aSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaKXJlgAKCRCPgPtYfRL+ Tq0cB/0cFe0Azgh9IvX+czh7OVcU6b+r4U3w4SHDuEA3BfemwvfBLF/bRquMFmX22TvaY3Torry o9tkkXE/CvzD3XCPohJn2uXkYHjxBTQesp+IoPWNiaX9sSbZOvwWEbuCpNBBGz0MYpfnjHX7YJJ Yc7FsRYr+zeqHrtW8840ytTXcD5Kq/tEzHvJmZgdWqJkc6pAHHxjDD9UcS21oOdS+gOcoQR7S3t 0ye2iwIP+E+7NJHgrQ4xd9ulKGAYK4mbQwcEV0U1MbpYTuyqfEkW1qnfMgG1FnPjumvAA0ytzvY 6P9wO9fvGSvEw0pwFoJvxlsFgXcFdM8QLfRD8DMix8YSCOPY
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

If the input has a __symbols__ node, restore the named labels for the
respective nodes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 dtc.c      |  2 ++
 dtc.h      |  1 +
 livetree.c | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/dtc.c b/dtc.c
index b3445b7d6473..63a6c85da5cf 100644
--- a/dtc.c
+++ b/dtc.c
@@ -338,6 +338,8 @@ int main(int argc, char *argv[])
 	if (auto_label_aliases)
 		generate_label_tree(dti, "aliases", false);
 
+	generate_labels_from_tree(dti, "__symbols__");
+
 	if (generate_symbols)
 		generate_label_tree(dti, "__symbols__", true);
 
diff --git a/dtc.h b/dtc.h
index 3a220b9afc99..f97f3c29e2d4 100644
--- a/dtc.h
+++ b/dtc.h
@@ -339,6 +339,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys);
 void sort_tree(struct dt_info *dti);
+void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
 void generate_fixups_tree(struct dt_info *dti, const char *name);
 void generate_local_fixups_tree(struct dt_info *dti, const char *name);
diff --git a/livetree.c b/livetree.c
index f328824c3bc6..8aafc9aa5cd6 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1112,6 +1112,27 @@ static int generate_local_fixups_tree_internal(struct dt_info *dti,
 	return ret;
 }
 
+void generate_labels_from_tree(struct dt_info *dti, const char *name)
+{
+	struct node *an;
+	struct property *p;
+
+	an = get_subnode(dti->dt, name);
+	if (!an)
+		return;
+
+	for_each_property(an, p) {
+		struct node *labeled_node;
+
+		labeled_node = get_node_by_path(dti->dt, p->val.val);
+		if (labeled_node)
+			add_label(&labeled_node->labels, p->name);
+		else if (quiet < 1)
+			fprintf(stderr, "Warning: Path %s referenced in property %s/%s missing",
+				p->val.val, name, p->name);
+	}
+}
+
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
 {
 	if (!any_label_tree(dti, dti->dt))
-- 
2.50.1

