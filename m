From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checks: fix sound-dai phandle with arg property check
Date: Mon, 4 Dec 2017 10:22:19 -0600
Message-ID: <CAL_JsqL06MGVJpUvMj_he09itK-k4XUDL-bn9jY-0PJ5Cacu=A@mail.gmail.com>
References: <20171204090723.4810-1-peda@axentia.se>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204090723.4810-1-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>

On Mon, Dec 4, 2017 at 3:07 AM, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org> wrote:
> The property is named "sound-dai", not "sound-dais".

Indeed. Unfortunately, we've been inconsistent.

>
> Fixes: b3bbac02d5e3 ("checks: add phandle with arg property checks")
> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  checks.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Hi!
>
> I don't know if this needs more work? Maybe #sound-dai-cells is optional?
> Maybe there's a lot of fall-out in the kernel? Anyway, "sound-dais" is
> definitely not right...

Some of the bindings treated #*-cells as optional with missing being
treated as 0. IMO, we should fix all those cases because that's really
the only way we can generically validate bindings.

> BTW, I reviewed the other properties added by the fixed patch and found
> no other similar spelling mistake.

Thanks.

Rob
