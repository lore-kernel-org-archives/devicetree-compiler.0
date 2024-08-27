Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489421CDA3C
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Aug 2024 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781298; cv=none; b=MYbzelx99QofyVxSTXZkErTS1gQl9ytb9F6sfHZb9jPs0K3M2TRgP1mGecDq74vqw4Fz/GmU/Ze07tXh0QFM5w8c9Dq2QLrL4vmJRuFt2w/gxMRcD/xEgdu0n8nYmoC3WIbdznlQat4T1sipQejAkd/korC61bJXVunpCCfsOTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781298; c=relaxed/simple;
	bh=VZVElmYvo81XZC+Owb0lKOL0se7Jd6xpaMqo3aslLUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3hV1nCpqLxyusfA9xVtaBCUtig/qklM0AFnXRT3gUsLct/ss4n12Il+rXN90fDtcX+yWwMJdpqgquHyw24VDnLGiOpbgG1Lw2DgeEtkhPT0OslTM4wShIY7v0f8Dc2sMgG2QxV0GTSILiyuba/GuRC1N2ZxVWl7K7lYd1zAS44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=yK3Q0TmD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="yK3Q0TmD"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20231aa8908so46355415ad.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 27 Aug 2024 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1724781296; x=1725386096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crXNeby222Og7vf8hxmd4TNZaTu30RjPqSm/7y11/YU=;
        b=yK3Q0TmDaNzC7kX4bBUfiTDDQ3x4XbqB1sMTQO+bHpxiEwmTxbpZKNMVuN4/U+Cee9
         dWOkE7To9sn4hHMkvSlMCdOyUh67GQ1b9Q+bPJpv0up6qD8SyBUSE1TPRc1q9P/5Q8g1
         pNzQvnlvtmrYtEy1fEantq160Bbcl5F+zsOSOKa8i97btG38G1o5nOo4U1YhhEE17LAu
         8vLLqk9LPnhJoydCrwq4IwV7NKcvCEyw2mb4onrDnqTAj8h1nOc88BvESZNJgOOBuPH9
         JwhttoKvldmNtIUR8EpVawfJALS831imY/IG8yMLmMan1syrd1eE2AmSeF7ujKQC2tac
         MimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781296; x=1725386096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crXNeby222Og7vf8hxmd4TNZaTu30RjPqSm/7y11/YU=;
        b=L0UPOVaPNbFFR0HxZERZCIXuCIz38SifZ9PimB94Bz4sa8FoecQVqVUbue0vvIxLgX
         4yvM09PL20horE33SN2LZJ+qA5T13JDxkJPT1IkbxmsWOXOeC2TdU5GANmWUNdOAk5SG
         WZ3jjb2jkZMOUlNMmaz4oXoCzTNfP4AoBQBn1h/8RRH/V81Ai/BHP2jJI3qZhakte3p9
         mHgzpFmBtEclR3+Pman+8rpPUPH6HDOMrVz1PF8sHxQBGnxvvF3HNw6SuGhgzLCXKpjv
         O4+I9ClfRi5/oOPWSwh/CmHxOUfaOL1gIwmi+0JAq9x24mQG9PAP4T8SaMrFDnTNb6JC
         ehRA==
X-Gm-Message-State: AOJu0YxRKewo1qDujnSEiMke65wFCQdteJHo19K+U+jY7m729u84DfKg
	R5kobYZ+eYnCibjLTScv3Ld73Svz5CH+aWkcSmn0+q1zm70DvJDYLhKkQvecNw==
X-Google-Smtp-Source: AGHT+IHPDbN+EFPFdBQDqlxt6tgwCHbYHkzN6O8vNW2fulbAZ+JXsUfvUp4Cx99XHN2pdrUS/z/M3g==
X-Received: by 2002:a17:902:e5c2:b0:204:e4c9:ce92 with SMTP id d9443c01a7336-204e4c9d171mr34876985ad.22.1724781296444;
        Tue, 27 Aug 2024 10:54:56 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dbf9asm85763235ad.179.2024.08.27.10.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 10:54:56 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 27 Aug 2024 23:24:25 +0530
