From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] More pylibfdt setup.py rework
Date: Thu,  3 Feb 2022 12:04:06 -0600
Message-ID: <20220203180408.611645-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hector Oron <zumbi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Natanael Copa <ncopa-Tvuechaw34bCfDggNXIi3w@public.gmane.org>

This series is further work to get libfdt to 'just work' as a python 
package dependency. It's worse than I originally realized when my setup 
broke due to recently added libfdt functions.

The first patch is a fix to my previous rework. The 2nd is a RFC.

Rob

Rob Herring (2):
  pylibfdt: fix swig build in install
  pylibfdt: Compile and build libfdt directly into shim library

 MANIFEST.in |  5 +----
 setup.py    | 49 ++++++++++++++++++++++++-------------------------
 2 files changed, 25 insertions(+), 29 deletions(-)

-- 
2.32.0

