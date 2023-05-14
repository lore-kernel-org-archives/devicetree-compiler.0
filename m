From: "david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] checks: Suppress warnings on overlay fragments
Date: Sun, 14 May 2023 16:42:14 +1000
Message-ID: <ZGCCxgVHQ3wJoXFt@yekko>
References: <20230308091539.11178-1-qun-wei.lin@mediatek.com>
 <CAL_JsqKTM=gaQGZhrBCRkBusYYMci0mJGAFf9RTvCx00G2OJzg@mail.gmail.com>
 <347151917fb777e66a54e983efbbe0303f63e01a.camel@mediatek.com>
 <CAL_Jsq+L50RZ-s55tncFMHA1AwL5An13n2OVPzknnpu=uOvzhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MvDDZLxKKqRekHlp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1684046548;
        bh=keW1cI/5KuHKOnyzeG9xSytZcPqGPbskxRHMIYrusyU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JWyngy3x9YZA8NHqhe2CB+Q2sK67ZZfvYBndsqoTW5rUVnoHy65E3aUDZW2SJpS5Q
         iS/ERdDZ+mD9m/aBpMObIu9hlGrLD4BVVG5JJ9+5eCbQW25zTS0/9SVonQt9J6j0QW
         hbHJrzCGiHjGYDo4MBmN7kH/rdR2a1dk0UiXf0B4=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+L50RZ-s55tncFMHA1AwL5An13n2OVPzknnpu=uOvzhQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Qun-wei Lin =?utf-8?B?KOael+e+pOW0tCk=?= <Qun-wei.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Casper Li =?utf-8?B?KOadjuS4reamrik=?= <casper.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Kuan-Ying Lee =?utf-8?B?KOadjuWGoOepjik=?= <Kuan-Ying.Lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chinwen Chang =?utf-8?B?KOW8temMpuaWhyk=?= <chinwen.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ivan Tseng =?utf-8?B?KOabvuW/l+i7kik=?= <ivan.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>


--MvDDZLxKKqRekHlp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 12:33:26PM -0500, Rob Herring wrote:
> On Thu, Apr 13, 2023 at 7:44=E2=80=AFAM Qun-wei Lin (=E6=9E=97=E7=BE=A4=
=E5=B4=B4)
> <Qun-wei.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >
> > On Thu, 2023-03-09 at 09:12 -0600, Rob Herring wrote:
> > > On Wed, Mar 8, 2023 at 3:17=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@media=
tek.com>
> > > wrote:
> > > >
> > > > The overlay fragment is a special case where some properties are
> > > > not
> > > > present in the overlay source file, but in the base file.
> > > >
> > > > example:
> > > > +-----------------------------+--------------------+
> > > > > base.dts                    | overlay.dts        |
> > > >
> > > > +-----------------------------+--------------------+
> > > > > /dts-v1/;                   | /dts-v1/;          |
> > > > >                             | /plugin/;          |
> > > > > /{                          |                    |
> > > > >   parent: test {            | &parent {          |
> > > > >     #address-cells =3D <1>;   |   child@0 {        |
> > > > >     #size-cells =3D <0>;      |     reg =3D <0x0>;   |
> > > > >   };                        |   };               |
> > > > > };                          | };                 |
> > > >
> > > > +-----------------------------+--------------------+
> > > >
> > > > It will cause the following false alarms when compiling the overlay
> > > > dts.
> > > >
> > > > 1. /fragment@0/__overlay__: Character '_' not recommended in node
> > > > name
> > > > 2. /fragment@0/__overlay__: Relying on default #address-cells value
> > > > 3. /fragment@0/__overlay__: Relying on default #size-cells value
> > > > 4. /fragment@0/__overlay__:reg: property has invalid length (4
> > > > bytes)
> > > >    (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
> > > >
> > > > This workaround will fix them by skip checking for node named
> > > > __overlay__.
> > > >
> > > > Signed-off-by: Qun-Wei Lin <qun-wei.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > > ---
> > > > V1 -> V2:
> > > >  - Add is_overlay_node() helper
> > > >  - Skip anything starting with "__" in
> > > > check_node_name_chars_strict()
> > > >
> > > >  checks.c | 18 ++++++++++++++++++
> > > >  1 file changed, 18 insertions(+)
> > >
> > > Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > >
> > > Though I do wonder if as a matter of policy on overlay structure, if
> > > we should require an overlay to have the parent node with
> > > #address-cells/#size-cells. In the end that would be duplicated data,
> > > but without it there's no way to parse and validate reg/ranges in an
> > > unapplied overlay. That's just one example issue in being able to
> > > validate overlays.
> > >
> > > Rob
> >
> > Hi Rob,
> >
> > Thank you for your review.
> >
> > I think I've found another problem:
> > +-------------------------+----------------+
> > | base.dts                | overlay.dts    |
> > +-------------------------+----------------+
> > | /dts-v1/;               | /dts-v1/;      |
> > | /{                      | /plugin/;      |
> > |   #address-cells =3D <1>; |                |
> > |   #size-cells =3D <0>;    | &test {        |
> > |   test: example@0 {     |   reg =3D <0x1>; |
> > |     reg =3D <0x0>;        | };             |
> > |   };                    |                |
> > | };                      |                |
> > +-------------------------+----------------+
> >
> > The following error message is printed when compiling:
> > Warning (reg_format): /fragment@0/__overlay__:reg: property has invalid
> > length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
> > Warning (unit_address_vs_reg): /fragment@0/__overlay__: node has a reg
> > or ranges property, but no unit name
> > Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on
> > default #address-cells value
> > Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on
> > default #size-cells value
> >
> > We can't get the #address-cells/#size-cells of the parent of the
> > example node in the overlay structure.
> > Do you think we should change it to is_overlay_node(node) instead of
> > is_overlay_node(node->parent)?
> > Or we just need to skip checking for node names starting with "__" in
> > check_node_name_chars_strict()?
>=20
> I think this is the tip of the iceberg in terms of being able to
> validate overlays. Turning off address checks just kicks the problem
> to schema validation.  Perhaps the overlay should be structured to
> include the parent bus node with #address-cells and #size-cells.

