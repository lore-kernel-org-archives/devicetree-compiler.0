From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 1/2] checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
Date: Thu, 28 May 2020 18:26:49 +0930
Message-ID: <20200528085650.1417942-2-joel@jms.id.au>
References: <20200528085650.1417942-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FiQqSNUhCv6yJ3YkfxLNYN6qXN3BR0Yb2SyZoRmzP9o=;
        b=EDqXkI65SLQMoAOITz86Yxcoph6Sm2WTA+w9n1plLRKoNfQplFbko+wAKfzLEPcL+2
         VwVZzEPeDJO7FRDtfcJITX/uSWxdlmNw8trGKewhNATvhFqF5BzTDhw5LTnI1C4A2xhJ
         G+7I2gbkt3f7g/e78L9K0UsyxkorrqOgyi/Ct1pS4sabqXEBk1LaKxrb4KtbLgkiBx7B
         J/kz4kJFl/UdBHkQW6C+m8UmthCmbN7tlpDt3IxhOZDgaXv673aLWxx0JpG/cAEWweTA
         zdU77WZsTx0NQrffd+slKGdsuiDCzX1S+e0HXPcyWCdbeOnRnecaGKTdoahP5IbIDFe8
         BwDQ==
In-Reply-To: <20200528085650.1417942-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>

dtc does a sanity check on reg properties that they are within the 10
bit address range for i2c slave addresses. In the case of multi-master
buses or devices that act as a slave, the binding may describe an
address that the bus will listen on as a device. Do not warn when this
flag is set.

See Documentation/devicetree/bindings/i2c/i2c.txt.

This fixes the following build warnings reported by Stephen and by Arnd:

arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126.11-130.4:
  Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:
    I2C bus unit address format error, expected "40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128.3-30:
  Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:reg:
    I2C address must be less than 10-bits, got "0x40000010"

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix typo
---
 checks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/checks.c b/checks.c
index a8213c0e13a8..feb1721f2603 100644
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
+	/* Ignore I2C_OWN_SLAVE_ADDRESS */
+	reg &= ~I2C_OWN_SLAVE_ADDRESS;
 	snprintf(unit_addr, sizeof(unit_addr), "%x", reg);
 	if (!streq(unitname, unit_addr))
 		FAIL(c, dti, node, "I2C bus unit address format error, expected \"%s\"",
@@ -1051,6 +1055,8 @@ static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node
 
 	for (len = prop->val.len; len > 0; len -= 4) {
 		reg = fdt32_to_cpu(*(cells++));
+		/* Ignore I2C_OWN_SLAVE_ADDRESS */
+		reg &= ~I2C_OWN_SLAVE_ADDRESS;
 		if (reg > 0x3ff)
 			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 10-bits, got \"0x%x\"",
 				  reg);
-- 
2.26.2

