From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/5] checks: Add markers on known properties
Date: Tue, 15 Jun 2021 16:01:18 +1000
Message-ID: <YMhCLoMk5mBwqZkN@yekko>
References: <20210526010335.860787-1-robh@kernel.org>
 <20210526010335.860787-5-robh@kernel.org>
 <YL7VETwYAct0B0Mq@yekko>
 <CAL_JsqKb-4ay9JNLUOetupxBKNpBsFNB-Ztc1ocbDSj_KxSWsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WsPo+/4qLfFhyKbP"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623738358;
        bh=gSbE/Asx4P3v+B2pt5ZCjfmATzerlSg4mPeMmLbKbjo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aB7TqWRVGbPqaH3mt5vKuAv2nqokwF5P2X5TZTAdObcarI+ELMN1/PVB54zp2M3Bp
         q4wivP+wDiEGgcrqcqni6XEMdGXhtDC5Dc84OOCyvcV6kQLRZBik3dTlASQHnKDWTv
         TmnEKHj/yr5tp0OwyN0qv38/mj+N5K9Q3xzc2jZA=
Content-Disposition: inline
In-Reply-To: <CAL_JsqKb-4ay9JNLUOetupxBKNpBsFNB-Ztc1ocbDSj_KxSWsg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--WsPo+/4qLfFhyKbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 07:49:20AM -0500, Rob Herring wrote:
> On Mon, Jun 7, 2021 at 9:25 PM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
> >
> > On Tue, May 25, 2021 at 08:03:34PM -0500, Rob Herring wrote:
> > > For properties we already have checks for, we know the type and how to
> > > parse them. Use this to add type and phandle markers so we have them =
when
> > > the source did not (e.g. dtb format).
> > >
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > ---
> > >  checks.c | 74 ++++++++++++++++++++++++++++++++++++++++++------------=
--
> > >  1 file changed, 56 insertions(+), 18 deletions(-)
>=20
>=20
> > > @@ -766,10 +797,15 @@ static void check_reg_format(struct check *c, s=
truct dt_info *dti,
> > >       size_cells =3D node_size_cells(node->parent);
> > >       entrylen =3D (addr_cells + size_cells) * sizeof(cell_t);
> > >
> > > -     if (!entrylen || (prop->val.len % entrylen) !=3D 0)
> > > +     if (!entrylen || (prop->val.len % entrylen) !=3D 0) {
> > >               FAIL_PROP(c, dti, node, prop, "property has invalid len=
gth (%d bytes) "
> > >                         "(#address-cells =3D=3D %d, #size-cells =3D=
=3D %d)",
> > >                         prop->val.len, addr_cells, size_cells);
> > > +             return;
> > > +     }
> > > +
> > > +     for (offset =3D 0; offset < prop->val.len; offset +=3D entrylen)
> > > +             marker_add(&prop->val.markers, TYPE_UINT32, offset);
> >
> > This doesn't seem quite right.  A 'reg' property could definitely be
> > u64s rather than u32s (amongst other possibilities, but u64 is the
> > most likely).  The user can even indicate that using /bits/ 64, but
> > this will overrule that.
>=20
> Ignoring malformed sizes, it can only be u32 unless the input is .dts
> and using /bits/ or [].

Yes.. and using /bits/ is exactly the case I'm talking about.

> I'll make marker_add fail if there's any type
> marker rather than just a matching marker.
>=20
>=20
> > >  }
> > >  WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cel=
ls);
> > >  WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_=
size_cells);
> > > @@ -1408,19 +1447,6 @@ static void check_property_phandle_args(struct=
 check *c,
> > >                       continue;
> > >               }
> > >
> > > -             /* If we have markers, verify the current cell is a pha=
ndle */
> > > -             if (prop->val.markers) {
> > > -                     struct marker *m =3D prop->val.markers;
> > > -                     for_each_marker_of_type(m, REF_PHANDLE) {
> > > -                             if (m->offset =3D=3D (cell * sizeof(cel=
l_t)))
> > > -                                     break;
> > > -                     }
> > > -                     if (!m)
> > > -                             FAIL_PROP(c, dti, node, prop,
> > > -                                       "cell %d is not a phandle ref=
erence",
> > > -                                       cell);
> > > -             }
> > > -
> > >               provider_node =3D get_node_by_phandle(root, phandle);
> > >               if (!provider_node) {
> > >                       FAIL_PROP(c, dti, node, prop,
> > > @@ -1447,6 +1473,9 @@ static void check_property_phandle_args(struct =
check *c,
> > >                                 "property size (%d) too small for cel=
l size %d",
> > >                                 prop->val.len, cellsize);
> > >               }
> > > +
> > > +             marker_add(&prop->val.markers, REF_PHANDLE, cell * size=
of(cell_t));
> >
> > This is definitely broken.  It's safe enough to add TYPE_ markers, but
> > REF_PHANDLE requires a label or path to be valid, which you don't add,
> > and have no way of deducing.  I'm kind of surprised you didn't cause a
> > crash in the later code that fixes up references with this.
>=20
> Didn't see any failures, so maybe the fixup runs first? I'll look at
> adding the path or perhaps we can loosen this requirement?

Neither of those seems like the right approach.  REF_PHANDLE *means* a
place to replace a phandle, we're just re-using that to indicate that
we have a phandle here.  If you want to know it's a phandle without
also having a reference to fill in there, then we should add a
TYPE_PHANDLE marker.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WsPo+/4qLfFhyKbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIQi4ACgkQbDjKyiDZ
s5I1qg/9EsVpp4M9qdZV6A1G5AhOOlrsukeKBPqLN90ckj0CM+myYU/WOscIEpT6
fAi86bXT+mv2prwC9bCCEAC+ycR8O+qzvZ/LYDwHwSdQ8XjuNOhYm/a5s8PL9AAy
Ikx+Y2MN2lVZinoABvcOpmUoIUxLF7qAqjPetbsvLa04SP5ocxU3Ju5dssaVviUX
3gVV1HJHb+m+ezKqLXQA36NPV6UAyCKnHM3f1U5qy11pBx4QklIpnX0TQQtmFLgS
50v9CwdZ497qp6NyFu4cWYiZ1vI+YiJg02qunLWnsRroFOmW4+waMNIPBJA3yKpR
jPVehZiJEqVL8TIMicOldtzmXbIQwPVdl8SafMMeuXz1Xy7YoFNu+3eUXASyv926
yfn8a1/Rq++pfyez2IayWDLH4chhxMR9JrnCWp7DwOM3xf5bq+/1W60EaNEcpnEz
7F0/++Y5STSdY4XBzF4RJQqg14R4OSxwHsYhG/bQf271X1bKzkr+5ExWJUT0fGsm
EiupILO0/QH1szx7iQ0w6hUt9K7Ppn56Hho481ZPPWFiXhfV209wsrXUH3xMpB/I
9Q1HWaDD2UWX7PwVC+j9Nmajp4FukLYM9oDP0FbpY1IhkeDOdwnfhg68z3rEDFHk
RMAizyN3b0tAg9/cnzRigLM4AnJJTxOyPYKq9Cka+s9AurlRDwM=
=x99a
-----END PGP SIGNATURE-----

--WsPo+/4qLfFhyKbP--
