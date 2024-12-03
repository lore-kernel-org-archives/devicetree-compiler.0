Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE7A1FA251
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733250621; cv=none; b=JfYi9JVIqF/9aDiMj9hSBUOhBad5n5VIg9mHNX12CcNKVyTHOC+YxvNE6lV5p6RJ8dmS3OhRM/PCFzpNZAJ75JO7HkhVNQI4RUDR7zZNHs4VPuExyPa87w2A0T31VUav7h7ErRhle/fXyX0foLlWWFHkJbKXgyY/RIApmHhHhwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733250621; c=relaxed/simple;
	bh=VSUnrZ11uXa49t4FYMLAmrNRQhUbSLRifmj1f4xYUEs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SuwWrvRVRyXoHCOe0Da2ItvvQNy38FoQ4q0rRormlIWI+/y2nEvYt3g/Q+sPptAxWodFBM5Afa+c+yHI3YERrW9uLK8MLW1+F0r65xgfIOztrytZwygsTMDDPF7MxhYQdkV02g9HB43lBI7Tr7E+4+85wCGS3TIrFcwcwA9JQvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=pNGvAWUa; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="pNGvAWUa"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-215b45a40d8so14301355ad.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Dec 2024 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733250618; x=1733855418; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tggciO0+ASsg6V6mumlxo2s9l9y8NayZp/A22NUeQOY=;
        b=pNGvAWUafQwuB+62hoifLse6zMQrsIFPME0tkz/1KpWyQugwojEHFKVkWBxpnRo0WM
         EEGSkwC5e8C+SvX1AAO0X4G/oWAX4/Aq5alS5ywsFVqCnBy48QlPY8rf8/L6NQ6IDbJl
         MzmlGEr3p0VWJzEEVPKgyBWHWvsjNPYxiypl2TAGMHYovtoiB/NqtnPFCw16ptR/Jqa2
         qDHuWw0yhvnScQC2jyADZI0SkAb7EEy83gPrPnw+nYpfm5G5y8AmBLtDjJTZbmW2PMwd
         m1alajJ+aKmC6e8j0GS4fr+4SN2ano3o0OcXhqAQtXkyId2Z9ib3lLKVF3XYbh7VvUS0
         e8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733250618; x=1733855418;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tggciO0+ASsg6V6mumlxo2s9l9y8NayZp/A22NUeQOY=;
        b=aurfMGVLv/bWtzBxPMKIRrZlYVrI8wflc/lIbvaq8UOMYJE5oeFDzpurKCK90pjkVq
         DIU5ltbRI4xVOpejQwOKdGkiLqV0i+UrErXjIU4uuX4gncHWtZeZHRel7DGn32EwXask
         B3kouZxmusOsalTKKukpyl9dj6NgU1bBEvRfEC3LhM+E9YuAYwq3PkV1lkDImjt2x/G3
         QI+5L878OKRlML15Lp7txifVHRlqEt7JIgzVzpPHFEodPadcfY5Rs8u8s5ng2vreuGnW
         oKFhqa4UaUtv1QKE/C29RBVucyxuII+KkMirREFp3zpPFOxfIllUmD4e9hHJIhCxBgp6
         OG5Q==
X-Gm-Message-State: AOJu0Ywr3p6mC/6xKS4ThoU23vrwg2fGkVGGPqSnlvPviV4eNCTVlBXJ
	ZtbPy//unaZcoNDjZ/iNEP1xof8fLgZjo3oo7UdvxzsvamSLmbasEZnw6Meuhw==
X-Gm-Gg: ASbGncvhUfCuJlxVTzw3jFGVNU7Kx98ecHR6F+GtKLb5ZwHqKh4EiyCKbljRmMkbp9j
	Qoa7UihHPg3CXvQUf5CKOJIHkUJpih9JlUpTQmLVVmcbW5o9OWfQ+bxbLcXV8tJJj42xLh60ybX
	Kc8AtzbkOBnn6tjoRHcmDsHgG096Nr8HQwZfLOCgXWnHKH8ny6dBM2uFDhSoB8uge58OITKbNfK
	P0IpeX8HCS7wMBiqt4EGsbEgqFaVGNogtaulLkAStQyu/QdBBqkOoHJ
