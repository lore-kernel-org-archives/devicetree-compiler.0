Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994826;
	b=fl7uPMBOsk3MMIXRPGHTBRyXFVSqgZ6eTLlgf84FrsdUh+u+DKPUyEjdZCD3VxiZ3xpe
	 mp2mW6j1crLTuOpNqIHF+d2h9yN3srKQISWz50JySOw2XNArVdt1hRuy8xpzwkpahJxM6
	 mTdL5/D2xhPeNG17AuMfC6RHjrq9xju8KFbYMzomW+xtVLXNF6fmJYa0IC5xwwNApPs4I
	 +gVIo5GotX+B3wzDknCCyzC1zsQHHg8+3tCNl5O8gY42MY+DVKvsKTRzpXZ64W4sy+8iC
	 XmKpjf0YRVSMQ0NWrXMA67mKeb2FfrXOwd76I7BBiSZ548TLTnMuq0vpY0l93DrHJvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6wD/r4DsdvJPT6PvRIwmBGuhhKKpUvmlP1NkIMzwivE=;
	b=hEPZe3uhd11BStXYbGnZaJPeeyk8X7iSyZ1Ua9RpUFJcPHUvSsXb7ePS9Pu5gisvqQEC
	 ahQj2tj6mbQxws6rHUIZ9qJIuCmuudRk8pYATJpPOnVm0sPN3BoYVAIhZlNXX+MkWto/o
	 FgiUZp4KpHdI7DhrE38KJmkW0LaZ2YVAaS3hHQ9nelw3XfJpqx8Fr2Y5+sMi4r4/w3Smc
	 Vh9L5wIt/CEpSx2yW7+o4lJ7H8X00AFjAGiUW3YkTFyVDGtt8iU2odOlOoMdzmNX20I6p
	 mpjWMQ0vuthFGly/AJB/LSiwvUxCJrnyVk0rCYE5LNfivpds+Sbk42quSuMhbNR3qYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JSbQ8+I3;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CC2606A32D
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86CC2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JSbQ8+I3
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a822463a22so583353fac.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994824; x=1794599624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wD/r4DsdvJPT6PvRIwmBGuhhKKpUvmlP1NkIMzwivE=;
        b=JSbQ8+I3HwnQSLPWXgRwgfhbX+KhRqQVBhfZCpeGxyKgndRnhEcsZaJTpqaj9gyB+F
         rG7f2SQ6accqES2gU08JHo8YY0ICauvw+4lBsZLL5KGLsfPSG+5Ynb1NaAS0iyqHmQBw
         6Jo/ZV4xL5a0GHGxz5KOkxhVPDNG3ip31yxD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994824; x=1794599624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wD/r4DsdvJPT6PvRIwmBGuhhKKpUvmlP1NkIMzwivE=;
        b=LvcTcINVXibiO5Wh36bxsYF5ZXLZnwkriKK8t0V5Y2ys0X7oMlKZFxL3wWoQB82Syi
         x8xhJWN6YKjAoilIM6v5UC3gABKAba/jOuxNU1FdkUlJym3yDHpsa7B1orb4IArhFYOc
         6DqKKrAPjlpOZ/agj3jzuXC2FiDrqy25VFv4S/BxBSGcDoNqoEFHAskw++F3nOleOcFj
         dF2+VUWwD3IpZKkUBhL8kDehWCQVpOx2WZiFq31wlwf8MO7Q3oeHrPSwppk+3L60fsSF
         guMTnytyWferStqfu561slIM0RaQa6ptv9vWe8cjboY/VzRkXSIkmOyMFWN0fFuLOBnP
         H5uw==
X-Gm-Message-State: APuU4Z80+1u10o+s1KSz8UPIOzPE48jyqOYKRVWs+kHdvIQPCO5jmDW3
	3Vom3iW/wp7R1Ys2GQG06WWdRdgFOWB4oziG/m4VtsrNuTg0eWqd/W+usKcyArXExhVqgwVs9aH
	me5+QPQ==
