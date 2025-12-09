Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DEC25291B
	for <devicetree-compiler@vger.kernel.org>; Wed, 10 Dec 2025 02:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765333212; cv=none; b=GZIlekeuXzbRwxTxajYBTE8PEMGZhKTO6qvv4HKzujRnsnKtkP5At5VxxCj/4APDGHfUE1RXCjnC7oWQdzAMWlzY+NLZApZRv/Z9wtgETDX0UztbuXQGNVacpGh35KEBCrV6sOGs0FXsh8g9daOX5jyxCepdi8gfj8mm324TPT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765333212; c=relaxed/simple;
	bh=P4euxHjrK2pb+p92pt4gYLgrogZvT8cPD8AECU1f2JM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7YH8oAMeNSuQF4WKfPLL8vy+5R+AYVx+lnfnLbtMtZlEQiMG8QX/y9AUBNrIyTknblzOvj8BZZzQ9Y1TXhM6B66PJ5/DW5RjHfuxLL5YUpSdigLVADGqZt6RtUwoCvSvtxmV7FV3mvUEjU9FDWY0LzihMnHINCKqpmUgu0qG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=G9hr7OHW; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="G9hr7OHW"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-45085a4ab72so3373482b6e.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 09 Dec 2025 18:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1765333210; x=1765938010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTymEd18S12DePwZzK966Wihk4IL4eFiFvjry6kCezM=;
        b=G9hr7OHWMv5dgEgv57uSMx/XoDLm1LSRlB0PZhVS3LvUSzupri66sgGSrBSDYeJBLr
         x9aWNAHwUmtv8VTPX6ce2j1X3lf9J+h4pt9/AjxPcv+J3bDUiKL2UmExkOY0Fi0kOK43
         wWp+Y3kgbVmSW3V6G4PshcIQ5wp/A9CA2AcWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765333210; x=1765938010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTymEd18S12DePwZzK966Wihk4IL4eFiFvjry6kCezM=;
        b=X0zUbdW1PBtuHPNvfn2eWAt1xbKKwfly1mEO9SpUjqB+cHAFXHLFb96iX7by3LkbAb
         80rVNrePu5y+5mHU1HwKP+3ytxyOZeaxDTDk3rTOfNwhYnCuqdB10kZvB0EtcwVdR2Ku
         n9t0ktbkS7E6vVlB3En2WgnWo6aL3G5dBEOB45ReDhnGegRH3StIn9ahP2MQuUCjHgI8
         788jYNutiwYB/mKrHE7bzGjgRyxDh+W43qN8ghB1TDWHdBWPomnl34md1RuH+Y5D6eAK
         2EB5fgdZUqji0GAWULmIh5RB0BpH4ZSv5J+iOfLGvNRzLCjTWecYXQkfntVMFi8ua+Xe
         Bguw==
X-Gm-Message-State: AOJu0Yz4bsioeRavHBDGOFzBbC0hDKI2trNX5Ck33CWkMZG6Zoq0jWRV
	7JOt5RNdoYWlhek7EhphPY/x1wPdE9wZc9G8TL/MdjxCrcfSBja63Sxm+HTnB9AWLhidD4HEDZF
	U7mX4lqM=
X-Gm-Gg: ASbGncuDxvTj+NQob0XIdZnPG5H/9W8W2A4+5yuZFCbpArxr5KBCT8hceUd1rckIYB3
	Si6HAe+y7DYJEG56cK0e56y9w5xLS35WxpcQS1ACq/fC5uUtMggbdBPeP/gJtH66c0+7afcta0k
	+kdPkQvJN8WouGon+e8azdFkI297YiJoQbheIOTJUrXAsztfH4OITngi8EIMHc0Z/bnh78wOxH6
	pkS0cYG9iojhql3Va9Htdy/CCxDozMap+X0+RjaZe23Wj7chnxgHUtYqzJsg/dTBLOup70rpTqO
	Mol5Hou939rO5OotuRx3jHUARIWDvzolLgiJ55/k5OsPsR5xx59z85BvKqjdMc5Sj9dlkNvH+Wx
	Ydwdzr26whUIexn73ZCGzvhLyv91Q1MjAq9YWIrpixOpe7oGqrR5zck6d/Zi9La8t2+mHoDlhxz
	etztSoHufsOOJ38U+nrwjm8P6onb18KBsI5pBdNKAyvQNwZ+o/ctfi
X-Google-Smtp-Source: AGHT+IGgb3Znf1CaSWCmawlx0B75kdxTRmCTBhbf3DY1WtqQizVHIJKIHZAXIaCabKA+lTrMtRmlGA==
X-Received: by 2002:a05:6808:1596:b0:450:4782:2b15 with SMTP id 5614622812f47-455865cec19mr753334b6e.22.1765333209828;
        Tue, 09 Dec 2025 18:20:09 -0800 (PST)
Received: from bill-the-cat.. (fixed-189-203-103-235.totalplay.net. [189.203.103.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45587ae2dbcsm386346b6e.13.2025.12.09.18.20.08
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 18:20:09 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 1/3] libfdt: libfdt_internal.h correct final comment in ASSUME block
Date: Tue,  9 Dec 2025 15:50:51 -0600
Message-ID: <20251210022002.3004223-2-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210022002.3004223-1-trini@konsulko.com>
References: <20251210022002.3004223-1-trini@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value "ASSUME_SANE" was never used in the project here, only
ASSUME_PERFECT was used. Update the comment to reflect the correct name.

Fixes: 464962489dcc ("Add a way to control the level of checks in the code")
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 libfdt/libfdt_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index b60b5456f596..9eb32394eb79 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -92,7 +92,7 @@ static inline uint64_t fdt64_ld_(const fdt64_t *p)
  * signature or hash check before using libfdt.
  *
  * For situations where security is not a concern it may be safe to enable
- * ASSUME_SANE.
+ * ASSUME_PERFECT.
  */
 enum {
 	/*
-- 
2.43.0

