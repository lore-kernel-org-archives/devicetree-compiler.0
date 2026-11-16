Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873527;
	b=CLtiQbDvSByGrWhFZ3uIcy8lbtEKc7cGeeMkSpaEpgMjogw2EHyS7fpzVFv/f4rkPEjk
	 bsb/3/8oiJOu9SrGI/Uf8rjlLrtNZ/W6g8vFoHmCXW4kIim3xmhxdyM+suF2ckcG5mf9Z
	 3XoAYhz60r4629blaSz37b1nWt0oGaYwTTu+NnnZJYsNr3Iat3WohcSCUWGfoOxM7gKQI
	 Ti+xqxeyMqhk2R6+O7/P0ITmO+D5UaayJfan5eaeWj44hcDQRpclkHdEDYrxLlLylmsJ5
	 cU/eTXr2gkeb4dr1KUDGHYoqvUUQoN95gCDmstj8VNyY/vuMsEkbvMBGVHt+LjeaLEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hUwLYfA7HsaNV1LD3KrwgNBYqgx+JsqybBKm7hipxQs=;
	b=bz36mTRtKR4xLlZ++FVdoraPzs75gK1c1KTKEt3wNn17TDvUoufIhYtOUqufXIQdDdSe
	 z+/QkSV6VExKAsZuzsVFb6UraxAQteuuxu6iHYUjCgOtC6Xp15WMSAueq6T4GLc6nqFiq
	 r0ZotSg20sHbcnnLlRkVLO7gNKk5CBROD5gFwOo/VETH8kEc3oyP6O3WmFckdq2oJlZq3
	 CpsPikjHop9bKT6DJAhruyIQayZ3UZqQsUxM3h8SnyoVtfWRbWbGjjaP2ziOQ+M0+gNW1
	 iGzV6T2frTtXgguzn21s7Um8P+5RY7j2Vqv9qUJUG+iOo07P9/en47wDdpe0qjhuYLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Gm2QQMXB;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37914606A323
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37914606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Gm2QQMXB
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-862bb0a189aso693581a34.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873526; x=1795478326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUwLYfA7HsaNV1LD3KrwgNBYqgx+JsqybBKm7hipxQs=;
        b=Gm2QQMXBdsJ3dIVLQrOtcYVPnq7ZdAJxACQPvFzSes66pVomQ2JHLi0R0wHxVK4EYD
         x6o+oJkzWmpUb1XlTKb4HTERyVPLF1HeIk34ybg+1Vy17hOvBSJw3I0f6l0qGcAbe0rY
         C9prOYA9CMYFo3ir/1CWPXYI+sCiM8P7a2E/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873526; x=1795478326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUwLYfA7HsaNV1LD3KrwgNBYqgx+JsqybBKm7hipxQs=;
        b=I03ruJw0Tot0wX9Aaelx7Bxf8bzwRPGb7Jg2sfJQKOGWaL3Ix2z/ViPHvgrOh/4C6u
         8XOdOvY+2Y+96Ju4mxQkq90A4nyUCLHHubd2hTvZaIOZW0UyEhlLKzDoGU5r8pitF7/C
         ScindsXL7aiLOPFs4rtGARLHiET94iwMaaL4K+dBbNsLRv3mOcPJZQO0TFvYmOQ6mwo9
         TyCIVRhwTw+m8w1htS/eLA7zZ/0O+HvjTBrj9Kq5hbhXYUZhLmu0DeivAUkuhVnPGZ9x
         vwb+Pvw8s8rtzeHHrex8S2J5i7qYEen6BoROYwnWSvXoDgnsj+6NpFrYjSiGNHm/neqq
         5P9A==
X-Gm-Message-State: APuU4Z+8YVwCDA37VEs9NX4DFdlFScF/KvST29sS2KTpy/6EuFYsd5d4
	izIrf9qhVVJgUEyNcvjrWAJcTgHTpeiVNr+V0ZiCJ7LjVR7ed+vPi2iiGGtNeKbMbNX3ghj8r6Z
	cD/2lEQ==
X-Gm-Gg: AYBFou2cp+R/le+QZQ5lh47UYotTM1iET6JtNfC9CKiLByNy0HXCQBQG0wrDEh1oh12
	ynbpjmBcBGSdkMEbNYSSQU2FXif/2nmZQxxmTy3iZJTvfGI1017BgayzBC0FdOUtMT2CWesbv3c
	e1hnHX20Z09N0doMorKTkAVHI1WS7S2uuGVHUOLlodV+8TH9mVvTpUncZCOAsckLjTAM2+D/B1m
	MykM3mptqp/9IqOkCx36RfsDQKF1ukBOo2mZGuaTqwD89pFY+5uCdyIjXRvpjU/9lXMpyGWC+UU
	TDOaVK9senxVGJ+QupdpfDeQLFz/cWI4oP+9xis2zGQTGtbYxrZrYPN/Ogn02OAvwILruh19k3R
	27K8HhIvMcNtxOCaPO9MMVnoa1rR/f8C8XDwuEFyMPv6sVunNaELSVkcQeLL3n+wFnMyJHRMWQB
	x5/jUARNhie1pGpzle6wQW7hxu607Hy1F90IXLvMzAqvJ/gKQE4OG2bZMKpdXKO8j/DJGrhTDJ7
	Zh96NdU/Q89HmAxddxPowOrIy8p5QZmlf0VCm6SIwsiW3hA92Bgor9yEELJUDHNg6VdNaT6mfeY
	UsQkuvmBwDfPIk83RrBukure3y4veczW1+A2nHZ/Zb1HKrbFyGo9NyzO19BSGhbvUqUrfjjKaP6
	zF1Tdvf/T9y3fKkx3GWfxIlV/YKmM/sgEC7vWLez/v8s=
X-Received: by 2002:a05:6830:440d:b0:81f:138e:77a0 with SMTP id 46e09a7af769-86289945175mr11430987a34.24.1794873526183;
        Mon, 16 Nov 2026 15:58:46 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:45 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 06/10] dtc: Move label-reference handling out of the grammar
Date: Mon, 16 Nov 2026 16:58:00 -0700
Message-ID: <20261116235813.935070-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116235813.935070-1-sjg@chromium.org>
References: <20261116235813.935070-1-sjg@chromium.org>
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---

Changes in v4:
- Free the fragment after merging it

Changes in v2:
- Build the fragment in one step, with build_fragment_ref()
- Check the fragment type with assert()
- Rename merge_label_ref() to merge_ref()
- Return true on success from merge_ref()

 dtc-parser.y | 24 ++++++++++--------------
 dtc.h        |  1 +
 livetree.c   | 26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 9e8091a..2d4dcb6 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -215,21 +215,17 @@ devicetree:
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
+			f = build_fragment_ref(NULL, $2, &@2, $3);
+			/*
+			 * We rely on the rule being always:
+			 *   versioninfo plugindecl memreserves devicetree
+			 * so $-1 is what we want (plugindecl)
+			 */
+			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
+			free_fragment(f);
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
diff --git a/dtc.h b/dtc.h
index b236229..c5b8aee 100644
--- a/dtc.h
+++ b/dtc.h
@@ -352,6 +352,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
 					       struct srcpos *ref_srcpos);
 void free_fragment(struct fragment *f);
 bool is_ref_relative(const char *ref);
+bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
 bool merge_delete_node(struct node *dt, struct fragment *f);
 bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
 
diff --git a/livetree.c b/livetree.c
index 388a2de..2ed57ae 100644
--- a/livetree.c
+++ b/livetree.c
@@ -540,6 +540,32 @@ bool is_ref_relative(const char *ref)
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

