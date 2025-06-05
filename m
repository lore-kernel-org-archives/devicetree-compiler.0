Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC3C3C17
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Jun 2025 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120557; cv=none; b=Sp+nhkavXB0T/WuMSzIKXMwDijcto3/2WBOJDpSHi6FD36HkEcOdtWohCnh8DsS/7dNJA6Rx1y+MMGIrR3KsBwyqGshwtuBoN9WaENp+oiyXaEvkbQuJT8hTbMwUuMtiTQ/fiG9F+Gxm8nlCe8H+2S+dpLOxHonCHADJ3zsNEiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120557; c=relaxed/simple;
	bh=QZQX+hmSoUSk1tP8FkOlTFR4/fF1gZYuzU8pyW720NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgDblM1GgvNL1xXSGYcYyzXo7y9+q0SMTIg+9TLx9V4tAYW3J9dmMFToaNCWuLUtt43Ld1iw4u6Mp/BPndy/Z1/472YPg7pkyjOKW3fRMfIZM1G6Ruhpjq6/VZpNc4Dc07kCy9nkAegUbr4JuIlG+ojGVAcpSr3QbwAMlcSPA7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=njKcDM6v; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="njKcDM6v"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so749908b3a.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 05 Jun 2025 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1749120554; x=1749725354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tp5Qq6Okv2fGrKqpdM6rJsY6NZEeH08eL0NyAIP9Fxo=;
        b=njKcDM6vaXMAOdFLsSzn5d+01e06ffhOODCcF2XM1KvzomhcB1R4wQ+UkAlWnbjKrP
         hHAoOWNMN8Vzy3OqlO2vLWv5IgU25djU17qtYa4j7tra89OWoWMABVjmtalyqLWf8Bvw
         rqvB1tCMMRYpdsKjzJ4b8uAZAhUWur9GXmXFTKU0FK12z2lNhgjaV/ArsYdURPj2IIdv
         ZYhurVGOiUmY8wTx73KlA9reVTucZVP+04K/M41YKsc5RyHjnB6Rctc0k5XCmw5+dhxS
         0wRre2WuqDfS5rq6VHfHDEc9gJd59WuNjyAPeJM2hnCjUZ0B/a7W+KhdKcahzGMaWZp2
         6jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120554; x=1749725354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tp5Qq6Okv2fGrKqpdM6rJsY6NZEeH08eL0NyAIP9Fxo=;
        b=FC8KrsQCyhRJWxzvx1VgO2eGGJ84g072+u3/hslJgzRWC098Pl3jjRfpJ5rYOb7hbf
         zOXXxQyuIp2foKMf/nAcRtHXODPG5JGVFedSP6JlAChwOH+WffjeH7xuLUJ29I6fBeov
         4CanJX5i0Q0i5pt9DymMaMAhFE0rStlI0j0Ktc2bGlBjyUt/NLfYu7UD+euGasm7gV8K
         ZqFoutgiMl2zD2+w3W6/AZqLn17sSO/9Ge8zDlcs8sDA/16zIdLNOauX57WBgpJGCK/D
         EAnb5uyFHdbHfqTPOGnms3364xR5eyugVlUkrP11LjVzHDIaanwrgshQudZP/vJMP6QN
         WsBA==
X-Gm-Message-State: AOJu0YzPAW6jJBat8qvRYARvnEMJ9LaaviedNgJNzSu5YaGRwh5h14Bn
	MIN4RjsXfcslLY0h6Q+MTdMskdjKCEqErJ/IX1IQuD8/7mPf/0ag89O05pl3ddkwZw==
X-Gm-Gg: ASbGncvf/LaBsq1+jjcIQYGoaDUeJwaEhPEbjWt1Tv9TeF0sqyU/1u24VQlgA9dEESV
	I682jJH1lU1GNcV6JgKRapqsLzUxAVx7nVYPbPUg983zYLNQ48Q7cPgtV3NiI/+FkCyj2MXOLX7
	e64na9QYgNMmSBZQs2lmtTMVIJsajMtHlFtCW2qv5DwXuemcwZAzOU/i9yXqCxmpj4l63P+IC5h
	NxfZx+q1lola5CPImy7Q3LT0jR6hYgqhcfecnAbfpJGgFi6dg9aUTTnYJsrVlqoTdrmJiYVNHIY
	520XIpIWCeua3pubivHlPMJTGyj1JiLVlZ9d/sVFMIndZCyaOUhiMKu9blxUwQ==
