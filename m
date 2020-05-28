From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v3 2/2] checks: Improve i2c reg property checking
Date: Thu, 28 May 2020 18:26:50 +0930
Message-ID: <20200528085650.1417942-3-joel@jms.id.au>
References: <20200528085650.1417942-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQKunO301mb0ILEr+NPZgO7bp9n1H6FfQ2srvINBCOE=;
        b=MTfXy5NBwQf8yerkXWtrjRQ9rtCeEuzfrwW1PRLGWA4DyhwPipNMeAR+vlYDJE/1y2
         QDrg1Juau4oKkjsTjPkdG2pahwMG0lsvCagY+HTuA+/6abq4Un+n7NvNwsBeL4goY8tz
         vCf/e/RXXyAFbFAZyYgOuo2iqqV0wDnpNl9a6y3kINwVCXYzUWoY8Cyk08TdPW982szN
         bTUX2SArTO8QtmBG2bCo2JJpxIjvpQ27e5XQZorTqRdvxmKf3vie4b3Fh+3OPrUETkFi
         HAxGLgIk7yPlD520GBnC0//VFasCTGpM40S/lTWANmLqGrveFS7oBeYMxp4GRVJ7D636
         Gpyw==
In-Reply-To: <20200528085650.1417942-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

The i2c bindings in the kernel tree describe support for 10 bit
addressing, which must be indicated with the I2C_TEN_BIT_ADDRESS flag.
When this is set the address can be up to 10 bits. When it is not set
the address is a maximum of 7 bits.

See Documentation/devicetree/bindings/i2c/i2c.txt.

Take into account this flag when checking the address is valid.

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
v2: Mask reg when checking the 10-bit size
---
 checks.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index feb1721f2603..3fe979a63290 100644
--- a/checks.c
+++ b/checks.c
@@ -1023,6 +1023,7 @@ static void check_i2c_bus_bridge(struct check *c, struct dt_info *dti, struct no
 WARNING(i2c_bus_bridge, check_i2c_bus_bridge, NULL, &addr_size_cells);
 
 #define I2C_OWN_SLAVE_ADDRESS	(1 << 30)
+#define I2C_TEN_BIT_ADDRESS	(1 << 31)
 
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
2.26.2

