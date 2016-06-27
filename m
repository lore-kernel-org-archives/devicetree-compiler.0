From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 09/12] libfdt: Add fdt_getprop_namelen_w
Date: Mon, 27 Jun 2016 09:29:32 +0200
Message-ID: <20160627072932.GR4000@lukather>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-10-maxime.ripard@free-electrons.com>
 <20160626154929.GT15625@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hCenlVgnDQUGHXTR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160626154929.GT15625-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--hCenlVgnDQUGHXTR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 01:49:29AM +1000, David Gibson wrote:
> On Fri, Jun 24, 2016 at 04:27:54PM +0200, Maxime Ripard wrote:
> > Add a function to retrieve a writeable property only by the first
> > characters of its name.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  include/libfdt.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/include/libfdt.h b/include/libfdt.h
> > index dbe8a0efca87..b8758de3ae54 100644
> > --- a/include/libfdt.h
> > +++ b/include/libfdt.h
> > @@ -619,6 +619,13 @@ const void *fdt_getprop_by_offset(const void *fdt,=
 int offset,
> >   */
> >  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
> >  				const char *name, int namelen, int *lenp);
> > +static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
> > +					  const char *name, int namelen,
> > +					  int *lenp)
> > +{
> > +	return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, name,
> > +						      namelen, lenp);
> > +}
>=20
> I believe you used this in your new setprop_inpace implementation.  So
> the series needs to be re-ordered to avoid breaking bisection.

You're right, sorry for that.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--hCenlVgnDQUGHXTR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcNXcAAoJEBx+YmzsjxAgMCYP/RP1g1hV9ZASIYdmwBWTci3T
byCGOd9CAWtAzwezSC3WMPF7htP6N6XyvuQ8rESrONM+nrOwOQOHmvSfqJe40dcr
nIMHyuGbMel8LJ/9kzeTDdHo6FYeEjt0qF2G7P5HQcVtH+lWwFSajdRSUE35P/zK
hdtgWmthTk6TcN6ECli3faEEylJdVytXbytwNR0c4Kd2j4PeCb7/un9zLkS6pgNS
M8qMk+/SSc9XRwViPHlijjzLutmuHCom4junxPlGjK+1bJh55xVbEQqPklCkta69
0FHP4iBfWdpN6GekhPXa6mTF3HZ3XzHI1bdzsYT116B3dRzQ4b4P8pRYFk2gHkWZ
z/T/r1+kU+kxeFXKQkm/t8MEPIdmpcYuJEY2bCP00U4jENNj7yIBFOLoDus4S3Mg
KvN7esjZ6YorAxiy5TOGWvmpyi3hnrjKJqbuTEqMRb53DI0nWOEh0Mbm3XJeOcU1
cQvrKdDRO4cWUdyfO0GVhOZx19vcML/oGShRCIvQptDWXIzcdP06JW7J8pF9Jgy5
UaF+0D6obBOJbVjdtTccVR5gmmVVOjOO576KTJUYQZY/umFJKq+k/KmXV1T0HDKj
QOyJOR4KK5P0em07qRQIGcBCEa6/QRd4NHJNjQeyAOgEzfMONQmHI3+gJBgTwp98
ST1i3zB5i/TPSbBqR3Ag
=bssE
-----END PGP SIGNATURE-----

--hCenlVgnDQUGHXTR--
