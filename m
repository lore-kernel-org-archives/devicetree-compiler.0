Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994795;
	b=a81NqecSzwlhMgncqGFdwcbdDuOyXsBOlRC0TCt9Ei3yOAh6v62IzAVMtx7uD4G3BL7a
	 uRaPQnlMtXvqYErt2ezrkKk/SreeL3b+vM898CaJ1b1qHgVvSAdyurySxNJMKcEeH4PBh
	 DADC9XBM4LoL0Zaw73nfgEmb4jb+Hvcf+zIiJdmqi0UmMneqvyxhS0dyQNmYki40EcBh2
	 PrFYmbaKawilDvOCDB4Q+pTA2M3Rh42OoO/Yua2iHrrQ51T3XEcTY5QpMD9/G/YULWEqU
	 0MWU2/VzpVNmjH43G2dyETDM+6FOWtHMBxIBnJWmGcswH0gdYyYyFodWDjk05ARxyAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jgOrmpvMxHm2NinNvr2jDLEGCEnNijPiiaNrNYacr6s=;
	b=B/xdzyPFz1Am0ZDFT8719hMwikOUFqNlK9TlMdK8WmVkHu/+IeefDibDfSSW8/1I3YTm
	 KsHPhdJq8+RQaqCILpa0Aa6ZxUJNFNlWTXV9siJlUwScC5hHUnNZbKxgKMrYwzQRDwn1A
	 h9WoE0gTmI1yssZvoCE/ba4tYL+euPuzZwraekI8811q2tuMUzElrcZQPKg2ghemeqKMk
	 Kekd+RgBMp/SkvjvKucWoxiUT131WpxSuphtWwg0CORmVAOCZCJVwtFexhdMI5tF/9QA5
	 PlbCwQdFOx15PW/dCmqBi35h1CivbWHu+QBvdYfrvk82BKAu55DR59pp8zQNTDhRs8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g6SedUpY;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A65E606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A65E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=g6SedUpY
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-705cb6cedd5so2276eaf.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994794; x=1794599594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgOrmpvMxHm2NinNvr2jDLEGCEnNijPiiaNrNYacr6s=;
        b=g6SedUpYCagQqbDzjiP//k3XMk0ec4UaOrmnc46CZEcYQTsF9Xxa4y25ywFa+SAR6d
         5AiNFydZFsi/YgDlfmmoi2Usxu484APeIv0jvjxZegT2HpDcoEbwFStLCTpk1Tl8cT0d
         kOHyrrpB9usKBw+2prWs/im/QwL+Dx1cHW8TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994794; x=1794599594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgOrmpvMxHm2NinNvr2jDLEGCEnNijPiiaNrNYacr6s=;
        b=Q4IPczcDUwWqZXUeIRvG9Df+1r7GvoeNDTFkkTKX6DgfQvFdKEUDmT3lZvZ9UT9Kr6
         XZnN+gDJSgwRv9mMAGlw6Y2hLC88aY0h6TySUSyTkErNUvWsSP8N3S9wLWiGgbX6O3X0
         RF5dfVTqCb5FaQxHgFXdJdTm1n1W3o1HjTmjw4/fh71MXzLGAS3NJ803J/Lrq8aSYZdh
         L75HI1g25fe8+Hpio1UrwjS7yRXOH6lTIltroloVl8A6DaknoqoGqHir+HeTVZ7Xbglq
         g0UEtiCpYzQYMCr/HFVfxRIcTwZROfEx6RoU5YQ+73xFe++f98bymAb6F+b12kcokJxD
         1Jpg==
X-Gm-Message-State: APuU4Z9ky/toJkYSJIfM+md6beTrMCxSoQMcbvHDl/P5Z37PX0RjI5rI
	ytImo7M48d+FnTVp2DCKa9LzvzTgzbsX3/BkdQeULUbz957FgFOBSYOJ721wx+vrtbaZq+SZW8L
	0Vl3keg==
