Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D2C20D4E9
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Dec 2024 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733408416; cv=none; b=OSLIowTMRkBoZVF4kbd12KjUSDqSPgBMSk7CCz/vfyquUFjTIpS8bJUJS8KUCZYlCa15WPaFNp4xnlyYA/Zaw3VvR30urSieIj40rR+FVdjcLM/2R50F61+1sKOvWGOSHxD1A88UGkqAQsI3/YBWohsizwpFMbQYmeCZUIfuHwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733408416; c=relaxed/simple;
	bh=idSvWkQdkWgnDFwywFGgdhsRcUals+FAYw9pScmU86c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r+4/zwMy7rQLirn9vb2sVT1oSNEjKlRQd29ouWgIVj4c4xbzGJcJXBpeJqr+QM8JSIKjbHMVJHa9KUYLUvB6MKUCPVAI2kgTkIXbNNiX05dZFVv9yVktU6ymA4Q56JUUcz3ZkGCTquI1jBsb+rqN8C6rvE4psIwUosN/SgsELuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=ierIy0SW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="ierIy0SW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21577f65bdeso8088185ad.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 05 Dec 2024 06:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1733408414; x=1734013214; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tPPSLR7caiqQV3tjGnrtGjy2z1VtsNPQz9/y9fi5sow=;
        b=ierIy0SWqVOMhpr3HeBz+QndT0NI0K2A604Ct51IHOurXl1bkxS7OLEXSby3GjQZV4
         vCbIhzxGdTSBofLLZ/ULVCL61r+D8cPmPVGGwxAfStwU6tV5Gvtv0byh8w8w/DMHT2sU
         78+MzgLZvMbo6cMbTHlxOOJ4imdkXVjyVgElKk9v8RQbVaSk/pBSsxNB0Ujiw7HYJyZ2
         C0ACSubCP47cQ3llPixsmLLf/lS//iNVG022r77p1e58dVdkhacmQFZrkH7tuGanTEw/
         94HbKjCL5BggiKRxvYTx5Scg8ZxET8hsyhQ8qojLJyl2wvBggW37xxVWvJVh/Kz3o9Lf
         wxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733408414; x=1734013214;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPPSLR7caiqQV3tjGnrtGjy2z1VtsNPQz9/y9fi5sow=;
        b=C1wqdxkWEER6xMxax4YBUaSzyJPQkHhh6a5mJUASaGNCs+FHVsXLRYRNtAooEUVCyA
         jWYXMOIQgMpKKIu6zd279ZJFJMKcnxAxpYrHmpbZvegTgNB/SyXzetIC6fctZeS+mo2Z
         50c8Wqt4YQtyeV+Cspfaxe8h0oiJTCJKy01n1jmv0AVA+tK/PiaSBTUyJuET8tcjinZd
         Z/RHImtqrMUWR8u9OSxTuAH2CI0jdxtkLIoeEQxtluts8Ts2iBOKdfii4BOj6grmx1zc
         9W5rZzux7DP/hTiaXVaDFAzXozNcF5n7SU60y/vJSUX4p6TkYV1zPhXlTDXsvrGkFYw6
         s0Xg==
X-Gm-Message-State: AOJu0YyyDw2/999ZuWfyt/FbjcGxZC7i8uyCJTyk3eprxCiyGvVu++t2
	HNKm978fdts4IXwCfs/wegtUXXqzm9m9/HQ/WQoKrxkJOd28/bVVQiLhaZBtWQ==
X-Gm-Gg: ASbGncu1IzyNQQsT6aX32u1OrrXTNU3iSBGihqfuCC4Ob8PNc7yoSS7+wMD+5AbY5b+
	XB2vjvnL0ZM/kMV94ftQcpIYrDZ00QcwGEfbjP3Qz1p7kK0lfVqwRb3MQS4g/6KINol1LcICo2Z
	fb4ng9RkqyS3iacZitJecRVRrTMphQf4S1Mh9SUMuWWfRc9ezY3oL/E3BLYs2Kz3exfvnyu1+H5
	NcIbiy3s95ivPmPrcqBRLIHjvtQ+EeYCygTuzRviklc8OtlhPhV4LxN
X-Google-Smtp-Source: AGHT+IFMXG5bEDPgjBiLIvnZEH/04DPc3qK9KDiOl9D1E3BRdB31KhWCzBQfFQzxHjz2xy80W7bTYQ==
X-Received: by 2002:a17:902:ccca:b0:215:7e49:81fd with SMTP id d9443c01a7336-215f3c69a05mr46469475ad.7.1733408413679;
        Thu, 05 Dec 2024 06:20:13 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e3f749sm13115185ad.44.2024.12.05.06.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 06:20:13 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 05 Dec 2024 19:50:02 +0530
