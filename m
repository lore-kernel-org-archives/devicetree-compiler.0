Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC631494B2
	for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723388582; cv=none; b=oFkwsD9YuQxl9aGHXw119LoanUkCLYgHY+oxdX/7PS/HI+q59rX5br50TJ8sXIdeqyOBYqYf92fcgSii0SaoYf8BLoE9E2T8eTpU3828ChvqAYZvG0bPZ6WD8nYJYM+XcNJG8aTb62LOitqVr5g9xQXS1LT8dzpGBWfqFQD+W08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723388582; c=relaxed/simple;
	bh=zLcR9oNumykWKN5juZIIJjB7v0B8xckzVxFsqcnMvZo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ra8PhmGyFDHXMLlG9d0v2MhNYLN7tiiiUqvB9m3MxrqWHbljX115mN7dvIcGjElBCBINnI1N0qmPfr3YAkA+jlItkcN6AR222tOa050gjc6VXbwLsOytCGGZz9ruMNKtxYqVSZUfIt3T+9SVWAYryM6AgO/SVXn24g6yhzhYujE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U5GwWgVo; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U5GwWgVo"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-81f921c40f2so142590239f.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723388579; x=1723993379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Cxjzu3r/7eVDkaEUN2sHfZMPZSuDSToRJQWrc83wR8=;
        b=U5GwWgVoWbc23RxbYum/GYGNGati6FrlspvIvl/HDRaN7b5CILOWJjDGh5JS4MDm1L
         Na6GGiLP/RkFStlNhkJ4+MB3sdQ7SqHlm3S0hzJd05t2IbxyqwAqjC2NsDOgHm+r12Mq
         rFzMeQqJdx3ch2H4K5XyZs4IW4YBVSIIe3QWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723388579; x=1723993379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Cxjzu3r/7eVDkaEUN2sHfZMPZSuDSToRJQWrc83wR8=;
        b=u7IOCSCFwSwqTC8ggEZEYevooHecaj66fsrtDhNUvoUbxWnJvxiQNmO4VPSP0EdU/d
         Kc166qbnjeD5GBERextYV6kS+cKc7xN+W/5Km/PeXfaZUBar/jUmVe2TpcgocGKylkvH
         2udQLcmRPMoEV21qz/zhyCUSs4kDESDvfwMGnB504O1wAHyNX8qDLYUlowKPluLxW4rC
         g/+BX1XUXmAUVFRhhDIHN8LI2h78n3e2MywpY28HOYJG+Tt/8TuZ8z9j2zl8EAqSzlgR
         gJ3NH62DVjpGCP3L0qnQuWBDFGuYgBar00odwNHPXEeBn0xi7sNqQk2JCdN8Z/dOp+6a
         1uYQ==
X-Gm-Message-State: AOJu0YwD38IkQsZM+8nDNux98m7fQH5Qpu7LQOiWc1N/Jad0hb8dp4cm
	FO44Fj1oZI0rSqfAHw5JEYEQu8SDT6lXHrAw6o4+Uy/8IbeZbK3OvQGjKsKceJdrnPomP1GX4Po
	=
X-Google-Smtp-Source: AGHT+IEMu5czo8AzDUAOEq03JVZ5zrhr78PnAz3s1fj+8go2ZbkLaTCML0zKZPTFiRUbfo+IXr2bbg==
X-Received: by 2002:a05:6602:6001:b0:81e:23e8:8d4 with SMTP id ca18e2360f4ac-8225ee767a4mr1108827239f.6.1723388579223;
        Sun, 11 Aug 2024 08:02:59 -0700 (PDT)
Received: from chromium.org (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ca7695a584sm1060611173.73.2024.08.11.08.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 08:02:57 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Gua Guo <gua.guo@intel.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 1/6] Require Python 3
Date: Sun, 11 Aug 2024 09:02:43 -0600
Message-Id: <20240811150248.7537-1-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't need to support Python 2 anymore, so drop the comment and add
the minimum required version. Use version 3.8 since I am not sure that
it works on older versions and 3.7 has reached end-of-life.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 setup.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/setup.py b/setup.py
index 293bb6b..749bf1b 100755
--- a/setup.py
+++ b/setup.py
@@ -1,9 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 
-# While Python 3 is the default, it's also possible to invoke
-# this setup.py script with Python 2.
-
 """
 setup.py file for SWIG libfdt
 Copyright (C) 2017 Google, Inc.
@@ -60,6 +57,7 @@ setup(
     ext_modules=[libfdt_module],
     package_dir={'': os.path.join(srcdir, 'pylibfdt')},
     py_modules=['libfdt'],
+    python_requires=">=3.8",
 
     long_description=long_description,
     long_description_content_type="text/plain",
-- 
2.34.1

