Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827120;
	b=VMOjDgzWVH1Es8Z3ltVlM/epq6luq90SaLepaQLSyrQRdpcrjV2ImSPMlNgKxGXNg18z
	 lRlEYFEf3KngC1V6t9AAQpMPUPRklumI3wWo0EUaCXxIcSg0uk570p3RH5EOfGT5Dnmb4
	 iAPE785VuCdUvSQpr7hwfkuVLt0r15Kwp/gZLWIljyhJNAdG2STN3zOm7EEJdbnDF4QKs
	 46YKTnBw+tj0vC5uQnwuugTKY74INVHU6jUGn83Mf2EWMG/iMnAlOEx7/Zvt6H423OWq6
	 L04BVw7AWOSr04E+JsOknHfRH6qHrQ1hYuxUunqvFg/NAy6QKovzXgVlSo/CnMejemA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+L274HkiLmDy6Kek0zTYEEHiYeZIhoTRz5tenqo2KFs=;
	b=Ry7IHtyZSigoF6N8SYIEzg1mM/w0Jo//Xn2lV068MnJI7+9UBsnRGAmUnF9M4yXzNV1+
	 EaEb+4DFcdDaGIViMAAWX81OyKYRiWWiqre+xPMeF8eXBzUTj0FUp3wuZEurtloRNSnoX
	 w84XwGiPW4AL4cKu6mKMciz8pKTXqPYPItWr4KEssLJNkmhtyHSkYvzgk4yU/YlSI9awL
	 rSnLhpct42JfP+Ad6iwF1ahW17scgVyZFct9GGyRcPBf6vnI8usw6YvoBNvPWgrc2gx+c
	 Q4jwAN+4dd58O2JSaGpHFwL8qaKCBICZAC2NTWELPqQQkH2JqInPhNPxz31TwNa153w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G0qlVZfY;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8EC606A847
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F8EC606A847
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G0qlVZfY
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6f5a0893610so842602eaf.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827119; x=1794431919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+L274HkiLmDy6Kek0zTYEEHiYeZIhoTRz5tenqo2KFs=;
        b=G0qlVZfYVv94cTBwOrxKYuFSMRxw3pJxAekikAPCSZu80D+oMogZoGMVi125TVwKwf
         TyA7uA22ajMHRDZUAPufMJhNrpVvZ/QHvvG6u8NKttA6NDWgRjq+1SOnyC023Iznr1s7
         IO/SZzwOSEXippoNJmAcEzxgKmbmKnmNVunuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827119; x=1794431919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+L274HkiLmDy6Kek0zTYEEHiYeZIhoTRz5tenqo2KFs=;
        b=plADsg+3WvDHcc7zWJvrvjmnpxKNam05J2uTCeSTOijefCnQIXTDDhexYbCAPciN4V
         xhAwJ13fOhjMCLLVtI7AdjJExOxliGbr//QPCfkntwL5cHUqOLHBzNnwEJEhEM2l+cbM
         uKhUmvW4VLG9Lfqul/Fi3ORTER5m28luj4LnON6lKm4tW8C9xNcQ+dfFtDNxdxIbClO2
         cVoyES7D2ApR7EF/NwChgNwkMXnmbouHKZZ/JLD/XZzrNrk8hWsmJmNMC83LjXTab3nd
         qkEFOIRmSjpO/P3yxglsdTu+QYRxFoRieuZkAG8mN1AJI+fKucDGN3qU776o/vhy/4k4
         AorA==
X-Gm-Message-State: APuU4Z+2E1PdY/16E3wrYkogaRVqoo9w434LY0IK5A9yy9xnhnkw39du
	+rOFX+ahvvQ93zLtsyGMVhCLQQGJJIoeEuOSHkPdrwomYxucX4SO60N7jMnfGAhOfriimbQYdmd
	VJaTisw==
X-Gm-Gg: AYBFou3rHYCYol47KjvxuXtzCo3rXz1LhV0iGqkTVjIEP19lgUdEwflM7nH7fxqgAnl
	AU7IDDTcWJ4qSHmFZRECeX9yUZx/bYQPxgCtDUtm7V/c5c9cvqIdcZ5LCpdJJtd99RIwFBmYKDy
	/3uoi+vfKD8kFIyVGOsyg2QVVQvS4ZuLj7S7a/8WhupSs/VJino+7Yl+O75Iw8xY+rLW27YCjmT
	9dF3A47vsnW4c2s1C7mFm5s5CxO78mhASYZv8ilcnWqhiTZsf/46umVjRjv7jK/w3UIEddqA+0B
	/hNVYoGt1fbGmyBOcJ+PFu5Z3/PNIFljlgYHwXrimz1Vpeg6BYDXBJIK1XuAhFLJQ801Eh3pipj
	CvPJYuKS53N3QBgYy4Mp9hqpGUveNvuaVqw7I9NaTc4nrWOeMYVEx6rQXbAvFWvVBFdvkylYdYL
	WqiY38zjyXvztXs8/ywWx11UPo+A15ikNv2KD255ocdmNYNbpydHeXLSjLHngPOlwR1iYhUBt1I
	eNqNRKc6+edE1baMClYt4QhJtojDxOOA1yM0GwilD8NL7+cg33nQ9coBjAM/p4fupzCi3ieabEg
	Jm7mTrXhnUtuYooOh2pjTliQ1hi5OFjHjLwYc9IiQqi5NOaTs8ipc+1dm+8xS4AhCV92YmsrZVw
	7rYUtAIyElaSAneGG4P1s9g==
X-Received: by 2002:a05:6820:c0cb:20b0:712:d5a5:fb0b with SMTP id 006d021491bc7-714f2ae35c7mr6739101eaf.84.1793827119505;
        Wed, 04 Nov 2026 13:18:39 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:36 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 06/15] dtc: Move is_ref_relative() to livetree.c
Date: Wed,  4 Nov 2026 14:17:45 -0700
Message-ID: <20261104211807.972610-7-sjg@chromium.org>
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

