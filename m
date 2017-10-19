From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dtc: Show the usage text if no parameter is passed
Date: Wed, 18 Oct 2017 19:02:49 -0500
Message-ID: <CAL_JsqLi5Jte+7_d1kq-Uka=7nV9foKudQ9w31noA++bvUJWjA@mail.gmail.com>
References: <1508369307-22307-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508369307-22307-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

On Wed, Oct 18, 2017 at 6:28 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>
> When dtc is called without any argument the application hangs forever.
>
> Instead of hanging, print the usage and exit.

I think it is valid to do:
dtc < in > out

This doesn't hang:
$ dtc < /dev/null
Error: <stdin>:0.0 syntax error
FATAL ERROR: Unable to parse input tree

The help though isn't clear that input file is optional.

Rob
