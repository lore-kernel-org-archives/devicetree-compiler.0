Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C137D17726
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RJlCPFcX"
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A931A4
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 02:28:29 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9ae75ece209so982628066b.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696930107; x=1697534907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNTHrGem+uwvg3iZrryH99QZwVCip8tGwUBOkge/1Zo=;
        b=RJlCPFcXb+9YtytGFVn4OFEez9l//knH1KtWTlaIdehfzzeXeiBkig6rYvK25/X+m4
         RakzKlmjHAhkQJVMDBNcNQJ96eXkkjV5lKUVYX18T2G4VmdN9moMrdpiP/VmY5QbD9yn
         r5iS8YupSusz+HiKpdFVID3SfEke+KqN8fxy5/zboI/X0uBh3ljVDDSB4bPfZOlth3Os
         V00+65oOqJqLRCvKNotgV4YFW4nQ8bBr/4oT8d70OmOeKb/5lcESLNUGa7Yd8n3hse68
         bYc79QvCebGcwxTVicis8v+1Pm8PnXjab4x5p1I2NgaJ4X4viRN5N/P763FDV86NIYqg
         G0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930107; x=1697534907;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNTHrGem+uwvg3iZrryH99QZwVCip8tGwUBOkge/1Zo=;
        b=hOUMsgYo6XT0g0j31oN5YHRRfEdCtLzdcUMqFVGZLuQWW113TXZmn+0HUNtY0z2F4V
         zvEibh1JKmUTuEMjBZhgRFRqmGelU9jR+2IJ+6iIU8hW1B6u/p7E/gUZ0FaUPo6vbiDy
         FCfAa7CUL1zcmkgzrTnyHoP+wggyZGDI8nJ3cJcmxHXcqyGkkTOx9ksHp/18TQ8mKSvG
         zBYa19aWAUc32Oi2+/2DL/qNMcDnvVVKc5IQVQbXaYkIcLvc9jKa+BD0PBJKVj/7uA8l
         LW9PaTbN5MuhIT7qcTIJympO/Mb5bHJkt76tzvRQI/9FpPK+P2cCE6d4h4ck6IEFH+T4
         qr+g==
X-Gm-Message-State: AOJu0YyRn8PGEwF1zjSOZXemN7lBnPVQg342bmCfnY3va2WoC2v5H//F
	uU3Kh3oHJxVxaC9JRIv1bMMaJg==
X-Google-Smtp-Source: AGHT+IHo+Z3LwOIBxKoXCyskpAuFD7JqUUCNUxVmpCSGZ/tLZgRSkJkKQlD7PgfA2+fNSgi25uX9eQ==
X-Received: by 2002:a17:906:2215:b0:9ae:4536:728e with SMTP id s21-20020a170906221500b009ae4536728emr17493785ejs.72.1696930107271;
        Tue, 10 Oct 2023 02:28:27 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id ko18-20020a170907987200b0099275c59bc9sm8218910ejc.33.2023.10.10.02.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:28:26 -0700 (PDT)
Date: Tue, 10 Oct 2023 10:28:22 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>,
	=?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
Subject: [PATCH v3] libfdt: fdt_path_offset_namelen: Reject empty path
Message-ID: <20231010092822.qo2nxc3g47t26dqs@google.com>
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
v3
  - simplify condition in check_path_offset()
---
 libfdt/fdt_ro.c     | 3 +++
 tests/path_offset.c | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

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
index 8e657af..ad8db83 100644
--- a/tests/path_offset.c
+++ b/tests/path_offset.c
@@ -48,10 +48,13 @@ static void check_path_offset(void *fdt, const char *path, int offset)
 	verbose_printf("Checking offset of \"%s\" is %d...\n", path, offset);
 
 	rc = fdt_path_offset(fdt, path);
+	if (rc == offset)
+		return;
+
 	if (rc < 0)
 		FAIL("fdt_path_offset(\"%s\") failed: %s",
 		     path,  fdt_strerror(rc));
-	if (rc != offset)
+	else
 		FAIL("fdt_path_offset(\"%s\") returned incorrect offset"
 		     " %d instead of %d", path, rc, offset);
 }
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
