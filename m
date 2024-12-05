Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE8C14A90
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Dec 2024 04:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733374302; cv=none; b=iDPh5TOoOH4m3QGWGb7fZnFfjgMaSBFTzEVBPoBFIwrKReALBiscyrHgO0opMUGwHhuOD5Ny7fkWwFph8d/sbxfIff+bqqHMY8tcQ0z96bpOE0AzOjvD+fkN9Qa9oIaBaNBBODfPU4pd8GaArzd0klS1Q3mt3ITdSef6stSACLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733374302; c=relaxed/simple;
	bh=TrFLKLFwtKfWM/lLH/sD50alO+uaDYdFOGnAn9rHzQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrKK2qLYfyyuB5fL6jnSaIx4Ce667S/1Xjwmf7QqoOOCYyxXeJVu1yPUUBMnO9w4PhmySCwAM878SQi9d5G1yYV/DyJUZHhDu25gkIRDJDE4xgrYJvlMXs0PE9MjDm428p/6xIQjOg6tZOC+CzvVMLDcsM5hNTHkZF31BJNQ5Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=M4kEQ8C9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="M4kEQ8C9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215c4000c20so5161855ad.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Dec 2024 20:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733374299; x=1733979099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nV+3PEVr6p454h7U0A8c+gkxOZQWTcLsRokOyW3h/0U=;
        b=M4kEQ8C9PZ+B6CvhWo5TOe42Xtxxdg9xcEmWi/f5qa7j1ZIwy7jyGTuBp20gz3XGIi
         3zAQ674iBvPponsVwQQTQKZvZSukXp0TwzhDAtbMag49nbM6sAkE1A8BgaK9PjZ/a7d2
         v8smqTDUwmmYrGwyB30vhHKqPDpOpHJTQSYjCSsFXEee+qLwPHt9FtOk+pMAf5BrpAoD
         obIpIF9eMEcw45+CQ9Z8Rj+r8WKwE1CC7nCvMjpH3pORWj7Z0m2wOrlX1Vq15SPP4oaD
         QF03MrJYVTO4957uQC1TGEtTQuieJLR27yEwvExEb3/g4O9L0q6LN+e3Ww7uw/FkFBOu
         JXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733374299; x=1733979099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nV+3PEVr6p454h7U0A8c+gkxOZQWTcLsRokOyW3h/0U=;
        b=N2cpMGOERDh5UC/zPdE2fGzc/S/hOm2ags2a1PQOz0Os/opaxwkq3W/wVQP7mTlNhC
         /hN/SyMp6wyTLXEq7sQfvob9ucP/NzLtw7ULvDcs3384i/9n9vBc3M8x0idG6v+zTPfw
         j2IDvp397w1s7vn0mKvs/ziRjHDuGbHX/r5NsVHy2bNNoK5LKPM3e39M7M3YyD3SdGiv
         h7+Z1GN/7oC3RyqlwIbYcaQlWGD8pijTfGqmnlaQwCA6AugSGuPA5YuO3QIGPllX0+GX
         ZxADlYY98uJirVVR6NL0CDYnWkA9VQ97slb6WoBKVYM/CCRNGrvErSHbX8YtlhOfaDUk
         T44Q==
X-Gm-Message-State: AOJu0YzBUJz1wzgAxIZDNttCS8HsItX/R2IAgAsVoJsi72lTmrsvl0ol
	F6YvzK0r//BwOCb6H6ylfKWXu+jBBxUF0uVLtJm/g8JiUP6p3MdKrrXS1amFz93paX+Wl1KUXMm
	75peVpKY=
X-Gm-Gg: ASbGncuXv+BxmxWItnI4F8GVmIDlx8T0vlX/ftjms/TNOebXtHSSa8/7/QLIstEAYNw
	XBsT2lwI55P4AWSJTfPbbHa+A+V/CTAKgIcJrJM3jwwqh7QxtuWGLVIxMd1meeEbSX6YrK6Ps6h
	NR0iBm4zWNWRUXJFiCaeHum4qwshhK7j3PgrQCG7nf3RMfdwj4grTaVZRt/m4+DkMWIT4g9SKjO
	R6/2FRGACUb028xTDuOQouanvo4SEIW4kaNZbFYa8AUwbc66sFh4Q26
