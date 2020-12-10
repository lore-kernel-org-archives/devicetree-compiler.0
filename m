From: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: Testsuite failures on sparc64 due to unaligned access since 1.5.0
Date: Thu, 10 Dec 2020 10:04:47 +0100
Message-ID: <4e3cdb1c-87c4-810b-513d-eaae64456d36@physik.fu-berlin.de>
References: <10d4dbcb-506c-df88-cd71-f3ad27254341@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10d4dbcb-506c-df88-cd71-f3ad27254341-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Content-Language: en-US
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 12/10/20 10:01 AM, John Paul Adrian Glaubitz wrote:
> I have not done any bisecting yet, but this is most likely a result of someone casting
> a pointer of type A into a pointer of type B which is normally not allowed but unfortunately
> also not something that gcc complains about.

Hmm, it seems someone fixed the issue on git master already:

Ran 36 tests in 0.017s

OK
********** TEST SUMMARY
*     Total testcases:  2068
*                PASS:  2068
*                FAIL:  0
*   Bad configuration:  0
* Strange test result:  0
**********

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
`. `'   Freie Universitaet Berlin - glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

