From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 2/5] annotations: Add position information to various
 calls
Date: Tue, 9 Jan 2018 07:16:29 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801090715060.2225@hadrien>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr> <1515418607-26764-3-git-send-email-Julia.Lawall@lip6.fr> <CAL_JsqKaXY+K9LKH1qL1i-OhTjX1Kqvb6F3FJywwrPNZzLCz4A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKaXY+K9LKH1qL1i-OhTjX1Kqvb6F3FJywwrPNZzLCz4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>



On Mon, 8 Jan 2018, Rob Herring wrote:

> On Mon, Jan 8, 2018 at 7:36 AM, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org> wrote:
> > Builds on a patch proposed by Frank Rowand:
> >
> > https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00372.html
>
> Better to just put the details here and keep Frank's S-o-b if
> significant parts he wrote.
>
> > Added NULL position argument in a few new places in dtc-parser.tab.c (1)
> > and livetree.c (3).
>
> I think this patch should probably be split into what's needed to keep
> track of the source position and the annotating dts files part. Mainly
> I say this because I'm interested in changing the checks to print the
> dts position (if available) instead of the output file.

Thanks for the feedback.  I'm not sure to understand the last sentence.  I
thought the code was printing the original position of things?

I'll take care of the SOB as Frank suggested in the next version.

julia

>
> The changes themselves look good to me.
>
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
