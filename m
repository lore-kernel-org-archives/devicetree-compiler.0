Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551115;
	b=PCpfmDQLzecuETJ3klXLFEaXPWzF9NicCAuF8rEVFbu7mtjgRXHTsVROex4umoD+eDYE
	 217BePiL5/kWD+KaI5jhCyvEUf9deqRo78pmWPoHiaPKV6hEE3DbE2blMR53sCe9uKJaV
	 82OGpHk+25Pozqpz0sebtbjatcDgCVtb829Acj9vkvThISZNS1h/P8xlPMoXvIV5wOY8/
	 yFu57VbsltRmEb1Rkqj/jqtsJjMs2NCS8nLo52S8qi0qajk8zt478O7eDTDvUio4uh73k
	 UHbPmWHzB4mHJKtivsX7+Xik/lv6TAFxgWkEtRa0pTFBuzrLcCmiVs1yUfciRgf5IYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XIg7CgGe8C3wLVXUxKogFLXgv47VAqB1jCHIvF5A4fE=;
	b=GA/3NHFPGbGHTgMnmWmJeCTGDYHYppqTbIXi7Fnz1qyoP4c2f5I1PW2eBQHHX4U8aq3y
	 lT2M2Ptvhxj5pTkxfIhq7LuQyYMXXhixMS0xVjwTza5T8tFYaI256FC8yXMidGu3Fp0QP
	 hB9AxYMRgHl2lZgX9wOdQy05YZnXHDCjVsaJbl6QYJDft8YTn6YBstY1xl2AtsdsoTLvs
	 sZK+BkhrXKQ3UvS9PNf60fJ/bNSBR8vKD5YVGwevZdFKQyk0fAbeZjh0LYOUrt9ie3Kic
	 LtuH2H5tiTohhfHg+PlgW69lARJiGGSWv1ZNwXdVpQNvar0TKLmF9lhbCsd80o07upA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VtZAsY7i;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37702606A32C
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37702606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VtZAsY7i
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8446af403b5so1498706a34.2
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551114; x=1794155914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIg7CgGe8C3wLVXUxKogFLXgv47VAqB1jCHIvF5A4fE=;
        b=VtZAsY7iYGVPmtsaSK5t6rzxlqfjbDSv2D9L77Me4xxJxV/48W0CvsbXMSAh0VmXnE
         IPAWtlJQPelNl5IpPvPG4SBhyFHewe5Pgjt9k94rmfeqsk/akn1qyzxMoA9VZLR5Erxo
         l628PgEBfG4Fd/goE1FQSxGwQSX3Hrz03Cmk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551114; x=1794155914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIg7CgGe8C3wLVXUxKogFLXgv47VAqB1jCHIvF5A4fE=;
        b=qLu+eiQHArQnMsA/s32rM++LIlOgUFIeJTl2cNTJ32rRqN5VjO2AErxmZ/1WDVp1v8
         1lo6MUzuDazzdZ5OjjcRvmSbCEONWBi//aYxTtw2xAsbatgZGc6M+3jZmdNlsD4R6roo
         LC6GpwGkr8lgrYjC3jMJcQf8HD4x0s92WLvQUhjvfriF8j3ryGWmMlhnPybULtdg48gS
         F+j+0zmO24mSZFWyK+5L8hog6p5hoL1+ttADVdTJGEZOjO1guf/pSnYTgcOx57QzCf93
         xgTPzXBbe+8rZpD/Nl6qOFYeKDw+KW9hZkZRnjzZqv/+D8h9ib90WGX+kPy0IF/wR9P7
         lIYA==
X-Gm-Message-State: AFq9FYIC8rS6pFWFRZYLqSKf+4MO05ggCKA8b1KsXiiYV8rPh7uYb/Uf
	HQbruIakE2zxAMqcwRk/+9U/Z4wCESWJ3TWXUrvl7GkrKC2OOig6HXH1liMO3326r4PQD6v44ya
	9iFyn0pKa
