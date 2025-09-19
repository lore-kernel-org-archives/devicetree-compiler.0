Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ED92F3637
	for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274200; cv=none; b=lHSjidrN5fkQzfTDMgLYX54idtJ6anpOMPOeAG+TlaxZM046Vc6gYJZ8KkwAWhoNrnqMKoERy7tso344EwhpfmsC8emGFkPteun/ww0ulQysIsZvr4XGJvELr2J5rdwRlZPhdUYqcpyg0CB1DTYb7ok0ZUNoWGsLXUGnnHXMJbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274200; c=relaxed/simple;
	bh=Zzn9D1arrVgBiZMAgb3e1VxmvCfpyEqTLM/dXUoZHPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vBsMpCGGI61aI/iAZ4srUjrn4NMIbpVyDKve+MHd4m08MQGs3bhGdlMUAhhCOAtWa0R0MiV1lDtiJLTs3M8QDiCwWye8KTxTVMAT2+hLjdCbg+1UhSr6TzYw+Stu7Ch8YLzyxOq8qUeYhNG3Ysz4rD/oMZNYU+geex2XdxKN47c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Fc12a3zc; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Fc12a3zc"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso3060855a12.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758274196; x=1758878996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u72eEn+439WHWLOhJKR2M/Twqg3MSTsTy7/sox8BmaI=;
        b=Fc12a3zckXMZ3WZ2F+jUWI8L0m6omm+zYbFwMTPjG30Kppwvo+Z1eJQfWweI6hlcpk
         wZ6GzE4YKJI6SZe5sFPDk623g6x3XP6o17jiveq0zKtS/JlAe1skFDZ1u8nfyI+0M4jB
         cl1i84PBQW8JWNpcMIFt7UCqOO9XtQiV36slUwgBDw+LFeKvz4fQKIDjVj3lLyBLc0Iv
         90HC4wgm5EP+ZaXCpoLdwgjGyF0AS3mfCT4trq6P6KDpBD98mHw4G6N9z3xzSLtpQhQG
         32b0SmRsiWCVRkuPREZdpDxRUeLCZxyY92bfrzrl3s2Wr6rgTiDo7XTYJGoJhBJ32yL9
         /drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274196; x=1758878996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u72eEn+439WHWLOhJKR2M/Twqg3MSTsTy7/sox8BmaI=;
        b=CeKhsGzXTfokpTRmVin7YTcA12yV/7V9+4gLRRAjakSzGUHpjq7ZYGfA3751BtvV0w
         5/rVvRnmdli6WiA54ga/eYSM8YwU1ItDgh0H9ldZHaMdeAXIp29IyDxe5RV6oFUi843I
         pj6vQmc3fcso2J8CJwuZFO6WFnO85r3u3GDU4xM2vFq6NDC/sxrWRAyDhKs+/5vX215P
         q+iZZbBuxdtL5j1w0pV1simfCYX6Hkk1ERQS3svuPLsPRZWg71mWILL/+uDJJDJpl0DX
         IiMA5NRBhAkjrHZtVJUrSZ3EKXiRJdf3gUX0UrYQ4EXhRLaisJCfBZzWSuRHHWvIqyAT
         tKog==
X-Gm-Message-State: AOJu0YyQl8X9+5Gq2+GEx5Cwaa/dLup1bvWUpxpVqZVmZPAjdVB0oRaW
	ouv6Q6p9lwhBqwuDxWfOhA0QJsZf0oeuLbRw29lNUUp9OMeiCdDNVpivUKAgb/1FniYrbXG2/uG
	xaZg/
X-Gm-Gg: ASbGncsER0hsH3TtgiWB1TnRNKGzQ0RMG5Xw+Mf0yGFWnARKXwNWFQi9RYbZk5DzEfL
	SY6gIPtnwGcmVQfrFF945AHhqvohX3RPt2Fi1RS5jZyp1hYMJjiFEaWF4vz7bMHa0owJRGlEwm7
	4VrSjeDqTHpVTPASZYQ/QmR4FFPYFsA31GTg7iM0cwJvzEzNgmDd3ywn4bkL3yN+1lMfQRCNQ1Y
	9Y4bqKFvtea8BnCGC46KJkHQX3Lt4C3c3HmLhK4lwKr2FOz3rEy8W+3EHBCqTOJiNSeARkYZZ82
	6JWol3nasmyhsMufWGqjZuGj9qyN6ECmXUsqfws0SbYoTGdl9qs2JjlnIMjO28U73fe5MhqZAYc
	gAOkYZMadtGWVjX6owULwqrQGw5K3H+1cMQFw9IqfOPgWpDThGG3HJnyP6QXhDhW6eUqnBd8/mf
	4=
X-Google-Smtp-Source: AGHT+IGMZzB+gTEDKr/bdGNfXeAA5HcGyuN7RmBnsR3PHU6meSJ8cbi9Leixp99w6QcY/NNxnK6n5g==
X-Received: by 2002:a05:6402:268a:b0:62f:4f1b:891e with SMTP id 4fb4d7f45d1cf-62fc08d3480mr2148804a12.8.1758274196158;
        Fri, 19 Sep 2025 02:29:56 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62fae9c5159sm2275637a12.50.2025.09.19.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:29:55 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 3/6] Improve type guessing when compiling to dts format
