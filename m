From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Prevent overlays from modifying phandle
 properties
Date: Mon, 11 Jan 2021 22:04:22 +1100
Message-ID: <20210111110422.GE3051@yekko.fritz.box>
References: <20201219172808.3101-1-pbarker@konsulko.com>
 <CAM9ZRVvBiqe1Su=KNQ0eFWURvnoi-s7rL9g4t-XFD4bxdMZ-ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1610363073;
        bh=eIEWCP0IdVtHhDVJHjTuuVu71CbIBwnjjWe7rQR1HfQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aDdgSZ2+bjH5ViUzU2rl8w+qwB61btstvAtDHIGKcT0JvtDM47ajLYw9WC5cZLN/j
         KevWb/+yx0Ut0COpuhqYd+pFQqmNC93XC4k+txF8qo/qAdzanKBBASzFsifvXERn/X
         XIZYBqOl+8tfCLbkKygicNQEbfKSJJQWcICDhqcU=
Content-Disposition: inline
In-Reply-To: <CAM9ZRVvBiqe1Su=KNQ0eFWURvnoi-s7rL9g4t-XFD4bxdMZ-ag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Paul Barker <pbarker-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Scott Murray <scott.murray-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jan Simon Moeller <jsmoeller-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2021 at 11:50:19AM +0000, Paul Barker wrote:
> On Sat, 19 Dec 2020 at 17:28, Paul Barker <pbarker-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >
> > When applying an overlay fragment, we should take care not to overwrite
> > an existing phandle property of the target node as this could break
> > references to the target node elsewhere in the base dtb.
> >
> > In addition to potentially breaking references within the resulting fdt,
> > if the overlay is built with symbols enabled (`-@` option to dtc) then
> > fdtoverlay will be unable to merge the overlay with a base dtb file.
> >
> > A new test case is added to check how fdtoverlay handles this case.
> > Attempting to apply this test overlay without the fix in this patch
> > results in the following output:
> >
> >     input  =3D tests/overlay_base_ref.test.dtb
> >     output =3D tests/overlay_overlay_ref.fdtoverlay.dtb
> >     overlay[0] =3D tests/overlay_overlay_ref.test.dtb
> >
> >     Failed to apply 'tests/overlay_overlay_ref.test.dtb': FDT_ERR_NOTFO=
UND
> >
> > In this test case the __overlay__ node in question does not explicitly
> > contain a phandle property in the dts file, the phandle is added during
> > compilation as it is referenced by another node within the overlay dts.
> >
> > This failure occurs due to a sequence of events in the functions called
> > by fdt_overlay_apply():
> >
> > 1) In overlay_fixup_phandles(), the target of the overlay fragment is
> >    looked up and the target property is set to the phandle of the target
> >    node.
> >
> > 2) In overlay_merge(), the target node is looked up by phandle via
> >    overlay_get_target(). As the __overlay__ node in this test case
> >    itself has a phandle property, the phandle of the target node is
> >    modified.
> >
> > 3) In overlay_symbol_update(), the target node is again looked up by
> >    phandle via overlay_get_target(). But this time the target node
> >    cannot be found as its phandle property was modified.
> >
> > The fix for this issue is to skip modification of the phandle property
> > of the target node in step (2) of the above sequence. If the target node
> > doesn't already contain a phandle property, we can add one without risk.
> >
> > Signed-off-by: Paul Barker <pbarker-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  libfdt/fdt_overlay.c          |  2 ++
> >  tests/overlay_base_ref.dts    | 19 +++++++++++++++++++
> >  tests/overlay_overlay_ref.dts | 24 ++++++++++++++++++++++++
> >  tests/run_tests.sh            |  5 +++++
> >  4 files changed, 50 insertions(+)
> >  create mode 100644 tests/overlay_base_ref.dts
> >  create mode 100644 tests/overlay_overlay_ref.dts
> >
> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index d217e79..b3c217a 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -573,6 +573,8 @@ static int overlay_apply_node(void *fdt, int target,
> >                 if (prop_len < 0)
> >                         return prop_len;
> >
> > +               if (!strcmp(name, "phandle") && fdt_getprop(fdt, target=
, name, NULL))
> > +                       continue;
> >                 ret =3D fdt_setprop(fdt, target, name, prop, prop_len);
> >                 if (ret)
> >                         return ret;
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
> > + * SPDX-License-Identifier:    GPL-2.0+
> > + */
> > +
> > +/dts-v1/;
> > +
> > +/ {
> > +       test: test-node {
> > +               test-int-property =3D <42>;
> > +       };
> > +
> > +       test-refs {
> > +               refs =3D <&test>;
> > +       };
> > +};
> > diff --git a/tests/overlay_overlay_ref.dts b/tests/overlay_overlay_ref.=
dts
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
> > + * SPDX-License-Identifier:    GPL-2.0+
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/ {
> > +       fragment@0 {
> > +               target =3D <&test>;
> > +
> > +               frag0: __overlay__ {
> > +                       test-int-property =3D <43>;
> > +               };
> > +       };
> > +
> > +    test-ref {
> > +        ref =3D <&frag0>;
> > +    };
> > +};
> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > index 294585b..a65b166 100755
> > --- a/tests/run_tests.sh
> > +++ b/tests/run_tests.sh
> > @@ -329,6 +329,11 @@ dtc_overlay_tests () {
> >      run_test check_path overlay_base_with_aliases.dtb not-exists "/__s=
ymbols__"
> >      run_test check_path overlay_base_with_aliases.dtb not-exists "/__f=
ixups__"
> >      run_test check_path overlay_base_with_aliases.dtb not-exists "/__l=
ocal_fixups__"
> > +
> > +    # Test taking a reference to an overlay fragment
> > +    run_dtc_test -@ -I dts -O dtb -o overlay_base_ref.test.dtb "$SRCDI=
R/overlay_base_ref.dts"
> > +    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_ref.test.dtb "$SR=
CDIR/overlay_overlay_ref.dts"
> > +    run_wrap_test $FDTOVERLAY -i overlay_base_ref.test.dtb overlay_ove=
rlay_ref.test.dtb -o overlay_overlay_ref.fdtoverlay.dtb
> >  }
> >
> >  tree1_tests () {
> >
>=20
> Hi folks,
>=20
> I'm sending a ping on this as I haven't heard any feedback in 2 weeks.
> Is there anything I can do to help move this forward? Or is there an
> alternative approach I should take to solving this issue?

Sorry, I've been having trouble finding the time to get my head around
this.  The problem seems real, but I'm not sure if this is the right
approach to fixing it yet.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/8MLYACgkQbDjKyiDZ
s5JtQhAAoe6YWYIXuZjZ1AyP2vUo8hqnoDWxbFSMqxkV469wH7w47QMKsFbHlPXB
3zZ5bdAlDLZ4m0P0/vW04rDZWQNFDU1+0q8AFBDP1lzVYtA3SybUWdcxu5G6dNz2
8ENE2bLCD+NuQn7yLphBbLxMaTXjdkW5MjNhhhGoAB8Zy4ubNpj7+mC3GCDYFjdi
nMAXKpB2C2W/B/yNRYLF76uSEaLQKiSBnKlMqUGNOFivIoBo1Al8VFc2sd6MXU+V
F2iy1kdcfakRxJjwYbSghxOsW+GXTKFmkYRZXk2tJDhudyKm5MP7Ftkd6rUu/WVo
SRZlf47W8XP/GC7FaC04xBFeQxsHc+hRNE/Wn9f3uG07F1RBQx1gH/Th77R6S2Aa
J2TPr4+jtgwLEJR2E4+SBuzbYsAa1iu+zMydO45i7Dks7vVj+icC/HRTbNwIrOAD
GV9AvPQxIHaO6/mjShloXMbSJNGW3r9ovtx2T0K6iEGb5z9ojZil3uyNjUXk1lZK
nfAagTv9BChGqqmjcDmd2BMr9SoTJGoVQ8XaK0BrzMo3RiyVj6HbQY5dR3mhrHIa
ng1Ma1pzYCZZRqGG8ky1fu0l9VyFWT7qbt0orF6J5/DgW3Dvtb4DvfryU12YnXoE
wOTc85VwxZT3+DaysojtuJMdUuIVtcFDxZWIJ/uHHHLdkNbrO3I=
=rIJr
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--
