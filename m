From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] annotations: Add position information to various
 calls
Date: Mon, 8 Jan 2018 16:58:51 -0800
Message-ID: <5788ff3a-a031-3cd9-8f79-fd35cb03398d@gmail.com>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-3-git-send-email-Julia.Lawall@lip6.fr>
 <CAL_JsqKaXY+K9LKH1qL1i-OhTjX1Kqvb6F3FJywwrPNZzLCz4A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/loyM3pv2ZY37lnyoGu8SCQqAfdfIyou0LxWEbJgPg0=;
        b=j7vPbNSE+VXRsMrvo3CjDSaTP8epJP1Tje1Pml1tKRLr4UUHuH8nPCeTQEwKnX7E8h
         q+ge0ukX/zRxTb8TathMVG5yWdH8P7xdmWYkDvPaRx85+/cwAOD1TEwg/vhz8jg5kGgd
         V8F5Qgrrx8hJ2bUHPcDM6YyC3lqH7D245YoYqbz7C2dUhvP1g65Jdqu8ss0Pi/1bwnMe
         dzDvGGX968n/GVyheFXNtSxJ8a5ffR03E9B/WfsYMVwVP90UWmEF7GBudW7fiBBRbrB/
         XQfck6S/b23ckGY0vO+NsC+OACqTwCAEpKwcRWDGAfIr0Sm+ghJPzJboxLqQBI5lN6qv
         xDxg==
In-Reply-To: <CAL_JsqKaXY+K9LKH1qL1i-OhTjX1Kqvb6F3FJywwrPNZzLCz4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 01/08/18 14:29, Rob Herring wrote:
> On Mon, Jan 8, 2018 at 7:36 AM, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org> wrote:
>> Builds on a patch proposed by Frank Rowand:
>>
>> https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00372.html
> 
> Better to just put the details here and keep Frank's S-o-b if
> significant parts he wrote.

If you keep my S-o-b, please update it with my current email:

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

> 
>> Added NULL position argument in a few new places in dtc-parser.tab.c (1)
>> and livetree.c (3).
> 
> I think this patch should probably be split into what's needed to keep
> track of the source position and the annotating dts files part. Mainly
> I say this because I'm interested in changing the checks to print the
> dts position (if available) instead of the output file.
> 
> The changes themselves look good to me.
> 
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
