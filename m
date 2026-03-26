Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7FD1C69D
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Mar 2026 00:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774484033; cv=none; b=cuEKOhncjnvx14IYiR5r/j1Ms2n5iNmuy5hBC+iOyxOOnZxciGVQJHgfC3JY1MVWGeg0UjHLP58c2I+FtPp+KqMvwf/ybU+GnvsL6HevtKuVDiLd+I3lWFdc262ZxJ8Jzf+lQaO1ay+r+nXgnr6tCc1KCkVSfuKo2QeP/NZx1iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774484033; c=relaxed/simple;
	bh=sPru7jVeJVxWvKdDGn9O8w435kTF3NtWUhjJmYx7AG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mQTxH9FphiNOiCQb9Uobx6zkJD/tviM2DzcCyCRjZccb3W3YyzVWfIYWgzLW73uEyL47X62hyVsDHH8LnBNf7eyvvTQHiOqK/NaObHFKdrdhh4FU3/caWtzSMKfS7h/kNS/JN2jGU3RtBJTeibHQhbfrLqG2SfwYuwPlDjlwacg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJAL24LM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJAL24LM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455AFC4CEF7;
	Thu, 26 Mar 2026 00:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774484033;
	bh=sPru7jVeJVxWvKdDGn9O8w435kTF3NtWUhjJmYx7AG4=;
	h=From:Date:Subject:To:Cc:From;
	b=NJAL24LMwouS9PvOzhgbym6XqdhYjCVTnWUQkj0zOe4u1xizmznGl3hAvUb6A1bms
	 9ifTP8hKXH4S3BDjmSy63P+DOe8kLn+ZvjjiZtwAkhAq4W0pDaJ5zFHIn17dM1/Iwu
	 42KH8VInDa01RCw1cZuvl/ngXYTLVFj5R7qbBytkRA6oVf3ZX2rcX6nr347yxbrFex
	 ey5TsNL68db/frjNZli5vipvDXgWgmSzW+UY0MbYwyuTsSShXqPCA324nmFFzlRaO6
	 B2wnnGRsuWV2SwF0X9b3BWcXObO6tRavjiXMgDbGZUVZCFQ31V0RyLGPVm0I3Ib93Q
	 eJvPkhl30XcAg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 25 Mar 2026 17:13:44 -0700
Subject: [PATCH] dtc: Remove unused dts_version in dtc-lexer.l
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-dtc-lexer-remove-dts_version-v1-1-0b5d64903bbb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW5g28yLXiUidPdsjZTGjC6C+
 O6tdfkfON9KBhUYXaqVFFlMxqHE8VBReLbDAyyxNHnnG3fyZ45T4BcWKCveY0YZ7J6h+5Fjl1w
 KsW4RairER5Fk+fHX279t7nqEaTdp276bQLIygAAAAA==
X-Change-ID: 20260325-dtc-lexer-remove-dts_version-dbf0fcd4aec4
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343; i=nathan@kernel.org;
 h=from:subject:message-id; bh=sPru7jVeJVxWvKdDGn9O8w435kTF3NtWUhjJmYx7AG4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlHquzXKOxUeBkcdX/KT0FRPu736Uz17KxLL+Xv2TF7Z
 iBH75uUjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRqbcY/untqZu4liM7Vs/j
 imSeUk99c/Q3i319uW2RMR3bu36H6zH8LzjTlKmt2i+7SvHe79s5WftDNx12/DMjujF6m9t7AaP
 b/AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

A recent strengthening of -Wunused-but-set-variable (enabled with -Wall)
in clang under a new subwarning, -Wunused-but-set-global, points out an
unused static global variable in dtc-lexer.l:

  ../dtc-lexer.l:42:12: error: variable 'dts_version' set but not used [-Werror,-Wunused-but-set-global]
     42 | static int dts_version = 1;
        |            ^

This variable has been unused since commit 4e1a0a0 ("Remove support for
the legacy DTS source file format."). Remove it to clear up the warning.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 dtc-lexer.l | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 15d585c..1b129b1 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -39,8 +39,6 @@ extern bool treesource_error;
 #define DPRINT(fmt, ...)	do { } while (0)
 #endif
 
-static int dts_version = 1;
-
 #define BEGIN_DEFAULT()		DPRINT("<V1>\n"); \
 				BEGIN(V1); \
 
@@ -101,7 +99,6 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 
 <*>"/dts-v1/"	{
 			DPRINT("Keyword: /dts-v1/\n");
-			dts_version = 1;
 			BEGIN_DEFAULT();
 			return DT_V1;
 		}

---
base-commit: caf7465c5d60a56e00ea8c6b6eeb4e443371f815
change-id: 20260325-dtc-lexer-remove-dts_version-dbf0fcd4aec4

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

