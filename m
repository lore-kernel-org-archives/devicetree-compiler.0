From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/5] checks: Add check_is_cell() for all phandle+arg
 properties
Date: Tue, 15 Jun 2021 16:02:36 +1000
Message-ID: <YMhCfKOnsi2UKQEp@yekko>
References: <20210526010335.860787-1-robh@kernel.org>
 <20210526010335.860787-3-robh@kernel.org>
 <YL7OmqDaZRrcWbjo@yekko>
 <CAL_JsqL5ks9G1_q+8LN_ceNjE-d40ri8G2BmnxnPCCa+UrqHgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/n0pJECMz2M/ret+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623738358;
        bh=fBFjftXHDBn6bcnLtGnS0dhxd50RsTJJK17k7V0X5To=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Legg3NR2eB8ItwmoO3+eBscgaaKdRg104lR2FZ7sPYdtlNUgNfpQwG5aMmT38vb2Y
         SC7dxFi9AakrhHO1O/PW+kutyB5q40BKyB0Adb7/9q4dI72TPXecvUv80uU0qz1yzr
         Rh7UUmbf6U43jC3l7cZwzR8WG2IacWM40iu84VjQ=
Content-Disposition: inline
In-Reply-To: <CAL_JsqL5ks9G1_q+8LN_ceNjE-d40ri8G2BmnxnPCCa+UrqHgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--/n0pJECMz2M/ret+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 09:45:42AM -0500, Rob Herring wrote:
> On Mon, Jun 7, 2021 at 9:25 PM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
> >
> > On Tue, May 25, 2021 at 08:03:32PM -0500, Rob Herring wrote:
> > > There's already a check for '#.*-cells' properties, so let's enable i=
t for
> > > all the ones we already know about.
> > >
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Good idea, applied.
> >
> > > ---
> > >  checks.c | 19 ++++++++++++++++++-
> > >  1 file changed, 18 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/checks.c b/checks.c
> > > index eb91c8ea22fa..6a01a2468c42 100644
> > > --- a/checks.c
> > > +++ b/checks.c
> > > @@ -1466,7 +1466,8 @@ static void check_provider_cells_property(struc=
t check *c,
> > >  }
> > >  #define WARNING_PROPERTY_PHANDLE_CELLS(nm, propname, cells_name, ...=
) \
> > >       static struct provider nm##_provider =3D { (propname), (cells_n=
ame), __VA_ARGS__ }; \
> > > -     WARNING(nm##_property, check_provider_cells_property, &nm##_pro=
vider, &phandle_references);
> > > +     WARNING_IF_NOT_CELL(nm##_is_cell, cells_name); \
> > > +     WARNING(nm##_property, check_provider_cells_property, &nm##_pro=
vider, &nm##_is_cell, &phandle_references);
> > >
> > >  WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
> > >  WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#c=
ooling-cells");
> > > @@ -1843,21 +1844,37 @@ static struct check *check_table[] =3D {
> > >       &chosen_node_is_root, &chosen_node_bootargs, &chosen_node_stdou=
t_path,
> > >
> > >       &clocks_property,
> > > +     &clocks_is_cell,
> > >       &cooling_device_property,
> > > +     &cooling_device_is_cell,
> > >       &dmas_property,
> > > +     &dmas_is_cell,
> > >       &hwlocks_property,
> > > +     &hwlocks_is_cell,
> > >       &interrupts_extended_property,
> > > +     &interrupts_extended_is_cell,
> > >       &io_channels_property,
> > > +     &io_channels_is_cell,
> > >       &iommus_property,
> > > +     &iommus_is_cell,
> > >       &mboxes_property,
> > > +     &mboxes_is_cell,
> > >       &msi_parent_property,
> > > +     &msi_parent_is_cell,
> > >       &mux_controls_property,
> > > +     &mux_controls_is_cell,
> > >       &phys_property,
> > > +     &phys_is_cell,
> > >       &power_domains_property,
> > > +     &power_domains_is_cell,
> > >       &pwms_property,
> > > +     &pwms_is_cell,
> > >       &resets_property,
> > > +     &resets_is_cell,
> > >       &sound_dai_property,
> > > +     &sound_dai_is_cell,
> > >       &thermal_sensors_property,
> > > +     &thermal_sensors_is_cell,
> >
> > Incidentally, if anyone can see a decent, portable way of avoiding the
> > ugly redundancy of listing all the tests in this array, I'd love to
> > hear it.
>=20
> If we have a standard prefix to match on, we could generate the list:
>=20
> nm -P checks.o | sed -n -e 's/^\(check_[a-zA-Z0-9_]*\).*/\&\1,/p'
>=20
> (Obviously, 'check_' is not the right prefix currently.)
>=20
> Most of the work here is in the build system and I don't really care
> to implement this twice. :( What happened to the Makefile wrapping
> meson?

There are a handful of issues with the meson stuff that we're (rather
slowly) ironing out before I'm ready to replace the existing makefiles
entirely.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/n0pJECMz2M/ret+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIQnwACgkQbDjKyiDZ
s5LoPQ//XbmG+oR6JsjlukISpxxOa0uqmfmQf5C2Go0aSUdPj291GSEemJgiMHsC
EcFnoLdzXboUlKkDKXywae4IzPyUaxExrKsS3GVWWPtECkR/qnpsLRL4HBO0m2hR
hre35ttlAJspIROt4Ecfogl/0ylJC1P4YbH5gKwjcGlTNQMEOzwP8euCa+nhE3DX
vSvw+QgHOlV5Ma4bUjJS67bXosi1xzbI4N/fZP1cXZ+D9GB20Fy+udz35gORVlQa
cMjlCcwXYy2O8XhwmNnfvw2/sJgaIWukWaSMDcwFwE/wf9ZMID5msG1OA+l7c50v
YPqiBezg9JbtB1E/MYxiACTCpS/tRpga9vpStzL4P8gDLw2LAeWdSrP/cDu8ZAQu
TCy1FaCnHwCTgJkGpcfy/dqNG2pFzGaXDijiZbNu9bME0diFJORtP4iNT6Vzg4Pa
YsQsCLJJORKSdM15GjwrK9uGYlYVgDkun5LakCpRiAb06BgrspKoeAUcFguQbMFQ
EtFtVTdhH01OEemkTukvxiUEx32k/2WDIbd6k2BkFcXmgYCO6TRU4prYUnqYoYfF
DSBnn40C+3mCgwtdd16msaqiZ3lkcOn+bX3uiYFTHdDzC61fsQh4cuY5Goho8TJ3
tZh6C1Tfh9KKDa+qTnC2LAC6KFDz+S4xxPVBpZCr5AFvkxR37TA=
=Ie36
-----END PGP SIGNATURE-----

--/n0pJECMz2M/ret+--
