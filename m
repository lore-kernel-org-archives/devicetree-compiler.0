From: Sergei Trofimovich <slyich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] Makefile: limit make re-execution to avoid infinite spin
Date: Sun, 25 Sep 2022 11:42:02 +0100
Message-ID: <20220925104203.648449-1-slyich@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=55n/5TFpg6COqaCNVxWATNQooUs8qKfKFoRLdu6B5oE=;
        b=GTShdj1SYkQE5jP9UvNP9jaR3VSeuGOsbsB4Ldoc48YQmr1ExOFy+sM1+fKbhD8fEq
         7jKg2N9FawuAgRVIe9+NJxWXe6yz0j3RMUVmjGOKaUMUUAt++5J3gE9b1LxQ4Q1EJPgD
         0fTHObLuwkKrYRgkBmLhru28M8lRReny8k/nFqVbBgHw7MGvmBaHGZWzHcCqmTIFQ3Kc
         DobT0djkY2rIAmu2l8eBXGDDMJfvIabnQM269E69CNbs8dsDw+yHbr5anr4QZHv6k3N+
         SODqAWm1EYIJeCBUd8MlexYenRS3UccljoLFInuBNYLTe7yRPgUMKuJ02kKrnarVHijF
         0/dg==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergei Trofimovich <slyich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

make-4.4 became intentionally more eager at rebuilding outdated Makefile
includes. Currently this causes `dtc` to spin infinitely in
parser/dependency loop:

    $ make
    ...
        CHK version_gen.h
         BISON dtc-parser.tab.h
         DEP dtc-lexer.lex.c
         DEP dtc-parser.tab.c
        CHK version_gen.h
         BISON dtc-parser.tab.h
         DEP dtc-lexer.lex.c
         DEP dtc-parser.tab.c
    ... # never stops

After the change build eventually fails when gets into this state:

    $ make
    ...
        CHK version_gen.h
        UPD version_gen.h
         DEP util.c
         BISON dtc-parser.tab.h
         DEP dtc-lexer.lex.c
         DEP dtc-parser.tab.c
        CHK version_gen.h
         BISON dtc-parser.tab.h
         DEP dtc-lexer.lex.c
         DEP dtc-parser.tab.c
    Makefile:394: *** "Make re-executed itself 10 times. Infinite recursion?".  Stop.

The actual recursion will be fixed separately.

Signed-off-by: Sergei Trofimovich <slyich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 9f1223f..e7a0dcb 100644
--- a/Makefile
+++ b/Makefile
@@ -389,3 +389,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
 	$(BISON) -b $(basename $(basename $@)) -d $<
 
 FORCE:
+
+ifeq ($(MAKE_RESTARTS),10)
+$(error "Make re-executed itself $(MAKE_RESTARTS) times. Infinite recursion?")
+endif
-- 
2.37.2

