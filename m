Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994809;
	b=oW3URSC+AliB2nom4Zz+Y/RWrbMJSvlIJzhiqdRztgrh0RG7vvTQGcDEg3/Y+AehE0Rn
	 35UDKBX/P/ZMNHpr942hPqRN6g5SE3G08aMcKZ4hiAhtpSexi1OKzBS2kj6/zdiQUoRnN
	 KkqPzTK4lXqTQjYTB6/4LWXSnpRmSBnW/FdeP67FBsU0NDv9RK9Fz+WCZVwbkeFy/g2Po
	 0a57L//4GaR0aNqFbPq6pzOXMJDoXQorRLzIttwHEQ7V0w+2Zt4fZWygrYISiPRF3/ZJv
	 GlOvq043MgXaLfmwMWrPFwdPfSB61Pbt0c8v/tBDiIrGxTM4WUYyx1kOVVoPJHdiYvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E4w98QlnUK6z46TmmIQBayhC6Ja6UZGitswRuRKj2DM=;
	b=yn0jfljk5FR1NGUY/HLggKtjnzwcIuJLh1Ovk3cqL/z+LGpFHOgN0glZ2tjKSmU1uiQO
	 AR/8CHZqxCXSRQn3oqMbXe4LodLTFwmN8+nzb0+fhGLEn+AYA/W6MV+m4LvDAIYy6j38P
	 ybOSH66g9/xql1mvvVEa3dNCIdiuzT64kw5z1UCqNx5GcJk6/gkq/1jWJVaTt7Reozwi7
	 A5h47wztH6FUd6kAL95UsF0JEsMeWzAze/SHQ54uEQeaSebEc3MH8BMtK/BRHuM+QRZpy
	 us89HH0JIlSl+QPqgFyp4mlRffRJY6W+q6wySsKnoGhgu7Mj41YRgBmP8pGkyxeTl9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FdXxG7cL;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A41606A329
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A41606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FdXxG7cL
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-703be215729so420845eaf.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994808; x=1794599608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4w98QlnUK6z46TmmIQBayhC6Ja6UZGitswRuRKj2DM=;
        b=FdXxG7cLqWk/j8Yl6b2+v1VuiBM7fBj4y+WquYT3fFNwo8kwetB/APfGOWuwOYruDF
         RQlN8PMAR4l+ibAtQQDGEvOaUlsv7yFqR2JHE+ZNWclx0gKaUDXvtkc9E6gYCqBN1vo4
         t01AZ2vlzOlpM4EqpAEdtxV0t9XGi9XCNWfWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994808; x=1794599608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4w98QlnUK6z46TmmIQBayhC6Ja6UZGitswRuRKj2DM=;
        b=Kf6fjK3mL3a94psvOKElABzptF1A8kdGVWtvvwy0U7ljv2YUEKylTZjeuxexQTXsYP
         3ZPWNCmh3RUmyiv1qOQG/9KLcDvpvxBSR3SRxxU4TqmvwQ9kyICLPLX2dkcCY1SiGYmU
         FrV4cLEDjz/cGVnY2O8adFt6fA5W/5E9/lHW83ZvHxIuDw92hMjk4USsNQpiEMSzPI+G
         r8kLUredn9mAzMg8F8Yx4lbzwyVB+qrKfIsTBp52M3cMljbjZxS5klYjDPiXsKqcQMT+
         fxp+DwQ8MKgvR48qMbT7td1/jCDt7myr8gM1F7AW6OmxTuq88cLzCj+/osqRYfXfW/lB
         i9Jw==
X-Gm-Message-State: APuU4Z8rDMqykwgi8bxOj41tPrrkJCte44sFA0WTSfuBe4+YHbKC1N9x
	oxL7FyUjsMy4hCPJzQcEmO7qmymCR/f/Prk+xjAgHqDKURsrFdSCco0IFwfPqXSWB18NoMZ/iOm
	s/qdVpA==
