From: Vikram Garhwal <fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/1] libfdt: overlay: make overlay_get_target() public
Date: Wed, 17 Nov 2021 18:53:55 -0800
Message-ID: <1637204036-382159-1-git-send-email-fnu.vikram@xilinx.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbMfLfzn5xbO72aQS8ZY2RTi35axsqRaWqwUZsgZv4k=;
 b=jIm0lSnKF3o21YvmT3D1e8p0PNDrK2komSrvmcSOhpwXtQmZmH5mo3Bk4SkIkImuVrS6mTthY7xNvxWnuHVilaeJrVs4G1KE8ZvXtmISfFHc4UN29Oqnt0p9YIBgLI+qAylzGRZWmfpfZsOV+dGu4iAsPJWG00dc4YUZ+DgjNLQ=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, Vikram Garhwal <fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Changes in v2:
v1 -> v2:
    Improve patch subject.
    Rename fdt_overlay_get_target to fdt_overlay_target_offset
    Rename fragment to fragment_offset

Regards,
Vikram

Vikram Garhwal (1):
  libfdt: overlay: make overlay_get_target() public

 libfdt/fdt_overlay.c | 29 +++++++----------------------
 libfdt/libfdt.h      | 18 ++++++++++++++++++
 libfdt/version.lds   |  1 +
 3 files changed, 26 insertions(+), 22 deletions(-)

-- 
2.7.4

