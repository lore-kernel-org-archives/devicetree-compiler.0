From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v4 2/2] checks: Improve i2c reg property checking
Date: Mon, 22 Jun 2020 12:40:05 +0930
Message-ID: <20200622031005.1890039-3-joel@jms.id.au>
References: <20200622031005.1890039-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KaJJanZVJWZSvXqCSXtZ01YBvvSbfqMJxJAq4m8RlJ4=;
        b=VNeqMFnCbwSDhvSCFusejCiUhY+v5LZqCDBVNZje9D1IEEtEkcxeteRTy8tVy9l+mx
         vSRdmMpsr3gi37oT2S1aG4EoNGUD3BzIue7rxm9mwxva/939hEnI80BYzJZ9Za701Y1Y
         5tc3Y6TURIOCEG4KTQzvj2d0Qe+hJo4l8fEiKGSKhyZkOJpgetkLOFazmrN/m0NYtTUa
         j/Uc1ICNpneSm8ibtkR5Xwd0xsszxwgegINScmDJAEe2onCrZAwv9M4y914h7kQBUwIq
         RQA5x+uJBccVCu+FwG4ztwbNfIPu0/zowaGIXWSxZH+CpP7jmP4wkkggdUQlCrHASpW8
         i83A==
In-Reply-To: <20200622031005.1890039-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>

The i2c bindings in the kernel tree describe support for 10 bit
addressing, which must be indicated with the I2C_TEN_BIT_ADDRESS flag.
When this is set the address can be up to 10 bits. When it is not set
the address is a maximum of 7 bits.

See Documentation/devicetree/bindings/i2c/i2c.txt.

Take into account this flag when checking the address is valid.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Mask reg when checking the 10-bit size
v3: Fix test
v4: Add U to define
---
 checks.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index 69b0156c940c..b7955dbd71ca 100644
--- a/checks.c
+++ b/checks.c
@@ -1023,6 +1023,7 @@ static void check_i2c_bus_bridge(struct check *c, struct dt_info *dti, struct no
 WARNING(i2c_bus_bridge, check_i2c_bus_bridge, NULL, &addr_size_cells);
 
 #define I2C_OWN_SLAVE_ADDRESS	(1U << 30)
+#define I2C_TEN_BIT_ADDRESS	(1U << 31)
 
 static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node *node)
 {
@@ -1057,10 +1058,13 @@ static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node
 		reg = fdt32_to_cpu(*(cells++));
 		/* Ignore I2C_OWN_SLAVE_ADDRESS */
 		reg &= ~I2C_OWN_SLAVE_ADDRESS;
-		if (reg > 0x3ff)
+
+		if ((reg & I2C_TEN_BIT_ADDRESS) && ((reg & ~I2C_TEN_BIT_ADDRESS) > 0x3ff))
 			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 10-bits, got \"0x%x\"",
 				  reg);
-
+		else if (reg > 0x7f)
+			FAIL_PROP(c, dti, node, prop, "I2C address must be less than 7-bits, got \"0x%x\". Set I2C_TEN_BIT_ADDRESS for 10 bit addresses or fix the property",
+				  reg);
 	}
 }
 WARNING(i2c_bus_reg, check_i2c_bus_reg, NULL, &reg_format, &i2c_bus_bridge);
-- 
2.27.0

