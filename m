Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827115;
	b=P12+QEOA6kxU8twtPdlRTjhfnZf0enzch8CB8LJKtREskCLBqSIJ3lP2jZCdLOYX+z/X
	 3d2zE+0Vtyyb0YjwAvhE4hdoepEzTgQHBvi1LKj3X8cm86QqCnzIbzx/YEuiVqRU+EGnr
	 +dPr3J4o2J/au1qUCe7CXeg73DpWWPTPVNJYP7xVwKZdj5ZDDRN3MfkKeZVZy39my0dFA
	 wB7CH0Glp6uCHUJl6jkb2HBqm8qExPvIGCCVpv9FZHxfdL2s13nCgXxLLjVz+Usgw84Ps
	 U2ToCEzCSOJ3M9nz17KvgU2IR+8CIW0PV4I6ogr3NcbEt6D0ZLAuFgAYCKAS+h3N3ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eABjQ6HG0ffhelhvOMQ3O66/BYefzTpUHF7h9nrtM70=;
	b=AJZDRU3U3RMM87PWFQt/ArYqVaIAjLLln5CLzCj2j2ULJJJ9XTamoli5zDnvOlbra+Oi
	 KGk0WcFq6uKp9+9rguRYGwvnatUOTFB/cLM/EgKHbC/47D1Id/9jOEL3khgNhDm42Vmqz
	 CV8R95RacC2FZWx3lX2okUD9Fet7X4RdRcLjBlTnoFcUk0J0gvJIEUK+aPrxh4mgq3qaM
	 ceBOV7vJwgNKTvdeHyinjOAG7ZTy2JLBGJJGwFq0hvs9nyoO2SI+KysVSen2VC4DCTSX4
	 YFu6RqOJmYPSb90Dz23GUQzNiN0bMw7aIHT298SAVsrlHVhFAdRz+ezZ9+a6q9T0XKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OseoIEKz;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9F2606A877
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9F2606A877
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OseoIEKz
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4877837890fso637044fac.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827113; x=1794431913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eABjQ6HG0ffhelhvOMQ3O66/BYefzTpUHF7h9nrtM70=;
        b=OseoIEKzq+MupMMz5GrEyJRcDnxWDVQlCsyD84LoAkO9DdQDo6ZwFy7NuVrzhpzY2m
         S/rc9b05/c6kaMfm8WMN01Xkd5kgDs9SVHrNqz7anEc2esBOt3Y+UPsFKIT/jpfD/gSs
         +9mLHVGwTxoxMmy6FvhbLO9L2XHgg3bWOuOY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827113; x=1794431913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eABjQ6HG0ffhelhvOMQ3O66/BYefzTpUHF7h9nrtM70=;
        b=dFP3GzVcnnE4giKxEDN7uOtp74E6VPp453LSNP9nv3RomEkmhaoJrRESzzmB5uUBS/
         KbUqqzCG4pDTV2FJbCmwTQWcDk68cD7hMzdSnTgCSKJNhC0dsxalZStQ+WOIJXUkoIZF
         /UOnuc/pGdLefJjUdcOcEDfAjN+kY0YNB/0YV27oQ46gXP1HTkGElDfgQhNl9Ri767oq
         n0RW20wnj23RFT4z9w4mihwOSp/iJbgBdwXZ4+nYrDbDOzK7Cs409bIlsqnDyFpafxIO
         RQmlE05z06YsRkJgaR59u4CSnhy4VUZ3lWLl6/0ThpSPeVAvkTdk3Sw8yuxQhN/IbY6F
         8hnQ==
X-Gm-Message-State: APuU4Z+C0q8GY0CnTO5xaMerTNZECEfQ9vHbSSdrWyDhW6hXDxf0mpJL
	hXIZgoR0lWHdA9IcbxAcdF9UzGUJZeTt4Fzuims6yfN06x8tX0k+gzXyR4fxCxOZVlxLgiudwWy
	3DHaJgQ==
