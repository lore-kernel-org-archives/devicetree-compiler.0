From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/2] stacked overlay support
Date: Tue, 25 Jul 2017 20:24:34 +0300
Message-ID: <1501003476-2480-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=4Nmo/xEjQBFanxXNDrIbO4mt6afOCvz3Nm30cFKPysU=;
        b=JF5OY4rnROUDP/6v18EcVSZ1qFMQ8mvpDM9Bu0aL1dXenGmKvuYWk1N9fjxhcyoua0
         o7GPuyzXNoeJgUbFGtXxq2zM4po0Z/ZIOa2NWcECJ8NNyZL24HusbnhVm6YoNPYVfpP8
         8Z9QV36qMuR6VE4J2aYBkQRzj2pAYQ3jgzRoc=
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Overlay application has a shortcoming that it is not possible
to refer to labels that were defined by a previously applied
overlay.

This patchset fixes the problem by keeping around the labels
that each overlay contains.

It is dependent on two previously submitted patches
"Introduce fdt_get_path_len() method"
"Introduce fdt_setprop_placeholder() method"

Changes since V2:
* Rework to make application faster when using target-path
* Various cosmetic fixes

Changes since V1:
* Rework to remove reliance on malloc and FDT_PATH_MAX


Pantelis Antoniou (2):
  fdt: Allow stacked overlays phandle references
  tests: Add stacked overlay tests on fdtoverlay

 libfdt/fdt_overlay.c           | 197 ++++++++++++++++++++++++++++++++++++-----
 tests/run_tests.sh             |  15 ++++
 tests/stacked_overlay_bar.dts  |  13 +++
 tests/stacked_overlay_base.dts |   6 ++
 tests/stacked_overlay_baz.dts  |  13 +++
 5 files changed, 222 insertions(+), 22 deletions(-)
 create mode 100644 tests/stacked_overlay_bar.dts
 create mode 100644 tests/stacked_overlay_base.dts
 create mode 100644 tests/stacked_overlay_baz.dts

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
