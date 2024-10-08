Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646BB179954
	for <devicetree-compiler@vger.kernel.org>; Tue,  8 Oct 2024 21:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728423721; cv=none; b=h/d/HsfsGjsw7VlkL7NAlkLvDhahmQ9HGBxxI7wgySAxc21aW2oK0haQsW1jyiirhTNdhW8vX6UesOhSJFcfCmW7s6q+8puErwlfkOL2KXbb1hHRm8gTREHFUUMGtnRqi6LNcct2trgR7JCg0xm9AUad45c7GfrK191/UUKQujY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728423721; c=relaxed/simple;
	bh=R8cfDHOlIv8FQr6gRbhYOdcHtq8TGXV0P8gINVY+tg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h63GGtCrYQSTHZjBcQqmGhT/zJMLhwdTVe9/skwjcaWUarTIaUn77N8wB1eksfwAT8hPdSU5o+QqBpC4+M/mg1KcTinCST0+sU4jRQkM21P+M6GuWGIQJnN87aTzTx0W+kts3jwCpfzTKZxnq6s/jdNom9x2bettA2uZvHBjXnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FBal3Nz4; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FBal3Nz4"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-45ee18f058eso7987381cf.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 08 Oct 2024 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1728423718; x=1729028518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHIYxKXobTc4k1BDGDUpvN/vl40GdP+ETuv5AbD7u68=;
        b=FBal3Nz4ueUVsojG0ZTXiT0n1m6IOdY6DFvQ7XIa/E/f6Tc2/y7N42mJ9etLBNQRKZ
         ZKm/3M6ECfAwwEYiIZ3WrGFondCHhLHa8uyDiIiA+BEbOZ7QoNf8JU852SJNkqMviZLz
         /SoxbsWYJiC0HuN7Li+3nMEZeZAs6IzboDORY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728423718; x=1729028518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHIYxKXobTc4k1BDGDUpvN/vl40GdP+ETuv5AbD7u68=;
        b=UdzYQ/AJ8A5exbKtAGuHTdq6cX2+s3McnBOA5XBkR16tReSI7ntqrtD5zxquGWef04
         oNTrdxRi+SwvxmGqWPt7Osd05vNwozeYWCRM6006sf8SokSlh8LWTRFR/mfiI7BAiYtt
         g5GS/EZ2nTyYggjYIdESc4fv3Q3FZnjGs9VdHgqbdDVhY6W6AnPwlzM9EIQnB7LeuqNr
         ZfZH0o8LJKqGZsE87LqZxJuiVWxz+YpYtrh597tIpSz4wqYQExm9IT1GCaQkHhYghggY
         UfnUFw9SE9M7PNhKfTRJuUGeiQXgfd123tnKaLGmwoBI56ghQTvI3E1fEJ5bc9TcThaC
         ev5A==
X-Gm-Message-State: AOJu0Yyowv7Y8+s1hpUV/mnADg9CG/jqT+ttJ/H/ocUXt9PT/BGnkTE6
	QM5LuEwKpKnduVg+hZqRnQ2LSjeC7CMteT6TCDD70DqgPQQw5aZKz7D6n0ICdw==
X-Google-Smtp-Source: AGHT+IHBhtJ3EoIWL0NtiXoFTti5vqkwyNmqhneHC8hnV4l8I0hBJAn+VpYfBHMMw8fgJNEzyYH40Q==
X-Received: by 2002:a05:622a:259b:b0:456:87c1:59c7 with SMTP id d75a77b69052e-45fb0e768f4mr3906041cf.57.1728423718308;
        Tue, 08 Oct 2024 14:41:58 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da763fe1csm40268941cf.85.2024.10.08.14.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 14:41:57 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
	id 0AB26D84; Tue,  8 Oct 2024 14:41:56 -0700 (PDT)
From: Markus Mayer <mmayer@broadcom.com>
To: DTC Mailing List <devicetree-compiler@vger.kernel.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 1/1] Makefile: only use compiler flags when supported
Date: Tue,  8 Oct 2024 14:41:32 -0700
Message-ID: <20241008214134.171436-2-mmayer@broadcom.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241008214134.171436-1-mmayer@broadcom.com>
References: <20241008214134.171436-1-mmayer@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to check if some compiler flags are supported as not all
compilers may do so. For instance, "-Wsuggest-attribute=format" is
supported by gcc but not by clang.

Using a compiler option that is not supported will most likely cause the
build to fail, since we are building with "-Werror" and the compiler will
issue a warning about the unknown option.

As a result, we only use the option if the compiler understands it.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 Makefile | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f1f0ab368cd3..febdca5742c5 100644
--- a/Makefile
+++ b/Makefile
@@ -3,6 +3,26 @@
 # Device Tree Compiler
 #
 
+# try-run and cc-option were stolen from the Linux kernel
+TMPOUT = .tmp_$$$$
+# try-run
+# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
+# Exit code chooses option. "$$TMP" serves as a temporary file and is
+# automatically cleaned up.
+try-run = $(shell set -e;		\
+	TMP=$(TMPOUT)/tmp;		\
+	mkdir -p $(TMPOUT);		\
+	trap "rm -rf $(TMPOUT)" EXIT;	\
+	if ($(1)) >/dev/null 2>&1;	\
+	then echo "$(2)";		\
+	else echo "$(3)";		\
+	fi)
+
+# cc-option
+# Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
+cc-option = $(call try-run, \
+	$(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+
 #
 # Version information will be constructed in this order:
 # DTC_VERSION release version as MAJOR.MINOR.PATCH
@@ -18,9 +38,12 @@ CONFIG_LOCALVERSION =
 ASSUME_MASK ?= 0
 
 CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
+# Warnings where we need to check they are supported
+OPT_WARNINGS = $(call cc-option,-Wsuggest-attribute=format)
+# Regular warnings
 WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs -Wsign-compare \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow \
-	-Wsuggest-attribute=format -Wwrite-strings
+	-Wwrite-strings $(OPT_WARNINGS)
 CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
 
 BISON = bison
-- 
2.46.0

