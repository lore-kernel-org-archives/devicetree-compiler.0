Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994785;
	b=3r2Rz16hmKqWQAbQpN/q8M1iqbW4tfrW8C8rorukMDxHv4m3gbpEmIz/nMp8/Ydo8tGh
	 AwRkiwg43Cv6dQCD39T2OV9kBxqEfYiwk1f3Os2NcemKpQsFCGBeTyNGNfOZJJ3YwkL6k
	 LHjIVRGGhNqdVqid2ksXWtAGCgrcqTr5QBk25WqcqLQ3KwNtPUoNEkmoAVYxodZSCt/Nf
	 OwLUddEfCh6YxfJ+2g2Bi0bri+gnWgKQxRnmqGu48Yzku6nr39B0dwMm0ufy6G7WfLoHr
	 /Lkf6+rJw1y22df4rSnYp0p+6r5FHcLDlhjGc1qHLTUNvZn8r6eecpxBp1Q+nE1LCDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ft/8Q+1+rQOmS6Q40nUOYIoRtG6MdKuSmEKwulK435E=;
	b=DUg/+bObbYG2/2tm9tx5QobMJ8OTH3ZgC1AAdKagzOhZmGqnpex/RJ5dzT/3Gwa27tmL
	 yDgzM6YOENo/Qg7OOIrZjDLN5/iiQ0KAcevCOnmEJVeWrA/y+6wXU4dYzlEy3m3rjyp0m
	 luT4jKE8YibcpVU/2iJhXBI376eDcImnlT+a/MwRxCLH7oj9mjVON6CHvXDL/V6SY4AoK
	 rXbloIqldPGM8ikktPR+LdhJPa+tYK3qA10kLSfET7jsujEsfWZJ9ghYBf321qvkeVzNa
	 xHRT1oPt+1iZyjznkzIINMqUoqG0GKdP0v8aR6bfDPUutK5Hj/2sS2FwONXzsHxd7WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZUGfxtST;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A617B606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A617B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZUGfxtST
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso15247fac.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994783; x=1794599583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ft/8Q+1+rQOmS6Q40nUOYIoRtG6MdKuSmEKwulK435E=;
        b=ZUGfxtSTPdrcPSuLSQ3fiS9xx3RZrQ+iFcJgNsXIVq29t3oXjjBfZnArh8slF2pqno
         QBZcHHG1WssxwmUEEn18ADjp+ylGKrAtzZrumTT/jv0kYL88ja9CsJ2SsQ1QwLm6ocQx
         rAgexO/ORW4kmD+1ebhdVwXftxz/NYtpFx6e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994783; x=1794599583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ft/8Q+1+rQOmS6Q40nUOYIoRtG6MdKuSmEKwulK435E=;
        b=0U0Q3oxLDAleOf5LxUdnZkQn95ujiyTjhsvBAYilK/Z6eTEFCvg38LDlm9TwbDB6C+
         VWpd35ioLlyvep++MztYwqIi0b/Dbp+TjsTdJc96rxWJRseWjAPmTr53tp6sfhR4lm85
         7dze9dBx9IBWoj5P2fv4KA9z0erZNsalj36g/7MmDr953QYjPG/QqO8t0gEuimCnomlZ
         sNR4lOidLCfdLx+llBhHcar0sOI00pXfUyQDiqshg4dghHhHa6TZhevWi6ShGOXOBFh8
         BUrJPrO2A5yoLjeBHglv9oOLQUjzlgZIRHUf5PxLRBbkKukzArk/N46BiDKa7pzQrAPR
         HL+A==
X-Gm-Message-State: APuU4Z8XUkF4zofXRj8IhJKX/QC7UyrqD0rQzAOb2fdud1JeuU4Y8Qvb
	hmvv2idKSzvE7K3HyxyUE4c5+TE3Wz3lIlmwkHtPL9Ng3fFrCnVAkTBzQlkh8NhW0qkzEdq3HpW
	m1gBFPw==
X-Gm-Gg: AYBFou3qe/1LSn2TAbNuKowFXCk1bIJyvjH5zIHuA9iVi5wKl/3qmeJu/pWc4/o8xLn
	W78EmH1qM2O8lGexWlkvalkJM7cVzhpUHP6z8UNEj8SKOqSHMj33va0Rss5vsfhE3jQ9cG4SFKy
	8j1Atgs2sqpjO9mbAgrQS+satLaG07M6ZFozDxiqYEzs7ARAW60r4LEdKGTMcdzeHXEiHVixL5b
	c2Ui0Nwkwg1II7sGnMAOLd14zPe023j2avPfNuocRRTPxyuKgDcIWYEsFU9O4XrdLFmfrP99KLx
	uZm+BvO/JVMHn6oaS0tPa0eSKRIrE+ONiyxDE39sh+C0ZTNHlZAeGZ2RNX/syQ2juP4HeqCLkNc
	VWoXPzs8j/PoeOAi779yG3Aeuc4IhgqHg+L/CE5+vXGo+SNrFs5QXm6qrwSCXiL3cCbVE8HJEne
	qkLPPNWab9m/EKexjQmkwKrdF6MSJpMRPCwlZ1CZXFFckcviIdA0RSNGb6TSmwQJeAqG/rhKDdr
	3pGjbPXye+P5os9mqtQJe5tzzkCaNpacTPqkjaMYbW1bheIM/gNPbLrofnNZ0rjtNmbwfxo4h5E
	XlY6neK4tHiAI3I9carKqe3zAKw8DRqB3kS14prNbItIAMxNxt/TmEh2TVIrOe8pnElZUNEAnt/
	un0LXAiQa6CdowwrQ4ZNA
X-Received: by 2002:a05:6871:418b:b0:4a7:2ba8:8e66 with SMTP id 586e51a60fabf-4ad6c85677fmr3709388fac.37.1793994783489;
        Fri, 06 Nov 2026 11:53:03 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:02 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 02/18] srcpos: Allow srcpos_string() to accept NULL
Date: Fri,  6 Nov 2026 12:51:29 -0700
Message-ID: <20261106195159.2623314-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106195159.2623314-1-sjg@chromium.org>
References: <20261106195159.2623314-1-sjg@chromium.org>
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

A position is not always available: a node read from a dtb has none, and
top-level fragments may eventually come from a dtbo as well as from
source. At present srcpos_string() crashes if it has no position, so
each caller which might not have one needs to check, as those in
checks.c do.

Return a placeholder in this case, using the same text as
srcpos_string_comment() does, so that srcpos_error() can be used whether
or not there is a position.

No caller passes NULL at present, so this has no test yet.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- Add new patch for srcpos_string()

 srcpos.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/srcpos.c b/srcpos.c
index fef892f..c42eba8 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -324,6 +324,9 @@ srcpos_string(struct srcpos *pos)
 	const char *fname = "<no-file>";
 	char *pos_str;
 
+	if (!pos)
+		return xstrdup("<no-file>:<no-line>");
+
 	if (pos->file && pos->file->name)
 		fname = pos->file->name;
 
-- 
2.43.0

