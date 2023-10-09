Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7E23588D
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Oct 2023 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="stZaEhj2"
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FA5F0
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Oct 2023 07:20:13 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c1c66876aso836811766b.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 09 Oct 2023 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696861209; x=1697466009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RmOBpm2g3N/dhd6WxCEGlnC5xYoyoJ5M8HzGYatUww=;
        b=stZaEhj20xPEY0x4aHZugqc3xQmyW+RmHDZrmsZw8JBgdkq27gpP10QIDfX5dq4oet
         M3mXyEC4aMe6kqRrpufCyPs8oJcSx0dNz2zfDV3TeJFA42iVS36rWu0K63B9ee1gPi1g
         w4E1BQe59ETzs/3G1xbg9/RwrYgmBoHnc2gWU+H4DspNpjq+gBXwzMRLjJkdN6Ut8B9m
         iJX8rTRUhfGTq3lxdXoiUkA8bnkIaQ/Pqk2B9Vx7UB3Z3JsXB2tsOCbMga87sL8z0D7u
         f4709tJQ4cK2RVVv5dGj5F6Uan11ZAHIZ/6QlEmTcprwnqecnAb8CMwu8De/kDq1wvv0
         VhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696861209; x=1697466009;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RmOBpm2g3N/dhd6WxCEGlnC5xYoyoJ5M8HzGYatUww=;
        b=tF07RBuyqXWKDLFEcTv7XsOaywPh1TfcrFavGcYib2Ytp60h3stB37zQRnm41nio/U
         qYE/cte3oAcowtjCnNNMerIEvLf3XZIvONrYS93jMD0xMfIG3OYXdnAg/r3w9Pw5g0fm
         1KR1/44DTV3IbRz1BC3jHGtAYwVx5jPtbGO0O+FKXHxushe4YXFRryrNdCcY1K4d+eGf
         ST5xePm9bO+/ieF+z4BCbMTTaIlAjMlLE7O0erlFXOYlTzDQ5Yv+NBohZanBh03SBBZZ
         8X7GbfqwReHC9mJXXKBOHL2Y6mUo8cLIUeiJJdW2YYDlt5zFrafmaBjg/L9jR2aoxCQX
         mRCQ==
X-Gm-Message-State: AOJu0Ywb2n8xqL4rQIuF3JLRVRvQ8s96Bi8yst/sEMrmHQrpEz/0/nPb
	ech0+f8l7xD3qmngCqZjmqcDQA==
X-Google-Smtp-Source: AGHT+IGjED6GCjnnJHAK6eS7FWVBetx1PvC/6hrMpAUhyT7ld6QmN43OqsbZk5K8afm9mjson2JXlA==
X-Received: by 2002:a17:907:1dd8:b0:9ad:f143:e554 with SMTP id og24-20020a1709071dd800b009adf143e554mr12297446ejc.30.1696861208640;
        Mon, 09 Oct 2023 07:20:08 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id lf1-20020a170907174100b00992b2c55c67sm6809669ejc.156.2023.10.09.07.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 07:20:08 -0700 (PDT)
Date: Mon, 9 Oct 2023 15:20:04 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org,
	Mike McTernan <mikemcternan@google.com>,
	Simon Glass <sjg@chromium.org>,
	=?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
Subject: [PATCH v2] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <20231009142004.m4af5c2utpzoll2e@google.com>
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

Ensure that the alias found matches the device tree specification v0.4:

    Each property of the /aliases node defines an alias. The property
    name specifies the alias name. The property value specifies the full
    path to a node in the devicetree.

This protects against a stack overflow caused by

    fdt_path_offset_namelen(fdt, path, namelen)

calling (if 'path' contains no '/')

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
---
 libfdt/fdt_ro.c   | 11 ++++++++++-
 tests/aliases.dts |  4 ++++
 tests/get_alias.c | 14 +++++++++++++-
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index c4c520c..39b7c68 100644
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
+	    !(len > 0 && alias && alias[len - 1] == '\0' && *alias == '/'))
+		return NULL;
+
+	return alias;
 }
 
 const char *fdt_get_alias(const void *fdt, const char *name)
diff --git a/tests/aliases.dts b/tests/aliases.dts
index 853479a..b880176 100644
--- a/tests/aliases.dts
+++ b/tests/aliases.dts
@@ -5,6 +5,10 @@
 	#size-cells = <0>;
 
 	aliases {
+		empty = "";
+		loop = "loop";
+		nonull = [626164];
+		relative = "rel/at/ive";
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
