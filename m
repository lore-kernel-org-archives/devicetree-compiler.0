Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551101;
	b=pQyzCQzc0up+N9QkcUNYjIanp0O62iTipuN2RtqVHylsBH6d21kgztsQfhUfOnpBec8Q
	 PPZFOOr0Ukzcu3QYcq86vLsmtY9OXCcJsLsxnyDdy0CBL4YrYbzIjJGexUFYh8Kma3ixu
	 ZNp5+IWSY2eZOWkFYdv+nhK37Dswop7/rLltYvGCgDFFiSGn9YXQ0sLyKpmCWO5sNuh+r
	 CACZH1BMcULHuJPRKLuz8ktsiX7SELdHywLt7VlfPCc7zsXmx7sn8n9EOsiQSrE1nDypN
	 wqurJ7keFQliYcRUZiZbZGkX5zXA6zDczCGK+KeHUfGWTHBjF4UIaoEPQoiFCfVvTIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vfY341Wou9m4SxFrgXE2HS/6wchrpQIUKD6E/ixRiSc=;
	b=nAohpa2MopoMohoC8ZFZ0HapLnHgvh9+MDCjjIo5URLWHFUxXMNH8Cn3CpS9cwt+ipok
	 ek1SkItHCeIZrTvK1D50clJAmvRDXTOgY2a3+1y6aNpLK09PPuwuqqZ116tUpklT0xwKY
	 0UzRLYiaEdsECAzDflb1faRBir+wZ61le/XScJYQvX20BuvdxGOIEY2hny5lxqemq0npd
	 YL2ZP6yCkN+1M9bfeZM+R0QAlPKInBOFXyCawufA6NF7nSfO+kuYh7yg12sYME9IuH9Wp
	 Yer2F0Z1969UTywO1r+JF7bWkxGEHkZnJ1aeyaI360ezx+YP2W6BHuxG8ggbyW4dmXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DoGJ43iD;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43419606A324
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43419606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DoGJ43iD
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-84a248254f4so1660625a34.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551100; x=1794155900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfY341Wou9m4SxFrgXE2HS/6wchrpQIUKD6E/ixRiSc=;
        b=DoGJ43iDNtr+2s8M1GH4H8yEWFjfpz0cbRqCacOjg1s9fJ3p2dI88OkXTShc2JTsld
         EfPq3XxmVikqtHeBzgGt/SVv1hC5GWsKm8oo7oYtWfr9spY6Kcvk3YpA1+Y5+ewdW0tE
         nx3v1NV+eJ48ryyWj0erdApFCk6wT1fN/CP7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551100; x=1794155900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfY341Wou9m4SxFrgXE2HS/6wchrpQIUKD6E/ixRiSc=;
        b=ZrNMQh/pDwU87ggf4S/ecQPcgZVhMzAu7kszM+Y+e+y64EwiawY9WQWl6z8c8T/XBi
         xDUiEMC2EeD7+9fkBo/aivIFakoPwXBkEDMXwCLCY8c6aeheVbz92vBIJ6TDPTJtxuzx
         0BpPl94zb9/45YgRbeFQVCuS22IkEbF6I42yTnfkQyJTgVfuX6ve7fojWz0IaCrWa4qv
         TAzn/Pi+YrHgv+aOJMgM69FLX/g7+/cOxA8X3pfu/Y1Th4Lw9ZpM0c+NYXOWaLNjXAGS
         jrEoO8A3ihf/c4Tx/5v+HBjVLksQBaF9Wq3nX4J0C3hQ8b4Quf5FbyGxHbm+qtDsAi7J
         NxTA==
X-Gm-Message-State: AFq9FYKjjakp7ww7PQkd9C+Ft+3EBu+zeIa6tB8dmjClMiLjeRYtKGS6
	LP7Od9ja7atHECWRdNgT3oD91nPDeTogpFO5O6nRA6eNN7V7tLyNBgPweFMlDvXdMd0irFicemw
	NwSScFMXN
