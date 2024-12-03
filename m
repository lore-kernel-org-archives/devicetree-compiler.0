Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F671E32A2
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733250625; cv=none; b=K2qRCcKsEzgdBwelQ40htL6SocAXNGzl2/WDZRxYHmLLFkuqxQGeGkTizHzXsnivweJye/wp4+Ke+JHRfaenSrr1Gbs4GRpyrjgKOGSH4bt4nRBb8XKRN0UryWmCZ11TUtsZa2Ch1XKeV3MhCj+rDSSXX68zQQvmVXhe+KysRZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733250625; c=relaxed/simple;
	bh=igWr0FPgByVZaIFdg8WO6IZImcps0UPo0dzrAXuC7YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ge/367wcI/Pfi2jHGyXKKRsJ6qDONXQy5XRgGMLwB7eObp/lkjBVUt4k5c1RLUDMn4Y6BzsJOZyGLYeP5XU4bhTHms+F/iEZLi9pZ1NvfLAtKGkd67anwyILYZdATWVSas6aX3t+X74fMLy37NTRi4nOOkzxZZGWy7y1hX0yW4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=FL+CPtIM; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="FL+CPtIM"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-724d8422f37so4791317b3a.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Dec 2024 10:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733250623; x=1733855423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Li1jN8QqKPqMQ0YxafX3PmH0+kFEPdA0MpjU4mLYFFA=;
        b=FL+CPtIM5EePX3vM49O7unrKeZAOmdBVVWHGZ1tSZzFMea3ZKIruODoeQH9FvTqAMt
         ZuzOcjqvrx7MbAleBPgTDMjDC3noad8CmMoW6Dt6mOJrefJFZJ4muHf9kDNeeGMskIhP
         Dwwz2t8bV2loxsqy+mrFm6jIa1fexv3b5ZwZ2RNnusYPM3wNCWHD15p8RLnBeDCDU8b7
         iMW9ALB4x+JfuqE9Ko3qbCq7EhY0ahwE5aVaQHYkk9xlmed20+cQnvOCn+W33bMkqKLR
         dfvxoVvlgWFJFNfSHLffKwc+6bRAv7hxU9QT3cnOmxBYeCxjr4b6FSbDZoC9QuYGVgST
         2UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733250623; x=1733855423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Li1jN8QqKPqMQ0YxafX3PmH0+kFEPdA0MpjU4mLYFFA=;
        b=VwLNph/M3RGpbjEFprQc+M3kuwjPudMPfXqDGL+U8+84MPLxTtsWSoGRtWmNvHIidb
         affQjd2YoH/8P7ISb/JGi07GyCNNaCj2t3+DiclYTS30QjDDaVOmBm/7r//wx6+HBX5P
         OcQyWDfc1gpF0msUpqjpSp//HqU+aIpzaKCFpgvA9ilmH/+xne80w1ducCB8BK5VMzaE
         Dzhxl+1tS9+U46HXvZyyX/5Tnswq0vDqX8E1iHgyUKjbZ21eEzsP0/2/6cfY6T/KkF3M
         Xwh/3bAcX9jqh1CZA0lhnIAJcUDqO31yozducWNaVEit7S3z/G3rn84IqztblI0vPh78
         eKSA==
X-Gm-Message-State: AOJu0YxTKw/R++WgDqJcOLdFRhX733pBMCR5OVfX4WAOQut4BPmtZsOb
	wJyJGDKIQXAFGKj3oD65OZtW2pLkY0WaR4AVqgvApyamFQDgS290W6huuJofVg==
