Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793595008;
	b=3jiV/uyCKSK3RSRA/9lFZpbfDkuj8UkFsxDwWg42PgWXPO6P1WOlKku0B6zGLdsq+itm
	 C5lJh3ByDfqXTcnC7EgTg+Ef1jpI/MU6iwPRx4YzOdAeNDOF6XmyG+ubrJUjDXu41zULX
	 gfvron61PQM8aOSdOwZLa/K4qT7cz2ln0QxxHD48EKFXrcNlskquLHvQ0qWiYO/dISj3x
	 bCA3E1tgYR0YB+LkYC+/yCUrgvr286eImbNn67nX7m7IlOOqCVHPhBnj+tV22bzmXBYIC
	 Ug3ibITdXESnv0DFu0gcZD+vNj7f3+xE4LQ2MQ6I6OqO9I9PKQyLN+o66UsBhotGLxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793595008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=taKI7yjkCKkuZ6iSdwS1lJbwQYMW3xMZwh3vOtEMwSU=;
	b=jr2F+aSLIInTm3esvXjzLePp7vNCNeLCVPH1e8fYpbANrVrTm641rAyItIUYKGKM7rF6
	 MGR4ESCMapK1NbrMe2ilvjS8cWKrNkzKZQyhZ4CEiy8j4Mz28Z2B1iDcAvLmYN9NNnFLq
	 UVLDP8mOUhcg8dl1q4YnfOB4kVEm0eJtQ68wXGN16qxZVpknJun3oTDROhT50Ptgkdms5
	 GQubJF6+rl+LvfwQi3bxOfHRcXck8fYwHMj96H5vOLk7vM+WAvN6qX1deVQ3mzPca7iaE
	 GHxVkfOpFICo2Io5pozWumECzAQ50LoO9HlRBunTtcipscMowyDPJEdKPR9S055zmZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d0T+a3Wd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5670606A32C
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 04:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5670606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d0T+a3Wd
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so4438006c88.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 20:50:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793595007; cv=none;
        d=google.com; s=arc-20260327;
        b=Ny9ozxCGHah3X3BrQ65HoThDsj6MhKuPuoAlRIgx0oywbTCRVnPBWuVHQQ+H8l0gje
         whF0xwjOpt11bFjTBcJp/MJH1RjnPV4zP0T7kh3mp+tlNM9Bo33McEOBNotXSHY9l65H
         ohxZTmJr6gAlzxrIMzkkxjFpE8Bkw/UaDQ+qvQXNSVI6TNHDoiOnw5urRyWQs94finA3
         8NtWwsXLsRXW/ze3Ql16RrPsYqLmqtJQd3816Sd+mODzft0Ac89FYjOtoOtbfuaNy9y4
         0tVS1o4qX/kbUCD4JoYLMG3R2Tcoggn8MLA/39aUhfsUt6PKHRaH7qySa7HOYKHHKY2K
         uqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=taKI7yjkCKkuZ6iSdwS1lJbwQYMW3xMZwh3vOtEMwSU=;
        fh=mjWR8OSeWiqsU4LUmPt7qu9PcHXlfIeAMImzQuh8u2s=;
        b=hVekboz2N5f6oEH/fUTtLtsSum6m/iH0+nbT26C7kcZjTlgkao9VxdBptojsMRranc
         dieG9pEOn5Mjl0P/q9gY2zSFvTCF0o97hpE/0YYjXvBYpwFs4Zj61FIOHHY/okHbEEAz
         t0vPzrBN2NcXPa0PBEWOA3lPdXjDRl44IN2JRNuyzseySGCBhv24GXDY+lt7qYCWa+tR
         SMBQP5v1hl+6sU75Rt2wM7qW9oTSQbBMoXx5Dx84YlPJKuN0SpFH40jr0gd2Um6sW0LO
         q5hbKo+R3ri8RtRLD9eG+0ud7gmsTJYBOFJWDBjREVjLIaLlOoyMulJptrq/oSyNGM7w
         RDmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793595007; x=1794199807; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=taKI7yjkCKkuZ6iSdwS1lJbwQYMW3xMZwh3vOtEMwSU=;
        b=d0T+a3WdXU/bhVzWRfLw8aABQE26qFk+wjja2CzrTsQoAXlQFABqIF9TNI+QnH6YB4
         Zp0yU7WMBKBh0dLcWM3GQFNHixZJ7Z2aQxpmu2uVmK/vKnYlwrp4v/IGsdYTaBoF5B2f
         wGFietQDEqMlx1KW+CEWRoGUZncfQKGWAmBEtPUAZSK6HlhTuVwo3OlVuyN6u1p5elna
         gSsWxSeQu2D1bw4InWcmpD9J7x6iyDjo8Z7ixltmOTahpYe6YxpVhWgml9TJGSQy9WnZ
         GuSeur8ukufIgKji7dM6Jr3Fgh1KjbiyMRXsgjTurjlSA0TP14jwaNLpInh8estg0qTi
         LFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793595007; x=1794199807;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=taKI7yjkCKkuZ6iSdwS1lJbwQYMW3xMZwh3vOtEMwSU=;
        b=drD+byOVVG37oojhp0ElUgM8o1+Pfmvb7w91vzngfQCXQM/CQ58QKWZxng6hj3t8Ch
         CV1R6Jr1Er3a3qBm1z410+oS6v8KrIHWKiaQ8tJv1REmjtZjVSv+vtXRwXZjLI85yFU9
         oTMLp9sR6iNTNc+bW/5MjD07J+w7x6QAA20v6lzFDXVqigtrT+LXSCCqgAPgGQdI8fR3
         ZFzO9AkqKipSLGjWWqNwxHOf9okqYg2fWkeV0uXECui/M6QEzMmCkfS/+q04xQbbk2p6
         PUyoS6tOW0g89ey2Xeb71p7+QW4SrEuzCl3QkOhux4l7um0dlfmT7Yws45lYr7QtfM5T
         WZAA==