X-Gm-Gg: AYBFou2vrCktUVXo/VT+6tTSZM/2rWmDAP48H2L1xaoJPSh4YpUVWv32hiE++KAhKau
	TxbHHr+R6oqx2t8rOFa/VZz9+Ki5rlI52CZVV3nxqq5R4CwTL5HOqBF9UREUZsKeaU1/bdw+0y0
	hcL6h4fDXkWUWByr0VEFknn/S0yV7ig/lRY8m5ptwdgtc+D3sVtP/yG1FWwEDSLkTKEx55+g3m3
	1Zpx/dARAid8URlToCgLpcuyOPs74q+3bM6sjx4dE23KnSVrdFVmLOn5RuoogUAPkmhbqI1P3x0
	3fSZIkufpb1sG9wR7HIIE0fJGaZn3yFLr0IhEP4kDdB3F9HG7tHTxIJAZTwA6vLKb+PHiZeJ6Q8
	Ea5c2rT2jr6YqPs5mjIVOyIJ/DoA8LEWJEVAm4gf2zm+Sva28c1Pwqi9FcUBS3otQzRPk4Tqsu3
	Yh+HfJDTLBByigfV9B82XBMWdB7tey5RF0O7Dg7rG1Fmc5Ptp6RvYBL89uEKhzAG+hW3LL7Shka
	rUSazaywnOLH6aNpDEEHLN4RaE3Vwc/xSml7ChfUm2f36nMYDOaybazDoYdgcCkYlVKHPtB0zqG
	NGbm883lJQhndv35FYrOCWXR6M8eBapuIcZn7T3whqpmflsgdxEuhf6Z0vd/E8OmROCQrgqiKjj
	Q3sj2y3bLANeHZFnA+e42+w==
X-Received: by 2002:a05:6870:ec9e:b0:49e:5d89:be9a with SMTP id 586e51a60fabf-4a907834ad8mr12785382fac.58.1793827113570;
        Wed, 04 Nov 2026 13:18:33 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:32 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 04/15] dtc: Move the /delete-node/ handling out of the grammar
Date: Wed,  4 Nov 2026 14:17:43 -0700
Message-ID: <20261104211807.972610-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104211807.972610-1-sjg@chromium.org>
References: <20261104211807.972610-1-sjg@chromium.org>
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

The grammar actions merge each top-level fragment of a dts file into the
tree as it is parsed, so the merge logic is spread over the rules for
each kind of fragment. This makes it hard to follow and to change.

As a first step towards moving this logic into livetree.c, move the
action for a top-level /delete-node/ into a new merge_delete_node(),
passing it a struct fragment for the reference.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Use dt_ref instead of fragment_ref
- Return true on success from merge_delete_node()
- Check the fragment type with assert()

 dtc-parser.y | 11 ++++-------
 dtc.h        |  1 +
 livetree.c   | 20 ++++++++++++++++++++
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index e47f80d..bba98b6 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -238,14 +238,11 @@ devicetree:
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (target)
-				delete_node(target);
-			else
-				ERROR(&@3, "Label or path %s not found", $3);
-
+			struct fragment *f;
 
+			f = build_fragment_delete_node($3, &@3);
+			if (!merge_delete_node($1, f))
+				treesource_error = true;
 			$$ = $1;
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
diff --git a/dtc.h b/dtc.h
index f15a162..5dca8bc 100644
--- a/dtc.h
+++ b/dtc.h
@@ -372,6 +372,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
 					       struct srcpos *ref_srcpos);
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
+bool merge_delete_node(struct node *dt, struct fragment *f);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index 85725d3..35beee0 100644
--- a/livetree.c
+++ b/livetree.c
@@ -567,6 +567,26 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	return dti;
 }
 
+/*
+ * Delete the node which a /delete-node/ fragment refers to
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_delete_node(struct node *dt, struct fragment *f)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	assert(f->type == FRAGMENT_DELETE_NODE);
+	if (!target) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return false;
+	}
+	delete_node(target);
+
+	return true;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