X-Gm-Gg: AYBFou2ZuqHD51+NTuycnrRmFs7QBrRoN/icx2nbYp41mCvg4SaaXAhHANbAf5sma8/
	s/GIALkh9Pk0glMNHnwwKMTiwrArtthxy0CP0RoMUI3j3A8O8gTP7rwjbTODJRoD0BtcN8jG5SP
	7+w82u58oboxAPN5rLqLKMbOg9cK3BIqkFS1yiSbMuwhk0ucYqZJPRhXYOeP7f2/7OiIr2NfA2X
	1kU+18PbaYZtZiv5q680aiRmlmTu1VsrarPydapqMPb/L6djaT4Gog/RVuC+xsvIXPx53y431Ab
	uCzMYdHHCAaqFvgipBPG73yrYqUDRO/YFUOgiXk9CuS5Q59W8eLHrw9+7WyTtmWyRl1h86VIiA0
	PRCh0r8D4KhYl2TLIkdQaRWICg7t6Uk7MeZo/PaZTZhcnEY2idtM4186F+ZsvBumZVLcYONSMXJ
	+QhGver0QbgvBCtRrQZiOxIZWzvJRe3VfQG2WHAnaHK2TOl6h1SbdrQavYyjzDqInBg6wS1W1jh
	/WlRBLH/CkIhtjYGhG84SD6TX6Rtp7buQLsUUCLj7WgokqMa+ImgQkUN+qQ7lizCL6PsMhnQPwQ
	NpSKx5w9sQBLbAsfHNiMJKJoU0Pe4CdC4WjhUn+lrij36uT1gGEMemKUkt0sx7SsSI/ZVq/vuPL
	GJag1eVGDwc+uabEZW0U4w/2QphsLlTVOkZWjRxILqw==
X-Received: by 2002:a05:6820:2916:b0:715:453:c6af with SMTP id 006d021491bc7-717009e36a3mr13248eaf.3.1793994794402;
        Fri, 06 Nov 2026 11:53:14 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:12 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 05/18] dtc: Move the /omit-if-no-ref/ handling out of the grammar
Date: Fri,  6 Nov 2026 12:51:32 -0700
Message-ID: <20261106195159.2623314-6-sjg@chromium.org>
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

The grammar action for a top-level /omit-if-no-ref/ still holds its
merge logic.

Move it into a new merge_omit_if_no_ref(), passing it a struct fragment
for the reference.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- Use dt_ref instead of fragment_ref
- Return true on success from merge_omit_if_no_ref()
- Check the fragment type with assert()

 dtc-parser.y | 11 ++++-------
 dtc.h        |  1 +
 livetree.c   | 21 +++++++++++++++++++++
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index bba98b6..1aaff42 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -247,14 +247,11 @@ devicetree:
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (target)
-				omit_node_if_unused(target);
-			else
-				ERROR(&@3, "Label or path %s not found", $3);
-
+			struct fragment *f;
 
+			f = build_fragment_omit_if_no_ref($3, &@3);
+			if (!merge_omit_if_no_ref($1, f))
+				treesource_error = true;
 			$$ = $1;
 		}
 	;
diff --git a/dtc.h b/dtc.h
index 5dca8bc..22a050a 100644
--- a/dtc.h
+++ b/dtc.h
@@ -373,6 +373,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
 bool merge_delete_node(struct node *dt, struct fragment *f);
+bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index 35beee0..a54009c 100644
--- a/livetree.c
+++ b/livetree.c
@@ -587,6 +587,27 @@ bool merge_delete_node(struct node *dt, struct fragment *f)
 	return true;
 }
 
+/*
+ * Mark the node which an /omit-if-no-ref/ fragment refers to, so that it is
+ * dropped if nothing refers to it
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	assert(f->type == FRAGMENT_OMIT_IF_NO_REF);
+	if (!target) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return false;
+	}
+	omit_node_if_unused(target);
+
+	return true;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

