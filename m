Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1732F39930
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Oct 2023 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPyUI2+2"
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EF38F
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Oct 2023 10:24:35 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9ad810be221so4847366b.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 11 Oct 2023 10:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697045073; x=1697649873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpluU4hDunyx9DuzFXRoCIo9EoAT0JJVKoJkSJcEJlE=;
        b=WPyUI2+2iMZ1pjqPYH434uYRu70n8VhzQLReKTivWHkr6DwWD3xBHQNW3D1Zei9NjV
         1imGUDrAhKZEsnXEt2ZCgWNjEgEY3iL/ZMBJzH20wshoeDjCDYbLSqyjJ0keOJKzqPek
         UFrA8D4JnwJBfnJ6plAsmD3LRL9aHtkZ80UM0UnJk0TpSqEnpTZEbLkRNn5F5iv1GtOr
         IRK+SwnYVnQsWeslJ7JgwM7T/RjQnwacpdoefdxgG+y6DOh95Ubi7vWLiBC4mieuueGQ
         lzA00Q3o7yttxDEZ0YE0qnix9BE4mXegzAqrZbf6MgNOTLxMVogEqmisoaUvnAAtNwNC
         GotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697045073; x=1697649873;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpluU4hDunyx9DuzFXRoCIo9EoAT0JJVKoJkSJcEJlE=;
        b=RVHkd/PJOLDCCXWQDx4u0HrcPFH3m0M+Gry2BH6IaUsRKDQ58Xwti7mNwxbCOVRxfY
         R/sqkj/E1Z9LmD9DvM0frtRgswndVVDQNirwLXYzrVLG31f+MpyGtC0D6L6VMyGaOhVM
         eZ5SnLxgOfCuR/VuAqFoWFQHt1S/CrPSGFdIpVxPOs5Ao1yWflnPE1XKbIffkYQnbXdN
         0wJz9z2t2EO8ryNRENsFET9wg4QehuW3RoEaWQh8ZApdOx5oj5zOz1Rs+BhPaoOJvmdG
         6y+zFIRAaLXmHgLHt742t38MwLcJaEF092uyNcTZsLKPtvNhGLvVnnPUsIuMekDOCXPO
         58Ag==
X-Gm-Message-State: AOJu0YxrIalo1n4DrzoWSbmoO55EpDD9cbebWexes8p3HG9GKFIgrcJy
	FmXxCxt9r6sL9ct0sJZIYBfyNk3OdOiuWShTAVEwOA==
X-Google-Smtp-Source: AGHT+IGKaSJq8qr4mGhCze1D/tvlSaHJpyBpRLDC8dC+bySLlHcTvE385X63sL9WPZmM4pSx0IMWSg==
X-Received: by 2002:a17:906:251:b0:9ad:e298:a5d with SMTP id 17-20020a170906025100b009ade2980a5dmr18970776ejl.19.1697045073439;
        Wed, 11 Oct 2023 10:24:33 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id cf11-20020a170906b2cb00b0099ce188be7fsm9934396ejb.3.2023.10.11.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 10:24:32 -0700 (PDT)
Date: Wed, 11 Oct 2023 18:24:27 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org,
	=?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
Subject: [PATCH] libdft: fdt_next_tag: Harden offset overflow check
Message-ID: <20231011172427.g4tlsew3wsjtddil@google.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

As 'offset' is obtained through various paths within the function by
adding user-provided values to 'startoffset' and as we validate its
final value by substracting it from the initial one, there is a risk
that one of the paths might have lead to an overflow, making the check
validate a "negative" (wrong) length, potentially causing fdt_next_tag()
to report an invalid offset as valid through 'nextoffset'.

For example, when parsing an FDT_PROP, we currently validate that

    offset = startoffset + len + FDT_TAGSIZE

doesn't overflow but then assign

    offset = startoffset + len + sizeof(struct fdt_property)

so harden all paths by validating the offset in the very last check.

Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
 libfdt/fdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 20c6415..dda342d 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -213,7 +213,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		return FDT_END;
 	}
 
-	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
+	if (!can_assume(VALID_DTB) && (offset <= startoffset
+	    || !fdt_offset_ptr(fdt, startoffset, offset - startoffset)))
 		return FDT_END; /* premature end */
 
 	*nextoffset = FDT_TAGALIGN(offset);
-- 
2.42.0.609.gbb76f46606-goog


-- 
Pierre
