From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] fdtoverlay, an overlay application tool
Date: Wed, 14 Jun 2017 17:51:10 +0300
Message-ID: <1497451872-15289-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=+PmZaLPxQXg1OQpgOavM6CPkDJyXzNXYiOcGUltGvF4=;
        b=BtNpmEnSkcdmP8tKQqKS2bLOtrdfFA6b9kUbgg4fKla12T9/SX1SHZqYMzknIv8Tk3
         k/V7Bxo3lxrvB3siilgAc2IMQEvPP5lvNs+HUngubmGGR+817GP8YhHDa8TvN4/EMnE1
         HvgE7ik+SvImU89FU4mCDLIZna3zplxIkc+yo=
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

libfdt supports overlays, so it's trivial to create a tool
that applies them on a host using binary blobs.

fdtoverlay is that tool which given a base tree and a number
of overlays generates a target blob as the result.

Pantelis Antoniou (2):
  fdtoverlay: A tool that applies overlays
  tests: fdtoverlay unit test

 Documentation/manual.txt    |  14 ++++
 Makefile                    |   5 ++
 Makefile.utils              |   6 ++
 fdtoverlay.c                | 168 ++++++++++++++++++++++++++++++++++++++++++++
 tests/fdtoverlay-runtest.sh |  40 +++++++++++
 tests/run_tests.sh          |  27 ++++++-
 tests/tests.sh              |   1 +
 7 files changed, 260 insertions(+), 1 deletion(-)
 create mode 100644 fdtoverlay.c
 create mode 100644 tests/fdtoverlay-runtest.sh

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
