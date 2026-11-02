Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793595007;
	b=hEEhpCcIaby6Pc72HHCw2rkbKlkWNMnJjo+/DDP++OcP5yVgmR7tdJli2bzjhH9OdFdv
	 ChAAkQnN9x+s1BMos8NY9nzAoXYE6aYtV84qWryKhG64keqlL9uRW/tdPYHRmIlNxfmvW
	 ERHhRfs4R2oc12e5uUq7g6pYyD8SqgbOAe66dkhClXfA/EAMkLfYyhQrY7UOaNLYRIV+G
	 L5ewf1rU7IJ+EoLOX0q8hqmUvf9EkhheB2WKtt9eOQHG8bdE9jvYoO55IEXPJ317nWgwH
	 xjM6JFzwoI1sXkgMVqRqi8O8zQ8CIe/5Ps/CEekLX4qDDkG4dhsrs1aOre4RfjuBN+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793595007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=0LEC/WJnHJc6x78LOcGUb3kzoGn0IzwPh3fktJrh5QY=;
	b=C6wZgDOqvXw9Izuv0NkhGUJW8q4LSfA5AiOeY0IZjwDF9NNtjOLgoE6itfsAKqNovk+4
	 3i2tWHF8QWF548PUPVeY3HLFNnxRuHPlBf5JIYSMp6e/vBvT+Bb9WqTXTrOt4bmw/rQrS
	 YJ6QARD+BdrR+hO+P5Y71hwNOapANlJKF95PuKavMkzp3iccPaKa7cDXDvqReyUPFt39P
	 S23GeQ3Dw2oKWkdGNcAAWPwsXmwnaa5mmMSPwg2ktYuoyfSAJNZz33kAcvqkNrjQSEKqr
	 X2utPN92Qy7W/AHtwhF47iS/ZORjzfBjQdSzKtN7IbP+U718obfOhLwDqDLD7Q4zHiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cq0lonqI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5149F606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 04:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5149F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cq0lonqI
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so2277561c88.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 20:50:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793595006; cv=none;
        d=google.com; s=arc-20260327;
        b=k/B8WCnSXhsZOErTdMZ+skS5iAMBqnhOsxBw7//DMGzG7h0OjiwDjhrM+bawITfiXz
         VnroK1EWvwFi8YjFJ/l0xgnExHncKTGO4VhVs0LGfhkUpK4NULJ5yGL0qhZYVPkgJmkB
         34gI21IJUB/IH6+usnC79/+tTTd7ic522fG57qWA5M2OC8T3GqVJi7KAo7n2Sllc2jVm
         kj4QTkOoXmaITEu6B5EU4IRvzyEVjuZgTJHTbq68jRv5sKMEHvwjwpCI7x5eGKYpvItC
         DvnRxYOBqEU/OM8W2XzPb8Rxxe8CxNcAInuBxA6AI/UH+wiOR6aX5Gb+P9QECj/nW9Nf
         xxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0LEC/WJnHJc6x78LOcGUb3kzoGn0IzwPh3fktJrh5QY=;
        fh=mjWR8OSeWiqsU4LUmPt7qu9PcHXlfIeAMImzQuh8u2s=;
        b=ezkAH2Cd/GzgjBlkDYsDk9rm+Zx5IS3FcIjPVjku13+Bq/RvB2SZwtLX8Fp7CFSCjV
         zAlZqMOE9/5zzZC/DDlf1Z9E/4SmmMGdg1C6mtAOKAFF6VURqSupUhNn9oiEQrV/+oFG
         H+F/DmVWhgwQQUr8JYdd+NicoTM4xEtQ+M6lK8h9j6lWk9WZrYa3YMTR5uWnI80/0O2x
         vVkeG9Ltuzv04plFplg9Dh3bnVwRsoXE8+ZaU8WyBdhyLEtyH+Tk/81jxkXreamFRTwc
         CdeF90Hk4BYJ6bu13+7biJklfjl1YhAdDa0T0jjQySpFyR6tEcVxj7+7zmSXz0l8KdpC
         dqtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793595006; x=1794199806; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LEC/WJnHJc6x78LOcGUb3kzoGn0IzwPh3fktJrh5QY=;
        b=cq0lonqIdM2t4TJT9HbRe1aR6K3Mdd0nCYcedw5I2FMl6IijkSWmfQ2ChabPu89exF
         PkPcCb1LXrtueC1uVMZ49hhDHL4UCmIEYsyprtEpNsl2tazkfSjAr6EXXl3s/UR5UF92
         wxoXgasd7X58hSJ3LkpjJATrsu8dC3EAEMrZwiTcjccA5ixBQ8LIHHCmJuCn1tDx+9kV
         2bHhnYMvPSIGxBFZbn8u0kwqwT7G+Npr5/JyEOYomEGkadMKDWWKn7dccOWwnX5TjVcF
         Y9lO3YLH1zpaDfq46zkKd024mYFk9xeUwrYzhkyOOfRoBn2wwSYOY8ZaF5mht+lkxjwW
         1foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793595006; x=1794199806;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0LEC/WJnHJc6x78LOcGUb3kzoGn0IzwPh3fktJrh5QY=;
        b=QhMWaV/XIih3mapkrQfc9vUtSklH2JGPMXCEMl0Nicjy3k+Ddxlgc2mq/ME7yM7H8A
         NXS0IYqZrtpwx7sJnuhCm44CT4ZjzOSdFeXrDLDAalnltnXL3goQDxXq82btyEbQ44t5
         gYeW4T9F+Vf3bP53S6/MWpt7eftK+PcIRNUYGe5c+SGbbvC+eUNjS0KGOHDmFHlwErQW
         hTUd0trsQh2qXQKzMyby977FWKfvAoNLHibVouHMcVMyB1jRkeD8y49Hit5Wf2uHTFM6
         imZWCE3a09ICehWiw7/0aze40jHu+LE6r52Hi1W4wtfk5f4Bkfb4VzvL1Q9IeV1nssk2
         zzzg==
