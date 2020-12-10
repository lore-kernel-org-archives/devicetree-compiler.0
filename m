From: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Subject: Testsuite failures on sparc64 due to unaligned access since 1.5.0
Date: Thu, 10 Dec 2020 10:01:54 +0100
Message-ID: <10d4dbcb-506c-df88-cd71-f3ad27254341@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello!

The testsuite has been failing on sparc64 since around 1.5.0 due to unaligned access:

dtc -I dts -O dts -o type-preservation.dts.test.dts type-preservation.dts:	FAIL Killed by SIGBUS
dtc -I dts -O dts type-preservation.dts.test.dts:	FAIL Returned error code 1
cmp type-preservation.dts type-preservation.dts.test.dts:	FAIL Returned error code 1
dtc -I dts -O dtb -o path-references.test.dtb path-references.dts:	PASS
dtc -I dts -O dts -o path-references.test.dts path-references.dts:	PASS
dtc -I dts -O dtb -o path-references.test.dts.test.dtb path-references.test.dts:	PASS
dtbs_equal_ordered path-references.test.dtb path-references.test.dts.test.dtb:	PASS
dtc -I dts -O yaml -o type-preservation.test.dt.yaml type-preservation.dts:	FAIL Killed by SIGBUS

I have not done any bisecting yet, but this is most likely a result of someone casting
a pointer of type A into a pointer of type B which is normally not allowed but unfortunately
also not something that gcc complains about.

Full build log can be found in [1]. Access to a sparc64 porterbox running Linux can be obtained
through the gcc compile farm [2].

Thanks,
Adrian

> [1] https://buildd.debian.org/status/fetch.php?pkg=device-tree-compiler&arch=sparc64&ver=1.5.0-2&stamp=1565897062&raw=0
> [2] https://gcc.gnu.org/wiki/CompileFarm

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
`. `'   Freie Universitaet Berlin - glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
