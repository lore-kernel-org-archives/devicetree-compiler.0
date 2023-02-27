From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Applying dtb overlays on pre-compiled dtb's
Date: Mon, 27 Feb 2023 09:17:36 -0700
Message-ID: <CAPnjgZ0VWfq-n=qzYEe5UHEnJhBxhnMOVbenKiaSx6S1ed4qcA@mail.gmail.com>
References: <CAL6CDMFiV0_rmE+gTow0X7Wnj7eS6YDu0Ya7dmNACnL1rRy4_w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqrdjRHm0dGL8+C8yLLAOazSWdvmucD0O9t5PQvUS9w=;
        b=oFZnEpdLdwohNMpWcFBJji+3PIM7EdGpMOei4Bh6bM4J3/EEGY66U/nGbn/hlteU6J
         X8yweIlSgpZmfspllJHUsFMggCC//HpSdVi9XUzNa52TpIb+ogYebhB34vdxC0DOtdtX
         Y5rscDETCx14vxx4R8zfvii1xx7k/8t7j9oiU=
In-Reply-To: <CAL6CDMFiV0_rmE+gTow0X7Wnj7eS6YDu0Ya7dmNACnL1rRy4_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Igor Opaniuk <igor.opaniuk-WQOgUJUq/S3vYQKSrp0J2Q@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Igor,

On Mon, 27 Feb 2023 at 07:26, Igor Opaniuk <igor.opaniuk-WQOgUJUq/S3vYQKSrp0J2Q@public.gmane.org> wrot=
e:
>
> Hi everyone,
>
> I apologize in advance for the possibly wrong ML for this question.
>
> I'm currently looking for any existing ways of adjusting pre-compiled dev=
ice
> tree blobs. I know that dtc doesn't have such ability (and obviously its =
purpose
> is different), but maybe there is something you can recommend in this cas=
e
> (kind of userland analogy of U-Boot's runtime "fdt apply" cmd).
>
> For instance, I would like to add one property to "/firmware" (its value
>  is generated during compile time) node into multiple device tree
> blobs built with-in
> Linux/U-Boot/TF-A, avoiding any additional intrusive changes to these sou=
rce
> trees (so, for example, adding dtsi with needed firmware property
> unfortunately doesn't work for me).
>
> The only solution I see is a custom app that uses libfdt, implemented
> specifically
> for this task, but maybe there is something which already exists.

There is fdtput which can add simple properties and nodes.

I suppose you are aware of binman[1], which might be useful if your
signing/production scheme were supported there.

>
> Thanks and looking forward to your replies.
>
> --
> Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations
>
> Igor Opaniuk
> Embedded Software Engineer
> T:  +380 938364067
> E: igor.opaniuk-WQOgUJUq/S3vYQKSrp0J2Q@public.gmane.org
> W: www.foundries.io

Regards,
Simon

[1] https://u-boot.readthedocs.io/en/latest/develop/package/binman.html
 (pip install binary-manager)
