Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC1618CBEC;
	Sat, 16 Nov 2024 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731751999; cv=none; b=eSTgjbqJknV7WTK4ZpMMA6hX2PZoQZmdNvFJCsbOvMmCZVRhxdF9dNnUwapMW1/O79mr19UpImhdCLb+Mo7VzreWJ5wGa41bIAB3Zy0ROcwroFh1D2C4AE2RU6c41qMwg13KRHXRJFLxmYXE7BLp4yBWqOeDAhPLG3efFRQsFZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731751999; c=relaxed/simple;
	bh=ENlfhO9ZujLOutvmJBOi8JCVY/fPssVY+Zb+kKi/yJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sy4HUG8TNAwK+2gEX8xCJ8dsBNG41kXQWhOaBxmE0q6vly3Q41oLcX+6+kycpQ7rCUH+RodRxfbI5htczBntVmtEeb8dyByekNpj7Y6PCBFuv5g8xYRDdI/fig24hB/O/kVDEujbq+8BwThQIwVWrYYRv7GE+94LTv5K87W+iP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=fKpEXDF7; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="fKpEXDF7"
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id B445238A0CB8;
	Sat, 16 Nov 2024 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1731751984; bh=N0lYlkmteIOjIWe4oolMKq7FLUUjjU4x4W1uSjEhl3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fKpEXDF790E59tN+mFE231wor97X0XnQ1itlPwkAUL93wPqEqr+0TEApfokmkw00l
	 x+g7UdU7UQoMpIsUijCVw2yQIS4HrS9oobrpqR5ii+lkwdsr5WwvwPWVZejhisqA4t
	 yQXKM4KrlLWd70SmMxi6QQhej40/6yH2aXe02SsZyz99xEidBa0XuXnbswagw/xNtG
	 3t47LTJpQkC25TbeyP+t7uB8NL+lqvwmQPFCjbk+iWIbOPlV0YSAgZfQ+2uZdW4EPV
	 iqVohHHalzhqVIeInnXAKW7FbCMGQRMRVbQ0PfGINhvCBSW/K+k8X0Y0HqDymL/3i/
	 pd9BZsHCY8vizVyijgD2b7AbFEAH1gbOCHaIrBQ4NG1ZASfUKH+s8cCCFmEzOnf3LS
	 Zd3drUSx//VVQZ2E/CKv/DzhvQHKuY9UTy3wzKYgCICLyHqHTY/XkkeFAFKQ5fEJEA
	 qJFZuqaqfab5cVuG+s/ghxKeMS+Ri9ya/zZq+CTPC3oGvOd8YvvW68U5XyT7FreQQJ
	 KvCSivr1BJzMXYLeMPPYQDuEV9Q02xkOlge/LyFes3qWQGJeoh9iIQzE9dkvY+iD9l
	 dUDbGiTGtuGrzY/0evQn78F/ZmiQCdCMTzqw/Ka/oSLj8dl7G7vFUdFm22rnGcECDb
	 EBbBi4nxrsUAB/FXCO/4yguw=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2gbnj3bAQwro; Sat, 16 Nov 2024 10:13:02 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 16 Nov 2024 10:13:02 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: David Gibson <david@gibson.dropbear.id.au>,
	devicetree-compiler@vger.kernel.org
Cc: Bingwu Zhang <xtexchooser@duck.com>,
	devicetree@vger.kernel.org,
	~xtex/staging@lists.sr.ht
Subject: [PATCH 1/2] libfdt: Suppress a unused parameter warning in overlay_fixup_one_phandle
Date: Sat, 16 Nov 2024 18:12:27 +0800
Message-ID: <20241116101228.164707-5-xtex@envs.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241116101228.164707-4-xtex@envs.net>
References: <20241116101228.164707-4-xtex@envs.net>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=721; i=xtexchooser@duck.com; h=from:subject; bh=6TbJ3yYuqieQq9IZ3sO88LQi6ggjGj6pSB4UhcV7PGo=; b=kA0DAAoWuRgIbtgEW5EByyZiAGc4cAyjHZ1CglJl7qZ5cOPkG1LwRe53FEoVrSRXOkeQgAj3D oh1BAAWCgAdFiEEcjGASwUsZw8VpncduRgIbtgEW5EFAmc4cAwACgkQuRgIbtgEW5EmVAEApcVa pUgoKvPvyXUiTjhcWao7WfVe53YnQ3f3QDp4n9oBALN3gnREJw4tFb+QlwbLlzis+/33377D+mq uJ9UZu98F
X-Developer-Key: i=xtexchooser@duck.com; a=openpgp; fpr=7231804B052C670F15A6771DB918086ED8045B91
Content-Transfer-Encoding: 8bit

From: Bingwu Zhang <xtexchooser@duck.com>

When compiling with -Wall -Wextra, the unused fdt parameter becomes a
warning. With -Werror, it becomes an error that fails the build.

Thanks to Icenowy Zheng for pointing out the solution.

Signed-off-by: Bingwu Zhang <xtexchooser@duck.com>
---
 libfdt/fdt_overlay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 28b667ffc490..f9be13865807 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -334,6 +334,7 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
 				     const char *name, uint32_t name_len,
 				     int poffset, uint32_t phandle)
 {
+	(void)fdt;
 	fdt32_t phandle_prop;
 	int fixup_off;
 
-- 
2.47.0