X-Gm-Gg: AYBFou3uu/yqleXm7GGwTUVgOOMushIs4Qn+HelK4d+QUwTJkITY4AZXqUWL1MveDDb
	pQFG1TYeENrGK+CevLtaovIXHiQtO+4uUrNOqWXvTYkdDSAK25Own1xNxQR4FFim1Jk01vH8Lwq
	ZwOdtq5x+qRcPrbQKqFbd7SF16YObuJMXKVSEbHp3wdaGz61fiDE9oJdVgb9srWiLuVLcGSZCEn
	c05OoO0KBpCIFXAYx52Dv43eobZgH5b85r5qMzWqEZ3DEfjVMTzU+b53Ygb6olNEvP+J7CzloP+
	KN/EL7fcsa4EXQdoFnmUv3bLnyVoM0jWkyhfDeHR/7aAcnNLLhHqPXF61wz97wZb1r+h1gaeAcS
	M3KNZ9Uqe3/4u3GBN+WzYmrSFpox21mGnIbUuKt/pronrY8oAMouhDlaB6Eguwn2C+fhpnWp5i2
	UZZ5KPnoEm16lUZ7kn7ezaHKUwous6oFO14m20hDHswtQD2GZ9o8tdLfxHlzqVJmfwbtog0rv9Q
	EkkyKIUxmAioR6OGLjutlbXd7LHbyXJ8jcUnaI8k2Fqw+xdONlbXIGvyLkDUiha3UYMR8mxHcDn
	efpkjMrRU+9eWZhO43GZGEkCzqZnAr5QHLUmuuXIpBYHwLEiBPppQb+C+JiYrxr2lRQLb+D289T
	+o5W2NoftirJO0H2j/sPc30vlC3RTBszLEg5Rv4mp2w==
X-Received: by 2002:a05:6820:4481:b0:6f8:a519:d930 with SMTP id 006d021491bc7-716e78b499fmr1983744eaf.34.1793994807957;
        Fri, 06 Nov 2026 11:53:27 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:26 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 10/18] dtc: Move labelled-reference handling out of the grammar
Date: Fri,  6 Nov 2026 12:51:37 -0700
Message-ID: <20261106195159.2623314-11-sjg@chromium.org>
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

The grammar action for a top-level label: &ref { ... } holds its merge
logic, which adds the label to the node referred to.

Move it into merge_ref(), passing it a struct fragment with the label.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- Combine merge_labelled_ref() into merge_ref()
- Use dt_ref instead of fragment_ref

 dtc-parser.y | 13 ++++---------
 livetree.c   | 14 ++++++++++----
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 3ec9254..8d505a1 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -179,16 +179,11 @@ devicetree:
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
-				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3);
+			struct fragment *f;
 
-			if (target) {
-				add_label(&target->labels, $2);
-				merge_nodes(target, $4);
-			} else
-				ERROR(&@3, "Label or path %s not found", $3);
+			f = build_fragment_ref($2, &@2, $3, &@3, $4);
+			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
 			$$ = $1;
 		}
 	| devicetree dt_ref nodedef
diff --git a/livetree.c b/livetree.c
index 2e9a3b2..7ab9437 100644
--- a/livetree.c
+++ b/livetree.c
@@ -574,10 +574,12 @@ bool is_ref_relative(const char *ref)
 }
 
 /*
- * Merge a fragment which refers to a label or path into the node it refers to.
+ * Merge a fragment which refers to a label or path into the node it refers to,
+ * adding any label in the fragment to that node.
  *
  * In a plugin, a path always refers to the base tree and a label may do so, if
- * it is not found. In both cases, the fragment becomes an overlay fragment.
+ * it is not found. In both cases, the fragment becomes an overlay fragment,
+ * unless it adds a label, which needs a node in the plugin itself.
  *
  * Returns true on success, false on an error, which has been reported.
  */
@@ -589,12 +591,14 @@ bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 	assert(f->type == FRAGMENT_NODE);
 	if (plugin) {
 		if (is_ref_relative(f->ref)) {
-			srcpos_error(f->ref_srcpos, "Error",
+			srcpos_error(f->label ? f->label_srcpos : f->ref_srcpos,
+				     "Error",
 				     "Label-relative reference %s not supported in plugin",
 				     f->ref);
 			ok = false;
 		}
-		if (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref)) {
+		if (!f->label &&
+		    (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref))) {
 			/* Add a fragment@N node for the reference */
 			add_orphan_node(dt, f->node, f->ref);
 			return ok;
@@ -607,6 +611,8 @@ bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 			     "Label or path %s not found", f->ref);
 		return false;
 	}
+	if (f->label)
+		add_label(&target->labels, f->label);
 	merge_nodes(target, f->node);
 
 	return ok;
-- 
2.43.0

