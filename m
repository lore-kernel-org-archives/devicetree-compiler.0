From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC PATCH 3/5] overlay: a.dts, example of an old style dts file to be converted
Date: Tue, 27 Dec 2016 23:20:15 -0800
Message-ID: <1482909617-31950-4-git-send-email-frowand.list@gmail.com>
References: <1482909617-31950-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qR4mAt8FNWfT1tCcgOZ4jP307bzktbiKDi2/M6B6fD4=;
        b=mDtHwF6tICtWuO31WBXHOA45XQc3J1M72MByeNfLsP7qasqfFOhbN+TLqUdheaC5mo
         /+cIuQ8px1q5NYF/lnJhZ9PyZT4tuceDVdG87BGxY7VXKCdyDfuauY3pCNaqA/YJfGJT
         m6mK4NhRNl+T0IwWe3He7ON47J6bb9h4D8ImHEZnIdX5wn5j11K/u8Zmuvj9RUf1n7zL
         x8JkUrxirpdezqllHPNLhffOsZKt7UA0RlMfcpLURzGUqC1UWjWeI/+CbT09g8Q2simq
         CAA1zbb9sYLA8O85X/rhjUDXVKxezJw+H/2ozl937pLzQ8KECvJqeVAbRUCjIRZTQh6O
         HcWw==
In-Reply-To: <1482909617-31950-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Requires a dtc that supports the new syntactic sugar.
One such version is commit: 6f4db2fc2354 DTBO magic and dtbo format options
in url = https://github.com/pantoniou/dtc

$ export PATH="$PATH:/path/dtc/"
$ ./overlay_convert_old_to_new a.dts b.dts


Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 a.dts | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 a.dts

diff --git a/a.dts b/a.dts
new file mode 100644
index 000000000000..ec21206a081f
--- /dev/null
+++ b/a.dts
@@ -0,0 +1,37 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target = <&am3353x_pinmux>;
+
+		__overlay__ {
+
+			i2c1_pins: pinmux_i2c1_pins {
+				pinctrl-single,pins = <
+					0x158 0x72
+					0x15c 0x72
+				>;
+			};
+		};
+	};
+
+	fragment@1 {
+		target = <&i2c1>;
+
+		__overlay__ {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_pins>;
+			clock-frequency = <400000>;
+			status = "okay";
+
+			at24@50 {
+				compatible = "at,24c256";
+				pagesize = <64>;
+				reg = <0x50>;
+			};
+		};
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
