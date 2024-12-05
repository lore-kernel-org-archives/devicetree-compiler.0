Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5368814A90
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Dec 2024 04:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733374297; cv=none; b=YkrScI6gtl/Ht3OAoH86JKiqOuDpgFEMMbOAmAs+xfbkNArvvz5V2LNlUKrMGefXNntsitY1UC7pndP4wE/2i0g6KRNhTwLmxqgfAka2QuEjxFZBZ/Hdcid8u/CoPPJ5PkLisoBPegku7G/ISEj+d1DL3KSNjtfxfV/qmgrqnmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733374297; c=relaxed/simple;
	bh=0wf27VT2zUAz48QeUNBUvezWS5vxjK8i3XgRPSNTFKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GNSbHRXQviPYkbBlCI4Sa5OX9q9Uf9Eqjd2xQ1CoVl9k5DY8XUwIsA/PQ6QGsJr7FOfD1QVmc1jxY8HwIefJuqycfFJfMR/IrMja2yGvCGSSy+1vmtawJ+DPhq+YyV/dLCMA8I74TnTTiQvkBwSYtoTUaPtZ4bJu+P5tu58XYcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=qsYLcM7y; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="qsYLcM7y"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215bd2c32a6so3519165ad.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Dec 2024 20:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733374294; x=1733979094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kUIN6Pd/m6y9oQI078ttAPZk2rgnWImdEVKS5wjxmE=;
        b=qsYLcM7yatMxt0k+T2N422ZhKPnXhObDwZj6TwMU4VCa+S3JVWR+wcxKSa3cLRjxx0
         NAa/LEFopClSzoQ17jR5ytBsbGgoJFL+amjR22IhemBvTcOrPZb/LO94T8EyBusfSJGO
         3m+yvf1Fr0hxiBb312IulitQZFnf+HFW1MQY5ISr11+V3rRfFsAOGHwNeIC6NZw309W0
         zpajP2geb8tvf1xqAWnxo6dKoKxCtVn1/7j7/aKt5NgFVmJrSVAuIlIqasOFIyhwmXem
         3AmDXgvTL0hOQfJ+snvrZD8QFNN+PWVED3pKwxRcgsQBYx5dtWNkpV1aACXSLFWCXO93
         9LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733374294; x=1733979094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kUIN6Pd/m6y9oQI078ttAPZk2rgnWImdEVKS5wjxmE=;
        b=R4fZC8p9pEKTfMkexhA2qBRUlwODoBkvXsYkWgL6IOD2fTvR830HbujGYV278peBJT
         nOd9NwzOR2m4qkvPenHMuGIX28hdtcgV6/Yb5V74VLxe+POyWkWvU1pWvuo7YiooRnsa
         FjXedK79Bf3y9gw+0GA2ZSO38cP/LYIwrizJsNjhM8P9XKY5F0VpdaQ2yMw3w+CH+lIq
         s/uAuhshpnAe/0F5vvFzpiAHcOTcXkqXDKn4S7CNEMxoy1H146K5/oM6AUIuzCcpu81j
         EWXFVHhcXnsEhqjTbLp5qtrgFk2TVnPjStN4B0CamDqCrsiZyTWQ9NKT90kGpq1v/NZn
         8QyA==
X-Gm-Message-State: AOJu0Yzi7RS91fYw6foqbM+h2JSdR4uhJjS+SlV9Hvj27kjLNpkHr9ik
	mBKBa1Y04krTyBkBpng78fH/phx0+DL7xlce9NYW2phthpdFwMS2wMFeVxv4ZUZ03Lfq0O9HZJp
	PqPZPsaY=
