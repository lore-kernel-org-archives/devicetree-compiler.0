Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793586655;
	b=0A8h6I80vJBXhYKRREsf9A6p26ObWbManJ7gitxJeaXcwsqVEBNybVURpE//yAQLPac3
	 zHS4ujKbnBpceKloE1rQGQ7HR6QyqLv7UGB6vkqjsfL6A3Q/cvbOVG3/wRB0FsrtuPjc+
	 RdJiMhe01k5YZ/6twkMnms6Pt9eBgQxy0c+V4t5Lo9XTFIUcGUGb/lfS+oS7O+PRhTM9o
	 tmRTPIR/httZltWJ4eAkNhp0A/vPV352T/h/IEKVWnl4YXlvVNCMt0WuJ3oSsoA0vRxph
	 NfUOCj/oGwQRSxIGzCCbXbhSA8KPUt5robHt6BqE4Yxo9AljiA9b8JBB4Fb3ZPYCpLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=z7mNryIbzZ165YPx3fOD/oUMjlLaAKQbdhtaFHOU09o=;
	b=0X4LOvj3pZWA1Ni1HKOj6HX93jClIhtGMi00Qn+pgt4V7EUBPrzMsbwJnrcTyJCh+b6P
	 WBTCIwRBZAnRSMJ8f3bLxq1MiGnXM8wmlr/uCaKh02AqH+bh/4dwkl1wvi0+xWiOJEk7r
	 2LjQmFqr5IBrfvlqwwdpitkSWD+f3MF5A7ye1plx86M/wmn6tyL8bY+OKlcrOjX1iPvTM
	 jG0jkHJNULr+Z8aXeMMptUjfGwWxduCQBxhmw9+d+WnXWr+DQVs/c+1wwNdTa5csTvYv+
	 7sTVBU50dAofLpja3ml+SRNd5PDNJcOwu+gsf3Cy3sBjipx0DrND5QMvzhGc5oZYBxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gFLkJXR+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F2B606A327
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 02:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F2B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gFLkJXR+
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so4748184eec.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 18:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793586654; cv=none;
        d=google.com; s=arc-20260327;
        b=RW1LB0WdpZmZbz5QUCCP9NiZN8VVquBLECCPV44rwLiSTI6NNfUCDcQ8jk79B7emdZ
         NQn7T+EHvHntEVUkfomiC10WuosuWNkSgg8G5IeV50+83RU047v+oGQS9Oaa7DhfxFNN
         LbGkdT1FXTHlhAeGitgcCcUTd4Q1Hxbk/NetlS498XnNYyztvN6fbNRTje0t0TRHHlzO
         NWHycq7QMv/eSt4DaA1uRgH8s/XsgWiq6T4K5q2sVNmcs6shreuxSwOPOaR2bmuigZVQ
         tGPuz3p8ZBB5ATFRCB311AMyLBvMkS9vS/3PE3t3y6XiE7lvUI0PRbKZvTxSTy9OCpDq
         moBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=z7mNryIbzZ165YPx3fOD/oUMjlLaAKQbdhtaFHOU09o=;
        fh=mjWR8OSeWiqsU4LUmPt7qu9PcHXlfIeAMImzQuh8u2s=;
        b=NT0/+xT0b2s5ROWDgrgaM1E6dOYKONcLsjL8qSsm8iNKMVhiRFQvAYU+OlWxk9oblB
         OfoglmUCaFOwvJtnzvGA0BhNe2mBgt3d+jXSbwC6peqC0umO5NX9sWtHjAm7RUHSmki3
         n7f1JW9S/a/byItvSkvsgT1095ML214ie/VHRkJ2v99FVPzdfnqV/1iPLNQsvWCOyDRm
         JmwQDAefIdEgefNyrOq4mrlbb2icAlkT/YcmOJdB+ZxQx86I4hZomb++whtel8D6UAbz
         25UiB/m0HxDGn5rq9g8X+SgNe4afbJy4hq3/JTk21xfR9JB3ArTvzosc3mt0GKCO8cvV
         nWPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793586654; x=1794191454; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7mNryIbzZ165YPx3fOD/oUMjlLaAKQbdhtaFHOU09o=;
        b=gFLkJXR+wWRVCozrhm2aLq3Ij/3lUf5UnnyE6upjN01pHbfC532aWX7beyB2suBURE
         bEFC2RfGQxttULvgNP7EzA0QtqdV36yUpyM0tiH5NPvLwW0GMykmTpH36Jk+Y0uIWKv1
         fE49T7EWY+Dt8SdlCLmucMI4w8LSNADjd8GBFJSqQxrMINzeBoH3yqf1vouQeDhKXBL+
         vVO4l0jd2T+A0mkpmS55s2FazoA4ELoaj9WXVvBQne0azxWaI2+MM6awdHq2472ppwcX
         3U3x/F/1SLx3cNLqJ4oGs40R9qWzIcb+nEbWs8T+ZjAGP+ERdLf+GyWRrlsD8wJg3HBz
         12nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586654; x=1794191454;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z7mNryIbzZ165YPx3fOD/oUMjlLaAKQbdhtaFHOU09o=;
        b=ciMlPz9jse2UTttJ+Lp1ZZqx6e1BYt1TMUZdfG/HMZl/M0aELnOBh9PnsqFCKSgdQ9
         kRVfJsZLjddvA1q9PGbhZ1X4GrFm01dtKLNELOcGssDxNjSVSclU+lpgaO/AlsA73anw
         Vh/pe7TnunFUObeLUJgIE6UfBKWpHmYOUPXzT9ep9LqbPkC3jav+JOggXZLmruVlj5jI
         pqltN98laHaRQ45Tk8bB3+5bh7s7oW7VR+9VsVm2Gf/9W7bO1No0KW6zlUwhVCytCGVr
         fMW8qVFRGQD9ZatD2ralQnZOiv2XlvQ2+OEJyHSakRRfD5Ap3QPMk4LXdnP9x42Kpmsm
         zkuA==
