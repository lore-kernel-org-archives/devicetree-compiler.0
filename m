Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994798;
	b=dkj+R0rE5KIRjSFbXc9O4r5nlXRkmTMDnB2cemUGLw32pgBeb3OsL1BpIvl/WtuAnNrI
	 HX+UMYNCVHXc8kAsmdIUe4REt6P3icZdM5WP8zwdjB6pUKD4Xl/CRpsWNdZ/2BUSZMSDm
	 GUBYXQpowLJ16mWHUY8WIigbrRdeINCZCjMiEXyIDBkFlZVnv7czRDEpYEMm7PtjpbtW5
	 XiALQBpkuaeKBnFmuweV6/cGemoxVJaV1T1tYmvChIA8bx6UOLOS9VmYqV5ufOp6XmpGt
	 xAOVuQbA9/F30+iQXN512dJx5YqCuuk1O+39LmbDQFrpsP27ITKJk1E+69I0GO6Fu+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+L274HkiLmDy6Kek0zTYEEHiYeZIhoTRz5tenqo2KFs=;
	b=QcTqMe96TXjdvM3TotukiQaFtWj809BUiSEMHm8/S5cqrL42CD7YV9E+FwOzD6P2SFyv
	 EcYDBCky9c0hEYiCdwc1U7TshULdUDxHcBImCLdP7tc4cnFFthgExwKEAC756ci3v4a9f
	 e/ucdMqESh4YUVoDOyVahiCEJAhjmHKMrH1D8I+NUwd8+BgGhJxT0VR+ymQQirzLBD9A+
	 1NNAYZbruzRWPewAWk8ipycVKMIr6zZW2sWhcubp76BlL19JjoF3ZFE/qi42cdcVmUKko
	 PGIlO3Ex37UEoxeyhFcsmavtxtGYkEpKMYgAAdNydOfstjJn6wyEdlPwQAk4MAgSemg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oY+ZV8MV;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F76A606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F76A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oY+ZV8MV
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-483d290f398so535740fac.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994797; x=1794599597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+L274HkiLmDy6Kek0zTYEEHiYeZIhoTRz5tenqo2KFs=;
        b=oY+ZV8MVKWt6/j990zNZaZrDwMsrU9zUeZk5i2qYC+ipCKGxyN9bsacqJBmugLkmV7
         pDqgarubaJ2hqfgTJgct5C8SbP1bUdZd3KiCn0CUlQ4AQyFSO2NyS1orq9+5Z3VwXPTm
         YdDwiODOZpcU+lVCNjG5NoZ52GPCa+i+88nyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994797; x=1794599597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+L274HkiLmDy6Kek0zTYEEHiYeZIhoTRz5tenqo2KFs=;
        b=TrRu8wrTqgdiOL83v2Mn8lgsrGQy1bs/CAvKLOaZG+XZGJ7JHiAk2Bxl2s1Duk+XqO
         XZBku8bHxELKuyGhWfxR8s4IsPvPKsOgw74J6dsk2Jhosw0/yOBFCHFuYaGh+fomeCYo
         byo3yaNfBuxLQ6WV4GSOb/5OHu0TEcQ1h9d+ihjiW+V/q9pwNBniTCo7HcE4V6PdAOJa
         aB3e357BpaFz2ZPsQd1ruiqqkh5DrU/1/jduhPnhG26E9RHrJdbNRKnT6rso0k7z133O
         FyeEUOf4Uw9GU0js4bLj80LV79Da7uII/UWQMXipVMB224jBCTtKYxLc3nWT6cZNg94A
         2wgQ==
X-Gm-Message-State: APuU4Z+/b5PKKSWZq+7BCe1zfd1F4jWk1NnFgYZZ2PbK2jTHt2z4QGCX
	QbO3Bl2C2BgS6NfJrIf2k93CL1wONa/YwI6d4lHSEnYmQIJKhcLiDkdGhxdEuzFJBo0mNj+ZIRA
	e10L+FQ==
X-Gm-Gg: AYBFou1H78KW0BgBiYHe1c9pIRowGMBdG1sZOIOjm/yFwWMjGmf9iaUC/25WP5CoCnA
	8Y9FzeptcmHUhQjW5pftiEV3UF7liUILnk8vmG/4D9Zj15W5LGFLCVD/0vl7V8puT4wtdq7djCi
	4f0tzaKUkkYF9HzbpJxCy1IWZ+IjnO3B9/r11YmicrZRPG5c8/Jzeel78gQaPKjGnwrZmes8IKd
	69YvCNVCgDTvctNBn+GtourNdq96lsnXnyp9ZJhPWyHQeIvqtH1IYu177FRxkaDfA9EM5xTJ0b8
	Hxsp8fwR2EFUb1nfWuJdSRwzdkSrenX/3JAaK+GcRXuPae5x3L1GDdBCLYhigFRpK+QcpKivty/
	bIM933FwMoWhZYlzg1DUy0mbhQTX8lOF5WE3BBHLwXtAWaYR+LDNaWvZCqliBDRyCZ69qzkWIQo
	P/ZlXBax1umto74nEH3HimiLOnwOhwkK1LaoC21qpROkE172Ne9svsUZu3RhIAvmzqWBOcGwfne
	j4lfzoPNBy4UJvNewPtbQXeG5wryXl9aYu/Eyq5ThLV8F5eztQXgWLK/JNyTZ2VyNAhBA1lVMIv
	KZAU29yyKf4OQ+n8djbedrOKd3AFAPTmYpkEcYKCSymNUUjhGvngun04R5pyiwDmcFHAhlU5KDw
	mId6Em7T+ToTXjcJfO1iL
X-Received: by 2002:a05:6871:b20:b0:4a2:4c6c:c9bc with SMTP id 586e51a60fabf-4ad98a9b6bdmr2478663fac.19.1793994797247;
        Fri, 06 Nov 2026 11:53:17 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:15 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 06/18] dtc: Move is_ref_relative() to livetree.c
Date: Fri,  6 Nov 2026 12:51:33 -0700
Message-ID: <20261106195159.2623314-7-sjg@chromium.org>
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
index 1aaff42..9b9b6db 100644
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
index 22a050a..8c4d7bf 100644
--- a/dtc.h
+++ b/dtc.h
@@ -372,6 +372,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
 					       struct srcpos *ref_srcpos);
 struct fragment *append_fragment(struct fragment *list, struct fragment *new);
 void free_fragment(struct fragment *f);
+bool is_ref_relative(const char *ref);
 bool merge_delete_node(struct node *dt, struct fragment *f);
 bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
 
diff --git a/livetree.c b/livetree.c
index a54009c..3ff4e14 100644
--- a/livetree.c
+++ b/livetree.c
@@ -567,6 +567,12 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
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