X-Gm-Gg: AYBFou2Iu4Sk1hVs2PbhV+tZ1dUnnE59hp9umeJqsH4/JkXUIU2pHZ9hUwWJoCShG55
	p/6mOlPflWimVUk/qwI24FDCF3sVrv8Wd9+7EHEMKn2Z1mYRT6QvZj2zHDcciRbvGMSwhaYNF9z
	wyrVRlx91+4/Kdv93xoMpuJZWVZ4Hf4Yo1TR6IxIbM1hb3IMNUzQJtFlfUgipQO/1FJTXGNEHpw
	oz+9u04vydydK3yGmC5ucFviRC37vHOWVLGPIRSH1YXGIhpyiA3ObGUNTkujZOkkofhWTl6yGcG
	dErGxOR0RHYqwHedJ0u9proEh3BjMr7r5bEUpQ+f3vC0t8nAl2+Qd7KcQDzcZimOLP5iLMmNnpu
	44J7iHon6V3qTqwNz34dfa47AXuiHKcdALze730P5S/AtG9FUe3JdpPNs3BrKsn7OR3N1SZ404M
	mRKM7ucNb1i6GU/Hhfdg1WpL9rJv48EzbkrHhZ7CynhI7KYgeDttlQHveLEFAZukNkAbTyTwUZH
	SirCS2wIs+JIZkA02MPf9ixwA+1Tf2S3y488WZv3xoQ7DrT8eDv6pyB2LzCmCJs1AI+fTjQP2dv
	YEMneEofOqpIW7qn4l+HyvtW7rEg1OQGA4OfQQBNRy9STX7o58qkQLk/av/Y+bw59Md/7Q58nGJ
	MilmMWyMErom/+0jsp4OV
X-Received: by 2002:a05:6870:844a:b0:475:e2e9:4f54 with SMTP id 586e51a60fabf-4ad98b41055mr2458506fac.34.1793994824238;
        Fri, 06 Nov 2026 11:53:44 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:43 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 15/18] dtc: Merge the fragments of a dts file in main()
Date: Fri,  6 Nov 2026 12:51:42 -0700
Message-ID: <20261106195159.2623314-16-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106195159.2623314-1-sjg@chromium.org>
References: <20261106195159.2623314-1-sjg@chromium.org>
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
errors in the fragments are still reported. The merge-parse-error.dts
test checks this, with a fragment which refers to a missing node,
followed by a division by zero. Also check that dtc still gives up with
'Syntax error parsing input tree' in this case.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractus.seuss/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Check the final message when the parser finds an error

Changes in v2:
- Update for merge_fragments() returning true on success

 dtc-parser.y       | 2 --
 dtc.c              | 2 ++
 tests/run_tests.sh | 5 ++++-
 treesource.c       | 5 ++++-
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 0ff04c7..33a0078 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -103,8 +103,6 @@ sourcefile:
 	  headers memreserves devicetree
 		{
 			parser_output = build_dt_info($1, $2, NULL, $3, 0);
-			if (!merge_fragments(parser_output))
-				treesource_error = true;
 		}
 	;
 
diff --git a/dtc.c b/dtc.c
index e506837..73e5d76 100644
--- a/dtc.c
+++ b/dtc.c
@@ -299,6 +299,8 @@ int main(int argc, char *argv[])
 	else
 		die("Unknown input format \"%s\"\n", inform);
 
+	if (!merge_fragments(dti))
+		die("Unable to merge input tree\n");
 	dti->outname = outname;
 
 	if (depfile) {
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0aaa29c..8391717 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -741,7 +741,8 @@ dtc_tests () {
     run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.test.dtb
     run_dtc_test -I dts -O dtb -o dtc_tree1_merge_path.test.dtb "$SRCDIR/test_tree1_merge_path.dts"
     tree1_tests dtc_tree1_merge_path.test.dtb test_tree1.dtb
-    run_wrap_error_test $DTC -I dts -O dtb -o /dev/null "$SRCDIR/test_label_ref.dts"
+    run_wrap_error_msg_test "Unable to merge input tree" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/test_label_ref.dts"
 
     run_dtc_test -I dts -O dtb -o dtc_relref_merge.test.dtb "$SRCDIR/relref_merge.dts"
     run_test relref_merge dtc_relref_merge.test.dtb
@@ -805,6 +806,8 @@ dtc_tests () {
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-parse-error.dts"
     run_wrap_error_msg_test "merge-parse-error.dts:15.12-15 Division by zero" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-parse-error.dts"
+    run_wrap_error_msg_test "Syntax error parsing input tree" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-parse-error.dts"
 
     # A labelled reference to a node in a plugin adds the label to it
     run_dtc_test -@ -I dts -O dtb -o merge-labelled-plugin.test.dtb \
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

