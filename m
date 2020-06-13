From: sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Subject: Re: [PATCH] libfdt: Remove superfluous NUL character from overlay symbols
Date: Sat, 13 Jun 2020 03:11:32 +0000
Message-ID: <CAPnjgZ0ygGnzUHOaS7yQKADJkfEuESsjd=W2pmHRC0RhOEzwhg@mail.gmail.com>
References: <CAPnjgZ2C3HxdZqYAS_g-CEAq1CTVvdEvaz6NiCowpd11d9f5WA@mail.gmail.com>
 <20200522164136.26069-1-marcus@mc.pp.se> <CAPnjgZ1eU7xOgfGd_6bnUXs_98YOp8gfCz4YHHoHXtCY_h1_Hw@mail.gmail.com>
 <yf94ks627a2.fsf@mc.pp.se> <CAPnjgZ3QVHQg6p6JRgqyCTxNzjpTDvMcdeXpw6pZfjajCB+c7g@mail.gmail.com>
 <yf9o8qe8z1c.fsf@mc.pp.se>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:from:in-reply-to:references:date:message-id
         :subject:to:cc;
        bh=QloiKJFNEncUSwIM75VOnl8AkT2KIZX1LHnRsyatpxM=;
        b=c+CgSHy+ieLHK4pQaRS/+ey0/tMvYBdvXanD+8aLJSS8B7KDMexm5Oro4kZotsmNrb
         JpUv0zxDC92IsqV8aM6RfBRK7YXQlonHW1rCvhdopXPQoxkjT9VVlkc8TfrE+SEwxCOW
         GrgrnwgstYKQNpm0yosSTmpyGdBKPTDA/ZYDO3gVZkEFxwF5OUA4vOHEEg9u8WB21Lu1
         7ifVMRcr4i/u5ok197qHTvkRNFeFo8UFBM5Kmp4/GVHHoZejVInH2PJvN6JFOt9+xTkK
         TpMn0k0gzBprJqRABfjFhC1M9Ngx06jOJomealbedzWzXUo44ykIVFXJ+H0Ui970Ww1x
         3GMw==
In-Reply-To: <CAPnjgZ2C3HxdZqYAS_g-CEAq1CTVvdEvaz6NiCowpd11d9f5WA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Marcus Comstedt <marcus-S4ne242Fi5M@public.gmane.org>

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

Applied to u-boot-dm, thanks!
