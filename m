Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0233A17548
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Dec 2024 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734099287; cv=none; b=WzymMjhwpD+sZo5RwXzh3ItGw+O+M2lHvHeA7ptvktvZkvZew15Xg+Awykget+AaFke8DRqKIP9y8vobLWWbBshm8H6huOcbnHcGsat2Drd8zpKkQFj9K6ISptL1o7nqbcrVwry9LFtPsn6x/azuuMj0tWVrFM9MndBJ7VcPoNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734099287; c=relaxed/simple;
	bh=uQ4RGM0k47qiVWtHZ+CUu/8puQL7ExKsi4kg6aYrdgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t80gRp7k3YYKK9NtBoia7KXmmpRdrQZ3MLA7//qMoEIDkO03j3nYhX94Vb4Br2loMIWH1e059FZnF+Wm/bblxdlNAcHvLe6e0ERIyIPJpw7k6VxVoDwRWI44XJfYgThbFqamgi6+X1403t7faQ/eVBmWtx1e9NEKlb44hoAlQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNz5oZUd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNz5oZUd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso18855715e9.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 13 Dec 2024 06:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734099284; x=1734704084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EqU4rzTbZIxDWKH4WVn///Vh97QaGKMe/yJIo+oqBU=;
        b=ZNz5oZUdApUhY13L0AEbN15DfsTZjReeAJf5kN09EcAk6N2/NbbNtoQCTLfdWGuQyC
         rGDfjs13PoP5UC6YoEQIWggHMLlCRw4qlIAorBBpB5hPbl5SN06F9V7uRHNFTPQiHbTP
         F3CGPCo+qbQ+m1OXfdb3tOO+dvKWasaYTR/0AMJAjeIs0zoiAcsmid0s2qWQPLAgv6ZA
         9E1h3c2q3/NnO2bchH9UHak00c4IDkZSKgLRBGwYBL/kaqbjHgVCIAyyzcTNdzjnG0/e
         4u+HS2Vnmnx9eDSc/Mo/TQD9XNGV11gLEZfHtZHX3f4pcfSraZu3hwrBhJGpH3/q7X+W
         ZpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734099284; x=1734704084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EqU4rzTbZIxDWKH4WVn///Vh97QaGKMe/yJIo+oqBU=;
        b=XMxShD2uBa8V1m3Fbn9h3fJkAM4JBIATW9+cZH1aus80GxPcaCdpRQFnNDBdkE4i0o
         io7kdpD4j/yvNtoMC+QXaFowK990j/36n1OwDTup+jjw3JTCfFD9oj724EsDRLURiMvF
         NYmqQM2WsjS9MeqGv4qMg97k6Tl7PNYFEHl5oeja1uZZ0aLJiQzUJi9q0Zg6rP8Lexyq
         QxGCJkQmfGCaOE6SHcNkk2ePi5jzAJGsodLzRW91O8BiutYIaNWxu+7BDSNCap56BQx0
         kFwmn/VfxadoUH35h0+nBfOPKIx6wNLEdeEe0+JeI346ftHtrJTloN0tJYuQmmXWCoSE
         BeCw==
X-Gm-Message-State: AOJu0YzMtlBwuNztl0uOHaDyh3uG0Zq1KvHD3yzeUphYYCuaUgcTfXMN
	epXO3YIghcIabQ/8AKTO4KV4hO7CKkGIJf8/PF/gkMKjasD6hdxAF9w1PQ==
X-Gm-Gg: ASbGncuhwV7lY1p74QLQLKrbSdbprfzFfW2UrBQ+J39AK303o1CBjMyG1DbExowcv8Y
	LfHtwPSOYKYCfH9man8bGZ5ilZ0txbODMwhgS4vv8X+33MHXcWjPR6FxyPWB3ioJ+VASfO4rwmB
	SjXchvEoL4vFswwv7H/EtssZ9+unDMBh40SeyWoeLehJYqGJblhiGAKNI3IPrIo1PDCn1MdYJvV
	FelIZn7LTrVUvodNAIdX12HzObB11jJFg0oJwM/5jKoXsKrt1x631qn+KQ5rVVdSQHr1beB+zvc
	/UgogeTxpywKiW8z21qzaAQgbkabwA/j89Hfy3nplX2uhPWv
X-Google-Smtp-Source: AGHT+IGLO0iphMx/QHV9EOLA/uoBLIo0Vniq8Qb5iaTcFx2yiTQm8Dqc9UiwnN2PN6A0qimq0zuVLw==
X-Received: by 2002:a05:6000:1fa5:b0:386:45e9:fc8a with SMTP id ffacd0b85a97d-38880ac21c4mr2196803f8f.5.1734099283738;
        Fri, 13 Dec 2024 06:14:43 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514ec8sm7348482f8f.75.2024.12.13.06.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:14:43 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: devicetree-compiler@vger.kernel.org
Cc: Brad Griffis <bgriffis@nvidia.com>
Subject: [PATCH] checks: Warn about missing #address-cells for interrupt parents
Date: Fri, 13 Dec 2024 15:14:38 +0100
Message-ID: <20241213141438.3616902-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The device tree specification (v0.4) suggests that #address-cells is
mandatory for interrupt parent nodes. If this property is missing, Linux
will default to the value of 0.

A number of device tree files rely on Linux' fallback and don't specify
an explicit #address-cells as suggested by the specification. This can
cause issues when these device trees are passed to software with a more
pedantic interpretation of the DT spec.

Add a warning when this case is detected so that device tree files can
be fixed.

Reported-by: Brad Griffis <bgriffis@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Applying this to Linux' copy reports on the order of 1300 issues that
originate from 29 .dtsi files. If this proposal is acceptable/useful, I
volunteer to patch those up so we don't get spammed by them.
---
 checks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/checks.c b/checks.c
index 9e6a7b6a3e97..123f2eb425f4 100644
--- a/checks.c
+++ b/checks.c
@@ -1676,6 +1676,10 @@ static void check_interrupt_map(struct check *c,
 		cellprop = get_property(provider_node, "#address-cells");
 		if (cellprop)
 			parent_cellsize += propval_cell(cellprop);
+		else
+			FAIL_PROP(c, dti, node, irq_map_prop,
+				"Missing property '#address-cells' in node %s, using 0 as fallback",
+				provider_node->fullpath);
 
 		cell += 1 + parent_cellsize;
 		if (cell > map_cells)
-- 
2.47.0

