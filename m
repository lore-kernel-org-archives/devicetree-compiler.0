From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 5/9] libfdt: Add iterator over properties
Date: Mon, 13 Jun 2016 11:35:35 +0200
Message-ID: <20160613093535.GF4481@lukather>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-6-git-send-email-maxime.ripard@free-electrons.com>
 <73A48AF0-F702-4C43-80A4-A18AC4AD59C6@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iBwuxWUsK/REspAd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <73A48AF0-F702-4C43-80A4-A18AC4AD59C6-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--iBwuxWUsK/REspAd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pantelis,

On Fri, Jun 10, 2016 at 05:04:45PM +0300, Pantelis Antoniou wrote:
>=20
> > On May 27, 2016, at 12:13 , Maxime Ripard <maxime.ripard@free-electrons=
=2Ecom> wrote:
> >=20
> > Implement a macro based on fdt_first_property_offset and
> > fdt_next_property_offset that provides a convenience to iterate over all
> > the properties of a given node.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> > include/libfdt.h | 24 ++++++++++++++++++++++++
> > 1 file changed, 24 insertions(+)
> >=20
> > diff --git a/include/libfdt.h b/include/libfdt.h
> > index 74b1d149c2dd..4e8eb9ede3a4 100644
> > --- a/include/libfdt.h
> > +++ b/include/libfdt.h
> > @@ -441,6 +441,30 @@ int fdt_first_property_offset(const void *fdt, int=
 nodeoffset);
> > int fdt_next_property_offset(const void *fdt, int offset);
> >=20
> > /**
> > + * fdt_for_each_property - iterate over all properties of a node
> > + * @fdt:	FDT blob (const void *)
> > + * @node:	node offset (int)
> > + * @property:	property offset (int)
> > + *
> > + * This is actually a wrapper around a for loop and would be used like=
 so:
> > + *
> > + *	fdt_for_each_property(fdt, node, property) {
> > + *		...
> > + *		use property
> > + *		...
> > + *	}
> > + *
> > + * Note that this is implemented as a macro and property is used as
> > + * iterator in the loop. It should therefore be a locally allocated
> > + * variable. The node variable on the other hand is never modified, so
> > + * it can be constant or even a literal.
> > + */
> > +#define fdt_for_each_property(fdt, node, property)		\
> > +	for (property =3D fdt_first_property_offset(fdt, node);	\
> > +	     property >=3D 0;					\
> > +	     property =3D fdt_next_property_offset(fdt, property))
> > +
> > +/**
> >  * fdt_get_property_by_offset - retrieve the property at a given offset
> >  * @fdt: pointer to the device tree blob
> >  * @offset: offset of the property to retrieve
> > --=20
> > 2.8.2
> >=20
>=20
> Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>=20
> I=E2=80=99d like to see this merged in dtc upstream please too.

This has been sent. David made a couple of comments, I'll address them
and respin.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--iBwuxWUsK/REspAd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXn5nAAoJEBx+YmzsjxAgoD0QALKDP5YIlyDap/oUW/DAwc6x
O62xe2z5hY2s7JXudAwZl3jcep1Yp72FVYeYlUZ2ldzrc6E4zqvd7mhNsuzfUXkM
k26f9U0iVQFvymNOdw33OSid5uk9aGgW8+P27KLHxHxpJFLHNzeI5xBP6CnyiJHv
+FdNIl6Cwrv8AGXFJjQ4kfiBgsYjzHBFBFsC10hHoRhWiVkPzeuZwd8bTqBActoS
kqNjjySy0ABgvxkeHu+1A0K9J0zb3iuxsxVHa+hRiQIwedhbVQI5VvZ/0Zy/iD5Y
dQr7dNBPQLin+rRDQ1w5lV7Fu+xCTLhcfmYpfo08f4fF/Gyb76C6bmCEvsjrZhyF
bH0qVEKeV3tiJQn6h/1L8rBMDSCgrVK80qYPicC4jvZ9ienO339wdeW2nlbI1CZH
j14AKm8KopzXf968cytiHh2tp+DxQBZNEwcuodXItto4gH6R/hoU/bw1rB9u3XFG
avl40hYYEj2N0JxuiHuZZlseU/T7JVYQ1LNTuQ3a974uhV0MDwGskHbQA8IcLDX2
PfGTEKbemFhjKP88MsQZfQ5rZDhPCoiFnMLJaylqD1L35NHsXB/Bj9b2r5pFfpXL
RlpvOtDZZ5YTV48MWW6bIWhpRJUS+dYlLFtOqjqUPiHHDRIXFbmg+bdr4HL6DGVS
/O7rxXHh5+QznwpGG6ZH
=TA8l
-----END PGP SIGNATURE-----

--iBwuxWUsK/REspAd--
