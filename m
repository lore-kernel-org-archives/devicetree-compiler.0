From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 5/6] pylibfdt: Include tests and test data in packaging
Date: Thu, 11 Nov 2021 22:16:32 -0600
Message-ID: <20211112041633.741598-6-robh@kernel.org>
References: <20211112041633.741598-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211112041633.741598-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Packaging the tests is necessary for tox to work.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 MANIFEST.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MANIFEST.in b/MANIFEST.in
index ff8f5d637d46..d9fb71b77a65 100644
--- a/MANIFEST.in
+++ b/MANIFEST.in
@@ -10,3 +10,7 @@ include pylibfdt/*.py
 include libfdt/libfdt.h
 include libfdt/fdt.h
 include libfdt/libfdt_env.h
+include tests/test_pylibfdt.py
+include tests/test_tree1.dts
+include tests/test_props.dts
+include tests/aliases.dts
-- 
2.32.0

