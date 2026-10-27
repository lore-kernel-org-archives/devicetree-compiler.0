Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102501;
	b=34angNbELtlZKPhvQs78ShVJwNh/bOFb7vC0dgwW2fCAm188AczIXIjc28QoeF+l95Pg
	 dzhbQHlhXmuNRB8utqQJWyTijeDYI3Y1NZP65cXP/f77XsKNGfMnmvix4e2rwk7d3u0md
	 FSOcykh3WvBFbsZxivbJtxF174onoFJfrSEsqQoiM2hBHGA00PG9SAowJiWuKjkFZNTiU
	 or60644wnYYXiBVCc8/axAloBQFj0R3d0GKwQubOVkfaVmmxvsCo16LM1yZrr0LjHFYHr
	 M9fM/zZDJlmGTB5P24VPQdsTSCUZx02FgZD/mZJwCY5S5VZZah9T5kOD84ogYR5+gBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OKnwiROKEZUd3Ipnoj1Xk4NbULkt4uumLy6w1modDO8=;
	b=tta9kxcfoMSP622490ODUgrN419VcmZnS/uQw+ycve7GnZ6/0apNZbpBywp15PxgoP8h
	 9OD/dZrlIegoXSnt5TPvHCxnhKR/xmnvc7Fm+IOQ5/zM6xXX1aHnfV9h1WS8Pr5kGhE4w
	 mfyHe6h+e0RNm+7WW2z6yD4D0fmUKQfYKE3W4xgYQ/+PjulQ8f0RVQW45wN+O7VUTOa3+
	 NhAjAR7CaHUWRMHM6DrRVbRQgNxazwE8z1AzsQsIVXY6+b7gCkpx0W5laELTIndmupTFa
	 ZCWv02MNEPmeNcFFHmUrp5zdSi5mPvnZ9mchIA85ybIyPo5jCQxyKnV055gShQGjRbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FYoG6dur;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D957360A2607
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 12:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D957360A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FYoG6dur
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53656465d1dso2066174b6e.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 27 Oct 2026 05:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793102500; x=1793707300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OKnwiROKEZUd3Ipnoj1Xk4NbULkt4uumLy6w1modDO8=;
        b=FYoG6durAykqXE1cm9jL+ccx4A3ShtaEFZuQqpBsHJq3QZ/iHAi3KNrZKSyeFudaET
         UHF6k9VOacU86VsHC1WLeERxNx1T4G544L7OLUVd9iOfGrUpgaXVjVkbV6iRJraNKgDj
         9WZ2sXiXBoGvH7KrVwChKOu35nKPO2eI/Nhp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102500; x=1793707300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKnwiROKEZUd3Ipnoj1Xk4NbULkt4uumLy6w1modDO8=;
        b=1riV342gB8oAKvy90d/EHrMdHEBMzYbmdELYJ4Ui54tHJL71rMN+TlQpaKH6gKOyfB
         ucTfjJaI5xyoPFiZIbU3IE2cMFm2WgNtE6gpF3MV+ILUJQtMbb8D+z6ZypZMR0vQ0Iil
         3JHKKT4h2plChsC0xi6Xv5Y1djfKrCpZaSkohJHDK0HLN00vyNp5jUXQTRHAsqsnLHwD
         tUNFvMBpnSGs7D2sUnrcYMzsJTM/l6eh4Abv/aBsEROMw4Cpu2ly0L2UbIt46saxiwBw
         E738xbH7PXnPAk1S/Nxp3giIUIEo3/htsHU8QmvfA0Q5sOSAeAGfCsG95l3C31eOt40o
         xvVw==
X-Gm-Message-State: AFq9FYKUrDyBqD0zus5I8+HvdcdSiv4xgqLvvJsoHbunszgPgBhBI7xB
	jvFoKjDeUrAyytiQUL2ZmagO2UpKprN4VaWOt1jXJHIkRDhwcAU95B+l8+T6Oy3p/5iVUHHqQA4
	q67VlSw==
X-Gm-Gg: AYBFou3Ec/bvFGtechC7lr1PyTwuSo2TCNBDJowJYI+lnTqI7oDMCYeCCPPZb5xRxdk
	qmco/Idpkk1QChypBfmpPaSM3ce87H5mkyFVFmfIPH6ErA2trCBT4YrjW5gJ35rwQhQSzxC/Zwk
	QIAjv5og0tuyOtXJFLFDUFKo4Mt0EIc5oBE4FzBPSU6uQINfRgyRYnje3VoGLSad5owtO/cnRU2
	iREfl/nK8HJzdrVEfp5lzWKN1dT7I4N+P4snv7PTby04ZUD4cKMOofAW+gzertSEoX/HVHvobq0
	0u7ux1G2jzEsddSFgAc4QJdlAgKZPcsVEF87QYHe+bfUCsXVIE+tKhbWQig1zmuBIPmypzg7Ph3
	rgcwyAw6deA0C6UEuVmtyViCVTdd4MGIm2wj2/95hiaHHb5TPCdvJCyN0cKGRO3zB/YHWyo1HyK
	Fbc0+PoSBxP+D7v3xGtcDL+SsLwYOvOr2SNlgzhVKqSiorhTHJ4QAg/w4SQRToUrDQ0Xhqf7pAk
	L7hxUa7vqbSLKbqyIspP72E9YX1dOGlrwk8jKGB+YXR1NFGOXTYRypgWvLeBRQKWTd6GhwCdkiB
	zxIn6tVXfFzb
X-Received: by 2002:a05:6808:3c48:b0:4f1:7cd5:8e0b with SMTP id 5614622812f47-55c0026d96bmr6227255b6e.22.1793102499487;
        Tue, 27 Oct 2026 05:01:39 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431c012esm7133755fac.11.2026.10.27.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:37 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 0/5] fdtput: Make it clearer how to create nodes
Date: Tue, 27 Oct 2026 06:01:14 -0600
Message-ID: <20261027120126.2613353-1-sjg@chromium.org>
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

fdtput can create nodes with -c, and -p creates any missing nodes along
the way, but this is easy to miss. A user has asked for a way to add
nodes, not realising that one exists.

The first patch explains in the help and the manual how to create
nodes. The second fixes -p for a path which starts with an alias, which
creates a stray node at the top level. The third suggests -p when a
node is missing, naming the parent which is missing. The fourth names
the property, rather than the node, when it cannot be deleted. The
fifth corrects the manual's description of -t.

Link: https://github.com/dgibson/dtc/issues/49


Simon Glass (5):
  fdtput: Explain how to create nodes
  fdtput: Follow an alias when creating nodes with -p
  fdtput: Suggest -p when a node is missing
  fdtput: Name the property when it cannot be deleted
  fdtput: Correct the description of -t in the manual

 Documentation/manual.txt | 38 ++++++++++++++++++++++++++++++-----
 fdtput.c                 | 43 ++++++++++++++++++++++++++++++++++------
 tests/run_tests.sh       | 11 ++++++++++
 3 files changed, 81 insertions(+), 11 deletions(-)

---
base-commit: 9a712e0c7fb7eec14cc83a06d7a2ff7910f49b97
branch: fdtput-nodes

-- 
2.43.0

