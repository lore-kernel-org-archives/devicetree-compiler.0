Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC34D2ECD15
	for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274197; cv=none; b=J+YvbZYQLIM7xMkgZYmtDCjz83mwtN1qUFq2syp2ZwMMrAMS8Pcd5hkG7hvn7etgbhp3ezqBQopSORvVZUiggA60GqVyyvLRVt9acD9k3She5mPyKeW8EomVNRcwnpmUG/PwaMuIfXyja21+JcnB44TkaA7f0WS/2Txs72bAA/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274197; c=relaxed/simple;
	bh=tPVyz6dNrUxLLOiH91r8h0+qyCxhJAgTofBux/yQog4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hzDTWWsgyL2Vv9JhfOgWwWXfD6JBvXLspdTpaOyEp9dR9lJDU8T2OH4+cFIYmZUQGOKXEVvqUPei8SdHkHFAaQABg1vCcVAgjTmFh0hJxvPrNKLwBwJbyB9cCiWIkMxSyujiEVDAMzUHZCOnfcZtbHkS6PS32AnvRR7MipSJg5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yYFaKPUe; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yYFaKPUe"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fc2d92d34so996004a12.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 19 Sep 2025 02:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758274192; x=1758878992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vuziqtw9PLqF6LQl9hfypP5pycsFxnGuVDJn50ooMmw=;
        b=yYFaKPUeJTHvVbVXZhBeNm0oe5sZQkSxUEkN1W8HEaRqG1xcGE96o+ubg3dxpcO8aR
         YA37ihhqL7IGi2KK4KRYkhcOJE2DJFMwJUcBWKf5oX8h80qxKj/2m+OrTtCBsNOazo1a
         V3rSIu6Zw4Hmd6TXfOT/f0JsrV78xx1teBQTpGIWbP/aZjWaMVUh9bPds3awNJXEVPbO
         7dP0LnvMXMgzhjR7Kz8LFEoMCfnq5mOxAbvVaWJ/OYRrTbhnvHdhPp2yYvn9IZbOYpHf
         VvVaU2aPy/Y4PMJC+Fwib1firtj2gN1L6ubu9lA43755Hvka5crVxlRzxtPkdcp5Oyjh
         4mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274192; x=1758878992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vuziqtw9PLqF6LQl9hfypP5pycsFxnGuVDJn50ooMmw=;
        b=OyukCWScZYqbDHJf9XLESvMiDUoqbJlW5IWcFnO0UBfNZXctv56vaK/WX+OJNJgHM3
         npq8wHw1xs7W09JR8xb4W3GkLO4pQSR+rYpphqjsfi0RTcDBeJU0j4eIREOonI12H6mf
         m+NMkD0JB8NWANU8g65CZ/bI4gUEzG4Teu60SXwVNW3lCOo6+7uzGeOxYIpwxp83WG6G
         EKTplZ0pc7iLNq/goz6fcqDfFgiraQ+Xw6L1o/hjVeioa36qRagv6GbRHvkfckq2xCnl
         pHnq7goGs3iNl/kPNxUDq7AvIBQt3WHd4YAItRt+9711AWs/sE55j78Z568Id9MXSV1C
         AUgQ==
X-Gm-Message-State: AOJu0Yyqt06OWMpDU1IlaKdETY8AGC/TDtZ4ane4lK5KEVXvb+iI+FMx
	SttOaWkEQxj9ylBHy7KWk/YrQ2/ptUwfrhLul9PmwYQi11EKx313WUrtR3DtrVGjHTGZEt/u/sf
	q9zq7
