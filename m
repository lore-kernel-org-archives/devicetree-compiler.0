From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 1/4] README: Explain how to add a new API function
Date: Sun,  7 Nov 2021 15:43:43 -0700
Message-ID: <20211107224346.3181320-2-sjg@chromium.org>
References: <20211107224346.3181320-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Aiw1E7TEgYaVQKkRK0LctrrOlRIyk+eEshI/CLpk8I=;
        b=oQ+lAe7QmpbTdStSr4QEOlDpCIMsvO0yWITGnaYX55gWeJ46BkLm9hW8yeViae1i9Y
         lI4hkYlnTUdJqzoEGOoN4U18sheUv113blaWVPUPtsAJiYHMQZbh0HkeNIPLv9e0steO
         SbtO53sihS0cXuIg3Jbpw7YDLoQlXidTFzGnE=
In-Reply-To: <20211107224346.3181320-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This is not obvious so add a little note about it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

(no changes since v1)

 README | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/README b/README
index d9bf850..bac1714 100644
--- a/README
+++ b/README
@@ -71,6 +71,15 @@ More work remains to support all of libfdt, including access to numeric
 values.
 
 
+Adding a new function to libfdt.h
+---------------------------------
+
+The shared library uses libfdt/version.lds to list the exported functions, so
+add your new function there. Check that your function works with pylibfdt. If
+it cannot be supported, put the declaration in libfdt.h behind #ifndef SWIG so
+that swig ignores it.
+
+
 Tests
 -----
 
-- 
2.34.0.rc0.344.g81b53c2807-goog

