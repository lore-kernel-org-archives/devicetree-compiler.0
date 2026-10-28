Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172905;
	b=nD2rfQJJ91cKvR5IwgGV7IWhaMeJwbopb8b9C9faZvoUzlYHSVOvUn8LUj2ff1W83wLY
	 wJSt4zEyL2kDm1matyCgSBbjE/ZlxUkczx3PvTrHeY5t9ZbEDi3nfKdVZW+wTIe13k6P5
	 ymJmpoQUouuDCq/SJ+NnEwVr7Eiy6hXQNCD1mEwm5dOlGA0SJM8XeTqDcprFyMpJH+/kh
	 s39f/cIOMxmGZuzUOMhRLSMuL9GM6036pwIJs4ykLdUCgAsou96MA/pVycg6UJ4wP/8EE
	 497KZmVRr07yP0p7+yF8TD32sEo4waYbprxBhrhckKYhEHrHx1ZpHU9vfrbxAA4bo6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FMzhud1rcoRDpLQHUobvkCm302kyjJjBpr88MCwdM4g=;
	b=kBB/+nri86X2aOGipqkdkSAzElaR/JckeeY0LlUSxho8NuumttnebEvXqQA7IQfy2QK+
	 9z0RlNsdSW3p4CNtVFr3SbZHr6yARz0W3aZUUreqbd7zLAucbzdExYRHWLbaAFDwl/GqA
	 7/pCHNPRCyW1BkHmkW0aG6h/RqlVy+hRHZsUNOSnpfi0CPW2U7AOa00ITAVKhMWPGVWE/
	 8XR0usMlsWUBNa+2QS0Zaz3xPMESAiqFo4C5JXWyoM/mo0hJ8a3fdAT0clKyma6m1I+a/
	 5YOEU8Jt+wj8iBL4L7LxyAJ4xgT1mTBeohWkQAZg2ZOQlxBvTujYJx7wfLj1XuF/THA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QUj8YjW3;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9556606A32A
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 07:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9556606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QUj8YjW3
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f84a55cc06so365449a34.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 00:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793172904; x=1793777704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMzhud1rcoRDpLQHUobvkCm302kyjJjBpr88MCwdM4g=;
        b=QUj8YjW3aJDD7+PEvi0/LMYhxicfu/elym52rzog+1DURmdjECbqbAvHfeQag2XFAn
         iC3W2lUyZ2a7EziZ8rnXRpK5ZUcbo7kg1jA3V9KVfcnH3KD6rxTKAl0YXLBpL59wLGo2
         gP+MXCcIIisJXgDtT+hzaN4mU09dpsZkUvhfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172904; x=1793777704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMzhud1rcoRDpLQHUobvkCm302kyjJjBpr88MCwdM4g=;
        b=G6AvjNJ3HGLKjMh5F2l1EIxqFKaZEIHvZZRuI2rm4EZoZv+qExYVJ6kfgBOlhZAUb7
         aAN5apOxXz6xnzN2KN9+HzlvupJRDwbktlT4Ip1ZdSFPwzwgtkqyrYCdHuNi3V/N/iuO
         XRQV4256UuLUutQ+gV7UfKoNMKTb7MF4QK4BIE3dBCJkrEaQ4y74OOaKCjHHNQ0U41Bx
         v13ne1D/QnYM40WfiSP/qZS3GF11Q72DH6mUNJg4OUK4p4ThRJG6nt/uh0PIxtp83IoX
         OvoCdyeQzlz5G6P/zmQw5nOIYE7O1nTv4n/NhuPkTjvG154XadUWyeYNVk/WFET9uQGy
         LRRA==
X-Gm-Message-State: AFq9FYKzSBhf6xR/lX28Kk5U2RmL2ZVaq/fGYkqnpZ/kqbUmI3Cn90na
	XBynvf/cUl3OqlebgL6fx1Vrm2pC+tzM4aDi2+6qHxPhAXlda6g05NDULCjO3mYaRMvLJTW7CX6
	rHA458A==
