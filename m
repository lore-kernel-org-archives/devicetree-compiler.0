Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266301;
	b=u/Kfs1l9JYDzse4xWeCrx3sixD5b3OUYcJ3kHnGVj+1e2yumDxTUAFDQuhr5YQCTZUeu
	 LZEMqxqhL3h2kXaLZR2CDjME416iUTZZGRzwr51jXDZKTxoBKIftbZgbMMNbZfdc0Pt8w
	 LHSByi92OiUwupkiWnyzYE1zviiY9KUxac0JoP2XOsqT0a0Ra/QdpPFgD5Ra4JKAMFVgk
	 yGRlPlWbxQS4OK4EZv2wB+c+Auzua8nWIblBRerb1MObEuSzkXBM9M1wyZBXVzxnWtb0G
	 tXOx/5lJbiT7iQwLEq4r1OvhRBhhjA6V02q+KNTLXjfTplf+jGnQLttf0YuEbAS1rOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XQ4QkVtkjS5geoY0jSy3Ren87KPiVrKtSgGr+nPE1do=;
	b=Vk3W5OatE7jPA0mtJABP0iWmbe83sEhb6doYXiFLlhr2KAEaTnxXZNQNysq8zp4o3E3H
	 aBSaeHFC2uC6wGOLbcTZURSsgVBoyfqcIgOlrNmjTi7Cj6FCf71RJXHC4sAKDHS2zPxNc
	 9LXlf6oezyl5YtDTXJpcKTNMrBoTS0AktTycPCL+w6tO//7BMewKqs40OnjYVPPUMIpxy
	 tKiUKnAVy6JX66hPSJkPD2040+trQi628LNzZ3DqSVRSPQXelKWazMPQV+M1JmvytWmwW
	 RL17QvbEtyHdAAKje/XO2Mz6FnxVM0bblyrqpDy+kSbGk/lSSTFHjOa0xzkCVKpXZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q6+YSzh9;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EAB606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 09:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q6+YSzh9
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-54cd7de2d42so1235269b6e.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793266300; x=1793871100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQ4QkVtkjS5geoY0jSy3Ren87KPiVrKtSgGr+nPE1do=;
        b=Q6+YSzh9Q+yLztk2hwg3GJtomqZdxq7JxtCNJpIriZSxrTE8bkEGLBm7JzNRuLuLfT
         UkcTw8Zf0Lr0K9IKbFdjVf0k96R24aNx12CIlrxraod+xIS3AncBV8+BrOxg6W/87qBV
         Q5pvN+EC+tBLvjX7x8bB+PkFSpRLMnyZSvS40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266300; x=1793871100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XQ4QkVtkjS5geoY0jSy3Ren87KPiVrKtSgGr+nPE1do=;
        b=Di1xaTia+RM2bjE2SQBHJuedgzO6oTsKOUcsaDJdy1FiheQ+bB5VRgEKb5ABqfAOG8
         FpUnMC3N22grmY4c56W32LIdherF595PNe89KLeLofgRX3H2szvKjoVw5GomtOJ2WCHm
         lJonfd/59LsXDQ98XoWhLT0agPJWGHHCtXvRbQCB/KxGQfSfmODsvQEJDF0ef/sdLceR
         l8PZ10WP3/7NJXoVHDtnZyGptQXz5rpVDegLgXv/OBGqhOMmot1ZfF9qe95eqRAQveZO
         LIzRm+V7Z+O+taXRV0goD6SU6LqDXixbO2m67S9dde8t+RXJnCFeiQyeEJ4vfRZcNrZb
         WqZA==
X-Gm-Message-State: AFq9FYIZHPnO1BReSAS7KaE5d4lXTT5o97HxsFHGRiy94M5Mprvo2is+
	6TQSlhMU8spWAQUFDI1BAb2JewVqX39MZUSiypzgoo7yGRi24IMf8bArZ0OFctPK5cX/kbVaI8j
	zIgUysQ==
X-Gm-Gg: AYBFou2wJJgMVffez+hmQsrVeHUrBEflduepSKEFTC5rWQp0e7VVhif/J6w/Vq3u2qb
	9GxSIj/nbIVIXa8Z/kTnZQVjsG36YYIBS8JG6051FGJM9CHRw7tZqf5qQlxkFRB6JtYkJVkiJjN
	i2AcQLyc+6Th3bAOfOdhTHS+Q+ieL+1x80tK6bcCelIa9mVGrMhhJNnttNnadIAsvqHEax3pT4x
	xbbIrzOzr2Gq4SXLaqobjLOBC53q7WrVc8dIulbq3MEjzAUG11PJdIQAC/L7x+LlQiFkjHZkqhF
	a4Y+cSqm6+6RX/AjIkn9Ummv69VoR/7kyRH8jKVzvZsdSXRFkl2prubLy/jd2Mar3LUaPGFrS1l
	JkdwlgwgEwJD19fK/0oPagatgOo2k6gz4DhtOuTK9bOOaT/T8tOdtPopt4FoBM8EaJzdgWzVQVK
	sUdOmTpMq31+x/j2W53JwC3D1LwXHDeJ12N8oJT1Rr+Qyo/1hbom5aAknpylr8uHLWjFeEAUVDx
	NI5urYdW/hPG+wB+D6rkd2GNNRSfp4vmgdt1JI+m7o3pvhYDmS8bXos+cawF+YxZzlDDU8pDt5u
	PwxMEa2dhwOHELNqUji/A6GHPpmPBd+i128//T772pBU9Yn7VOL50jmFnRjzVb+xGxmuslFbJov
	+AF/R6pSQLtCn21uMVE6gEg==
X-Received: by 2002:a05:6808:4fd3:b0:4e7:8f9b:1191 with SMTP id 5614622812f47-5638479225emr3122648b6e.52.1793266299986;
        Thu, 29 Oct 2026 02:31:39 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a50281sm3715213b6e.7.2026.10.29.02.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:31:39 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 2/4] tests: Drop dtc-fatal.sh
Date: Thu, 29 Oct 2026 03:30:55 -0600
Message-ID: <20261029093115.3647778-3-sjg@chromium.org>
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

Nothing uses dtc-fatal.sh now that the tests which expect dtc to fail
use run_wrap_error_msg_test() to check its message.

Remove it.

Suggested-by: Herve Codina <herve.codina@bootlin.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Add new patch to drop dtc-fatal.sh

 tests/dtc-fatal.sh | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100755 tests/dtc-fatal.sh

diff --git a/tests/dtc-fatal.sh b/tests/dtc-fatal.sh
deleted file mode 100755
index 08a4d29..0000000
--- a/tests/dtc-fatal.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#! /bin/sh
-
-SRCDIR=`dirname "$0"`
-. "$SRCDIR/testutils.sh"
-
-verbose_run $VALGRIND "$DTC" -o/dev/null "$@"
-ret="$?"
-
-if [ "$ret" -gt 127 ]; then
-    FAIL "dtc killed by signal (ret=$ret)"
-elif [ "$ret" != "1" ]; then
-    FAIL "dtc returned incorrect status $ret instead of 1"
-fi
-
-PASS
-- 
2.43.0

