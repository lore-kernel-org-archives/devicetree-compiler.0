From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v9 2/5] Add tests for pylibfdt
Date: Mon, 6 Mar 2017 09:48:02 -0700
Message-ID: <CAPnjgZ3Pzwam_MkWhnEW95E3x7Nm8WibYhqbi9iCGutDqJXB0A@mail.gmail.com>
References: <20170304235229.5343-1-sjg@chromium.org> <20170304235229.5343-3-sjg@chromium.org>
 <20170306052548.GA29285@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=j3rNOWRmi2S3E5kOKVSUmMUO2EBwLpwGqow0NJYxMMU=;
        b=PqYQBLajNZVHUoyfkQ0Zlkn9pHgoG/JfQoK7InKlzRpZgVyr3wGHh2peK7KiDqfBez
         anNwPhi5xJr/Y1uY8srxhXmG3ttkHVsX9b8v4TUcLkQzOi7QDiRomJLvPg7765VA9KZW
         zCLtHKi63iKlD8H2+hmUu8PEYLOqJqEhE5sy9XPV7ppgsRFXDvUFC2h8l0diTTxlQmZw
         sLAjbyQewET3YgMq3HOZecnQlTkQzIbLHSmJYdfcw3S44M5We2WzZ63Rr0bSALL4IIlR
         R/YJsmfepIQADcAg+ymvIHaBhGS4yKmxZ+/Re5bb+3j0mbofQKLC3/BV/7h5PkKbUng/
         AH3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=j3rNOWRmi2S3E5kOKVSUmMUO2EBwLpwGqow0NJYxMMU=;
        b=hlnuB47MIeLdYLZltpxvgr6NY9zzLaf4NKSmMRJOZ8CuSrvUc9hP3wnVTO6dHU7Pqz
         CZnUoChWaBQhqVijtGD3RxJ7E1ZAfT+peJTTVbVKYy0M1MJgVFzWb2h2cbnPgtffjIuC
         iEKQ7U8kzzSLob4ZOcxzXndixz+LITtlugejY=
In-Reply-To: <20170306052548.GA29285-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>

Hi David,

On 5 March 2017 at 22:25, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Sat, Mar 04, 2017 at 04:52:25PM -0700, Simon Glass wrote:
> > Add a set of tests to cover the functionality in pylibfdt.
> >
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> Ok, the tests seem to pass now and show up in the test summary.

nit: that is no different from the previous series - my change in v9
was to move the test-running code to the final patch, so that if
someone applied only the first two patches it would not run tests that
could not pass.

>
> However, they still give no output at all, which means if one of them
> starts failing, there's no obvious way to see what's failing.

I've sent a v10 of that final patch which shows the test output in that case.

Regards,
Simon
