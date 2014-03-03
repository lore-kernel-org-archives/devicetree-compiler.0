From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Incomplete information in MAINTAINERS
Date: Mon, 3 Mar 2014 07:26:12 -0600
Message-ID: <CAL_JsqJ9vSkxLA0ucvAbhmd-ZZY_eHd-gmvPcXUpfoqy_mJ1xQ@mail.gmail.com>
References: <1393525473-12238-1-git-send-email-xypron.glpk@gmx.de>
	<CAL_JsqK9Wquv6kgefyPvy0JqXNO7Cx2+iN_ss=CtgXnKEjrF-Q@mail.gmail.com>
	<53119D3B.3050406@gmx.de>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=sint47U8hg1iXs7UbYXkHyVHTF7UW7X0P9W7c9kcWXs=;
        b=0iQ6ZYi515MLQfmqVgSCwPiyL+z6bDTZxvYJdP2JfyvQ0osjxbl4xu9LZvvv5YwWFq
         9KU5Huu+To2bQznaGhHgQtN3FywJhan4/cznCaZ/LYnOZR9TpcRaU2idwR83a8U5R7gQ
         EpAGoayfbYPLlO589JeBSDK0bTQKh26AQ7DoXvBdUG+1zwP3KrUcAEBOVfHKKRW2JYNM
         Ll8WU8XyFLh+FquRRn/jJoFRhgz9+f3WNQJsyxTI0Ixjeqk6Bu0iLd3z+aj8ZMNCHIAs
         GKIfwsK1J956fglIOxisJrm039Y2+6aANoLgQWjZcwcdQ0yhmgLbY5OmI//5eRhUNtud
         1xZw==
In-Reply-To: <53119D3B.3050406-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sat, Mar 1, 2014 at 2:41 AM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hello Rob,
>
> you wrote
>>> Also, there is a newly created list for dtc specific topics:
>>> http://vger.kernel.org/vger-lists.html#devicetree-compiler
>
> Could you, please, have file MAINTAINERS updated to include
> aforementioned list. Otherwise scripts/get_maintainer.pl
> will not show it.

I can change the list, but there's not a real good solution here. We
really don't want patches against the kernel. Perhaps the maintainer
should be "send-patches-against-upstream-dtc-e83xkrq8dvZBDgjK7y7TUQ@public.gmane.org".

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
