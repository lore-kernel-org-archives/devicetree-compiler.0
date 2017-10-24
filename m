From: Programmingkid <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v3] implement strnlen for systems
 that need it
Date: Mon, 23 Oct 2017 23:45:38 -0400
Message-ID: <FC571E15-495F-4D4D-9001-7FF76A74D162@gmail.com>
References: <20171023025016.3088-1-programmingkidx@gmail.com>
 <20171023160959.GC10220@stefanha-x1.localdomain>
 <CAFEAcA_13y2-uM11Ko_79TpEsfpFWMTz2-mAiwFseHfAM5CPgA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DggSe7yna6rMc+hxAak41FecbMF46ZGaMab3A62ttAs=;
        b=BbUB7++7SPZZk9VjajWmM8pZYPnxA+Ngo5egMduhSiBiBt3/2hNEK2VUP8eZaQdMEn
         U1XfeilQ0AfaYe8TfHf31muOLopvYnMtZ2vvfGBedwcTNLuPQvlrG0PszlGDJBQJG7QN
         EyZQK26oblY6q7X9qmx1nKQ+HOisTq/IWdNs2JuMaJ+5iiNo/dyAK6wDKTL0YZlWrWV/
         /74UjQvgMKDuaq2UAwZcLjnhQDTiUBJxwnM8aXtgz8wU/ZtdaMLiyPrXmyjLHmoCBVbw
         q/NtTe2Qyjn/3ZWnohWUug7hwosVB2HddaIUcKCveyLUHVzJpXZ1Hv2qRA83OdrPaGPY
         gPdg==
In-Reply-To: <CAFEAcA_13y2-uM11Ko_79TpEsfpFWMTz2-mAiwFseHfAM5CPgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, QEMU Developers <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org" <qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org


> On Oct 23, 2017, at 12:27 PM, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
>=20
> On 23 October 2017 at 17:09, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>> +/* strnlen() is not available on Mac OS < 10.7 */
>>> +# if (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_7)
>>=20
>> Does this cover the case where MAC_OS_X_VERSION_MAX_ALLOWED is set to
>> <1070 on a 10.7+ build machine?  It's possible that the <string.h>
>> header would define strnlen() and your code redefines the function
>> (compiler error).
>=20

I was operating under the assumption that MAC_OS_X_VERSION_MAX_ALLOWED =
would equal the version of the host. After making this little test =
program:

#include <stdio.h>
#include <AvailabilityMacros.h>

int main(int argc, char *argv[])
{
    printf("value =3D %d\n", MAC_OS_X_VERSION_MAX_ALLOWED);
}

It reports:
"value =3D 101204" on Mac OS 10.12.6 (I'm not sure why there is a 04)
and
"Value =3D 1068" on Mac OS 10.6.8

Is using MAC_OS_X_VERSION_MAX_ALLOWED not a reliable macro to use to =
test for the version of the Mac OS? The ui/cocoa.m file seems to use it =
and have no problems. I don't think we have to worry about =
MAC_OS_X_VERSION_MAX_ALLOWED being set to less than 1070 on Mac OS 10.7 =
and up.=20

> In that case you don't want to use the strnlen() declaration
> from the header, you want the inline somehow, because even if
> the declaration is present and using it doesn't fail compile
> the definition won't be around at runtime.
>=20
>> It would be best to check how <string.h>, <Availability.h>, and
>> <AvailabilityMacros.h> work to make sure that all cases are handled.  =
I
>> don't have access to a Mac right now, sorry.
>=20
> It uses the clang 'attribute availability' syntax:
> https://clang.llvm.org/docs/AttributeReference.html#availability

This feature appears to be a clang/gcc-only feature. Using it would mean =
making this code compiler locked. The Device Tree Compiler project (that =
this code belongs to) is made by IBM personnel. They might want to be =
able to use other compilers including their own IBM XL C compiler to =
compile this project. Even if that part of the code is only to run on =
Mac OS X I still would like to keep the code generic enough for any =
compiler to be able to build the Device Tree Compiler project.

