From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/5] Move marker functions to dtc.h
Date: Mon, 27 Sep 2021 15:56:43 -0500
Message-ID: <CAL_Jsq+QAnyu=Fj_RtRu-dS4Ta0bZJWFUABsK1uKbnAKpXi1mA@mail.gmail.com>
References: <20210727183023.3212077-1-robh@kernel.org> <20210727183023.3212077-2-robh@kernel.org>
 <YScR9WbrB/1KHsk9@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632776216;
        bh=9yceA9mCoISjdiAMskPkvee6tqt3v7OZ+t79OhPOy8A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BQ/M4Li9VZSw/7sgdWSBlAiUjK+AC/1e55RmnewdTBaOI5/Y85IZgnOtLKOHmRJGk
         8Bs+0OtSaGpYniOtcuDR1s1G5y33LpinhIlUEli30m3In3xvvXrnxRHhO+PZDt0siV
         89FaDCbFYloDhIBzr5kP89zwzKbGf95ObkSrXXh5dOSY9JBy86gpD5L0NZsFcp0ODE
         Fo289i1ICPIVmffUq/cB29S5hF9CxwqFD6YWA9LCu5jEreR+XY2M1RFz/rbsuoAyVP
         q6kxTcOAAthbIPZAJ1709Qj2XzLuhXcmGP3UWF+L/Gj6/wo2NIXNuw6h4HKL26U/yL
         JY0DyPVjNroPQ==
In-Reply-To: <YScR9WbrB/1KHsk9@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Aug 25, 2021 at 11:09 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Jul 27, 2021 at 12:30:19PM -0600, Rob Herring wrote:
> > In preparation to share the marker related functions, let's move them all
> > out of treeresource.c into dtc.h. Rework the next_type_marker()
> > implementation to use for_each_marker() instead of open coding it.
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Applied, thanks.

I was about to say this never got pushed out. Then I looked at bit
harder and found this gem:

commit ff3a30c115ad7354689dc7858604356ecb7f9b1c
Author: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Date:   Tue Jul 27 12:30:19 2021 -0600

    asm: Use .asciz and .ascii instead of .string

    We use the .string pseudo-op both in some of our test assembly files
    and in our -Oasm output.  We expect this to emit a \0 terminated
    string into the .o file.  However for certain targets (e.g. HP
    PA-RISC) it doesn't include the \0.  Use .asciz instead, which
    explicitly does what we want.

    There's also one place we can use .ascii (which explicitly emits a
    string *without* \0 termination) instead of multiple .byte directives.

    Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

 dtc.h            | 23 ++++++++++++++++++++++-
 flattree.c       |  6 +++---
 tests/base01.asm | 38 +++++++++++++++++++-------------------
 tests/test01.asm | 52 ++++++++++++++++++++++++++--------------------------
 tests/trees.S    | 10 ++++------
 treesource.c     | 23 +----------------------
 6 files changed, 75 insertions(+), 77 deletions(-)


Perhaps your own commits should be sent to the list as well...

Are you going to apply or review the rest of my series that's been
sitting on the list for 2 months now?

Rob
