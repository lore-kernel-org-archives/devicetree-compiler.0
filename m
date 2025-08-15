Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D77E433AD
	for <devicetree-compiler@vger.kernel.org>; Fri, 15 Aug 2025 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755264912; cv=none; b=BGUtF2JM2C3UilYTpFkPD0+eFH2WVG32Hy0csQlMWCmn3ezAVdXnt9oEvrUEs3TyaHQZc1REshEM6ssslZpRY3PxatIu7rpn5OSLBTv0VB4FZO9UGCZ5tACVJO/C/ShxhtEaTBg+/DkbiyEtCpol2irg9mrFpRrndwBu1NDm+z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755264912; c=relaxed/simple;
	bh=hYca88ySCHbVBb2CTBOZY+ClkMw/p5F5cnVa4yDt66o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GCiYIiJEzhUGku0a1zJA6rvUiv84vbBVtOjN4Wc+UdvbOKNCcUK4kyLkPTI6gN71IYkgCdoGGycdG8E3mWZk/Lo40RggcyvpDsFdd0Y7ZmFZHsd7taOdkdbc9tLRnoCSQegRYn2Dm+HuJhClsEWxfjZYPARnNowB9fav2L2lodM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ts6S80u8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ts6S80u8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9e411c820so1060846f8f.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 15 Aug 2025 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755264905; x=1755869705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6hU5Gu81L2cc6CA/VrqPNJqCCtdSMH+QIviio298sk=;
        b=Ts6S80u8ly35VOnHaWX6/hHescyjRovzdZrrw8ZRgxspdwrOqoCwfgPVXimehQxknr
         wIugj4kp1/RgdiB3uGm2CnfzAZemgE9/rhONijLFcs+4fI2McCvsGwImdMWvcIwU/q0X
         CAMn2BJUHpTHeKrr316TkFTkFkmj9JAvUvmi7p1M733wc7FeaydAHtHffE68vYyvDTYY
         2LGasVtRETkg8nvktw1Q1lHiCTNDjdg88EyVTTlS4Bab7w8IVDjo6c+fThx4XfusDlXL
         qkbhet4QXCe0dQOOnlNePbVXUzDPXjTgNVRtu1NYl58I/MoAUWIFSnL/DFkU0bbvgc2u
         GXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755264905; x=1755869705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6hU5Gu81L2cc6CA/VrqPNJqCCtdSMH+QIviio298sk=;
        b=a2DRu5BL/GP2wWqG6vlbeI+jYFm2TlB7jD3MB1qChnSlRyPNmu5y5h67f8tZYrChRk
         iecL3QVqxgAMuYUPEjdZCNZQmpxL8s8CPzVxrZekwwDX0Z3pO6h7KJ2fnKE5K0VN4R8w
         vMeb3Ohny+62GL9XumRK82Hum0fxOR2WJsrBHmDRwNtqcvWdRLpjOYE00Jay+LUFgye8
         zoSMJ0NS42OswemRQMHyKQYFNya9qWcx7r43hyEDabX9mb8Zbiqe66mdUbq+pxPvgeHR
         7QhjQQ/jDqEm2CXh287e5kF4K6kNtc0g5O9Ut9bEzyFiJwhjMZCsmkyBz0nM6blZSs55
         4LQw==
X-Gm-Message-State: AOJu0YygXwKxgYoOeXc7K2SSTbZb064U2oGc97Oh/OoJXeYZqUHLaNc1
	EePeKfgaEAXNvfcIjk/D1MuWZRsU/2cifBaxmnHRbwpmEld6vkFKfiof0AphA98qBUwiPza2BCY
	kTNLE
X-Gm-Gg: ASbGncvXGnRdFHmuslZmLXheJ3PtH3/orwYscu1XAzorNTxmIzspWRvC8efJVX1SPz6
	H76jESSC86KcaLMTeR3gfZHZy4d5se0hHsLJYoxYw/HDO64q81E5FICy/oLbJYCFvPIGHK2WJ5L
	+CS/4cZ2hQ5fxM1tw2LRMe6WZ+EJs9720Y7/r3tG6oEs9lsErL3zWdRnCFoP1oONcsAaZDAjgou
	e2RARNkQJKGnZqf/qcVdJHWvmbQewbhGlnqDk2gNP8lrY9rXL4+joaFAJj45YLcylA6ski7bAmE
	8QphjalbbI9TCTPNt6yoB4pddQIMz3rZpnrNUE7z7UN2kKPhZ5j5WjJk2cKEMJElC0hgY6lC0sD
	i/lfuB54yLEyQpb5+g5DHkDmMAAA1qxTdtmqaRMIqRLVghLqQC5SDTlX8vSe/Nury
X-Google-Smtp-Source: AGHT+IFmLUFYt8ILdqaVJ44u+F+rpLKuy53vOsofP0Iq7uB9ErrGS1bo+mtBV7hnlsMb2/LWxv4BQQ==
X-Received: by 2002:a05:6000:40df:b0:3b7:8b5e:831d with SMTP id ffacd0b85a97d-3bb670fbe55mr1478052f8f.17.1755264905159;
        Fri, 15 Aug 2025 06:35:05 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb68079341sm1925224f8f.50.2025.08.15.06.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:35:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH v2 0/2] livetree: Add only new data to fixup nodes instead of complete regeneration
Date: Fri, 15 Aug 2025 15:34:52 +0200
Message-ID: <cover.1755264521.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=hYca88ySCHbVBb2CTBOZY+ClkMw/p5F5cnVa4yDt66o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBonzd7mtRctBhWAG9GmRcWWmRnNXR/neAFjrcbd h3N34wGzmSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaJ83ewAKCRCPgPtYfRL+ TiU7B/9Ae7k7/QMpNt1dPAVJ9O1boTBdmy0pJ6xxoliHLyqwJYGTQXj7DqqI3kwpin0F6hM8/sR 0xSNiWp/vCoFNpg75snzs8etXZ8ar0g6AIw3NYokcGLy+/Ifl146E1+mwXe41X8VE80+YK9Dgnr +JBwHmCwgy0lz9waFyJoabV9D3Ts5WxIhKgIfRkKd5kDQNSwOIPcztGHn1F8AQU/C7W76AIhcIZ /Al0d2VDOSArf6Rw5d+uoeKzdAywokT/feLiNYeCPht52WhVnWmXZnFWNgKww+DgffdchqHW6L9 Zh9BIHYLodaAlLO+YxbqXIg0zac6n8L3t+t4z225/n3akKIR
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

here comes v2 of my effort to fix the fallout of commit 915daadbb62d
("Start with empty __local_fixups__ and __fixups__ nodes") before trying
to restore phandle information from __fixups__ and __local_fixups__ when
compiling from dtb to dts.

To address the feedback I got from David in reply to (implicit) v1[1] I
added a cleanup patch to fix a concern in the original code of a
function that only I copied and adapted.

Best regards
Uwe

[1] https://lore.kernel.org/devicetree-compiler/20250801160031.624886-2-u.kleine-koenig@baylibre.com

Uwe Kleine-König (2):
  livetree: Simplify append_to_property()
  livetree: Add only new data to fixup nodes instead of complete
    regeneration

 livetree.c              | 85 +++++++++++++++++++++++++++++------------
 tests/retain-fixups.dts | 29 ++++++++++++++
 tests/run_tests.sh      |  5 +++
 3 files changed, 95 insertions(+), 24 deletions(-)
 create mode 100644 tests/retain-fixups.dts

base-commit: 84d9dd2fcbc865a35d7f04d9b465b05ef286d281
-- 
2.50.1

