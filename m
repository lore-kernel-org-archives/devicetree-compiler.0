Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551128;
	b=Rb/EVOUPVXR312tH4OyVSBgPfmb+Nc+EJfyJEaOJrdOEI/3kT/6TX7NdxQMfgW1+tu70
	 xf2J9cCLXZllgVLFTOJPI2wh17fDWhF9wsC6k/0RV+lmqjWiqpeTc8KmyNqVrLFxUbEti
	 akl3HjR85c7LO6PLlDnpaGQkcBkeASRJjseonQ3s6aRBhf/GmKcm2lDrYjv5JK5KxHsmq
	 mQwOBnVAiMXqQv7zgjzU2SSWqPPR9Zbc6lzePvE7L/E4+RYSRbc690M67NjaSkg8K/zoM
	 PctJB4CGjx1ptiRZPlrN5R9+MVbFQUgWJH26l8JmhlcMi9y8F+w7e1WyPoY7PpPiKSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iLeIC4A1t0+hVI7OMiPox3hN6/oRj7kaVXr/7hV/mbI=;
	b=m53gIUzzmBoehr0iAIfBoA5NbrwaWmzjy5BxGIV8+Nn1M92KmSIc07Ub2xx+MmvmrLXr
	 z3Mdy7PUW0yFL+kguL89r71fepLYTkjKP5EOsHJUeNQ78O/kRWhIc46iGB71Y00D8EUKJ
	 nXqohzXB9Dp0GTxliSoI9LZab53j9KT0PMJm5KZmfaENvinrxJfy3Rpzc5jwvvTcz28WG
	 ZipWyKhURHOVfwxt0dz8wrQGGyaYdoVsGMwuj+/p4x5RR6K2L8kRj2PRhJvNGyPdLZP4V
	 VRScfl9Mpn1F/ib/TBuWZyDwfhFUKOqb2ihqJpl1DPGFVZjSvk1e3PejN4noFFsOKmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=acCAqGJX;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA3D606A325
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 16:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA3D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=acCAqGJX
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8470d7d430fso821360a34.3
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 08:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793551127; x=1794155927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLeIC4A1t0+hVI7OMiPox3hN6/oRj7kaVXr/7hV/mbI=;
        b=acCAqGJXf8Ee3CB3QrPPT/LHoRUGUKeRnOLQwk5VjaiISF39gXzatLx01pfrdyf8nX
         e4LDTb9kaYrdXbWgpRUbYNaZ9O/xx9Dr0ZchDFMg8mPL2yQccGXK1stfk4WbWCBL6pBs
         +tHOgwyCO23k2wyMjUuj3HVYwN5ZDM0TBEVo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551127; x=1794155927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLeIC4A1t0+hVI7OMiPox3hN6/oRj7kaVXr/7hV/mbI=;
        b=mqzTB7QmugGsYzXc4prX9Xkhy3scgMlfDUOdBsknkMh12XGeq9+Mgw6vsGLlZWLiq1
         LaG6N/lXK6biI05LUCxNJhWGenosNs98oAMxfCeOfvirwSThNm1YzAne+0ZqRrd7csPu
         oT+b1wM6MxKaXWMjLM1VgjCc6VLSVYneciG2P/wEtOsLgim7I2T4F2bEvOdFPb7nPSrC
         bEs+/tGdmN/aH0pknShjC8fW1A5clALeig8kUK9PxTrVx+3/g9xS6VHDPT4uc3MDofCY
         VfxOVgIGDfFvmgS9CQd66DzregfbgdUFsRwlLNvMDDDPZqormaLOpLmbaazgWbD/BGS3
         ihuw==
X-Gm-Message-State: AFq9FYLOM7ZOByUQFiLTESmCYAD2k9uQzRpzWGWSnxJNHgrzZUIAje+I
	Em10VYwNtSWnqQ90nB3BFqi0zjEs5VGajIm+TzBQwUHgZ/QW9RiyS0sD+GwflfH6vv1TmOItQvG
	ymqSW5Jm0
