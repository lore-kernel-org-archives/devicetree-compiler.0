Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B175D221DA5
	for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707355; cv=none; b=SWp0WAmcsQ+5rsA5/r7jSWgXa5tpiGyszxfugaZxIVxsrabPO9h5mOM9+LlaksUkHKpTK1TxcUbvRsvzycpXHxNHKCok9DMbyynRa+a/n1tLa7FEZ/b90dUMsQ4at5nTU8aNLaNGu43GH8PNW/nsIaLF0S7NVTTA7eh7QNJ4AB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707355; c=relaxed/simple;
	bh=jSXoWqh1W8sGDqJ9EVayjegv2mGIiIFzf0bvuE5yGAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fSXg68AvXJx+v2ugkW+wktxvF7kNkPmDFnwsqeSo+X5x0J1/J6firfyNmSZZVVPvILNQ/O59M7cJfcpC1328MmrtDZ4v/mbSiSQWBqKGR2bB0zWg/E11A1Pj/9CeTfU+jbQYaA4ObtJAjWZkKdvLHbVBaFd9T+f6O+4MT0lDR8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=NP0FUvS4; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="NP0FUvS4"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2feae794508so8496572a91.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1741707353; x=1742312153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WS183+aTy87qrmk2Z5QzPm03reRzYXF6EmocLCDoh4g=;
        b=NP0FUvS4VK1z01wKhm6GEssgCDiOQuGmDDHvR0odwA5KgOCbljsLwZDHkOgp85QGnR
         /RTkDhglwKzdjhxcNIZ4JaTrMs+LkdbcM7ro6N7Zd8BbfCIg0wXteQo7Nk6R7d4SnQr2
         sjNnWBMP0k11PQG+alzTyouevxPxV0zv221Xc6uhHO5oYgP4wHUQSt/swX7Ta14/nw6H
         VGZu0N5gJOisG4m3s5SCmPrjvlgMrdW9P4N1VNboxIsVWN6TlNMqJNJ//GicfPKRLclC
         Yxzyfl95xc6ANyLJ6LPeqiwGxTABzYdV5y1rc0tgceq8UFWeomEh+wPkkTfidMA/0lS5
         igyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707353; x=1742312153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WS183+aTy87qrmk2Z5QzPm03reRzYXF6EmocLCDoh4g=;
        b=h7cKRB8dSub762KXNvcv/1psfiY1W5OYYxb4sN4G/iSRis6/X6PpBY/8mwD4eBt8wk
         m6JC8WqIP6H4ymm3KpLWfhUe1U6JkUss2IS6kS0UZ69kWwsf08oa3DtCaIC2+ZYue4LU
         W/Xkcn+m1VwRDoezbN0qLmCHaC9Rgt90E1nKIAxICfNPO/gwiHQGCBMTvchIEFF7jzki
         h+ftRaU3r6v9IA+w0ufAL9/xWLc1rmVcx4/eaQlc1xe15R8Apw3vAqA/lyw4AB/Hg4rS
         6SGNRSEH1B61gZGdIp57GP4TeKdx994j0gt4+sD9DfMkLkhXFFha9udRhDRGXfFm7WPa
         A6aw==
X-Gm-Message-State: AOJu0YwEpTc7Ml3L5LHOm8YhDKi/AzbBlOrutmXqC0nHOICsGBjQf+DG
	Cj0vrk6urFARMVWmxLby3rm55bffrq1/d6gE7dxP4yuryFbKPjL/VzZrG3edug==
X-Gm-Gg: ASbGncsC6kTvyRpqZkKexSjvsVrqBcb+EPj1dovAhvQfI+uXwUNmDvygZQV+VQ5DXWO
	nxCB+BjLKvO0if5C0Oi2vPabbsky47HdsUcnMBv638s7/oKgylmcmlKry5bpdBl89oSEzJbqL8B
	dLHSyNG3hC+J657UHVKT+XQ1C4HwcPno2d+k4RCq4J4ruXW/4XPK5Bq69q9nb71Jrgli6entvrd
	UeTbFccbe5IQVQxDyJM66Q5CW+xwWNIBu8Rg9Lm1FKOAqyxftbsHG0ubXEM2uiwaUCIdRClH/bH
	KxL3xNXbuQdC5gfa5cXA86OjJ5fd5eOVV94uIrAX2LpyaS3UdEI=
