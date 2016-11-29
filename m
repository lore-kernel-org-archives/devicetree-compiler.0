From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Tue, 29 Nov 2016 12:11:15 +0000
Message-ID: <ba8e2ed3-9798-3074-1167-3f6851321a25@raspberrypi.org>
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=raspberrypi.org; h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp;
 bh=/Gh8O+sVXZ94trsn0A8dTSd5UaF1rktap79MK9VCGfs=;
 b=Zx7Xg3GORsY2e4RJYtVFdJM2xCw3aB52fwdTS8VoDnydcXDh9AnLKRIRF7u2IuIygKvN
 icrX+w1Jb+3q/mK9J0IiJB9cjkwEfr3rvZBG+BiPScw+mJO50c9/g1Enle9g9jFUrwDD
 mzFcVhEu54jdKmqKqxEw6i1OlQ0J9DYQHeSN3rSWWQZLB6uCvAJTf1CCwnFwL5BH3ja8
 XiDnKgjYVqKQLKB3kLR6ZGDPTPgpw0lN9w5HUVCjrlyAHH4uuzLPWtZACheikpIrlqhW
 dyEGAcUsuuw1jqwydbhEwrquA3tK0AnCnAaN7O06/eSw6XV3fX87JPfGhn5LtH5PEzF+ pw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi-org.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=tRSj+Kc8WYojDoem5gBgI31WGPAq8Pcvd/LzVU5UbJk=;
        b=zcGCu7dLKDVc22w5Vwf0mYa20zuPaZpU6bcALuV7B7RV3PKWneArVNRYXG4Msa2Ddw
         t+mziO55sk331qGhDvTfeuHJQiOGZAlZ5cl+iWNos7QFuhCUooji+6oTR5OHSk5HqBtO
         7p4Mhm666BTRYnCGcnpISKwSpW/uBhq+bOYkBphLG5b3XNQoAPvwmfBtI+XH542Q/Oyc
         DWhjEJ5gQEAqNB2EHX2xCYO22EMNoIky0yjKoiz25mLwY+StdSB1tLwadg69sAybtXm4
         6IImE4UMpgPM4tKCglsy52yZ2iakhtEJmvENmhMw6oGcBKWwtkWFtkWZD0tWaoPN8BuL
         Cm/Q==
In-Reply-To: <1F9EDF06-98B1-4270-AA58-1A9D9A9F9803-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Pantelis,

On 29/11/2016 10:55, Pantelis Antoniou wrote:
> Manually adding symbols by targeting __symbols__ is just bad. There is ab=
solutely
> no guarantee that the symbol/fixup node(s) will still be there in followi=
ng iterations
> of the patches.
Remember that this is now part of the Linux kernel - it isn't something
you can just change at will.
> I am thinking of parsing them, recording the information in kernel struct=
ures and then
> deleting them altogether.
>
>> How does your patch handle duplicate symbols?
>>
> It doesn=92t. Having duplicate global symbols is bad.=20
>
> It appears you want scoping rules instead. Care to paste a concrete examp=
le?

Concrete non-trivial examples are hard to come by. There are some simple
cases where we've attached labels to __overlay__ nodes so that the
contents can be patched by our overlay parameter mechanism - they could
just be given unique names instead of just "frag0", "frag1" etc. I'm
more concerned about parameterised macro-expanded overlays.

Consider an overlay that defines a CAN controller on an SPI bus. We
currently have two such overlays in the RPi tree, one for SPI 0.0 and
one for SPI 0.1. Here's an extract from one of them:

    /* the interrupt pin of the can-controller */
    fragment@2 {
        target =3D <&gpio>;
        __overlay__ {
            can0_pins: can0_pins {
                brcm,pins =3D <25>;
                brcm,function =3D <0>; /* input */
            };
        };
    };
...
    fragment@4 {
        target =3D <&spi0>;
        __overlay__ {
            /* needed to avoid dtc warning */
            #address-cells =3D <1>;
            #size-cells =3D <0>;
            can0: mcp2515@0 {
                reg =3D <0>;
                compatible =3D "microchip,mcp2515";
                pinctrl-names =3D "default";
                pinctrl-0 =3D <&can0_pins>;
                spi-max-frequency =3D <10000000>;
                interrupt-parent =3D <&gpio>;
                interrupts =3D <25 0x2>;
                clocks =3D <&can0_osc>;
            };
        };
    };

One day I'd like to merge these into a single parameterised version that
could target any CS line on any SPI controller. This requires that any
created node names are unique with the scope of the parent ("mcp2515@0",
"can0_pins"), and that the name of the target label (spi0) is patched to
select the correct SPI bus. Our existing, limited overlay parameter
mechanism uses labels to identify properties to patch:

        spimaxfrequency =3D <&can0>,"spi-max-frequency:0";

(I would have attached labels to the properties themselves, but that
doesn't seem to work, contrary to the ePAPR spec.)

If the labels that locate the node, property and label names to change
also themselves have to be made unique then that adds an extra level of
complexity.

The parameter application is a pre-processing step before the overlay is
merged, so there is nothing preventing me from filtering the symbols
node before passing it on based on rules of my own choosing, but I
wanted to make more people aware of this change.

Phil
