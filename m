Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827139;
	b=dELt6crqo1uVQSH8Tqn1RXRgo/cXoZ5QxrHBOgzWUIpigzq1MvFl5VlU3klKynxoypmc
	 TNgp+gYhCq+O0aO3GS3zU9pThIwF3nd99+D57HILnDSoO9suROAPf656uEhVHnvEXOtGR
	 zwRqapI+yuCpe5RIssy2Nse/BboKjDgBFqcL0OVS3EJDMwKcHygCEvZbBVrIBEf+sPaar
	 RYguTfKCh5qsPpl5uxM0CJVLe/hsI7el2Kdic/dZ4J9EF5ADzAYE0ftw3mbN371MmMCqU
	 dIoRbblwYuuCKpeqncF3wMe6Bx7OCAlGmFqH943LGDNg+CpV8OxbfgApeqwjKSL9B9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MZ7aqd/GmaG16H5MF5PbqplLHmQQs/eaSPOW1laYAVs=;
	b=Mo9tivZrat61FwzE/2MG/851qhyPL58lo2gacjrqeij7gZ7FWW66+SbAkCHYT6Jhzi/f
	 oCLI+XUy2aBAQ74Pvng/HFjJVDpCClP6VIip+wS0KC7WbVez6rtGlVMhTl7DGnyE28CC/
	 wFOfGMO9XEBvgzwBGb3inY4gWg/U2tJzKbIux8h/6R/P9cFS12bF3dg8StomjGiLTNgit
	 VS/1ZLshHvzfdIW9Bc+3Wlb1Ayo9AuRvKSpOrzS1jfso5604zPDpZF4mqPq3YACdGKLRB
	 UUeK+T53+bMIs3AnyKOR2Th8IcL76Aj6KS3cU4liDU9/kwh3DQkDaO+YlEWDTCJDLNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GQAOOPDj;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1025B606A871
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1025B606A871
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GQAOOPDj
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6ddef424972so940239eaf.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827138; x=1794431938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZ7aqd/GmaG16H5MF5PbqplLHmQQs/eaSPOW1laYAVs=;
        b=GQAOOPDjew11owXIo3F0WtIgQlDdS6wL8B2OJk7zoW8hEPT/2dYVUqfQw6Ay2q7qYG
         gP4C6UzM0Vm6DrEvPsWXSLIVieCIDD9lzoUuBaj8hxj19vbSun2BaF40wDEDNouI24VB
         ovVbI6NmRghJYzDdUyAahHJlHI5U9ybVcV34M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827138; x=1794431938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZ7aqd/GmaG16H5MF5PbqplLHmQQs/eaSPOW1laYAVs=;
        b=AGlFhby4nGIxMHNPjWFjQGvLqhtRZLpdFqO86p++P1+rgKO1mjc5YQYSzU/R+Wqkiw
         MXRTZxxujKopR4KrR9U6gqSYnEStfThN2lYQsEMUrsE9AVhjKxER7kLhHvy8Gcn9YT7Z
         X2g0ot5/+8xUvFNC0f85WPCqB1tq/gAOutft0rvYpt+nzYI9qYNukcPbiblD1gTjIbDP
         mAvhP/OaHj0R0Y7MxoRzIRqpbM9yD11mjGijYpvv73nw4InuWBRCbFWFULuTNDvqIj6/
         4irhTe86VTkIVVmXYKuoWqdCuRDfXZMkQJN45xOOjbAXb4BM9BoPdQsVYNg6iNL/8f1N
         eNZQ==
X-Gm-Message-State: APuU4Z+IXaqmXDFr3foTD/CSC5ssrfVcgQznsvgUDRMhXaKnE9a9jkr/
	zeDo0RwXF+U7VIjVZeXEVPxdSW8UfwpYqLykM1CC3JR8othewuMtd3r1pXvQFw8piIuCCx1wjSY
	ld7dyRw==
X-Gm-Gg: AYBFou2uKstAl5e1x2hOUjd7wdc+820zMtkpjiJD2r29L4gub63XwEbqbHKKE4GXj+2
	MTWzxibWqU5i1b6uTsxwKj/THnsUIrmU6YtnzmSHQcQ99KfH5TIAJcZhMK5g2yF+N0CQJ4yZPXO
	tcUlE0hEpz+wvwdoprexX+9B2B2sZIEIkjMj78K4iAAyxz+w4XJU+vDzha0mewSGnygMtqoIGwn
	szXp6ehi7gRNjQcgit5etZVAE0twW3p+pJzQq95RKDwVcmFltoSN0OlkU/bFtzTuzD7/aDn36E6
	joYwTi74Yz9jDwLRnfcsDLJOVBn/xqYhQOasPchVQbfBvq7vv7MN9ERH+3WUT6BZvS1T4eNf+sv
	EqrHYzLYhF1DEsc8VVjcUaIfGrPjbsxOPEqoqFMlQn+iooNl7tpvBXEptJk8B4+8IwKymXNLXmz
	3FwKc33MoW3JqgZTn8P7IwkZmtSS4hhVB5klxC/axAkXlh7bOkPgaF4QNeN68CTe7g/OnsLitNv
	2wCZv95XcEZgs579ZOvlnY7ISc3L5jWFlP0ogs/5QytVTQPx53yd8ZX3rH641nJyZSlpEMwSo+t
	d07jLrbCYAxvwLlVg7ZTJ9ZcMDlkm+dfHjqRj0jNqp9Sv9k/eBKxIZ34USm+UenOoddJNcnZUIF
	a+x6pRTc9qfmiNXP2XVUz7w==
X-Received: by 2002:a05:6820:f004:b0:6b7:8415:d790 with SMTP id 006d021491bc7-714f2a3edadmr9670758eaf.59.1793827137944;
        Wed, 04 Nov 2026 13:18:57 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:56 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 15/15] dtc: Merge the fragments of a dts file in main()
Date: Wed,  4 Nov 2026 14:17:54 -0700
Message-ID: <20261104211807.972610-16-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104211807.972610-1-sjg@chromium.org>
References: <20261104211807.972610-1-sjg@chromium.org>
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

Changes in v2:
- Update for merge_fragments() returning true on success

 dtc-parser.y       | 2 --
 dtc.c              | 2 ++
 tests/run_tests.sh | 3 ++-
 treesource.c       | 5 ++++-
 4 files changed, 8 insertions(+), 4 deletions(-)

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
index 4661216..12fb054 100755
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

