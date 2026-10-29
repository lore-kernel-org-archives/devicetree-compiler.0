Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266307;
	b=HbzeWQ+WipDhSl6Wsb64oCmTZRw53dnOBcrLyBk4+dKc5nVylZcEd5WjFIms/wbZBoaK
	 H3M6e53Ddvjmmjonv+QS2QyJxpTSc2OEow/XzdhNmQ5y9REs+236LBwjl/nVX0zwlb7X1
	 FxacZsWPQjBLSgDAzKFDPC+33tiZWvYC/HUDuo66TZo0jSKMTZAxB/sldskzyK7B+N/KU
	 pAiFH+WUl1r6xFnPuTMlaFU//jFHggdnsrJRo8tIGpfcPO427NR9wErCCwvPBCRJhwUGN
	 e8uQJqla4knrKRJjJNPI0s/CSUvchKY7bv9moe+bpYiA9Sk7slEqqPgVh2oTtEYhx7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9vanZJVp5gMnH4C8zba7txSTCr20vfEhyBzFY5Zsxso=;
	b=I0k25x64q3q5TAikzm/VVn4LC7pWdXL4w+dCp5297rg4dtsI8bx0IyTeHOdJjvBpTBWT
	 B1Pd4JfJ0iwUiwe5Zk2TyWtjv1tbc2Bc/7EEiaFOmvzzHpqbITICwmHNFCJJmJQQdTRtW
	 TOPE/k7wbkiN5adAc12mxmwR/T4n57D3avlg0LhDKF1IQ6NV1YJJl5DDdGEu0fLIW36nW
	 WaTwNvxZvwSPcP17YEiHw15vwZtbf21lbCIlFX9ea8n9WmEUtOb87XfeWQnuKg5kKjzgG
	 21IGAep/K5x0/onu7+ClgrVkbV+PC0o3623gcQujGcwkC40I23vKiC+SsaaHoFzZ4lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YuAKP2H4;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66200606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 09:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66200606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YuAKP2H4
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-53aa0802881so957660b6e.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793266306; x=1793871106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vanZJVp5gMnH4C8zba7txSTCr20vfEhyBzFY5Zsxso=;
        b=YuAKP2H4Yq+qbRAyC3AOjjPjotUfeDXtGmnSUZLLqsfGXl5mA/WXRi5YfKDyJS4g4g
         BlDjLoNnV+9gERZFlFoAGofnlmDWqFeK0ZYewXbAVXqca22GhYrysrDEj2vz5dR+RcoT
         6tJr6yESDVYNGyC+t27xY1EXsydkWD4Jr8Xtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266306; x=1793871106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9vanZJVp5gMnH4C8zba7txSTCr20vfEhyBzFY5Zsxso=;
        b=my3qakTNE4NGQmMnK9oINsG4bSohXNLuevqCQ77YyB/IX6b32/zo1+hsd0eDZfYWUa
         ZJR4EGHXInjfxUKJIVEvkQMWLo58ZUUMrBNjM2VCB5qjCZVjHNVlwhsIuxTT1621b8Bp
         LKcWtqHjhYbJCYn70RoR1So7xD4aNB2lJ6yn/2SJifeOoIz4R8rQVsgFyoaaO+XI+Di7
         DXgXkawpt9MG0hgxHn6zaFTv7r3DHYpVrJMTeebQzCZWlSH19nSUstDEypklpZasFSpl
         ukxWQGp7HVyBMBno1w9++12QlwfwTdpITzl+dO7+9K5cFEKiL2gh/tuitX/goMJHEdmI
         lMfw==
X-Gm-Message-State: AFq9FYJoSQ0dvREM7fFs0HU7DAS6JqzQY7XD5Ap9OGmApNykvke/kXSR
	+4NKYB2hARSi6lmTijU6by3e7cYypPe1MtwM1srZ3FPps8FaEXMH6G29Bf5R0l9Mz8gwLLdIEN0
	8XQ27mA==
X-Gm-Gg: AYBFou33FlyDE7vVn5XvCay+Nin+ieQO2iictnpK5zb03BSZZx0H2xdusXJIGc5OPrT
	+XkFtUWDE6Si2JbZNl3aLeeq9qpnKXBUVCtOPRwl7pdNLOST+jmxt7mH4f2hsjquHWDtw79qs6v
	aYpHdvCka8BmbLbRtZO/aNf08DDxkFZ0Dx0ys0VyQHEqpdjaK3WkpZymEZTbfniqig7WBZPEpGV
	TT/XOxpG6UUD0lViResAaowI/ocK5a9QjYt/1H4DY/qyalUcCp0ShVL0HN5oZq8eylbNMgMkPAj
	0s+5g/XFthTf9f9ePqcfjdD0+cCO/fs23lMbMo8osbZJcEf+XuqrUV2amOwh/EP3fBNNAvDcJ/b
	OwxWGY3vPgezClVEkKszws7/nR7ZRl7dg9uFqkbsob6ZRphBSIZK5ot+lOvM6Q3GCPy8VVG/4SN
	s5PXsP/y4WqdRLCETeo2EHF8DJKP9Z8iN2zC+SV3T70JLf/9mxuPGBbhOopnSl1n8ZKsJhu9M3R
	6SuDpeUfRIhiHgqNWHCM/PCfDKEBgGQ8D/Es1VSKd+rdWGBi/WUR6rTY4j+RwjwHS1Cvmnb3jXB
	AoOXLd26eKJ1M2tLvsXFWECNUNAoo0u3AifBkBPQD650xJ07FikEN/pJQXhEzkCWai/li/3bRT2
	8eQPvdrq/7AATOm5jorwfvg==
X-Received: by 2002:a05:6808:3081:b0:4b9:e6ab:d07b with SMTP id 5614622812f47-5638268386emr3290034b6e.27.1793266306335;
        Thu, 29 Oct 2026 02:31:46 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a50281sm3715213b6e.7.2026.10.29.02.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:31:44 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 4/4] doc: dts-format: Correct what happens without /dts-v1/
Date: Thu, 29 Oct 2026 03:30:57 -0600
Message-ID: <20261029093115.3647778-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029093115.3647778-1-sjg@chromium.org>
References: <20261029093115.3647778-1-sjg@chromium.org>
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

dts-format.txt says that dtc treats a file without /dts-v1/ as the
obsolete version 0 format. That has not been true since commit
4e1a0a0129b3 ("Remove support for the legacy DTS source file format."),
and dtc now gives a syntax error instead.

Say that dtc does not accept such files.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Add new patch to correct the description of /dts-v1/

 Documentation/dts-format.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
index da0783b..87d3d8e 100644
--- a/Documentation/dts-format.txt
+++ b/Documentation/dts-format.txt
@@ -137,9 +137,8 @@ Version 1 DTS files have the overall layout:
 	};
 
 * The "/dts-v1/;" must be present to identify the file as a version 1
-  DTS (dts files without this tag will be treated by dtc as being in
-  the obsolete "version 0", which uses a different format for integers
-  amongst other small but incompatible changes).
+  DTS. dtc does not accept files without it, which would be in the
+  obsolete "version 0" format.
 
 * Memory reservations define an entry for the device tree blob's
   memory reservation table.  They have the form:
-- 
2.43.0

