From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Tue, 03 Oct 2017 10:33:52 +0300
Message-ID: <1507016032.17981.7.camel@hp800z>
References: <1506628736.28192.9.camel@hp800z>
         <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
         <1506973580.17981.5.camel@hp800z>
         <CAMuHMdUNrAv4oYk1kwikGwKBXLBHO7p=CrHK4w0-BSQ2gQNx3g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=koYxiOi9OO/F2+nFG9DJW0UK4TtljIryCvjaOXf2StY=;
        b=X0Af3sJ/jLHS4bfyYt2r/cU92Z4J4BjHihwTDTgDf8EMde++1k2SL6aZc7ZPCdE7F8
         9+9VHVo9qLVm3BP3VRAC5aonw7394aCXdnfaX0OGaNiZArOeoziYli8UJ8rWj8PMz2vH
         LMycEhHqzzC34eI4TH0eKrcJAovI0Gg1p387E=
In-Reply-To: <CAMuHMdUNrAv4oYk1kwikGwKBXLBHO7p=CrHK4w0-BSQ2gQNx3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robherring2@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, David Gibson <david@gibson.dropbear.id.au>, Tom Rini <trini@konsulko.com>, Franklin S Cooper Jr <fcooper@ti.com>, Matt Porter <mporter@konsulko.com>, Simon Glass <sjg@chromium.org>, Phil Elwell <philip.j.elwell@gmail.com>, Marek Vasut <marex@denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Geert,

On Tue, 2017-10-03 at 09:17 +0200, Geert Uytterhoeven wrote:
> Hi Pantelis,
> 
> On Mon, Oct 2, 2017 at 9:46 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
> >     # Note that the YAML example must be validated against this binding
> >     # to be an accepted entry
> 
> Indeed ;-)
> 
> >       yaml: |
> >         sk11@0:
> >           compatible: "skel,sk11"
> >           reg: 0
> >           sip-max-frequency: 1000000
> 
> s/sip-max-frequency/spi-max-frequency/
> 

Heh, obviously the auto-check of binding examples is not working yet :)

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


