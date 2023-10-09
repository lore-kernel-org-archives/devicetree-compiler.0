Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78FD18043
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Oct 2023 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V9mAyobp"
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F16728E
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Oct 2023 07:16:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9b9ad5760b9so783983366b.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 09 Oct 2023 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696861008; x=1697465808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4phSZV6pn803u75emm/cPGjNJYXu7bNaQfYzqXa3Y8=;
        b=V9mAyobp5KLX7xU7uSXT7ZFDMnkxA+gW/a5xU4IyZ65LBQP29i1VNmLf9GlyzvnWUP
         WvBcBSNXyUU1fwuSMoq4MPKsguoqxJeH9BxSVGlBMUNlytDorQWUn5XjAuWlBmXAEEEU
         EavgYYt39K3KJuW2N+vQkoRhpAv+3Mpi2OJT/iD6o8v7tJChy6/zZnkpg1TcfE85BhUo
         96DGi38obcZmc+SoeNiY/fTCON8/vRhJUgvspLuzrKzdmh2UaJYc0jnxpTI7tZAbRkS1
         knxl1jXEguRIdhLt0xav/z6c5aplRnlLiLGmk7rPr8LvINDtstOj8+YRRXiMZLKyW51n
         rqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696861008; x=1697465808;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4phSZV6pn803u75emm/cPGjNJYXu7bNaQfYzqXa3Y8=;
        b=rB25wEZTptS+QeeCnQSTFLcIAGCwJqZeQmo0GSWa849wJgywYlyv6qt7YLR8n6tAJf
         8G48NY+dH8wZ3lpNHo1Zzd01BFG0erVGuFqXZU80TEFc2YeQ3Hkuv1Rh6fGrm047DO4L
         Xc/Qb5krp+g5Fn+ZsqHWaz6ZyJDTGXdUuQNbWSM9LeDHiZLPpyVNgspplC/kGsabq1Lq
         IMDDqYK+wg7xJHvMVEfawKsaHeTvzC179oadl/0H9PfAkYLUeWecBsx7c3/Ghx9jzr17
         pSJnEdTbNwXZkLY8bEEqwYpamp8cT4Dv+9FONLGu1gDLDS36NQgZbtiZ9Gge/GNxgCm2
         raEg==
X-Gm-Message-State: AOJu0YzVP0rbVJIAnarn2rvdfFzQLrOezLQJBEm3q3FQg72/PwdtP1m7
	3EvBabFH8Xp+ydl9tY5kp5WFug==
X-Google-Smtp-Source: AGHT+IH8nNOOOLAfUDi0yaR0+Iww4z5LZ/2wpuTrNpM7Wh+puWgLFkfypeCZa7Z0W0L0LDb92Yf4Kw==
X-Received: by 2002:a17:907:6c14:b0:9a5:cf6f:3efc with SMTP id rl20-20020a1709076c1400b009a5cf6f3efcmr10810538ejc.77.1696861008366;
        Mon, 09 Oct 2023 07:16:48 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a18-20020a1709064a5200b0099bcdfff7cbsm6758360ejv.160.2023.10.09.07.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 07:16:47 -0700 (PDT)
Date: Mon, 9 Oct 2023 15:16:43 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	=?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
Subject: [PATCH v2] libfdt: fdt_path_offset_namelen: Reject empty path
Message-ID: <20231009141643.pgyq3zhuipmoz436@google.com>
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

Reject empty paths and negative lengths, according to the DT spec v0.4:

    The convention for specifying a device path is:
        /node-name-1/node-name-2/node-name-N

    The path to the root node is /.

This prevents the access to path[0] from ever being out-of-bounds.

Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
v2
  - allow the check to be optimized out when ASSUME_VALID_INPUT
  - add test coverage for empty paths and negative size
  - remove redundant part of the quote in the commit message
---
 libfdt/fdt_ro.c     | 3 +++
 tests/path_offset.c | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index c4c520c..7567f52 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -255,6 +255,9 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 
 	FDT_RO_PROBE(fdt);
 
+	if (!can_assume(VALID_INPUT) && namelen <= 0)
+		return -FDT_ERR_BADPATH;
+
 	/* see if we have an alias */
 	if (*path != '/') {
 		const char *q = memchr(path, '/', end - p);
diff --git a/tests/path_offset.c b/tests/path_offset.c
index 8e657af..0193e61 100644
--- a/tests/path_offset.c
+++ b/tests/path_offset.c
@@ -48,6 +48,9 @@ static void check_path_offset(void *fdt, const char *path, int offset)
 	verbose_printf("Checking offset of \"%s\" is %d...\n", path, offset);
 
 	rc = fdt_path_offset(fdt, path);
+	if (rc == offset)
+		return;
+
 	if (rc < 0)
 		FAIL("fdt_path_offset(\"%s\") failed: %s",
 		     path,  fdt_strerror(rc));
@@ -102,6 +105,7 @@ int main(int argc, char *argv[])
 	check_path_offset(fdt, "/subnode@2/subsubnode", subsubnode2_offset2);
 
 	/* Test paths with extraneous separators */
+	check_path_offset(fdt, "", -FDT_ERR_BADPATH);
 	check_path_offset(fdt, "//", 0);
 	check_path_offset(fdt, "///", 0);
 	check_path_offset(fdt, "//subnode@1", subnode1_offset);
@@ -110,6 +114,8 @@ int main(int argc, char *argv[])
 	check_path_offset(fdt, "/subnode@2////subsubnode", subsubnode2_offset2);
 
 	/* Test fdt_path_offset_namelen() */
+	check_path_offset_namelen(fdt, "/subnode@1", -1, -FDT_ERR_BADPATH);
+	check_path_offset_namelen(fdt, "/subnode@1", 0, -FDT_ERR_BADPATH);
 	check_path_offset_namelen(fdt, "/subnode@1", 1, 0);
 	check_path_offset_namelen(fdt, "/subnode@1/subsubnode", 10, subnode1_offset);
 	check_path_offset_namelen(fdt, "/subnode@1/subsubnode", 11, subnode1_offset);
-- 
2.42.0.609.gbb76f46606-goog


-- 
Pierre
