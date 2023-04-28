From: Johannes Beisswenger <johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/3] checks: Fix segmentation fault in check_graph_node
Date: Fri, 28 Apr 2023 15:38:32 +0200
Message-ID: <20230428133834.78178-1-johannes.beisswenger@cetitec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cetitec.com;
        s=cetitec.com; t=1682689163;
        bh=2cDKnzz/g6U56k9XW4/pX+B8ThDGGXTB+IQSp0zrnzI=;
        h=From:To:CC:Subject:Date;
        b=qM0amV6hY+QZ93utGoBwCwWnTN9+wjNKYMWHfP/P+WKll5ygTcj2QKU8Gk58++xUU
         A1yes6pOGFdNuUlcwCOnGTes0ShpNXUKO0WICpfS/axXT0b0ueTKf6/sBJludPDflk
         2OIYLi6ga/ygIkDM+4zUHiEdXC+RIHU6OCY8OwJ0=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Johannes Beisswenger <johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>

Dts files which contain an 'endpoint' node as a direct child of the
root node cause a segmentation fault inside check_graph_node(). This
type of error can easily happen when a 'remote-endpoint' property is
accidentally placed outside the corresponding endpoint and port nodes.

Example with 'endpoint' node:
/dts-v1/;
/ {	endpoint {};  };

Example with remote-endpoint property:
/dts-v1/;
/ {
	foo {
                remote-endpoint = <0xdeadbeef>;
	};
};

Signed-off-by: Johannes Beisswenger <johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>
---

Hello,

this patch series is equivalent to the following GitHub pull request https://github.com/dgibson/dtc/pull/92
which also contains a short summary of the issue.
In short: the segmentation fault happens because check_graph_node() dereferences
node->parent without checking whether it is NULL.

The actual code changes are quite small, nevertheless please let me know if there are any issues.

Best regards
Johannes Beisswenger

CETITEC GmbH
Mannheimer Str. 17
D-75179 Pforzheim, Germany 


 checks.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/checks.c b/checks.c
index 16bc7f6..8ed7a60 100644
--- a/checks.c
+++ b/checks.c
@@ -1767,6 +1767,11 @@ static void check_graph_nodes(struct check *c, struct dt_info *dti,
 		      get_property(child, "remote-endpoint")))
 			continue;
 
+                /* The root node cannot be a port */
+		if (!node->parent) {
+			FAIL(c, dti, node, "root node contains endpoint node '%s', potentially misplaced remote-endpoint property", child->name);
+			continue;
+		}
 		node->bus = &graph_port_bus;
 
 		/* The parent of 'port' nodes can be either 'ports' or a device */
-- 
2.40.0

