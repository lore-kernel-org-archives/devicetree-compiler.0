Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709214A0B3
	for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723388584; cv=none; b=kIvrCY1SNVgQ3F9E381m5YP0briTg5hK8y8zXUk/UagxQlbAfvbEBFvhoNvQXaqZs26jDwJoweLHr++/9D9KIAN5ePWaqKsF3Ysdu8DJ6lFKRCqQbF6rsHetuwaeHFphLW6hknY3RTzmhWU7njf4QB5URj37+bhxsAP9c51WBSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723388584; c=relaxed/simple;
	bh=f8dN4WbllhD6ZIgt67p8wu3E3bSVYayWFXBgd07Mfm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s8iM/uvv7MJ1GKmE1+9PsEoOqxPg8Jf6nxiBLdEve6t0+5dlpuRzmJ34RmQCfJgHxvqOipRVfqO4I76rbIxNUkboApBp6RQvZIUc3GbsJCWYDU+Shwqd1OoLrPyCM9FuUfDNtaqTHwad/luNSevkgMV4XMtGfFNWH1SA8E7gdew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JP4gN00f; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JP4gN00f"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-81fd520fe0dso140144439f.3
        for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723388582; x=1723993382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVrLuLQuYNzQk85iuXQS4YnMqrr4Dz9ZJbXAfcGyqkI=;
        b=JP4gN00fzHTboRc8HfxpMxdztdZSEFCndp08s9+tdyIlX4HlQV9fddJgU+hz3ktpIG
         MXhvUll4h3bNVeiqtUfGXBdBq5M1QbmoB8IyfrMtHWS4U9uUc4ZiA6aPiZCa/XR6oq5J
         kPd4QkJIdM6MwNdjodVVL+BTxOLA9vgnk9IGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723388582; x=1723993382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVrLuLQuYNzQk85iuXQS4YnMqrr4Dz9ZJbXAfcGyqkI=;
        b=no7AOWA7gumqzc3QEk/RKPMg6rqJc8JNu5eMWvYcvR4g0w5VPlLz3Wb6WCcGeQjHNW
         CWvrzNyRQWi+PepdUFE/wNi+jG91vYuIDR7kRKATF5joojhW60HMZF0tg230LIXKcNEC
         3/XWpa915pUTX5wdtgJf7hFu3245fuA89HsTLYZu2d5pzC1YzR+3FwZiyplaU0zyLALS
         nT1MsnlmvU2Ursm6BTRUwQsdllXnF+EI1ycGEQm7NrqqAedkhlHdtqCAyRaFq93hflWB
         HUmAl6js4nZL/aBhZCFDlOjMNi/Ysijerinr/guUpZcb2BCrhEwiJcAu8HPR1dfES394
         R/1g==
X-Gm-Message-State: AOJu0Yxg5fQw0JZ66QbyashAN5DPvV5xcHYa1OmNcR3cbbSjKJsQac7O
	kMHsN+fZtbAyVKgw/otHOdIhMvwH6+dMdf4wWelmSi/u1Y9NwR11TJFJmbmqQ/oNlEAsTyBra3U
	=
X-Google-Smtp-Source: AGHT+IGONdI/hw1Fqd4x3TDgryklU3ksDAiwpe2EHb3WgOk8IKK08nREXjXfDzNwfSigFVE/4GV8zQ==
X-Received: by 2002:a05:6602:6d19:b0:81f:b53b:728d with SMTP id ca18e2360f4ac-8225ee6c81bmr911507239f.6.1723388582335;
        Sun, 11 Aug 2024 08:03:02 -0700 (PDT)
Received: from chromium.org (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ca7695a584sm1060611173.73.2024.08.11.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 08:03:02 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Gua Guo <gua.guo@intel.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 4/6] setup: Collect top-level code together
Date: Sun, 11 Aug 2024 09:02:46 -0600
Message-Id: <20240811150248.7537-4-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240811150248.7537-1-sjg@chromium.org>
References: <20240811150248.7537-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move most of the top-level code together, with the classes and functions
above, for easier reading.

The srcdir is left where it is for now.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 setup.py | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/setup.py b/setup.py
index eb0963c..be3cf90 100755
--- a/setup.py
+++ b/setup.py
@@ -47,6 +47,15 @@ def get_top_builddir():
         return sys.argv.pop(index)
     return srcdir
 
+
+class BuildPy(_build_py):
+    """Small class to run the build_ext command"""
+    def run(self):
+        self.run_command("build_ext")
+        return super().run()
+
+
+version, long_description = scan_for_info(srcdir)
 top_builddir = get_top_builddir()
 
 libfdt_module = Extension(
@@ -60,14 +69,6 @@ libfdt_module = Extension(
 )
 
 
-class BuildPy(_build_py):
-    """Small class to run the build_ext command"""
-    def run(self):
-        self.run_command("build_ext")
-        return super().run()
-
-version, long_description = scan_for_info(srcdir)
-
 setup(
     name='libfdt',
     version=version,
-- 
2.34.1

