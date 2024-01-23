Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B150A77
	for <devicetree-compiler@vger.kernel.org>; Tue, 23 Jan 2024 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706015271; cv=none; b=ZT0Yi55p7O+KNUYX8i/T5irkAlDWoq5oS6BGET+cr22/GvBHClmDHDmKwsulyT8UUc2APZODvxj0exX8BZ6UROEM0W9d39sM0hzOpySqI2FmFsoOmHk1SFNJMNMywmTMnNr+0qVUhKa35FWrYJszSFlRkQMt004E2d2uP7PUUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706015271; c=relaxed/simple;
	bh=PPCRx6gOXYKo/GpJVXl8LfygYv6UvqXRkIhPP+OHuiQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=XGkJAu2lVnqPCRyofiLerOpy0fUUKKP1Hzx/NzE9fyh/aayzsISQ2QzN8mRyejd47jP4RQST0Bq+uv9t6RgdkHCIPLKfI2vTwseuPxoOl/LvoLFSQecQ6ReLGG+jrW4SQdzDWAcgrWtBAvC44m3pJG+Nfat7wUkpSkmHlG0GOrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alyssa.is; spf=pass smtp.mailfrom=alyssa.is; dkim=pass (2048-bit key) header.d=alyssa.is header.i=@alyssa.is header.b=Y4Kzy2zy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c86i8AWJ; arc=none smtp.client-ip=64.147.123.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alyssa.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alyssa.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alyssa.is header.i=@alyssa.is header.b="Y4Kzy2zy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c86i8AWJ"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id C8E553200A1F
	for <devicetree-compiler@vger.kernel.org>; Tue, 23 Jan 2024 08:07:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 23 Jan 2024 08:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1706015267; x=1706101667; bh=J3C+mBgEgpCRrexy+/iJw
	BXmdFkIlXRaqNsaS3Bd8oA=; b=Y4Kzy2zyPmJhVDopfqT9rnqbgGKri7GXr5ixU
	nno2fY3VC+/PoL/c/Yz2P5fadvnQDq8r5DCl14hh+6FcjJYc8sA+50s4QMI+TQMr
	OqDVQfL7OifQvXOuq934IW6e38t/DLcA5o10HkZmE2rdvOMVQ1R2hoxYIviHVKo+
	6/UrnkLebhKK1NNsME9hSLl08PUtZK8pIN7ShqS720Bg3tubvHS+67ZNJycoM5Fg
	fnqTduuTXGdxYZcdPEMpR0npWiqrGmR4I4yjC9bIlgUyXGxz5mgcq9Hin4Wqo25T
	FPYepJ3fZ5kxv0X0arAqSrrdBicWcG01odefIYf5ZxsJQ1MNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706015267; x=1706101667; bh=J3C+mBgEgpCRrexy+/iJwBXmdFkI
	lXRaqNsaS3Bd8oA=; b=c86i8AWJHF2sy/0bbO5VOC3thhC2m5ykbtPHFWE6fjzu
	4ZG5Wrd5xiAzSyilmZSXEKIQ29Ff8n12ufxzpU5S8lw3e+Dk7wvdy78Sv0XfEOcM
	EAdbqBVUDMmPdchtBxuHsXJD2zSXXv/TyExiJ6tKI8Bfi5Cg9NKbTcRO++s2MTs3
	q3zQ3m95L0ZMVugPzFsGMB2VWB6p9UUTBte+5QZXqEll5K/MVeUbJMZp5yEWvcEN
	6U6vzO1tFFJ9nk8IY/2Mb3PGDZMShlC+caj8hB02D51qb7QOFDJoQTEi4Fb2D4zV
	ZnFA7+M5+ADQFmgJXraRxtq6VxWGQOU7F8TvmHzCqg==
X-ME-Sender: <xms:IrqvZej_gFk_HXXw7nbNi06R6Ev9ljBDmJqpEAmXRd5zlY6o6LK2gA>
    <xme:IrqvZfCBrWM1yveQ3EkIOGAd9SWWFABPbcy4TcqXCFlsEjwW89KMdx7WinON2351a
    DhUnCPPfYPluvtyww>
X-ME-Received: <xmr:IrqvZWFLPjS2abho5MQ7c3bB6DagBu-FZgvOdFwI29cnRscSjqJQ8RragKM-gMQrdfkMVZrx2h8KD29qqAv8QQMaFWO8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekkedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlhihsshgrucftohhsshcuoehhihesrghlhihsshgrrdhisheq
    necuggftrfgrthhtvghrnhephedvfffghfetieejgfetfedtgffhvdehueehvdejudfgge
    fgleejgfelfeevgfefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhephhhisegrlhihshhsrgdrihhs
X-ME-Proxy: <xmx:IrqvZXSqjhY2bkbM-JqUMp28zH99Nup8tSoZCR-WsIy01PSrtiloHQ>
    <xmx:IrqvZbyPFr_JFM6HQ-EB9HK10jkWBjyQR6iaG28YlTSpwb05EPJecw>
    <xmx:IrqvZV639Ku3ogRbieTLenSZ0oIXDmRWyEjgCt4x2mK_OYS584Tbcw>
    <xmx:I7qvZcsChuQ_wskunZ2XRl7xQVdQBel-8Lgd4Adck1x1CgblLjSkeg>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <devicetree-compiler@vger.kernel.org>; Tue,
 23 Jan 2024 08:07:46 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
	id 9ACB4C1BF; Tue, 23 Jan 2024 14:07:45 +0100 (CET)
From: Alyssa Ross <hi@alyssa.is>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH] libfdt: fix duplicate meson target
Date: Tue, 23 Jan 2024 14:07:42 +0100
Message-ID: <20240123130742.185409-1-hi@alyssa.is>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If default_library is set to static, the libfdt target (which just
uses library()) is already static, so we should just use that.

This fixes this Meson error:

	libfdt/meson.build:37:11: ERROR: Tried to create target "fdt", but a target of that name already exists.

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 libfdt/meson.build | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/libfdt/meson.build b/libfdt/meson.build
index 2ea1448..9d07c5f 100644
--- a/libfdt/meson.build
+++ b/libfdt/meson.build
@@ -34,19 +34,21 @@ libfdt = library(
   install: true,
 )
 
-libfdt_a = static_library(
-  'fdt', sources,
-  install: true,
-)
+link_with = libfdt
+
+if get_option('default_library') != 'static'
+  libfdt_a = static_library(
+    'fdt', sources,
+    install: true,
+  )
+
+  if static_build
+    link_with = libfdt_a
+  endif
+endif
 
 libfdt_inc = include_directories('.')
 
-if static_build
-  link_with = libfdt_a
-else
-  link_with = libfdt
-endif
-
 libfdt_dep = declare_dependency(
   include_directories: libfdt_inc,
   link_with: link_with,

base-commit: 95c74d71f0904235d44892627322f60a18c9a28c
-- 
2.43.0

