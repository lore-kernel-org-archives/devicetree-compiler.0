Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873540;
	b=ZH897Q3BZM3MBzGMvBTVGHw8Z6+nB8VaJcod8QgoEsPqnGpH8cjwPJvsQJ6L9apKwj8C
	 KXhkTVAy93DikWcbTTTKHrt/URUfKqylngIMrMmXzTRIu54qCcQLFxbfjDgvBeu1p56jZ
	 eCpdxVZBdLQ19ZCPxL44hRtGfg/J1nqKAVEMUm+BMfSrqLbLYSDc+CGhtoXDFDWL0aJQS
	 r6Ae9We1b3scXTDSLkaQu0qKJM/o4u2LC1BLFpVuG+LqKwf6EAj/5b981fHMx9GZBHb3o
	 6Hhx5t58/g936D0g+caixJbP5wnWhO7zsQLk3TdDSBmb9PQ2nJX7UWbcjGTqR2gvAMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cVeSyQTVhSuu45M9rSVqwUvOFUAzdczcdiVnSlj9rHY=;
	b=tMj/u/hnJN2SobWMEfU30v+m0jY6FMOlmxT2a7Y/Gj1a8ZgcXfJyJSnXcT8zpfiMtvhF
	 8O2K7vTCKwHBBBUHuKkKaDOcZVHD3QyGUyDh7x0aAm26F9Kcm9yG+9n0urvq2+lMfPvYA
	 bnmrBoQNNM1ctjD46sMzsnx8RJlY+AUJyK8Oe0tC36wyO5hovGZRtkvZu26f30p3SOm9B
	 5dS1NvCMEK9x8INfsSqefqvfxAwSaupwpck/nSAqGSXI6517iY9hMrpghWXXlxSHP/Fli
	 699BfnZ1qlfMLWG6X4FUtnATvxexHFGPyUrG2POSo5h2UA/zxpsiPPniTiPCUqHYQ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fdlhimcW;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F56E606A323
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F56E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fdlhimcW
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8629c7cc36eso2045320a34.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873539; x=1795478339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVeSyQTVhSuu45M9rSVqwUvOFUAzdczcdiVnSlj9rHY=;
        b=fdlhimcWtbEMc10/HDjSJ8CSHyoBzHR2cNVWzQP/ytMSFhR6tRyEf1wQaxPvINJUfU
         8Yp09JvtmVayRzIe9zf/AO+zgiBktM8gj8ON8By9dZQzkdyBLQIgKyFvh9L1bxuCl7RY
         wbsSzw3JWQbC6vjKBDUu3lOq/EOnCciYf3N3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873539; x=1795478339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVeSyQTVhSuu45M9rSVqwUvOFUAzdczcdiVnSlj9rHY=;
        b=szNUuk7EFVZU44AVx1phGb/CWHwbIyIRMZhDdQtwBFKktV2F2aJc7s8oYJdsnkqKOH
         JlZBZGFV2w2rK+KUjLdb0oIX4wIXQiTPj+gLvuzHm36BeCvFHGA6oO0J0SwBvMvRG1X0
         arrJ8rtcb56n+NTGdFqzqdHRwVbWT4RYVT6lrMV81COuqRV05TvLD42RDxfN4Y/2ZIHE
         DU5l1dDc+AeXPNZyhoyxJ2rW6lgnyhIIVY34aRiLcsIgF1FMmX6Uh6ZrxZnz9kNjC4JM
         B6DAmsaR6gkLhcPQkzLjN7jFm/KxF3/nyCllS64h7iSZpIKTPjl93pGBF3zhllYrYENw
         RTQg==
X-Gm-Message-State: APuU4Z+qQczeIOJ8H8APnGqiM0RcLa8Ejvkg47djy90YtgSp89XISS5G
	6V4Gy1278iY0ggSedGgO/akXn1qGVI0oKDMsjpTT9X+nNhL52AcmZcrtwRi33t8WXaJ+Jnc5b6O
	rccD1lw==
