From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [RFC PATCH v2 3/4] ARM: dts: stm32: Add dtb build information entry for stm32mp157c-dk2
Date: Fri, 21 Feb 2020 17:12:16 +0100
Message-ID: <20200221161217.20069-4-alexandre.torgue@st.com>
References: <20200221161217.20069-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jpGwlIt47yPIpufPaalWQk8BJYpMwbVfmtKu9t8gwX0=;
 b=q9sbNVdgXDNg5ECEqfnocHvmg1DBnIsAqxCZjDlCmMCtcGjNNeuerJMqdiRtbiyxkRuR
 veGOY5K+j8/mrAtRof0kWmRRApjkmWa7rJIWMgaEc93WX1+I03ztpscvS/Sb222NL2Sg
 cyA8Zi3+EUuuBkJFsppcC5v33qvGXP45mZwNHARtlqQi9tmG5gUbMCvN6DpmBm5rd0rZ
 oOxU8yYLzhWIJ0PN1OnmNtTEGT7Y3qpx67PM32TlZ8/RDOV3zELy4a+tZfuz7u2yxTab
 8e2IkhU2eUYpClfSvyFa4sQVtsi06WXY3w4cjgGkDjwlbkUZJ4zmK0OgMeUemwVGQ9j2 yw== 
In-Reply-To: <20200221161217.20069-1-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, Ian Lepore <ian@freebsd.org>

dtb-build.txt is a file containing device tree build information (date,
source version ...). This file is used to fill "build-info" entry which
will be displayed during kernel boot.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index 7985b80967ca..387d3bcf5fa3 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -15,6 +15,7 @@
 / {
 	model = "STMicroelectronics STM32MP157C-DK2 Discovery Board";
 	compatible = "st,stm32mp157c-dk2", "st,stm32mp157";
+	build-info = /incbin/("dtb-build.txt");
 
 	aliases {
 		ethernet0 = &ethernet0;
-- 
2.17.1

