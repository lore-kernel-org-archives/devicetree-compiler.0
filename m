From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Qemu-devel] [libfdt][PATCH v3] implement strnlen for systems
 that need it
Date: Tue, 24 Oct 2017 07:52:28 +0100
Message-ID: <CAFEAcA-x89pucjLdZT7wp4yKcVdOa=W2v697JCiWeR+4QWW6cw@mail.gmail.com>
References: <20171023025016.3088-1-programmingkidx@gmail.com>
 <20171023160959.GC10220@stefanha-x1.localdomain> <CAFEAcA_13y2-uM11Ko_79TpEsfpFWMTz2-mAiwFseHfAM5CPgA@mail.gmail.com>
 <FC571E15-495F-4D4D-9001-7FF76A74D162@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=CFzkE/qk0do5ZQVZiqGI1rhuTv5+2sMSSQGAHM0IWws=;
        b=P+s3bGY4IdLwYHBEwxFULcB0by7KOkSp5e2Je3vuIZabXMxzIXu4O0BtQDoFO4d2yf
         A2XN8v3F4Gw77SMywlbpF9LkugZIV9d8kKgCoXplaacqk1oXbUGbCbUuyM6OWJmVv4Ff
         IRhWTwOL0HhdZZPRa4JciLcWKcK/00UI5MaCo=
In-Reply-To: <FC571E15-495F-4D4D-9001-7FF76A74D162-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Programmingkid <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, QEMU Developers <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org" <qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org

On 24 October 2017 at 04:45, Programmingkid <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I was operating under the assumption that MAC_OS_X_VERSION_MAX_ALLOWED
> would equal the version of the host.

It indicates the highest version of OSX whose features the
program being compiled is allowed to use. That isn't necessarily
the same as the highest version of OSX the SDK we're compiling
against supports -- you can be building against a 10.9-aware
SDK and tell it "only use features up to and including those
on 10.7."

> After making this little test program:

You don't need to test this kind of thing, it is documented,
and in general reading the documentation is more reliable and
more informative than testing.

> Is using MAC_OS_X_VERSION_MAX_ALLOWED not a reliable macro to
> use to test for the version of the Mac OS? The ui/cocoa.m file
> seems to use it and have no problems.

QEMU's usage differs in two ways:
(1) we just use the macros to #ifdef out code that would
be trying to use functions that don't exist in the older
versions, which is exactly what it's intended for. We
don't try to implement our own versions of those functions
under the same names
(2) we control QEMU's build process and so we can guarantee
that we aren't using the "build on a 10.9 SDK but make sure
you don't use features that aren't in 10.7" functionality.
libfdt is a library that can be included in many other
programs, so we can't make that assumption.

>> It uses the clang 'attribute availability' syntax:
>> https://clang.llvm.org/docs/AttributeReference.html#availability
>
> This feature appears to be a clang/gcc-only feature.

This was a reply to Stefan's question about how the OSX
availability headers are implemented. (As it happens the OSX
headers do have an "if not clang then just #define away
the availability attributes" codepath.)

thanks
-- PMM
