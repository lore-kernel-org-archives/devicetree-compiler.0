From: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: Testsuite failures on sparc64 due to unaligned access since 1.5.0
Date: Fri, 11 Dec 2020 15:14:26 +0100
Message-ID: <3b237853-dd8c-99b7-e258-7c51e9970560@physik.fu-berlin.de>
References: <10d4dbcb-506c-df88-cd71-f3ad27254341@physik.fu-berlin.de>
 <4e3cdb1c-87c4-810b-513d-eaae64456d36@physik.fu-berlin.de>
 <20201211010739.GB4874@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201211010739.GB4874-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Content-Language: en-US
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org

Hi!

On 12/11/20 2:07 AM, David Gibson wrote:
> Right, alignment issues have been a perennial problem.  We find some
> platform that has alignment constraints that break, fix that, then
> someone finds the alignment fixups cause horrible performance
> problems, repeat ad nauseum.

From my discussions with GCC developers I have learnt that it shouldn't
be a problem to use memcpy() in such cases to avoid aliasing problems
resulting in unaligned access.

GCC will just optimize memcpy() in cases where an unaligned access is
faster.

> There's been another round of this pretty recently, which is probably
> the cause of the fixup.  I just hope the re-optimizations that Tom
> Rini has in his pipeline don't break things again for you.

The GCC compile farm has two fast SPARC servers [1] running Debian unstable,
so I suggest testing such changes there before merging them.

Adrian

> [1] https://gcc.gnu.org/wiki/CompileFarm

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
`. `'   Freie Universitaet Berlin - glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

