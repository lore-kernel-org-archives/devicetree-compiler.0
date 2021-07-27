From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 2/5] Add has_type_markers() helper
Date: Tue, 27 Jul 2021 12:30:20 -0600
Message-ID: <20210727183023.3212077-3-robh@kernel.org>
References: <20210727183023.3212077-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210727183023.3212077-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add a marker helper function, has_type_markers(), to test if there are
already type markers present.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v3:
 - New patch
---
 dtc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/dtc.h b/dtc.h
index 0a1f54991026..5608fdf4fe28 100644
--- a/dtc.h
+++ b/dtc.h
@@ -154,6 +154,11 @@ static inline struct marker *next_type_marker(struct marker *m)
 	return m;
 }
 
+static inline bool has_type_markers(struct marker *m)
+{
+	return next_type_marker(m) != NULL;
+}
+
 static inline size_t type_marker_length(struct marker *m)
 {
 	struct marker *next = next_type_marker(m->next);
-- 
2.27.0

