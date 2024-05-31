Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448B33CF1
	for <devicetree-compiler@vger.kernel.org>; Fri, 31 May 2024 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717162311; cv=none; b=bpIAJlYO8lc9wEvOSyCQMNGr1HUd+bcBXF5Gbqvqj19SHlUtN0CkhKrhUtIWtHlxB6o7WD/VOcFV23JediIqpEkUxMNaPCBCx8/fJ86FjLSoIvkNMtxQSEy/3xlL9EgsMW2O88nZtRoHHvQb/A7H2mopqYNVZIr0MbNcBmxFIx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717162311; c=relaxed/simple;
	bh=FN0O2wsNeL8E+HjD30mBRWgiNZmYL/zlWr+ShjLWOWI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=oGfMPY+lGGy7xczDmUkDDzKUJYOAIJ94EgUVRcFGg9Joj/A9oU49TF7f9aerY3Aav7QVT3yK+2HrvlpTrbtJ7iRmtJR/TWZlDh5oj+dgI5nWMgxBeiZeIBwaMjyPiZyZQCzBohKuqrIMWTECqiu4VaGXn7dPhCAEAwpdY21dh4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgeBGZ0d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgeBGZ0d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF9EC116B1;
	Fri, 31 May 2024 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717162310;
	bh=FN0O2wsNeL8E+HjD30mBRWgiNZmYL/zlWr+ShjLWOWI=;
	h=From:To:Subject:Date:From;
	b=KgeBGZ0dITbISLUjS2uYUa8hD9/5VT9TfUvIWGoT5fJPZZnaPXHgeL2cbgt8em6N4
	 1fpnxStLtSvJneHnnpbpSTTkv24OjYZYZho9uOHBbO05m/UvlQVatMvyNtBDEpQ+dK
	 8bZRGhIxN16mnnu1ACovDTVrnNWl0DTz5kIiDaZvO3Z6+2Aa7Ep6O8cfb1Vt2fu1LC
	 H1iwPTSO/MoPfELWDwsiomfxDxH4PABTFY7lUPr1VKr7VE3OcBtKluRsgQufkoNH7d
	 xeIQvBYt/OhL2fpRAKuNm8d5JIBHkg/dxplcjeW4nyqGunrD2T00B//RiYcA0S8dmf
	 AZqs69B8UvQpw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH] checks: Check the overall length of "interrupt-map"
Date: Fri, 31 May 2024 08:31:49 -0500
Message-ID: <20240531133149.1498139-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible the overall length of "interrupt-map" is shorter than
expected. A likely scenario is if "#address-cells" in the interrupt
parent is not accounted for and there is only a single map entry. With
multiple entries, one of the other tests would likely fail.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 checks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/checks.c b/checks.c
index 28f86ccff56b..1950c18dd333 100644
--- a/checks.c
+++ b/checks.c
@@ -1677,6 +1677,10 @@ static void check_interrupt_map(struct check *c,
 			parent_cellsize += propval_cell(cellprop);
 
 		cell += 1 + parent_cellsize;
+		if (cell > map_cells)
+			FAIL_PROP(c, dti, node, irq_map_prop,
+				"property size (%d) mismatch, expected %zu",
+				irq_map_prop->val.len, cell * sizeof(cell_t));
 	}
 }
 WARNING(interrupt_map, check_interrupt_map, NULL, &phandle_references, &addr_size_cells, &interrupt_provider);
-- 
2.43.0

