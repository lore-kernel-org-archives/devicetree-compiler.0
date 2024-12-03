Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D41FC7E7
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 18:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733250630; cv=none; b=ZOAFXKOh0T5T4dHQH+6Xlb5uWMBJDcH+uH9CF4QekBLnEqq+j1gDPTYpoZSG9CssVa1N0clCoh+d+yJ8K63GLfgrTk1oI89/CeFeEMxDBGcdk0gBko7srtN19h2WfFtLMF76OT9nwQZPgiJz1fRtAMV2/oRKSzGtSZMEW4lsVcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733250630; c=relaxed/simple;
	bh=D6bxmNdqhZ3itjNH0f8dzFhjIuOgzPA8LSOzrMVu64U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amRS8ZEq46xAZnoVCUeF5+JdbGL5MZbeqGUjriIHfjwoRs8ZLhltQlsT0EAkxtws9MGzT/LEPe5afHLSBcXivKrFjg6jIhLJcYFxznr2T6buLRAZf35Sh/DpyOXdBQLOyuzWqJK2AIMepMXMCfYQkmmctz8ZUUGH8Q2RksSz/jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=hxGLJVsc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="hxGLJVsc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215cc7b0c56so7226675ad.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Dec 2024 10:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733250628; x=1733855428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zga31PMMCGNd75fY6RRMIIaixF73L+R5GUA6SwfWD/4=;
        b=hxGLJVscNyyD7pWWTltB3rQBLRzEpVv1jUzmyCKtjjoHmJH0UCKzy2+bqyRavgOdt+
         vZCdM0YZWViH8rAl/mu2CzcDUqxDu8u97MtYYpI8o6ctkAG7n59ItnHr5fAgqFlcydPs
         y0xXw7XGRNBY0Os4+MCNFZDGWqvrCzfZTmmBYrEJNTZtI4VKF1ll6DaWtwvmLq2Ps5J2
         C+wDMVpVBsCZCUTr1yTA8+kejdC4gRcU3bSNFGw9bVlbV9UbmnIO8pPqzAdl7L7AXZFY
         /PZPxy2MXmrzYvUODC96gzxtFU74u7HxlKYU5igfhOD58taHzL8lRbgyA4c/OUe+CIXc
         ULww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733250628; x=1733855428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zga31PMMCGNd75fY6RRMIIaixF73L+R5GUA6SwfWD/4=;
        b=rABE4NFQOPmb9tyFADtPV0Z4dGVN9R1W4/Z0niFZpJnaUhdbvPLLSEWo9zAgMV4g31
         h7qcRw2De5Lj3bpg3JdXflT6otKXwR1u60/12ipxKmwGH5/6JnffUpA6h6ZpQYBrIje0
         ZZVlvMRmOBlj2DarZr1XijVjTOHxh4eQiYw5qYRmNDYKUH3O2dRDtv0XcaIfiHJaoqvF
         1LQT8xHrGcAqtJAQ9UISE33zJ+0ov+C/LmYUA59oEZES0XJCgghO8nkcU+1igjsxfTU/
         CQ/9kbfFwMOHY482rOk31XqG6iLQVkIvZtyfHLfXCp50bz2CrVe2/D1u6jc41B3nECQQ
         KiRg==
X-Gm-Message-State: AOJu0YyjU+CiqRoQygdpWXEPEzssT0BtrnnenN6BSrUMxT2hKIEOHNvG
	zFi1UxqlEVtGKOtXp8HZi3JNntzsnLvIhZqhuCHYPdp5xa7FO/uoXDsX0c6TuQ==
X-Gm-Gg: ASbGncvlyvdHrl7UPLnF0xSJ0LH5M5KWMtJJqIMxEa6q9h1qxaVK7XPRutHh7FyvYAO
	ylXOI3mZu8l407yswcDDwVqP5U/etE4J9xIy2m2iLQ+LtZW0ytI22SkAE2jxfgCIWzNoSuP1OEz
	omoAfoWubNSkFVKdO9N5aqT2noJvvmKyA31jf/5c2dOyykTbxrxmj6sUjGlEW+PNnGNrJhdh4Ty
	hv3Tm/V5w/Wa4AVkMfzlMJ/kwYnurqbzPpk/nl1XqTYz2+YppGaJCyR
