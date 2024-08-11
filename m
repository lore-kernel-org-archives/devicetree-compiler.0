Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08949B64E
	for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723388584; cv=none; b=Hcy6OP8BIpOx8cOT9nOLlMeWf4Zla3Xs0cNOPrXqenTW39mEI9J2FWr8lkvOepgCSsqLQyaIob1BIsy9UY6PGkdE0A/zTYJgot/PN+Ln1AYbOyAeZNvU/pkyEVHGENpFesJPUMeEXE2eynCmuUydONHr8Y+uLnxcSze6tbRn/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723388584; c=relaxed/simple;
	bh=qyht9OrjaMaRe+OVhQNyXBK+t6sWdF4n2LIW3c8tzUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O3ssypY2AZ9/CG4OpElanVv0HLtlM9VgAsEAE1aAXUgM/JWtxDufel9OdbVqBj9fhKva39+ZqKUc+xSzfXiSheAZn2zTfmAKKH2ltlnirvySJKhu7jY71vzKKP7k/4mz4LZJr+UnnQUz8sglQxfAw7Q5WiekG64jGw6HAPaBqIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GAUAyrXS; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GAUAyrXS"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-396cc82f6d7so12043415ab.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 08:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723388582; x=1723993382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0M6hiX35ggO65Z5WLVGYDTI5p4gxNGLCs+nxNkWQVYQ=;
        b=GAUAyrXSet5OcPT0+2ResGboAURoDtVGNz3xz2RGOYmbj3/qP0cX/QIIkW04X6zd/y
         x3wyC8xV5bvuzNZkkjnYDJK1ChdSxfvO4LQRlFv6RNZOxPM3ea7F73umqj9oJJ987jwC
         G4cVXQ0X61xm+6jDuiNyeEslhQPFotimDjeGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723388582; x=1723993382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0M6hiX35ggO65Z5WLVGYDTI5p4gxNGLCs+nxNkWQVYQ=;
        b=HnEAYh1m1rPXqdkBYIP1zsAD6qzMh24TuOVxF089bRggCJltz6QfE6s2Nn1+Dwc98j
         MrGO6Y01ThngI4IFZx0m6kBw/jds3D0E9PmhsNlzC88Bse6qwukMMwr+/iwo3anOjsPF
         MX+0P1WsXlaPcCOFBEm7y10dNoSWxEoKljF4mYcrpC6RjietLOg1pc1jbdBd9/XH8m6k
         2CVyAq+skrRqCdBbfQMtjFb6sqH6+WND2UDI0au00soi3dlRFzYczpMEMWN3GKp5yGer
         NtR+pBroHNBe7XbL9KXIBR0ds2XC3RljYhMA6Qga5QB20xR5oE68xm9OD3wcm2qL5CdY
         8KGQ==
X-Gm-Message-State: AOJu0YyjNsf6+Z/oA/2sOtPo+oQ6TImYgC+2pAx1kIELXGmWjW6oNSDP
	y+vNQpsO77fT1yT6hS6zpHxe8QUpi02q2leGiraB3KcnibBIxAkpare90rhR3RsOiDtAcbycr40
	=
X-Google-Smtp-Source: AGHT+IHlo/pf6tF3gqRkYFlYnORYi9SmK8+vLoCVM0J01b5/ZawbrbA2dN9fNLhbv1GT94SnxxkqqQ==
X-Received: by 2002:a05:6e02:15c6:b0:376:3ece:dc5 with SMTP id e9e14a558f8ab-39b5f9e56c2mr118725095ab.4.1723388581727;
        Sun, 11 Aug 2024 08:03:01 -0700 (PDT)
Received: from chromium.org (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ca7695a584sm1060611173.73.2024.08.11.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 08:03:01 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Gua Guo <gua.guo@intel.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 3/6] setup: Move version and full_description into a function
Date: Sun, 11 Aug 2024 09:02:45 -0600
Message-Id: <20240811150248.7537-3-sjg@chromium.org>
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

Do this processing in a function and return the result, to reduce the
amount of code at the top level.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 setup.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/setup.py b/setup.py
index 4e880e4..eb0963c 100755
--- a/setup.py
+++ b/setup.py
@@ -16,11 +16,24 @@ from setuptools.command.build_py import build_py as _build_py
 
 srcdir = os.path.dirname(__file__)
 
-with open(os.path.join(srcdir, "README.md"), "r", encoding='utf-8') as fh:
-    long_description = fh.read()
+def scan_for_info(srcdir):
+    """Scan for the version and long_description fields
+
+    Args:
+        srcdir (str): Source-directory path
+
+    Returns: tuple
+        str: Full description (contents of README.md)
+        str: Version string
+    """
+    with open(os.path.join(srcdir, "VERSION.txt"), "r", encoding='utf-8') as fh:
+        version = fh.readline().strip()
+
+    with open(os.path.join(srcdir, "README.md"), "r", encoding='utf-8') as fh:
+        long_description = fh.read()
+
+    return version, long_description
 
-with open(os.path.join(srcdir, "VERSION.txt"), "r", encoding='utf-8') as fh:
-    version = fh.readline().strip()
 
 def get_top_builddir():
     """Figure out the top-level directory containing the source code
@@ -53,6 +66,7 @@ class BuildPy(_build_py):
         self.run_command("build_ext")
         return super().run()
 
+version, long_description = scan_for_info(srcdir)
 
 setup(
     name='libfdt',
-- 
2.34.1

