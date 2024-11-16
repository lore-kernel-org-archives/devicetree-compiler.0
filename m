Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1C4194A52;
	Sat, 16 Nov 2024 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731751999; cv=none; b=gCQQJMELvPFwXSCo5uxnlQqbXf5dLPgrv4se7gai3DkCpjYAA9xtxeTvq1uoNfsHjSIM7aWV+31KH3aYFhU6alrxD/kWnDgR5F9Rk7uyME2BohwrKmOUYoM8f9DKjmAhrwUdCjN2PczGnGxtv+phw/Zkniq1735UcaxQPQvx/3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731751999; c=relaxed/simple;
	bh=GIDk975XMAmSE7AwYivI4DM6+pRGS2q0FPM/lk6FG4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbNkPgGB7ZPeJZDx+YqayoLF/scQ1DrAQ2xXDX9Y6ieEl7OZJ97/5xqTy5ySbm5VUHn7dQGPQM3MMtHWBI1fg8rkySV1StLqhF0a/ffbosCd6oyXfMy9WDUpUNYHdlLK2zwJsvbwetPLsz8By6sDQprDEPMoTJt1WJVC4FcQBZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=HIv5SnzC; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="HIv5SnzC"
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id A791D38A0CB3;
	Sat, 16 Nov 2024 10:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1731751981; bh=MFimAkJHBEvrC5Kz9hnMjUuLACleqlr+2hxpl8dFmOY=;
	h=From:To:Cc:Subject:Date:From;
	b=HIv5SnzC1DWavmFu2ZtS8jJjrPa5+s+yEoCtwxmXSoJQyuEkncQy6lfHgIXAHcfet
	 9IpOtMqZWEyNE+a9cMcD9DaYa0EnsRhRC1TRecdY7Wfp/DAdLA5xQRDxjC54UdCa9C
	 O8ZiwMSciBTvrlgKCxVeqESa7TDNgK4p8Ap/LQ1K0a5+7AfuUAFR4Pa3ryVdwXBrC1
	 VVn/8ian+HZeiXCMojI/KoDsChe/ULLthUKIJAtIOGlz/8BcB1Rr4/0ynVFtQ9t9rc
	 QdBNNdFgppZc0NpygZIHmxgfc9K9yVm478Co2cWHLL1EA8lSJcz9wDH7f06CuENMHs
	 FcDVP/9J1VQUA51WvG+aSoWOcYWPYwnP8qwZQZAWUoEqIJCa//EwZ7S2EHM6yQicVS
	 x9wtZvbLY/UHYNaO+i+bNy+4P/JQWSJTuk0UCBct7i69NZaJCcFDeXhwqr76FfubGW
	 VBMQbf83nkb51GKrdY+YvnGdtCa3URO0G23qXGfm31A5965a/+3ZE1By99wFLdska9
	 tp/KeFNgq3WVpldkMWW6M7HtVbN6miGrgtD39srsnrZXSY2yjuBwWclyJ0NVZjjq8u
	 ITraNy8z54EBoFILEjjKTlL8lrYX9rFEU0UglkRj4AxwwoXj1ibl1ix4R89m6RPDTO
	 ierlrxzxCukOu+eR+7nCiNjk=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LIvlRctmBUSS; Sat, 16 Nov 2024 10:12:59 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 16 Nov 2024 10:12:59 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: David Gibson <david@gibson.dropbear.id.au>,
	devicetree-compiler@vger.kernel.org
Cc: Bingwu Zhang <xtexchooser@duck.com>,
	devicetree@vger.kernel.org,
	~xtex/staging@lists.sr.ht
Subject: [PATCH 0/2] libfdt: Fix -Wextra -Wpedantic warnings
Date: Sat, 16 Nov 2024 18:12:26 +0800
Message-ID: <20241116101228.164707-4-xtex@envs.net>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=639; i=xtexchooser@duck.com; h=from:subject; bh=TiUcXRHrPzVtl2/bCPU38RDHrC4CI2LU7x+JpsI3mzo=; b=owGbwMvMwCW2U4Ij7wZL9ETG02pJDOkWBTwyal+maik9DPn+9K2veaBadvbWOYfcN7+5c+97Q Nym2La6jlIWBjEuBlkxRZYiwwZvVp10ftFl5bIwc1iZQIYwcHEKwERKHBgZHqckdLJff7pP8C/D spKVi51lNA68KT7W+dmk+kHnljtqCxgZbh+8qZNe3dypkb6+L5p1SZrm+p8qERGpgZXm2zmjFVR 5AQ==
X-Developer-Key: i=xtexchooser@duck.com; a=openpgp; fpr=7231804B052C670F15A6771DB918086ED8045B91
Content-Transfer-Encoding: 8bit

From: Bingwu Zhang <xtexchooser@duck.com>

This fixes several warning when compiling with CFLAGS='-Wall -Wextra
 -Wpedantic'. When using together with '-Werror' flag, these warnings becomes
 fatal errors that fails the build.

Both of the original errors and fixes for them are tested with GCC 13
 and clang 18.

Bingwu Zhang (2):
  libfdt: Suppress a unused parameter warning in
    overlay_fixup_one_phandle
  libfdt: Remove extra semi-colons outside functions

 libfdt/fdt_overlay.c |  3 ++-
 libfdt/libfdt.h      | 20 ++++++++++----------
 2 files changed, 12 insertions(+), 11 deletions(-)


base-commit: 2d10aa2afe35527728db30b35ec491ecb6959e5c
-- 
2.47.0

