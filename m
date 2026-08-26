Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056B23BD651;
	Wed, 26 Aug 2026 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733187; cv=none; b=CE3uxMLCjqyUKu7bbZPZbR+j53AY3qFLb3jRpBqA9kas591QYxImoPYNMUi30G5dRik5+imK+0bIvb2v7dtFPXfMZyrEYZqKhPFva3Z9kQmSaTsOycPR96U3lmyjQY2ImRBLkH6NmvolgZMWjOIVFdhoFnXidROojs38XQpTu3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733187; c=relaxed/simple;
	bh=W9mg9jyRvlVpHVLF9f2CJrNNCtoo1iqZVPGSzFepCow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCtZCoPbV3VPhZB6EvhrCN3TGlAzbu7or5GYW/h/eLKEBBv4osAtFlrsKIeViYEwSdZp5i9Yv4ZkfqOFGaD5Yak4VALhzp/IZDH8mGxSFkBXho3MJbpqvFCbCDVT/+4ib+sFJPw97BoiOCCOGOuF3shtJNguST3jb+lVDxccJpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YrNRMr9C; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YrNRMr9C"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 72F364E413C1;
	Wed, 26 Aug 2026 08:33:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4697F604EC;
	Wed, 26 Aug 2026 08:33:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C722611C7AC80;
	Wed, 26 Aug 2026 10:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733183; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JRzxNI/yZN/r4qaoRVBp6jb+DAZQ50f2Ttu1ACcCaw4=;
	b=YrNRMr9C2sPO/1j2CjLdZPdhXAmb9vXhmPP73VxhyuzPN0Ry/vAsCqoSscuFKJWFkZogbx
	wU9wFsZMn4G1azxnmfHgSRk0CWbU4eSojJI1KPiXi7ByfgA4cuvBIDBu0TeS1GAEivZj8K
	idvmM3xpvH9onJ1Sn+3epBmra6jkgdZV/AiqlXkb0YqaTsJsK40tTMrp5tHEu8/rxkUdnw
	qMHqnXU+tDi81h89ZgBHdkuSBJ4GUWaejtJhDavpy7oIdRxGLLzkyrWIXsmfgPuni2FXP7
	J0xzr/VG5fMdwZoKWISxoqsiAFQAZEexB7bZzZEVk7GTeKVUzRq17N8DnEHJrw==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
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
Subject: [PATCH v3 12/15] libfdt: Introduce fdt_getprop_offset_namelen()
Date: Wed, 26 Aug 2026 10:31:43 +0200
Message-ID: <20260826083146.304291-13-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826083146.304291-1-herve.codina@bootlin.com>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Future operations, such as handling unknown tags on dtb modifications,
need to get an offset to a property based on the node offset and the
property name.

Several function exists to get a property based on the node offset
and the property name but none of them allows to get the property
offset.

Fill the lack and introduce fdt_getprop_offset_namelen() and its
simple variant fdt_getprop_offset().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt_ro.c          | 13 +++++++++++++
 libfdt/libfdt_internal.h |  8 ++++++++
 2 files changed, 21 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 856c62f1..50c0a8bc 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -536,6 +536,19 @@ const void *fdt_getprop(const void *fdt, int nodeoffset,
 	return fdt_getprop_namelen(fdt, nodeoffset, name, strlen(name), lenp);
 }
 
+int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
+			       const char *name, int namelen)
+{
+	const struct fdt_property *prop;
+	int lenp, offset;
+
+	prop = fdt_get_property_namelen_(fdt, nodeoffset, name, namelen,
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
index 3c83d9a7..e3923629 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -26,6 +26,14 @@ uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
 int fdt_check_node_offset_(const void *fdt, int offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
 
+int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
+			       const char *name, int namelen);
+static inline int fdt_getprop_offset(const void *fdt, int nodeoffset,
+				     const char *name)
+{
+	return fdt_getprop_offset_namelen(fdt, nodeoffset, name, strlen(name));
+}
+
 const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
 				 int s_len);
 static inline const char *fdt_find_string_(const char *strtab, int tabsize,
-- 
2.55.0

