Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C971CA93
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Oct 2023 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CElVVJAb"
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3DFC2
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Oct 2023 05:48:50 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so3665362a12.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Oct 2023 05:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696596528; x=1697201328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYzO+0F1MTeakVwqtbebs6tMAXdiPywSU4slvBrbh3Y=;
        b=CElVVJAbvlH9M31v0nv2ARCArK+s6/OvSKf50/kgpWiJ5bG6svsVqWwpxxr/ZjUOxx
         VCsksSo9v/x4Pf9jvI1O9u6L/kgZxm1LQ40og3aXpqiGx8Q0JI2ZHazeG5fxsNX4iMOW
         cLhUHV+tV7wgxNPCFHiFJZW4ioYTNeReN7AvLwrZ+2o6V78s2XiiBE5y7ZzUlpOMleBT
         1sY/nVSeUjQk2DxQolOaPh5AZiOE9/4VAbAeYVVsHh7v6lMQBy9daDpscr1ATh2vzspf
         wfRCbyktUq95M93i1BngFYHflFb4tUxOT7xfUgmtV6ypa1WlrSCx2syv7oDvqA1JqauA
         07mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596528; x=1697201328;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYzO+0F1MTeakVwqtbebs6tMAXdiPywSU4slvBrbh3Y=;
        b=T5q+Z+oYYjdZ37sTWV7WpC1mxK4Ptk8hz6vSM0YT/xVBZwSmDeXFkNQ4CVtQe1NoQl
         8C1CTsm3gcmUJg3Ry9CTge1SyoECxgKxdjIfj4whLmQmc7kFo626VgiPiO7rtamFLGrn
         9ryxGMwwnHfGRno0wpDy7MRvNpQF7B0F/Z3Jfponq4FXjYJCkmWo+93vlIe+I9Sql+9q
         AAVPfmzwEPRmZaN2vdHSC7FsfdfuWF+nBVmX3PyyYwEr+GMf4B0R7zl5Sx44n3ncF3GL
         QcqMk1ENrmhh+V71bAAlIWt7XiioFeRtAzBqTjD02twQyizP9NzLiQht88N24ab/X+Wp
         e+Eg==
X-Gm-Message-State: AOJu0YwLZmws/K+prsM5RwP60nOANs1CTfIghMDG0PhRULT/Rqz8fYyH
	1sZlSSVsnoo9pGn+nnhRlE7WTq5Enc2h+KXuP/OJyQ==
X-Google-Smtp-Source: AGHT+IFaoJaNrW1UTZY/gVDHUEmCoO6lb2gykc0Qi7YJIe3zcCRSxqCUwP2+qCcmyxuhPb9oBMXIPw==
X-Received: by 2002:aa7:d415:0:b0:522:1d30:efce with SMTP id z21-20020aa7d415000000b005221d30efcemr7244147edq.22.1696596528421;
        Fri, 06 Oct 2023 05:48:48 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a23-20020a50ff17000000b005342fa19070sm2512403edu.89.2023.10.06.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 05:48:47 -0700 (PDT)
Date: Fri, 6 Oct 2023 13:48:39 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org
Subject: [PATCH] libfdt: fdt_path_offset_namelen: Reject empty path
Message-ID: <20231006124839.z7auhc3mk37gxios@google.com>
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
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Make empty paths result in FDT_ERR_BADPATH.

Per the specification (v0.4-rc4):

> The convention for specifying a device path is:
>     /node-name-1/node-name-2/node-name-N
>
> The path to the root node is /.
>
> A unit address may be omitted if the full path to the
> node is unambiguous.

Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
 libfdt/fdt_ro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index c4c520c..46b4ef5 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -255,6 +255,9 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 
 	FDT_RO_PROBE(fdt);
 
+	if (namelen < 1)
+		return -FDT_ERR_BADPATH;
+
 	/* see if we have an alias */
 	if (*path != '/') {
 		const char *q = memchr(path, '/', end - p);
-- 
2.42.0.609.gbb76f46606-goog


-- 
Pierre
