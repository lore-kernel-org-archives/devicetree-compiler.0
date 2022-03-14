From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Introduce fdtgrep for subsetting and hashing FDTs
Date: Mon, 14 Mar 2022 10:22:09 -0600
Message-ID: <CAL_Jsq+KzcUasbCOagXoLopDrNHrQQ5j0nE+CsgK_W1f8y9+0w@mail.gmail.com>
References: <20211107224346.3181320-1-sjg@chromium.org> <YgCblAa5Hxw33OXV@yekko>
 <CAPnjgZ2HZCtfhF2BhUYk0a-UOVrMf0i_uQrbGPhWJoaq1ZtW1w@mail.gmail.com>
 <YgM9hujN+PTXdi3d@yekko> <CAPnjgZ2-tgy-L15S=p4dajpF+hSwX-McPSU3Fez2=cXOqXypZQ@mail.gmail.com>
 <CAL_JsqJkG84jnn3OiC+aYOdqRvYcMWzfEg4r-74bbFsGC-4img@mail.gmail.com>
 <CAPnjgZ2OjgXxQ0HxC_pBe+yZnmbJL-QYd+jDDQ5eacO=vkerNQ@mail.gmail.com>
 <CAL_JsqLkOMELMjCNJ_xSt7hdVvHx5dMfrifzRWFuZQkGcsXwjQ@mail.gmail.com>
 <CAPnjgZ1TM751YD-VOgk-+Kc--shAt4=1FaFdTyGGn5_27P0s0g@mail.gmail.com> <CAPnjgZ2HNTfdBz0jp0sqFhFN=sduTjkJR-5uVABvfZ_+O3Qj6Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647274942;
        bh=+8bwSF3OiOnYw842h7M1zU1MZJ5v/49UoYhP+Zr/Ikg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jM0/4uOgDDm6a7f8FbQYPeYua0S9Mc7mP3sNhPQHrVepVAPVdQCP2+Yy/nYnUj26E
         XYT91ZyjfZerlzq47NtTB0Jf9rzCRhcionuJFv0bEA50WaaDdYuwv1gJdGKdJ2BR6Q
         JPwLqB/KrbhPJUUk4WvIuIetRiwZacKKdrUC0GpQGAAHoyasz1yPwwTRWZV1/ANt7d
         Uy7AQj5tiaHn/jBbJ5l/jhUPDR9ipcF7za7g2goQNL0TQBDPIwk7datuUmWDfKHGUl
         v+RxxSDD/NIyhyorvA1FVduJZhkrClUsApOv9SMC89hgoGzFMXaOLeR05eT7KNtBjR
         WcqrBHiVeT7ug==
In-Reply-To: <CAPnjgZ2HNTfdBz0jp0sqFhFN=sduTjkJR-5uVABvfZ_+O3Qj6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Fri, Mar 11, 2022 at 7:24 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Hi Rob,
>
> On Thu, 17 Feb 2022 at 15:44, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > Hi Rob,
> >
> > I am open to ideas...perhaps dtc-extra?
> >
> > Yes, empty is fine.
>
> Did anything happen here?

No, sorry. It's not really dtc related, so perhaps 'fdt-tools' or
'fdt-utils' instead?

Rob
