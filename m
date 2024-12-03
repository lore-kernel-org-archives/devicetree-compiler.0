Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B30203712
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733250635; cv=none; b=VYncQGi78mVTQnzPT2XnOxa6RjefydtwUHXvdXlzS928DjRhuoXuKszHi9Pei9DclDPEBY8Cpw25f9Zh8bQHj80ERNtAR4DBr4Q86JE/6DP5g8YomCcTYclLHqEbjD26hdSFQ7U+0sA4+VvGWlxaCl5IleEpFftBUyZIhwY9Zn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733250635; c=relaxed/simple;
	bh=qjTOvHLbXeqQj8zqVHJ5wLdejbE2+k2OZCQ6He7xFJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UN0tFbZiRlmKOmUiZ/RRaH9AvovypZPnzCOdHVUAMYiKKkJvT+XeXRe5L1pq8QJ8CcgmtLkMVQdKaT6GwKZgXq1aACjKKkj5KGqbF3buQsram1M13DvNkgvQXM5LxQIeSRFsWWQna45yEreGdEtWs3NXXvV0yqMYCw4tKyvtajE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=KUnbgltv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="KUnbgltv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-215513ea198so563355ad.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Dec 2024 10:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733250633; x=1733855433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3WgyTkPjeq9syS16jHaKFb3MRDoDxZUHraBOpVKxzc=;
        b=KUnbgltv2HQriTk54e4GEDuWXBaQB/i3vYRNc4xmGemaueSEN8iQR5RYBhWZyhff/4
         /m868vXTcTsKEE7g0W0wXh8WA85HQbg3j8rUjr4qjIu3VznTq2d/3n6mTv0vdkHwDX7L
         NJcr3VlTZgMvXhcBE6/ofk8+H5z3jwzrp2fKj0JsQ2MI3I036vmir5BYfSDMEkTpVoYY
         WaHwRVRsuM5aFPqtDThfwjH8QrgSrAuygcCKfQedeEFaT3OMbtgEY9NmX/xh3rHBUWHw
         aYWlNmtmqvnjqMxI+aNfMFQbcI1kx1GlMEdzzkWcVdSajQ9dKIdY5XXG3agAJewPpJo+
         E7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733250633; x=1733855433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3WgyTkPjeq9syS16jHaKFb3MRDoDxZUHraBOpVKxzc=;
        b=XiCdRErLOEmYN5vN/vEZjVmREbSEwuVsjWKtnOCsm5+monJ8nY+awc0C6Ossg5ems7
         8zmFUGqIhLgmlH0xpQ2KyyluTMTbisMC4xcvHwXPihlknaaiTnyoUCZGMYjP4WFmQkqS
         2RJxTzWZP+wtvAMmge4ZzrLIYanbBr9xXAHf2LfwJOI6x1QnUkdtNdgQzdOxZAfVmfpF
         Nc6exllCOWrY6u8bu6iMXz9mg3pqtzLfjzkQLm0ODTfBRE9ClVTfXHotjRFSblbpjICW
         brC3y9dJKHF41Ro83m6oU5hDBCOljrjkIKDxzW8tJlRrg34Yvg3fgBWqr1N0RFITFhZi
         fHZA==
X-Gm-Message-State: AOJu0Yzpo/JqBnzTIan1hI/J95q0i+Zdqo4h2R88EFMr3+auHHHYr9xG
	aQdG3udFOXWg2lpjJ84VYbAOvriQ7cbKAYgiMw2wvZG+cOh8F+JbYDsqi72xmA==
X-Gm-Gg: ASbGncv4wFT5HqzabuinY+N+E+zYhbF4+8sa3CLTz/2w20hfuJBmWWcojyG4DRBScEu
	wi4frBjn0XQ/WdDE4hABAdpd1zMYRlDYvDSJkc8PvdHBDjUA2wozEhrlx7zVrS31HXheQWozXJJ
	R+YsLOmpz9FRbSVaAlnKTyM+MAHMHVFUI73R+bXxuutzmWbufF/3BkxQoWa0sgS+NGkthLKWAPR
	QuykgeEE2mpom5Vif2X/bE1XrOfXLFM8oSfWDemGYW+CnIKKk/vrb8M
