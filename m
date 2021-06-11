From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/4] libfdt: Check for integer overflows
Date: Fri, 11 Jun 2021 12:58:19 +0100
Message-ID: <20210611115823.31583-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Apparently some time ago some kind of audit or review of the Linux kernel
triggered some complaints about potential integer overflows in
libfdt[1][2]. The proposed patches there were not of good quality, and
never found their way into any upstream project anyway. This seemed to
assume fabricated DT blobs to upset libfdt, not sure how feasible this
scenario is in general.

This series tries to address the same issues, but hopefully in a better
way. The focus is on fdt_open_into(), since this operates on user
provided (writable) buffers, and a wrong offset could do some harm here.

I am not sure these patches here are the right solution, or whether we
should pursue a more general approach: Many problems stem from the
redundancy and so potential inconsistency of DTB header fields, namely
the total size, the various offsets and the various size fields.
fdt_check_header() seems to detect some of these issues, but it is not
used at the moment in fdt_open_into(). So we could add a call in
fdt_open_into(), or extend FDT_RO_PROBE() to also check for those issues.
Let me know what you think.

Because it was easy to do, patch 2/4 adds a test for one issue I could
reproduce (fixed by patch 1/4). I have some custom DTBs and tests to
catch the problem that patch 4/4 fixes, but need more time to write a
proper test case for this.

Cheers,
Andre

[1] https://nvd.nist.gov/vuln/detail/CVE-2014-9801
[2] https://nvd.nist.gov/vuln/detail/CVE-2014-9802

Andre Przywara (4):
  libfdt: Check for invalid memreserve block
  tests: Enhance truncated_memrsv to test fdt_open_into()
  libfdt: Check DT struct size for integer overflow
  libfdt: Protect buffer size checks against integer overflow

 libfdt/fdt_rw.c          | 63 +++++++++++++++++++++++++++++-----------
 tests/truncated_memrsv.c | 10 ++++++-
 2 files changed, 55 insertions(+), 18 deletions(-)

-- 
2.17.5

