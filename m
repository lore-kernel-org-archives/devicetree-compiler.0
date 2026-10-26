Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036142;
	b=5bChlxtACgZbm3U0QuUOW+V1foBXxt3qBGx9qC1lBJ3w1d8UECBp2lFqyPWwWhWXqkFW
	 iVkYFFbfpfqLO0s1CtNGKdUp602kBJzoE2F5WiVtADzCInKezah5cTgCJDyHIaxgUuLuh
	 IQgAbopmKQESVJZ9gE39TWqyqgp5ytsYb0rMSv6bSIHTeCBX1a6vj294lUL62Cx+hig3A
	 pGWxNkV4qgZYDEPQNCwCeNNSouhG9Qq9ge3XB0Lu+LBx/SjXsRHkbyc10G4gPPV6UOB/a
	 yVjA8/osJLVs+5l9uJ/OoRv5AYLuNDbYTm35r6knlFF6BKORqNEZf7BWnwsFETKJmig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Nv0S7UIW0vIi2OxX3cAdfCT6YJnAby34VVJwiJgxRjQ=;
	b=kE3P8NMsg2YsaPLQsPTVsl9wE7jX9pkT5bv2cBLrDItYvjWJH5ksSDH78wG41CuEyzwy
	 rhqqVeMTA1A/IuNqaTfepc763dWDF+iNOkh/ZTOA4rM9ZomGLPi51hddbqGP+Z6bNYrkw
	 juZY414jCFi67uWXpIqu7IdxcalaiJG1B3Uoe8rV00ooacwBzAbryD/MAaBwgwgNh8RMj
	 NifscwFRHQ2U37t/RAwzYXP5KGK9LkLoNqh/uFMzVKnNOXHKS/hpzqwdB5xqotf1DW++R
	 TVDD6tZ7lqo2FD0ETsVKa6vtRTSQa3izzUCZXe1uqIOuu4WQpJNS4hRD/BB1l0G/epQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="h7Xu0C/Z";
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D7F606A31D
	for <devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 17:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D7F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h7Xu0C/Z
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-70b875f6f13so1891863eaf.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 10:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793036140; x=1793640940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nv0S7UIW0vIi2OxX3cAdfCT6YJnAby34VVJwiJgxRjQ=;
        b=h7Xu0C/ZWN9wJr8rD7YRqdubKDW6iIs1Ymsgho5DkUUOzexIQDqOIzRfOBrojkgHJj
         K8iBrFb2tu7bv3zRTAxMDqJc6DOtbieNFtCKVQYlO9K5GgwO54Ld5yJLEQFOrC3bO2Qk
         hY4uj0aMeXDQ1AaiJuYebiexPyihHgbNOebnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036140; x=1793640940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nv0S7UIW0vIi2OxX3cAdfCT6YJnAby34VVJwiJgxRjQ=;
        b=y/GGBsyV7CZGrtCE5Voqslh37O1TqxBsd7mUZzb7I9EcAFhcMD4RpFFliWTjyOonpK
         jSD/VYQdEGsShGfyQkthKCzSxdq2hU3F2INdLtdcko4dKd1dNupBfv94tinCMiQ2rSH1
         B/8zBcHFmiYU/OfNgQ33o4fzuS+HEZu67tBiLa4B6COzZVxznBDcsxgXgX3pR2zULvG8
         R/oqhpQCxTxx+yQD/NqnSndO2kdD/UnEPLcyYqWWahX+SNa0iMyw1YyClI+LhXKSS3FG
         K6dcANd9XJ3kiwt2G9sKyUWzUlzCzMz9CSay7dWUqXTFKNDsPcArd39q3SpSjmJoKQ/f
         4a2w==
X-Gm-Message-State: AFq9FYIfmPKeVPeojW0LRgVgVbI1sPmm1KC9+HbRIPeWWitvSpTxFTl1
	3uzN7ByCrNY/7+MoxrdicRP/ttSd/fBrpNwyH8UtVY+0bViFVzc2X+si8K30TPXhk/igc7XtD+U
	5/yEnqQ==
