From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 10/12] libfdt: Add overlay application function
Date: Mon, 27 Jun 2016 09:13:16 +0200
Message-ID: <20160627071316.GP4000@lukather>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-11-maxime.ripard@free-electrons.com>
 <CAPnjgZ0dg-CX0XAxCirB-xLO2Jf_Q9T7rc5vu2qznDkYwA54ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HrsILUyxNtiOryfc"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0dg-CX0XAxCirB-xLO2Jf_Q9T7rc5vu2qznDkYwA54ew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--HrsILUyxNtiOryfc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Sat, Jun 25, 2016 at 08:53:58PM -0600, Simon Glass wrote:
> Hi Maxime,
>=20
> On 24 June 2016 at 08:27, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > The device tree overlays are a good way to deal with user-modifyable
> > boards or boards with some kind of an expansion mechanism where we can
> > easily plug new board in (like the BBB, the Raspberry Pi or the CHIP).
> >
> > Add a new function to merge overlays with a base device tree.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  include/libfdt.h         |  30 ++++
> >  lib/Kconfig              |   5 +
> >  lib/libfdt/Makefile      |   2 +
> >  lib/libfdt/fdt_overlay.c | 381 +++++++++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 418 insertions(+)
> >  create mode 100644 lib/libfdt/fdt_overlay.c
> >
>=20
> Is there a change log?

Yes, in the cover letter.

> > +static int overlay_update_local_node_references(void *fdto,
> > +                                               int tree_node,
> > +                                               int fixup_node,
> > +                                               uint32_t delta)
> > +{
>=20
> Please add function comments for all of these.

Ack

> > +static int overlay_update_local_references(void *dto, uint32_t delta)
> > +{
> > +       int fixups;
> > +
> > +       fixups =3D fdt_path_offset(dto, "/__local_fixups__");
> > +       if (fixups < 0) {
> > +               /*
> > +                * There's no local phandles to adjust, bail out
>=20
> On on line:
>=20
> /* There's not local ... */

Ok.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--HrsILUyxNtiOryfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcNIMAAoJEBx+YmzsjxAgg0wP/A2e+WHe+22yi/zd1E/olbuD
UeM+G/HKbFnjdPPjpnWdhXCN00eGR+Nzcu6Gq2g++KLB0QKRY7xvRKOxwYRGd4X6
AcjFBSjacoWUUqiiNlBHhv9f7N6kW0O6yMYx7v9e2xyPAr/sROiFxu55hjiI1x6/
WJa29oTLQZm2wdPrwE7iOz9ueOG31/NWYe4WrhVL3+N+RWXWsYnP25deHwpRfy8U
hcDNC0v6g5uklwCduCeGzTJ/ldKYfukenOTRxRLw4YBUOy/cxpVOnWJlJ2aiIFpa
X1WV1hk038fGg2CETkPLoMbFcMKxQj5oIVcKW+b7irjCou4cx2e1oX3axuvTp49T
QegwuvwC3vTSvs3iZtSbLHeJtEGdWZ0R8CJNlboE90T1vzCzk0g9PNzPyA9FQxWq
ZMpsAgS1gm53GLnT3y+KIW4j2scY89+6UD9wqnFUPpw3CQdsoGpdbIKh/wKXsPg4
/3VkQoxMEjEI0RptWgvjcoe98O/oey2M/2eWY10wGB6CJ8NBE5Skg0eB965c4+3j
DOFDBhZ/v2hxIg/S9jkhIjBhCS0Km9lqwovmOCnBKYhF5aNeduC8EGOuUZvPCatk
tQLb1jCrnuH09c5PiLGKo8FqzCtgjUB28euSkccRaKypfgll6oi0C/N9rgVP/MHD
9SYzWYarbPzHxUTFVroQ
=zrPh
-----END PGP SIGNATURE-----

--HrsILUyxNtiOryfc--
