Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6416429
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g5O/uBTk"
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4CFD8
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 02:27:31 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53d9f001b35so421764a12.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696930050; x=1697534850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TF0vLCcy8l1ICAyn4qSbzsKxp/pq9jHL/rEgVHLd78o=;
        b=g5O/uBTkhxyZT2YkP9n5xMd5Tb8jN7sn+5fEFzusZFMQI5mdPKtwnKYoZyZLURpYN0
         mo//o51EwVgJ9uFcEkGmp/cSBmDjQXcBhTeuX/j6f6aNaD1vLt+Yb2+AlxekDdBwXK4b
         nC+IAZGZcGtAwcJ87Op8tJzcQ2okn9EFKbhyjGUQm7AendNZCzVymciAEGIwqjdXKiKw
         SVMsHV7c2+ckTkhDacl2s5kPyrS2D/02dzHghiBO2iqus+2PrB/xvTPKXwxaklWgs2er
         3YNVyipcOG6egiO2GDMiEI3knU6JJQczmE10r5Og82EGWZ1qzSQ6U43pIZvcMlzhBCR3
         Y1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930050; x=1697534850;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TF0vLCcy8l1ICAyn4qSbzsKxp/pq9jHL/rEgVHLd78o=;
        b=RdlXADTNpZFsY0aHOdRjglxOawzlnn6wf9RtXs0dsK4sOR82MjFh4eRV1iATqsXBLA
         7Dn5hZ3ogVFbPew86jUf2Upi4iiCINecHlbLDw5kHelvKdqb+wHSA0iVTSIkpVBQdTW8
         t9Bwq7R9CRveVj4lqKKWN0jk11tQAfgPnovpzG3uHl/n5f1NV5yGdl8G3EbvyUw7MDOE
         J2Az3UczoGh1L9ETB2z4iKFQuIZk0RQQOLmZtV0KGT/PITbLjfqETfTWiipyOfK7L2hn
         CTbX+cNYVt0V/rJ/rJs66ffxYEsv+LYC3GfofeEyzLecW/QN8Nn/uGGJ+a+Lx7JyLWaU
         r7EQ==
X-Gm-Message-State: AOJu0YxDkwMZJA22EVKocJ6EFNKfD21VoQgn5TEqkOHeWYR2p6GijZav
	73npK/VlUNoho7KytCu95Ra/rg==
X-Google-Smtp-Source: AGHT+IHuZbe9ylQY9uuFevrgxrBcoCJBPd7n8T9mt6EJOue54fpMMzLXJLzp4Hc0mbkBsyGGTGuGgA==
X-Received: by 2002:aa7:cfd2:0:b0:534:6668:605b with SMTP id r18-20020aa7cfd2000000b005346668605bmr14838834edy.22.1696930049714;
        Tue, 10 Oct 2023 02:27:29 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id ee48-20020a056402293000b0053120f313cbsm578437edb.39.2023.10.10.02.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:27:29 -0700 (PDT)
Date: Tue, 10 Oct 2023 10:27:25 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org,
	Mike McTernan <mikemcternan@google.com>,
	Simon Glass <sjg@chromium.org>,
	=?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
Subject: [PATCH v3] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <20231010092725.63h7c45p2fnmj577@google.com>
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
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Ensure that the alias found matches the device tree specification v0.4:

    Each property of the /aliases node defines an alias. The property
    name specifies the alias name. The property value specifies the full
    path to a node in the devicetree.

This protects against a stack overflow caused by

    fdt_path_offset_namelen(fdt, path, namelen)

calling

    fdt_path_offset(fdt, fdt_get_alias_namelen(fdt, path, namelen))

leading to infinite recursion on DTs with "circular" aliases.

This fix was originally written by Mike McTernan for Android in [1].

[1]: https://android.googlesource.com/platform/external/dtc/+/9308e7f9772bd226fea9925b1fc4d53c127ed4d5

Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>

---
v2
  - replace memchr('/') with check on last character
  - add test coverage of a self-referencing alias
  - drop redundant test case on alias to non-absolute path
  - reference the DT spec and AOSP patch in the commit message
  - rephrase the infinite recursion case in the commit message
v3
  - swap (len > 0) and (alias) checks to better align with the API
  - point the "relative" alias to a path that exists in the test DT
  - simplify the infinite recursion case in the commit message
---
 libfdt/fdt_ro.c   | 11 ++++++++++-
 tests/aliases.dts |  4 ++++
 tests/get_alias.c | 14 +++++++++++++-
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index c4c520c..9fe2f49 100644
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
+	    !(alias && len > 0 && alias[len - 1] == '\0' && *alias == '/'))
+		return NULL;
+
+	return alias;
 }
 
 const char *fdt_get_alias(const void *fdt, const char *name)
diff --git a/tests/aliases.dts b/tests/aliases.dts
index 853479a..03ed675 100644
--- a/tests/aliases.dts
+++ b/tests/aliases.dts
@@ -5,6 +5,10 @@
 	#size-cells = <0>;
 
 	aliases {
+		empty = "";
+		loop = "loop";
+		nonull = [626164];
+		relative = "s1/subsubnode";
 		s1 = &sub1;
 		ss1 = &subsub1;
 		sss1 = &subsubsub1;
diff --git a/tests/get_alias.c b/tests/get_alias.c
index fb2c38c..d2888d6 100644
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
@@ -36,9 +43,14 @@ int main(int argc, char *argv[])
 	test_init(argc, argv);
 	fdt = load_blob_arg(argc, argv);
 
+	check_alias(fdt, NULL, "empty");
+	check_alias(fdt, NULL, "nonull");
+	check_alias(fdt, NULL, "relative");
 	check_alias(fdt, "/subnode@1", "s1");
 	check_alias(fdt, "/subnode@1/subsubnode", "ss1");
 	check_alias(fdt, "/subnode@1/subsubnode/subsubsubnode", "sss1");
 
+	check_alias(fdt, NULL, "loop"); // Might trigger a stack overflow
+
 	PASS();
 }
-- 
2.42.0.609.gbb76f46606-goog


-- 
Pierre