Right.  So, I think to handle this properly we need to change the
structure of dtc:

  * Rather than applying source level overlays as we parse them, we
    should parse them each separately into a structure, then
    internally apply them

  * Checks would then need to be divided into those (A) that can be
    checked on any individual overlay fragment, and those (B) that can
    only be checked on a complete tree

  * We'd run the (A) checks before merging the overlays in dtc, and
    the (B) checks only after doing so.

  * For runtime overlays (/plugin/) we'd skip the (B) checks entirely,
    which would accomplish what you're aiming for here.

I had plans to make a restructure like this quite a while ago, but
I've never had the time to go ahead with it.  If you want to give it a
go, that would be great.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MvDDZLxKKqRekHlp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRggrIACgkQzQJF27ox
2Gf2gA//aoQ+ecCa8T6QHnauiHl8b8i607ZseLOEyjqzVWtMRI9gPJKgLOBG6/vd
N5xirRtOSU/bO8dCgOfDHdKGsld5k3xBlYE61iR0dOHkWgqXj7bAOXbZTPkEeWKX
E0eQP9aQweIOLW6RiwTjdlALg1CIzflQNxwtNxu0RGk3o/sSjz7k6bIrhN5jvbYI
duMC1YghMQLz933p5Z9XXJyYmnBK2U+9c9t+SNPYkCnT6aIjIkkqv3s2Vkg66HGV
NNVsbpjbaMfjpAOvAPBwzUqu6czqvms4tzc1wq6x7Oy1jXYRhcPakPC5THerUT5n
GomeZYWaWXSyl6LhP8zjXbsd81hk4Zzk9BopkB14nm/jRPubBWv7D5Nde1ELS8bg
Run4++3Z9RWe45OXrovH/zjBCpMttSGZDnjyKhm1/YEcxtesgFa1xDhN4h52YHLm
8RoqPNVqoGbDLx7TGEt9O2ZVjjaxDE1pwmugHOd0YBCC5TQXZs0AeejJEC0xRsF8
FxOSvRz5IY6WnQQP/S1q0Evyh03wZnBG0akzVT7kRNg9HaLU81DvVULk2x51SwiB
oNuueeRJzyvAItyugWxrLUXd48meg6SzabXfw9O+7W8VpkzFxZgmTi22K79zHSQx
ZlnHjMmHcA309pupKcXUgx6hfF6jnvlNSIbdwiN7yRRARh8EKg4=
=WwYM
-----END PGP SIGNATURE-----

--MvDDZLxKKqRekHlp--
