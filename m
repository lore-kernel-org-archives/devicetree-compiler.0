Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718501;
	b=q/JlVOWhOl67gzfMPbGsWLejAizFdN7qtvw6hLopnksJZaewlbLsvP2sUCX6mdPJdY0l
	 VUC0oD3AAQ7sFitl9SQwjxRrablA5enCCcTuol6IswBUNHkSXATxv9o7clzYay2hVo8rT
	 MWRPzTR94TvjgcQ6Ka8aqKVaqr8KKg4194MtYpsq/bJ1p6eqY/X0xNs9HeYIxMx4HeuEM
	 eSFK/V6vf01PrZKrhpzzC8NO53V2VsdRok5W9/r9JxKVwjBc7BGk844kUOfCYB44Wz1Wi
	 ReXMeNWOrq5pDKQAPvyn05NrNKSyzpU3RSlrnAbhbGwKQlimrU9d2cyj8epnd3MLtIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s09Q1pQ8IKGCbzWIR5BeGMtz23yDUCCTYhGLoX0eMIs=;
	b=knYMOiWuMkxy3jd3AveVQ6Z4+hFxHRIzY3QKQKWFXeTkqa02a/pv6UN9dioT24Y/dX+4
	 Nzux4En+7QaL+5S1yHvsQiDKGFWyblgWQjY3XfmNji0iezHx45qtU7O2tx97f+0Wc87kh
	 U3ccjYiu0r6jh6pFLvw9O2/2/PcMpU453veCzC6wfbsdhITKA73cJ3y7HqWOgWNkoUqFS
	 ZxSaRyzs3KTxhXcodf64xiLhK+IWTRZHzjZiCK3/IIc2pkJLi+vgIcUi1Snz8IzRNocIE
	 Po01zqSA18EKaHvh8ZQP5DGcWzS2wT6d2tW2D016UbwtWamptMDIjAqFa5TM83zeQAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VnLwJVnW;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32996606A321
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32996606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VnLwJVnW
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b1afdf5196so2843929eaf.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718500; x=1796323300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s09Q1pQ8IKGCbzWIR5BeGMtz23yDUCCTYhGLoX0eMIs=;
        b=VnLwJVnW9MCvcTa8JxwNSEMuyZiuLvQgsANmFvbL8Ny2TE5bQGhKu8V/cSaPwatLpd
         LB+LTdwYJruhL0dD06phweB8i88WuNgDpdeCV0t78qNbTqiZRJNTCeJS6Ck1yqco8FJD
         MkN5CQmShoQ3Vvmzfu4d4hFTgU1CVVsL4CsJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718500; x=1796323300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s09Q1pQ8IKGCbzWIR5BeGMtz23yDUCCTYhGLoX0eMIs=;
        b=qX8T1v94+BMtf8LO3qOfGGl62v9SXe5vmGLztC847DqtOberBcUOylbikw1ZBob3Jn
         rPQbqlmNew2ivhPKML9A8OqKBt6rNHTvefjbtV9M35nBP6bbOsNO4X/ASWbUesa+myRO
         cB9nAAYvHi01TtNQuH3XImhUyL30lNNzCrlSsHKBegTGWtNNiF+72To+91dL1Mg0xVDw
         vG1zt+p8mfsRCv6rZ7TRjwwsnTuhi+GdkW5flVvrbh5vyR2KxlOSKbQoG6HaWOASmk1a
         1gHH2iE+rV1YupfJTfPVN9XLi9MYp8LH3vw9bD8tZtwy2qQy32USj1TfqkjlfIq4BB1V
         bVzw==
X-Gm-Message-State: APuU4Z+gEukkGnHNS8EMbds+DzDWWijfm5DNpA7DGjXyS9/whT2/nuqS
	FkO/xWBQTD9A5vrpr5nZTbQ2RtRR2IqiZJFLFu5W4wUcZ7Lak44eLftKkwe/b3AuN79d2CdoXcx
	MG4KVXw==
