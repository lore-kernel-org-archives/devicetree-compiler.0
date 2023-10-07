Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE041FD1
	for <devicetree-compiler@vger.kernel.org>; Sat,  7 Oct 2023 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4XDCdIQ7"
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECCA83
	for <devicetree-compiler@vger.kernel.org>; Sat,  7 Oct 2023 04:07:17 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5384975e34cso5362202a12.0
        for <devicetree-compiler@vger.kernel.org>; Sat, 07 Oct 2023 04:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696676836; x=1697281636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkmU0eSKu3uW14P7t8VQfydbXWsckDVgfM+VJYuFI+g=;
        b=4XDCdIQ7zgMWm7oqqi5Oz62EjLZZctLUjkdFDIyOYjJrWbN+AmlEZGHS3ZuNEOLJSB
         glERhWSBn1SjqsvDfcc5qPw8xC1xkbKphZVKsIR+o3cm9cm2PpO7Bl3EXPxSyrOGv51n
         J9iQqm9brp16uHr4wO9QlWB2udZGMmy79LdYrIcban1FYXHOBl/NvcDlUE7WmXSDt4sQ
         kJPZKGKDsiBnscDJhBbSdQjLf27N+1m43MOG1lMDLOc+4dKRbJIVOGezz4aeRpgXyhzN
         UCmEHmWdUwkgVOEBZuRjATgCtj18WzASMNUPORkL5chU1GgvWSox/9CS8KhbAEjDeRuB
         ZpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696676836; x=1697281636;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkmU0eSKu3uW14P7t8VQfydbXWsckDVgfM+VJYuFI+g=;
        b=iCfz4Cfstu70y1ikn/9poK5hUK8i83XOgl+xW3PFq2II/KbmNrZzzGhiC9c+95wUet
         DKtfz5b7UrEU9FmF8H5kwrktMoFYiwj9uOlyT7ivyN/JitsXRhO2+PwrQVV+jqDWIRgh
         ZDpKipBW5uUXr44rBKScoy+eZBPw5k/ywliyieNi16Dqx8DwQk/JGEKRtHzGJC/3CmNs
         Z0ErIPTlAw3YOlfiXXTXsM2EnJfggF9LpfVCj62w/GSjHnvTGK44emZRqoAOxSgfzd4U
         hpuUUloJqDdQtJ8FW7jKXFs8CUxgJJEFdRcp51nusitc7xzdAfZT7DYqnZArUHtLgOVQ
         uQ/g==
X-Gm-Message-State: AOJu0YwCTzvDtD7OHGXxes2kPS+5ESuIg8mni7aDxFnlvWOU0ywO8KiH
	3WuDDRjzs4HNMxGBsI0jnB20x4qX2AL88HVmpWp9Ow==
X-Google-Smtp-Source: AGHT+IHcqxOm1BbZNRU+dfR4pEibIvAWg9Dbsf2UFPF3BvBFJ76XKskWeOHBc94mYUUouayWGvpUsg==
X-Received: by 2002:a17:906:10cc:b0:9ae:4e81:4580 with SMTP id v12-20020a17090610cc00b009ae4e814580mr9760266ejv.66.1696676835764;
        Sat, 07 Oct 2023 04:07:15 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7c59a000000b00530ccd180a3sm3684961edq.97.2023.10.07.04.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 04:07:15 -0700 (PDT)
Date: Sat, 7 Oct 2023 12:07:10 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org,
	Mike McTernan <mikemcternan@google.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <20231007110710.i2oj24oirdtyt5m4@google.com>
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

Ensure that the alias found is valid i.e.

    An alias value is a device path and is encoded as a string.
    The value represents the full path to a node, ...

This protects against a stack overflow (fdt_path_offset_namelen() calls
fdt_get_alias_namelen() then fdt_path_offset(alias), ...) when /aliases
has an empty property with an empty name.

Co-developed-by: Mike McTernan <mikemcternan@google.com>
Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
 libfdt/fdt_ro.c   | 11 ++++++++++-
 tests/aliases.dts |  3 +++
 tests/get_alias.c | 12 +++++++++++-
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index c4c520c..bda5c0d 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -537,7 +537,16 @@ static const void *fdt_path_getprop_namelen(const void *fdt, const char *path,
 const char *fdt_get_alias_namelen(const void *fdt,
 				  const char *name, int namelen)
 {
-	return fdt_path_getprop_namelen(fdt, "/aliases", name, namelen, NULL);
+	int len;
+	const char *alias;
+
+	alias = fdt_path_getprop_namelen(fdt, "/aliases", name, namelen, &len);
+
+	if (!can_assume(VALID_DTB) &&
+	    !(len > 0 && alias && memchr(alias, '\0', len) && *alias == '/'))
+		return NULL;
+
+	return alias;
 }
 
 const char *fdt_get_alias(const void *fdt, const char *name)
diff --git a/tests/aliases.dts b/tests/aliases.dts
index 853479a..8820974 100644
--- a/tests/aliases.dts
+++ b/tests/aliases.dts
@@ -8,6 +8,9 @@
 		s1 = &sub1;
 		ss1 = &subsub1;
 		sss1 = &subsubsub1;
+		badpath = "wrong";
+		badpathlong = "wrong/with/parts";
+		empty = "";
 	};
 
 	sub1: subnode@1 {
diff --git a/tests/get_alias.c b/tests/get_alias.c
index fb2c38c..4f3f6fd 100644
--- a/tests/get_alias.c
+++ b/tests/get_alias.c
@@ -21,9 +21,16 @@ static void check_alias(void *fdt, const char *path, const char *alias)
 
 	aliaspath = fdt_get_alias(fdt, alias);
 
-	if (path && !aliaspath)
+	if (!path && !aliaspath)
+		return;
+
+	if (!aliaspath)
 		FAIL("fdt_get_alias(%s) failed\n", alias);
 
+	if (!path)
+		FAIL("fdt_get_alias(%s) returned %s instead of NULL",
+		     alias, aliaspath);
+
 	if (strcmp(aliaspath, path) != 0)
 		FAIL("fdt_get_alias(%s) returned %s instead of %s\n",
 		     alias, aliaspath, path);
@@ -36,6 +43,9 @@ int main(int argc, char *argv[])
 	test_init(argc, argv);
 	fdt = load_blob_arg(argc, argv);
 
+	check_alias(fdt, NULL, "badpath");
+	check_alias(fdt, NULL, "badpathlong");
+	check_alias(fdt, NULL, "empty");
 	check_alias(fdt, "/subnode@1", "s1");
 	check_alias(fdt, "/subnode@1/subsubnode", "ss1");
 	check_alias(fdt, "/subnode@1/subsubnode/subsubsubnode", "sss1");
-- 
2.42.0.609.gbb76f46606-goog


-- 
Pierre
