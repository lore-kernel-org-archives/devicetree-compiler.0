From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Prevent overlays from modifying phandle
 properties
Date: Mon, 22 Feb 2021 17:47:01 +1100
Message-ID: <YDNTZW6bKT1bcJkX@yekko.fritz.box>
References: <20201219172808.3101-1-pbarker@konsulko.com>
 <YCyo0CrHJiEaPEYA@yekko.fritz.box>
 <CAM9ZRVsD9DfEHOH6B8P-dd_KAdOJpf1+GmcM0ph8x1b8ug=BDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tLC2X+3ebuzteBsw"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1613976429;
        bh=EWQfmVsoFZ1eUtpjfA4GIJVC/NfXI1tLpWxNyR4SUqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pB0oVCY5fxBJvdRfYvtCDfR6aUaBYiPF6vcQFZo+pWI0efaslNqojbUvZGTLcvUai
         MGl34EK05GCCkdc/HLWRUdmnpW56nvKoxYp+IZeI13kbClYWHYn096DsiKIjFOS8Su
         e3RXvzwWlIP/B7ZDIAvCP/BMZaWCS7FDL6LKxwOw=
Content-Disposition: inline
In-Reply-To: <CAM9ZRVsD9DfEHOH6B8P-dd_KAdOJpf1+GmcM0ph8x1b8ug=BDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Paul Barker <pbarker-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Scott Murray <scott.murray-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jan Simon Moeller <jsmoeller-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>


--tLC2X+3ebuzteBsw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 09:28:04AM +0000, Paul Barker wrote:
> On Wed, 17 Feb 2021 at 05:25, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >
> > On Sat, Dec 19, 2020 at 05:28:08PM +0000, Paul Barker wrote:
> > > When applying an overlay fragment, we should take care not to overwri=
te
> > > an existing phandle property of the target node as this could break
> > > references to the target node elsewhere in the base dtb.
> >
> > It could.. but my first inclination is to say "don't do that".
>=20
> I entirely agree. However, folks are already doing this [1] and I
> think fdtoverlay should be more defensive here. My idea was to handle
> this safely in fdtoverlay if we can assume that it is never legitimate
> to modify the phandle property of a node from an overlay.

The trouble is that both applying the change and ignoring the change
will break something.  Applying it will break things that attempt to
bind to the node with its "old" phandle, but ignoring it will break
something that attempts to bind to the new handle.  e.g.

fragment@1 {
	target =3D < &somenode >;
	anothername: __overlay__ {
		...
	};	=09
}
fragment@2 {
	target =3D < &differentnode >;
	__overlay__ {
		some-prop =3D < &anothername >;
	};
}

> A couple of
> alternatives would be raising an error in fdtoverlay instead of trying
> to silently ignore the phandle, or raising an error in dtc when the
> phandle is introduced.

Right, I think those are better options.

In the short term, I think raising an error in dtc is probably the
right choice - we can remove it when/if we implement this properly
("merging" the old and new phandles).

> > > In addition to potentially breaking references within the resulting f=
dt,
> > > if the overlay is built with symbols enabled (`-@` option to dtc) then
> > > fdtoverlay will be unable to merge the overlay with a base dtb file.
> >
> > If we can manage, I really think the better fix is to *not* have the
> > overlay provide conflicting phandles, rather than having the merge
> > process ignore them.
> >
> > I think we need to pin down the cirucmstances in which overlays with
> > phandles are being generated and address those, if possible.
>=20
> Am I right in understanding this to mean we should raise an error in
> dtc when a phandle is generated in an __overlay__ node?

As long as we're unable to generate stuff to have that phandle
automatically resolved to the same value as the old phandle, then yes.