X-Gm-Gg: AYBFou3PjG9SZMaeNRITkZ8c9X9KBy+LhBObJCmqfQaBF58N/Q5s+/32XR8Fv6H08Oy
	24KU0j4td8QDJsTa8BPBd4ENFTozfgYEPCmSoxsFkGPC0qMSG98C8PwEN4yv2rdc+t8Y64BshgR
	OhlLUjEfhQgwv2iw9GITYsqqohnWYN0sNJ01mBuyNcDorqj9uGk1gUP5+noa1/X56IdLWWXgp8I
	4ie4+rV1QHpZyNL17vSpVPmffAbzM1I7jbhjmUGbybBJAv9vNE8lUPVpyzCMOTkuSGuvb1o7XLs
	bgEmW+1Bzi39yWcEx1ag3OW9hcU95jcAHK1hNCMdA9hxcWAfnvVR8nHyYdp9rf7IGAenQTvH4tb
	XXmut6ttZTfALUrNQmuHaYJUBz2ztjbJLCG4DDq40/EmETEedRtlne71yJYDxCXgC864fdyw3s5
	fwSNFN6cp66kjZn3xSNPNQrP3gxndyLewpiuONeljWfart4xbA7LpEmuApCp2hwWFS1NGZH09XL
	ENDuw7Mw1AASWsMQ+JtsAkzrwcEVZPZ4HdTMLwiVPPipLmiU/vmj1NF0xqjAmF07uBu9T55W8zL
	k2VUrcRI5SVmL2e5b6e10JA2qdztfe5KB5xB3ezK2JDqkbH64bSmMCa6slX90rpymIyNzEPhJsK
	3N1SCR7et5mMZn9sx7hUY9A==
X-Received: by 2002:a05:6830:3151:b0:7fa:ab72:9df9 with SMTP id 46e09a7af769-85d3652cf22mr7240224a34.17.1793551127332;
        Sun, 01 Nov 2026 08:38:47 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm6858411a34.14.2026.11.01.08.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:38:45 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 13/13] dtc: Merge the fragments of a dts file in main()
Date: Sun,  1 Nov 2026 09:37:07 -0700
Message-ID: <20261101163721.2458982-14-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101163721.2458982-1-sjg@chromium.org>
References: <20261101163721.2458982-1-sjg@chromium.org>
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

We would like to run checks on each fragment of a dts file before it is
merged, but that requires dt_from_source() to return the fragments
unmerged, so that main() can decide what to do with them. At present
they are merged at the end of the parse.

Call merge_fragments() from main() instead, once the input is read. It
does nothing for dtb or fs input, which has no fragments.

When a reference cannot be resolved, dtc now reports 'Unable to merge
input tree' rather than 'Syntax error parsing input tree', since the
file was parsed successfully. Check for this message with
test_label_ref.dts, since no test checks it at present.

If the parser reports an error, dt_from_source() gives up before main()
can merge the fragments. Merge them first in that case, so that any
errors in the fragments are still reported.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractus.seuss/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 dtc-parser.y       | 2 --
 dtc.c              | 2 ++
 tests/run_tests.sh | 3 ++-
 treesource.c       | 5 ++++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index c1aa4ad..f547a62 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -105,8 +105,6 @@ sourcefile:
 		{
 			parser_output = build_dt_info($1, $2, NULL, 0);
 			parser_output->fragments = $3;
-			if (merge_fragments(parser_output))
-				treesource_error = true;
 		}
 	;
 
diff --git a/dtc.c b/dtc.c
index e506837..787c724 100644
--- a/dtc.c
+++ b/dtc.c
@@ -299,6 +299,8 @@ int main(int argc, char *argv[])
 	else
 		die("Unknown input format \"%s\"\n", inform);
 
+	if (merge_fragments(dti))
+		die("Unable to merge input tree\n");
 	dti->outname = outname;
 
 	if (depfile) {
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e0504c0..4ffd919 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -737,7 +737,8 @@ dtc_tests () {
     run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.test.dtb
     run_dtc_test -I dts -O dtb -o dtc_tree1_merge_path.test.dtb "$SRCDIR/test_tree1_merge_path.dts"
     tree1_tests dtc_tree1_merge_path.test.dtb test_tree1.dtb
-    run_wrap_error_test $DTC -I dts -O dtb -o /dev/null "$SRCDIR/test_label_ref.dts"
+    run_wrap_error_msg_test "Unable to merge input tree" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/test_label_ref.dts"
 
     run_dtc_test -I dts -O dtb -o dtc_relref_merge.test.dtb "$SRCDIR/relref_merge.dts"
     run_test relref_merge dtc_relref_merge.test.dtb
diff --git a/treesource.c b/treesource.c
index bf648bf..3fb9d83 100644
--- a/treesource.c
+++ b/treesource.c
@@ -25,8 +25,11 @@ struct dt_info *dt_from_source(const char *fname)
 	if (yyparse() != 0)
 		die("Unable to parse input tree\n");
 
-	if (treesource_error)
+	if (treesource_error) {
+		/* Report any errors in the fragments as well, before giving up */
+		merge_fragments(parser_output);
 		die("Syntax error parsing input tree\n");
+	}
 
 	return parser_output;
 }
-- 
2.43.0

