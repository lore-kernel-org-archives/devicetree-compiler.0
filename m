Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468DD19E96A
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Sep 2024 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725279509; cv=none; b=Hr0VtBeluy096qikeHNS5xaZUOg/RWtQ2qMTdVmD+WMDeo4tXeCWRfA9prLjLSLLkBkHeD40ISsSdxIpl5H9CLDc6+u65/mePFd8eqLnCfqeek+C8qHsfnH52/qki9MtLYXaJnosWKdy6AqF9kiL87y6PX8M/pM8t5jcTQF96/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725279509; c=relaxed/simple;
	bh=xTa/PyQpGQgYeAjZvTqOqFeJcbkFl8v/E+zU16TXBes=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MkmVXIztCRwyVfGakrx/cMLZLrxqPSqrKWJWRWUjCUWusm8zP9a77cherfgzgJzsgsjoypQ4Ci64FOQ0rgnvjqsMFNpFLQsZ57AESdd92PslHlGaheULUJaAN52aTy294b3+V7UHg+uoxsbmSDUzYXRazRxlcbYEcraFj0mWVp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=OqDiK2Hr; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="OqDiK2Hr"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-1fc47abc040so32850935ad.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 02 Sep 2024 05:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1725279507; x=1725884307; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZdr02Wis0idQb89WjCFOB8zXNoqToqvF64bFsYWd4E=;
        b=OqDiK2Hr3Nlrg+E+7LJ4VEZTSHMITkwQnrtOWS3h9GFalsPcOkMqEQE10wiDYVr02J
         LeYn6zYeO8o3VHV4/YdF4ci5DvHkNfQ9y5SL+U8WdRECaBYeWL9ZXt0025s89ComlA1S
         FJsvQc7cUTB+H4vB/7/J26/OpxDwj+3drrxtLcaUr14vgBsd9Hf1bS7i2XKB4dhF0P3d
         2b4Wp++u/8ItmtY1BI5Hs/kc/0kZUi+7pHee30yvWCJUoanaJttqpRUgZgO7n7sCOIpr
         Wc+sr+bdM42+E00/e/O7PQjLKfKXdTjCwp5BjMmSLwP1wX2wGBU12lg8M45nkbAQDi/r
         shEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725279507; x=1725884307;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZdr02Wis0idQb89WjCFOB8zXNoqToqvF64bFsYWd4E=;
        b=N/JN/u4Amx6ARj/s8VsIWcNHrU2fhUYP3LOqcP+pwR40YT7ujGWu4lqbpW0m4p/Hvg
         oeLSXGbvjbBVLgo1ink7Ohpa0OqVGg5VP1GOZyjWwQRZuDFfTzNvDmfmQuHHEEnXZVOJ
         Ug8oR9PhP08u9REAlevbkuxQPLavtI3tmCi9UUoRCS5qE7Dfhk+WyEd85ee5NN/ZOtoK
         SRJfb4qUXccyQDaitsn2NAlxZXXrFM6R4BYS9aFvFHPmu2rfEO8GjKnsjGUdyshikCO6
         JU9zUQo8vsd4HBFYGh+tqAfi6aDOtnQLvW19kjYVEws8JZ0Hrv0YCd5aGmVJiJrTiM9Q
         P59w==
X-Gm-Message-State: AOJu0Yz1BOnWCbfNOnxpsPbKp5FfcjtE2pRTIs8YNObCJMx47+SMAzaw
	+nzidbB8fA29DxTC0xdG8D/ysvHf5C+KsFJH6amZvYsUztakz/yiyCtJnEl0nA==
X-Google-Smtp-Source: AGHT+IG1AyMBRXu1sB+QKMNjq8TryQOwkCVGxeUhmfI+2bFKd0DbnC6s75LidHwjyNVVb9n5EuFSLg==
X-Received: by 2002:a17:902:ce92:b0:205:3e0f:8122 with SMTP id d9443c01a7336-2053e0f8b6amr98869205ad.49.1725279507352;
        Mon, 02 Sep 2024 05:18:27 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2055d6fe84dsm25262125ad.11.2024.09.02.05.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 05:18:26 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH 0/2] Add support for phandle in symbols
