From: Programmingkid <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v3] implement strnlen for systems
 that need it
Date: Wed, 25 Oct 2017 12:18:24 -0400
Message-ID: <EF4EBA89-3871-4902-8CBC-50A6AEF38292@gmail.com>
References: <20171023025016.3088-1-programmingkidx@gmail.com>
 <20171023160959.GC10220@stefanha-x1.localdomain>
 <CAFEAcA_13y2-uM11Ko_79TpEsfpFWMTz2-mAiwFseHfAM5CPgA@mail.gmail.com>
 <20171024121822.GE18756@stefanha-x1.localdomain>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=XEuq8S4utG68LM67HYn+8t4dk9GTxZ6+/hrWk4B6YRk=;
        b=VeqQqE73LFwyEql5BB2ZgHAOfH7WE5oodFaU6oc6+xqeWDV7tKWfSIX9eUbDrXMOHO
         XMuCkYvEXptkD0SAjlje3lMOc+J6iX8Y2zvcthrsAQLFvqKFWm6sOae4H6Lsfib+EAq3
         6OFCjJUcNRNDMrZWIWOlAj51ZnfNH1acqU+boiyFJ9lw2wqE2O6eTqOgBGPxovbtKbKq
         UFUSheUgG7OsbeD+Y8C+MkOSo34Je2ZyGMFhteffI/REYWgcjbp6W8Dy9t5JIajkl2+4
         E4N3viIMnFmaWjVmNGdvS0lJVKEeHynIYA1qEOJNYy4Q5Bfvl//Qmwstpl2jPOlfQUCf
         TrEA==
In-Reply-To: <20171024121822.GE18756-lxVrvc10SDRcolVlb+j0YCZi+YwRKgec@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, QEMU Developers <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org" <qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org


> On Oct 24, 2017, at 8:18 AM, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>=20
> On Mon, Oct 23, 2017 at 05:27:26PM +0100, Peter Maydell wrote:
>> On 23 October 2017 at 17:09, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>>> +/* strnlen() is not available on Mac OS < 10.7 */
>>>> +# if (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_7)
>>>=20
>>> Does this cover the case where MAC_OS_X_VERSION_MAX_ALLOWED is set =
to
>>> <1070 on a 10.7+ build machine?  It's possible that the <string.h>
>>> header would define strnlen() and your code redefines the function
>>> (compiler error).
>>=20
>> In that case you don't want to use the strnlen() declaration
>> from the header, you want the inline somehow, because even if
>> the declaration is present and using it doesn't fail compile
>> the definition won't be around at runtime.
>=20
> Perhaps one way around this case is to:
>=20
> # if !defined(MAC_OS_X_VERSION_10_7) || (MAC_OS_X_VERSION_MAX_ALLOWED =
< MAC_OS_X_VERSION_10_7)
> #  include <string.h> /* make sure it isn't included again */
> #  define strnlen fdt_strnlen
> static inline fdt_strnlen(...) { ... }
>=20
> This way the symbol strnlen() isn't used and the system headers cannot
> cause problems.

I really like this idea. I will implement it in my next patch. Thanks!
