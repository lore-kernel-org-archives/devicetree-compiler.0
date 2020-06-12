From: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: libfdt: extern "C" for c++?
Date: Fri, 12 Jun 2020 16:43:00 +1000
Message-ID: <CAEg67Gnr08YGvX7BdOcOK0V5u0nV=pNcpE4ofKoDOyAiqRaAfQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=yON2ht27U7ytYiocP2u71MhUh02YZ9z1h3K1q8njUQc=;
        b=ENiM1Rs5BKNtDjyJqawERzmyX3r1SS2ZyYi3CjTByKk5FvYxvFDe5sXqPJQ/I5389e
         k0f5XwcLZn9eaE8vfLlIEYGUUnwu2nz3egUiWQS5YIqyWfpumuijVZP5Iw6V2QnhY62T
         Jw+5AEKYW9bpg2I67Cpu7o+l74ONvsRW+evnVpxRmowGNq6bx6bwtdHO+2tFShRCXlsk
         Xb2mS4aB6Dj3nS9AthOb1OYrw7FabNJIFjqnprJASo6ZCkAuHCoKAf+8gSETp7RSOyFs
         u5RLr3/J9wUh4CEODLmiEV9J0fOKnM6zeFCLvYKHVo/vGeuTyiytbLT8/ujtD9IsRx/i
         58QQ==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

I'm using libfdt from C++ and have to:

extern "C" {
#include <libfdt.h>
}

to get it to link.

Would you accept a patch which adds extern "C" to libfdt headers where
appropriate?

Thanks,

Patrick
