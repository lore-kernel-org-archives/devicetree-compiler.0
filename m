From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v3 4/4] travis: test meson build
Date: Tue, 15 Sep 2020 23:27:05 +0400
Message-ID: <20200915192705.1716282-5-marcandre.lureau@redhat.com>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600198071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6QYmPOgar2mnEELOl1UqzZYw8BJEG+rTZRAmmYrL0A0=;
        b=CJhdgeLNqz34lHLZRSG2FY/UiGlpFNOWU6GFjy7J7pOvh5QC0elEpEnqZJFlUeQx7PWtYJ
        vy76LeBJUPwmc1QWQYG2HA2cafXqib8XW9YoCAk/6XB2KTTCkf6gKvSOaCe3uKpBIbQ+Ie
        gKWSRTtX+QHClEtljSKuxLXvgyUirDc=
In-Reply-To: <20200915192705.1716282-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .travis.yml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index a5163de..e2d74a4 100644
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
@@ -25,12 +31,16 @@ matrix:
       script:
         - make
         - make check && make checkm
+        - meson build
+        - ninja -C build test
 
     # Check it builds properly without optional packages:
     #     python, valgrind, libyaml
     - script:
         - make
         - make check
+        - meson build
+        - ninja -C build test
 
     - arch: arm64
       addons:
@@ -42,6 +52,8 @@ matrix:
       script:
         - make
         - make check checkm
+        - meson build
+        - ninja -C build test
 
     - arch: ppc64le
       addons:
@@ -52,6 +64,8 @@ matrix:
       script:
         - make
         - make check
+        - meson build
+        - ninja -C build test
 
     - arch: s390x
       addons:
@@ -63,3 +77,5 @@ matrix:
       script:
         - make
         - make check checkm
+        - meson build
+        - ninja -C build test
-- 
2.26.2

