Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102524;
	b=RoGyRWKsHjvCdnFFHxIyPGbG8nbk3YaDk8NV2tTPnXiRXPxDdeq7Qb055iCLfLsx796q
	 ZkzvdBnum7VRlCFmV0/ln1/TzIfpIIsp8tmh3slZster+WnXsBWoFkdbWRHy1d+244FKK
	 2OR9wp/xD+9ZUyfx2VxOkIQ2/7sLeHfsgVaYP0VGMxfEBB0wh0NlRTLzz7ghNHZgU/QXo
	 9OcnkXzINWJ34QvKoTTAvuXrOf/jDrzl0GWYeuee1OqH3CdIjsIJE5/sRHAC+5PqC8Oxn
	 vnttCQBlX+IMV9FnRyyE6gKmFSJNrqIWGdmleA4EqgMeWd3tO2sjWx2VH+kCtJF1Vmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ty+mxNosZDEQgJWlc1VgjHUqv5sNC66M8lUtY7JU3PM=;
	b=cHlfWta6fiNmof3NBalNe5v8fv26QzGy6+kG9VF8GmQw657kMybJ3YAXxpR7P+HWCMfg
	 hw78bM3aTwLAT4DWVz3bcBxGvc2nCuFMwxa/nCGcOyKu+6GHA6f94f8+ZOXXb/QWxkr4S
	 XoIXCLO/fjeQ8TEs6Gsrl1YSSybe+Z52Qc1QTATjq7nRdcUvOhZH7YSDg9uWZWNKJ59od
	 DqIABn5Q/N8YsmVYqGRDcSv6SsvaPfEFpmmyVkvoomr3YyOgXfH+PPto4lCsCxbrdpgPv
	 aNRTbWX2cozxG9EPrSj0JfOMExg1bLkqq9Va4yLWucG8HR3mO9ILX3aXhqnQSeac1Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IO88u0jF;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46AD606A322
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 12:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C46AD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IO88u0jF
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a6f2825dd6so1021809fac.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793102523; x=1793707323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ty+mxNosZDEQgJWlc1VgjHUqv5sNC66M8lUtY7JU3PM=;
        b=IO88u0jFwoXfeY28ilMmR46esVFzpDWvNsrjbzy8e7V28wGCsb8mOpNNhKXlK4OJvR
         p9HfYyXTFCjqA8y6viUYEF8j+sl64ek3MzbWztff2KNw3cA0QJ5ornSwyEkYGVtirW9w
         w+1vZM/6LY3OUIm0DlLliGS2KVxJn/M/uVu9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102523; x=1793707323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ty+mxNosZDEQgJWlc1VgjHUqv5sNC66M8lUtY7JU3PM=;
        b=NmAOfrkbBK1C+dAi7fp4KoTFvjBoYTjOyo7P+JMJiOapyN0DIKg3nYxoqpHHYnI/f1
         UAdo13HXkBXABUdPyJj2kLGiBEfWd2TvBrYuCQR3fJIHJlhVsoOz/3VZ2LZATDJA7yeT
         Kil955lKjYUOrIY07F0+vHe3jItIt0WDPsgN4GMekcoI5mbyYXmcglnEik/nAPCkzo2R
         88CB4ShltAbELrOYNLedQEJnso7GEjE+WbO7PGe37IEpgt3uB+VtffBuOJRIgNLWcZlD
         ixnIXelznkdgdx2ePjbsvrGhyyiJxAz90lDXw4taRB1KnipHldYyMB3Pol/XUe4NzgwJ
         T0Vw==
X-Gm-Message-State: AFq9FYK7oeLrmrK9DsnKlgezCif7SM5JBsKPtAhUZOJ1Yt6HTYPSQfCI
	C/eq5b8IbWZeGRiTMMn054ulCRm9jMtm8JHYJazztAcdEH9U+FclawU2xTREaw6hYB1/sIloqBC
	kgcbIpQ==
