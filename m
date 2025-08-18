Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB462C2372
	for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513359; cv=none; b=CEkCMCJaE2dkXrS1y+VB/HslW9NeDK+e10Zqct9+20UJTPVasY+3lr+h+NwqdAJoSfLf9cjDCdCOgl05w0xMUeqKAjRpFnw36OKM1nGz0CTcTQqLWiMZXyYn/q/juZzuIhV5T+qMGtLERvSPZ2D7Vd3RyGJBU6QoLYyifaiWres=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513359; c=relaxed/simple;
	bh=gTZh8UsBnyIyd2eWPXz6bq2GFETUtBNIaWVLpPQzZGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=op7aIi3esc6r72a04yQsz2WdOYSvUAHQBzvyxHgF3OmUVr6HGJHNOH6lAj1PnRWk2fwDFPe9l1UJn6R1whGtPKk08WLhJnK/+yIpr0Q0+B0ckwsmcctJuJM+0EeExsPsV+8/NA2hllnKY1Br8ANEK9xnYDzFaZGayaJtbLOegss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fpTXXeiy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fpTXXeiy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so20220955e9.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 03:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755513354; x=1756118154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/q+z/k9iHPOJRYyXKfCMw09PmJ1I8pUCzNpxn+sKQ80=;
        b=fpTXXeiyMrErUvBTAELHBjv6cbUFe3rWo8RvBM9JNxrAitRQHC+ozUvY1E/wC2KB6O
         CJTZkNom+1RO9f84hr6SmX+jdAgmACqdKeKwCBULNPGcTOugrDelF1rADf44zwX59Xmp
         5gM4sX9QCjdFTWUOUUjOIL1/FMT4l7AyKW4Xlwa9FdtZp5LbzS9A9na3vE7jh4DPvEX9
         D6LWcH6M1Z//ePCv7jO2zAl29x5f5b4t+yr5j0rDwfMf1WxXGFxqLH955qzn+KD3wzkT
         6TWGoqqQDkfzUahCiOqcWWLRh0ZSaNmtXh4q/lEkYKQHFRU+l+lVULkVRtMu4OLo5RfW
         VsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755513354; x=1756118154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/q+z/k9iHPOJRYyXKfCMw09PmJ1I8pUCzNpxn+sKQ80=;
        b=NHJa1PJrXm5DdDCCJQeXylsbtSfSjn3QQrE7hrWSUuJp169UjAO0wjWGW0825galDW
         5X7TwtdUanP4HSa7XKxNhaGFgXRn0vGl4QGo4mqFSbUbsy89fe0QNe+H90uF8SLutPeG
         QVC+1EKScDxIz9Y7J1449hAFmTRI75SUp7u5wI3iG+nsejh4LfdxlVK+6mtQ6bDn+Jje
         x0LSuLYMzKjGyQqJeUMok0BfxUwVHWilkDujmBn7hl/QuWRiDoTBvGMGIqKaTkRjN3/i
         LR8UiTelxHehyOe/68ljqVXmVvLmqvGbBihYyLusLnZFb104OoKvKLTc5ugJwE8rtRdg
         7TGg==
X-Gm-Message-State: AOJu0Yytown0u7jO43M4gb+P7Oma/mAGdgPeK297RwnKHd1rwEB4mdj9
	1LkFKG0crCWgYyUgG2hf7ilRwTsHbKYAuVYPXNIEEe6JXfAXW0BiQz25UjUTjV58zXMh5kRYhbn
	pwD6e
X-Gm-Gg: ASbGncvWnTZ2wvIl2lkF4TZANe5R/0Z2KNKVm4KOB57B72JDiAy3469hk53Eghm2K5X
	ErNEpAgnhL8ghilJoq2Aga4Lpw6RX+CAz5IKNbi8tGuUrSqOutG11qqs+Fn2J03yNMm1ye+kFnh
	+NVTqbaF35HOdJSJyHS5nsftXso27zEnJ7RT3fc94YRextylEkjYEwaOhPdlWyZXcVTLaM0M/hU
	q5yfgv/ey2WQ0ZAOKIclAxcQTPTSz0odOQ0SMWIZWVj56JyEgMMYj2NrVg9WhjEiY05MPDoo5ck
	VKxKcWc7zlx4YfijZoPn3+/zRpwga3OcU42mZaCNtnHIrMB0wB43zhOuQHL9KQ7y4SSbB5qz7rX
	BqV6asEV2LAF8T+N3l+qbJMyewq1xB68K3rVytTEoEwW7Y2lbgEqBA0k750SPpTwm
X-Google-Smtp-Source: AGHT+IHVID+slwDIlW+6Vsrx7VW27h/M8jITYP31ELRcmuAdT68puOPOFB/lvHlYtCfEW7i5HAkJWw==
X-Received: by 2002:a05:600c:b90:b0:459:eeaf:d6c7 with SMTP id 5b1f17b1804b1-45a218578fbmr83220775e9.26.1755513354361;
        Mon, 18 Aug 2025 03:35:54 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1fe2c019sm148084355e9.17.2025.08.18.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 03:35:53 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v3 0/2] livetree: Add only new data to fixup nodes instead of complete regeneration
Date: Mon, 18 Aug 2025 12:35:44 +0200
Message-ID: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=gTZh8UsBnyIyd2eWPXz6bq2GFETUtBNIaWVLpPQzZGg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoowH/7cqS0W3scLn4unpLgHXzcLvuMpgMrpmRM FGzqe5OuoCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaKMB/wAKCRCPgPtYfRL+ TpB+B/wIYyWq+GDxPn9Bga7+z5d5g9PmnMOkzdhqVsXyUnSB1ATJOuI1VdNJrVS8+SZ9kg3VHPs ermRq4kIp93zn9DZhgyq0/Di36ydQN2jnn2/Hz4a6nQifFMEw305Z/kwfE5qdHchoz9nD3H4s4u W8xzHaErUy6Cz3/uIOaWTC2dzQZo7yJxE3Y6IsC+9mPNSWPOTLGXTc6zw7FsNxbpxuw2F4Iw+05 C/ADFgBjvYTc5OE6OMAWCb3f6mfZmOti7RUTfl+OMiVXsSRWk2kv5bPCZ2uw5YSz+WO8jL3cj+c 5F18iWMTI0TZcp2lSrCCF7AZE4HSqiouedAQe6C50jJLm4GE
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

here comes v3 of my effort to fix the fallout of commit 915daadbb62d
("Start with empty __local_fixups__ and __fixups__ nodes") before trying
to restore phandle information from __fixups__ and __local_fixups__ when
compiling from dtb to dts.

Changes since v2[1]:

 - Don't add data to malformed properties
 - Make check for for property being a string in
   append_unique_str_to_property() more robust.

I didn't add a specific error message pointing out malformed
properties because it's hard to only emit the first problem and also to
only emit each property once. (Well, it's not really hard, but needs
considerable restructuring of the affected functions that makes them
less intuitive.)

Best regards
Uwe

[1] https://lore.kernel.org/devicetree-compiler/cover.1755264521.git.u.kleine-koenig@baylibre.com

Uwe Kleine-König (2):
  livetree: Simplify append_to_property()
  livetree: Add only new data to fixup nodes instead of complete
    regeneration

 livetree.c              | 137 ++++++++++++++++++++++++++++------------
 tests/retain-fixups.dts |  29 +++++++++
 tests/run_tests.sh      |   5 ++
 3 files changed, 131 insertions(+), 40 deletions(-)
 create mode 100644 tests/retain-fixups.dts


base-commit: 84d9dd2fcbc865a35d7f04d9b465b05ef286d281
-- 
2.50.1