X-Gm-Gg: AYBFou1XyOSqpI2C/BKmiaNcENtlqgDpA4WqpTxgJJi7emjpjdVAdxg5nqNaTTYgrec
	eEfT8P0us64qkm7tdqdvXriOk2FTNrDfTQfOdtuLD9Vn7VyI5f1eCT5VYZywbAuIGY6t2yRHngd
	Z3rJiirNlz7cprv7a73MiyNiGh+CB4Gen9SCo3CesYM9/1aHAKiFjD7v7awdzQw9VRszFn5OWLx
	oZtqXunI0gutr4zKnVXOOgPwQrDnmu9mxvvJJIj4kivKLjRk3fc5/+pxdjpwI2+gyBjTYo2ysFP
	fAqRoJ7ZXJV0qgy4dyHwzEPQDHMhXH3J0xH5eCPdedSLG0CuEVnk43u93bOlql+Gjx5MxY2L8pC
	f3fejKZyRMa2SHwsHmCyhfXo7r41NoA771JWmMqUQf8jeL86tDaaWG3EFwOp5Z6D7f1Ipu0kOK0
	UvJVSsLiSs9tyq/pmOBPh3Xh2oW9V5Juj0+fJo05cJLXR8HQUSZm5DKvaSDmaS/+SCpUkM3m5uM
	SBhgc2KJccvR2KoAGF5C3M4J2uXXctOQUoSgwnUk14E6xk3PYvNkJAjzQq8nADzITgzzLkl7BBG
	yxFu85e0VHf0vKA61ygGvE9K3LrCcFkiZA==
X-Received: by 2002:a05:6820:1501:b0:6d9:8fed:b73c with SMTP id 006d021491bc7-70ba0e81329mr3988270eaf.57.1793036140345;
        Mon, 26 Oct 2026 10:35:40 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843231095sm4773675fac.17.2026.10.26.10.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:35:39 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 0/2] dtc: Fix deletes within a section and before a redefinition
Date: Mon, 26 Oct 2026 11:35:18 -0600
Message-ID: <20261026173529.3080952-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A /delete-property/ or /delete-node/ in the first section of a dts, or
in a node which a later section adds, is ignored and leaves its
placeholder in the tree, where it can show up as a bogus duplicate. A
node which is deleted and then defined again also returns to its old
place, with its old subnodes in their old order.

The first patch applies each delete within its own section and keeps
the placeholders out of the tree. The second removes deleted entries
from the tree, so that a node defined again comes after the existing
ones.

Note that the second patch changes the output of existing dts files
which delete and then redefine a node or property. That patch explains
why this seems the better behaviour.


Simon Glass (2):
  dtc: Apply deletes in the section which has them
  dtc: Remove a deleted node or property from the tree

 dtc-parser.y                            |   1 +
 dtc.h                                   |   1 +
 livetree.c                              | 112 ++++++++++++++++++---
 tests/delete_in_section.dts             | 125 ++++++++++++++++++++++++
 tests/delete_in_section_badref.dts      |  11 +++
 tests/delete_in_section_labels.dts      |  28 ++++++
 tests/delete_in_section_labels_ref.dts  |   9 ++
 tests/delete_in_section_overlay.dts     |  21 ++++
 tests/delete_in_section_overlay_ref.dts |   9 ++
 tests/delete_in_section_ref.dts         |  44 +++++++++
 tests/delete_readd_order.dts            |  57 +++++++++++
 tests/delete_readd_order_ref.dts        |  28 ++++++
 tests/run_tests.sh                      |  27 +++++
 13 files changed, 461 insertions(+), 12 deletions(-)
 create mode 100644 tests/delete_in_section.dts
 create mode 100644 tests/delete_in_section_badref.dts
 create mode 100644 tests/delete_in_section_labels.dts
 create mode 100644 tests/delete_in_section_labels_ref.dts
 create mode 100644 tests/delete_in_section_overlay.dts
 create mode 100644 tests/delete_in_section_overlay_ref.dts
 create mode 100644 tests/delete_in_section_ref.dts
 create mode 100644 tests/delete_readd_order.dts
 create mode 100644 tests/delete_readd_order_ref.dts

---
base-commit: f99e3af0ecb67a9085478a9b8ddbcc25aa64931d
branch: delete-markers2

-- 
2.43.0

