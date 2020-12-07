From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH 2/5] meson: do not assume python is installed, skip tests
Date: Mon,  7 Dec 2020 17:00:52 +0400
Message-ID: <20201207130055.462734-3-marcandre.lureau@redhat.com>
References: <20201207130055.462734-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607346075;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z4Q8ClAbknDxprbsZeS+0jeHnxrULqsL2pjq8sJWczc=;
        b=DRC89fReM1cumY8uz177mCzD1j+dpLdaP38FWb0IYOMwZIFeGzYnZryartfj5GC3lT0/xg
        gHDjpc/fonoZAubhOCYZ8khlEDIiOoytiiJ/HgwyEzMWBhTi8fGnVA7EitEBtWhhBzsGDa
        KrZk7U2AH2txIV4ypjZ5fpdaWMdxnbY=
In-Reply-To: <20201207130055.462734-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 tests/meson.build | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index 8976dc1..9d3a4e7 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -108,14 +108,14 @@ endforeach
 
 run_tests = find_program('run_tests.sh')
 
-
-env = [
-  'PYTHON=' + py.path(),
-  'PYTHONPATH=' + meson.source_root() / 'pylibfdt',
-]
-
+env = []
 if not py.found()
   env += 'NO_PYTHON=1'
+else
+  env += [
+    'PYTHON=' + py.path(),
+    'PYTHONPATH=' + meson.source_root() / 'pylibfdt',
+  ]
 endif
 if not yaml.found()
   env += 'NO_YAML=1'
-- 
2.29.0

