From: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Add missing relref_merge test to meson test list
Date: Wed, 29 Jun 2022 19:31:14 +0300
Message-ID: <20220629163114.932175-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnBIiljv7A4I0fvXbvUyP4UnurGOsypJxTA0GO2riCc=;
        b=A/k3143z6kmdCuREFKav1VbrlMNKFBoe2UWkTFP0uz/mbfIbSJ2wE7Ylv/3haZ9L/z
         Qi0fnJWl12/WBT1c7svK82btq4PAVirgC/kjXlNUrvkZCGOqkMv0dUA20k9eDTmmdo2W
         hpSKvs4RVpwjDuFGQKgjEZhYo3Mf5c4QbTLq31kzC+dRItL5t+ns7L6xDYU3aN1ZhHK4
         xWkjbEtPy5YVRrxErAJUuAvzN7OrOjAaH2Wlzldmn3wEhZ+GzfireYvYlS968K9NBe3u
         VPI2LmOhHTKvNeQfr+M/zCBJTq/yNZmQp8gLYfoYZDiUKzIUZ57XTVQKgBSAK7S2hL/J
         hT4g==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>

Will remove one "Strange test result" when running tests with
meson

Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
---
 tests/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/meson.build b/tests/meson.build
index fa06824..3776fef 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -71,6 +71,7 @@ tests = [
   'property_iterate',
   'propname_escapes',
   'references',
+  'relref_merge',
   'root_node',
   'rw_oom',
   'rw_tree1',
-- 
2.33.3

