From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dtc: Show the usage text if no parameter is passed
Date: Wed, 18 Oct 2017 22:38:41 -0200
Message-ID: <CAOMZO5A3ettpwGVATUL3PF6Hj-3087E93QVLZ0tNgD-BG53MYA@mail.gmail.com>
References: <1508369307-22307-1-git-send-email-festevam@gmail.com> <CAL_JsqLi5Jte+7_d1kq-Uka=7nV9foKudQ9w31noA++bvUJWjA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=qloeBVKUEaqMRibJLBjK901r8zKBOzfolMFtVw90Gqw=;
        b=fOXb3OpAA278RRBDqZC6AvXNOv5Avgo4GRq+rJsI+qI7/kJ9SIeKlCko8QmFqn5qZr
         rovF1EWSUI9b/6cNZHKyvg+1JTnNkC5yp9CkPhxyWuDy4VyhvaOPeEbEDuNBl+mVtdGx
         1eVcAHhH4tTffbpP+ksFBXJ2KaTurHBEe8pxhAIL4VlGK4hpG4h48vMtWwJzvbkl3fQ/
         CsvlyydxpPgzjYNPvRavh/tyLt43r4PaiS4WOV6X8Zysma4pPXoKCfXiR27TM5CIm3iH
         YX8JAiOzEE+6W6bWbc3kd6JD+F46xcb4talJI3gfnHxZCVveVIvn7o2wW82U3gfuoUgy
         U9Mg==
In-Reply-To: <CAL_JsqLi5Jte+7_d1kq-Uka=7nV9foKudQ9w31noA++bvUJWjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

On Wed, Oct 18, 2017 at 10:02 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Oct 18, 2017 at 6:28 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>>
>> When dtc is called without any argument the application hangs forever.
>>
>> Instead of hanging, print the usage and exit.
>
> I think it is valid to do:
> dtc < in > out
>
> This doesn't hang:
> $ dtc < /dev/null
> Error: <stdin>:0.0 syntax error
> FATAL ERROR: Unable to parse input tree

These examples do not have argc == 1.

If 'dtc' is called with no arguments than the application never exits.