X-Gm-Gg: ASbGnctNxmrp2obbd6YlPziAaQj6g70BKvv9pdMxlM+IBcYdNW0RHJFbmAZheFTzTbR
	O7y8vR4DnM6/ZKVHWUy3zjwq7Vu/m9y8ovpVRqsc8h+hAGTmfFkSmGGRuoxANfoDNZQVJdOrH+d
	out2MIZPQq1SmyNx7NjorwifMKiQASVLb1yItXLREutraYdZBCx5qyVV9eS2P2WV5Kdu7ZJuI8y
	OElHXgZRvCkVLISdDpUVHuSHTV9iELy2l+xCfKyyAVE+TgyH4BX3VUL
X-Google-Smtp-Source: AGHT+IEDEjlcABXFFOQTZFChwVeNDmBB6ALIhaVcuGCl+pdNobwQI8l57B/4/HHJWMz+sT0G0NCGIQ==
X-Received: by 2002:a17:902:ecce:b0:215:9eb1:3bf9 with SMTP id d9443c01a7336-215bd17f8e2mr133263225ad.48.1733374294368;
        Wed, 04 Dec 2024 20:51:34 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8efa47esm3801015ad.153.2024.12.04.20.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 20:51:33 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 05 Dec 2024 10:21:05 +0530
Subject: [PATCH v2 3/4] libfdt: Add fdt_setprop_namelen()
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-setprop-namelen-v2-3-0d85a3d2e7b1@beagleboard.org>
References: <20241205-setprop-namelen-v2-0-0d85a3d2e7b1@beagleboard.org>
In-Reply-To: <20241205-setprop-namelen-v2-0-0d85a3d2e7b1@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9218; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=0wf27VT2zUAz48QeUNBUvezWS5vxjK8i3XgRPSNTFKQ=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnUTFCKVysed5ilUM9PullSy2m9M/CdCL7wKnTv
 0yi+UuORkSJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ1ExQgAKCRAFzvXHieVa
 dEcKEAC1ogHsxYWxUKnzc6bBJ5Zs8bJrX736cLd5k8YuajAacgbSvuoGMxg95nQ+Ja+oLuXkEfU
 53Qky15bwn3Y4rR1Hrn8yQ0wRrkmZbjhvh9KdHoZSo73Nnl+GaHgEj/a2W8eDf658jSJMqvTHG3
 fVxiTqewe/6zynxbivJKxeixNfO15N+EhlUeTs01ajmO+WmGVlJJrdLcDNPshpAHJd4oOHjyu+7
 cCuKiEwWtU6RBBRLyOnp/HmC84pDih04EHeBev6tg3xr5TIZKbPVS44WjR6nEyjva+5GtiawKWT
 +K9H8UY3qhxlIoG2zpyBQ30MBCTvuWojPiMiG6L4rh193KMpKjDVlQHVZTIaqrht/jCk7XtvpNp
 ssHfAhObAkIadMPmj5k0kQ8OES6IsMXrXX9oisTUd2Lt7pgIbKgAZpWyZjTRpXIhHRzO1uS8Uy5
 T5h/Zo/koZTwYG0OL4RT61tny687OWBQ0BSNzSRLfduH4vjetAsNlnESOWpwHwrT2cW6ZwXhDR1
 nye2GBmhX5aqYXrE5V6IeTcXGaoZ8OCt121o339Dygv+wnSDf1rWOi2QK9lCkOAtXxLXCtaryk7
 0AttWU8/A8CymY6Tt26k/JXjZoyJsa1V/GRUZThg+66mXp+gepkwgV1m5DU976AelAXOatBcFKK
 5Ub6C5DCxq1/G/g==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow specifying name length in setprop similar to
`fdt_get_property_namelen` functions.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 libfdt/fdt_rw.c    | 41 +++++++++++++++------------
 libfdt/libfdt.h    | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++---
 libfdt/version.lds |  2 ++
 3 files changed, 103 insertions(+), 21 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 3621d3651d3f4bd82b7af66c60d023e3139add03..7475cafce071307796d7944ff8278aa5597d0812 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -124,31 +124,33 @@ static int fdt_splice_string_(void *fdt, int newlen)
  *	allocated. Ignored if can_assume(NO_ROLLBACK)
  * @return offset of string in the string table (whether found or added)
  */