X-Google-Smtp-Source: AGHT+IFImWMmkNfHwgDQjV0q0E8iZZi8DVTziqmQGBv7YWulEAwP3P3eJmzXuUe7MIlgRxpBOxqGyw==
X-Received: by 2002:a05:6a21:8cca:b0:21a:d8ed:38a3 with SMTP id adf61e73a8af0-21d22d3db1cmr10219304637.40.1749120554107;
        Thu, 05 Jun 2025 03:49:14 -0700 (PDT)
Received: from [192.168.1.11] ([2401:4900:8899:bab8:9a99:8bde:e080:9339])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd41edsm12997594b3a.146.2025.06.05.03.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:49:13 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 05 Jun 2025 16:18:07 +0530
Subject: [PATCH v3 2/4] dtc: Add data_insert_data function
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-previous-value-v3-2-0983d0733a07@beagleboard.org>
References: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
In-Reply-To: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=QZQX+hmSoUSk1tP8FkOlTFR4/fF1gZYuzU8pyW720NA=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBoQXYdW/b0N8jpTFoPdRtvyLww9VS+0ZuDCPgU0
 y92wJLZBeOJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaEF2HQAKCRAFzvXHieVa
 dMNeD/9CI35Yvgtk5ZIUYp80u1EUrFol7e9xlZgrfQ+pjs4LTmqC6hRXvoXn6pyfIwNalxGRXij
 EMsfjygDF/QO+p2gUhE+6JLuX4OZUoDvzKYixei9XIE7ZMnf4dMj8NNugENVYI0vQ86yKImvbFl
 Tp4cEH49v26Z9Ty4dOoQWrCsiENepWGckGM0Fpg2v1q0xZfiOigbeohQvdlY9dTj5HdJNyERfXH
 92g+VYKAh7zMtXFkF6E7iYqWFrUIplE1+r2BoekN85nx5XUZGuksdcAnXLPxN2J3iZYqLbc0UMY
 GqOTY4SYBDH00w6RMZlPaS76kOSA98CWbmUoQzBhyGkqre8DPE/+F1JUL0eyrAmwEyEtD60Cj1V
 6KtjL4IK66Src9I5Dehz8YQG2fd6gNML3Qs/J4PB0TRUmIQ2gDJ0tZQ+TG6iVVrpxtX019O999C
 oY0fucmfZbUwJcfS3O1FDbo+zmhud/kYGVFvvj6eJ6gdoj8jAKfGSMRLmVUyNAvjfItSDWbH8+U
 nIua/t7rt3+K17HaCWKGIPgZ5RlhZp2Z/SyqpBZpSS9oho9LahQTwhS1nzv6tJC14E5bHTJka1O
 ZVXYGPK7373xOTCYfYkvHKd6fDtfOrgDLD7+a0IrVryJ/QwUclWG/53JolGCE9uKkN8UMHN+0uC
 DRZ0gXg/+I5Qo+w==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add helper function to insert a data struct into another.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 data.c | 27 +++++++++++++++++++++++++++
 dtc.h  |  1 +
 2 files changed, 28 insertions(+)

diff --git a/data.c b/data.c
index 913796f2e664d07cdc48e0cbf2ab5d6fe9978072..5b25aa060416134be430aebe33c9cce49515297f 100644
--- a/data.c
+++ b/data.c
@@ -251,6 +251,33 @@ bool data_is_one_string(struct data d)
 	return true;
 }
 
+struct data data_insert_data(struct data d, struct marker *m, struct data old)
+{
+	unsigned int offset = m->offset;
+	struct marker *next = m->next;
+	struct marker *marker;
+	struct data new_data;
+	char *ref;
+
+	new_data = data_insert_at_marker(d, m, old.val, old.len);
+
+	/* Copy all markers from old value */
+	marker = old.markers;
+	for_each_marker(marker) {
+		ref = NULL;
+
+		if (marker->ref)
+			ref = xstrdup(marker->ref);
+
+		m->next = alloc_marker(marker->offset + offset, marker->type,
+				       ref);
+		m = m->next;
+	}
+	m->next = next;
+
+	return new_data;
+}
+
 struct marker *alloc_marker(unsigned int offset, enum markertype type,
 			    char *ref)
 {
diff --git a/dtc.h b/dtc.h
index bd803397449a4b71ff89944ea125cefb96c4dd21..3a220b9afc99f92ea57d50d348eb0872bc779818 100644
--- a/dtc.h
+++ b/dtc.h
@@ -182,6 +182,7 @@ struct data data_append_addr(struct data d, uint64_t addr);
 struct data data_append_byte(struct data d, uint8_t byte);
 struct data data_append_zeroes(struct data d, int len);
 struct data data_append_align(struct data d, int align);
+struct data data_insert_data(struct data d, struct marker *m, struct data old);
 
 struct marker *alloc_marker(unsigned int offset, enum markertype type,
 			    char *ref);

-- 
2.49.0

