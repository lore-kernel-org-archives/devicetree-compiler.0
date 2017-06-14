From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] Overlay syntax sugar using <&label>
Date: Wed, 14 Jun 2017 17:53:03 +0300
Message-ID: <1497451986-15515-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=XcQw682Co+XgmP9VzzKlPHLeo1Uneeif7pzS9jLcdHA=;
        b=lqT+r4V4VZmOm4YN+pVRJT86Y1xQkjvlF9QcfbNFlyUSArieAJmbUTUHpo3L8ZVMtr
         gGFtuQDoK9iGsTbtT2ibOO+k/ww92vzDBoT5YUTr4kC+1tUAw3VcABf93dcWtnbQdnN8
         sL2EHA9pIHPn7wgIr+3dGBP6uwTV1Z7o6kDuQ=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

This patchset makes overlays simpler to write by utilizing
the standard &label { }; syntax instead of the manual
method which is more error prone.

Pantelis Antoniou (3):
  overlay: Documentation for the overlay sugar syntax
  overlay: Add syntactic sugar version of overlays
  tests: Add a test for overlays syntactic sugar

 Documentation/dt-object-internal.txt | 17 +++++++++++++++++
 dtc-parser.y                         | 20 +++++++++++++++++---
 dtc.h                                |  1 +
 livetree.c                           | 22 ++++++++++++++++++++++
 tests/run_tests.sh                   |  6 ++++++
 5 files changed, 63 insertions(+), 3 deletions(-)

-- 
2.1.4
