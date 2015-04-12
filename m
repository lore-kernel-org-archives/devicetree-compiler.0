From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [Celinux-dev] Invitation and RFC: Linux Plumbers Device Tree
 track proposed
Date: Sun, 12 Apr 2015 09:53:41 +0200
Message-ID: <CAMuHMdWeKn6MkmtFpWP-MqBnNYE0x0A0_3ZYD3cDhdnb9DCs5Q@mail.gmail.com>
References: <8251B150E4DF5041A62C3EA9F0AB2E0603A53FE1082E@SELDMBX99.corpusers.net>
	<CAOS_Y6Qmt2KTRu6urPs-Y1e2Xv1QPNTaQHH4_N8Kk8XU7n+ecQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=psqfxOx4eIIsBUYnKr+PZwC36fEzA/H+1joq71CHT1g=;
        b=IhqqQfK3bcE3ClE44+R+lPP8nbHEFUB/J+TgyCW6B39b3XBlT8qW7NRZM1/xH6/co4
         EvGt+ZpbonMS1ajBWBvYCNSiSj+Zdwfc79lVNbud6FEDSdSQ31VueOsSl4lejAkarq/K
         x8Lk3Xs9AN00dLrnjjSasO/j5JmStNiSY+mQ2wj99N3My/V80ZOKPdVqRcs/2d/5N6tn
         weWxlZEMCpPTO0sYat6uZw3OWBF+tZNAv3e/UlwPvhTdtQNfQvUa70I0Gdm4ektuPpVz
         AcD8cBekGGkxcSWqMBfE+/hbyES6WSZjnQOIIQj7TT1ss+73RRPQZQ9qnssx/QT708br
         XonQ==
In-Reply-To: <CAOS_Y6Qmt2KTRu6urPs-Y1e2Xv1QPNTaQHH4_N8Kk8XU7n+ecQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: "Rowand, Frank" <Frank.Rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org" <celinux-dev-idqoXFIVOFIh9xQPArXXUATG8MYbGj4l@public.gmane.org>, "linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Rob,

On Sun, Apr 12, 2015 at 2:05 AM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:
> Is there a device tree porting HOWTO anywhere? If I have a board
> that's using explicit C initialization, and I want to convert it over
> to device tree, step by step what do I do?
>
> If I'm writing a new board support, what device tree bits do I need to
> get a shell prompt on a serial port running out of initramfs?
> (Physical memory, interrupt controller, timer to drive the scheduler,
> serial chip...)
>
> There's a bunch of device tree reference material out there, but no
> tutorial material at all, that I can find...

http://www.devicetree.org/Device_Tree_Usage

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
