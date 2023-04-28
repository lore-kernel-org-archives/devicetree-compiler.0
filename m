From: Johannes Beisswenger <johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] checks: Fix crash in graph_child_address if 'reg' cell size > 1
Date: Fri, 28 Apr 2023 15:38:34 +0200
Message-ID: <20230428133834.78178-3-johannes.beisswenger@cetitec.com>
References: <20230428133834.78178-1-johannes.beisswenger@cetitec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cetitec.com;
        s=cetitec.com; t=1682689163;
        bh=G7mZa/NiOzcasKdS5p+5iyeKv0fcOXy4qP0a6rXqJAs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=SICLuJUPsUCqXMQjhfgI7jGX27q0DNrnEWUkNc0Nrt1QuDolsWnyNiLnIOvGdZHLg
         Bx0zf6reprAApg6e83X78TCSAYYn6/dfocJe2gyZyeu/MerC9YYkL3B/VJ/6sCDOag
         VmatgYwD5kkPJTHyIdpYbJjeu5U5nRaHXDG14d/o=
In-Reply-To: <20230428133834.78178-1-johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Johannes Beisswenger <johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>

If an endpoint node has a 'reg' property which consists of more than
one cell and given that matching '#address-cells' and '#size-cells'
properties are specified on the port node an assertion is triggered in
check_graph_child_address() before the relevant diagnostic checks in
check_graph_reg() (called by check_graph_port()) are executed.

Example dts file triggering the issue:

/dts-v1/;
 / {
	bar: bar {
		port {
			bar_con: endpoint {
				remote-endpoint = <&foo_con>;
			};
		};
	};
	foo {
		port {
			#address-cells = <1>;
			#size-cells = <1>; // should always be 0
			foo_con: endpoint@1 {
				reg = <1 2>; // causes assertion failure instead of diagnostic
				remote-endpoint = <&bar_con>;
			};
		};
	};
};

Signed-off-by: Johannes Beisswenger <johannes.beisswenger-QHh2hmjso9JBDgjK7y7TUQ@public.gmane.org>
---
 checks.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 8ed7a60..4648c44 100644
--- a/checks.c
+++ b/checks.c
@@ -1798,8 +1798,10 @@ static void check_graph_child_address(struct check *c, struct dt_info *dti,
 		struct property *prop = get_property(child, "reg");
 
 		/* No error if we have any non-zero unit address */
-		if (prop && propval_cell(prop) != 0)
+		/* We have a check for val.len == sizeof(cell_t) elsewhere */
+                if (prop && propval_cell_n(prop, 0)  != 0 ) {
 			return;
+                }
 
 		cnt++;
 	}
-- 
2.40.0

