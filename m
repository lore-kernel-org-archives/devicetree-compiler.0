From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove superfluous NUL character from overlay symbols
Date: Sun, 24 May 2020 20:15:08 -0600
Message-ID: <CAPnjgZ2C3HxdZqYAS_g-CEAq1CTVvdEvaz6NiCowpd11d9f5WA@mail.gmail.com>
References: <20200522164136.26069-1-marcus@mc.pp.se> <CAPnjgZ1eU7xOgfGd_6bnUXs_98YOp8gfCz4YHHoHXtCY_h1_Hw@mail.gmail.com>
 <yf94ks627a2.fsf@mc.pp.se> <CAPnjgZ3QVHQg6p6JRgqyCTxNzjpTDvMcdeXpw6pZfjajCB+c7g@mail.gmail.com>
 <yf9o8qe8z1c.fsf@mc.pp.se>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MXLQvXRAle/MLIAyxKVhyCipYWpTE8kBe7UplFom4Fw=;
        b=fYYJvcahnSDIlfYOXykwIk2IwgCTXOhzYZ/ET0oRay0lFhJtEShT4vvlOGPRGNjq/z
         gxnWKBl4ZtvEfcDeWRHYnHKwYRSJ0D4BQ4Mqc+/u1OExGaThqE188/1RkqCkhZlECS0C
         0qQJaUXQ81lGViZaZw8UfaeAvYdX0HvlEmRvY=
In-Reply-To: <yf9o8qe8z1c.fsf-S4ne242Fi5M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcus Comstedt <marcus-S4ne242Fi5M@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>

On Sat, 23 May 2020 at 09:13, Marcus Comstedt <marcus-S4ne242Fi5M@public.gmane.org> wrote:
>
>
> Hi Simon,
>
> Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> writes:
>
> > You can send your patch to the mailing list on cc.
> >
> > Also see README.fdt-control fo the the git repo and other details.
>
>
> Thanks.  Sent.
>
>
>   // Marcus
>
>

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