X-Gm-Gg: ASbGnctOu0/tQZTVMpDmv1E/ZUGzvhZCb1lb2RZpGtR+w65y58SFInrCuQE/d8zNJFz
	eYDDzuVRP1Gqco2gjK3LmlfJv11y7PAsvNeTKkcSRxBI+mrNgb6WLI7+aw0jCsc6JZ1QwgFTj9Q
	OpnufOYaaETpgOHY5K2sdB3eSkKPXhPuzPeNGEpuSdsj0meCeVNTQDDgjkeMysHSeNL5HVDctSv
	rD+xMY0ckiZxQOOsrWKfcvygA6wWTHV2BWJaqoxboZ7cI8hFBINAJ+o
X-Google-Smtp-Source: AGHT+IEjyyNu6OCUwVPo9VoxpJJ9HVnrD9/trL1h4bMMWomq+P3F45GPzXmEspFF5uakuwnVtPU3GQ==
X-Received: by 2002:a17:903:22cf:b0:20d:2848:2bee with SMTP id d9443c01a7336-215bd1c51f3mr49139785ad.16.1733250623006;
        Tue, 03 Dec 2024 10:30:23 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215c1317af3sm14364215ad.161.2024.12.03.10.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 10:30:22 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Dec 2024 23:59:59 +0530
Subject: [PATCH 1/4] libfdt: add fdt_get_property_namelen_w()
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-setprop-namelen-v1-1-d1ea333fbd6c@beagleboard.org>
References: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>
In-Reply-To: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=igWr0FPgByVZaIFdg8WO6IZImcps0UPo0dzrAXuC7YE=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnT040YbqQ++Y7eys1h7wa7GYDVppuxltKKMhmO
 iEv0NoOoRmJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ09ONAAKCRAFzvXHieVa
 dPBzEACqpjWq0Sj5wfq4ox1zEDnkJzl5JaubCbyqIzM+h5cJVzr8JKLepcKNBWMKtltajpc9C21
 wd2IZa/kyelB+HiLuZSZEb6uYmGplK+GU8IX3NqwicizPG88r+3JRhcC4KIB2BFWpQ2wexAWY71
 l6nYxxZ7Spe0wowixL02IphdcrDyGKLm09ZlwUNN953wWXD/t5+21pdW82Cu9zQO281Z3UzPNkt
 nG5TUt8sSAVTk7iblJJxRbP4SuQc6h/8wbafh8kpjK572KEq72pYvEiqQ5yEXw5F2Q/kqN8JO3v
 plCWQk5+Tvma6h+fQvf5hForu885fgLE1qk8gWTPXintjsja0vgihHT9Swd6gVaYzNVe4n+B8MX
 F+s/A+KoHLVutWXQz/6XPmcdIWbbkMPKedDmxIFdVnG9TDS3CTi2QJr3qj4U9TB9jUWYd6aF9D2
 ur/XXEMGvUEt/wcwMiH6DDtTYatOQq2RVaEl9TY8bSCbSelNq7inGsrPX2wFbSJ/reFmLqkfoV8
 Bl+3YLnejOrntIVBj7R5JpoTtLzfVIfbgo01VCTmDT6KV6nEl7d5G3/6aj3eXvABU6CEg6Vl/XU
 0GCtx7dFuPTfrFbxsRX53H46b1GaxZG+9ge5z6DSEo+oUpcmNxbyBmjw9dbE/ELjnzrhni/Z7/Z
 +poCtIgnRxDbU1g==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Similar to the non-namelen variant, it is implemented in terms of
fdt_get_property_namelen()

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 libfdt/libfdt.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 2e182ea3314d44f30e5362ad1ca62431c0bf663b..7d0c252a34970f4ca841935f8088410a3970127a 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -712,6 +712,13 @@ const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 						    int nodeoffset,
 						    const char *name,
 						    int namelen, int *lenp);
+static inline struct fdt_property *
+fdt_get_property_namelen_w(void *fdt, int nodeoffset, const char *name,
+			   int namelen, int *lenp)
+{
+	return (struct fdt_property *)(uintptr_t)fdt_get_property_namelen(
+		fdt, nodeoffset, name, namelen, lenp);
+}
 #endif
 
 /**

-- 
2.47.1