-static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
+static int fdt_find_add_string_(void *fdt, const char *s, int slen,
+				int *allocated)
 {
 	char *strtab = (char *)fdt + fdt_off_dt_strings(fdt);
 	const char *p;
 	char *new;
-	int len = strlen(s) + 1;
 	int err;
 
 	if (!can_assume(NO_ROLLBACK))
 		*allocated = 0;
 
-	p = fdt_find_string_(strtab, fdt_size_dt_strings(fdt), s);
+	p = fdt_find_string_len_(strtab, fdt_size_dt_strings(fdt), s, slen);
 	if (p)
 		/* found it */
 		return (p - strtab);
 
 	new = strtab + fdt_size_dt_strings(fdt);
-	err = fdt_splice_string_(fdt, len);
+	err = fdt_splice_string_(fdt, slen + 1);
 	if (err)
 		return err;
 
 	if (!can_assume(NO_ROLLBACK))
 		*allocated = 1;
 
-	memcpy(new, s, len);
+	memcpy(new, s, slen);
+	new[slen] = '\0';
+
 	return (new - strtab);
 }
 
@@ -181,13 +183,15 @@ int fdt_del_mem_rsv(void *fdt, int n)
 	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
 }
 
-static int fdt_resize_property_(void *fdt, int nodeoffset, const char *name,
+static int fdt_resize_property_(void *fdt, int nodeoffset,
+				const char *name, int namelen,
 				int len, struct fdt_property **prop)
 {
 	int oldlen;
 	int err;
 
-	*prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
+	*prop = fdt_get_property_namelen_w(fdt, nodeoffset, name, namelen,
+					   &oldlen);
 	if (!*prop)
 		return oldlen;
 
@@ -200,7 +204,7 @@ static int fdt_resize_property_(void *fdt, int nodeoffset, const char *name,
 }
 
 static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
-			     int len, struct fdt_property **prop)
+			     int namelen, int len, struct fdt_property **prop)
 {
 	int proplen;
 	int nextoffset;
@@ -211,7 +215,7 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
 		return nextoffset;
 
-	namestroff = fdt_find_add_string_(fdt, name, &allocated);
+	namestroff = fdt_find_add_string_(fdt, name, namelen, &allocated);
 	if (namestroff < 0)
 		return namestroff;
 
@@ -255,17 +259,18 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name)
 	return 0;
 }
 
-int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
-			    int len, void **prop_data)
+int fdt_setprop_placeholder_namelen(void *fdt, int nodeoffset, const char *name,
+				    int namelen, int len, void **prop_data)
 {
 	struct fdt_property *prop;
 	int err;
 
 	FDT_RW_PROBE(fdt);
 
-	err = fdt_resize_property_(fdt, nodeoffset, name, len, &prop);
+	err = fdt_resize_property_(fdt, nodeoffset, name, namelen, len, &prop);
 	if (err == -FDT_ERR_NOTFOUND)
-		err = fdt_add_property_(fdt, nodeoffset, name, len, &prop);
+		err = fdt_add_property_(fdt, nodeoffset, name, namelen, len,
+					&prop);
 	if (err)
 		return err;
 
@@ -273,13 +278,14 @@ int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
 	return 0;
 }
 
