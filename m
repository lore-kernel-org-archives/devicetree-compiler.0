From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 6/6] pylibfdt: Add tox support
Date: Thu, 11 Nov 2021 22:16:33 -0600
Message-ID: <20211112041633.741598-7-robh@kernel.org>
References: <20211112041633.741598-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211112041633.741598-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

'tox' allows running python tests under multiple environments.

Note that installing python versions is outside the scope of tox.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 tox.ini | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 tox.ini

diff --git a/tox.ini b/tox.ini
new file mode 100644
index 000000000000..7925d1e2f390
--- /dev/null
+++ b/tox.ini
@@ -0,0 +1,6 @@
+[tox]
+envlist = py36,py37,py38,py39,py310
+
+[testenv]
+deps = pytest
+commands = pytest
-- 
2.32.0

