From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Tue, 29 Nov 2016 12:57:11 +0000
Message-ID: <a1ba4783-2a3b-eefd-9c41-2f33524472fe@raspberrypi.org>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161128041228.GJ30927@umbus.fritz.box>
 <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com>
 <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org>
 <20161129021131.GD13307@umbus.fritz.box>
 <b7ff53f6-6481-e3f1-e3b5-d0b04e563e83@raspberrypi.org>
 <D3BFA6AB-21C1-451B-ACF5-32EA5E615275@konsulko.com>
 <66c7f8c5-94e9-a6ca-4402-fa0ccf2a6ac0@raspberrypi.org>
 <1F9EDF06-98B1-4270-AA58-1A9D9A9F9803@konsulko.com>
 <ba8e2ed3-9798-3074-1167-3f6851321a25@raspberrypi.org>
 <96BE1B80-0843-4981-AA2A-E89EA6A02600@konsulko.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=raspberrypi.org; h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp;
 bh=0/Y+Edr6pv5vB0ywQtBmYfEGYq6ilSs6xTUg8WZosoA=;
 b=wqBN9aEp7LfG1yxyu9d42mnXEeNO9q6lUJ6u1G99g8duj9ZoDpjolbBeuyKAHAGpXQEb
 MuILmsjeHvaqhAhWbkpn5Eui3WJLZRY1QF3d0giBT8qGtj/5i0TcSqqCsND6BcnvJyCa
 +vcjkFve86KiXVa8SbTSqxXhpaewSpTVcyk3vCZHRyiBzzDf8SIJ3gzApeK0O/Ve+z1A
 uhbIMwacRKEoGIaz+rZUkBsi27dbufrNaohs0k+p7I4O5HXC7ujH0dJiWl4i43wKa3Wv
 8Bl0edwNRJQlNnu1OIXA+w21GOQTq+DS+ZHDB1U85XzGVcP7j7324NOr/Br+qPT7Gke/ 5A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi-org.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=0/Y+Edr6pv5vB0ywQtBmYfEGYq6ilSs6xTUg8WZosoA=;
        b=FdZh6ubG9vSlo/ag5C2lrV1nGbRkywv76kuq5Yb1avXp0W/75jyzLiHdRipGj1Mpro
         GGDu1HYx77PoBLtKFC61ouV2RqG2F4LEWthos6hifPhCwyHPW2SRMb2t9WhwHJL4pYAL
         kLJzadVyE2qGQDxhIL/GWJ5f4QvOeYrmbGXzJ6BxpiQ5B5btVVTUf1F2xJIV8/uzKyy+
         wv5ik8JYcPZJlYCyXjP/o/FxTOPqZn8+flx3gsnnuw2sUBZK4XAbtmUND6X/20jBbSaq
         UqkkIZt4sbM8Hi2yXxVi64WzpS+n6Da9WkcrpSSvdnd27GWhn0DVq03s3FGrbUdRGqV5
         ehhQ==
In-Reply-To: <96BE1B80-0843-4981-AA2A-E89EA6A02600-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 29/11/2016 12:24, Pantelis Antoniou wrote:
> First note is that this is exactly what the portable connector is suppose=
d to
> do; abstract away the SoC differences.
>
> Second note is that it=92s not the overlay application that=92s having pr=
oblems, it=92s
> your parameter patching method.
>
> The 'spimaxfrequency =3D <&can0>,"spi-max-frequency:0=94=92 form could mo=
re easily be
> done by targeting aliases instead of node labels.
>
> I.e. You can apply the overlay, set an alias to the node and instead of r=
eferencing
> the label, reference the alias.
But the patching is done before the overlays are applied, in isolation
from the base tree, so that they can still be used with the kernel
configfs overlay mechanism. How do aliases (which associated symbols
with absolute paths) help?

> Again, this is a stop-gap until the portable connector is done, but what =
I take out
> of this is the need for a parameterization step in which an overlay is mo=
dified before
> it is applied according to an external parameter.
Yes, absolutely.

Phil