-int fdt_setprop(void *fdt, int nodeoffset, const char *name,
-		const void *val, int len)
+int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
+			int namelen, const void *val, int len)
 {
 	void *prop_data;
 	int err;
 
-	err = fdt_setprop_placeholder(fdt, nodeoffset, name, len, &prop_data);
+	err = fdt_setprop_placeholder_namelen(fdt, nodeoffset, name, namelen,
+					      len, &prop_data);
 	if (err)
 		return err;
 
@@ -307,7 +313,8 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 		prop->len = cpu_to_fdt32(newlen);
 		memcpy(prop->data + oldlen, val, len);
 	} else {
-		err = fdt_add_property_(fdt, nodeoffset, name, len, &prop);
+		err = fdt_add_property_(fdt, nodeoffset, name, strlen(name),
+					len, &prop);
 		if (err)
 			return err;
 		memcpy(prop->data, val, len);
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 7d0c252a34970f4ca841935f8088410a3970127a..127f41a45f40d13e307949e27f3f1b4fbf34fa2c 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1666,6 +1666,38 @@ int fdt_del_mem_rsv(void *fdt, int n);
  */
 int fdt_set_name(void *fdt, int nodeoffset, const char *name);
 
+/**
+ * fdt_setprop_namelen - create or change a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @namelen: length of the name
+ * @val: pointer to data to set the property value to
+ * @len: length of the property value
+ *
+ * fdt_setprop_namelen() sets the value of the named property in the given
+ * node to the given value and length, creating the property if it
+ * does not already exist.
+ *
+ * This function may insert or delete data from the blob, and will
+ * therefore change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_setprop_namelen(void *fdt, int nodeoffset, const char *name,
+			int namelen, const void *val, int len);
+
 /**
  * fdt_setprop - create or change a property
  * @fdt: pointer to the device tree blob
@@ -1694,8 +1726,44 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name);
  *	-FDT_ERR_BADLAYOUT,
  *	-FDT_ERR_TRUNCATED, standard meanings
  */
-int fdt_setprop(void *fdt, int nodeoffset, const char *name,
-		const void *val, int len);
+static inline int fdt_setprop(void *fdt, int nodeoffset, const char *name,
+			      const void *val, int len)
+{
+	return fdt_setprop_namelen(fdt, nodeoffset, name, strlen(name), val,
+				   len);
+}
+
+/**
+ * fdt_setprop_placeholder_namelen - allocate space for a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @namelen: length of the name
+ * @len: length of the property value
+ * @prop_data: return pointer to property data
+ *
+ * fdt_setprop_placeholder_namelen() allocates the named property in the given node.
+ * If the property exists it is resized. In either case a pointer to the
+ * property data is returned.
+ *
+ * This function may insert or delete data from the blob, and will
+ * therefore change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_setprop_placeholder_namelen(void *fdt, int nodeoffset, const char *name,
+				    int namelen, int len, void **prop_data);
 
 /**
  * fdt_setprop_placeholder - allocate space for a property
@@ -1725,8 +1793,13 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
  *	-FDT_ERR_BADLAYOUT,
  *	-FDT_ERR_TRUNCATED, standard meanings
  */
-int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
-			    int len, void **prop_data);
+static inline int fdt_setprop_placeholder(void *fdt, int nodeoffset,
+					  const char *name, int len,
+					  void **prop_data)
+{
+	return fdt_setprop_placeholder_namelen(fdt, nodeoffset, name,
+					       strlen(name), len, prop_data);
+}
 
 /**
  * fdt_setprop_u32 - set a property to a 32-bit integer
diff --git a/libfdt/version.lds b/libfdt/version.lds
index 989cd89f1051ce59255a3b3e60493be4e5e985cc..cbfef546de6c7dd2b26a5298be46687be9779233 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -43,6 +43,7 @@ LIBFDT_1.2 {
 		fdt_add_mem_rsv;
 		fdt_del_mem_rsv;
 		fdt_set_name;
+		fdt_setprop_namelen;
 		fdt_setprop;
 		fdt_delprop;
 		fdt_add_subnode_namelen;
@@ -71,6 +72,7 @@ LIBFDT_1.2 {
 		fdt_find_max_phandle;
 		fdt_generate_phandle;
 		fdt_check_full;
+		fdt_setprop_placeholder_namelen;
 		fdt_setprop_placeholder;
 		fdt_property_placeholder;
 		fdt_header_size_;

-- 
2.47.1