Subject: [PATCH v2] Add clang-format config
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-clang-format-v2-1-07d21007bdab@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAJG2UWcC/3WMQQ6CMBAAv0L2bA1bAcWT/zAclnYpTZCSLWk0h
 L9buXucSWY2iCyeI9yLDYSTjz7MGfSpADPS7Fh5mxl0qSvUZaXMlK0agrxoVbq+NNbija6mhpw
 swoN/H7tnl3n0cQ3yOe4Jf/bPKKFCRbbFsjaEbcOPnslN3AcSew7ioNv3/QuxnXoqrgAAAA==
X-Change-ID: 20241204-clang-format-2536dd18a7c5
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5293; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=idSvWkQdkWgnDFwywFGgdhsRcUals+FAYw9pScmU86c=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnUbaZa4O22hvcH5Z1P5b+AnuO+gUCDklDVY5K9
 N0OE6OJiVuJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ1G2mQAKCRAFzvXHieVa
 dMznD/9vqp8Z7c2IxyYiUgLi2rQLbpgojWeROdecu/mbZ2XKeUobpzbFootmFqZLXKbA+jju3aa
 BPhKanyAV9nuNMOq5iOeMQHxQkcjG7Z6WXjMOv3JPBFZ7W1fDXLaR9ZcFE8t0WwlogaNpzEArln
 BkTZSh5lsJybvGJOzNqBvV1Qenf6HOf3tQZ+r/00OOm7l6z4fEeUbDD8pnzYikJxCjMyXri31K3
 a7HnzRYMFjWY4li0fw2Tm7NvA0QRVvyzRuoBtCkBg/H7yUPbLn//nSQKQ+lTWxmUB0DDuxUCO08
 3kQb0aCwOqP6bugwT5YM+HH2ZaoQOPh+li/YbWt6LU2E1HicaS/DYA1+QavYuKS1OFq8Nci37yU
 k7FbfhlwgAwfq/1+xtXTgyKLKNskaV85GMDxaKU+19762uGqVQOfj35J/kr9/GH8PjtvNaqpq8K
 cN9gQnEyV5Jn8zukQeWHepIO7tVhV2bBhknX67j0AOVzYfS6pl1W19NTZ7WbNRAN1HcJwSz+7Do
 mVs3kdeF2M4pPfq1sH8tp6Dl2UE+meMG01mbENN7UTtV6eV6a0Z53u9+WhAhDmYnCVEbiSO7ypJ
 MwaHmDIidtipcabonimvnZVNbVLl+0tOHC1omTWFJ7XUlDCP7G2/0oUhTDXw2c+QThMqQEw4DUS
 T+M3elBaHfTAIDA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add clang-format config based on Linux kernel clang-format config.
Allows for consistent formatting rules for all future contributions.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Derived from the discussion in the following patch [0].

[0]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#m1f35fa93f8fa2d38d9c6c0e6eaf7718d69b4a7a0
---
Changes in v2:
- Update ForEachMacros list for dtc.
- Also update the command to generate the ForEachMacros list. Not
  specifying any particular folder since the dtc source is pretty small
  and header files are spread out.
- Link to v1: https://lore.kernel.org/r/20241204-clang-format-v1-1-ad9105ca196e@beagleboard.org
---
 .clang-format | 135 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/.clang-format b/.clang-format
