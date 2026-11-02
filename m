Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793599825;
	b=QD7VWl6cI4HA6hH1ltcai5ERGZY2H1nk2yQaW5Raf2DxbWW8cCk/vRFodzarKGbB3MoO
	 nhxBTfH4VEro7yq64tJOvQS2KuPB3bV6Bvp0toRuao+9c4sNpDs2OUafdQgxRce2NXnG0
	 zzfvIBTL7HR+3E/ZF7Zs+8ACS9OskURQXQRCto55j8bfgu57G7WIipoZ23i/fr+BcT48N
	 NqztPe1/QTPempF3YCrCAzI5b5qPuRIQdXSQEy/RReOnZkmIaUsKZ0QTBxMQSqSg1lowZ
	 XA5+RV1oRfzqr5u51O2KaFcHRS9glzfe7gP7kz2gVE0xUM+/Px20QNYXNiz2mWj76YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=3t//LZw3gKBbNjy4PoPxYm6zC7Kb2GsnIKuoCthI/ck=;
	b=vilydH8BeY3BDDrdCVy/KdaiDMmcybCboLhU9IXs7iQkkNtPi4A4FOLOhOT3D6KKdbGg
	 N1S4Fj6B7D01sIIiqDV6jybGT4P5kp9ebNJzSITKUCxxbIK/h0Fw4X8IjSejPnZvQ2xip
	 PYrZudWnO/QKkBuTDdKuC3g0f9pZXoNhLPKaeXLt0Fw0740Y6uO5fK4s5bpcYDxRMz7Gn
	 4UueKeXpM8FDCgE+CQL75y1LdTCjCApsfR/3bepaZ6y3HPFGIsUiyujDD5Xz0qLCQqN5r
	 1+qq0kP2EfaBYClAvRkE/451guE0HkFXEp393/qYSpsolKIaACA2TQd07sWJyzUpoZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ae5gwh5B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71638606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 06:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71638606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ae5gwh5B
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a1947498bso473460eec.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 22:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793599824; cv=none;
        d=google.com; s=arc-20260327;
        b=ntZHHaVaXbKH82u2qxanXuoRadLKyFLNVN1yoKzMUdCPGTR+kmjsY9JGo5D6uIJdUi
         ctR3MYu1P3a8d6FaM+xaYkPrpP1v87buINRWmEtNGPi4eEVFSxosdCR7e+caiNflBNUn
         XbXqOxw37xqCMn6JIYfSWWYWJFw9zS2vpYCwEpdBcxlYZ37OxyxwVeqtCg4kUuxo4F3X
         O6RprF/hY4t5rsRb19n7gMoLhIGGwOZgHxgHDmUklLwTS4S7C3Fb/jl1WCdKT55bwLCO
         bPvrBQhJ6H9aSatWStmTsaj15R+SY20FK39f6xzt1PEYWV7mM2jhl/iXyMS4FsJ1hCmn
         /6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3t//LZw3gKBbNjy4PoPxYm6zC7Kb2GsnIKuoCthI/ck=;
        fh=mjWR8OSeWiqsU4LUmPt7qu9PcHXlfIeAMImzQuh8u2s=;
        b=dnXOw5QjwOz2jAwZSb/YPbfRp8YpvRkxaCy8iD+ilOKvUKXmZvEhS3SG372ENyB6aL
         vLunJ3Nmrs0C7g+CB5iaR4Un4tqHkagDzbV5Q7HXB9nJADd+dIHOYiQ54/PJz+x+Um0b
         AezJkmiQSS47GQnywwlae2TpAYhQlAc+5p+BEG6mk0R52efCX1oogAcr8XUHyyiP3i8O
         L3qlfmGXHu5Td/vzBFGwXDMRzvbKJZnP4xV14EGU7DFlAcn0Z7BzE6dn/9pMyoATGm2A
         /HWbE9IT5voce2W7ed8/nEiKSeObFBVXGXFq1IAVdefmtVVakoksBWNH4nM8iYbuRyGA
         v01Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793599824; x=1794204624; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3t//LZw3gKBbNjy4PoPxYm6zC7Kb2GsnIKuoCthI/ck=;
        b=Ae5gwh5BVsz0qA82nqbxHHgvjYUjpCsmkpJXyxKHHCMJH1CmnNul8nyufW9Yj/5aQc
         wK7PbJPXeUKiapT2yGxH3CVosPTrA6szJxbHF64T0X797HlEWbyqOdPfSf+TMQW6TxNE
         QFRNdFfuiFyPghcbQ2EHAcQiPlemmFlGJZz/ikf/R9rLRzR7PFOpkbQ46Mhco+1tQ6yu
         /55IvGlTn1ugfw15zPyMzffX/2ytVnIU6ENazGgvqEv4kqVJNDkcMNPMp3t1dJiq+9M1
         +3vCjkRWiFyAY/zQKLeJdAUQE/gFdqpe0Uk89R2WOugdY+hAkW3arFWR4gTVj4erP121
         hyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599824; x=1794204624;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3t//LZw3gKBbNjy4PoPxYm6zC7Kb2GsnIKuoCthI/ck=;
        b=0fI/U/BoLRUYu7hupl54bh9IlgBMgSM+c1E1RyH4uS4uoBDvVizzAEMhjngI5WxZGB
         CY2gFjc5BtxcY6NQB9+CMNdnTbPep67UaiQkYGOGWLdt/H0quCnDoDX8/AGd2WlYHe8+
         od0GuTF7wr7WHd8j9XdyQ03N5AYwfFFnfqlgnCu0GcKx/WD9S1V9lgbZ/BRdbW/VJUG0
         QqA4QSwtFOJMrg8HNiVyFbo01oo91E3QMo1o5GmaAei6SG8C1oJ2bxXhGuiPck3X5lCq
         INg/uxpqXDtwyqEoPGJw6X0ch7Y0CCWbkaef9+L+EC2/mRx+/GlmZJYPiSZOx9Mhe5iF
         /Lzg==
