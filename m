From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/6] README: Update pylibfdt install instructions
Date: Thu, 11 Nov 2021 22:16:28 -0600
Message-ID: <20211112041633.741598-2-robh@kernel.org>
References: <20211112041633.741598-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211112041633.741598-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Now that pip is supported for installs, update the install instructions to
use it. Using pip over setup.py is generally recommended and simpler.

Also, drop 'SETUP_PREFIX' as it doesn't exist anywhere.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 README | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/README b/README
index d9bf850b9dc2..5f5655df6898 100644
--- a/README
+++ b/README
@@ -48,18 +48,24 @@ If you add new features, please check code coverage:
     # Open 'htmlcov/index.html' in your browser
 
 
-To install the library via the normal setup.py method, use:
+The library can be installed with pip from a local source tree:
 
-    ./pylibfdt/setup.py install [--prefix=/path/to/install_dir]
+    pip install . [--user|--prefix=/path/to/install_dir]
 
-If --prefix is not provided, the default prefix is used, typically '/usr'
-or '/usr/local'. See Python's distutils documentation for details. You can
-also install via the Makefile if you like, but the above is more common.
+Or directly from a remote git repo:
+
+    pip install git+git://git.kernel.org/pub/scm/utils/dtc/dtc.git@main
+
+The install depends on libfdt shared library being installed on the host system
+first. Generally, using --user or --prefix is not necessary and pip will use the
+default location for the Python installation which varies if the user is root or
+not.
+
+You can also install everything via make if you like, but pip is recommended.
 
 To install both libfdt and pylibfdt you can use:
 
-    make install [SETUP_PREFIX=/path/to/install_dir] \
-            [PREFIX=/path/to/install_dir]
+    make install [PREFIX=/path/to/install_dir]
 
 To disable building the python library, even if swig and Python are available,
 use:
-- 
2.32.0