> > > A new test case is added to check how fdtoverlay handles this case.
> > > Attempting to apply this test overlay without the fix in this patch
> > > results in the following output:
> > >
> > >     input  =3D tests/overlay_base_ref.test.dtb
> > >     output =3D tests/overlay_overlay_ref.fdtoverlay.dtb
> > >     overlay[0] =3D tests/overlay_overlay_ref.test.dtb
> > >
> > >     Failed to apply 'tests/overlay_overlay_ref.test.dtb':
> > >     FDT_ERR_NOTFOUND
> >
> > [snip]
> > > diff --git a/tests/overlay_base_ref.dts b/tests/overlay_base_ref.dts
> > > new file mode 100644
> > > index 0000000..1fc02a2
> > > --- /dev/null
> > > +++ b/tests/overlay_base_ref.dts
> > > @@ -0,0 +1,19 @@
> > > +/*
> > > + * Copyright (c) 2016 NextThing Co
> > > + * Copyright (c) 2016 Free Electrons
> > > + * Copyright (c) 2016 Konsulko Inc.
> > > + *
> > > + * SPDX-License-Identifier:  GPL-2.0+
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +/ {
> > > +     test: test-node {
> > > +             test-int-property =3D <42>;
> > > +     };
> > > +
> > > +     test-refs {
> > > +             refs =3D <&test>;
> > > +     };
> > > +};
> > > diff --git a/tests/overlay_overlay_ref.dts b/tests/overlay_overlay_re=
f.dts
> > > new file mode 100644
> > > index 0000000..a45c95d
> > > --- /dev/null
> > > +++ b/tests/overlay_overlay_ref.dts
> > > @@ -0,0 +1,24 @@
> > > +/*
> > > + * Copyright (c) 2016 NextThing Co
> > > + * Copyright (c) 2016 Free Electrons
> > > + * Copyright (c) 2016 Konsulko Inc.
> > > + *
> > > + * SPDX-License-Identifier:  GPL-2.0+
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> >
> > Given that you're using the /plugin/ tag, it doesn't make sense to use
> > the "manual" way of constructing the overlay, rather than dtc's
> > built-in syntax:
> >
> > &test {
> >         ...
> > }
> >
> > > +
> > > +/ {
> > > +     fragment@0 {
> > > +             target =3D <&test>;
> > > +
> > > +             frag0: __overlay__ {
> > > +                     test-int-property =3D <43>;
> > > +             };
> > > +     };
> > > +
> > > +    test-ref {
> > > +        ref =3D <&frag0>;
> > > +    };
> > > +};
> >
> > Things get weird in this example, because the point is we're equating
> > the __overlay__ node with the target node.  Just ignoring the phandle
> > overwrite is *wrong* in this case, because it will break test-ref
> > (except that test-ref isn't in a fragment, and therefore discarded,
> > but that could be changed).  Instead to handle this case correctly
> > we need to identify that we're asking the __overlay__ node to be the
> > same thing as &test and so &frag0 needs to be rewritten as &test.
>=20
> This isn't intended to be an example. It's a minimal test case to
> reproduce the bug.
>=20
> The actual example where this issue was first seen is [1]. The entries
> in __overrides__ are interpreted as different options which can be
> selected at runtime by a config option. I've looked for the code which
> actually implements this but I can't find it, my understanding is that
> the proprietary first stage bootloader on the Raspberry Pi applies
> these overrides and the overlays together.

Oh... right.  Well, if you do rely on random extra nodes that aren't
described anywhere in the overlay spec...

Ugh, this really looks like yet more bending dts to do things it was
never really meant to handle.

> In Automotive Grade Linux we want to be able to network boot a
> Raspberry Pi and load a device tree with appropriate overlays applied.
> The files are fetched over the network by u-boot after the first stage
> bootloader has exited so we can't rely on the proprietary Raspberry Pi
> firmware to handle this for us. Instead the overlay needs to be
> applied either manually at compile time or in u-boot at runtime. This
> resulted in the FDT_ERR_NOTFOUND error described in the commit message
> for this patch. Discussion and investigation is captured in [2].
>=20
> [1]: https://github.com/raspberrypi/linux/blob/rpi-5.4.y/arch/arm/boot/dt=
s/overlays/cma-overlay.dts
> [2]: https://jira.automotivelinux.org/browse/SPEC-3702
>=20
> Thanks,
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tLC2X+3ebuzteBsw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAzU2UACgkQbDjKyiDZ
s5LwaxAA4YG+2TjqjWGYZ6IPz+x1XRqKdrTQ+S19WGc11fr8Mk+gElIsKdFl/oZy
Y5hycQQv1/hzj4GtUnt5/NZ9bDxmkmdIPIbRxk+4NK5U88hFNoQp89yYSDyZ5EAM
C8lyw8ElxMP16+a0TVc2xOOzWRtCh8/Q6S+hcQJ2zztDxe6DNIXrO9WCryuF8FdK
LVPnllEBxGofQJS+k6NJIXeHWmpZChtHov1TovllemYzSWZNjC9x2FfKJrg320be
a5Q3xSiFladynpu+85AI02m3QqP+54oJqneo2QohxblBWsqo67zqW9rOUSX9pbez
7LYUS5qmP4RJXPqT1CqIA3fBeeieVFbUZHDuh7BZpIDCPo6GzNq7tbmvJtQ0AEso
DD3a1PpeoHe2kNYSLLeveV6vUOmvYpU26qdeWcCIwwyJE6OAoXhLzUegSoalvuZ0
da7lPor2bdkvY50zSTL47YYZytCah3KzU+IZtvZvSxiZcMR8gU96J/J98Tp8nIV0
bMq3tj8dYwP9Ps0xlgzdMF2l9OXW0vFaRmuDwbXIy1WA63g9qIruWUtxhgIV+as3
5pFsbAkMRCFIXH1wzhIdtkplcilcGAyBWccMhWn3+D3T2gbCisgVZe373GNvhgE2
Pkau+YGFZ/JjJiHYKveRgUO7OV187dh1I/xkY1sfSW84pJuteQs=
=9c8f
-----END PGP SIGNATURE-----

--tLC2X+3ebuzteBsw--
