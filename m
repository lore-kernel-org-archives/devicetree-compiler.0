Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793586654;
	b=MJglJkbaVs42Nb0bYqcquI2htHbHhQURc9JAb8GOOGZfEAkDdN59WdqX+8GBFAT0Byd7
	 xyoO8VNWQYCXAL/P3cLKOT+qVypHtyurAKh5nkFXGc8N9eEJ4uqaJCsos0A01XRLZlvKy
	 aq0kekX2KvJg1NVKCKw1KDOOkWuSEWT9NszB7lkYnFO4/wBNfl+XHpWcXhY+LpR5QbrFH
	 aJ2nHjFOL9dyvNR2tZ6LvfFma9s7IxlwcysjLcfrekIerLYlDe0P7tZM+yxa/4/cjZQ7d
	 o7oK2fpID2vSbqHraBIjQQLn+FnLAVq16wqlJlYQxeB9H950p+mGE5bAXJmRfmvJCbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=hin2GKMoVCjAwDplmxhkHBKAOr0VJH9DeAw3OkAx0FY=;
	b=JT8IT88wXNF3VUfFXWDlPpJ/7rMpoISgQxt9ZYecwb9burSIuxqImGWKDEughPWZDjmR
	 OzP5EL/AMd2dkgnHs2WATHcLYO6hM0Uu2CBAsb1AlpgMqm2KKMX4ErTAo3B9nO5EhPz18
	 P4mltXztWCJZZwNxIBKsxm+bI0qYInsjYGCxjBbLlcp3zvVbv5Kyeg6u+ZHqIB/iGYqep
	 LNNRAfhG/rBjFrpvgkp461s3l5SE0aCuCovW2p/hsF12kAkhflnCkm9pXve7YdWJIIO+z
	 eBzThjRUAHsmtWDg6usXS0+rjWYXOgG+HcE17mxW2hnESM0b7KA5F9Qhc0I+jbnsdXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pRBrAFO9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B31F606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 02:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B31F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pRBrAFO9
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-19305bcb72cso1680931c88.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 18:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793586653; cv=none;
        d=google.com; s=arc-20260327;
        b=K8i48A9iiGR8mM2v3XXy2ZXckSTkLC3yxCg6JpNeIWJ239NdiEMIOhAaOsyhKrPhJl
         3vXa77ZVRBP/aIEaUPyyui5xTL/2LZm9F3lZiu4s1mCoLYm+g3rUl9apWqYBfM/hRt3h
         10ImruYKHTdkPU/DEc7ux/0yfdJDDsfO8RYzcltHxjfbjOeZ5F0jfSFn9wPEb8OqYCts
         b/A0uXsFhfnQ6ri3n9w37riC1/tyLifmSdkrTH52Ak8YM0FHA2C4YFUbAXcRJdQpZBHH
         p5yXToJorh1doLBvTFMtU17ZrI5Dlm5Q0C6DoknsHXYUX0bRGcKFhY23axqTLbuf340V
         71sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hin2GKMoVCjAwDplmxhkHBKAOr0VJH9DeAw3OkAx0FY=;
        fh=mjWR8OSeWiqsU4LUmPt7qu9PcHXlfIeAMImzQuh8u2s=;
        b=GgFqhyy8/GLi2NEFdcI5JTjDciXKpaSg2Zx3zUOXBCML9R7KGw3PiVgyzD1uf+snmD
         1iJOCT6mcQSXUvhonTuljWRFHjxhkfZKSilqyWG6v1kxIOHiGFK28yIv2dlnpOFjAyMN
         Ur42uGX/r6k11IeadLCy55t2PxOjIWTxOPphGyN20kT8sT3blvwkd5wiE5ZmgbVbZoRE
         Vj3trlgOvJQaN8UEZkFDn2o8SaSrHGTcedpSzEme/naH0wWJ0acPbUOrpgKEc8l+ticJ
         EDz3Vc2OPJumHBhgH2SGE5xut0FAde/m9OXuDacZCCtBHnSGVsrglCIk0RrpLbgqdjE2
         b8zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793586653; x=1794191453; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hin2GKMoVCjAwDplmxhkHBKAOr0VJH9DeAw3OkAx0FY=;
        b=pRBrAFO9CxShQJyW/SOJHLdyWOADof/WRkXOWtibW115dn8ufqsz6VS3SPgEnpWGPg
         egUedOD4tK2crZ3qli+8DpWb83ZoBMTI9Q1TwcAC3eKsitCZRpwxE+lbomhNzY1N7m4a
         2i+gf6cRGz4B7iA6t7ISSNciDInSoTgcHEwW3vg/MwjXag2fLRJpkvXWBYF1shiE/Dsr
         f8FxW9VR+vtI9ll8ImAXUzvzpUBoOYvDFgXroLjWL7OZkNzY18NP92760VzPc1Q2TDjY
         YiQew5MbMSdfhtsHsWljXRh6lHvLa20SO/Zz6TTtlV496N1rUJteGH+x99TVXgt3CG6b
         wq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586653; x=1794191453;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hin2GKMoVCjAwDplmxhkHBKAOr0VJH9DeAw3OkAx0FY=;
        b=B08nuw5HcCi/QXspt8OzMKi3Ck5CBrrFNgSu2R3yDlIC0N/9oIxMXfRfHJVEDZsZHb
         XnXkIw1k+CzBDbexxmAgvrt/2w6JMXWxzlfZjXM8VmZL3oAM74Of6NJKxQVMSLscuwHa
         kdMsjsju9JhlwUrRg5JgBxbsnG7ne+8UidT2UXnhpQ9CKNLDn86kphxxdt9AUPHsxsFL
         YRRHC2YHamubBNybGBjifutTbVkJA05NPhzVpBg6UocpxIW3iMpHsywMrlRU9mh427yA
         cs2gijbarfl0kxbOANK8nu/JJUOMTBXFaII9cBaultoyZ5XB8uAU2gCddESfLaPI3OUN
         yMKw==