X-Google-Smtp-Source: AGHT+IEQ2DKo6HpzqCAaRL6g/26tFLqCGScplRyWYSvrnF5nTBfPCQSdo+t4s+SCOJhs/cnkxg9djg==
X-Received: by 2002:a17:903:2343:b0:215:4fcd:b222 with SMTP id d9443c01a7336-215bd10d377mr55155195ad.29.1733250628025;
        Tue, 03 Dec 2024 10:30:28 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215c1317af3sm14364215ad.161.2024.12.03.10.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 10:30:27 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 04 Dec 2024 00:00:00 +0530
Subject: [PATCH 2/4] libfdt_internal: fdt_find_string_len_()
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-setprop-namelen-v1-2-d1ea333fbd6c@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2224; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=D6bxmNdqhZ3itjNH0f8dzFhjIuOgzPA8LSOzrMVu64U=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnT0407Os9nh7aPWAiPFwVinyflIzVA6V+MaQ4h
 PKWa5RoSoyJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ09ONAAKCRAFzvXHieVa
 dHveD/0R6UTpiX2Ij/OaDIaMt8w0QNJaHc8d71cdHlCjoVg64msHurd21DhhKOuIp82nnI1MaT4
 fphqdCxB40Ef3EUrS9i6V19bG44jSkJt487KCDWrk9hvnF2bJ9MH94KUmOFLlfI5uXYzvNcfj9S
 4N8b3X7CMGUTYn9ZNrnTURnL5ZfoF37v274dbqLIe0oLOVriX7o4MoWb37koEUcJHwt6qbo4hQG
 pklU1oidCqbHSE+5E88ExwSydRFNDK1lpO5POpA8C/UKDh0XkqLqd7csK7sD6tHyYUCsrxeb9Xq
 7zUrTsw3ymbUHrkeQ5/MqRPawK5jQPjHbdIxRmCBJb/s6CQ6oODBUyPMLI48os23MlMllAZFOUj
 62aREQpB7jBhrElIe/yanky6nHojNq1alQAO4zrCTm7jwFMmARPm7lQlOKD4LpqNRY2v4k6H3Eq
 dgjdZn2J3Ou11SttUL9IVasX/NI/gRL9LTHIj4niag1evip6UpqcB1wIXMYRj1iOu1g1pTp2zrK
 85ZS5qyRAz5QCKS/rk1yRbDfijeI/O7LjB1X+1gWOoMstPMbicRJ0KWjuKQF3XEldX/5eEkylpI
 uxZGdDtd/Jw3+85vEnZjJ18kyvoY7grsrUeZBlMzZmdYPW/dRSYIO0KcKNeG99IBE+pfCh6PQoP
 xp7/jFd+Yi4Dtmw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow specifying string length to `fdt_find_string_`.
fdt_find_string_() now internally uses this function.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 libfdt/fdt.c             |  8 ++++----
 libfdt/libfdt_internal.h | 11 ++++++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 20c6415b9ced113d9fcce25b69007a6b0f9e68e7..95f644c31f9431eb597b6f683741ff9be375cebf 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -312,14 +312,14 @@ int fdt_next_subnode(const void *fdt, int offset)
 	return offset;
 }
 
-const char *fdt_find_string_(const char *strtab, int tabsize, const char *s)
+const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
+				 int slen)
 {
-	int len = strlen(s) + 1;
-	const char *last = strtab + tabsize - len;
+	const char *last = strtab + tabsize - (slen + 1);
 	const char *p;
 
 	for (p = strtab; p <= last; p++)
-		if (memcmp(p, s, len) == 0)
+		if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
 			return p;
 	return NULL;
 }
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 16bda1906a7b335519b9f748d1be6110de551e79..1fd35f364e9af15df19ae5b8b7231584804e96a4 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -6,6 +6,7 @@
  * Copyright (C) 2006 David Gibson, IBM Corporation.
  */
 #include <fdt.h>
+#include <string.h>
 
 #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
 #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
@@ -20,7 +21,15 @@ int32_t fdt_ro_probe_(const void *fdt);
 
 int fdt_check_node_offset_(const void *fdt, int offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
-const char *fdt_find_string_(const char *strtab, int tabsize, const char *s);
+
+const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
+				 int s_len);
+static inline const char *fdt_find_string_(const char *strtab, int tabsize,
+					   const char *s)
+{
+	return fdt_find_string_len_(strtab, tabsize, s, strlen(s));
+}
+
 int fdt_node_end_offset_(void *fdt, int nodeoffset);
 
 static inline const void *fdt_offset_ptr_(const void *fdt, int offset)

-- 
2.47.1

