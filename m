Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172897;
	b=GnfXuBh9UH37lTJQ7txCkxxSgnZbwcUga5FFjHqaGu96FnCihnxZG/AANnrhg9PI0fiu
	 vhP9VhZtau7LqzrxZd6co+d8N/gq5z/SPMfjvYyxncfloumIomzXU9kZVgtTE9IStXRdX
	 YntVFBlsvcTEPPszq0WQO6wZC/xAB7RJ67AOO+JPIscBxnsz1SoifJUiC8t9VEgIeiQ8/
	 jDcZLv3yQHfAvNh6PmBEcQj32eRs5VFjHA7kNtvrFSn7ncIukuEf1g8+NiXi+m1YK3uYn
	 kgz3tXFyrhoS+nSZ6dMJ9WO0H6KdFPELHsctgSTrYF7D75EDv0gnGlRG8cpffiTnBDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e+Z4smEyLwV2pW7eiE/pJtR5hZRF0UYpKKvZr8V2b34=;
	b=PyVIkNsdzNml7KcXZAblW1J/mHLiTFzu494syQkcNnLagib9pvzqdNfIV7UatIlAlcnh
	 3kTf5cRW/TeisQEgI8rdY5OYEzV7gbyPuk3CUrqe3/OQvR5csQu39tCKhP+11dxvwbBnV
	 dXZjDP9HHkZW1a8zuHpNOQgER57O7DHwjrudfP0bbiRTC6JQ4ilb71bSNIgEAnAXs4esB
	 o7NzRFjoN/+TrcRt+OxqjMWvXq8F0+YErqa5IxSPWMvymhqSxc6PxDGrSNNg29cocLS/T
	 QGl3h3+OxnSa71MlThsRvX+k1VJx2gbSqZVsZZKX++TdukQUUQoavn1kEVlL+rjJnJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VIQeXYxB;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCAF606A31A
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 07:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCAF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VIQeXYxB
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-845788309b4so328271a34.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 00:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793172896; x=1793777696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+Z4smEyLwV2pW7eiE/pJtR5hZRF0UYpKKvZr8V2b34=;
        b=VIQeXYxBua9NhxfZN/jbU5aYl7zvRDAo9UxVlETSOEIPDZRhnVkcrgY9cy+LreyY/C
         NNzpvzyRYQubiqfWaZLaRmN4PdvfngcQ4N6Gyyq1A6MG6SElTrCPbwKaRjs08fbBkhfb
         QNwJuPMUWYZuwelDQ/Ataald+wbsKUXwTsoLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172896; x=1793777696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+Z4smEyLwV2pW7eiE/pJtR5hZRF0UYpKKvZr8V2b34=;
        b=wVQxpT7sOk615skiD2zznDw5ruiMSygUc0H4zl7F9K3+PE/phGiobWLyj7o9ST7PVg
         5f5r4k9/cWuNH74bqQgpDT5ZOz7TJzvrLrCHW4yS/PbC9ZrWAG3Rj+5srkLngom9dL1A
         sddNmMcppzz/qgr2AXrmoHPRu4fplz5HV8lsHT0nS2uvPknseYwHlVCySUMiUNIt1xq+
         9oYK7fIe9TUU2IIepd9jDdkYBN9CjYpdT7gSwUEIdM8K1auz1aBfKjEhwcjztzrz/Lti
         JF+kGI+x2Z01ywKJq2a9MmIXt3q/qUXpI/aoVM2eb0nJjSkcMoGwfbyAesPWy7d3dZrc
         gdTg==
X-Gm-Message-State: AFq9FYKzrFG8Ce/WmAt8ed0H4/L3GRy5DDSDt7vIO75LBQb2sA+siTfA
	CEL9yHRMXBhP0OkfPJSJg2QXFpCPU0Cp9M0r0I0V3GXhfu+WT3/iSrokcLbSKte3/WWPUpRry/U
	i6IQ0Ww==
