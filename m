Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827117;
	b=3zk0tGOuXSddrIydxJoMGPWr6L7cnVsdYAPIgu5UOZpoVkm3vnawAp/FqJhkAfD2uVOj
	 a4UbhLyzRTZ7l6OoqZfnW936SOQahNe37L24Y7C+Vnvi3PufcnEV2/ElhqXkRHg7pdPVO
	 9ZpXjR5TpZshfs14ORFxiNTf5CmJsB8EWFgyXdT/7jE4BNsFwm8gXPjw+uUJ35IBQghjX
	 CcM9rq+AuvyoSpAgvIKSTuNY8cxrr4C6AxFk8KGFSAap67R2JYttT0buViKTRE037qBAF
	 tK/J/ug2qI2pBeeD4Bn6BZ3k1q9yTj/tNegSVgGZdowhEoVQ0GyF97AD55WQ1csW93A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WrQ3Zkl/2cDl84xv+0TsrOgF1gM1BjU84IikbxaN5mE=;
	b=h6wQkha1b0rmlPl+0QFO0gJxvXIAbZNAwW0/yDUCXzZdCBQBE+IA8xVhi/cv7SoglNEI
	 mMvSGqfPpJs0VY38FrKgtF34QcH39syd6e3KIZPW/iCt/k5vqEggvtx2mTo7WE8dHIk2l
	 svYIHBtMWbgbVfMaX1StcGCrTtD0IDZcxtQzAHpNO0ZJV2YMi5Tw68BAyMsdlyg8G7Ipk
	 SVUfiXXcjO1E2LhvtwL15CsKj60d6qw2uUCz5RkhEJRMYx77TPZWkS3I/12dZL8nWyI4F
	 XRqbPSOOT+ju3rhAE2qFfO/1ve/N+qvbdmCaJOpuE71cQI/pj5yPE35Q7FipmSXhU5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WVjPBjyy;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B030E606A877
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B030E606A877
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WVjPBjyy
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-483d290f398so780613fac.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827115; x=1794431915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrQ3Zkl/2cDl84xv+0TsrOgF1gM1BjU84IikbxaN5mE=;
        b=WVjPBjyyN2lR7v0n5QJHjFu1cnpH1Yzj5CmB9FMJoTBfwQRAhOpRcbFoLP2cLO7SLv
         o+h/tjbLqeTVB758bQOfU7BMjVr0HeIFW6zqKcQvpUBiM3p/Y3MppJskmqI/CFXC6tI2
         pwZyDMHUkibe1mCs2GelskTkPUqlk+/VUk0oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827115; x=1794431915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WrQ3Zkl/2cDl84xv+0TsrOgF1gM1BjU84IikbxaN5mE=;
        b=mZiile6i47seXTPkQUYUrUMw98iyAKA6E9xlwrfIxwpFJzfjjn6cH8Eo3Bec/Ee/9T
         Ig/Vh6z9ojAJpspd5MVc16g/JCeJCfE0kyeFIf9T3dOYslppAc4bT7NNHPD+Vi8eF4Cg
         3X+l72W+dd/ggXvJk5xc1jell/zsp1Tx8kUDZiuwnpje4IEKLWQS9Lq86OLhIhqZQDWw
         VKR/2HNF0jd9cD3OjULBk8giDRACG8K/T5TBQd5dJfh2f/61av4DNdj/FLfxO9GpK/EJ
         VQX5Je7fVlo1hjtocm89HE3X4fLNBVGZEBg5Utcg6f/pHH0p5hKuQkvLddOd0V2NhvUL
         gX7g==
X-Gm-Message-State: APuU4Z9zWkZ9XVXb/hxbRjPM0WpyKk41d52zGdvKPzbH7tPkViYKP2b5
	fP8KBa+r0Zmqx14uKD0PyBAtnMBeS1I6lPoFcclMfWTkRPBLstiusx/PF3Z9FURllky4nlCWohg
	Y4opmXA==
X-Gm-Gg: AYBFou1ZIparRUT4nLyuo1MwQ2LLJBuN9g2M5O6t58A+I7skHrdkb3Z+mgtgD5QutMs
	l+hgFa5sb1GeQH1AEIn+HDavAGqkoD12dwsX/3AVpnN1LcSWpD1ZJNcMAT+2SjgGuA3dSY59dYs
	1tSp5R4V1QZDiPKK1JJ0hk5zGZq8Ey5vlgDb8QXWQl7EoZkUPf9nV3XEQwBamMh4+bYuR6F0pEO
	QbPhYFMM73aLLS5dPuWajX/rUo0VS6EggtFWmLR9gGBwPt2i56CGY6I33BMu/v3MIcmIxpSWhsW
	A0e3fqfLbg6SYF7/f1qprplc0wlB2Hnpg5ziTQ/jM6+ZB3xrtEz3rkfHPKWOotosKB9JDmgP1W+
	F7uLI/ekHyZsIKlBQoQzXJOjFeZBY+adGbWXWbQCL0JFvunNt0alzQD0V0CX1jY+Pp4wqQDpCy5
	p922Euroj1Nm4MgsBsYYyL6x+u3LGGRd6m2z17NL6ps+yCU2dOtcIm/5EEj739aL5QJkaHLFOAm
	hbonfyzAxz3zicOCyA0KkLxuf8Ou1JIq43Hhocrk8McVTVACSQ2KqX/KyFYAoPbHHLQvzHVuoc1
	JtLwXKC14gk1jOhrvVfsByow3DFJ7FPvlGG0IN0ug7TgSO9flBaGvDp4XC7WP6Lke8lT/OBvfdu
	Po6EdblRQYC5ZrijT3ThnobdmB4z2EAeXuS8Jmw5TB9g=
X-Received: by 2002:a05:6809:2791:10b0:564:30ff:6cca with SMTP id 5614622812f47-56430ff6e84mr6424478b6e.60.1793827115650;
        Wed, 04 Nov 2026 13:18:35 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:34 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 05/15] dtc: Move the /omit-if-no-ref/ handling out of the grammar
Date: Wed,  4 Nov 2026 14:17:44 -0700
Message-ID: <20261104211807.972610-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104211807.972610-1-sjg@chromium.org>
References: <20261104211807.972610-1-sjg@chromium.org>
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

