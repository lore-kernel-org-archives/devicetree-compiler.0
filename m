From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] checks: Suppress warnings on overlay fragments
Date: Tue, 18 Apr 2023 12:33:26 -0500
Message-ID: <CAL_Jsq+L50RZ-s55tncFMHA1AwL5An13n2OVPzknnpu=uOvzhQ@mail.gmail.com>
References: <20230308091539.11178-1-qun-wei.lin@mediatek.com>
 <CAL_JsqKTM=gaQGZhrBCRkBusYYMci0mJGAFf9RTvCx00G2OJzg@mail.gmail.com> <347151917fb777e66a54e983efbbe0303f63e01a.camel@mediatek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681839218;
        bh=Z4JCWD+DKJpKatqKNIM1E/yWIsZzzj37LW5HYmSkCws=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jgjkXCuEJRYHvFs9Lka1WyVt3j0zGlQgYtHjIW5TUnXFPvXkcxBE4cF1EXTIOoE4z
         jPgxuj64PG26g+LnGxv80cl2H+JZGeTWTR27bYKd7XSHkIfmducuDC7YSWJJgLaFL1
         6bTaxjKrVw+COj+dixcFEOfcLu03AK/mQSLCOjBG2GFEiuOLscAzEbD/OZph74IRHZ
         k0gG+2NDsAFLZuUStQri1y0qvx71p6883AVZttrvHKSrgyuyJKE5RxRN7KYbEGRmFQ
         5xg8w8dWsJzCof7JcefqAaSTQ7Wy+xJiJ8pFVr8hS5VIk5nOFKo9OZHG3VZq5b2B0Y
         i/w2urcjzWk/g==
In-Reply-To: <347151917fb777e66a54e983efbbe0303f63e01a.camel-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, =?UTF-8?B?S3Vhbi1ZaW5nIExlZSAo5p2O5Yag56mOKQ==?= <Kuan-Ying.Lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= <chinwen.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SXZhbiBUc2VuZyAo5pu+5b+X6LuSKQ==?= <ivan.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

On Thu, Apr 13, 2023 at 7:44=E2=80=AFAM Qun-wei Lin (=E6=9E=97=E7=BE=A4=E5=
=B4=B4)
<Qun-wei.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> On Thu, 2023-03-09 at 09:12 -0600, Rob Herring wrote:
> > On Wed, Mar 8, 2023 at 3:17=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@mediate=
k.com>
> > wrote:
> > >
> > > The overlay fragment is a special case where some properties are
> > > not
> > > present in the overlay source file, but in the base file.
> > >
> > > example:
> > > +-----------------------------+--------------------+
> > > > base.dts                    | overlay.dts        |
> > >
> > > +-----------------------------+--------------------+
> > > > /dts-v1/;                   | /dts-v1/;          |
> > > >                             | /plugin/;          |
> > > > /{                          |                    |
> > > >   parent: test {            | &parent {          |
> > > >     #address-cells =3D <1>;   |   child@0 {        |
> > > >     #size-cells =3D <0>;      |     reg =3D <0x0>;   |
> > > >   };                        |   };               |
> > > > };                          | };                 |
> > >
> > > +-----------------------------+--------------------+
> > >
> > > It will cause the following false alarms when compiling the overlay
> > > dts.
> > >
> > > 1. /fragment@0/__overlay__: Character '_' not recommended in node
> > > name
> > > 2. /fragment@0/__overlay__: Relying on default #address-cells value
> > > 3. /fragment@0/__overlay__: Relying on default #size-cells value
> > > 4. /fragment@0/__overlay__:reg: property has invalid length (4
> > > bytes)
> > >    (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
> > >
> > > This workaround will fix them by skip checking for node named
> > > __overlay__.
> > >
> > > Signed-off-by: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > > V1 -> V2:
> > >  - Add is_overlay_node() helper
> > >  - Skip anything starting with "__" in
> > > check_node_name_chars_strict()
> > >
> > >  checks.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> >
> > Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Though I do wonder if as a matter of policy on overlay structure, if
> > we should require an overlay to have the parent node with
> > #address-cells/#size-cells. In the end that would be duplicated data,
> > but without it there's no way to parse and validate reg/ranges in an
> > unapplied overlay. That's just one example issue in being able to
> > validate overlays.
> >
> > Rob
>
> Hi Rob,
>
> Thank you for your review.
>
> I think I've found another problem:
> +-------------------------+----------------+
> | base.dts                | overlay.dts    |
> +-------------------------+----------------+
> | /dts-v1/;               | /dts-v1/;      |
> | /{                      | /plugin/;      |
> |   #address-cells =3D <1>; |                |
> |   #size-cells =3D <0>;    | &test {        |
> |   test: example@0 {     |   reg =3D <0x1>; |
> |     reg =3D <0x0>;        | };             |
> |   };                    |                |
> | };                      |                |
> +-------------------------+----------------+
>
> The following error message is printed when compiling:
> Warning (reg_format): /fragment@0/__overlay__:reg: property has invalid
> length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
> Warning (unit_address_vs_reg): /fragment@0/__overlay__: node has a reg
> or ranges property, but no unit name
> Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on
> default #address-cells value
> Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on
> default #size-cells value
>
> We can't get the #address-cells/#size-cells of the parent of the
> example node in the overlay structure.
> Do you think we should change it to is_overlay_node(node) instead of
> is_overlay_node(node->parent)?
> Or we just need to skip checking for node names starting with "__" in
> check_node_name_chars_strict()?

I think this is the tip of the iceberg in terms of being able to
validate overlays. Turning off address checks just kicks the problem
to schema validation.  Perhaps the overlay should be structured to
include the parent bus node with #address-cells and #size-cells.

Rob