Date: Fri, 19 Sep 2025 11:29:16 +0200
Message-ID: <20250919092912.663304-11-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
References: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4328; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Zzn9D1arrVgBiZMAgb3e1VxmvCfpyEqTLM/dXUoZHPk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhoyzSoVXY617tnxmD3+W0+RdVcUXl/FiuXNVufgZPfN3U yxSOew6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZhI5iP2vwJN+vw7HTd05Dtl 7L7sFBfLOV2sRSlSUoOhMcL2hLLg8tWLKma/3NbXInjVfNtKbnmHOit+1Ul/nkxQUH7y53iQPf+ SWbuWlQp2Br9ROWbq9zXw9u26T9/SN9f+8wi+FJD4IsvQUEqCxa+mxHjRe+OQraWNVwqSt6y/NO 39jJVPjv1a2SDXYNhul1ImUHid/ZG8adTyiQHGy1xCnzH8YOfa/yJCn6t/evVCHk3f3ccm1pxu0 rtRzSIy6+yfrpDHF3i+7syPZnX7Hv5SVHdSg5hw/s8/L7et8H+29lguD9u0YCFVKW9buSNSsY8N Vi4X/fjkHb9v+Z9J19TMVZY1P9VStSjYFSlckiDKuHc7AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

In the presence of (non-type) markers guess the type of each chunk
between markers individually instead of only once for the whole
property.

Note that this only gets relevant with the next few commits that restore
labels and phandles. Note further that this rework is necessary with
these further changes, because phandle markers are currently not
considered for type guessing and so a phandle at an offset that isn't a
multiple of 4 triggers an assertion if the property was guessed to have
type TYPE_UINT32.

Now that guess_value_type() is only called for data chunks without
markers, the function can be simplified a bit.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 treesource.c | 70 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 30 deletions(-)

diff --git a/treesource.c b/treesource.c
index 72d1cb5508b5..576495902f0d 100644
--- a/treesource.c
+++ b/treesource.c
@@ -173,23 +173,20 @@ static struct marker **add_marker(struct marker **mi,
 	return &nm->next;
 }
 
-static void add_string_markers(struct property *prop)
+static void add_string_markers(struct property *prop, unsigned int offset, int len)
 {
-	int l, len = prop->val.len;
-	const char *p = prop->val.val;
+	int l;
+	const char *p = prop->val.val + offset;
 	struct marker **mi = &prop->val.markers;
 
 	for (l = strlen(p) + 1; l < len; l += strlen(p + l) + 1)
-		mi = add_marker(mi, TYPE_STRING, l, NULL);
+		mi = add_marker(mi, TYPE_STRING, offset + l, NULL);
 }
 
-static enum markertype guess_value_type(struct property *prop)
+static enum markertype guess_value_type(struct property *prop, unsigned int offset, int len)
 {
-	int len = prop->val.len;
-	const char *p = prop->val.val;
-	struct marker *m = prop->val.markers;
+	const char *p = prop->val.val + offset;
 	int nnotstring = 0, nnul = 0;
-	int nnotstringlbl = 0, nnotcelllbl = 0;
 	int i;
 
 	for (i = 0; i < len; i++) {
@@ -199,30 +196,49 @@ static enum markertype guess_value_type(struct property *prop)
 			nnul++;
 	}
 
-	for_each_marker_of_type(m, LABEL) {
-		if ((m->offset > 0) && (prop->val.val[m->offset - 1] != '\0'))
-			nnotstringlbl++;
-		if ((m->offset % sizeof(cell_t)) != 0)
-			nnotcelllbl++;
-	}
-
-	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul <= (len-nnul))
-	    && (nnotstringlbl == 0)) {
+	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul <= len - nnul)) {
 		if (nnul > 1)
-			add_string_markers(prop);
+			add_string_markers(prop, offset, len);
 		return TYPE_STRING;
-	} else if (((len % sizeof(cell_t)) == 0) && (nnotcelllbl == 0)) {
+	} else if ((len % sizeof(cell_t)) == 0) {
 		return TYPE_UINT32;
 	}
 
 	return TYPE_UINT8;
 }
 
+static void guess_type_markers(struct property *prop)
+{
+	struct marker **m = &prop->val.markers;
+	unsigned int offset = 0;
+
+	for (m = &prop->val.markers; *m; m = &((*m)->next)) {
+		if (is_type_marker((*m)->type))
+			/* assume the whole property is already marked */
+			return;
+
+		if ((*m)->offset > offset) {
+			m = add_marker(m, guess_value_type(prop, offset, (*m)->offset - offset),
+				       offset, NULL);
+
+			offset = (*m)->offset;
+		}
+
+		if ((*m)->type == REF_PHANDLE) {
+			m = add_marker(m, TYPE_UINT32, offset, NULL);
+			offset += 4;
+		}
+	}
+
+	if (offset < prop->val.len)
+		add_marker(m, guess_value_type(prop, offset, prop->val.len - offset),
+			   offset, NULL);
+}
+
 static void write_propval(FILE *f, struct property *prop)
 {
 	size_t len = prop->val.len;
-	struct marker *m = prop->val.markers;
-	struct marker dummy_marker;
+	struct marker *m;
 	enum markertype emit_type = TYPE_NONE;
 	char *srcstr;
 
@@ -241,14 +257,8 @@ static void write_propval(FILE *f, struct property *prop)
 
 	fprintf(f, " =");
 
-	if (!next_type_marker(m)) {
-		/* data type information missing, need to guess */
-		dummy_marker.type = guess_value_type(prop);
-		dummy_marker.next = prop->val.markers;
-		dummy_marker.offset = 0;
-		dummy_marker.ref = NULL;
-		m = &dummy_marker;
-	}
+	guess_type_markers(prop);
+	m = prop->val.markers;
 
 	for_each_marker(m) {
 		size_t chunk_len = (m->next ? m->next->offset : len) - m->offset;
-- 
2.51.0

