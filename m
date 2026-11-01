Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551104;
	b=sBfCKHWJq7cWv59A+ij0FgWaoIBICxkv3+JX101cgcJ+ek6il3YN11wUjEq/H5F4cjaV
	 zfRjMgyqbqmpnXVi+0mkwJzOhpkkUtHQBm8DtHajIlzH6aWQzE7yQld+2ziGlCc9u+MSl
	 LIf64F1UmYssGtDF54pIHXtA3R8CZKCVyG5fA5XfYXzAx7KYP2bo8nT6JAtWPA0VQBaIT
	 O/wZh4CjhYh5/aCAET2E4sO1leZqfAEgJr+LpBkVui4Mhs+UUenfXPMAwuSinHKmfi4uL
	 UHamuG8K+GqkknVYTnEiJWxEHtcrLS12egYiv2zCSvvsCz6JAmlUZXMJe5Jg00tJwdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R2HcBptnx+saUXC8VXSUo+mMG/KQ1mzQyziGsIpxN4E=;
	b=j487G5+CR/8unXcpnB/kMfp4odVcdgjNI7uFXhM65qmn8T0mfulkNCykyPKz5ObR4edC
	 2H768uMil7/rrRwbHSwYrQTjxYkRPo6KwUT3Gw+TAwjvMI0MYCWmHTj8gxkLsN4otsnb9
	 Eg4kyAouhbhyMhH3I8X/eObEdZKSVipE0k0GV46FdemoeZukgAgZSZxI8Hk4NxhWvSWDT
	 1NcTTx3OyCc0Z/fuVwN8qPfbNpvfUOFlGh7g27enrJHgOlULImURIa35vprVF5CvWCg4N
	 earLcXW7/b3dL5VnKZCuvYnc3+vARea1KrrJtyAQRsaOnHPjHyuHQSZD+LHOrtqLD/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RIMMo0fr;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F400606A324
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F400606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RIMMo0fr
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-825b40f8a26so1015813a34.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551103; x=1794155903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2HcBptnx+saUXC8VXSUo+mMG/KQ1mzQyziGsIpxN4E=;
        b=RIMMo0frnsJnDsoc3NJef3BrHwsxniFbD/pDVYVZmxKHL2hdiOrrnfqMoKkwx8nhCU
         JwMMIC30DtcfH+MvUQLRxb/iV1yxyISJ0GaHTuFRAhhsWM/ZffdAv1wr6mEcq6yocM+A
         wxT2hmaN74gxnXN/5eCPCM7WvDmeVR8FQci1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551103; x=1794155903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2HcBptnx+saUXC8VXSUo+mMG/KQ1mzQyziGsIpxN4E=;
        b=BaRSHkYVm4Ux18nvG9yXbQpSCcWMiidJqAu+cQQoc1vT1P8B4kOcUprqROPdO/9G9F
         NhB/AiiJVFPf/TD+nArJXjJPOtw0S33n1oqy5jcmDYUFD3wd4nlC5iPke2lUW8w0qU1u
         DhS6akESiikisglxbIUXiRM6OnRY+osB8nlc1xh+xYOi3vEwgimAI0VZPPWzHtaw5cbp
         WbbHVpMcG3Szm4+mkl5Gbw0MIQpglXMmO5Yg4W+FJ/NxxIAp6buinCs5vMKYxdtqNdH+
         EvKwgFr82wh0QQFRp8EFBJoQAg6Y+w8XVSANNd3IuQyEENX9c/lJIOWyGjPGGqAW2DCL
         sICQ==
X-Gm-Message-State: AFq9FYJg6ELUV/HKa8c02I+w54tYEh7autxK8tVO/OUBlXUdxuZpriUY
	Byo/t5YTu7WQKqPh0xKCTt4Y45eMZOerWT7+bURcw85JB+jNFHl+CTuqA/hlylrJJKktb8C5267
	sN9yLkzvQ
