From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [RFC PATCH 0/3] Add device tree build information
Date: Mon, 13 Jan 2020 19:16:22 +0100
Message-ID: <20200113181625.3130-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WEGaEwx/ta6sY7T0Fd98KdzWPvWPmF9vLPRCHL2k/9I=;
 b=OCTJgx0Tfaj0GjPrU4PzpoUKJq+f9AD5dJ11hx8xMjbCCgJc1+Xzae8q+YhUaLFRsuV2
 9b6RFfWG0grpGsgs3gz9i6jbiECabhOi295sXa3DPeSDLmwwAPO3zTdPgPb3Cy9GMmFy
 tob1X6sR8Swk5Y+tRtVqX/8O4UgXMuf1165oookhx2xvGPdaLlcjoHiVPhnRthLxXbRK
 UTjPht3U9VTA+dMrCdt7135Ro1yFN78GhHtPA8+2M+4K2GCF+N1F6f/rNXrsLdDrnfO3
 Wdz4glfXovHztMfRCFh3FclrABChbfkKQ5f7bOtsucUMyaZ2hCvU1Qinfxwuc70reh60 lg== 
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org

Hi,

The goal of this series is to add device tree build information in dtb.
This information can be dtb build date, where devicetree files come from,
who built the dtb ... Actually, same kind of information that you can find
in the Linux banner which is printout during kernel boot. Having the same
kind of information for device tree is useful for debugging and maintenance.

To achieve that a new option "-B" (using an argument) is added to dtc. 
The argument is a file containing a string with build information
(e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
DTC use it to append dts file with a new string property "Build-info".

of/fdt.c is modified to printout "Build-info" property during Kernel boot and 
scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
last part could be improved for sure).

Regards
Alex

Alexandre Torgue (3):
  dtc: Add dtb build information option
  of: fdt: print dtb build information
  scripts: Use -B dtc option to generate dtb build information.

 drivers/of/fdt.c           |  9 +++++++
 scripts/Makefile.lib       | 11 +++++---
 scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
 scripts/gen_dtb_build_info | 11 ++++++++
 4 files changed, 76 insertions(+), 10 deletions(-)
 create mode 100755 scripts/gen_dtb_build_info

-- 
2.17.1

