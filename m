Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964831A046
	for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695535; cv=none; b=TxlQIgeOAQItK1/rh5y465y2W5BSO87GKbSTLKWyAfN+VrarI0bP3H4VZy6e4UxVb4+wxzURlzk6kguVjcXKKN22wjFtm3YttfoYL2qlQdfHrmlGvip5AJ0SklAhy/CExn/m//gm2B+G2zOWs8dUYuyHFtBJL3NiP+UD4prKX9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695535; c=relaxed/simple;
	bh=yjTe5Prc9HdGZDkWcBqzpr5oiSzonKHDrM7yVBgFV5o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFzLEGG2TTxgpMANVEhHg8JANLEezTzyUkcAbzmcIGS4smhzc6FSM1EepMpVt8PaijQ0Bk53g/Y14ruHVllNaGOK4PNzRSGouRIk3dz+vqfnizkH3HRhvjyzrDfJM/u3kGdhBWaVIcL3GfTeYH2gHwblP0IAU+gjRru1iglEKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cjiomHPS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cjiomHPS"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9e41669d6so5017689f8f.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755695531; x=1756300331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwxyZJBc7DAbHvZEWDj/iYHcq8HxFdLglIKyz39o07M=;
        b=cjiomHPSZ+eWtL3hm0hQCdyQBs9k4e/3wlgQXz48zTbZlkU5uv4+UzDWCxEByrKTDG
         H8AzayhVuDmje3CUcL6Ixnw8yFytIjRRJvY9Fqb6NvHE/usuMHd/13W1qLuoXiG8bt9h
         bPsUotBolXtx/uTwhw00mOPzmLwNJpkHTIiCySv+vrVVbHRGb9Y7+9mmhse9LJM5+Q2R
         6pGsdC6DeiPcvi/BBkqIgJR+7xk5rocZ1+EehiomVVWQmo9h4DjA40NH0YX6DtWE4E37
         2kP3c5EcGOamyoxYODctL7SxanJ3D0gsT2Sw3LDsHSMJSLkvyAFq3lNoWXHDdEvi/nqz
         rJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695531; x=1756300331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwxyZJBc7DAbHvZEWDj/iYHcq8HxFdLglIKyz39o07M=;
        b=QOvpdJ7Ib2ITWYCtXbOTtkeBB2fSa8GmmW3hJ4SMYTJf6oi014vzEiQk3aLAXzGcDZ
         tZM1cyiQ7C7HCeQ9n0MTj2OA+iRJSEJRym/tBbreW4EebwW1KR+JFU9IX8P0IL9NFYiS
         GLUjq9ZCvW3k93lEexJp1KRt/mdC/fFPPcKBbWWoVY8Sh0wEKfOROIOWWQDiJYmcKCRT
         +kiDychmYakwt2KvdYvvUCQ3fLh/FH7/EiXI4kxz3tpgoWHp37ZAD46I4WFlJXngRn3a
         7VlnCcLO6i11DrNmWrfFc/895GJ+hdW9jgwUVsrAMqsPXTUxPofedr2GIHWg4i4hWJAl
         leNQ==
X-Gm-Message-State: AOJu0YyMxYF9tCfvgMTvneuLbvzJuCdlypgjVBPYXMdpj7F6ChlMTw9h
	QdpPWbjOc+avu8+/lnF3nOn95FHGZaAWg3cXMiVyN6Uk2AbAo1VRNx2p1oQ3Ac+85jTKyuo/sws
	vP/lT
X-Gm-Gg: ASbGncs/Rk55MdjBBlWztvrUWW6AbZDftzk0TiAjvlyiMdC76S+HgMxA55rhTxwf670
	vRNbJhmM558Qc7IGDL8GnbhUWpfNQXwgkWYK6+LOksJ5SyBViYXiOmjXfkrMLTDPsswlRuGbTue
	skZMS/TwP0XmMCVXuCwMLwveiHXHv7fHSB7fHfGPyf4V0QHXdLCLPQnMKdRY1vafNVqZJrmLpiv
	PtuvkqEiqrguqu0H3rTepiOYBpto6DfkzQQGhnrZS/845pwNdmIUoncp88zPXiWUMVUcOlhdgFN
	3WqhLCra+UyfoEo2CyoINc+ovc7OzrCk3xBGxrtIq3rM7TOGP17orlmCTPCmNG5jwY6ze/DnNxC
	qjFUz/cPc9BRhRKE4d7rjkCsW3v+4JLhifJnG6PGJqKZV0UEfwU0wxfJGMT+iLOGM
X-Google-Smtp-Source: AGHT+IFNI4k9EHip56liwqqOFW54pdh2NyKTnC0wBnbAKSDrTd9TYShCuydJtt1QyhL8RBKz8lDrCA==
X-Received: by 2002:a05:6000:2586:b0:3c0:7e02:67ba with SMTP id ffacd0b85a97d-3c3304d1dafmr2092289f8f.62.1755695531489;
        Wed, 20 Aug 2025 06:12:11 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b47c29b78sm32899825e9.1.2025.08.20.06.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:12:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 3/6] Improve type guessing when compiling to dts format
Date: Wed, 20 Aug 2025 15:11:29 +0200
Message-ID: <e3584b641b6c81199716d5ff745de821fe4446a3.1755692822.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
References: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4271; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yjTe5Prc9HdGZDkWcBqzpr5oiSzonKHDrM7yVBgFV5o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBopcmUGWNbEOuhHngZbYs6HiFf1aTQQrKxYGvHy ymTZym/LWyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaKXJlAAKCRCPgPtYfRL+ TurZB/0boAPatLZiYhX6rb2tNrENNC07G3R+1UMc/rSOZEP94JHgTx2cYNS8h4Tk634oIX8fbYN 0rgxzqWbLtuqB1ViN4Gk0xzHHQE7mr3Ao0glTZdnMp7UbvH1zxzGAwITzGH8+Yf8gXRZp0QYa+q +2pwPDwWVc2t97xauheTOmezd0HcmD7u/E/+UUX88ha3RlGzWnUCsc5uee2fRflmbITYpGAr1ae IzEXmyoOqERULHA7Lk9zdTUpkIwyb1/p5j1D1s6uHHL7GOYFNoUqEAPCNht0NkbxQXvNcexFWUb MM/IVMtTbYDZVspHNH//Z0KzE7nmn9TB+o9+skoQVARvqyTf
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
2.50.1

