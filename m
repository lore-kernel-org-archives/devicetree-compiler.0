Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A815C5FB97
	for <devicetree-compiler@vger.kernel.org>; Tue, 23 Jan 2024 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706015109; cv=none; b=hz1ilWKwu7YusB6hwD+vjZ8TybWfezmaqwWfV17PG28kavNaVjBJY3hLBMeSqopqhMRJ25Wr/G/0i+CfEnJMu/gHn7Vt/3ipEhlSGAxCRrT8epcSynOBlHkoFyTOMoNi4SWKIg07c4LcF/T7FnX8Xmc9Ju96blTO4UFFPizcmI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706015109; c=relaxed/simple;
	bh=d5XMdFXJVXYaY01YgalfU692dvF7kuNj9nhvQj+uCdU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZsRJvO2slWJFp/Yrv95dAJ6yyZUifRToRIKTtlAsbM4OD3OMXmCK55PWMJGPcaQxkwSpnPn85KHGj1jrtjp/u+I4TFNsNhXL49PXK6vZL7s4vRVX/YfidbIs9PrzpkATDQvyoE9iZm5FTsi+YpZ3c0W6LlXupehvrvsZre3QRMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alyssa.is; spf=pass smtp.mailfrom=alyssa.is; dkim=pass (2048-bit key) header.d=alyssa.is header.i=@alyssa.is header.b=N7u6hZsf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GzmC4EM7; arc=none smtp.client-ip=64.147.123.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alyssa.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alyssa.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alyssa.is header.i=@alyssa.is header.b="N7u6hZsf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GzmC4EM7"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 9AC0C3200B2F
	for <devicetree-compiler@vger.kernel.org>; Tue, 23 Jan 2024 08:05:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 23 Jan 2024 08:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1706015104; x=1706101504; bh=MQ9dbJA/AuFqu59t9zted
	GjKAKOAPGzU4BB/nyL2UxY=; b=N7u6hZsf2IXzNIfPlsqIcwdQ3xctXr8yxmmtc
	MIN+i9JaQoGu1MSB1dnDI35id/V3jjwB+sYzNgZW6eQpZh7LlVAb7J9ClthThkhg
	qCZFrSMJ2f6V8yJYH1s5//HsdM9X2Nc8P3zoyus2YkSlbdJnq3druoNtXQESnKiq
	zNO6BzwLtjRoiUGPVqkL8T2L4PnXMNnKo1EbIyeID+SXk+Y4wzbuXAm+ixJtDZ03
	upGX78sZZNnTPmiMHRSC4h2YktllbqXQwK5K8ILqxQ1wrRlCl/NG6ML93PV+VGsF
	t+jqkfwDMbUDfvq8IXzU3jUoskZpwf7YC27gJkDCPtgXURppA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706015104; x=1706101504; bh=MQ9dbJA/AuFqu59t9ztedGjKAKOA
	PGzU4BB/nyL2UxY=; b=GzmC4EM7S6Pjpa1nARNhCI4xvb9UVWoaJRia3ci1aK40
	xV3YIAsg1rF4CqAwiavadouBlHjO+n4Ji2Knrq+6o+gMHPFx7gZKZps6+f6Jl8ED
	d3ZFNMtg5OFfNeae5vGbQXtM7N81sXO/19k/loXQfTd4v0AOYK5OkyIVWXg/ZUJv
	DcRULJIwTAH6mC2YHVJWfLZWdHJTARUQxLMVcLaDyIfvo5x+reotwtP4auKT5/HV
	8gD5XuFcFK6bnykHLJEIj2wAL8Sgfozj4DylR875FMTwJNn6b63i7/SfkCYG1b0Q
	Wg/VREBoVvNLaGEULt0TMsGInMXobC7wJ0Do4E/HAQ==
X-ME-Sender: <xms:f7mvZQWAj2UjuAgjZV_1vyzJyx4szAkubaN2Jtu8MKV2N8nCWtmq9A>
    <xme:f7mvZUkcsM0Jr6druX1O4WknLRFsbphtP7SfJOpW-QAtVFFYGRbbRmrDgh0BPTfBr
    wQHVZ4OECSdceMDng>
X-ME-Received: <xmr:f7mvZUb5ESYBzaMi9OuKjHA71qikQKfZSZMxIT_Yv9D0Jf3Q8-pFC-8BET-8m0qld3pjC7pq_8Guq6Y7pdGCM3zrShTO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekkedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlhihsshgrucftohhsshcuoehhihesrghlhihsshgrrdhisheq
    necuggftrfgrthhtvghrnhephedvfffghfetieejgfetfedtgffhvdehueehvdejudfgge
    fgleejgfelfeevgfefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhephhhisegrlhihshhsrgdrihhs
X-ME-Proxy: <xmx:f7mvZfVyByEfA0yt1Xh5owjkhJi7Whq4NCKFP42r4nCWYssXbN6J3Q>
    <xmx:f7mvZanUk21Yw3ywoFGBSOXWPE0_MYrJEBokYioVTJ0H7CHm2kTvfQ>
    <xmx:f7mvZUf-s5NTVLCVOiOMSGNBuY8HwkZ0deqjZXiH2BYjAGVjfZKIFA>
    <xmx:gLmvZUQvlsKd3o_8ifWejohjrW20idMevLLEl94S0Y9vIgho_-yzMg>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <devicetree-compiler@vger.kernel.org>; Tue,
 23 Jan 2024 08:05:03 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
	id 02A8CC1BD; Tue, 23 Jan 2024 14:05:00 +0100 (CET)
From: Alyssa Ross <hi@alyssa.is>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH] tests: use correct pkg-config when cross compiling
Date: Tue, 23 Jan 2024 14:04:10 +0100
Message-ID: <20240123130409.181128-2-hi@alyssa.is>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By convention, the PKG_CONFIG environment variable is used to tell
build systems which pkg-config executable should be used.  This is
often used when cross compiling, where it might be set to something
like "aarch64-unknown-linux-gnu-pkg-config".

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 tests/run_tests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index bb2ec95..3225a12 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -32,7 +32,7 @@ if [ -n "$NO_YAML" ]; then
         no_yaml=false
     fi
 else
-    if pkg-config --atleast-version 0.2.3 yaml-0.1; then
+    if ${PKG_CONFIG:-pkg-config} --atleast-version 0.2.3 yaml-0.1; then
         no_yaml=false
     else
         no_yaml=true

base-commit: 95c74d71f0904235d44892627322f60a18c9a28c
-- 
2.43.0

