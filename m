From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] checks: Handle #dma-address-cells and #dma-size-cells
Date: Mon, 14 Nov 2022 11:34:06 +0100
Message-ID: <Y3IZnpL3Q3STEaLs@orome>
References: <20221111114728.462767-1-thierry.reding@gmail.com>
 <CAL_JsqLV2ZHLJ=14zf9zNfq+S+Rs09EYmZrNHsvdhbmvvehj6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gsRwUVDNS7uWxQM+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7f9tSshb3ivSbiDaFq6Bt24BzedFCWCU9AxFlmP5KjU=;
        b=Y6jn1xvQrHbAsc7i2/OVDceA+Ugb9Ut2MzYenRDUDo550xW9sWW1wJ3CdS5K262YAh
         sWkEnMoQheUgrxRX8NuktSi+uplmttyEOLWtiAzaDAmEhSQtfFx+XSl0rIYUNy3bTPYH
         1dz8XqN2eaiLAgvdjgjDTuwzaIXJs4hUb2GcnKh5GnonnYZDqIY9ZC5uxNH6Fuc11uj/
         NLwoCIziukJ6cZPefxt3XLSRCI+bXRvbvP1BN7ENUNIIv3dtBflampdcaRzHPCsh9xxc
         B5uYT3T9oayPX7cofDMTMYfclw04klJRUjEDRV+frvByntVcewe2wF/Vi7mJwaOBgWar
         KSrA==
