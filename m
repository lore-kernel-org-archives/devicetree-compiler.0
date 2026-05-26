Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40FF23C503
	for <devicetree-compiler@vger.kernel.org>; Tue, 26 May 2026 20:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779827426; cv=none; b=kESZO2ygJQfphXf+PF34MIlGVmuF3J7pOLrk/JYnZ37J552e08vkY3JMN7Pyq4HaTD9SJEwKA/7U6KcTdkCiRMQd7CmmBdZut1HItsh3RtJv6qx6o+g9N0mPsl+r8+/11rjRNRtxLUQYPkzb4lASeaHajNexQefFjrw//XrxwQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779827426; c=relaxed/simple;
	bh=GW+09Hkz0LZhI0LhUXYWS7fCKBsEEcj3+3JA9zvmQ3s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DZsqcTxHYw6HbbJd3/t8idpOfKBuOtSNfcE44VBsn0BJ78YEnWDWw9sc6Q5Z/HJQle+v3hwy2jEPoDyqZcXbWvHjyiOYhv1kTGFTM+OtiuAaRNTcSPxqHgN4NT2e9vl8OZDVtL+Nl3nplkNKz3uhskupuW8wPs+P9xEZsuHaQ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=ci7i6hNM; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="ci7i6hNM"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-43b48e67e54so2231477fac.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 26 May 2026 13:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1779827424; x=1780432224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrtRB7fni0xCCsYBKNGKZhwkyDevYSsDO7ynBC8k7ho=;
        b=ci7i6hNMRaW+cQVaT33MyvNFoH1IStgiFfC8yo0JHEwyIM/GBxOZxCwXlLOLe+DhAq
         7X0ZadP6eeF0h7NGvlri1UTF0umvs0QgoQQK1cdgEl7iRsbT/CwTA5JOpy6U6TBOmDtF
         unYUxdizrJvAnVBljOisDbwQK56YltV1Iuor8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779827424; x=1780432224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrtRB7fni0xCCsYBKNGKZhwkyDevYSsDO7ynBC8k7ho=;
        b=RlBdOb5dR6H4WMj5WIVzsGCgGPavbekjU0uvhxCsOTWhdvi57LVoHMYf5OWCz+qDG4
         Pd07jADp4V3A1ZrHoKWuVnacZ3h6V7bAQyd+4ItrU273/ydW/KsnbZXBUYdyGj/HP8Rn
         vNBzgxhin3Po23k6uO5G7QElzwMq6T8vee3u79biU1gSz4Tu8FxZ4iwG1/n5VyzguzC1
         REi8dd3Ge8a4l/nJxKpBFOyQmAtr3kBm/RBIRgeQpJLWqdjheU88Z+OAONZPsqWiyk3x
         twwvrhtpNX5hQCM8q4GE35a8ljX/DQLnk9AkqJHRmJJpQnMzn3Jgcia/zn1/4tp59xXW
         yoBA==
X-Gm-Message-State: AOJu0Yz72qZ2Ptr7sXfuGDq+qCkzcsGwK2JEWxHcguuRO/NtrPlW43cU
	hH0BX1fT6+YENfCwXiB2gg586q1nq5RaJhLQVhhjTuaLXM7vfsB+UwQ17XvJFTzJSLWwXnqYsOA
	IMr9B2qA=
X-Gm-Gg: Acq92OGTQONZCoRslebzBQ8e7qpiUZqxZ7SqU6d69Z0X1jdQxS5wNLqOQn+QjJr8Pf2
	Np9PwxYoGMfsJPBsCNa4OJjEHKx9uzo98ajoPxqPKA+D3JGpr3/wayoCYxBJPvjcI7hjJJl1+M1
	HoWuhjjX/eAVHYwE8gdYP/mRJV8pN2SHrQy6GMMUAmqQKtvvHTa6+1qyF9SPZgnKxPsSYD2CDAq
	VU1J+vwElZtutJzFnmLSVjRK3OhmOg81BcmPdIWdUOKl3mNuNlLxCPDTf3N0uMVj14jMarjaxPB
	lwn0yHwwgQusnpjdsT/W2pCv5dIhJntcEPbfaF6nBFCHptudKhHi2c6T2s4dFy34aaL2nPapj3K
	0O9PU7LvhCSwhtQxg7CgZR287mlEKJbmNwFjDWHuAZqzAtApZ91mkwvKBdy+c4DMApQIbdzTz18
	g8GLDpTnCm3TJnKL0JLpEM6KnFLm9O5pzPidG6eZBBZSjiJxM6sJrXbE5egRINozNfl/bNwlkIT
	cq6CHytIP47FawXJuZQ/wMj2Y6ZZOTmHd6bjxoxjMwYRZLQ8n2pXeahGDtV563wk80N4Q==
X-Received: by 2002:a05:6820:609:b0:69d:b2fd:3cab with SMTP id 006d021491bc7-69db2fd4295mr6060617eaf.4.1779827423844;
        Tue, 26 May 2026 13:30:23 -0700 (PDT)
Received: from bill-the-cat.tailc58245.ts.net (fixed-187-191-8-235.totalplay.net. [187.191.8.235])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d90813a6bsm6579875eaf.0.2026.05.26.13.30.23
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:30:23 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH] libfdt: fdt_check_full: Add can_assume(PERFECT) check
Date: Tue, 26 May 2026 14:30:22 -0600
Message-ID: <20260526203022.4006434-1-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this function from fdt_check.c we have (reasonably and as the name
implies) a number of checks on the DTB. However, there are cases where
we may wish to assume that we have been given a perfect DTB already and
do nothing here. Add a test for can_assume(PERFECT) as the first check
in this function and if true, perform no checks.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Along the lines of the patches I posted back in December, in U-Boot SPL
we just don't have the space for this check much of the time and so have
always omitted it (going back to at least when Simon posted the initial
patch to make libfdt/fdt_check.c here). This is another case where it's
a noticeable size win for us. I had missed this change in particular
because we had in turn missed catching up on fdt_check_full being moved
out of fdt_ro.c and in to fdt_check.c.
---
 libfdt/fdt_check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index cca052353213..2fd5b61d016a 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -21,6 +21,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 	const char *propname;
 	bool expect_end = false;
 
+	if (can_assume(PERFECT))
+		return 0;
 	if (bufsize < FDT_V1_SIZE)
 		return -FDT_ERR_TRUNCATED;
 	if (bufsize < fdt_header_size(fdt))
-- 
2.43.0

