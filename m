Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708FE15FD01;
	Sat, 23 Nov 2024 09:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732355340; cv=none; b=RsDk2b2J0bDva7Uw3H5CDvE8lOcquVjD17ybCEr2jH3jhpFDAN4PZnwbk4Z29cFsbqOyQRNQYZh7keupnlQlLZf5b1LonsWnsDD7kPo0pL6LmVJoeS0sa8b8DYbA/FatApmbxFhW56CwmbjnL51O3JkH805AzkmbbCKnFpTm/1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732355340; c=relaxed/simple;
	bh=b9DgWi3HDId8jGnB5/Y/2iUYqOB0IMaFoHQi0OCHXY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GALV71p3mRmwcWXvyV4QmQqov+Q22sWbLkAyoP8Zrzy8iq8Sxj6EUoQONLLM93qFut0pr/RQaI+RUp6KJ12EcLiga4r1RZRe4LwVd6fgZwGmodcj1ikGtkFRZZcC/S6C91xbTgKHILw+lg1F6A1/nfAsQb1/24PDl4lOZy00x5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=pcZ7Fb8Q; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="pcZ7Fb8Q"
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id B2B4A38A3D0F;
	Sat, 23 Nov 2024 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1732355325; bh=yFyEp0MoYgySRhFcq3OK+n4TQ5uvb01KCJj/x8f1Pe0=;
	h=From:To:Cc:Subject:Date:From;
	b=pcZ7Fb8QcXdr8KH5eaSebZJyTOktzLW5mRzD+gCm3q2T9YGmctSR18V6WYJdgzRRf
	 zJQSS7zXXmzIxrRUp5WxdO7Ta5QU+o1Fb/dDbL1i6lOVqTM18kw3U5097hv8L2gAeA
	 No6TRDX4dDsyqGN2Q0zTJfu6x0yeFRq6KMKgi7KRHmGOGIYwzurNg4mECq8zDvNfHb
	 pv+Hwqsz9QMILMbQvO1ZVomvvSuXzouy/sqiZZBOvi3lWPlZx5qoxlGY9LgWDJ67nl
	 kkXK/3jS9mXggQaoTMlNVNSS27DCA8xsekVveQfmcY6peKO48Oemm8DmKl9OS6//t5
	 PxoDAw7risqaQmdYjgLxPQ1ZYOWKJG8DyfYykqw02VWMKZ6WxGztahizWp4X1FHQTQ
	 KqL9vMfpo9DNjS2QoEBsefuPTKNZVAo3euvIMqbuLy+IxYuXqoq+3YuNtUTphYPlEm
	 l8/D5L5Lof07GVCZ4HVKXDyh7UV3kU0MshpaWgVMFHaoouluoTOfc9ojkTH+Kciu4E
	 fZg3k2Uin8+bM3hzF0Oh8SEfWep7DS1OaJ77+QHcFuvAUXp3moYLhewJUhsI44hHm9
	 RKVQfjkvDyAQoY+X/04ViY1GmiBx0djERX9eQd90wfEBY1mi16c3zuAOC9FJE4tVxg
	 jnLYGf3f3k2E7Ag9UgmFzFsY=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0x7StVgY1Qnz; Sat, 23 Nov 2024 09:48:42 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.227.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 23 Nov 2024 09:48:42 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: David Gibson <david@gibson.dropbear.id.au>,
	devicetree-compiler@vger.kernel.org
Cc: Bingwu Zhang <xtexchooser@duck.com>,
	devicetree@vger.kernel.org,
	~xtex/staging@lists.sr.ht
Subject: [PATCH v2] libfdt: Remove fdt parameter from overlay_fixup_one_phandle
Date: Sat, 23 Nov 2024 17:48:14 +0800
Message-ID: <20241123094814.15504-2-xtex@envs.net>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=xtexchooser@duck.com; h=from:subject; bh=ysMKuOHj0GcDGBU/fk1eqdjXhgwXVUk8Jucs34/lFIU=; b=owGbwMvMwCW2U4Ij7wZL9ETG02pJDOmOS+5pNTW9r5r4pUaWsz/f/Z25SeXMRpttX95n7v8SZ GS59KNxRykLgxgXg6yYIkuRYYM3q046v+iyclmYOaxMIEMYuDgFYCLG2gy/mN7pHXq6zkeJYUb2 Y8NN/42OJq8/KffwVI/vsqZIjs6zOxj+GXYv67H8fmpV/HMtwaa2rzn8TKKFWQzbisuvvtCe5va dCwA=
X-Developer-Key: i=xtexchooser@duck.com; a=openpgp; fpr=7231804B052C670F15A6771DB918086ED8045B91
Content-Transfer-Encoding: 8bit

From: Bingwu Zhang <xtexchooser@duck.com>

When compiling with -Wall -Wextra, the unused fdt parameter becomes a
warning. With -Werror, it becomes an error and fails the build.

As the parameter is not used in the function, let's remove it.

Signed-off-by: Bingwu Zhang <xtexchooser@duck.com>
---
Changes from v1:
 - Remove fdt parameter rather than suppressing the warning directly
Link: https://lore.kernel.org/devicetree-compiler/20241116101228.164707-5-xtex@envs.net/ # v1
---
 libfdt/fdt_overlay.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index f61ca7ed2f0b..e6b9eb643958 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -307,7 +307,6 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 
 /**
  * overlay_fixup_one_phandle - Set an overlay phandle to the base one
- * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
  * @symbols_off: Node offset of the symbols node in the base device tree
  * @path: Path to a node holding a phandle in the overlay
@@ -328,8 +327,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_one_phandle(void *fdt, void *fdto,
-				     int symbols_off,
+static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 				     const char *path, uint32_t path_len,
 				     const char *name, uint32_t name_len,
 				     int poffset, uint32_t phandle)
@@ -443,7 +441,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		if ((*endptr != '\0') || (endptr <= (sep + 1)))
 			return -FDT_ERR_BADOVERLAY;
 
-		ret = overlay_fixup_one_phandle(fdt, fdto, symbols_off,
+		ret = overlay_fixup_one_phandle(fdto, symbols_off,
 						path, path_len, name, name_len,
 						poffset, phandle);
 		if (ret)

base-commit: b3bbee6b1242b4bb84fcb31365b76a3a45be3b6b
-- 
2.47.0

