Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1801FCFD3
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 18:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733250639; cv=none; b=C2qaW1MSUWirQAWPb7b6rC6Yv1do6CrGENdM7EbtkOGRvuSDYeWZ1Rj0SYy18twumJrz6ZsvygeFR1FhOtadQrIT8OBiP9DIVc+hTqjW3Cy1XMgFkz/6RFgv04hM7gf+PPtC/uhVGvaucnJrFnaUYb2yaXisCnTEx92D7Jt7Hmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733250639; c=relaxed/simple;
	bh=21ISdfEeMe/cuVFhISylomh7P0pDo2AF5GyrM8z9kYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPBrunituTT4/M0V+/3lBhPLUYRPRkFgNWC7uCbAlIfO2KStX/9/GPWYWKd5kNkW6YzYiY6HHAB5pmKsl+8xePWLS+2YM/isjdn9QtRSdTvRKmqmDoxKS40cT9mHoKcz1nDX7GlhOT+9v1r3mpU2CKjGCWPIEAdy0Rk+tBK8nXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=2Jxf8wpK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="2Jxf8wpK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-215b13e9ccbso18788955ad.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Dec 2024 10:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733250637; x=1733855437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YidHUXnYPgQ4yzC1FC4tzj8DNdLksu5syDh+lLIzaiY=;
        b=2Jxf8wpKpnS72ZQ4WiCEJatXnXk8CSq4DYXlHoMV0rb+94tuBgeiy2mfsPVnhrKIa5
         pwndV+WE21JLWh79peklnziWjxJeqptnZhdH8h0+87De9Vi1OsbI6h3cXHMz9GAgjsad
         qJR17V2fCrtB4O3bDSj0n22eY/VomA/4dtjo4+wKdkjilJEP9RoZ4FJ/xc2uD8Qsm6rP
         iVNboGDkRQjEnp08COIuZAQbGg5wARCu6H+d9QYbBrIDFG0k3E3UlwhbOQzyumhyA/Qw
         0EmgnyEiLXkz/xRm50QNNRNVIlCnOVv9pR8k2CKWFjIVLYjHPpDQeag1iSECkh8cgYLH
         xCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733250637; x=1733855437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YidHUXnYPgQ4yzC1FC4tzj8DNdLksu5syDh+lLIzaiY=;
        b=HPzrWNzuRoVYwfPeWo9TxsQWgjGD149xidNTwsCc4tysM5yGoCu2TeTU0tNY5NJMDr
         S9KQmhFSMobj48IiPQDcffz+btr07H+NhUre/L9ZHHtpczWW/TWF7n63HzJPkDvj92oP
         dsJez0093F7h+vmYkbdBCHlhRF3SGsDDw2CSXEkASr8e5iUqRCBrgDAzww5UTicVn6CI
         946dUP46pmK7Z8UMgBm87PibI0djJ9t7a3z5Um/hNIK6u+Mm+q4M1Rvt4kddf2O9AW4N
         uVpVwDrnGAuZTYO77fhFP/CjYMa1Bn8v3HrXVliZI43ReS/c3IihgeAF+fJ9t19qMzMv
         l9TQ==
X-Gm-Message-State: AOJu0Yyaf3h0q0SB8w3f9XCZIl+gVG3uBQN65uyw0EXguapDpiIpIW9m
	VjK05vwHNX50aNCvpHIEaGIagAnHnqSnuDITpyCsnyGNdW0Ug8uyhBAQGFW3FQ==
X-Gm-Gg: ASbGncsTYCQwo1KA/zLUwDEvxMYw+WB06vb6JY3e3+DhMydJZm8xBI2KHJwPYxMb1hu
	Oy6xtlM/j7RbPe3s5rRrnXg96x3UI0bNpaMp94HpzQhaoh90r5tc4jjc/lid2JbaT3hUkUnJKTv
	sZiHd7LZdh7xQtHdP9hyPWrbJmlWkykIyGKZGxz6l7VRR2bjHx25t/XzOJx7lluPWmfz70h6lF+
	N+dLRgnIT8suTfnGAgOpIOwDYVKh0LYC0PThaLIr9cDyhAspDSdstrg
X-Google-Smtp-Source: AGHT+IGqUMQ+jPIK37m75ovUrDxKgMzPuSq9y2jw0O3zi+I/DiR6sTcbJpHsTVoRVUlc4iHEipmRCw==
X-Received: by 2002:a17:902:f683:b0:215:b5c6:9ed3 with SMTP id d9443c01a7336-215bcfbc565mr38791555ad.12.1733250636899;
        Tue, 03 Dec 2024 10:30:36 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215c1317af3sm14364215ad.161.2024.12.03.10.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 10:30:36 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 04 Dec 2024 00:00:02 +0530
Subject: [PATCH 4/4] libfdt: Add fdt_setprop_namelen_string()
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-setprop-namelen-v1-4-d1ea333fbd6c@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=21ISdfEeMe/cuVFhISylomh7P0pDo2AF5GyrM8z9kYw=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnT040d72uFrf2qCMrjywq3ZtYoRtM5z+XntGWD
 C50fzE0oOSJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ09ONAAKCRAFzvXHieVa
 dJpwEACBBFOYaP+uiZzHoHfhICqcFuiAADlks3vjqynu9Gl/wwzWU0AvtdplKCXzc9bLotI31CB
 0ewAwiQ+mHYFPVWYiCymVSHfQR2R2WmqAAJ1zB51MZFmrxPhHSSpQyBt+K5NrNBqOzqAbePk/qZ
 pFp2IXpcbcmTPOvq+V2KnrLV+yLEqEFvzCs2gyTYmJ1yuaThhSLhk0NWxUvIz7LF6wojzjyAZx8
 PcJAo7aIhXeBMRGfH77HisYpsyNnwSklSzBuWSZ45FTZeJQb+eMjbCMj0ldHgqUv9fb8PrGaPVa
 Xj9yT9Oe4DSZkPJzn3U5dufn11eX3eVfjHBoiaLMivjr7belF993yJXLt/60dXJaIfqY9Aa0PwO
 9H1ldJJK8oSXOk7YTBhmhDqv1xSJ8RX6GhG65f2CD1KFoIh65sFtZTtrYC6SQpKypuSCvMSwJ+y
 pk9EvV7BWT5ZUAiuY1cz9yOCIYZ0n2nbDWJc9VQqt9RVdMm6irHqYk0x9mYCSOHl8RmUPG273kX
 ulglxt5ZkiAhcybI2Nlb2S6qFgIdCWUnYqr89w5kISpZo4nz8P4pBHwjc9TfiEkLppVdd31VTzK
 Hi5fheQcAr7mZpben0P49U0jFUCq7PgsMUxh9nGBtzYrzdYRAgOxcnV6swPmDJ+2Ft+FqNJAIIa
 +YJ9IOPzS594nqw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Macro using fdt_setprop_namelen() internally similar to
`fdt_setprop_string()`.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 libfdt/libfdt.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c9c81f039365b6d244932786a84a05f065e67c33..5c79c7150d196062246319735b36a6111978ad56 100644
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