X-Gm-Message-State: AFq9FYIxsj0f1cxFApyz/Un+5h3yLDU/Qeiydo0AS9IF4auNj3d1ne8h
	Zv+0INJ1/ykE0pL1ufzy/E3ieelLUMGBDfcW5evmwSkxOzJtbRgZMqD6TeIUEFG5xt+nl23ZW48
	Bf/dgmBRzYwcdJ7O6+djRsQszKBr1UOIFIdxMd3kKgBtF1+VruyBnBO7j
X-Gm-Gg: AYBFou1vdwXRHKmaOoy8VNXE7uqBWO6awGSIUfWGcz1Co15pCRYFYFJj0RiTMg/4tAB
	sYqN4D+OcK1iGtP5xFcxPlFmb36wd8Kwn4SDRrQJ726VTwiUBziKW3uqluWK0F44ODyxgSsLcur
	tmrczWFcPBPYPvVq/KOuBF1Y8eX77TwotgY4ncBaAjCVl5fMO4DctKPvEfxfS0Ab8yqioxtMAjK
	huKb50TJNVQeoLOox4GneM55kB1+sFGB9nsJjRydlMsM+pieSlFJQnxNA8W0M43/xnShRx/UG+9
	7GIRg+ze+9XA6OCho2BsXDG49SVFOxSB9Rk6Rm2xWJKCDU/WyRU3vZC3IPo38DJnKU/ok7CTEM1
	hFXLlF0p6cdNw1RQ3hrrWwNN4b2G3Uw3yvxwCid/lR4X5rrUldMSOa0dpGINBc2zToTs=
X-Received: by 2002:a05:7022:1308:b0:193:7fb5:2c3d with SMTP id
 a92af1059eb24-1ac5e3233e7mr11775864c88.21.1793595005485; Sun, 01 Nov 2026
 20:50:05 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 20:50:04 -0800
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 20:50:04 -0800
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
Date: Sun, 1 Nov 2026 20:50:04 -0800
X-Gm-Features: AclHuK_lyxPCjK6t2xfefPD9YIHsE9K1zvS5bZAggGdM_s1pKW34J9mdpIvTKbk
Message-ID: <CAOSmRzgk2r7tzMFuiPt+grOXO_WwAOL7Ymb=dsn4XsthF+Ctmg@mail.gmail.com>
Subject: [PATCH v2] libfdt: Check node names in one pass in fdt_next_tag()
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

fdt_next_tag() skips the name of a node by calling fdt_offset_ptr()
for each byte. Unless FDT_ASSUME_MASK includes ASSUME_VALID_INPUT,
each call reads totalsize, off_dt_struct, version and size_dt_struct
from the header again and checks the access against them. Every walk
over the structure block skips the name of every node it passes, and
also calls fdt_offset_ptr() two or three more times per tag, so this
dominates lookups such as fdt_path_offset() in large trees.

The structure block offset maps linearly to a pointer, so work out
where the range that fdt_offset_ptr() accepts ends in
fdt_struct_limit_(), rewrite fdt_offset_ptr() in terms of it, and
compute that limit once per fdt_next_tag() call. Check each access
against it with plain comparisons, and find the end of the name with
one memchr() over the rest of the range. The checks themselves don't
change: a name that isn't terminated before the end of the structure
block still makes fdt_next_tag() return FDT_END. The range is also
capped at INT_MAX, since offsets are ints, so a header that claims
more than 2 GiB now ends the walk instead of producing a negative
next offset.

With a 612 KiB tree (3,012 nodes, 17,899 properties) on x86-64, built
with gcc -O2 and the default FDT_ASSUME_MASK, a full walk with
fdt_next_tag() takes 131 us instead of 291 us (227 us if only
FDT_BEGIN_NODE uses the precomputed limit, as the other three checks
run 65,745 times during the walk), and fdt_path_offset() of /chosen,
which is near the end, takes 142 us instead of 382 us. In Android's
Generic Bootloader on an AArch64 device at 600 MHz, also with the
default FDT_ASSUME_MASK, the fixups made to that tree after applying
overlays take 23.3 ms instead of 33.1 ms.

