Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994792;
	b=nX95SifpgVd4KzdsrPNVNK9yusdkO9kP1crnmBf8bDSBITKlA17yoI/7pgRmk+VsqjZd
	 CmbGtt/qxAKVv13yZi4ScDKT2bxh4bVnT1Ljns4E/nYUYhLOHbCL7YK3yA4CpWtwUW1pw
	 +PkWQshL3BD4PXP4o+YdzxZkUiSBd0699wWx4bUaWJjuyeyEGLmPxg8ZF/DD1Bs/0+BT0
	 5qBB0T9jmKolp9hcaCyo8qWzpq5P7NCaw0cqpOHy1Bq8zx9CDI3eULO/jpajvGQ1JjlzR
	 /PSd5/QDcCNmn7XUnXFqBqxy1QRZdNcb+2/j2816017FHoW+x/t4ZkC3QK+9fwboIwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u+A93oS4lJF7e89ktud5xlIvwN1xHRoXHumgNlsDadg=;
	b=VtlnovgpziLz7loJ4LhdeGJsUrNfJjrrGyxDuRExZMAC3N0i5WeS4++KNFdd09807H/9
	 3mRaP0KIF7rNPqLMdEC3ULWAiRDaZQwd0S7w1mAVTMI8z+vtQ8HyaOKPht2XezmRmFaUZ
	 kGRuNGyuq6C2sQKE+Ne1ndqEHKGIIEhweiMaedDa0UO3Ej36uHAFEbtRUjmhSubJ0eGDv
	 KJqrjzw6qVWRRtdeTbmxjsd/lK4kQSZfeEIunJobKtJWjNwCv1Kms6t02ivKA92uKeKSl
	 Y4BsWGxNjj6Oy8iGoqxctUg3xC5HKmI/UnZdjGiapqAfTApNsB7v3NreneaYG4dlCMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IdimMiHo;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA708606A32D
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA708606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IdimMiHo
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-451a49abd8aso763071fac.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994791; x=1794599591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+A93oS4lJF7e89ktud5xlIvwN1xHRoXHumgNlsDadg=;
        b=IdimMiHol8yG5F3fQ6MdOvn+JoBhn6VD3XvSR22MCvDHqTpHFAdF4NZfylDbG4k1Rf
         BYeY805dYD6mTmVwVnz9OTiTjrB/MU64Lms9r1IUW7PS+2FhtQYsOBeaaaZV8E8uEH43
         1pJCgnQCLZyM/fLlc1y2s0w0JZ2JC519ifCxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994791; x=1794599591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+A93oS4lJF7e89ktud5xlIvwN1xHRoXHumgNlsDadg=;
        b=Cgq1CiOicD96LRAThA6g9RC3LVDYw7nElDAdYa/EshzXXifypFwG33sFLFw6xjCygc
         419rqaBaJZp1wg3IdLH/wRuDXPkTq661J8I/9HV9FyJJPEZJrCyy6PpW8ZFOhi4vB63V
         bIdPfxH0bvZfBj6E5TvT4axP3tWIiIrtm0pIfY7VvGnIlMmFmtBRN3RbdnaMvxTBQqe7
         w4eSsMzYvoAGSF/mRRFP3/Y6LeCXyaFuA2DKjdx9+9VZbSvaobG6jUm7oU2CoJwTCulA
         h9r+1aoOnFhbdq4sAT1Hb+ZTSsiyR4M3RhyR1zSLlALw2Y938etucQ+vOGt9mkmq4f53
         jAsg==
X-Gm-Message-State: APuU4Z/WfL7N0jWnMt8CQaV/lD9BM/WUEL1TlkoWNB9nuI9Qr0Fn6bTW
	d/8q5y+rGRDnYY8Uee/D4rncEVNoFJUzpWEB7ziPl3QNym0hlbgPIQu6h8F3GkhrJMIGCvjbpKn
	Nik+vfQ==
X-Gm-Gg: AYBFou1n/KCxcW8Gl/JoFYsAzR82XUoGrdtabO2Xwasu2aVDoPiBk2y8lJSo3AyChqN
	w11UoEZYGRxA1wZugtbm3IisdRoXdSIclP/NIe3YpeaPbgOFG6FOPRdxdpyhFC4cuG0MfQTI7v2
	YEmsRVPsYXCCeZiaev9QZpVC0RYYA6wUkeouGmQZUmqBLBnYgzNJk09Q9UsePR04k8LSz1xaMed
	2vyLS1cgs0r5OUL4/qG4/HQCvDmREJubbhDhS3P8qFwu+9bVoYbzltMTtmBGYGZV2LyLczEa5mI
	QufXq+8rlKJWEB9U3AB+kbkTR0UUNNTgC7k7LzQs2r3L4cEtTwwU81P7FwA7Ozc69k0y+LnxBIp
	8muhAafPKkCW210sVJzpV45XQjdVktBqUa2K65zVcZtKWfK+fbvc1l9W71E2M8DKovnLhcrTtCP
	QSmn70pwkaWcf03qtVoLAitYASmcAuAz7HCSdiTB2tEADoERZk7GOkKZ8HZY9YevWkqSSmcLhqA
	C+vDoNZwUrapdDWAbEVD926S9Wnc9IIDGDU2+5HI9+cd85N8nzpfkAKntKVKpO8OTBCnRYL3KWJ
	hWozEVJ2eaziyfoXXwHoPLk9xzm+fPsiJV63RyeiMln3IGrKhf3VT8X5x6fSu3D5D/KsbmMZN8d
	3YwT55Aje5wI/V5i3qmiq
X-Received: by 2002:a05:6871:4606:b0:4ad:8667:442f with SMTP id 586e51a60fabf-4ad98b3816bmr2278724fac.25.1793994790775;
        Fri, 06 Nov 2026 11:53:10 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:09 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 04/18] dtc: Move the /delete-node/ handling out of the grammar
Date: Fri,  6 Nov 2026 12:51:31 -0700
Message-ID: <20261106195159.2623314-5-sjg@chromium.org>
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

(no changes since v2)

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