new file mode 100644
index 0000000000000000000000000000000000000000..e5d1518bd42c9ff296731c1593d94511a7d82044
--- /dev/null
+++ b/.clang-format
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# clang-format configuration file. Intended for clang-format >= 11.
+#
+# For more information, see:
+#
+#   Documentation/dev-tools/clang-format.rst
+#   https://clang.llvm.org/docs/ClangFormat.html
+#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
+#
+---
+AccessModifierOffset: -4
+AlignAfterOpenBracket: Align
+AlignConsecutiveAssignments: false
+AlignConsecutiveDeclarations: false
+AlignEscapedNewlines: Left
+AlignOperands: true
+AlignTrailingComments: false
+AllowAllParametersOfDeclarationOnNextLine: false
+AllowShortBlocksOnASingleLine: false
+AllowShortCaseLabelsOnASingleLine: false
+AllowShortFunctionsOnASingleLine: None
+AllowShortIfStatementsOnASingleLine: false
+AllowShortLoopsOnASingleLine: false
+AlwaysBreakAfterDefinitionReturnType: None
+AlwaysBreakAfterReturnType: None
+AlwaysBreakBeforeMultilineStrings: false
+AlwaysBreakTemplateDeclarations: false
+BinPackArguments: true
+BinPackParameters: true
+BraceWrapping:
+  AfterClass: false
+  AfterControlStatement: false
+  AfterEnum: false
+  AfterFunction: true
+  AfterNamespace: true
+  AfterObjCDeclaration: false
+  AfterStruct: false
+  AfterUnion: false
+  AfterExternBlock: false
+  BeforeCatch: false
+  BeforeElse: false
+  IndentBraces: false
+  SplitEmptyFunction: true
+  SplitEmptyRecord: true
+  SplitEmptyNamespace: true
+BreakBeforeBinaryOperators: None
+BreakBeforeBraces: Custom
+BreakBeforeInheritanceComma: false
+BreakBeforeTernaryOperators: false
+BreakConstructorInitializersBeforeComma: false
+BreakConstructorInitializers: BeforeComma
+BreakAfterJavaFieldAnnotations: false
+BreakStringLiterals: false
+ColumnLimit: 80
+CommentPragmas: '^ IWYU pragma:'
+CompactNamespaces: false
+ConstructorInitializerAllOnOneLineOrOnePerLine: false
+ConstructorInitializerIndentWidth: 8
+ContinuationIndentWidth: 8
+Cpp11BracedListStyle: false
+DerivePointerAlignment: false
+DisableFormat: false
+ExperimentalAutoDetectBinPacking: false
+FixNamespaceComments: false
+
+# Taken from:
+#   git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' \
+#   | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - '\1'," \
+#   | LC_ALL=C sort -u
+ForEachMacros:
+  - 'fdt_for_each_property_offset'
+  - 'fdt_for_each_subnode'
+  - 'for_each_child'
+  - 'for_each_child_withdel'
+  - 'for_each_label'
+  - 'for_each_label_withdel'
+  - 'for_each_marker'
+  - 'for_each_marker_of_type'
+  - 'for_each_property'
+  - 'for_each_property_withdel'
+
+IncludeBlocks: Preserve
+IncludeCategories:
+  - Regex: '.*'
+    Priority: 1
+IncludeIsMainRegex: '(Test)?$'
+IndentCaseLabels: false
+IndentGotoLabels: false
+IndentPPDirectives: None
+IndentWidth: 8
+IndentWrappedFunctionNames: false
+JavaScriptQuotes: Leave
+JavaScriptWrapImports: true
+KeepEmptyLinesAtTheStartOfBlocks: false
+MacroBlockBegin: ''
+MacroBlockEnd: ''
+MaxEmptyLinesToKeep: 1
+NamespaceIndentation: None
+ObjCBinPackProtocolList: Auto
+ObjCBlockIndentWidth: 8
+ObjCSpaceAfterProperty: true
+ObjCSpaceBeforeProtocolList: true
+
+# Taken from git's rules
+PenaltyBreakAssignment: 10
+PenaltyBreakBeforeFirstCallParameter: 30
+PenaltyBreakComment: 10
+PenaltyBreakFirstLessLess: 0
+PenaltyBreakString: 10
+PenaltyExcessCharacter: 100
+PenaltyReturnTypeOnItsOwnLine: 60
+
+PointerAlignment: Right
+ReflowComments: false
+SortIncludes: false
+SortUsingDeclarations: false
+SpaceAfterCStyleCast: false
+SpaceAfterTemplateKeyword: true
+SpaceBeforeAssignmentOperators: true
+SpaceBeforeCtorInitializerColon: true
+SpaceBeforeInheritanceColon: true
+SpaceBeforeParens: ControlStatementsExceptForEachMacros
+SpaceBeforeRangeBasedForLoopColon: true
+SpaceInEmptyParentheses: false
+SpacesBeforeTrailingComments: 1
+SpacesInAngles: false
+SpacesInContainerLiterals: false
+SpacesInCStyleCastParentheses: false
+SpacesInParentheses: false
+SpacesInSquareBrackets: false
+Standard: Cpp03
+TabWidth: 8
+UseTab: Always
+...

---
base-commit: 6f183c7d9246bde8f05d2edbc31fdd497c4a8702
change-id: 20241204-clang-format-2536dd18a7c5

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

