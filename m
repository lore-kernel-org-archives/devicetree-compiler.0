Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01151C5D67
	for <devicetree-compiler@vger.kernel.org>; Sat,  1 Mar 2025 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740835562; cv=none; b=qEn5V56eQ3cgcKLHCwJojPVV7QqEfzr4mNWbyvsw0Y2LUCxfUJFNOrDkS7zpQrFVcqOauOqh7vY0oPHGV2ZVSYa/Tyo3tXt0WHVKHAtHplQUCZqCXdecMNnY3dTqNvFrvMcFQmSFnlla8VHRfuME6kWDvRgjsE1s8bv1vxECXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740835562; c=relaxed/simple;
	bh=b/rKzGIcLOEzWGpUcxqsHWca2p5zCgRDc/IGgecuZHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UE9VPToXSPmIh1EQlIZnOCT0YC9uVCT8UnL2filBenM3whe+nXCkEgj+1i2o5JALA4/glMaK42wE2KiwvXToujMywN+mS9MfgxokbrzPRhwi2j2l4jHCl3qDUJaB2yOdJsqu5h5V5xShWXTAxavIQ4txsZBxSooWX+mIS2zF2+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=WhSFYEt5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="WhSFYEt5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22359001f1aso66583815ad.3
        for <devicetree-compiler@vger.kernel.org>; Sat, 01 Mar 2025 05:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1740835560; x=1741440360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7g99d2mV0grWzyIgafFTXuDGk4Ys5P87oL1w4zIluI=;
        b=WhSFYEt5PswVJ336eBSwtBGaOEXzBFOuN1E0xilGkqE8r59ytD81Lb0IuXGY2nAAlX
         hm+ihnrH9v78LnAnoQm5N2eetxtIIgn/nMQXPGaeBgzC8/VlW09zVRA7OkUuOLaAgNX/
         4dlxEn1JV9LHjJMBjo53hqf+4GPFPzfuuS3V2s+8fXh4q/LjfIi5KA/zDacofpotWXFL
         PXbVoO47pYzy58aPv4W6Sow3vIvCHn1AiZW8XgLpTU20su+dlmjmmRn3sEdwyXovEtTJ
         W9Y6bd3Ixia8t85wDFuJTQjvWcmloSMHt6387BSuKd3HJS/VtAJrkLHKAvSWAqoyA4+1
         fTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740835560; x=1741440360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7g99d2mV0grWzyIgafFTXuDGk4Ys5P87oL1w4zIluI=;
        b=LL5k0hlQvgclxnKH+asmbCM+pIOQXeMXjKgaiQGskcukeVqu5WI+oKmxGcaeh3Fq1g
         mAv6a2dq68La9GsnIYw6oXYY5bO75HiYaQ3IZ6WAQCdTW0jm1vHjCEQglk/FjrTPVDXc
         4k/odgxCwyGWtqFDKTPWzlsEJtxLazgEIVaB5QAOJIYOpLCNbdGWA8Bir8lNerOrSMX6
         V3LjjRwj3+Bhfc7mqZU7d2DHDOQ+bouTDMsCSgK5kQQ0bFSmbgYKPdlFbdzVOIL/TQRC
         BF3EeVLAsIxsc4ZeyYAlTEx+jwjNOvRIL2ajJXZm1hY2BZB80gtPTpptuRn/F6zDduT0
         2oVA==
X-Gm-Message-State: AOJu0YxNA73wTHMVkRc+YLHGvz2/0LiebMIjZ/wIWq/peSeDM5GwbDfP
	wuLByamjyiOuF80vWjb1y14aQkqS9iTSX4pml77fobgIkoxTLQUjWCp4C6Zt6Q==
X-Gm-Gg: ASbGncsJ6o9eaY2tuk6GsDgq5UzvH8CO2Y8AR+XDFLPk62q8OxbxjviJaoecC+frV6i
	YYhgcHzyj+yd+/ezXQ/T8XNdYh0s4lOjOYO1hFfwmNTG0mxvkemLpPXIg8kaHWCuFvgqeWbbogA
	J1uOegt+BEzL910mf7IX+ncNQnbQdu8obe1OVP4QfCZ9zYsnCaioXwTCcAGm1Gug3YMD+Gn4j35
	g6kulzt6IWpGm0uHs9enIvyY3niE7VmKC3t/aeZChztPF633scxFETp/r6Q02j37YO6Hmwu7uRd
	I+/B/ABKxjcvFowB5sdY/FUYRRIc+9qdaIz0a6d+VPI5MDWRFeSM
X-Google-Smtp-Source: AGHT+IHD9lHjNJ2EQUVYMPIAR3S8aUM327L+XPeiJnZqIy7my4E0w9SK5usTHXCdjMFX7O+oSPzzwg==
X-Received: by 2002:a05:6a20:3d87:b0:1f0:ee68:aab4 with SMTP id adf61e73a8af0-1f2f4d224cemr12073975637.23.1740835560155;
        Sat, 01 Mar 2025 05:26:00 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363cd5c39bsm764618b3a.174.2025.03.01.05.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 05:25:59 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sat, 01 Mar 2025 18:55:02 +0530
Subject: [PATCH 1/3] Add alloc_marker
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-previous-value-v1-1-71d612eb0ea9@beagleboard.org>
References: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
In-Reply-To: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=b/rKzGIcLOEzWGpUcxqsHWca2p5zCgRDc/IGgecuZHI=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnwwreKJe0IBksxD0lkyvFZHfKD9UaOSyyc3PhM
 pBOhygGj1qJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ8MK3gAKCRAFzvXHieVa
 dMneEADGKgBSxkRv8+aNgFkvQ7oRa13bSz50dvVhiWAQ4CrWV6iM5UWRNoel5NtlX9GTzq/BXtT
 //qgwnqKW1pxCm4LWpsvycWB1BOmeyu9seqeEHCXwWBDW7MBxj7cfkEJeaq4LzGWffkJP6dxo7i
 cGhrkHk5xfgLAJxQ/bMMqBr8PETlvx9NqLXlgri0njUiRkhP5KPCGRTjrTt4beyt6oVzumXHXlJ
 XjQiPmqUbaRF00CezYaRVuxzJg/RoyZ1u+6zZzepICl971qDqRnSGviFFobhcoHAWtT9pMZO9Ut
 6HUsnf3zJ3vIgAxIpF9tqmwK7628hyRiunOwSfsaA4SkbdAo0kMtxIlqlt2IhuFF9ft1+pulwx5
 vDT2QvVdm1B2rKU+m/nOHJW0p6E3O6H09w/HIDOz8luexn3X+VG7utkXsZchxxoLcZDtachOAOo
 HO/tF9i72vRiS5W1jYRoDMaquXSyzSP3uyE4u2Mosr1hWQUK4iUdFpHtWa7jp7Y+7GpnWhpJwmm
 ffufgZHc2HbNcsQHst8OnhCiN49A6/KdFpeqydmlxwwSldypbv4ZvmaM7KCNkPCY32ejWz+OKBO
 0XWvr5x9G/FfiX5X0YnzL9AsuOS9rlnWttVWivHz1ygoDcLX8M0xsRK4ZVMYKzpXGL8UvfJtl1/
 4edQjI7jJesz0tg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

- Add helper to allocate new marker

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