X-Gm-Gg: AYBFou2AYhdfk2uZPuYYeKKUcZaVXnLxDClfKu6jdH6mJ0CRtExDZZCvXKrpIWHiJkb
	pb+N8g469KsFoG4F2L03CJ+NSzv6xxdF+VFocjPNx72QlZ86BqashdYGkbkI2CB5TfrH4MYfmKq
	vt6E/ucHK446AaJ1mVe7mBm7eyDxOiQ06MXEqY8fcBLc6Cyqrgpj5XhbgAb3RSqfTH6vcPzc9KU
	GAGqfxt7Us7/Wa/rQzi1ug122E8/xznBnzpA++A9Km1RJwdbaIAtWXatoluWTWOB9JaT2xXKkOG
	xTfn8yiHQuvHugZhne+obXGyCi7Z98v7bvtAjqzGIN7hS+laGIfQvFy4CxJTg86mjDfIi8PdGRa
	tsorMJPm5+pTWvkgNuk+eMA54w6f8s1fSvwzoca7gQNVZDK2H0RdExHTfj4JsqYCknzb8DQQQeH
	q7pbrT72aE8pW9GNTkhgdxtqWro+yvqSmfmfTMhubMxCUQgVTz6v5UQP0oguqrPJi0mAN8/ZBUA
	JAFIjA9GOptMl5kU3NIS6dJQJGo+xwX1Cn9N/rWl2hJcGYEDnW9iOzMV6cu1kb4EWui9qxm2vFZ
	tcmghSs/NvnWy1/Wy+gt/pWASsN3C+d3q2wZeGeBvTYdCKu6zo148FuW4v95yQ==
X-Received: by 2002:a05:6830:44aa:b0:81f:6e05:c1aa with SMTP id 46e09a7af769-85ac070a365mr1547560a34.18.1793172896288;
        Wed, 28 Oct 2026 00:34:56 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b20219dc4sm928838a34.22.2026.10.28.00.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:34:55 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 1/4] fdtput: Require a leading '/' with -p
Date: Wed, 28 Oct 2026 01:34:17 -0600
Message-ID: <20261028073440.3327687-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028073440.3327687-1-sjg@chromium.org>
References: <20261028073440.3327687-1-sjg@chromium.org>
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

With -p, a path which does not start with '/' is created from the root,
so a mistyped path silently adds nodes at the top level:

   $ fdtput -cp test.dtb foo/bar

This creates /foo/bar. The same happens for a path which starts with an
alias, such as serial0/sub, which creates /serial0/sub rather than
adding to the node which the alias points to.

Without -p, fdtput rejects such a path, since fdt_path_offset() treats a
path without a leading '/' as starting with an alias:

   $ fdtput -c test.dtb foo/bar
   Error at 'foo': FDT_ERR_BADPATH

Report an error with -p too. The next patch allows such a path to start
with an alias.

This changes the behaviour of -p, so a script which relies on creating
nodes this way must add a leading '/'. Do this for the existing test
which relies on it, and add a test for the error.

Fixes: f807af192828 ("fdtput: Add -p option to create subnodes along entire path")
Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch to reject a path without a leading '/'

 fdtput.c           | 9 +++++++--
 tests/run_tests.sh | 6 +++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index c139de1..d0f8420 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -201,8 +201,8 @@ static int store_key_value(char **blob, const char *node_name,
 /**
  * Create paths as needed for all components of a path
  *
- * Any components of the path that do not exist are created. Errors are
- * reported.
+ * Any components of the path that do not exist are created. The path
+ * must start with '/'. Errors are reported.
  *
  * @param blob		FDT blob to write into
  * @param in_path	Path to process
@@ -214,6 +214,11 @@ static int create_paths(char **blob, const char *in_path)
 	const char *sep;
 	int node, offset = 0;
 
+	if (*path != '/') {
+		report_error(path, -1, -FDT_ERR_BADPATH);
+		return -1;
+	}
+
 	/* skip leading '/' */
 	while (*path == '/')
 		path++;
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 842b543..644c405 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -970,8 +970,12 @@ fdtput_tests () {
 	"-ts" "fine wine"
     run_wrap_test $DTPUT $dtb -p /you/are/drunk/sir/winston slurp -ts twice
 
+    # A path must start with '/'
+    run_wrap_error_test $DTPUT $dtb -cp baldrick/turnip
+    run_wrap_error_test $DTGET $dtb -l /baldrick
+
     # Test expansion of the blob when insufficient room for a new node
-    run_wrap_test $DTPUT $dtb -cp "$(cat $text $text)/longish"
+    run_wrap_test $DTPUT $dtb -cp "/$(cat $text $text)/longish"
 
     # Allowed to create an existing node with -p
     run_wrap_test $DTPUT $dtb -cp /chosen
-- 
2.43.0