X-Gm-Message-State: AFq9FYKHibHsPrO1dmfOffUE3nZTvFjFdIw0bLrHw0tbQQmshSn/aa/p
	myp+G0CdcF+3LQufwJPg4TAV2uMvldoTiivHP1+NZTWgSZZazx+IJ4xvtPqZIqrkIF8bDs6YPZE
	JSWVFRhM5HQNOp7xn0D6lHXXe+h0PTpMAyhpbtk9MsuRqsIj8fjf46Pte
X-Gm-Gg: AYBFou07Krr2yV1uydGQBlYQgaDGFRiGIuFQmyb6pzahkT9ovvgdEuS9j8DZl+Ihgus
	h84ikDfhX5WfsaqE+5JsJ23FuqpwPkZ/tkC3/VYYzuw+Bkb/PF2O2c/LB3YtYYfN4+EYXea/JJ4
	GLEhybfGqFy5BU7iqWCGDBVQBzoAJjDRNQGpvmH/yxDcY8ir8ovFZx4FJK1TpcgrdvRcGp5xCDc
	W6tbwBb56Ogu7KyTaRITX8VNdLuTdcx0N36osM9oUinkg+VTbAL9nEiLwM7aYWHHvyPqgA7BGUN
	b1+GsbCwrN2R7J2kcqRq3S2Uet/RWVXpyu93+8vDenB42fpYOtT0TM0w/VEsUGrfPHX6cXr2j6D
	2hqFBd0bvoswgbEGgU7mdlgI4JBAr7v5nUP0yr3X3R0/P8rx3vLvREszB1M3mcN/UpgI=
X-Received: by 2002:a05:701b:2087:10b0:143:7001:7645 with SMTP id
 a92af1059eb24-1ac5d889adcmr14081779c88.47.1793595006104; Sun, 01 Nov 2026
 20:50:06 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 20:50:05 -0800
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 20:50:05 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kelvin Zhang <zhangkelvin@google.com>
Date: Sun, 1 Nov 2026 20:50:05 -0800
X-Gm-Features: AclHuK8e9i1PZDWrFBOeb00D5-aYN-NVY3Mcg2xca4I0AetSQE0MHhmGybV0JiY
Message-ID: <CAOSmRzixCf479QyhmGuwBBZrRLTYqoaSUw88HKZnkPyEh6=gcw@mail.gmail.com>
Subject: [PATCH v2] libfdt: Don't search for the terminator in fdt_get_string()
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Unless FDT_ASSUME_MASK includes ASSUME_VALID_INPUT, fdt_get_string()
finds the end of the string with memchr(), bounded by the end of the
string block, which also checks that the string is terminated. A
string block normally ends with a NUL, and then every string in it is
terminated. When the caller does not ask for the string's length,
check that byte instead, so that fdt_string() doesn't scan the string
at all.

This helps callers that look up many property names. With a 612 KiB
tree on x86-64, built with gcc -O2 and the default FDT_ASSUME_MASK,
calling fdt_string() for the name of each of its 17,899 properties
takes 108 us instead of 160 us, not counting the walk that finds
them. libufdt, which Android bootloaders use to apply overlays, calls
fdt_string() at least once for every property it reads: tens of
thousands of times to apply one overlay to a 445 KiB tree.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Kelvin Zhang <zhangkelvin@google.com>
---
Changes in v2:
- Simplify the fast path to only trigger when !lenp, since strlen()
  has roughly the same cost as memchr() when lenp is non-NULL.
- Add David Gibson's Reviewed-by tag.
- Strip function context from @@ hunk headers to avoid MTA line wraps.
 libfdt/fdt_ro.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index ddfb8b9..fed2f9f 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -80,6 +80,16 @@
 	}

 	s = (const char *)fdt + absoffset;
+
+	/*
+	 * If the range ends with a NUL (always the case for a string block made
+	 * of NUL-terminated strings), the string is terminated within it, so
+	 * there is no need to search for the terminator unless the caller
+	 * wants the length.
+	 */
+	if (!lenp && len && s[len - 1] == '\0')
+		return s;
+
 	n = memchr(s, '\0', len);
 	if (!n) {
 		/* missing terminating NULL */
-- 
2.56.0.385.gac671c819a-goog
