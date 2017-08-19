From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 03/10] tests: Return a failure code when any tests fail
Date: Sat, 19 Aug 2017 11:17:56 -0600
Message-ID: <20170819171803.195806-3-sjg@chromium.org>
References: <20170819171803.195806-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qKylPCT4bJXPMCW7rH5/lUMrEXB6e8wxqjuPbh/54Zk=;
        b=vuhK+RMBwrREOvn0rKOpoJ9+Z5x1kIc6u+nkY4L5en5MX3w/4OROMRi/SqeHGC9Q2i
         xLGsdUPwqLDGbSD8BFmHbz/FY0taJ8ikLfn1+qblikaZi8LMidlmeYe0UxhF2qNBcvL1
         5BYsaXHoiGBC2uOkS4MOkVuUWq4d/dMoSrze9bDX6Sxtum5rbJeQ3fsGtzbCTHNlppBh
         Hb231SCYPt8aeorzokVT5s2qPb4ChkTTJcUyhR7+MdkyBi05oHKEfuLn3FHJZr2gsMez
         yvC/pe9HGVKMyt598MCXeLL8VTG9Yl2tuETW7QSmkZtK/yV+w3UxPAYyY9ag3UYaFFqu
         vH0w==
In-Reply-To: <20170819171803.195806-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

At present 'make check' succeeds even if some tests fail. Adjust this so
that we can use things like 'git bisect run make check' to find a failure.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 tests/run_tests.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 3bc5b41..fa7b2f7 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -900,3 +900,4 @@ fi
 echo "* Strange test result:	$tot_strange"
 echo "**********"
 
+[ "$tot_tests" -eq "$tot_pass" ] || exit 1
-- 
2.14.1.480.gb18f417b89-goog
