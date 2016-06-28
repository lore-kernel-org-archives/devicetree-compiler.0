From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 07/12] libfdt: Add fdt_setprop_inplace_by_index
Date: Tue, 28 Jun 2016 13:05:57 +1000
Message-ID: <20160628030557.GY4242@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-8-maxime.ripard@free-electrons.com>
 <20160626154510.GR15625@voom.fritz.box>
 <20160627091652.GT4000@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iRaAnoDFBoP0sW/E"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467085574;
	bh=/3FmCmXVmXG1jC+Yc1rRhhfxMV2UYDa65vB1r8c1px8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANp1+d8JyCwqkxQJpMA8v8PVmGzzvOS00Bts2/XI0+HJRf3g+XjShPyBb11SP7wsD
	 A6cNf3TlqjPEMkn31AnlJV+zHs3TMEoPMIG7muCyP6ElzWSDt/yK5YjGuuTMJqV3vl
	 HCmE6yBb/MZjLF0G+l4AbDcTMvl7RjukGnDcCW/8=
Content-Disposition: inline
In-Reply-To: <20160627091652.GT4000@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--iRaAnoDFBoP0sW/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 11:16:52AM +0200, Maxime Ripard wrote:
> On Mon, Jun 27, 2016 at 01:45:11AM +1000, David Gibson wrote:
> > On Fri, Jun 24, 2016 at 04:27:52PM +0200, Maxime Ripard wrote:
> > > Add a function to modify inplace a property starting from a given ind=
ex.
> > >=20
> > > This is especially useful when the property is an array of values, an=
d you
> > > want to update one of them without changing the DT size.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > ---
> > >  include/libfdt.h     | 34 +++++++++++++++++++++++++++++++---
> > >  lib/libfdt/fdt_wip.c | 13 ++++++++-----
> > >  2 files changed, 39 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/include/libfdt.h b/include/libfdt.h
> > > index 4643be5adf39..2c8a42bcb667 100644
> > > --- a/include/libfdt.h
> > > +++ b/include/libfdt.h
> > > @@ -1032,6 +1032,27 @@ int fdt_size_cells(const void *fdt, int nodeof=
fset);
> > >  /* Write-in-place functions                                         =
  */
> > >  /*******************************************************************=
***/
> > > =20
> > > +/**
> > > + * fdt_setprop_inplace_namelen_by_index - change a property's value,
> > > + *                                        but not its size
> > > + * @fdt: pointer to the device tree blob
> > > + * @nodeoffset: offset of the node whose property to change
> > > + * @name: name of the property to change
> > > + * @namelen: number of characters of name to consider
> > > + * @index: index of the property to change in the array
> > > + * @val: pointer to data to replace the property value with
> > > + * @len: length of the property value
> > > + *
> > > + * Identical to fdt_setprop_inplace(), but modifies the given proper=
ty
> > > + * starting from the given index, and using only the first characters
> > > + * of the name. It is useful when you want to manipulate only one va=
lue of
> > > + * an array and you have a string that doesn't end with \0.
> > > + */
> > > +int fdt_setprop_inplace_namelen_by_index(void *fdt, int nodeoffset,
> > > +					 const char *name, int namelen,
> > > +					 uint32_t index, const void *val,
> > > +					 int len);
> >=20
> > This looks like a good addition to upstream, but I don't like the
> > name.  I'd suggest fdt_setprop_inplace_namelen_partial() because it
> > only overwrite part of the existing property value.
>=20
> Ack.
>=20
> > > +
> > >  /**
> > >   * fdt_setprop_inplace - change a property's value, but not its size
> > >   * @fdt: pointer to the device tree blob
> > > @@ -1060,8 +1081,13 @@ int fdt_size_cells(const void *fdt, int nodeof=
fset);
> > >   *	-FDT_ERR_BADSTRUCTURE,
> > >   *	-FDT_ERR_TRUNCATED, standard meanings
> > >   */
> > > -int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
> > > -			const void *val, int len);
> > > +static inline int fdt_setprop_inplace(void *fdt, int nodeoffset,
> > > +				      const char *name, const void *val,
> > > +				      int len)
> > > +{
> > > +	return fdt_setprop_inplace_namelen_by_index(fdt, nodeoffset, name,
> > > +						    strlen(name), 0, val, len);
> >=20
> > This effectively removes the error if len is not equal to the existing
> > property length, so that needs to be put back.
>=20
> So I'm not really sure what you want me to do.
>=20
> I can't check for the property length, since it would prevent that
> function from working, I can't check for the length + index, since we
> might update only a few bytes in the middle, and we want to keep that
> error case.
>=20
> Or should I just forgive about merging the two functions and just
> duplicate the two?

No, what I'm suggesting is that fdt_setprop_inplace(), whether or not
it is implemented using fdt_setprop_inplace_partial() *also* checks
that the existing property length exactly matches the replacement
length, and fails otherwise.

Doing this without too much code duplication might involve a private
internal function, or maybe it's just simpler to duplicate.  But those
are the semantics they should have.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iRaAnoDFBoP0sW/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcemVAAoJEGw4ysog2bOS7XIP/RXQ4HTM38iXzG2q7G7nb03+
zVNyS8T2Zg0lmd3QAZe3aSiHzeVIyAFb7/iRHmhKe6hYxJu5LkwIqlvjsCzg2u68
rY/hzDEwA/l2I7uCi5ebwBaW5sPBFyegzQfHiXbdq6mI0J1nf+bBP24wF3N5oKd4
rtxeNRMhuzvMcsLYk4RJ3RFMfd+Bi8eW9xfUaPnWk6GEIrGt1v3L0fBKiWKRhnCx
jAKntb7wR82/AwEATI4qGWOHB6uIMbkxx7Ka2rvcYIOT8iBHtfSC1OWonzOA2p8e
RQxXAUZsDQ8FV5pdQf6b4mpmZIL03fZDLt8vbVkS6AHq9FPoVYwOpIvQnsIbw/Gn
u/K3gmTvwjumXcoTgxgrmq2IpSM/Mk70KW0yiBSJ2/FGcB/BAiYgvTatdB8CAooL
H8XebkshV+u7oXuxSbWmGjgRU7qpyNW3s3Aex7zBqJFaaDWE3DlZcUen4SxstVYD
coSAyWQztaOAH/a3fn01aYVyRdkiyITuB4QVkF5enXQ1vTeLmojfJpiS1053+UYn
8Y/OjZ+/nwlLjpowFZH5y8dP6B5GWH2CcSMOjNg+Yt7Wg3Gru/2zxjXPFqpYwvhN
uNCybuGTBguDIzSHi4dP8Tn4f8P24V6JnwIKCCwStEGVVaNPnBIWvciQYCrhpcoE
69iSOJflEv5Aj79tKL2f
=UiQp
-----END PGP SIGNATURE-----

--iRaAnoDFBoP0sW/E--