X-Gm-Message-State: AFq9FYLCYTBoNt2TGMoEVY/kcunE+rV8KoTjaN9O8I0mA1iJOaxqcKBE
	pvPrgy7F9IEgmYov9xmzEe9GWPhM9Nz/c/YjEIjnoXzP0x1g+5HaOU97cRKUIQn+azM7WYCZLmE
	FegiXCKRA5Ik+k8AvsEXgsW4wE6NeWwnk0g1jWEgVa8sYffVXtFOEnBRt
X-Gm-Gg: AYBFou0HHeufByerNgeS6AyRkjh0s5Auoe5qhIZctO6BmIO+m0rCPm1eCKkdx7Hns9m
	oZ3/vXl8+fSnRhNXWF6SNqwBi2dHhgv+grNdV34B3Av8ttrVKUDrdk6bi3JOqEbKdFn11yQnhUZ
	PrG1+kq3PtgNtPL/TFv+axtim5n56Wv4FwFY08XegSpBHiMOewPcmQlgiYrHVfjExb0IFEE5ThP
	bm7u5UDkV8GcQ96NV1aEYxmV88j+PEMjIcxaKJvJ5EO5nbUH/TNyCRPb0uZBozadBwR+/z5sUne
	XViYzk9RhzC0KkN7gaMYMFH2G3RsIvF+s0l4jKrbGmUlhQP1sVWKs7UBXk5NqTy9EDum44qFGMc
	trMLKRhZDV6mkFINjzjQHZ/aYUl3lukYGQ2kwP9RaLnO3smBYSnfzwJO+08ooKw6qbK0=
X-Received: by 2002:a05:701b:420e:10b0:14c:1f57:3e86 with SMTP id
 a92af1059eb24-1ac5e6f5fbemr13464327c88.47.1793586652982; Sun, 01 Nov 2026
 18:30:52 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 18:30:52 -0800
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 18:30:52 -0800
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
Date: Sun, 1 Nov 2026 18:30:52 -0800
X-Gm-Features: AclHuK_RwpTpgYOBrTo6Yzcsbhal4m2JKVCq7f1fz6biNN_E2fk87PdqBlNU1ZY
Message-ID: <CAOSmRziU2Nw2kMVN9VCseiwcuCa0SxBe=d+33=nVnCZxFXkKnw@mail.gmail.com>
Subject: [PATCH] libfdt: Don't search for the terminator in fdt_get_string()
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Unless FDT_ASSUME_MASK includes ASSUME_VALID_INPUT, fdt_get_string()
finds the end of the string with memchr(), bounded by the end of the
string block, which also checks that the string is terminated. A
string block normally ends with a NUL, and then every string in it is
terminated. Check that byte instead, so that fdt_string() doesn't
scan the string at all, and only compute the length when the caller
asks for it.

This helps callers that look up many property names. With a 612 KiB
tree on x86-64, built with gcc -O2 and the default FDT_ASSUME_MASK,
calling fdt_string() for the name of each of its 17,899 properties
takes 108 us instead of 160 us, not counting the walk that finds
them. libufdt, which Android bootloaders use to apply overlays, calls
fdt_string() at least once for every property it reads: tens of
thousands of times to apply one overlay to a 445 KiB tree.

Signed-off-by: Kelvin Zhang <zhangkelvin@google.com>
---
 libfdt/fdt_ro.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index ddfb8b9..44f3c7f 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -80,6 +80,18 @@ const char *fdt_get_string(const void *fdt, int
stroffset, int *lenp)
 	}

 	s = (const char *)fdt + absoffset;
+
+	/*
+	 * If the range ends with a NUL (always the case for a string block made
+	 * of NUL-terminated strings), the string is terminated within it, so
+	 * there is no need to search for the terminator.
+	 */
+	if (len && s[len - 1] == '\0') {
+		if (lenp)
+			*lenp = strlen(s);
+		return s;
+	}
+
 	n = memchr(s, '\0', len);
 	if (!n) {
 		/* missing terminating NULL */
-- 
2.56.0.385.gac671c819a-goog
