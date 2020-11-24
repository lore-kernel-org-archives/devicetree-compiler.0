From: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/1] libfdt: Change last_comp_version to fit spec
Date: Tue, 24 Nov 2020 09:49:44 -0800
Message-ID: <20201124174945.5399-1-jujugoboom@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VooROwnN4D7m6YlRmbjpr03cq4GEJikCOR+QTMftUr4=;
        b=Ocx39IJVavTlrILZKFxcQ//xrjYPPYlM4Le62EBLvRVB7xiAE347cZgBUnBdVaqC7I
         atbSvkboJrp2y2m+ru84h8o9CZj4Gh0DokZ7xrTklx9YwcjOeLsIOhz1OZ5iSApubd/e
         +4HmsN5+TvBOYgFjOdYt0RwTjqLdsn/kSPRWtCu36BnD/t2Iwbv/6aBPJXGrw9lk8LFB
         oPzWR7tpsH16frnQ44eQs2F4lUa5H11Ke1tu2z3FBD3L6Wsc1ZSmY2BCBtTZemISrJG+
         bJx/hjcpeApyiOvcrmduxtOK+tmKzTEQwRGbvIazWOuHqZfPQJTl/k0HRa9vJ6iT7JuG
         Qwlg==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This adds a new FDT_LAST_COMPATIBLE_VERSION constant that should keep up to date to match devicetree spec. Since
the latest format spec specifies that version 17 is compatible with version 16, but not earlier versions, this
constant has been set to indicate that newly generated devicetrees are compatible with version 16. 

Signed-off-by: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Justin Covell (1):
  libfdt: Change last_comp_version to fit spec

 libfdt/fdt_sw.c | 2 +-
 libfdt/libfdt.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

