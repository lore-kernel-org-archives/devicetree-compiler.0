From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Prevent overlays from modifying phandle
 properties
Date: Tue, 9 Mar 2021 15:56:39 +1100
Message-ID: <YEcAB+r77m9X6m/i@yekko.fritz.box>
References: <20201219172808.3101-1-pbarker@konsulko.com>
 <YCyo0CrHJiEaPEYA@yekko.fritz.box>
 <CAM9ZRVsD9DfEHOH6B8P-dd_KAdOJpf1+GmcM0ph8x1b8ug=BDQ@mail.gmail.com>
 <YDNTZW6bKT1bcJkX@yekko.fritz.box>
 <CAM9ZRVuwsJsH0zJgBfBbUR9Vu8AEESJfvekV38aZM2gOX44ukw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2e4tzkFVli67o9BW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1615265804;
        bh=DD0E4BtBgn8sx21pqwGXOB6+AIk0kwjZ6gw//YcvHAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=doR1urQiLP2fT+z12RYwfLnhzXGKNNxhTAsNj1Us4R6rfCekWd54vIq90RWlhkVVa
         8X3p6rLhPniYrAsuzxMRmMAZiVpTtVgmG2ajaiWUEq2CWwyMk9xr2f82ff98sHXVOJ
         orULntimDeKtQPFryGcaIWFsJ7QiW9tA6AYq4ITI=
Content-Disposition: inline
In-Reply-To: <CAM9ZRVuwsJsH0zJgBfBbUR9Vu8AEESJfvekV38aZM2gOX44ukw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Paul Barker <pbarker-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Scott Murray <scott.murray-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jan Simon Moeller <jsmoeller-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>


--2e4tzkFVli67o9BW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 08:39:48AM +0000, Paul Barker wrote:
> On Mon, 22 Feb 2021 at 06:47, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >
> > On Fri, Feb 19, 2021 at 09:28:04AM +0000, Paul Barker wrote:
> > > On Wed, 17 Feb 2021 at 05:25, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6rL0yjEaa7Ru@public.gmane.org=
au> wrote:
> > > >
> > > > On Sat, Dec 19, 2020 at 05:28:08PM +0000, Paul Barker wrote:
> > > > > When applying an overlay fragment, we should take care not to ove=
rwrite
> > > > > an existing phandle property of the target node as this could bre=
ak
> > > > > references to the target node elsewhere in the base dtb.
> > > >
> > > > It could.. but my first inclination is to say "don't do that".
> > >
> > > I entirely agree. However, folks are already doing this [1] and I
> > > think fdtoverlay should be more defensive here. My idea was to handle
> > > this safely in fdtoverlay if we can assume that it is never legitimate
> > > to modify the phandle property of a node from an overlay.
> >
> > The trouble is that both applying the change and ignoring the change
> > will break something.  Applying it will break things that attempt to
> > bind to the node with its "old" phandle, but ignoring it will break
> > something that attempts to bind to the new handle.  e.g.
> >
> > fragment@1 {
> >         target =3D < &somenode >;
> >         anothername: __overlay__ {
> >                 ...
> >         };
> > }
> > fragment@2 {
> >         target =3D < &differentnode >;
> >         __overlay__ {
> >                 some-prop =3D < &anothername >;
> >         };
> > }
> >
> > > A couple of
> > > alternatives would be raising an error in fdtoverlay instead of trying
> > > to silently ignore the phandle, or raising an error in dtc when the
> > > phandle is introduced.
> >
> > Right, I think those are better options.
> >
> > In the short term, I think raising an error in dtc is probably the
> > right choice - we can remove it when/if we implement this properly
> > ("merging" the old and new phandles).
> >
> > > > > In addition to potentially breaking references within the resulti=
ng fdt,
> > > > > if the overlay is built with symbols enabled (`-@` option to dtc)=
 then
