From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 07/12] libfdt: Add fdt_setprop_inplace_by_index
Date: Mon, 27 Jun 2016 11:16:52 +0200
Message-ID: <20160627091652.GT4000@lukather>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-8-maxime.ripard@free-electrons.com>
 <20160626154510.GR15625@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BVQ1RKc6+nLPB5pT"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160626154510.GR15625-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--BVQ1RKc6+nLPB5pT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 01:45:11AM +1000, David Gibson wrote:
> On Fri, Jun 24, 2016 at 04:27:52PM +0200, Maxime Ripard wrote:
> > Add a function to modify inplace a property starting from a given index.
> >=20
> > This is especially useful when the property is an array of values, and =
you
> > want to update one of them without changing the DT size.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  include/libfdt.h     | 34 +++++++++++++++++++++++++++++++---
> >  lib/libfdt/fdt_wip.c | 13 ++++++++-----
> >  2 files changed, 39 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/include/libfdt.h b/include/libfdt.h
> > index 4643be5adf39..2c8a42bcb667 100644
> > --- a/include/libfdt.h
> > +++ b/include/libfdt.h
> > @@ -1032,6 +1032,27 @@ int fdt_size_cells(const void *fdt, int nodeoffs=
et);
> >  /* Write-in-place functions                                           =
*/
> >  /*********************************************************************=
*/
> > =20
> > +/**
> > + * fdt_setprop_inplace_namelen_by_index - change a property's value,
> > + *                                        but not its size
> > + * @fdt: pointer to the device tree blob
> > + * @nodeoffset: offset of the node whose property to change
> > + * @name: name of the property to change
> > + * @namelen: number of characters of name to consider
> > + * @index: index of the property to change in the array
> > + * @val: pointer to data to replace the property value with
> > + * @len: length of the property value
> > + *
> > + * Identical to fdt_setprop_inplace(), but modifies the given property
> > + * starting from the given index, and using only the first characters
> > + * of the name. It is useful when you want to manipulate only one valu=
e of
> > + * an array and you have a string that doesn't end with \0.
> > + */
> > +int fdt_setprop_inplace_namelen_by_index(void *fdt, int nodeoffset,
> > +					 const char *name, int namelen,
> > +					 uint32_t index, const void *val,
> > +					 int len);
>=20
> This looks like a good addition to upstream, but I don't like the
> name.  I'd suggest fdt_setprop_inplace_namelen_partial() because it
> only overwrite part of the existing property value.

Ack.

> > +
> >  /**
> >   * fdt_setprop_inplace - change a property's value, but not its size
> >   * @fdt: pointer to the device tree blob
> > @@ -1060,8 +1081,13 @@ int fdt_size_cells(const void *fdt, int nodeoffs=
et);
> >   *	-FDT_ERR_BADSTRUCTURE,
> >   *	-FDT_ERR_TRUNCATED, standard meanings
> >   */
> > -int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
> > -			const void *val, int len);
> > +static inline int fdt_setprop_inplace(void *fdt, int nodeoffset,
> > +				      const char *name, const void *val,
> > +				      int len)
> > +{
> > +	return fdt_setprop_inplace_namelen_by_index(fdt, nodeoffset, name,
> > +						    strlen(name), 0, val, len);
>=20
> This effectively removes the error if len is not equal to the existing
> property length, so that needs to be put back.

So I'm not really sure what you want me to do.

I can't check for the property length, since it would prevent that
function from working, I can't check for the length + index, since we
might update only a few bytes in the middle, and we want to keep that
error case.

Or should I just forgive about merging the two functions and just
duplicate the two?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--BVQ1RKc6+nLPB5pT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcO8EAAoJEBx+YmzsjxAgQaAQALqlGAMbXe9P4XHQ2dMIv9mF
yw/rRBIsZv8+Ast0zzzkNXg6SiKqDcD4pGpWexaZELQtAKz6QQOFk5H90PPVcM2T
XF88+n6F9ltSZpIU2uNOdHpitCqjnBN3W+6By7wGDlsN/UpYF6qp/psjFFxzlU2Y
QNUEy33WK4ZPJDgqZlBUDSVreg1xwdYgynGd248xg1VTwLOSi7xAhwXLo69HKE1R
FVdjjFyq3Bm8MWNox/gBgv2PIXjjwymLdmLGgHHVus4ENhR2ALCLTGbpkfnXtckj
kyHadYrmffRVSen2KZOu5CCRLX7wQhxubZCppVPJAJEpCiM7PRQRI6fsGZAcTlfn
VJPjn9Wg1Zlrfy+AJBb1RyNyjIxlWaX3+t5xzBtGO5nlumK/x5A+Tpi2/99Zx9xs
hTLgcEtpTAY3yF3cSUJ7UeXRHr08eBjXhb4JotzVIMB1SC0lwQ9zy2OsVXvJ9qXg
e3mSoQqD52+tuZHtU/n6TkATXmIK91rNTvsFcv/GTor6Lvsokm/EOe41PdWHoC5y
ZK/ylwRvPmxdoeCQn109jn/5XtA/m/N2cZWHPoIoupc6Ss26BwKtG2buqqYLfYij
XF/VD7ISobW5p6sTebgv3Q5QXbct0+sZ1EXeF1n/K/TkooS0nhrkSkNaB4EmYijo
flbtIIEjnF6nlo1xwprc
=b1Ej
-----END PGP SIGNATURE-----

--BVQ1RKc6+nLPB5pT--