X-Gm-Gg: AYBFou3dyIMcCcZIJk+vzGbejnO4A54Y6u7gyjq9nY4BQlkyXc/1fg+8MUEMQR2DSgM
	u6bcc2JO15lzhtX2MLzefTd0VSyku5GsduxW6YD4/RFblxnEZwE9rpIQRJaZqMQyvVN/oc8kwln
	Tz6mt93jnC/t72BRp8lLjBNS4HZCrZiCwAsH8MmTQMLZ8bqn5ctNf4m8dZ/36aPyOnErejvhiaj
	Zo2+jUlqENxdokGrzaplFDxHco+jSSCshegDTgVH8mBsYuzS3dNc00bgKh5fz691KFfxccbYusQ
	AhObv7DPOgE7jFItjVDyO/11GYmjmN9SUkEimVzz9MR/fykRFkPKGzrZIsaskip85Fu5tWprsik
	P83rcz2AnNKOJN56s9qwcLOUrInvp/nr9Mwz3kvK9f/1WEtM/lZ0ihziizUc3gqudptOcI5d4rf
	0zZdxUsMCl+dvHJSovIVQX6JuGEROQrCLMPsjzii+0KACJLfe5/lSm62P0vj1QEM4sEeETTnIAX
	KjHebauwDPq7iPj/Ncj7WCIa5zULggfPhaBD50Cu0lsjFX5l8LPZDlIyQmUzwb1Oh7xGLWpJD0J
	iloeZ8qB0LZHiNNCiEAJwIis6OVuQWfPT71rmUsyktEiMZRMH9+xM12su0xk0DWn+tTfwJiddGj
	WA/bitImikou1tl0l9s9M5A==
X-Received: by 2002:a05:6830:2407:b0:862:9f06:8663 with SMTP id 46e09a7af769-8629f068c55mr5728031a34.10.1794873538938;
        Mon, 16 Nov 2026 15:58:58 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:57 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 10/10] dtc: Move first-reference handling out of the grammar
Date: Mon, 16 Nov 2026 16:58:04 -0700
Message-ID: <20261116235813.935070-11-sjg@chromium.org>
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

In a plugin, the first top-level fragment can refer to a label or path
instead of being the root node. The grammar action for this holds its
merge logic, which makes an overlay fragment in a new tree.

Move it into a new merge_first_ref(), passing it a struct fragment for
the reference and node. This is the last user of is_ref_relative() in
the grammar, so make that function static.

The output does not change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v4:
- Free the fragment after merging it

Changes in v2:
- Return true on success from merge_first_ref()
- Use dt_ref instead of fragment_ref

 dtc-parser.y | 14 ++++++--------
 dtc.h        |  2 +-
 livetree.c   | 30 +++++++++++++++++++++++++++++-
 3 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 6f7ef24..0f254b5 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -164,19 +164,17 @@ devicetree:
 		}
 	| dt_ref nodedef
 		{
+			struct fragment *f;
+
+			f = build_fragment_ref(NULL, $1, &@1, $2);
 			/*
 			 * We rely on the rule being always:
 			 *   versioninfo plugindecl memreserves devicetree
 			 * so $-1 is what we want (plugindecl)
 			 */
-			if (!($<flags>-1 & DTSF_PLUGIN))
-				ERROR(&@2, "Label or path %s not found", $1);
-			else if (is_ref_relative($1))
-				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1);
-			$$ = add_orphan_node(
-					name_node(build_node(NULL, NULL, NULL),
-						  ""),
-					$2, $1);
+			if (!merge_first_ref(&$$, f, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
+			free_fragment(f);
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
diff --git a/dtc.h b/dtc.h
index c5b8aee..f856edb 100644
--- a/dtc.h
+++ b/dtc.h
@@ -351,7 +351,7 @@ struct fragment *build_fragment_delete_node(char *ref,
 struct fragment *build_fragment_omit_if_no_ref(char *ref,
 					       struct srcpos *ref_srcpos);
 void free_fragment(struct fragment *f);
-bool is_ref_relative(const char *ref);
+bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin);
 bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
 bool merge_delete_node(struct node *dt, struct fragment *f);
 bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
diff --git a/livetree.c b/livetree.c
index cf6849a..4756946 100644
--- a/livetree.c
+++ b/livetree.c
@@ -535,11 +535,39 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 }
 
 /* Check whether a reference is relative to a label, e.g. &{label/node} */
-bool is_ref_relative(const char *ref)
+static bool is_ref_relative(const char *ref)
 {
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Make the tree at *dtp from a first fragment which refers to a label or path,
+ * rather than being the root node. This is only valid in a plugin, where the
+ * fragment becomes an overlay fragment.
+ *
+ * Returns true on success, false on an error, which has been reported.
+ */
+bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
+{
+	bool ok = true;
+
+	if (!plugin) {
+		srcpos_error(f->node->srcpos, "Error",
+			     "Label or path %s not found", f->ref);
+		ok = false;
+	} else if (is_ref_relative(f->ref)) {
+		srcpos_error(f->node->srcpos, "Error",
+			     "Label-relative reference %s not supported in plugin",
+			     f->ref);
+		ok = false;
+	}
+	/* Make a new, empty tree with a fragment@N node for the reference */
+	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
+			       f->node, f->ref);
+
+	return ok;
+}
+
 /*
  * Merge a fragment which refers to a label or path into the node it refers to,
  * adding any label in the fragment to that node.
-- 
2.43.0