X-Gm-Gg: AYBFou2fn0wzQedEAwUuXEDfZRdjALyfcQQHDuhJdZ3tp6atIo1kDx4hgty6rp+fHGy
	W9yQRxeRMtacjuvE4keCU1M8JE1Lkmlsu967TRmaKgKPLEk2h62CQKGIdfH1AEEsbkkC7QlMPwS
	EoCogzd5g8S3R3+IijLMHAZFHVPHJ942bMuc0iie78ZvMp/8M/HQkBPH2BA1kk6W7Skr1ebBwQb
	yeUDu+FeXm6eBwWGWSDmrnLSU6QKX6KTFBf24BFMPCr+LHf/KD7dM5n3KSpqI3cEjDIBsq9WnCa
	cZmG/9UMN6E8FdS0cukYtVNdo8oWECaekLhKG1427RmIFur36REgqVGJUiVW3XkyFZCPCi4V2Ba
	+48qdrTasT5FPgQ2tC72RRxMh7111Um1ST4yOY/tatolG3iLUTFEjDqDq3TapBcDEzvSUHxzrGe
	WzO8wqzYP9nKg/szc3kmRSxd6SkFT/SPFadW5LjFbcd1T9qB2STnz2EHixQzhYLYs7SQ10CeHip
	vECaAiRzWyGWdiRHK+NEDeSC2U29OfIq25csmuP22clFtWOnnQAlnGRDbB01Z3KOIJx3oBYf1iN
	g2aZQ8ydYd5FaCM6Gv9Awh7dyrJqQ1LXXRMwpiGociSAr3AR6Nq4GjafWXIKZGjP9xnwbwmrHTs
	Cv6I6kJqyyyvMdUsZq6vTwVJc3rI6Tn2I9T8U7W30SgM=
X-Received: by 2002:a05:6830:2b0d:b0:80c:d34f:5f61 with SMTP id 46e09a7af769-85d36484c70mr5375508a34.26.1793551100309;
        Sun, 01 Nov 2026 08:38:20 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:18 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 03/13] dtc: Move the /delete-node/ handling out of the grammar
Date: Sun,  1 Nov 2026 09:36:57 -0700
Message-ID: <20261101163721.2458982-4-sjg@chromium.org>
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

The grammar actions merge each top-level fragment of a dts file into the
tree as it is parsed, so the merge logic is spread over the rules for
each kind of fragment. This makes it hard to follow and to change.

As a first step towards moving this logic into livetree.c, move the
action for a top-level /delete-node/ into a new merge_delete_node(),
passing it a struct fragment for the reference. Add a fragment_ref rule
to build this.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc-parser.y | 26 +++++++++++++++++---------
 dtc.h        |  1 +
 livetree.c   | 19 +++++++++++++++++++
 3 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index e47f80d..61301a6 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -47,6 +47,7 @@ static bool is_ref_relative(const char *ref)
 	struct node *node;
 	struct node *nodelist;
 	struct reserve_info *re;
+	struct fragment *fragment;
 	uint64_t integer;
 	unsigned int flags;
 }
@@ -80,6 +81,7 @@ static bool is_ref_relative(const char *ref)
 %type <prop> propdef
 %type <proplist> proplist
 %type <labelref> dt_ref
+%type <fragment> fragment_ref
 
 %type <node> devicetree
 %type <node> nodedef
@@ -157,6 +159,17 @@ memreserve:
 
 dt_ref: DT_LABEL_REF | DT_PATH_REF;
 
+fragment_ref:
+	  DT_LABEL_REF
+		{
+			$$ = build_fragment_ref($1, false, &@$);
+		}
+	| DT_PATH_REF
+		{
+			$$ = build_fragment_ref($1, true, &@$);
+		}
+	;
+
 devicetree:
 	  '/' nodedef
 		{
@@ -236,16 +249,11 @@ devicetree:
 			}
 			$$ = $1;
 		}
-	| devicetree DT_DEL_NODE dt_ref ';'
+	| devicetree DT_DEL_NODE fragment_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (target)
-				delete_node(target);
-			else
-				ERROR(&@3, "Label or path %s not found", $3);
-
-
+			$3->type = FRAGMENT_DELETE_NODE;
+			if (merge_delete_node($1, $3))
+				treesource_error = true;
 			$$ = $1;
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
diff --git a/dtc.h b/dtc.h
index c0d8e8f..9f9076d 100644
--- a/dtc.h
+++ b/dtc.h
@@ -368,6 +368,7 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
 				    struct srcpos *srcpos);
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
+bool merge_delete_node(struct node *dt, struct fragment *f);
 
 struct dt_info {
 	unsigned int dtsflags;
diff --git a/livetree.c b/livetree.c
index 982f0a6..5c9ec48 100644
--- a/livetree.c
+++ b/livetree.c
@@ -542,6 +542,25 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	return dti;
 }
 
+/*
+ * Delete the node which a /delete-node/ fragment refers to
+ *
+ * Returns true if there is an error, which has been reported.
+ */
+bool merge_delete_node(struct node *dt, struct fragment *f)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+
+	if (!target) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return true;
+	}
+	delete_node(target);
+
+	return false;
+}
+
 /*
  * Tree accessor functions
  */
-- 
2.43.0

