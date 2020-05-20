From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH] checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
Date: Wed, 20 May 2020 17:21:34 +0930
Message-ID: <20200520075134.1048589-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eISqd2Zq8TKyJRlIkRfySpejWW9qZi5CWBpQkdSSgwA=;
        b=mGgArPGIb1iu+hbGLRxh4UOzKssvkGvo5w9b2qRv3cIiUqviTF2ydWypW7au+aoikU
         vYyFi16AvFWi/vgNEl2vu9XfqA1yyDpkgEnhR82LXAL09BW5oKmpVzKy00hQ2NYzZ06a
         e/luuE9yq7AkHTS8OYlnhQhO5SqEJQBYZz9KOnrt9WDy0vqsTcRvEYeY996/F6qEUMcm
         l5e05Nf1v2xJwOd370nJfGJ3afUraIAqElQnoehcL2S6JNWW7T7/e8nJ52/m0LZ6MqOT
         2//nPYLgcs3pOyijal/M8koMoMrY/flO+MBANyX01yT3u0U2N1R1MneaaXg98RPmj3y7
         2pQw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>

dtc does a sanity check on reg properties that they are within the 10
bit address range for i2c slave addresses. In the case of multi-master
buses the binding may describe an address that the bus will listen on as
a device. Do not warn when this flag is set.

This fixes the following build warnings reported by Stephen:

arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126.11-130.4:
  Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:
    I2C bus unit address format error, expected "40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128.3-30:
  Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:reg:
    I2C address must be less than 10-bits, got "0x40000010"

Reported-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 checks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/checks.c b/checks.c
index a8213c0e13a8..2c23dd4f7778 100644
--- a/checks.c
+++ b/checks.c
@@ -1022,6 +1022,8 @@ static void check_i2c_bus_bridge(struct check *c, struct dt_info *dti, struct no
 }
 WARNING(i2c_bus_bridge, check_i2c_bus_bridge, NULL, &addr_size_cells);
 
+#define I2C_OWN_SLAVE_ADDRESS	(1 << 30)
+
 static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node *node)
 {
 	struct property *prop;
@@ -1044,6 +1046,8 @@ static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node
 	}
 
 	reg = fdt32_to_cpu(*cells);
+	/* Ingore I2C_OWN_SLAVE_ADDRESS */
+	reg &= ~I2C_OWN_SLAVE_ADDRESS;
 	snprintf(unit_addr, sizeof(unit_addr), "%x", reg);
 	if (!streq(unitname, unit_addr))
 		FAIL(c, dti, node, "I2C bus unit address format error, expected \"%s\"",
@@ -1051,6 +1055,8 @@ static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node
 
 	for (len = prop->val.len; len > 0; len -= 4) {
 		reg = fdt32_to_cpu(*(cells++));
+		/* Ingore I2C_OWN_SLAVE_ADDRESS */
+		reg &= ~I2C_OWN_SLAVE_ADDRESS;
 		if (reg > 0x3ff)
 			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 10-bits, got \"0x%x\"",
 				  reg);
-- 
2.26.2