X-Gm-Gg: AYBFou0NADV4uKPMJURiWT10m8oKPugN8qr4aRnOEinBN3/8l3T0NSjDc9rgk+mZ2Gd
	46Sy53a1VNMsMnbYDXFFAdLHsiJxRGQB7O6PYO//1l00rIYyIj/vK9hBSmKF6yNNeRo6GobOCC8
	I4QW2ifrp0LiQDKCWSYWUfXp2k/rVNdFIfWzxr7hseeayCzWpieRPRsxdAu3BeKYi6OgHpx0Kve
	j/33xc/2fmpVaG7pgQ0e31QcAakiHfRLJYeaDD1mwzBlI0xW5JDStJTF/YB9kUo4/T9lW8Kp1lK
	RuxAjQAWdanG7KW7WKjK3HtPoDFBThgHeSwmeLwjaXaMAN8tohW4na5TqtEXxdFa2ka/LFrO1HP
	9oqu4KqJDQVAMldzvKl8/vPZKy/d81eCozoFoptRgX0bgnf0LK5WzLC8fCtWbijh2gzocc3LgeN
	b+a5M7KvkE/pCbII8/tvsG1rGhJXugWRDi+UQAlWhWHpH0NRxPhbyZruS3nyyJ3FQpdvcnFWLrg
	PMs9d3MaeS53V+KtjEwzg7Z1LGsB0ttvEESfUxPUyfwZcdMFySnns2ypKBc1J5ygoykEqFn7gEb
	AAyzPFpY7o730po9WAd4hJ4pSEs8MmuSPUDmtvQtJm4vVN/OxGKBvgOt/9XDuy9KdqPQuCIiGJD
	2WJTQArpRLHR/jaCC0/gbKA==
X-Received: by 2002:a05:6830:3153:b0:830:43b8:72db with SMTP id 46e09a7af769-85d365ca9a6mr7206611a34.24.1793551114159;
        Sun, 01 Nov 2026 08:38:34 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:33 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 08/13] dtc: Move labelled-reference handling out of the grammar
Date: Sun,  1 Nov 2026 09:37:02 -0700
Message-ID: <20261101163721.2458982-9-sjg@chromium.org>
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

The grammar action for a top-level label: &ref { ... } holds its merge
logic, which adds the label to the node referred to.

Move it into a new merge_labelled_ref(), passing it a struct fragment
from fragment_ref, with the label and node added.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc-parser.y | 18 +++++++-----------
 dtc.h        |  2 ++
 livetree.c   | 28 ++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index cca3ce1..0e6c4c2 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -190,18 +190,14 @@ devicetree:
 						  ""),
 					$2, $1);
 		}
-	| devicetree DT_LABEL dt_ref nodedef
+	| devicetree DT_LABEL fragment_ref nodedef
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
-				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3);
-
-			if (target) {
-				add_label(&target->labels, $2);
-				merge_nodes(target, $4);
-			} else
-				ERROR(&@3, "Label or path %s not found", $3);
+			$3->label = $2;
+			$3->label_srcpos = srcpos_copy(&@2);
+			$3->node = $4;
+			if (merge_labelled_ref($1, $3,
+					       $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
 			$$ = $1;
 		}
 	| devicetree DT_PATH_REF nodedef
diff --git a/dtc.h b/dtc.h
index 5af1d1f..75b1c0f 100644
--- a/dtc.h
+++ b/dtc.h
@@ -369,6 +369,8 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
 bool is_ref_relative(const char *ref);
+bool merge_labelled_ref(struct node *dt, struct fragment *f,
+			bool plugin);
 bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin);
 bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin);
 bool merge_delete_node(struct node *dt, struct fragment *f);
diff --git a/livetree.c b/livetree.c
index b0362e4..76474cd 100644
--- a/livetree.c
+++ b/livetree.c
@@ -548,6 +548,34 @@ bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Merge a fragment of the form 'label: &ref { ... }' into the node which ref
+ * refers to, adding the label to that node
+ *
+ * Returns true if there is an error, which has been reported.
+ */
+bool merge_labelled_ref(struct node *dt, struct fragment *f, bool plugin)
+{
+	struct node *target = get_node_by_ref(dt, f->ref);
+	bool error = false;
+
+	if (plugin && is_ref_relative(f->ref)) {
+		srcpos_error(f->label_srcpos, "Error",
+			     "Label-relative reference %s not supported in plugin",
+			     f->ref);
+		error = true;
+	}
+	if (!target) {
+		srcpos_error(f->ref_srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		return true;
+	}
+	add_label(&target->labels, f->label);
+	merge_nodes(target, f->node);
+
+	return error;
+}
+
 /*
  * Merge a fragment which refers to a path into the node at that path. In a
  * plugin, the fragment becomes an overlay fragment instead.
-- 
2.43.0