X-Gm-Gg: AYBFou0VZeidCKzdWeBXJCVfbs0qbRzUmq9kK2cFKxy3LNoJ+/XTJ4BGd18YDVGJLNp
	lwYvNR2fCdsfKoQIa1aqKcYNzRxoCuLdMP4+WIRPc/J9JTGYbqc2R7ho0U0XtOTcWwZfehSQbiC
	vZg76RlP28GfSfJDs7CRZaHh8PwgoDqC02CyPV92tY33Rc3jUM/3s3DuF7qYA9aBNSk0cHQwfEx
	I6RP8Pkr6mcGwF2Nve6HIkJMowdwpXRCSTJ1c3c8QlsYdgK7OOYcCJRplPckRA2ua50+q6Vou+S
	dh5DnQ9yuU7pS/RVFr0cgaVCl9zyoqTA8Jos3KECeMPs7tMELxbkX7Z9MHY3w1VSTicIQ3sOa6F
	yptBW1WxYfTey/hBb+IuRwajT385hspc6psZ1bMo55Bej64DWPzQB8dHCGp9LgI4ive88PkQrZl
	sdw6+sfJ7jFdv0wTv3AgNg7NvkJSyGhvvMNjTtLB3jARAdS/Uud69R8xi5uzaNn0xauSbPq2OQ5
	Kemeyw97lD+eqIy6sAE/nrAH3XYvyQFJT7xxKPzKvwGJvVkhBribMC6nOK5ptzo20gSTC+TxZUZ
	pTyyPyGjQjP0zD8pkBAAvgPlCAaMMHNmdyJ2ud1/S8p4EP4h6iNc04tR9DFKIA==
X-Received: by 2002:a05:6830:2705:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-85ac10c7bcamr1508084a34.25.1793172903642;
        Wed, 28 Oct 2026 00:35:03 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b20219dc4sm928838a34.22.2026.10.28.00.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:35:02 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 4/4] fdtput: Name the property when it cannot be deleted
Date: Wed, 28 Oct 2026 01:34:20 -0600
Message-ID: <20261028073440.3327687-5-sjg@chromium.org>
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

When 'fdtput -d' fails to delete a property, for example because it does
not exist, the error names the node rather than the property:

   $ fdtput -d test.dtb /chosen missing
   Error at '/chosen': FDT_ERR_NOTFOUND

This suggests that the node is missing, when it is the property that
is.

Report the property name as well as the node:

   $ fdtput -d test.dtb /chosen missing
   Error at '/chosen', property 'missing': FDT_ERR_NOTFOUND

Check the message in the existing test for this.

Fixes: aa719618a8b7 ("fdtput: add delete node and property function")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Report the node as well as the property
- Check the error message in the test

 fdtput.c           | 3 ++-
 tests/run_tests.sh | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index b8d5081..610cad4 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -334,7 +334,8 @@ static int delete_prop(char *blob, const char *node_name, const char *prop_name)
 
 	node = fdt_delprop(blob, node, prop_name);
 	if (node < 0) {
-		report_error(node_name, -1, node);
+		fprintf(stderr, "Error at '%s', property '%s': %s\n",
+			node_name, prop_name, fdt_strerror(node));
 		return -1;
 	}
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index cf978ee..5bc7817 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1045,7 +1045,9 @@ fdtput_tests () {
     run_fdtget_test "bootargs\nlinux,platform" $dtb -p  /chosen
 
     # Delete the non-existent property
-    run_wrap_error_test $DTPUT $dtb -d /chosen   non-existent-prop
+    run_wrap_error_msg_test \
+	"Error at '/chosen', property 'non-existent-prop'" \
+	$DTPUT $dtb -d /chosen non-existent-prop
 
     # TODO: Add tests for verbose mode?
 }
-- 
2.43.0

