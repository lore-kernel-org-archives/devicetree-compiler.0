From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/6] libfdt: Sync to upstream
Date: Sun,  2 Oct 2016 17:59:24 -0600
Message-ID: <1475452771-16230-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=ZisOd0oKOuYclBJuzgfMNH0Jxh1dPGaF9ABt6/RZYtE=;
        b=doUnlhWpygxl36kzN/IqrG+XpMVru/4uwubayhD61+faTToCFpmoGb5eJ86mM0IbiW
         sMqAPiK+Aodkc6jH5e7x5HccZKy54UuynW58GkzLFsxhN9rHr7xlIIwTwpkw3j6EifZF
         ak+aBpEnI6F3AkDPt4vJVZzhiacDaOUsTQTV0J5/k34bEjqGG5jszRTIjj3Hk4EDsB3H
         VseO5XGFOWVYv+2V19R/GbptivXT4JMYUW8gCCC0vC2E5Sv4xfqOk7HoT/oUUV+tyYyr
         m5LfI+fW9d5sWx5MCYUKMkDBJFCktYiySRkD3xUnKd4ygmnPlMJjG86ajgKcuM2DSf2r
         dMkg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Nikita Kiryanov <nikita-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, Andrej Rosano <andrej-6l9oX9VzF44FueaiHvvTSg@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>, Minkyu Kang <mk7.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Przemyslaw Marczak <p.marczak-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tom Warren <twarr>

In a few cases the upstream versions of functions first written for U-Boot
have landed in a slightly different form.

This includes a few patches to fix these as well as various minor changes to
reduce the delta.


David Gibson (1):
  libfdt: Fix undefined behaviour in fdt_offset_ptr()

Hannes Schmelzer (1):
  cmd/fdt: add possibilty to have 'extrasize' on fdt resize

Simon Glass (4):
  libfdt: Sync up with upstream
  libfdt: Bring in upstream stringlist functions
  libfdt: Sync fdt_for_each_subnode() with upstream
  libfdt: Drop inlining of fdt_path_offset()

 arch/arm/mach-tegra/xusb-padctl-common.c |  18 +--
 arch/arm/mach-uniphier/board_late_init.c |   5 +-
 arch/x86/cpu/irq.c                       |   5 +-
 board/compulab/cm_fx6/cm_fx6.c           |   2 +-
 cmd/fdt.c                                |   9 +-
 common/fdt_support.c                     |   3 +-
 common/image-fdt.c                       |   2 +-
 common/image-fit.c                       |  21 ++--
 common/image-sig.c                       |   8 +-
 common/image.c                           |  19 ++--
 drivers/clk/clk-uclass.c                 |   6 +-
 drivers/core/device.c                    |   2 +-
 drivers/gpio/dwapb_gpio.c                |   3 +-
 drivers/i2c/mxc_i2c.c                    |   2 +-
 drivers/mailbox/mailbox-uclass.c         |   6 +-
 drivers/net/cpsw.c                       |   2 +-
 drivers/net/keystone_net.c               |   4 +-
 drivers/net/mvpp2.c                      |   2 +-
 drivers/net/sun8i_emac.c                 |   5 +-
 drivers/pci/pci_tegra.c                  |   2 +-
 drivers/phy/marvell/comphy_core.c        |   2 +-
 drivers/pinctrl/exynos/pinctrl-exynos.c  |   9 +-
 drivers/pinctrl/meson/pinctrl-meson.c    |   4 +-
 drivers/pinctrl/pinctrl-generic.c        |  10 +-
 drivers/pinctrl/pinctrl-uclass.c         |   2 +-
 drivers/reset/reset-uclass.c             |   6 +-
 drivers/spi/fsl_qspi.c                   |   2 +-
 drivers/video/sunxi_display.c            |   2 +-
 include/fdt_support.h                    |  10 +-
 include/libfdt.h                         | 187 ++++++++++++++++++-------------
 lib/fdtdec.c                             |   4 +-
 lib/libfdt/fdt.c                         |  13 ++-
 lib/libfdt/fdt_overlay.c                 |   8 +-
 lib/libfdt/fdt_ro.c                      | 119 ++++++++++++--------
 lib/libfdt/fdt_rw.c                      |   4 +-
 lib/libfdt/fdt_wip.c                     |   6 +-
 test/overlay/cmd_ut_overlay.c            |   5 +-
 37 files changed, 298 insertions(+), 221 deletions(-)

-- 
2.8.0.rc3.226.g39d4020
