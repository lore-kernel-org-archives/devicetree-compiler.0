Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827111;
	b=qFPKI3Ckw9dMW1Aqp5F3jqo3GvIxRUEVjw+uj3d9ATKMB6d1izdyr2caNonwVVmUVITx
	 33osIB3R/QJ4KCX2XeBhN25sgY6tbYB2pgwFior1aHJT3LaUi9nzT467k41ddRvx5xEuM
	 QdbtRzqVqp+bgxkP7h5kwVU6ExmTVCAs5etW6beUxOmb6otXyNmcm8ZZsSYmzMEkmb2Zz
	 CSZLiR5IUKjL5d/kJG/f22hEcdRGXERF9FjwiWdR91w0b+hBKjBKK+ZAwa8N7YfFiyLdA
	 zncwpAqUHHOOLQUzhNhY15c7AiFPj8abwizYq+fZkmx7D0CvBpeOF9+nRfB5z48Al0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IOYOSBxpIn7j5dF0myZ9eehuF1ph6s6x1an3b9Mi5qc=;
	b=JxVgUBV7vkpMnwBMg8r0GacyyOo4WN44qNp3zp8bZ/BGUcZjM8NDo8sxnioy7Pray+GP
	 bJNSFPCPoa2TjiTMDbumKLK3zuDOLBRYkO6rxryFDESVawrXOLtzgb2Qr59ILUmhBn8Cp
	 5mZZzWbhEJyV7vS6yo1GWZPLoBURtiCq8f5xjovN8RtqEb6Xsp06wrKWLph4ju1ZYk36T
	 Togkvh4S4ElkHmi646tEpDL8n9/Of55P6KI4u+tdRY4aXyWJYz6KLBp1aWivUzSGmdnaI
	 kLjX34Is38Z6dZi7SbgLbjFVY5gKMSss2T2Gi2mbURTsdxjmp8EdzZaO6kWsCAvKjvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=efBJAPcf;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAA960877F5
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEAA960877F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=efBJAPcf
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f13so1098945eaf.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827110; x=1794431910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOYOSBxpIn7j5dF0myZ9eehuF1ph6s6x1an3b9Mi5qc=;
        b=efBJAPcfcabgVJx1JpW1Dw5hKdu4S2wKjgmq/dtfl4Z7wyFakKboM3wRp7m/My06NU
         8+wt2CurCkb0WC77yMtzvH5fQ/mz0ttvFOwIVzA08jE2AFTRyXUC7n6lm0iqCTaSrlyr
         ufgn1FvTYKvCice1eIUVTrIQn2xHTTFgLS394=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827110; x=1794431910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOYOSBxpIn7j5dF0myZ9eehuF1ph6s6x1an3b9Mi5qc=;
        b=jN4sFe7r7xB3TGnZnNBn/W3TwfA6i+aupy7st7GG+YelUML0p/nGLYRfq+8nRTD85h
         9iy2xAWvSzgsX1HRDaZDVeRF3758ofiZETOQZpfOk52RYWn2HOil+JQu6sMP6YUpC27Z
         YQN06RUEJWHlm2idmxPSY4cDaxRNzc+sAiRecga//osNsqn540eWi/gPTXFArTnWIcNU
         3X5/RoKDYOgal8bkaBVwBzP+lhoydTg8ecUG+hQ2OqBvQHMF+LPq9tdqx2Ns7swrHcyX
         rgsttxPq8GqJC52QSrzHQZRC05uAAH9Z5oxYqtwPpQ1Rxayfsafoy3g3Pe/N6H7x+sHo
         IOnA==
X-Gm-Message-State: APuU4Z+nFVH7tdSRhJyCyzXZdZ+yMlq+sgyiGI9nwnMxTtZQe6U5XCIY
	VD0MLuOjmG53N42CZtLmJUCXKFhsYCF5I2A/foLZmT1CYgHENmZyxy1+UeIzURqILQHKbjrR9fE
	0pg2fAQ==
X-Gm-Gg: AYBFou3EmJT8iDk666gHsXJ/cqlynYZPj7gJQNw7oFHqpnJGwq6rO9Rb/FcRGPA+DKt
	klP4lhNrwoEm6YXb413ecrq/5N8QfpU1WznbrQtkfCaIqrX5+2qlKh2en2XXoTapj2QCO1dHV0D
	BW1Doc6iWJWW+Vo9hTPRplkbR8bseeRdN8xaOWL+0k4K4pxIiQpVu1euCRzgGsUGyp7Nv74PBah
	T76tmUokr57K3WUxe+v5ARtWSlEDSBo6h5qu/kf0PxZuLc9EhF8xbAwgPZtia2ObcsH5e7Bakor
	fup82MEMFsi+4/sanKyNVIvuLCydWsx4Z+LUXsWfHoCpupj0UeCREf5udvVTIw2L2cRt8/zlQbT
	hoZFVTOF8/qk3OCMSyYbe87/IW1S3oTKhln429ffgl1DFD2ElB1H/UeniAHeuZB17n/ump7NBzo
	Z2Qv5BB06YcXFJCoNeGCgoisUMes2hE6c8PBh81k2TnozahnIbdRaJx0db+iv07ZIb+9M9HrMDD
	2dVtfqZ6MevG1XC0AkWc2hbWOtjGSdE5haoPzVIDx9SQhLw19H0Qer1z+H0te9qeMvmtLwr5f18
	LGv3epy9mJhDQFXz8Uchi9/vkGBpmlfAmPmU7bndcz8mL4H/a7FgOhDn+orABXx5q6d6Ym5xbJu
	cN7QJAp4jvaAA494YNvgDqQD9CwXEfdee88j/g+51tsc=
X-Received: by 2002:a05:6820:151b:b0:6d8:d121:a970 with SMTP id 006d021491bc7-714f27a0151mr9940118eaf.76.1793827109765;
        Wed, 04 Nov 2026 13:18:29 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:28 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 02/15] srcpos: Allow srcpos_string() to accept NULL
Date: Wed,  4 Nov 2026 14:17:41 -0700
Message-ID: <20261104211807.972610-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104211807.972610-1-sjg@chromium.org>
References: <20261104211807.972610-1-sjg@chromium.org>
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

