From: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/4] plugin: Transparently support old style syntax
Date: Fri, 6 May 2016 10:16:39 +0100
Message-ID: <CAPhXvM7D-Uv9nzmiiz8kw6w18nZQ-h_R4UEEPzj+_HPt3t=+BA@mail.gmail.com>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1462477724-8092-4-git-send-email-pantelis.antoniou@konsulko.com>
	<CAL_JsqJkJyMi4_RoxLAiVD3GXst8CX_8ekounavztXZKxdMKtg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=Y2FYHsZUmwWjDqNvGGzX0pyKRJxyoq7vbJK0IJ9n9eE=;
        b=qSYxG95E/kgI2exW++YCRKtRv13xcAQLKCnMXRwzS+YI3pSr6UQGlgrT6zulL5yvww
         jnK6rkDG709mZSmj6SJXBzbWDPeVqwsTbRw14sW9RNc23tr2mKDR6dt6tOZcjkbaY1XX
         bTZv/af27DEOKpnrr73rRRE40KflSmrJrzms8pZ2DuK/liSbD/0fF10R4bZIEXG2THcY
         p69GOBY1hfFc9QnDyhtyTjlWSff8tLwBgSOJMCHl6AwQ2HSFy+eeyhs+DBz1krcjv4/x
         JnEfeXQNP54dxMJLbagQ1gAg60+qtIp3M+zphegOk6QR3835IBP3Phxs9u8TtlKC+d5L
         5s/A==
In-Reply-To: <CAL_JsqJkJyMi4_RoxLAiVD3GXst8CX_8ekounavztXZKxdMKtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

> In the wild where?
>
> IMO, too bad. That's the danger of deploying prototype code. Perhaps a
> tool to convert them would be better.


At Raspberry Pi we've been making good use of overlays for over a year now.
They have been an invaluable tool, allowing us to reduce the need for
downstream code while retaining and extending the flexibility our users
need. Without the circulating patches I would have pressed ahead with a
homegrown equivalent, which would have made switching to overlays much more
painful.

I hope to see Pantelis's overlay configfs code in a kernel release soon,
but until then we'll continue to apply the patches downstream.

Phil