Content-Disposition: inline
In-Reply-To: <CAL_JsqLV2ZHLJ=14zf9zNfq+S+Rs09EYmZrNHsvdhbmvvehj6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--gsRwUVDNS7uWxQM+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2022 at 11:01:58AM -0600, Rob Herring wrote:
> On Fri, Nov 11, 2022 at 5:47 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > The #dma-address-cells and #dma-size-cells properties can be used to
> > override their non-DMA counterparts (#address-cells and #size-cells)
> > for cases where the control bus (defined by the "reg" and "ranges"
> > properties) has different addressing requirements from the DMA bus.
> >
> > The "dma-ranges" property needs to be sized depending on these DMA
> > bus properties rather than the control bus properties, so adjust the
> > check accordingly.
>=20
> I assume I'll be seeing a spec and schema addition too.

Yeah, I was looking around to see where else we may need changes. I had
looked at dt-schema but couldn't find a good place to add them since
#address-cells and #size-cells seem to be mostly handled in the library
code rather than in the json-schema definitions. So if you could provide
some pointers as to how you think this should be added, that'd be great.

I can look at writing an update to the spec, but to be frank could use
some guidance on that as well.

> I imagine David is wondering where this is coming from given these are
> new properties, not existing ones that the checks just didn't handle.

Right, I should've provided a bit more background on this. Evidently the
commit message was not enough.

Thierry

> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  checks.c | 48 +++++++++++++++++++++++++++++++++++++-----------
> >  dtc.h    |  1 +
> >  2 files changed, 38 insertions(+), 11 deletions(-)
> >
> > diff --git a/checks.c b/checks.c
> > index 9f31d2607182..ee13dce03483 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -743,6 +743,17 @@ static void fixup_addr_size_cells(struct check *c,=
 struct dt_info *dti,
> >         prop =3D get_property(node, "#size-cells");
> >         if (prop)
> >                 node->size_cells =3D propval_cell(prop);
> > +
> > +       node->dma_addr_cells =3D -1;
> > +       node->dma_size_cells =3D -1;
> > +
> > +       prop =3D get_property(node, "#dma-address-cells");
> > +       if (prop)
> > +               node->dma_addr_cells =3D propval_cell(prop);
>=20
> else
>     node->dma_addr_cells =3D node->addr_cells;
>=20
> > +
> > +       prop =3D get_property(node, "#dma-size-cells");
> > +       if (prop)
> > +               node->dma_size_cells =3D propval_cell(prop);
> >  }
> >  WARNING(addr_size_cells, fixup_addr_size_cells, NULL,
> >         &address_cells_is_cell, &size_cells_is_cell);
> > @@ -751,6 +762,10 @@ WARNING(addr_size_cells, fixup_addr_size_cells, NU=
LL,
> >         (((n)->addr_cells =3D=3D -1) ? 2 : (n)->addr_cells)
> >  #define node_size_cells(n) \
> >         (((n)->size_cells =3D=3D -1) ? 1 : (n)->size_cells)
> > +#define node_dma_addr_cells(n) \
> > +       (((n)->dma_addr_cells =3D=3D -1) ? node_addr_cells(n) : (n)->dm=
a_addr_cells)
> > +#define node_dma_size_cells(n) \
> > +       (((n)->dma_size_cells =3D=3D -1) ? node_size_cells(n) : (n)->dm=
a_size_cells)
>=20
> Then these can be just "(n)->dma_size_cells".
>=20
> But wait, what about the default sizes? Those have been a dtc warning
> since longer than I've run dtc. The defaults don't even agree with
> Linux depending on the architecture. Certainly anyone using these new
> properties must not be relying on defaults.
>=20
> >
> >  static void check_reg_format(struct check *c, struct dt_info *dti,
> >                              struct node *node)
> > @@ -787,6 +802,7 @@ static void check_ranges_format(struct check *c, st=
ruct dt_info *dti,
> >         struct property *prop;
> >         int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, ent=
rylen;
> >         const char *ranges =3D c->data;
> > +       const char *prefix;
> >
> >         prop =3D get_property(node, ranges);
> >         if (!prop)
> > @@ -798,28 +814,38 @@ static void check_ranges_format(struct check *c, =
struct dt_info *dti,
> >                 return;
> >         }
> >
> > -       p_addr_cells =3D node_addr_cells(node->parent);
> > -       p_size_cells =3D node_size_cells(node->parent);
> > -       c_addr_cells =3D node_addr_cells(node);
> > -       c_size_cells =3D node_size_cells(node);
> > +       if (strcmp(ranges, "dma-ranges") =3D=3D 0) {
> > +               p_addr_cells =3D node_dma_addr_cells(node->parent);
> > +               p_size_cells =3D node_dma_size_cells(node->parent);
> > +               c_addr_cells =3D node_dma_addr_cells(node);
> > +               c_size_cells =3D node_dma_size_cells(node);
> > +               prefix =3D "dma-";
> > +       } else {
> > +               p_addr_cells =3D node_addr_cells(node->parent);
> > +               p_size_cells =3D node_size_cells(node->parent);
> > +               c_addr_cells =3D node_addr_cells(node);
> > +               c_size_cells =3D node_size_cells(node);
> > +               prefix =3D "";
> > +       }
> > +
> >         entrylen =3D (p_addr_cells + c_addr_cells + c_size_cells) * siz=
eof(cell_t);
> >
> >         if (prop->val.len =3D=3D 0) {
> >                 if (p_addr_cells !=3D c_addr_cells)
> >                         FAIL_PROP(c, dti, node, prop, "empty \"%s\" pro=
perty but its "
> > -                                 "#address-cells (%d) differs from %s =
(%d)",
> > -                                 ranges, c_addr_cells, node->parent->f=
ullpath,
> > +                                 "#%saddress-cells (%d) differs from %=
s (%d)",
> > +                                 ranges, prefix, c_addr_cells, node->p=
arent->fullpath,
>=20
> This is going to misleadingly print '#dma-address-cells' in cases that
> actually have '#address-cells'. It's probably easiest if you say 'DMA?
> address cells' rather than using the property name.
>=20
> >                                   p_addr_cells);
> >                 if (p_size_cells !=3D c_size_cells)
> >                         FAIL_PROP(c, dti, node, prop, "empty \"%s\" pro=
perty but its "
> > -                                 "#size-cells (%d) differs from %s (%d=
)",
> > -                                 ranges, c_size_cells, node->parent->f=
ullpath,
> > +                                 "#%ssize-cells (%d) differs from %s (=
%d)",
> > +                                 ranges, prefix, c_size_cells, node->p=
arent->fullpath,
> >                                   p_size_cells);
> >         } else if (!is_multiple_of(prop->val.len, entrylen)) {
> >                 FAIL_PROP(c, dti, node, prop, "\"%s\" property has inva=
lid length (%d bytes) "
> > -                         "(parent #address-cells =3D=3D %d, child #add=
ress-cells =3D=3D %d, "
> > -                         "#size-cells =3D=3D %d)", ranges, prop->val.l=
en,
> > -                         p_addr_cells, c_addr_cells, c_size_cells);
> > +                         "(parent #%saddress-cells =3D=3D %d, child #%=
saddress-cells =3D=3D %d, "
> > +                         "#size-cells =3D=3D %d)", ranges, prop->val.l=
en, prefix,
> > +                         p_addr_cells, prefix, c_addr_cells, c_size_ce=
lls);
> >         }
> >  }
> >  WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells=
);
> > diff --git a/dtc.h b/dtc.h
> > index 0a1f54991026..3d2ef7f3616f 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -228,6 +228,7 @@ struct node {
> >
> >         cell_t phandle;
> >         int addr_cells, size_cells;
> > +       int dma_addr_cells, dma_size_cells;
> >
> >         struct label *labels;
> >         const struct bus_type *bus;
> > --
> > 2.38.1
> >

--gsRwUVDNS7uWxQM+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNyGZwACgkQ3SOs138+
s6FXxw//YEE6MhKuB8aR0IkAyyxGWEZcYB8Q0GkD/mX506S7IFlkcYBSr5IJQkUf
BOx7Mg4wyTEMnjLmPDwXbMtLLUSZMnlMr/8eG4L0hjnC+jSbUARrPcNWsnzdTSIS
m0Ar1Fn6xsMHygxmGAcOL2hIrxvaRCo23GSuC0MCwl9Z/BiFj6kKDrefdrRREjHS
f9RXLPfOKieb6tDJLpyQ7dKq50NDiKUlfO9eQ7aOGLAcpEXtWxFtf/rLvzJG9JER
PRHU71IZSUsyL74PNYyW3xdIFhWSy+iKRyv6WeMSxdp/9GqAmAP2W9c/GPcTe/4k
wJvFcaNiS9jQ1Xeomqt/Ol0zLDx95yv34tpGtuXR+H9UrQ+Nk8B4TP3vGd+aV/rB
WG6LmUgtdVbri8taRAU8VR38vVLd33upR2wC326MDeQOFmWR3VhMXKNnf9+Wo9cU
QePGiqbhJFe1NtaTEepug7P8wKO5TIeVqpv3hbEl0J/rihAJj52m+KhpmxgVn4DR
jAmDmitVtPI50XsVlLy1rgv7KWbBmBmY3Vskcgy8mh+REPC2bNbqFPFVAruEupXf
kyAnMrkLuRyGZX8ojOJiLeeUzTqmvjhMcTce1Z862wfmwTVvxce2Kico2/f6IW2s
iubSISBzKXqio+MIBZDyEAmz1NtcqfAbdbj+LDtVn1cvlwTwFXY=
=fQyz
-----END PGP SIGNATURE-----

--gsRwUVDNS7uWxQM+--