X-Gm-Message-State: AFq9FYIX1IgwR3SuDX/v6ukejioJNAe3/lTS1dXWZhLPbFhBo2rX3cFA
	6HGElD0KvBV2S4r50I9l5OE+oPVDan29fmObdjiDymmK+0cxgXt46sx3TueCYt5txxxadX2U4uB
	YTLslB6ndH/7k2ghMZeoPUDaA0ddkdbNAKD9jyWvMR2Zz+zIJTODsBrO3
X-Gm-Gg: AYBFou33hmQLji86IgOaGTn8lqnr91OSxOePL8xBTQBpaIYNQODjEuArvkE02v8sgHu
	MCi55guGFItDiba25azR7RyjU9IZsccfhzUdg6Ted+6WrrsesgZ2wyHUHCjlTmHuTQi+hZd8ase
	0E5SQmHR3+4kfnovxKUdLR/rikwmsNazHrariVxEAYyB5Uw8lF/UVyppIC5LJln31lJRkkzbW5s
	lnKCw2Tuj/k2GvVmhL280PLPRaL6BXvTZqgc2tTwpOruxTN21DxTj0bA3c2DQn88yrrAehr3/kw
	/+4nN36zwfILRSmlBEMv4xMQJB/Vn1KVXL+D+uTDCxGCsPMlozFiJEDUURN+KU3J75M7hH90uWV
	ukD9QBUfe/SUigeIytthjeb/FbXsQGp+dsDwljIc+N8eMaJC1cnNI/yGBsOCUSGAY8Rk=
X-Received: by 2002:a05:7022:b048:10b0:19e:f233:4f87 with SMTP id
 a92af1059eb24-1ac5a2a1483mr13981333c88.15.1793586652464; Sun, 01 Nov 2026
 18:30:52 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 20:30:51 -0600
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 20:30:51 -0600
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
Date: Sun, 1 Nov 2026 20:30:51 -0600
X-Gm-Features: AclHuK8Gi9udt-CBxa2T5_DFNKGnc7RI9584dPJQJK4wIL_zEM1lw0AkVa_C_mU
Message-ID: <CAOSmRzjuJmPc=59ebUaGfbWuDsd07RpoPM+Zu7qZomPB_zTx_g@mail.gmail.com>
Subject: [PATCH] libfdt: Check node names in one pass in fdt_next_tag()
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

fdt_next_tag() skips the name of a node by calling fdt_offset_ptr()
for each byte. Unless FDT_ASSUME_MASK includes ASSUME_VALID_INPUT,
each call reads totalsize, off_dt_struct, version and size_dt_struct
from the header again and checks the access against them. Every walk
over the structure block skips the name of every node it passes, so
this dominates lookups such as fdt_path_offset() in large trees.

