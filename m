From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v6 3/4] travis: install meson
Date: Wed,  4 Nov 2020 23:45:26 +0400
Message-ID: <20201104194527.986901-4-marcandre.lureau@redhat.com>
References: <20201104194527.986901-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604519167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PwdU7dxdJBPHsoj/3swbR8ZET8WQPgjSwag9qWndubw=;
        b=bj1keunTHFOyJ3EUfoL5ULDVhFP60gUyCS8ZT7nYy3hjboG5MzTp0BrnGjC9RhXi5SlRsL
        HgF6vV3BiTPxp/kSXOjCda06IGc75psK5p2EUPXRmg51c7TSjejP9Jceph6pJFSn5DeRS3
        6Zu6Pj9Yc6dzZEocaV7PXY08MAzH0zM=
In-Reply-To: <20201104194527.986901-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

The next patch is going to switch the build-sys to meson.

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .travis.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index a5163de..aad9f68 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -6,6 +6,12 @@ env:
   # COVERITY_SCAN_TOKEN (dgibson/dtc)
   - secure: "vlHvXe618//IM9LQaKzqsrUbjs7ng0L9UCST4kJbJnFQDXvVe5JiSmJGd4ef7mm0NUv5bMRl2W3xCiu6BYAu/NvU3tMNHoLG+JgCJs0+wLJXbWOwji/NmH7olqgJG+CmpaCMXjARF6+nrTnBYHJL6cYyf4KVoV4B0I/hLUW91+s="
 
+before_install:
+  - '[ $TRAVIS_CPU_ARCH = amd64 ] && sudo add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu xenial-backports main universe" || sudo add-apt-repository -y "deb http://ports.ubuntu.com xenial-backports main universe"'
+  - sudo apt-get -q update
+  - sudo apt-get -t xenial-backports install -y python3 python3-setuptools python3-pip ninja-build
+  - sudo pip3 install meson
+
 matrix:
   include:
     - addons:
-- 
2.29.0