Signed-off-by: Kelvin Zhang <zhangkelvin@google.com>
---
Changes in v2:
- Return int from fdt_struct_limit_() (-1 if off_dt_struct > totalsize)
  and use uint32_t for the header arithmetic.
- Rewrite fdt_offset_ptr() in terms of fdt_struct_limit_() and
  fdt_offset_ptr_limit_().
- Check offset against limit directly in FDT_BEGIN_NODE instead of
  calling fdt_offset_ptr_limit_() with len = 1.
- Keep fdt_offset_ptr_limit_() for the other three checks in
  fdt_next_tag(): in a 612 KiB tree (3,012 nodes, 17,899 properties),
  those three checks run 65,745 times per walk and account for ~60% of
  the full-walk speedup (291 us -> 227 us with FDT_BEGIN_NODE only ->
  131 us with all four checks), especially when built with stack
  protector flags on a low-clocked boot CPU.
- Strip function context from @@ hunk headers to avoid MTA line wraps.
 libfdt/fdt.c | 72 +++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 56d4dcb..c0e9f4f 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -145,37 +145,60 @@
 	return 0;
 }

-const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
+/*
+ * End offset (exclusive, relative to the structure block) of the range that
+ * fdt_offset_ptr() accepts, capped at INT_MAX, or -1 if the structure block
+ * starts past totalsize.
+ */
+static int fdt_struct_limit_(const void *fdt)
 {
-	unsigned int uoffset = offset;
-	unsigned int absoffset = offset + fdt_off_dt_struct(fdt);
+	uint32_t limit = INT_MAX;

-	if (offset < 0)
-		return NULL;
+	if (!can_assume(VALID_INPUT)) {
+		uint32_t base = fdt_off_dt_struct(fdt);
+		uint32_t totalsize = fdt_totalsize(fdt);
+
+		if (base > totalsize)
+			return -1;
+		if (totalsize - base < limit)
+			limit = totalsize - base;
+	}
+
+	if (can_assume(LATEST) || fdt_version(fdt) >= 0x11) {
+		uint32_t size = fdt_size_dt_struct(fdt);
+
+		if (size < limit)
+			limit = size;
+	}

-	if (!can_assume(VALID_INPUT))
-		if ((absoffset < uoffset)
-		    || ((absoffset + len) < absoffset)
-		    || (absoffset + len) > fdt_totalsize(fdt))
-			return NULL;
+	return limit;
+}

-	if (can_assume(LATEST) || fdt_version(fdt) >= 0x11)
-		if (((uoffset + len) < uoffset)
-		    || ((offset + len) > fdt_size_dt_struct(fdt)))
-			return NULL;
+static const void *fdt_offset_ptr_limit_(const void *fdt, int limit,
+					 int offset, unsigned int len)
+{
+	if ((offset < 0) || (offset > limit)
+	    || (len > (unsigned int)(limit - offset)))
+		return NULL;

 	return fdt_offset_ptr_(fdt, offset);
 }

+const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
+{
+	return fdt_offset_ptr_limit_(fdt, fdt_struct_limit_(fdt), offset, len);
+}
+
 uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 {
 	const fdt32_t *tagp, *lenp;
 	uint32_t tag, len, sum;
+	int limit = fdt_struct_limit_(fdt);
 	int offset = startoffset;
-	const char *p;
+	const char *p, *nul;

 	*nextoffset = -FDT_ERR_TRUNCATED;
-	tagp = fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
+	tagp = fdt_offset_ptr_limit_(fdt, limit, offset, FDT_TAGSIZE);
 	if (!can_assume(VALID_DTB) && !tagp)
 		return FDT_END; /* premature end */
 	tag = fdt32_to_cpu(*tagp);
@@ -184,16 +207,18 @@
 	*nextoffset = -FDT_ERR_BADSTRUCTURE;
 	switch (tag) {
 	case FDT_BEGIN_NODE:
-		/* skip name */
-		do {
-			p = fdt_offset_ptr(fdt, offset++, 1);
-		} while (p && (*p != '\0'));
-		if (!can_assume(VALID_DTB) && !p)
+		/* skip name: check the rest of the block once, then scan it */
+		if (offset < 0 || offset >= limit)
+			return FDT_END; /* premature end */
+		p = fdt_offset_ptr_(fdt, offset);
+		nul = memchr(p, '\0', limit - offset);
+		if (!nul)
 			return FDT_END; /* premature end */
+		offset += nul - p + 1;
 		break;

 	case FDT_PROP:
-		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
+		lenp = fdt_offset_ptr_limit_(fdt, limit, offset, sizeof(*lenp));
 		if (!can_assume(VALID_DTB) && !lenp)
 			return FDT_END; /* premature end */

@@ -221,7 +246,8 @@
 		return FDT_END;
 	}

-	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
+	if (!fdt_offset_ptr_limit_(fdt, limit, startoffset,
+				   offset - startoffset))
 		return FDT_END; /* premature end */

 	*nextoffset = FDT_TAGALIGN(offset);

base-commit: c22868416b8db8354ce5db29d3494dda688a2ae3
-- 
2.56.0.385.gac671c819a-goog