X-Google-Smtp-Source: AGHT+IHc86d1ymoD//s24p70aaOkylXTfhPYT88WFH76gQ8TipCMzzGMInKfBtAWjZIg6YpnEmZOvw==
X-Received: by 2002:a17:902:ccc1:b0:215:4f3b:cb20 with SMTP id d9443c01a7336-215bd2003b2mr107937085ad.23.1733374299169;
        Wed, 04 Dec 2024 20:51:39 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8efa47esm3801015ad.153.2024.12.04.20.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 20:51:38 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 05 Dec 2024 10:21:06 +0530
Subject: [PATCH v2 4/4] libfdt: Add fdt_setprop_namelen_string()
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-setprop-namelen-v2-4-0d85a3d2e7b1@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=TrFLKLFwtKfWM/lLH/sD50alO+uaDYdFOGnAn9rHzQE=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnUTFCYJh79UEWf0/E2vBLGeHgGRFSi7dAJT+3O
 bmA/8bsCr6JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ1ExQgAKCRAFzvXHieVa
 dDfdD/9KOKo04Ak4xTwsrwVxV7YsWtZv/mjsVtg5N+YQ8tRSFTisOoTI3w9gsyrmqg5viKt7PbO
 zmzxw6oUsYLkZWWefvweQIiG4YSojyt3+0/IsLn4NAZx7RWHzjM35Y6oyhSq1HbwUqq0y8xEdQn
 qg4tJH4jXeI7ONZRICKkx4ZPR1qu9ay7YIjnRYmKAV24/ayu426K7kXDqIXJ5adhk5wlYGDxzGc
 OntIm2KzWa7JbLhd9+sfzbnUygu5C0pHmpI6a6lAa4ABdgaGHNC6XW8d9xBUwMNTogBkPaJ8tHv
 +98Hl7xR0TrYpswixdzKKmxI/4vlJo2gQ0MHs7SCLSYYjxKfUAiNYFxZECF8vplAkGTs2MulqxO
 dYTvHQzH0PAnCLjwkTwggGzLUUEy1Sbbubd5xYiwQbcydTC7DckKIRUU55srr7yvUZOCK4plxS5
 /tXNpJvDB8C1v0HM0jZk3B2PvejAp9XI2ByzX4i8abmzIZ/6l980xyGM74jJP+gJ7s8mGf8FHeM
 Dv+FmYc2Vwh3+R91/F9HrVBRsZ2yV980Nc8xJmOIXtAOmnEJ8Cm6NraL5NgzpU9q3LjT1BT1sKE
 AjfO+9XEkjkOgI0UN/dSkOmC/1P/Ezf2+7o3xLrefB3MQplRDXT4SPv+H6ya1hSsGzO6IbA/ChA
 iAmFqG3kYbGo0nA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Macro using fdt_setprop_namelen() internally similar to
`fdt_setprop_string()`.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 libfdt/libfdt.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 127f41a45f40d13e307949e27f3f1b4fbf34fa2c..f2675b12f674b2221273d666d51b8e31f9b4dfbe 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1919,6 +1919,38 @@ static inline int fdt_setprop_cell(void *fdt, int nodeoffset, const char *name,
 #define fdt_setprop_string(fdt, nodeoffset, name, str) \
 	fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
 
+/**
+ * fdt_setprop_namelen_string - set a property to a string value
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @namelen: number of characters of name to consider
+ * @str: string value for the property
+ *
+ * fdt_setprop_namelen_string() sets the value of the named property in the
+ * given node to the given string value (using the length of the
+ * string to determine the new length of the property), or creates a
+ * new property with that value if it does not already exist.
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
+#define fdt_setprop_namelen_string(fdt, nodeoffset, name, namelen, str)    \
+	fdt_setprop_namelen((fdt), (nodeoffset), (name), (namelen), (str), \
+			    strlen(str) + 1)
 
 /**
  * fdt_setprop_empty - set a property to an empty value

-- 
2.47.1