X-Gm-Gg: ASbGncuR2Q6RRTFRbl5ZZABW4hR7q7AO+pS6FhqLjt9jZrgGP6jWqunn/hz1jEB6ONg
	fYeAsIXoXkVoSn8hE18feqfZDC4jXJIc+W/pn/SZpsKh+0qqOgjX4Oh5IpTpWLecJ0N2MNmyG0T
	OzoCrsRzr6bCtY9770UJfo7uFjfPNF6Ohj/YhWlM8ugSnfvrqQiJ46sYA8zXXMehE6TSZfW6d3c
	mEP2xL1wI1SAgo4mcGy34SskB4i3NRQ/veCGCHraAw46i3fOPMfmiT3tsOdTywPLLXs/KailFUI
	W/ENCnl0uuxFRT00MeDQm8bvJ0SN3Ao3uVq7i5YXCYgbWpvcMllHShwe+O+nCyV2+Kz4uWERn6t
	WDwpTD9m6EmdSHqODU+VtFzOuf9W67lhg9BhoL/VBwEw8qouswG5aQJ5AmkJ73t6u
X-Google-Smtp-Source: AGHT+IE+X4oy/YLUboQu7aBZknTL39LECIF9LFpoG2mWqL/MyC0UM4J33CbBsEZdHZYvFw8Wdojq0Q==
X-Received: by 2002:a05:6402:1e93:b0:62f:2625:6f99 with SMTP id 4fb4d7f45d1cf-62fc0abf7dcmr2020979a12.28.1758274191697;
        Fri, 19 Sep 2025 02:29:51 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62fa5d4357esm3087880a12.23.2025.09.19.02.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:29:51 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 0/6] Restore phandles from binary representations
Date: Fri, 19 Sep 2025 11:29:13 +0200
Message-ID: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=tPVyz6dNrUxLLOiH91r8h0+qyCxhJAgTofBux/yQog4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBozSJo5IwkAPrq2bY4Vhikz4r9LdrDnCPUfwqzL MMIZvuWrfGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaM0iaAAKCRCPgPtYfRL+ TikVB/4oMuab1dvX68dgmJmjKH3uxTgcvj0jEBSXAfpQPNfMMYpfvPcCWSbqYvSEs5dhbmco7Py BoiP34r8kulafxtcG4V29c0OypZ9cr78TT5ZjMLQCbgzTRFPfdtguby+Ji9RC8IZA+2VK5paHLt TMkLBe4vQz1tIQFcvW4XC2lkusra6X9ulTVY04RBeuO1M7ZQn/HbUKI/DuiUJ/CKSvwldeF8QOl 9b6YRM+gq6UpBmoZK0vaV8uL1bIAeYpPhXImz/Q6U+dFLghkTKnmE8IizUrYbtJYB+3E8fqrWiv hunRJ9gEj+GAVwbMZFaaVE5Yq92FiuROkdSDPMDVwre4DQHF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the motivation is to improve the result when compiling from dtb to dts.
By restoring the labels and phandles the noise in the output of dtdiff
is considerably reduced in many cases.

This is v2 of the series. (Implicit) v1 can be found at
https://lore.kernel.org/devicetree-compiler/cover.1755692822.git.u.kleine-koenig@baylibre.com
. The only change is an added return statement in an error case that i
missed to add. Thanks to David who spotted that.

Note that this series supersedes https://github.com/dgibson/dtc/pull/151
which can be closed once this series is in.

Best regards
Uwe

Uwe Kleine-König (6):
  Emit /plugin/ when compiling to .dts with DTSF_PLUGIN set
  Set DTSF_PLUGIN if needed when compiling from dtb
  Improve type guessing when compiling to dts format
  Restore labels from __symbols__ node
  Restore phandle references from __local_fixups__ node
  Restore phandle references from __fixups__ node

 dtc.c        |   5 ++
 dtc.h        |   6 ++
 flattree.c   |   6 +-
 livetree.c   | 174 +++++++++++++++++++++++++++++++++++++++++++++++++++
 treesource.c | 114 ++++++++++++++++++++++++---------
 5 files changed, 273 insertions(+), 32 deletions(-)


base-commit: 9197f1ccd95c9475006677aa97bf39727c1e8aa5
-- 
2.51.0

