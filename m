From: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Subject: valgrind tests don't test anything
Date: Sun, 8 Mar 2020 19:32:21 +0100
Message-ID: <20200308183221.GA10025@comp.lan>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

I'm not sure this is what David Gibson meant in
67b6b33b9b413a450a72135b5dc59c0a1e33e647 when he said:

"At present the valgrinding won't do anything useful for testcases
invoked via a shell script - which includes all the dtc testcases.  I
plan to fix that later."

but if valgrind is called without --leak-check=full as in line 1038 in
tests/run_tests.sh it always returns 0 to the parent process and it
looks like there are no errors but in fact dtc suffers from memory
leaks:

$ valgrind ~/dtc/dtc -O dts t2080qds.dts
(...)
==9428==
==9428== HEAP SUMMARY:
==9428==     in use at exit: 286,968 bytes in 8,355 blocks
==9428==   total heap usage: 11,162 allocs, 2,807 frees, 1,157,178 bytes allocated
==9428==
==9428== LEAK SUMMARY:
==9428==    definitely lost: 5,619 bytes in 174 blocks
==9428==    indirectly lost: 106 bytes in 6 blocks
==9428==      possibly lost: 0 bytes in 0 blocks
==9428==    still reachable: 281,243 bytes in 8,175 blocks
==9428==         suppressed: 0 bytes in 0 blocks
==9428== Rerun with --leak-check=full to see details of leaked memory
==9428==
==9428== For lists of detected and suppressed errors, rerun with: -s
==9428== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)

If valgrind invocation in tests/run_tests is changed to something like
this:

VALGRIND="valgrind --leak-check=full --tool=memcheck -q --error-exitcode=$VGCODE"

then `make checkm' fails:

********** TEST SUMMARY
*     Total testcases:  2067
*                PASS:  1552
*                FAIL:  1
*   Bad configuration:  0
*    valgrind errors:   514
* Strange test result:  0
**********
tests/Makefile.tests:92: recipe for target 'checkm' failed
make: *** [checkm] Error 1

-- 
Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