X-Google-Smtp-Source: AGHT+IGPSZ5cKxFo6hCB3KS6wEJ/syC/+ElFthcC3HSyvqmOyXuvwHgaxZpfgHwJcIvItgALSSk14Q==
X-Received: by 2002:a17:903:98f:b0:215:8c36:9ce with SMTP id d9443c01a7336-215bd0f6349mr45013995ad.30.1733250617934;
        Tue, 03 Dec 2024 10:30:17 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215c1317af3sm14364215ad.161.2024.12.03.10.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 10:30:17 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH 0/4] libfdt: Add namelen variants for setprop
Date: Tue, 03 Dec 2024 23:59:58 +0530
Message-Id: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACZOT2cC/x3MQQqAIBBA0avIrBPUDKmrRAuxsQZKRSMC6e5Jy
 7f4v0LBTFhgYhUy3lQohgbZMXC7DRtyWptBCaWlEj0veKUcEw/2xAMDt6P2xovBWOehVSmjp+c
 /zsv7foFB55VhAAAA
X-Change-ID: 20241203-setprop-namelen-a94f7f057acf
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=VSUnrZ11uXa49t4FYMLAmrNRQhUbSLRifmj1f4xYUEs=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnT040k0pnN+kjv5mDYGQFFrtqkTYOohR9jlGwD
 b4g8RYOCMCJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ09ONAAKCRAFzvXHieVa
 dMwPD/9uozVGGl0eL5HLmLkEYzBL+SBOu5vTBllIhWIYby5nLQX+RQPDDrV71LPG+hJLmWieENh
 361r/CEwVWWBqETxiVgzP8/Pvrh3avjMjT/Sjs5lg5PCRPtcTjaUECjYbFjypPjQtB0bj6ssv6Y
 zu3tJqX+r4SoXwrCuGnS0jgHBI6tubr4RzZH6qNNhtLZXcOSevqWiSvT8LifZe9YgiUZ0Q0Q1LM
 iqspbrr76yyEb90Ep412r00GcLgcytwuUjNX/0jobRxjMlSjBMIuriA6gld7tf22jYoeZEIU7A3
 9PMfiLrdfcAeisiBIe3/Vp2lk7Z9J5ZH88EKYL8WWflaK299+5QL6MyP46pThvrgYUO+lbUf2qi
 B/W/1hw7JgTYJHUXjHvR2S5jkkZZfwmL9cZbQoZJZLa+zQnYBJIMBzHdi5Oj2THINJUQRtKLQ2j
 uMzd/nZ1gqcmrmrsqqfWGquHU9HTUF7XEuqm6ecvSgl9KQ5gfVLL0RYkfkoAAm5Jw7cXrMA6gIh
 XadzcO44k85uLPoYVFSVMoSCr1Y01EFOeV9OPCCsRkx3+CczdRrRWLygNE6lKdNkagsuwkPkxO9
 S4CljfRJZQZnjswcxbuz6MMpCXLhDmj+dwNyVDMtZJCyQ6WbBLvasYOUSALWKlf2FutkKxsCy52
 dnI7mk1/Mpn6Dhg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Helper functions to setproperty with length of property name similar to
getprop_namelen variants.

This patch series was originally part of overlay-path patch series [0].

[0]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#t

Signed-off-by: Ayush Singh <ayush@beagleboard.org>

---
Ayush Singh (4):
      libfdt: add fdt_get_property_namelen_w()
      libfdt_internal: fdt_find_string_len_()
      libfdt: Add fdt_setprop_namelen()
      libfdt: Add fdt_setprop_namelen_string()

 libfdt/fdt.c             |   8 ++--
 libfdt/fdt_rw.c          |  41 +++++++++-------
 libfdt/libfdt.h          | 120 +++++++++++++++++++++++++++++++++++++++++++++--
 libfdt/libfdt_internal.h |  11 ++++-
 libfdt/version.lds       |   2 +
 5 files changed, 156 insertions(+), 26 deletions(-)
---
base-commit: 6f183c7d9246bde8f05d2edbc31fdd497c4a8702
change-id: 20241203-setprop-namelen-a94f7f057acf

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