Subject: [PATCH 2/2] tests: Add test for append-property
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-append-v1-2-d7a126ef1be3@beagleboard.org>
References: <20240827-append-v1-0-d7a126ef1be3@beagleboard.org>
In-Reply-To: <20240827-append-v1-0-d7a126ef1be3@beagleboard.org>
To: lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=VZVElmYvo81XZC+Owb0lKOL0se7Jd6xpaMqo3aslLUA=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmzhLljyoJ8yrVOeUYI0x78CfUBT65C0Ontm4V1
 rrc4rmP42KJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZs4S5QAKCRAFzvXHieVa
 dEjaEACzNTEWXGxMpghsjV5+vSykJtD0BGQVmVteDC12d/ClNqJWlhfNYEeympY+jKQbrEI3vuL
 qaEFqS9xKRXBkvWkiMx05/KlJYA/sx4Z/wXtu4qspyX/P8DYRhI14HlbXVfW2nKtb7c42iUg3kJ
 93VCAyVz5L6kl3VFu8qiDzTCI36xt9f4XoKGTMin9DoMJQs+etYVeEFKCYvfNmMpNdApjOm5EUN
 Xz1Lxaxu3t8jwUIgIsmrMmK2VFJGQkvpzc2xoHe2W+b/fq/gQfw/rJV5EYCjz5HDL3PPB/9x7+1
 DTE8E2JZDvSLhgQPiCHUUz4eWkBHi1qoSOnfIUsTS5DTAFmR0i76qfiORH2TcGjBh9JFeu84qEC
 H/UQHlibJZUlvw4/i+rMM/Ba+IZZz3+U521zQpFdMScO2OOw9foA2bHEaz13olCMdRw9MpHvqlM
 MYHKL85W+nT1znxpXerQANLMCXJM/oj2rumsAcvpIOTwX2HGz+9fA94B6dgiDpXjIt6GOeT8uRQ
 3X+T2OKY2+2bv2wP+BdTM5/+m4JLSF5GgteqXZOY+++xaujmAp31fnYeZRHL5zqOpz93f//nMbX
 xaEUkRjttWb7KqfQRyXzIvec4kvvSlQsoddn7R8Raa6xKcNArhy2cwtPJvgj7IWjWgIP32WMWaS
 qARLZR7u4XszSGg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Simple test to build a device tree with /append-property/.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 tests/run_tests.sh          |  3 +++
 tests/test_tree1_append.dts | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 937b128..ac0dc05 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -708,6 +708,9 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb "$SRCDIR/test_tree1_delete.dts"
     tree1_tests dtc_tree1_delete.test.dtb
 
+    # Check prop append functionality
+    run_dtc_test -I dts -O dtb -o dtc_tree1_append.test.dtb "$SRCDIR/test_tree1_append.dts"
+
     # Check omit-if-no-ref functionality
     run_dtc_test -I dts -O dtb -o omit-no-ref.test.dtb "$SRCDIR/omit-no-ref.dts"
     run_test check_path omit-no-ref.test.dtb not-exists "/node1"
diff --git a/tests/test_tree1_append.dts b/tests/test_tree1_append.dts
new file mode 100644
index 0000000..953095d
--- /dev/null
+++ b/tests/test_tree1_append.dts
@@ -0,0 +1,21 @@
+/dts-v1/;
+
+/include/ "test_tree1.dts"
+
+/ {
+	nonexistant-property = <0x00000000>;
+
+	subnode@1 {
+		sub-prop = <0>;
+		str-prop = "0";
+	};
+};
+
+/ {
+	/append-property/ nonexistant-property = <0x00000001 0x00000002>;
+
+	subnode@1 {
+		/append-property/ sub-prop = <1 2>;
+		/append-property/ str-prop = "1", "2";
+  };
+};

-- 
2.46.0

