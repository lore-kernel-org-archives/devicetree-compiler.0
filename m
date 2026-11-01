Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551107;
	b=QkaBUkw74wF/Hb+ssuyceQq9ZE5otVTKlNXiqpuje7xQhAyaDnRnKQ+4ITGDuI9nsTVe
	 ckyEFR/YIEFXlm+9NZB+xTH53b0J65kQcTZhaP5H+29Qp0KSdXtNXuHfpv3KsJF2gFwfr
	 1xVqrOMr56nnOz29Im/HxStTtXHpSWBLjxRV1z9ua6+J2oA8z8V4fkicC4FrBL9lv1zRc
	 gSmhKgrIQS8jJsxye28WEantyUYqescTKswjQ6hLMQaoxF3UTWqgXekQdEuWwmiRw0dt1
	 N7G/dBWPXchtT3vdrK6mFX2GpVNSodPhsE/mqiAbQumFcx2IwtqS0iMXgEKfMdNKuAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uf9ZYPcLyQxz8rLh9ungNHXN3d4XiRwNA86dt4V6ge4=;
	b=cRQD/sWbvp1YJZpaFTU1KVkz8sltiLdu3RZqxliDQ5v40LOQkrkn4Iw717lPlFHRI81C
	 G4ymIf8FF20V41C755w82pv547niogPz+U45kRD+YmThzdXscvcEbvgcGlBXgwDjnY1PZ
	 kSz4FrUPZqTJMCgDgX2L8gCsSN8pTSpOdOhwu0Fi4L2fQ0oSZwMiOlQNlmfZezOljG157
	 Fu2F2gbhcq0ZX9nr1a+4SlRNPk7KJ6pnt/DjbiQ6LtCOtoDUJBq5Ep4AuiWX7RucyGfI9
	 qiD/6JIzxO1+4iWAIhYp4cI5qXlZFiqNb7fJ84QnBrSPRYcXkF98APMB2fL7r3fehcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I5jyRzsX;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A2606A324
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E04A2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I5jyRzsX
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8439fe796ebso1676436a34.3
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551106; x=1794155906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uf9ZYPcLyQxz8rLh9ungNHXN3d4XiRwNA86dt4V6ge4=;
        b=I5jyRzsXEVGTfY0EaAXLirldl8X8feokduhBcheKD/CR3GgL4xn82wD95Ktpw7HyQW
         4FtMlRkulaiXJqsocQQmKVlhi54wBKmlUmkUul+8zlbk7IrJzC6k7xFSLpDvlyBHMED/
         HusUxEMKNTg6hwVSWcJARV9c0gWtLY9Y8Oia8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551106; x=1794155906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uf9ZYPcLyQxz8rLh9ungNHXN3d4XiRwNA86dt4V6ge4=;
        b=fjL/TiZt6rU3u6/hVsR/9ojUDkl+sz+aUYREuT9yS3RrPbAnvFqFBk9b07jk9bEWst
         FjouzJOYxtBILLJG2rlcIjCCZAEN+eq98T9Bm7PViE3lbePvpPxE7XJYgxOSuo2lAnJs
         3ZzmrBiXzjlSwCmozcbzhJJpamOn/1/T9hetI8POh4bvCZCDTdo+bliaqmmoPoJrzJlJ
         HnzJ76tQ/h0dLNmiaa+Rb0BW+rQrt5MJRTPicD/GVaP+yPxqyEpL6lXadxdkm1kEGDgg
         fyniML48YUv7AoaojycyYZ5UxU8YhbCsijA0we1CRN6lwDcL0oyeuzmxOYcWFJct6GNn
         vANQ==
X-Gm-Message-State: AFq9FYKfFGaVyIN2KRL4Pgl/FZYXeGs/mU1vFCREyveNMjNnvm9Aj025
	zPB8mLTrtjNy3htcDQYaXAqKb2Ben7NiNvFqqCeaIBevAZJ5mJ7h8WzRBadCbCGeCERY5DLrzP5
	mxeNh1yyv
X-Gm-Gg: AYBFou37UvjXHQ/+ayPO2sKMoWh/ZMENWcWFRTjqd+YlJz3wCxLk5BA6KwEULvxXV2h
	MJKinnYOlwwE4gyfK5s3rUw4E9oNFaekuYgMEx9BJf6XrthqPrj68rFcuUMWpWGD6vySy0Ydr6X
	ZzXZLVFs+xRJccyheJ2RO8s7p97oyLCYlEBWvr5+KNGO9ZMdoHAiHDt+/JYp9b5wrCSaY1+kDQL
	z52CtqigLvRXW7wI/oaCBOCnhKSVleqAK/+1BVlv6R+oKGs+L+AcErVBSOevJ54wflfg1SxNCFF
	vOtjEH02vcvRz2h9eNorAJ4snI06o9F2KRIzviNTuR5NgOU6yMVDTWhilLI5xO1YWFE9o1NpQVM
	51XuXkl8s3GUFnooTV/UepztOEER6QKRho3s2Q9QwoHReh4It+yn71CnHZNlQR2LzeQ0s2lOBhP
	ZmDApyLDiTlw7zBwVo4cDbztcCZSNlGNr9GpUls6v0cDVTbAi8gs6rB9nwHfIGnpOpg5P3CKrOq
	SvYb1eQ5aKbPd97koH+rJvPZuxvKoGe3Fe+MRn03UKA32VuavJEaIoR4Akf1oJPYYztz/0RplR3
	m9wpsJzjnAWy/AA1JQVuwHjgwFjax1KmNlxNawomUpCMYh6garLk1EU07oTFEJurYZOVe8lrjQZ
	c31o3AM+H8wnVaqyLtIG5cA==
X-Received: by 2002:a05:6830:71a5:b0:845:156f:58b1 with SMTP id 46e09a7af769-85d3661affbmr4984779a34.24.1793551105891;
        Sun, 01 Nov 2026 08:38:25 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:24 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 05/13] dtc: Move is_ref_relative() to livetree.c
Date: Sun,  1 Nov 2026 09:36:59 -0700
Message-ID: <20261101163721.2458982-6-sjg@chromium.org>
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

The remaining grammar actions which merge a fragment use
is_ref_relative() to reject a label-relative reference in a plugin.

Move it to livetree.c, so that it is available when these actions move
there too, and add a comment.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc-parser.y | 5 -----
 dtc.h        | 1 +
 livetree.c   | 6 ++++++
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 089ab55..7545895 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -24,11 +24,6 @@ extern void yyerror(char const *s);
 extern struct dt_info *parser_output;
 extern bool treesource_error;
 
-static bool is_ref_relative(const char *ref)
-{
-	return ref[0] != '/' && strchr(&ref[1], '/');
-}
-
 %}
 
 %union {
diff --git a/dtc.h b/dtc.h
index e747dc0..d145b03 100644
--- a/dtc.h
+++ b/dtc.h
@@ -368,6 +368,7 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
 				    struct srcpos *srcpos);
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
+bool is_ref_relative(const char *ref);
 bool merge_delete_node(struct node *dt, struct fragment *f);
 bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
 
diff --git a/livetree.c b/livetree.c
index 5ed2085..027682a 100644
--- a/livetree.c
+++ b/livetree.c
@@ -542,6 +542,12 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	return dti;
 }
 
+/* Check whether a reference is relative to a label, e.g. &{label/node} */
+bool is_ref_relative(const char *ref)
+{
+	return ref[0] != '/' && strchr(&ref[1], '/');
+}
+
 /*
  * Delete the node which a /delete-node/ fragment refers to
  *
-- 
2.43.0