X-Gm-Gg: AYBFou2QnmPt1j9makGW6P4PjU7Stz9I46ITiFdmyWXJvde8a6hr0nvjHv3bQUhDuph
	AkSthTxoaJZX9XOr1PmJ+B3npcNLuCgcOw8nJV6gcDiUOrvQXxw2wQQfLqb99Rk5p+qTSsi16td
	Fjzko/7brrkoXPwjtsq/icXsmWIpuR95GRfOH2drAwYYahkyFOoAK7J89bFcQSmyjXpIhygOXHp
	uwHNsgfF1hCK0xlZjTqgbYH87yKV8vffwUOQu4kLox0EUZ6u+ZaV5xVN0VA5amDg21Pzz4K1tbo
	+burZbVc9o4GU7ZF0zDlYrU0NP8cHObcDcjhQhMpBDarCSLPJuSo9ZasUqM7xiUvWhiMnIy3wYv
	Huo09vTBKkf9q0LSXwlKlrsS89xBaur/KdE3K/+BWFbrxJQgtzdDShe89AOFJ96ixTdL43Zcu9l
	hQ4khLdEq8DjsL3OZQs4VbkCPrRsX711eslLTz6EgHM8kweiDJAP/YLQlx5rZ6SCLEDX/jGATFa
	rF9eMUA+ggunOkSvVFQf2OaZpZM7oUo3rdLtmzUz/IClfRRQNAit50tr3Vf3XyNpl06SVft867S
	p9K659++a/FsRaC+nxN+W2FmfND0bo5B/QuO6Q3dOVUmtfHNVpynagnlHQDdHQ==
X-Received: by 2002:a05:6870:658a:b0:48f:e0f6:c45e with SMTP id 586e51a60fabf-4a83f53b96amr5196273fac.44.1793102522565;
        Tue, 27 Oct 2026 05:02:02 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431c012esm7133755fac.11.2026.10.27.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:02:01 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 2/5] fdtput: Follow an alias when creating nodes with -p
Date: Tue, 27 Oct 2026 06:01:16 -0600
Message-ID: <20261027120126.2613353-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027120126.2613353-1-sjg@chromium.org>
References: <20261027120126.2613353-1-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A node path can start with an alias, such as serial0/sub, but -p does
not allow for this. It looks up each part of the path from the root, so
it creates a top-level node named after the alias:

   $ fdtput -cp test.dtb serial0/sub

This creates /serial0/sub instead of adding 'sub' to the node which
serial0 points to, and reports success. When writing a property, the
stray node is left behind if the alias is the whole path, and fdtput
fails if the path continues beyond the alias.

When the path starts with an alias, create any missing nodes below the
node which the alias points to. Keep the existing behaviour for other
paths which do not start with '/', which are created from the root.

Fixes: f807af192828 ("fdtput: Add -p option to create subnodes along entire path")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 fdtput.c           | 18 ++++++++++++++++--
 tests/run_tests.sh |  7 +++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index c139de1..4094015 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -201,8 +201,9 @@ static int store_key_value(char **blob, const char *node_name,
 /**
  * Create paths as needed for all components of a path
  *
- * Any components of the path that do not exist are created. Errors are
- * reported.
+ * Any components of the path that do not exist are created. If the path
+ * starts with an alias, they are created below the node which the alias
+ * points to. Otherwise the path starts at the root. Errors are reported.
  *
  * @param blob		FDT blob to write into
  * @param in_path	Path to process
@@ -214,6 +215,19 @@ static int create_paths(char **blob, const char *in_path)
 	const char *sep;
 	int node, offset = 0;
 
+	/* a path which starts with an alias is created below its node */
+	sep = strchr(path, '/');
+	if (!sep)
+		sep = path + strlen(path);
+	if (sep > path && fdt_get_alias_namelen(*blob, path, sep - path)) {
+		offset = fdt_path_offset_namelen(*blob, path, sep - path);
+		if (offset < 0) {
+			report_error(path, sep - path, offset);
+			return -1;
+		}
+		path = sep;
+	}
+
 	/* skip leading '/' */
 	while (*path == '/')
 		path++;
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 842b543..77f0a81 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -970,6 +970,13 @@ fdtput_tests () {
 	"-ts" "fine wine"
     run_wrap_test $DTPUT $dtb -p /you/are/drunk/sir/winston slurp -ts twice
 
+    # Automatic node creation below an alias
+    run_wrap_test $DTPUT $dtb -p /aliases second -ts /blackadder/the-second
+    run_wrap_test $DTPUT $dtb -cp second/carrot
+    run_fdtput_test "orange" $dtb second/carrot colour -ts "orange"
+    run_fdtget_test "orange" $dtb /blackadder/the-second/carrot colour
+    run_wrap_error_test $DTGET $dtb -l /second
+
     # Test expansion of the blob when insufficient room for a new node
     run_wrap_test $DTPUT $dtb -cp "$(cat $text $text)/longish"
 
-- 
2.43.0