X-Gm-Message-State: AFq9FYLt9Do410tT6W2bPrIHesaD3kwEbJIr9ehlV0TKmS314meua2PN
	nOTrpw5hv6LILbJ9tcWWxU84bRJP9Q+JuMve64wCqYLoeEuLbadBkLWdmdf3SFZQHdssyCtWc4r
	hi3SF2XYI7rFb4MIsNrHFRK51IYabjQaYaOfMJ1FMWbMpvCoRT1cKj2uA
X-Gm-Gg: AYBFou3sTGiqSvX3d9U/fRM9Kj30C5hP/4x/bh+vN/UUyYWo/Obg8BTx0guogqZSXiu
	gO5RSDDYOjU+wjH4YWWO+Wm54adpmSM7ITKlJlYL8x92HTjH2Vl5YVzbu+z9p0XBhZis/KfL+2O
	7V8mZOzAklfpPOpbSQsfh2QX9831sSgvcG9o8855zoTEfC8rM9zT2eTh869sDDhdcYtmOi+7nU6
	lQKlL7eRZo5WRU06XpT1nPH44gnLeUwAnOdrfm2hONHlyR4CV7A7CJFFORDAJNjfO4QI0++6qyj
	17O0HHDb7xP4gJiYpY3mac37XK57MttdaKcjgkqTxGFmWLVnEFCZhtc1NCEP7ebOpIifB6kWL9l
	Xg8GM24Q0M9pSbro80GlwTqgCudf39hFCl2RcAMbww8WVApAmnryWyb1iuYg6JpOxb1w=
X-Received: by 2002:a05:7022:1507:b0:17e:ee5f:6715 with SMTP id
 a92af1059eb24-1ac5d4b1972mr14657423c88.27.1793599823461; Sun, 01 Nov 2026
 22:10:23 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Nov 2026 00:10:21 -0600
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Nov 2026 00:10:21 -0600
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
Date: Mon, 2 Nov 2026 00:10:21 -0600
X-Gm-Features: AclHuK9P7Pu_wQuQghaoshmmTtNCsS-QPLElB-8OGwXQWcOn6OcS0qmIsJiyxLA
Message-ID: <CAOSmRziU5g9WO2R86d3w0mBgNmtwpdHfKu9EXTSD9d5cw-pNcw@mail.gmail.com>
Subject: [PATCH v3] libfdt: Check node names in one pass in fdt_next_tag()
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
Changes in v3:
- Return 0 instead of -1 from fdt_struct_limit_() when off_dt_struct >
  totalsize, so limit is never negative.

Changes in v2:
- Return int from fdt_struct_limit_() and use uint32_t for the header
  arithmetic.
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
 libfdt/fdt.c | 71 +++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 56d4dcb..d9ccb70 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -145,37 +145,59 @@
 	return 0;
 }

-const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
+/*
+ * End offset (exclusive, relative to the structure block) of the range that
+ * fdt_offset_ptr() accepts, capped at INT_MAX.
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
+			return 0;
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
@@ -184,16 +206,18 @@
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

@@ -221,7 +245,8 @@
 		return FDT_END;
 	}

-	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
+	if (!fdt_offset_ptr_limit_(fdt, limit, startoffset,
+				   offset - startoffset))
 		return FDT_END; /* premature end */

 	*nextoffset = FDT_TAGALIGN(offset);

base-commit: 4e9e220985ec9541cc3fd598c57f0834d4836cc1
-- 
2.56.0.385.gac671c819a-goog