X-Gm-Gg: AZFdTZcUjdm9RzFOGWxrCIjo6Y/fEowKTZEIAm2cWZHKTG2CrkSsZYIshbhTEHFLSCF
	3Zq50+AmZlgPY7pulD+sM+OGkR6VVvlXEPP4P5Kk6kbhJ8RpJ7rMWY2HZkVQUVOqofyDXM2O6P3
	ITY3bvHMuGpPCI6IJqkQi1oMmC+hXLxLH6lHt5IY65NmR2GuZznyqEMxUpYjaPMQ9U06q2r7uAN
	6u+cDJcE5A6M3d8fu9VpKFfY7ENu4FmVpD1sE4q+NlN/rOmuyoYUlsxAZJxf98EmEDsvuatkT/2
	ON4dvJA3NhMJE6xy+SH1zi+qqFc0ElbL4FUS+AoCcVEowUDwyIgXt6HICG0divW1timrHXHvbRn
	GAQOYz4TZDcFzH104e95X4NpRkSqCd459cG+Rh1SRSpKiwaZn9v71PIsIgT8z/RX1ywkSML7dq8
	0kghpam9IF+i514cfqsxK1ywcA+luCUupTdXxZWy23XcptJywJFokTJNJVPra5exfu3zCtITj+I
	MkAjZwbVeJ4B9A+Y4a9b1kgzahfpsJ8XxrgWZ56uDSfKs7IBnBcdCDq+AlGXe9k+vGDuoe37mS/
	6eN+CR1yrVpL1LkgejmNAYBKkSeQUEK6sobNJzKzdZnEMoy9FrhxcEbR6MDb5JWosXQRbBloyBx
	l01eKnPGRYP8qbP6AB64ZGw==
X-Received: by 2002:a05:6820:c44e:10b0:70b:8307:9bd5 with SMTP id 006d021491bc7-71b394ff60bmr11635485eaf.53.1795718500083;
        Thu, 26 Nov 2026 10:41:40 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:39 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 02/10] tests: Check a label on a node which is not in a plugin
Date: Thu, 26 Nov 2026 11:41:01 -0700
Message-ID: <20261126184126.1472738-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126184126.1472738-1-sjg@chromium.org>
References: <20261126184126.1472738-1-sjg@chromium.org>
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

In a plugin, label: &ref { ... } cannot become an overlay fragment,
since dtc cannot put a label on the target of one. So dtc reports an
error if the node is not in the plugin, whether ref is a label or a
path, but there is no test for this.

Add merge-labelled-missing.dts to check both errors.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v5:
- Add new patch to check a label on a node which is not in a plugin

 tests/merge-labelled-missing.dts | 14 ++++++++++++++
 tests/run_tests.sh               |  4 ++++
 2 files changed, 18 insertions(+)
 create mode 100644 tests/merge-labelled-missing.dts

diff --git a/tests/merge-labelled-missing.dts b/tests/merge-labelled-missing.dts
new file mode 100644
index 0000000..232872b
--- /dev/null
+++ b/tests/merge-labelled-missing.dts
@@ -0,0 +1,14 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+};
+
+/* A label can only be added to a node in the plugin */
+newlabel1: &nosuchnode {
+	prop;
+};
+
+newlabel2: &{/nosuchnode} {
+	prop;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 1d3e79a..1e9fb7e 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -798,6 +798,10 @@ dtc_tests () {
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
     run_wrap_error_msg_test "merge-errors.dts:14.18-30 Label or path nosuchnode3 not found" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
+    run_wrap_error_msg_test "merge-labelled-missing.dts:8.12-23 Label or path nosuchnode not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-missing.dts"
+    run_wrap_error_msg_test "merge-labelled-missing.dts:12.12-26 Label or path /nosuchnode not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-missing.dts"
 
     # A labelled reference to a node in a plugin adds the label to it
     run_dtc_test -@ -I dts -O dtb -o merge-labelled-plugin.test.dtb \
-- 
2.43.0

