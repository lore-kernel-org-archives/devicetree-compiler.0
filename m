From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Introduce fdtgrep for subsetting and hashing FDTs
Date: Mon, 14 Mar 2022 10:38:03 -0600
Message-ID: <CAPnjgZ0cf=qVS=C-mno_0aB0gGXYu06LBoVp1n8QQT=mFfaj9g@mail.gmail.com>
References: <20211107224346.3181320-1-sjg@chromium.org> <YgCblAa5Hxw33OXV@yekko>
 <CAPnjgZ2HZCtfhF2BhUYk0a-UOVrMf0i_uQrbGPhWJoaq1ZtW1w@mail.gmail.com>
 <YgM9hujN+PTXdi3d@yekko> <CAPnjgZ2-tgy-L15S=p4dajpF+hSwX-McPSU3Fez2=cXOqXypZQ@mail.gmail.com>
 <CAL_JsqJkG84jnn3OiC+aYOdqRvYcMWzfEg4r-74bbFsGC-4img@mail.gmail.com>
 <CAPnjgZ2OjgXxQ0HxC_pBe+yZnmbJL-QYd+jDDQ5eacO=vkerNQ@mail.gmail.com>
 <CAL_JsqLkOMELMjCNJ_xSt7hdVvHx5dMfrifzRWFuZQkGcsXwjQ@mail.gmail.com>
 <CAPnjgZ1TM751YD-VOgk-+Kc--shAt4=1FaFdTyGGn5_27P0s0g@mail.gmail.com>
 <CAPnjgZ2HNTfdBz0jp0sqFhFN=sduTjkJR-5uVABvfZ_+O3Qj6Q@mail.gmail.com> <CAL_Jsq+KzcUasbCOagXoLopDrNHrQQ5j0nE+CsgK_W1f8y9+0w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WJVOzd4X40SxhHvzqj/K60USKVYJvpuFV8QE9tNZmjE=;
        b=hUx1kq+CJrZRZHY6+7TzhMvHV+bX9TJ2P3ApLGRm4b49yPU8M0oTiPbyMAqosCSyu1
         fT8LMcXKLkxAeW4o6XjauhP96x6Zz9Vnst+zYz8gmg2ACaJPcdJeRyOH5NkFyPSGaRqr
         dSeNiOFW0HvkKYSKrf+z46s0UbsIIh+3GygW8=
In-Reply-To: <CAL_Jsq+KzcUasbCOagXoLopDrNHrQQ5j0nE+CsgK_W1f8y9+0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Rob,

On Mon, 14 Mar 2022 at 10:22, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Fri, Mar 11, 2022 at 7:24 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > Hi Rob,
> >
> > On Thu, 17 Feb 2022 at 15:44, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > >
> > > Hi Rob,
> > >
> > > I am open to ideas...perhaps dtc-extra?
> > >
> > > Yes, empty is fine.
> >
> > Did anything happen here?
>
> No, sorry. It's not really dtc related, so perhaps 'fdt-tools' or
> 'fdt-utils' instead?

Yes, either of those is fine with me.

Regards,
Simon
