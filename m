Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40561D0DD4
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Aug 2024 17:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781291; cv=none; b=kQfN6wPkdveVnJwRjiZYESnVVnea2ZYq5t5YhfAT7kPzS+6UJXB+FcImtxfAeoDUl10WNCVOoFYCC9k495YKvu/ozpNceQ9WNwWQX52rgNzRR0c6VXMY/fCRX9iR/w4/o4kJm8VENV+c/1qZCV5UyCvZPLfL1v9iWcaZf3ru2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781291; c=relaxed/simple;
	bh=gcMMLFiQIhfq2y+yZod8w+VsMvoDFd9rhOV5TynDQ38=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ef3D/GIHwHSmsqLUdO6HZhClZ/eNVr8V8s4+FD4lnZTQqnC9+2LomDBTDcOdqwN2lAr1X4SQlG9ORzASrx4gz6YOJvzm9MvGpd1v9o0/Mt/Bn6axuKlT3gT7gGVkkJa0scpErcKdYaekHg0+Vm8OBqcid/0hREUa1q4Sf1wAO6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=RTAjDi74; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="RTAjDi74"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-201e64607a5so41639975ad.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 27 Aug 2024 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1724781289; x=1725386089; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CmO9fEPdigojxjk++13dNDx88Wqn/npBXhzQiMlPD8=;
        b=RTAjDi74so/6x/9GK/6FQGntptl4UpTPtUmnws37y8qQOiOW5LqkUyEU6bftaNcGfP
         kX/We5qqcElSdSzr3JF2LOgKxypchZofXoXtm2l4BGNxfy50ViGpB9g21WHJj9IHpxwZ
         uWOrdQpKY2Lk7jULnyALDBPYy39tQDRSs3t1Rhu8gVIQ14qAAMvqDIDFvRup9ymDc3/o
         U6vcjH1mjUodWBZqL/2aZe/h19CoYC3oQLN7jsI8PCNcimj5QaPCE0uOFkmwFYZrDNcM
         8fodw8CC87FyAS9i3YbKUQbJwdattuoc8Y8DkiiNyDRb7SEByGDFm0DAQ6fWmRK0kZaE
         0OiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781289; x=1725386089;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CmO9fEPdigojxjk++13dNDx88Wqn/npBXhzQiMlPD8=;
        b=ZzLf4osd1NV19y1kjX0zAy99X5EXln82q/JBtOv6yRo+GpWYciwGH+y6Ytxg9332Ct
         kIBt3hSq/xb3vXjtdXekIydBXeG9wAG9HLoSp2ZOLyUvLebdGttM6chEFFFIMdyVDyrh
         +abwCkx+J5PvHmg6se2U4xfFv6VDq1pGU/xzH6fErIoG8RwWCUYOV5I2CsnBIVEVG6Uc
         buke1yR19Vgw1SZaTq14K1u4M+2qcr8b2BRqCZFuS2ygEheBffXlE9xXNO3T5ZaILsNC
         KtblcJ4tJLwvXv6ZKg7dfmK+5G0+i+d37Qtqc8SNfGs37y5wiSj9cEHcjdX+opIMumhg
         3fiQ==
X-Gm-Message-State: AOJu0Yy2RyCtVqop24hGnICuCw8IGpVSFz8REe/35zIrWEqO5EvwP0Lk
	XzlQLRwcRF4oFk4pthopwzA5IJWWOpdoiLX2yjUreVzT3pwei/YT77Qza1iEyQ==
X-Google-Smtp-Source: AGHT+IHzGm3dzv7aAdUW0vkDTDCZs/T/q9o42Uem4+NaqiUSzEf7tSCv4ePrPh7lehAFCMrc+AlFyQ==
X-Received: by 2002:a17:903:244c:b0:203:a156:54af with SMTP id d9443c01a7336-203a15655dcmr214800705ad.17.1724781289093;
        Tue, 27 Aug 2024 10:54:49 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dbf9asm85763235ad.179.2024.08.27.10.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 10:54:48 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH 0/2] Add capability to append to property
