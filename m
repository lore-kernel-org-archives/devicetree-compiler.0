Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB11172A
	for <devicetree-compiler@vger.kernel.org>; Sun,  2 Mar 2025 22:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740954531; cv=none; b=kt9bbxaQhKMhMSJi0t1c3SJhB4d9Fpj7WcW0d0jB8xoCk4qAqvv1HPLkrP0hNu1MUFUjVv2IvaZ9e8r//AoQs2+rOTPnYD0mPWKzKCbra6iWmPRVgA6TSJvPT6zxfHCQx2s9cWKaXRUQ4ckaEBw+jvre9zh9wH9hyxiSP8Rfy7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740954531; c=relaxed/simple;
	bh=7omYvas5PkHAtIsmXPV+1xZNegrGa7xm5sg/M9XIwuU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TFKQXlBgPRkP+Px5uGTS1kYZzaFKfVLLBugY5KAt0W5r3fjFVcFkmDuVBfb8VfAW8dud5LNM/Bz51RJOHNZShjfWIPCWI+Iw0Md1iYsbjT66af8crARguu/NLoEfL4a9jK5AFbasZ2cQEtI/ZpQdjni4YlEGRp1kw6CwMb+6lAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEd6Lots; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEd6Lots"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-474ef1149f3so1032261cf.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 02 Mar 2025 14:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740954528; x=1741559328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eXqh39pj/sN/AAyEfc0mMjKpIabQCOvNKhkeFM3W/KE=;
        b=ZEd6LotsYXhdlcENrT7b2ENJLYauyK3ZQZYR8ODEmWuqaHpj0hgnXo/pVjB5q1itnR
         4Op6ygqKh8sanHBkqtZytBR2AYyWPKB4v3l5d6CVOjTg82a1I60Wxa0axd6pQOvQxSBh
         ZmmwZy9XU6mb7RBb/bo4nKi46Ap3Ueg8oNoFKy5qSEKdLMxzLSeHELmix3v5wKp8Enz6
         G0nKdkx0aRydVVuE71bdhOzDMxnViTbVigiaIlpBK8rfqgU8IzR7YTZPmTb2An9MvIF7
         SMIu2Iub5Q3lHHF9HHnzVDMaHMBq8+aiATcKP0UXcDvAfPqgL2rmC4BXwaADHzbv5BrF
         INGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740954528; x=1741559328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXqh39pj/sN/AAyEfc0mMjKpIabQCOvNKhkeFM3W/KE=;
        b=GL6R/M0RViV9y8X/9Er3UgLq5lijSoAgacE9ko7t85HIs1Uf+D6hnXv+78WT7Zy06E
         bEh+gf/6ve7UG2ip5L72Qh3/5Icm6jw9wNi1pyjIapUTF3dvEhqHRia4CkLyNzSQl1D+
         mZCsRZjLbg5NpO9Vy/mpADD8SnIhtm0+lgoID3LXnTcUaRuWNzNOJ48CJPBcgta6xLZI
         GQrNyXUQ5LpR9w64T7Ag3tzL+Z+RlCqe8VmKHF3eOy009p/ud2tvA0GeGspOvgjC09eY
         rCo6GO+7Obc1FGgVZepatxmjbKAJpfl0L5EGkWGltFr9OtslDaGycVWhcvtOSGfjjaCs
         GS/Q==
X-Gm-Message-State: AOJu0Yy2+2vc0g/OMXQKn6jdQoBVq/NBP6Xy8TkLz37A+WX9BbdkrKqt
	rvecGf58L3/CdD7rJX3X9d0o/ONrGUuOPgd8exl1wE7NUaUtwVk5Od+e+A==
X-Gm-Gg: ASbGncvt9U3EZGoPDgsQ1rwUdpNvKke8voYSN6lbBrlqb7ISQujWIQOIdCbRjgI1Wns
	Ffb/bdrDakiaAt0XPCaMGVFsUy/MsJfP96u26NJZtutDzyrq8Y5rdV7n12Q9dBrd8oJNiF3Ee2P
	/bULkjJH8XPyUqek50qhcGibHdDqvagUYJdBTaG6parjjf5OwMXLXxKLgBmI4GI0TB6W3JdG/jn
	znlI3n52u9hSwr+xFL+iBwzqNS1bqdnTXt93qo+ecpNS9WXrbd+XBb0s32EYRa0ssOFJbMAYfis
	1TbcCn6RyQKpQ/9kNDb5ualt+aWulvvvPtPSMRTS
X-Google-Smtp-Source: AGHT+IEyfipIMH728Pr0mIgnX07XtxlyzhuioVSOm+k5So5YAb/8F4pQ7/dqyzWr43pGUVUxN5I/Mw==
X-Received: by 2002:ac8:5f07:0:b0:471:fa00:fb9b with SMTP id d75a77b69052e-473d8f99c26mr223198541cf.7.1740954528421;
        Sun, 02 Mar 2025 14:28:48 -0800 (PST)
Received: from acleverhostname.lan ([2603:6011:3f0:6f00::12ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8ccdcf625sm3618836d6.103.2025.03.02.14.28.47
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 14:28:48 -0800 (PST)
From: Eli Schwartz <eschwartz93@gmail.com>
X-Google-Original-From: Eli Schwartz <eschwartz@gentoo.org>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH] meson: don't build test programs by default
Date: Sun,  2 Mar 2025 17:28:26 -0500
Message-ID: <20250302222839.2256985-1-eschwartz@gentoo.org>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are only used when running tests, and are included as depedencies
of the test cases themselves already. Marking them to not build by
default, means that 291 compile edges can be skipped when only running

```
meson setup builddir/
ninja -C builddir/
meson install -C builddir/
```

resulting in an overall much faster build. Instead they will be compiled
on-demand by `meson test`, only for users that actually run the tests.

Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>
---
 tests/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/meson.build b/tests/meson.build
index 9cf6e3d..f1044b9 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,7 +1,9 @@
 trees = static_library('trees', files('trees.S'), c_args: '-D__ASSEMBLY__',
+                       build_by_default: false,
                        include_directories: libfdt_inc)
 
 dumptrees = executable('dumptrees', files('dumptrees.c'),
+                       build_by_default: false,
                        link_with: trees, dependencies: libfdt_dep)
 
 dumptrees_dtb = custom_target(
@@ -111,7 +113,7 @@ endif
 
 tests_exe = []
 foreach t: tests
-  tests_exe += executable(t, files(t + '.c'), dependencies: test_deps, link_args: extra_link_args)
+  tests_exe += executable(t, files(t + '.c'), dependencies: test_deps, link_args: extra_link_args, build_by_default: false)
 endforeach
 
 run_tests = find_program('run_tests.sh')
-- 
2.45.3