X-Google-Smtp-Source: AGHT+IGCnMIxzMtk3QucCZMzrTIU14/18uhQPvwSelzOOmWgukn5rSFN2TiHHRGucZE5XWhq9WonLA==
X-Received: by 2002:a17:903:22cf:b0:215:7287:67bb with SMTP id d9443c01a7336-215bd3c6b27mr63065455ad.0.1733250632582;
        Tue, 03 Dec 2024 10:30:32 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215c1317af3sm14364215ad.161.2024.12.03.10.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 10:30:31 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 04 Dec 2024 00:00:01 +0530
Subject: [PATCH 3/4] libfdt: Add fdt_setprop_namelen()
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-setprop-namelen-v1-3-d1ea333fbd6c@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9136; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=qjTOvHLbXeqQj8zqVHJ5wLdejbE2+k2OZCQ6He7xFJQ=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnT040swtanjSudsbCZRC1QAuB9K5XoYpBlImsU
 b7wQ2usTC2JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ09ONAAKCRAFzvXHieVa
 dIEkD/9EUpEgAtQztfcme6Ac0SUcKt0qTd79GXc2b4xs4qR2Yv7Vr1dmppD+FX/2F+UDropoPgM
 Ek8pjMPEolfIyhfu52BCa7J/Dn4qQTjj19rjN9R6YXiHEsMu2mRkgkdvUsv6CMK29Lu4sRN60ja
 vN23yy1m3kGPLcYe5I2TOqCXtXIZxwE9c3YRroRgNcK7d8K9KoDnv6zP946n6BKwDgiv01sojTU
 XWS+LvYgHc7phqHKfSGUTwgatAgAObYagRZkL19XFXXb2+Q6QryfUHL2XJKG0LlRPyO/lDAKqUV
 4Nm/NzH0aOt5v3JXsN4qzGdghmDUEVA1Y+YgqbUl7CrZ/3/vYXwc7dUl9saWLWj7jSajvuqHdyz
 ZAChrBE1pD6wbMSIe/EOe5N9KsXM43DDYA5nPhd5z3ZOLn176XbtQIiv5F50XOsyHqEN1L5yLCA
 7fs8CGpnDyQEjZ0QvkUG56zz0Ki4zWhC6C8ZZ8sZ6A/wq4fJOjbU8yFrb3fko/Wf5P2pYtmrbp9
 H54Wh1GNTDPGsuRK3Xuw2t02kVESLbRe8b8Hx4iOqNZ32QWDLKyot4uzQt9q0ZYFH9CXaXTaQZO
 EAKiiciNpCVwa9ZCiZJ8+Mvi55SBSe+WgMf7oow6cMEJYrZhskarXZBLBA8QobU8nN6xgjfEZVT
 ms0Sgbcb+b01+Fg==
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
index 3621d3651d3f4bd82b7af66c60d023e3139add03..33c60063cd721a147a3c6c0e70450c98d8dbd772 100644
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
 
@@ -182,12 +184,14 @@ int fdt_del_mem_rsv(void *fdt, int n)
 }
 
 static int fdt_resize_property_(void *fdt, int nodeoffset, const char *name,
-				int len, struct fdt_property **prop)
+				int namelen, int len,
+				struct fdt_property **prop)
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
+int fdt_setprop_namelen_placeholder(void *fdt, int nodeoffset, const char *name,
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
+	err = fdt_setprop_namelen_placeholder(fdt, nodeoffset, name, namelen,
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
index 7d0c252a34970f4ca841935f8088410a3970127a..c9c81f039365b6d244932786a84a05f065e67c33 100644
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
+ * fdt_setprop_namelen_placeholder - allocate space for a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @namelen: length of the name
+ * @len: length of the property value
+ * @prop_data: return pointer to property data
+ *
+ * fdt_setprop_namelen_placeholder() allocates the named property in the given node.
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
+int fdt_setprop_namelen_placeholder(void *fdt, int nodeoffset, const char *name,
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
+	return fdt_setprop_namelen_placeholder(fdt, nodeoffset, name,
+					       strlen(name), len, prop_data);
+}
 
 /**
  * fdt_setprop_u32 - set a property to a 32-bit integer
diff --git a/libfdt/version.lds b/libfdt/version.lds
index 989cd89f1051ce59255a3b3e60493be4e5e985cc..76ba8f6758cef16efbad2813464e824de594b646 100644
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
+		fdt_setprop_namelen_placeholder;
 		fdt_setprop_placeholder;
 		fdt_property_placeholder;
 		fdt_header_size_;

-- 
2.47.1