Date: Mon, 02 Sep 2024 17:47:54 +0530
Message-Id: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPKs1WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyNL3eLK3KT8HN0CoGRKTqquZYphqoGJhWWysVGiElBTQVFqWmYF2MD
 o2NpaADVy5mtgAAAA
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=xTa/PyQpGQgYeAjZvTqOqFeJcbkFl8v/E+zU16TXBes=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm1a0NxvmmLqKsxZz+82D9rJX/ccJzzbNLXs4gP
 Nq4EGncckuJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZtWtDQAKCRAFzvXHieVa
 dGU3D/97hh/W+ZDkFNX+BIvjUmf/ZHBm8xNFdkzno5gWgmaJhUQuKG0ibl10r2xbomicKnlfFvW
 Y1cMwnZ/UCqfMB9V/ESBebbbKjAdz2LuLHLMIPcWtY8dwYNxobMlciFTNEriy24Ie7UdSYBZvld
 /LRt4CAKHXUL3RJ5J7+i9ZOUCxCoQwNvbi9zXRolitsjPn8FmdVQ9vqP35ArmKSB26QY9vac5tx
 xA67s7m0vWB+3TdQlNch2faRKs2SBkkyltKJJMn5b8zbRU5hWCxdXQHIgUM+UZZvB+Zn/P20EvJ
 l/Y0pFTZxlDe6jUvf1KkqLMZd1N3fwKtgNM0eQCaSylj5nItRRv9VhjXdQQCYBVfpqdNNxrN/pb
 Gt1J4q4kuQTNvI34cBGb+CoB0KhhxqwYcAOBqIjWsFbBVf17O1tSIwzhn36jRQPEJzdefC2ZqAD
 5HUfpktlKlNdP7NpNzz/Fp/zkg2eBl/LNefIqg3rePfoH8GcR0DF9A3tvP+hSb3Pdiu40KXILy4
 I+bV1kSEXIoJY17gXzxxLNXNlwMLUTQwV0ssq17tfJiEW+PkgPkWlVUX4eL+O1UAFKYJ0sg+iND
 5ZXHmbCbeqjxvkvMZCvq3pv65rwjcVvkEDWgdExUlOd7vVxEYIG1lhInLZUFLajDZ4oqOt4vjtY
 Bl9AqrSwZgt/xBA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add ability to resolve symbols pointing to phandles instead of strings.

Combining this with existing fixups infrastructure allows creating
symbols in overlays that refer to undefined phandles. This is planned to
be used for addon board chaining [1].

Patch 2 containing tests demonstrates how this looks in practice.

Open Items:

1. Phandle vs String identification:
   I am not sure how to distinguish between symbols that are paths and
   phandles. Currently I am checking the proplen and if the first byte
   is '/'. However, this can cause problems if the number of phandles in
   dt exceed 0x2f000000 or 788,529,152.

   Alternatively, if we can be sure that there will be no node whose
   path is of length = 4, i.e. a node name of 2 characters ('\' and NULL
   already take up 2 characters), we can avoid the '/' check.

[1]: https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/

Signed-off-by: Ayush Singh <ayush@beagleboard.org>

---
Ayush Singh (2):
      libfdt: overlay: Allow resolving phandle symbols
      tests: Add test for symbol resolution

 libfdt/fdt_overlay.c                   | 16 ++++++++++------
 tests/overlay_overlay_symbols1.dts     | 12 ++++++++++++
 tests/overlay_overlay_symbols2.dts     |  9 +++++++++
 tests/overlay_overlay_symbols_user.dts | 26 ++++++++++++++++++++++++++
 tests/run_tests.sh                     | 19 +++++++++++++++++++
 5 files changed, 76 insertions(+), 6 deletions(-)
---
base-commit: 99031e3a4a6e479466ae795790b44727434ca27d
change-id: 20240829-symbol-phandle-9d1e0489c32a

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