X-Gm-Gg: AYBFou1AV1ZzOrZtoCWsdVMoQola2tary1ZTH4l8id02ZjWrPvbdGZc0iBB1TwtaGDR
	b4wdkisBrFOju985F9y5NNWMugafEV61sUoFNgLNt50n1mdB6Rne4ZzFPEUtWrZHPaLB/dRvRdf
	q5Zuim11bN0hMSjYsoAzefldBQmTkgo5VE2w0UKD1WNLmwfKjRUX4HhFbERQyE87bi9+3lxOAqP
	1Kzh+u3NnhvvcajUlSzc60a+7Nn45HQxox0RCUKcU5OGbWucMdaGlEzqdCO35MoY7aHR3+0Y8kR
	1iy2I4Wd5iNMFZK7r86s8DR87vqTprDX1/HPKDiqSTbwpTiC+2c9QReDq/RQAB+gQ/9xlJ0OYih
	xREpsyCdJVAnFy3ibuqcPFXhWHPKYrqpNY7Ncaon48o2IDgQED2IiOexHocFjmhU+tEdUdZvE1W
	CbQ0kQnecsYEbRThuLL+FXDDGpitugZ1HbKrM/Jppl6KVY3A5PwTXNqZNqsxulNkhEpoKQGRyCQ
	IPTRs8Cib3okclxezgXygtFkZ9L0WZQoLw38HnCBu2W7POqThxm7PcgKj3j4xRsCILSUROkthQa
	nlgIZiILN+r+a7PZz5ZLye49lc/KbVjKkePCChK7WHPpaYAlV+06K/xfdO3nEz1pLvUY0Qf0d9r
	s780wXp8zMZFzoeeLbgn5uBVOSeYYNOEdKzx8QZRnSeE=
X-Received: by 2002:a05:6830:270b:b0:846:5d82:8b5f with SMTP id 46e09a7af769-85d36520798mr5679364a34.10.1793551102968;
        Sun, 01 Nov 2026 08:38:22 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:22 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 04/13] dtc: Move the /omit-if-no-ref/ handling out of the grammar
Date: Sun,  1 Nov 2026 09:36:58 -0700
Message-ID: <20261101163721.2458982-5-sjg@chromium.org>
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

The grammar action for a top-level /omit-if-no-ref/ still holds its
merge logic.

Move it into a new merge_omit_if_no_ref(), passing it a struct fragment
for the reference.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc-parser.y | 13 ++++---------
 dtc.h        |  1 +
 livetree.c   | 20 ++++++++++++++++++++
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 61301a6..089ab55 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -256,16 +256,11 @@ devicetree:
 				treesource_error = true;
 			$$ = $1;
 		}
-	| devicetree DT_OMIT_NO_REF dt_ref ';'
+	| devicetree DT_OMIT_NO_REF fragment_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (target)
-				omit_node_if_unused(target);
-			else
-				ERROR(&@3, "Label or path %s not found", $3);
-
-
+			$3->type = FRAGMENT_OMIT_IF_NO_REF;
+			if (merge_omit_if_no_ref($1, $3))
+				treesource_error = true;
 			$$ = $1;
 		}
 	;
diff --git a/dtc.h b/dtc.h
index 9f9076d..e747dc0 100644
--- a/dtc.h
+++ b/dtc.h
@@ -369,6 +369,7 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
 bool merge_delete_node(struct node *dt, struct fragment *f);
+bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index 5c9ec48..5ed2085 100644
--- a/livetree.c
+++ b/livetree.c
@@ -561,6 +561,26 @@ bool merge_delete_node(struct node *dt, struct fragment *f)
 	return false;
 }
 
+/*
+ * Mark the node which an /omit-if-no-ref/ fragment refers to, so that it is
+ * dropped if nothing refers to it
+ *
+ * Returns true if there is an error, which has been reported.
+ */
+bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	if (!target) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return true;
+	}
+	omit_node_if_unused(target);
+
+	return false;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