The structure block offset maps linearly to a pointer, so work out
once per call where the range that fdt_offset_ptr() accepts ends.
Check each access against that with plain comparisons, and find the
end of the name with one memchr() over the rest of the range. The
checks themselves don't change: a name that isn't terminated before
the end of the structure block still makes fdt_next_tag() return
FDT_END. The range is also capped at INT_MAX, since offsets are ints,
so a header that claims more than 2 GiB now ends the walk instead of
producing a negative next offset.

With a 612 KiB tree (3,012 nodes) on x86-64, built with gcc -O2 and
the default FDT_ASSUME_MASK, a full walk with fdt_next_tag() takes
122 us instead of 297 us, and fdt_path_offset() of /chosen, which is
near the end, 148 us instead of 434 us. In Android's Generic
Bootloader on an AArch64 device at 600 MHz, also with the default
FDT_ASSUME_MASK, the fixups made to that tree after applying overlays
take 23.3 ms instead of 33.1 ms.

Signed-off-by: Kelvin Zhang <zhangkelvin@google.com>
---
 libfdt/fdt.c | 63 ++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 56d4dcb..7325aa2 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -167,15 +167,59 @@ const void *fdt_offset_ptr(const void *fdt, int
offset, unsigned int len)
 	return fdt_offset_ptr_(fdt, offset);
 }

+/*
+ * End offset (exclusive, relative to the structure block) of the range that
+ * fdt_offset_ptr() accepts, capped at INT_MAX, so that callers making several
+ * accesses can check each of them with plain comparisons instead of reading
+ * the header again.
+ */
+static unsigned int fdt_struct_limit_(const void *fdt)
+{
+	unsigned int limit = INT_MAX;
+
+	if (!can_assume(VALID_INPUT)) {
+		unsigned int base = fdt_off_dt_struct(fdt);
+		unsigned int totalsize = fdt_totalsize(fdt);
+		unsigned int avail = (base <= totalsize) ? totalsize - base : 0;
+
+		if (avail < limit)
+			limit = avail;
+	}
+
+	if (can_assume(LATEST) || fdt_version(fdt) >= 0x11) {
+		unsigned int size = fdt_size_dt_struct(fdt);
+
+		if (size < limit)
+			limit = size;
+	}
+
+	return limit;
+}
+
+/*
+ * Checks @offset and @len > 0 like fdt_offset_ptr() does, against
+ * @limit = fdt_struct_limit_(@fdt).
+ */
+static const void *fdt_offset_ptr_limit_(const void *fdt, unsigned int limit,
+					 int offset, unsigned int len)
+{
+	if ((offset < 0) || (len > limit)
+	    || ((unsigned int)offset > limit - len))
+		return NULL;
+
+	return fdt_offset_ptr_(fdt, offset);
+}
+
 uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 {
 	const fdt32_t *tagp, *lenp;
 	uint32_t tag, len, sum;
+	unsigned int limit = fdt_struct_limit_(fdt);
 	int offset = startoffset;
-	const char *p;
+	const char *p, *nul;

 	*nextoffset = -FDT_ERR_TRUNCATED;
-	tagp = fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
+	tagp = fdt_offset_ptr_limit_(fdt, limit, offset, FDT_TAGSIZE);
 	if (!can_assume(VALID_DTB) && !tagp)
 		return FDT_END; /* premature end */
 	tag = fdt32_to_cpu(*tagp);
@@ -184,16 +228,16 @@ uint32_t fdt_next_tag(const void *fdt, int
startoffset, int *nextoffset)
 	*nextoffset = -FDT_ERR_BADSTRUCTURE;
 	switch (tag) {
 	case FDT_BEGIN_NODE:
-		/* skip name */
-		do {
-			p = fdt_offset_ptr(fdt, offset++, 1);
-		} while (p && (*p != '\0'));
-		if (!can_assume(VALID_DTB) && !p)
+		/* skip name: check the rest of the block once, then scan it */
+		p = fdt_offset_ptr_limit_(fdt, limit, offset, 1);
+		nul = p ? memchr(p, '\0', limit - offset) : NULL;
+		if (!nul)
 			return FDT_END; /* premature end */
+		offset += nul - p + 1;
 		break;

 	case FDT_PROP:
-		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
+		lenp = fdt_offset_ptr_limit_(fdt, limit, offset, sizeof(*lenp));
 		if (!can_assume(VALID_DTB) && !lenp)
 			return FDT_END; /* premature end */

@@ -221,7 +265,8 @@ uint32_t fdt_next_tag(const void *fdt, int
startoffset, int *nextoffset)
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
