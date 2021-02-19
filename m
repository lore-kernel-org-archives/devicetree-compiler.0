From: Paul Barker <pbarker-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Prevent overlays from modifying phandle properties
Date: Fri, 19 Feb 2021 09:28:04 +0000
Message-ID: <CAM9ZRVsD9DfEHOH6B8P-dd_KAdOJpf1+GmcM0ph8x1b8ug=BDQ@mail.gmail.com>
References: <20201219172808.3101-1-pbarker@konsulko.com> <YCyo0CrHJiEaPEYA@yekko.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AE9SDlyXAnwEera9cC8RX5PYbir6BUnLyS9nrhG6+N0=;
        b=FnjRutSc0OdnF54LyIyfycL4drIrmBHmyDG3aLB93c/15oJTiDLVR6wOS67FFR9tGf
         qQCI6PhANkw1qt3fEWw4S1qLEk6TSc4HAPSWopC95KKMdwWbOeoLSHr4USrJLFv9F5q6
         rAHQElxbLQE5mX5G69zQoFReo12rvUxcnxgCY=
In-Reply-To: <YCyo0CrHJiEaPEYA-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Scott Murray <scott.murray-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jan Simon Moeller <jsmoeller-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>

On Wed, 17 Feb 2021 at 05:25, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Sat, Dec 19, 2020 at 05:28:08PM +0000, Paul Barker wrote:
> > When applying an overlay fragment, we should take care not to overwrite
> > an existing phandle property of the target node as this could break
> > references to the target node elsewhere in the base dtb.
>
> It could.. but my first inclination is to say "don't do that".

I entirely agree. However, folks are already doing this [1] and I
think fdtoverlay should be more defensive here. My idea was to handle
this safely in fdtoverlay if we can assume that it is never legitimate
to modify the phandle property of a node from an overlay. A couple of
alternatives would be raising an error in fdtoverlay instead of trying
to silently ignore the phandle, or raising an error in dtc when the
phandle is introduced.

>
> > In addition to potentially breaking references within the resulting fdt,
> > if the overlay is built with symbols enabled (`-@` option to dtc) then
> > fdtoverlay will be unable to merge the overlay with a base dtb file.
>
> If we can manage, I really think the better fix is to *not* have the
> overlay provide conflicting phandles, rather than having the merge
> process ignore them.
>
> I think we need to pin down the cirucmstances in which overlays with
> phandles are being generated and address those, if possible.

Am I right in understanding this to mean we should raise an error in
dtc when a phandle is generated in an __overlay__ node?

>
> > A new test case is added to check how fdtoverlay handles this case.
> > Attempting to apply this test overlay without the fix in this patch
> > results in the following output:
> >
> >     input  = tests/overlay_base_ref.test.dtb
> >     output = tests/overlay_overlay_ref.fdtoverlay.dtb
> >     overlay[0] = tests/overlay_overlay_ref.test.dtb
> >
> >     Failed to apply 'tests/overlay_overlay_ref.test.dtb':
> >     FDT_ERR_NOTFOUND
>
> [snip]
> > diff --git a/tests/overlay_base_ref.dts b/tests/overlay_base_ref.dts
> > new file mode 100644
> > index 0000000..1fc02a2
> > --- /dev/null
> > +++ b/tests/overlay_base_ref.dts
> > @@ -0,0 +1,19 @@
> > +/*
> > + * Copyright (c) 2016 NextThing Co
> > + * Copyright (c) 2016 Free Electrons
> > + * Copyright (c) 2016 Konsulko Inc.
> > + *
> > + * SPDX-License-Identifier:  GPL-2.0+
> > + */
> > +
> > +/dts-v1/;
> > +
> > +/ {
> > +     test: test-node {
> > +             test-int-property = <42>;
> > +     };
> > +
> > +     test-refs {
> > +             refs = <&test>;
> > +     };
> > +};
> > diff --git a/tests/overlay_overlay_ref.dts b/tests/overlay_overlay_ref.dts
> > new file mode 100644
> > index 0000000..a45c95d
> > --- /dev/null
> > +++ b/tests/overlay_overlay_ref.dts
> > @@ -0,0 +1,24 @@
> > +/*
> > + * Copyright (c) 2016 NextThing Co
> > + * Copyright (c) 2016 Free Electrons
> > + * Copyright (c) 2016 Konsulko Inc.
> > + *
> > + * SPDX-License-Identifier:  GPL-2.0+
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
>
> Given that you're using the /plugin/ tag, it doesn't make sense to use
> the "manual" way of constructing the overlay, rather than dtc's
> built-in syntax:
>
> &test {
>         ...
> }
>
> > +
> > +/ {
> > +     fragment@0 {
> > +             target = <&test>;
> > +
> > +             frag0: __overlay__ {
> > +                     test-int-property = <43>;
> > +             };
> > +     };
> > +
> > +    test-ref {
> > +        ref = <&frag0>;
> > +    };
> > +};
>
> Things get weird in this example, because the point is we're equating
> the __overlay__ node with the target node.  Just ignoring the phandle
> overwrite is *wrong* in this case, because it will break test-ref
> (except that test-ref isn't in a fragment, and therefore discarded,
> but that could be changed).  Instead to handle this case correctly
> we need to identify that we're asking the __overlay__ node to be the
> same thing as &test and so &frag0 needs to be rewritten as &test.

This isn't intended to be an example. It's a minimal test case to
reproduce the bug.

The actual example where this issue was first seen is [1]. The entries
in __overrides__ are interpreted as different options which can be
selected at runtime by a config option. I've looked for the code which
actually implements this but I can't find it, my understanding is that
the proprietary first stage bootloader on the Raspberry Pi applies
these overrides and the overlays together.

In Automotive Grade Linux we want to be able to network boot a
Raspberry Pi and load a device tree with appropriate overlays applied.
The files are fetched over the network by u-boot after the first stage
bootloader has exited so we can't rely on the proprietary Raspberry Pi
firmware to handle this for us. Instead the overlay needs to be
applied either manually at compile time or in u-boot at runtime. This
resulted in the FDT_ERR_NOTFOUND error described in the commit message
for this patch. Discussion and investigation is captured in [2].

[1]: https://github.com/raspberrypi/linux/blob/rpi-5.4.y/arch/arm/boot/dts/overlays/cma-overlay.dts
[2]: https://jira.automotivelinux.org/browse/SPEC-3702

Thanks,