Date: Tue, 27 Aug 2024 23:24:23 +0530
Message-Id: <20240827-append-v1-0-d7a126ef1be3@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8SzmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyNz3cSCgtS8FN00M0OTtFRjIzPDNEsloOKCotS0zAqwQdGxtbUAHL4
 Gn1gAAAA=
To: lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=gcMMLFiQIhfq2y+yZod8w+VsMvoDFd9rhOV5TynDQ38=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmzhLlyxsm9VKXtwPwAvQW0dsv6EtCuuE55wwGD
 iTIXE3ye42JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZs4S5QAKCRAFzvXHieVa
 dHpzEACz+CPC4XIHPh1UjELSTt+/1YL4BfZBtJGo2F1lB1JPJV8S1liBgNqZV/foSbgXY8gAPhp
 Ft/xZ0/ZYlXx4nCPUlbzgd624YsmCxfDV1joiJPpzLAnJ/zYd+JNgGAlbx3b+8WiGDGwmZoNjgu
 1U/peLSV7LBbdPsvZguiTTaOZEmzs/DMPaMKozv1+N7RDzn8bEd4n2ZqYsEDqNm1/iOxOV4reZM
 VLbvoCf2kRFm47omhS8LTTt78dufIgO8IcWM5W/2uW4Jj9vDmpyvVHoQcaenZoXCaxQAP8BUCdR
 XmkbLCHN9mqG9vHm1imOwB7Ak/QwjV3U+GZ5WkhkcpUu/KIj9SedDrUE1BufEyK9CKFzrtKN3V1
 aofY6IblebFIMpML/tXAUcOwuxr+/VT6O1JuFjq0MmXIULFai070B5m3Oj47AyAVWbdSYQWTEna
 kj6tXyR/0pFqM/9L2ndxtXPREUfoOPPlTauvwkUs5M3zeqm7vmJhUYdLjcH2/5vausHSR7FJrgd
 qE2b0/fRCbz83I+VjxRPPsPRR2Bet5eKz0YxskosdSQvKBMn3Je/ARKs5pFTZzvHNxxcFEnu2P/
 WCKIxROZs1fUS+j/VHQt/6furIJmLka3ldHc4u2x9NhJrlCidz5ro+hn4GGoTELVtfcdxcRFo9d
 XYUJuanOR7ol/TA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow appending values to a property instead of overriding the previous
values of property.

Currently, we have /delete-node/ and /delete-property/, but lack
/append-property/. Hence we end up having to repeat all existing values
when appending to a property (e.g. see [1] appending to clocks from
[2]).

This functionality is also important for creating a device tree based
implementation to support different types of addon-boards such as
mikroBUS, Grove [3], etc.

Open items
- Better tests: I only started the work today, so well, I still don't
  have a good picture of how to properly write tests.

- Appending to non-existent property: Currently am just adding a new
  property if not found. Not sure if this is the desired behaviour.

- Incompatible values: Not sure how to handle when trying to append
  incompatible values.

[3] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
[2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts#L39
[1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/renesas/r8a77951.dtsi#L3334

Signed-off-by: Ayush Singh <ayush@beagleboard.org>

---
Ayush Singh (2):
      dtc: Add /append-property/
      tests: Add test for append-property

 dtc-lexer.l                 |  7 +++++++
 dtc-parser.y                |  6 ++++++
 dtc.h                       |  3 +++
 livetree.c                  | 30 +++++++++++++++++++++++++-----
 tests/run_tests.sh          |  3 +++
 tests/test_tree1_append.dts | 21 +++++++++++++++++++++
 6 files changed, 65 insertions(+), 5 deletions(-)
---
base-commit: 99031e3a4a6e479466ae795790b44727434ca27d
change-id: 20240827-append-f614fe3261f9

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