X-Google-Smtp-Source: AGHT+IE3Q8smJljve+A+kgxVqDGYFfsapKxAnAkKs3IPy/6quD5bHgMLqXjYCNSy6gmuGPeZNKFzKQ==
X-Received: by 2002:a17:90b:2e51:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-2ff7cf20acemr24777735a91.31.1741707352814;
        Tue, 11 Mar 2025 08:35:52 -0700 (PDT)
Received: from [172.16.118.31] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e822bd2sm12030413a91.41.2025.03.11.08.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 08:35:52 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 11 Mar 2025 21:05:37 +0530
Subject: [PATCH v2 1/4] Add alloc_marker
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-previous-value-v2-1-e4a8611e956f@beagleboard.org>
References: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
In-Reply-To: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=jSXoWqh1W8sGDqJ9EVayjegv2mGIiIFzf0bvuE5yGAs=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBn0FhLDZasLcX73DAwmQiB6cGsIJ7iiXslrHYlc
 vNf/+UY/jmJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ9BYSwAKCRAFzvXHieVa
 dLWcEACYOPhnrdrnZWStsekIY3ATesnJA7ZwtJCN8c5m6mDjPRXO/sv2i69YoAPZHk1f5R1qt6q
 RR0T/dn0W3WAeyAuEfTF6BgBR1PaalzcBSteQVWl9xGXZdFWwFNU9HcgP6VQCEkIvH7VxO2XzG1
 UwSpQSeriQHwjiZlymZjR1qv1z100K6YewC4APbe80ImXoIzl+IvflrEQ5g3/G6MA3XBKFc0VFv
 FGOilXp8zBsASV/1q0eFHddLNewjF9H0ISzWt0WOy6vh/I+uCR7rBjqCvbgg13YoyWKkG123y3t
 sCYyUljcFMJmldYQ7lN95L+4fHswNI8IyIcfpQ4FRDjHA8c8Ltm4DzDiXBxNz+gTX06HVDTHiTa
 WdshcLbQ6K6evmxlZW6on/4uM+TLkFn2iuGEhrckPUrr/0MHzxbrH1sNJrf/EyoDopCcY4JXgb+
 itYm9zJoXLGGNSAyyJdG+6oAtFPQM/Rde/xxxHvlCQ/jwxmi88Q4cP6ZLncTEvluvCiVTy2VK5w
 yQ7x6PvXtjxE8W1T/KygtG3IwtdUzd45WDiVwVC2CA1u+BoOrPE9NHl0vRSiCFxZJekIpBGxy42
 OfhFTFogp0VWObVWPpwm5td0jjXSm8QtRV8YK/3DxPC8GfZ3ST0bCqynsneeyaDgWCgAimTN96w
 tr6AJ6DiZruotaA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

- Add helper to allocate new marker

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 data.c | 20 +++++++++++++++-----
 dtc.h  |  2 ++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/data.c b/data.c
index 14734233ad8b7ebd38c3e62442b81aae66601806..913796f2e664d07cdc48e0cbf2ab5d6fe9978072 100644
--- a/data.c
+++ b/data.c
@@ -228,11 +228,7 @@ struct data data_add_marker(struct data d, enum markertype type, char *ref)
 {
 	struct marker *m;
 
-	m = xmalloc(sizeof(*m));
-	m->offset = d.len;
-	m->type = type;
-	m->ref = ref;
-	m->next = NULL;
+	m = alloc_marker(d.len, type, ref);
 
 	return data_append_markers(d, m);
 }
@@ -254,3 +250,17 @@ bool data_is_one_string(struct data d)
 
 	return true;
 }
+
+struct marker *alloc_marker(unsigned int offset, enum markertype type,
+			    char *ref)
+{
+	struct marker *m;
+
+	m = xmalloc(sizeof(*m));
+	m->offset = offset;
+	m->type = type;
+	m->ref = ref;
+	m->next = NULL;
+
+	return m;
+}
diff --git a/dtc.h b/dtc.h
index 4c4aaca1fc417c9d93e904e64b2c40216ee1b093..86928e1eea9764fe5d74d6dbb987589d65d54b66 100644
--- a/dtc.h
+++ b/dtc.h
@@ -183,6 +183,8 @@ struct data data_append_byte(struct data d, uint8_t byte);
 struct data data_append_zeroes(struct data d, int len);
 struct data data_append_align(struct data d, int align);
 
+struct marker *alloc_marker(unsigned int offset, enum markertype type,
+			    char *ref);
 struct data data_add_marker(struct data d, enum markertype type, char *ref);
 
 bool data_is_one_string(struct data d);

-- 
2.48.1

