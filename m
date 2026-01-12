Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889CA36BCFA;
	Mon, 12 Jan 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227729; cv=none; b=nY2yyHH2jJQWb7YW+6WcS7E8TJe/w9ct4MkuIYe9B7LQXvxcQ0SdCmPIbTAogjVCZgne/jmKv82ImFQKz3rpk35YRkft32933HgWPv8W8JKUaweodyaTWiTPMqpQ7KyTCBgWGGyReHpUvQMeS3Z9MTwGefi/HWcQyXCXjvI9ksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227729; c=relaxed/simple;
	bh=BodRR0JLTYY6t0tgi82Yb1qLdxJmPnMZpxveitB/wWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aB66jxQ8fGnd7XxonqMFzbuO7jUPDWNL4XhBe7PfVJvUguTaUHNopXPtjrRwGxTWqUw9uGOZ+5siRYHVWecNzMMFU6gx+gheYDflDeIs+GzO128vpUSxzOa77NTTs0jtTn8egHtO2iUbI+IJ3G3KlSpUFXL8xdfT7YsUD2u6kos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=emZPgjgX; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="emZPgjgX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 01485C20869;
	Mon, 12 Jan 2026 14:21:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7958D606FA;
	Mon, 12 Jan 2026 14:22:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38DA6103C9262;
	Mon, 12 Jan 2026 15:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227726; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+tpUvICqLTg4ne1424M0U3kZMx9D8QPY+u/h0GqVlU0=;
	b=emZPgjgXIGvyoBOtXljJb9rbpywSIyF5CBmOwMyrpFxyR2gkcRfzhr9USMNIaYHrH8jwJU
	aJbze09cRUZe1z1O/j23V6/yvkAfHzxv78HRffOrFkyIMQBHFMA676Ja//EdPd6+AT5+Wu
	6QwGj6eOGU+rqiaE47UzdpL+ROalzzo1UqgJdZYP4ljp9mxInlf50jga6x+rCknzAQ5SJH
	+2tp4i3zkqza4ScZGJfT31Q0hNE72D89N5prCjZsBOjfHmI+du6pNPbH+2auJCR57tdjTP
	M15imWX7dTlgQJuR9qqjVCUi8UkL2e1bLvGhEcx2zsdcd3WCXFy3zlL+4yS61g==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH 69/77] libfdt: Introduce fdt_getprop_offset()
Date: Mon, 12 Jan 2026 15:19:59 +0100
Message-ID: <20260112142009.1006236-70-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112142009.1006236-1-herve.codina@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The future support for applying a addon on a base device-tree needs to
get an offset to a property based on the node offset and the
property name.

Several function exists to get a property but none of them allows to
get the property offset.

Fill the lack and introduce fdt_getprop_offset()

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt_ro.c          | 12 ++++++++++++
 libfdt/libfdt_internal.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 63494fb..29692f9 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -508,6 +508,18 @@ const void *fdt_getprop(const void *fdt, int nodeoffset,
 	return fdt_getprop_namelen(fdt, nodeoffset, name, strlen(name), lenp);
 }
 
+int fdt_getprop_offset(const void *fdt, int nodeoffset, const char *name)
+{
+	const struct fdt_property *prop;
+	int lenp, offset;
+
+	prop = fdt_get_property_namelen_(fdt, nodeoffset, name, strlen(name),
+					 &lenp, &offset);
+	if (!prop)
+		return lenp;
+	return offset;
+}
+
 uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
 {
 	const fdt32_t *php;
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index d80d218..499e821 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -24,6 +24,8 @@ int32_t fdt_ro_probe_(const void *fdt);
 int fdt_check_node_offset_(const void *fdt, int offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
 
+int fdt_getprop_offset(const void *fdt, int nodeoffset, const char *name);
+
 const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
 				 int s_len);
 static inline const char *fdt_find_string_(const char *strtab, int tabsize,
-- 
2.52.0