> > > > > fdtoverlay will be unable to merge the overlay with a base dtb fi=
le.
> > > >
> > > > If we can manage, I really think the better fix is to *not* have the
> > > > overlay provide conflicting phandles, rather than having the merge
> > > > process ignore them.
> > > >
> > > > I think we need to pin down the cirucmstances in which overlays with
> > > > phandles are being generated and address those, if possible.
> > >
> > > Am I right in understanding this to mean we should raise an error in
> > > dtc when a phandle is generated in an __overlay__ node?
> >
> > As long as we're unable to generate stuff to have that phandle
> > automatically resolved to the same value as the old phandle, then yes.
> >
> > > > > A new test case is added to check how fdtoverlay handles this cas=
e.
> > > > > Attempting to apply this test overlay without the fix in this pat=
ch
> > > > > results in the following output:
> > > > >
> > > > >     input  =3D tests/overlay_base_ref.test.dtb
> > > > >     output =3D tests/overlay_overlay_ref.fdtoverlay.dtb
> > > > >     overlay[0] =3D tests/overlay_overlay_ref.test.dtb
> > > > >
> > > > >     Failed to apply 'tests/overlay_overlay_ref.test.dtb':
> > > > >     FDT_ERR_NOTFOUND
> > > >
> > > > [snip]
> > > > > diff --git a/tests/overlay_base_ref.dts b/tests/overlay_base_ref.=
dts
> > > > > new file mode 100644
> > > > > index 0000000..1fc02a2
> > > > > --- /dev/null
> > > > > +++ b/tests/overlay_base_ref.dts
> > > > > @@ -0,0 +1,19 @@
> > > > > +/*
> > > > > + * Copyright (c) 2016 NextThing Co
> > > > > + * Copyright (c) 2016 Free Electrons
> > > > > + * Copyright (c) 2016 Konsulko Inc.
> > > > > + *
> > > > > + * SPDX-License-Identifier:  GPL-2.0+
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +
> > > > > +/ {
> > > > > +     test: test-node {
> > > > > +             test-int-property =3D <42>;
> > > > > +     };
> > > > > +
> > > > > +     test-refs {
> > > > > +             refs =3D <&test>;
> > > > > +     };
> > > > > +};
> > > > > diff --git a/tests/overlay_overlay_ref.dts b/tests/overlay_overla=
y_ref.dts
> > > > > new file mode 100644
> > > > > index 0000000..a45c95d
> > > > > --- /dev/null
> > > > > +++ b/tests/overlay_overlay_ref.dts
> > > > > @@ -0,0 +1,24 @@
> > > > > +/*
> > > > > + * Copyright (c) 2016 NextThing Co
> > > > > + * Copyright (c) 2016 Free Electrons
> > > > > + * Copyright (c) 2016 Konsulko Inc.
> > > > > + *
> > > > > + * SPDX-License-Identifier:  GPL-2.0+
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +/plugin/;
> > > >
> > > > Given that you're using the /plugin/ tag, it doesn't make sense to =
use
> > > > the "manual" way of constructing the overlay, rather than dtc's
> > > > built-in syntax:
> > > >
> > > > &test {
> > > >         ...
> > > > }
> > > >
> > > > > +
> > > > > +/ {
> > > > > +     fragment@0 {
> > > > > +             target =3D <&test>;
> > > > > +
> > > > > +             frag0: __overlay__ {
> > > > > +                     test-int-property =3D <43>;
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > > +    test-ref {
> > > > > +        ref =3D <&frag0>;
> > > > > +    };
> > > > > +};
> > > >
> > > > Things get weird in this example, because the point is we're equati=
ng
> > > > the __overlay__ node with the target node.  Just ignoring the phand=
le
> > > > overwrite is *wrong* in this case, because it will break test-ref
> > > > (except that test-ref isn't in a fragment, and therefore discarded,
> > > > but that could be changed).  Instead to handle this case correctly
> > > > we need to identify that we're asking the __overlay__ node to be the
> > > > same thing as &test and so &frag0 needs to be rewritten as &test.
> > >
> > > This isn't intended to be an example. It's a minimal test case to
> > > reproduce the bug.
> > >
> > > The actual example where this issue was first seen is [1]. The entries
> > > in __overrides__ are interpreted as different options which can be
> > > selected at runtime by a config option. I've looked for the code which
> > > actually implements this but I can't find it, my understanding is that
> > > the proprietary first stage bootloader on the Raspberry Pi applies
> > > these overrides and the overlays together.
> >
> > Oh... right.  Well, if you do rely on random extra nodes that aren't
> > described anywhere in the overlay spec...
> >
> > Ugh, this really looks like yet more bending dts to do things it was
> > never really meant to handle.
>=20
> Agreed. I'd be happy to see this turned into an error in dtc, that
> would prompt folks to stop doing such crazy things.

Looking a little deeper at what's going on here, there are basically
three different semantic levels here.  They're all being encoded into
the flattened tree format which is causing some confusion.

1) There's the actual device tree information itself.  This uses
   phandles as a way of referencing nodes, no problem so far.

2) There's the overlay fragments.  This refers to things in the layer
   (1) data via those phandles, again no problem so far.

3) There's the automotive linux extension stuff that's trying to
   update the overlay fragments before they're assembled into the
   final DT.

Layer (3) is trying to refer to layer (2) pieces using phandles, and
this is where it really breaks down.  phandles refer to layer (1)
constructs, which might get modified or rearranged by layer (2).  The
overlay resoluion is assumed to resolve all those into phandles that
reference layer (1).

In your specific case where a label is being attached to an
__overlay__ node itself, the ambiguity becomes more obvious.  Are you
trying to refer to (a) the final DT node where that fragment will be
eventually placed, or (b) to a piece of the overlay *before* it is
resolved?

dtc (or the overlay applicator) really has no way to resolve that
ambiguity, except to say that phandles are really only good for
referring to final DT nodes, not to locations in an overlay.

> I'll have a look at the dtc code when I get chance and see if I can
> figure out where we can detect this and raise an error.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2e4tzkFVli67o9BW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBHAAUACgkQbDjKyiDZ
s5I/2A//eCGyH0JMnPxSMT6hxKJc4RuauuufADS9A66x303UYH8EpoiFbxxf0k5Y
84m3Xx+cvT9Q+VlM/r5qjURaAodspn9z0ypwWrQ+wpd6D4YWvwTsHoipH2ejO1+3
ZKuPcDZfWdMmpJIt/+cOV8xCD5bRQyOUkYZ5w1KTkOzEgWs2zLTpwohazKGfQjIh
kulgs8OOctQE1oHFkr1WmOr/0049+JaEfEgdpwEehEixNVQSEz796+Fb1jmwPQvG
Qld5o6C4qNFNWUgx097gBoM65BPOc0A+RUABOrgfGQH3R4C1QlmSyUniWLMzV6uv
bsrFlLbyFp1UXXVhAG+tQzrtmPKh46qJlks4WxifpkwhkssnWyJl7qzRj/PhSQYM
grXqX027Ao5IEEfACDeH8GCNCtD5b5g4iFvXzG6/PPcS/4mzXalrgBa1d0oiZoBm
I3RICfX+TfU1wIlV2rTllwTXAFC9XlOhRQsknWvZKoWV57oSOQaUFkOMeV79A2SD
MOZNh7Id3G6E7EgMetr2r6HXyrcs/2JYuvDil4tXV5Q/wS3rzHJAnX2phw3yHbQ8
x314MHn/dfANVWFjwsnUl23ikYfSag6rJNLvh2Y9YmlJF6lAsr3F+RMmSTMxXO7F
z3UgcJTwQEbeO/eWp+I/etYLRFVVeq1bEKMDX05tgTWVqi8Svww=
=skU7
-----END PGP SIGNATURE-----

--2e4tzkFVli67o9BW--
