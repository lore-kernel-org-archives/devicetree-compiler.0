Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873527;
	b=JCaQS6sEyAzbAT4mmx+jLMAnJb28CoM/7ihvpUMQ17/zjRlRqizOtoQm0D4kOcZRW4SV
	 HNf8oEYMNra2b7thMXULU155pO/kkHg7vHYqQhLk4ZBFp+BiEQJkcTurL3cm4Vn22NPLB
	 PwWcfbPYir8kailvuabIiLFQZq3SmIOey/I68Gor765ndQ2qnEAP/cVFZDD/dohu8MM5h
	 EsfHE2c6is8jpKCsuaBAsXbzegdEo4TtQofEJvF/lMc1pJ05pSG3bszoQBjjO7pRqLcfa
	 6xnk+PAkUIAyMlEsYxwtGmaA7h9dwmvvScwWppq11UvWbl03PXqin4+RHFp57C7bdgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7/qUcI714bOlKsn2u0OXuOspP/pC4QfdNiCf/8JXqfU=;
	b=xh8Czo3MZ5Iq8trA55rzAwVaKuSG6VknwHv07rRK2AXIKvleucQfxK9vWrRwtAu9QwA7
	 u5t2PN+yhhyNEUQSSSPywqleYXVO0me9I6i1yM+iZsoNjT/jZ79AvHeKo4HBwBZ4WJFuT
	 RlHViLK2/Dc11DuHVFD9KRBRE3NJblEPDY+EPtquGgkwn61g12PWTwxepQdkmer58qyYp
	 iftBFpsWz9tsAKcg9xdGc9EDHojIyusbq5MN/mWxwPACSO4CfxckWndWmwsObHWe3ICT9
	 bBNwHh+nu3+Wn4nONOR+UNoxGMvlAqAnZt5Od3kgT4DDu8AVAuypGMZTsCNUPT7U6fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EsC8Ocna;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C6A606A31C
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C6A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EsC8Ocna
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8470d7d430fso1734001a34.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873526; x=1795478326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/qUcI714bOlKsn2u0OXuOspP/pC4QfdNiCf/8JXqfU=;
        b=EsC8OcnantFLQxc786UCuofV8ZQBtpLF7N/zjGu0hsa4xQ1PI4JWd8oCV5ienepNoU
         lyaPBxCGVqtiSjbFECcM26rXm0oE3D7nMKZ28RTis6fOUvjDrekeDivY2+rckBZq7ZDq
         LdenZVrWnN6EOOadlryKZ5G5afDLZzBA4qq7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873526; x=1795478326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/qUcI714bOlKsn2u0OXuOspP/pC4QfdNiCf/8JXqfU=;
        b=n831vG5i3Y56ECX/EKmgNQVg/ZI+q2kZg6ggfYr71QOxwKqN37UlZA4Xgzt1npJvrN
         3Dp+IAGFMsqMg7sbOZ90EphPVyqlKQKWKY1Hu0rM0P5zSWh4pMXZ4Q87ZVIz9aZ3gmyW
         AQ4FDKxthynWiTQOIVyhHMhQgtTsvfcD6XcwhXqjyAUP7biUjuew3eXmUNspBSvxvpsZ
         B293+5ZXIBYX5vq5SQmK7OBqULFFQEkvEr5HBGzbE7/kOUWwuz+5O4hni9u0p8+Dkwtn
         XoMXvd0CFUsjsELMOkl1jpCf4iXs4iJ/TmfHb5LcpNwl0v+GuvwhSUKV8m0+XTtkHtj9
         3lWA==
X-Gm-Message-State: APuU4Z+8iUbASKIEp3gHSAmb+flQ2qNf6LIcCVwoAN/EQbPIeSCDjGJF
	aX0G1Q/GV4lszmN6MO6rHkWY7/75y6YqJ+M7MNZKWz68vK50wGuYOqhGDMDfP5nX3S7IYTazRpo
	rFgmnaw==
X-Gm-Gg: AYBFou0lsPpE0I5vJdYcOyHdg0lla8zk4ofOghmOuNiEQue2XLjiDXeSdGf9B/OWqvi
	Nc3JSt3WAOxl7peq3tNO0PYx1zuVXZsDNAJtfEN/33ZTT9FUvFp6S9R84PJoc0vpGfLa1W44vM/
	ySQDnJaElYklAWhIXqKL2oJKgxrCIJi/QFNj5LsekmvgPhEsLNZkN0arUWFni8WroNsaI3RlqhN
	X/2nS6IYE3O5cbEvZ+Dk7GPnWUxbHjFtFZmD0nMMjqo7B71Yfaeq8SoAobsCRClVS9HfU9Oj/lg
	xo1+Qq25amFfqVvQBrKK7Uyse7xGlEhzhRX7uVlZCmvMo2hj6vSdfYIZ/aFRfe51n1godQb+YMH
	z65SMup+2Eox3f25BFCyBmB6XPtyzTTaeTizQT55m3DQ1/xK+Fh4KG7L5oTXUsa+zt+exXjbe4J
	Zda1MmaI/oViAYTT7fBK1dGdfilu7VR6V8NJlkqt0GDTdJTClN02mMPJGWPUlrwyn4VbmeQ2P3P
	cc6+WrZlr22Lh1Av0aYGXvrcx7fZnlWhIwa2WVyvTD+6ek+UEmOkx81WAmMSQJUQ1c/QDd2y0gw
	YZcf1DcJT1KTWR7aKFnSEmkcywv/KMhMxMCXhepm9ug4SJULOctQclTWMfrJ3BZECd7KsOHNypq
	U+lXnsq0sT/VeZDA3V4garg==
X-Received: by 2002:a05:6830:4c0e:b0:862:b2c2:9abb with SMTP id 46e09a7af769-862b2c29b96mr7887368a34.15.1794873523634;
        Mon, 16 Nov 2026 15:58:43 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:42 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 05/10] dtc: Move is_ref_relative() to livetree.c
Date: Mon, 16 Nov 2026 16:57:59 -0700
Message-ID: <20261116235813.935070-6-sjg@chromium.org>
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

The remaining grammar actions which merge a fragment use
is_ref_relative() to reject a label-relative reference in a plugin.

Move it to livetree.c, so that it is available when these actions move
there too, and add a comment.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---

(no changes since v1)

 dtc-parser.y | 5 -----
 dtc.h        | 1 +
 livetree.c   | 6 ++++++
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 1a1a52d..9e8091a 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -25,11 +25,6 @@ extern void yyerror(char const *s);
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
index b9cb5f9..b236229 100644
--- a/dtc.h
+++ b/dtc.h
@@ -351,6 +351,7 @@ struct fragment *build_fragment_delete_node(char *ref,
 struct fragment *build_fragment_omit_if_no_ref(char *ref,
 					       struct srcpos *ref_srcpos);
 void free_fragment(struct fragment *f);
+bool is_ref_relative(const char *ref);
 bool merge_delete_node(struct node *dt, struct fragment *f);
 bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
 
diff --git a/livetree.c b/livetree.c
index 669d8ba..388a2de 100644
--- a/livetree.c
+++ b/livetree.c
@@ -534,6 +534,12 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
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

