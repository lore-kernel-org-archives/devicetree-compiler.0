From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 09/13] libfdt: Add fdt_getprop_namelen_w
Date: Mon, 11 Jul 2016 09:12:27 +0200
Message-ID: <20160711071227.GE4589@lukather>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
 <20160705082646.25044-10-maxime.ripard@free-electrons.com>
 <20160706012248.GS2251@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1374915085=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20160706012248.GS2251@voom.fritz.box>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alexander Kaplan <alex@nextthing.co>, devicetree-compiler@vger.kernel.org


--===============1374915085==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0H629O+sVkh21xTi"
Content-Disposition: inline


--0H629O+sVkh21xTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2016 at 11:22:48AM +1000, David Gibson wrote:
> On Tue, Jul 05, 2016 at 10:26:42AM +0200, Maxime Ripard wrote:
> > Add a function to retrieve a writeable property only by the first
> > characters of its name.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> This shouldn't be exported, so it should go into libfdt_internal.h.
>=20
> > ---
> >  include/libfdt.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/include/libfdt.h b/include/libfdt.h
> > index f13b01f08f71..a55d2d0d8c7b 100644
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
>=20
> uintptr_t ??

This is defined in the exact same way than fdt_getprop_w. Should I
change that as well?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--0H629O+sVkh21xTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXg0bbAAoJEBx+YmzsjxAgSC4P/j+YTEq2uwYhjzReC9P1m8du
B/2dVj8z34hNvZ6/ZIJtW31eRj8tOGsN1yA/PWSr/jwN2lAvwuE1sXY7ZLh92ZsZ
a5aaqq0Bw8c3OAtd2PUianrpk22Yihymq9jqxRGmZjwnPlU4Bl+NFBlHtYU9qyh2
mnPKe8eh5psuGyh1MvwIApNJfkrTVZSlEHc7NqZ16PVKpMWMTDP2847uusHnF1RB
TpMnGmQ3etpPUGzxLPCeyQ9ESolQ91lq+XYrJx9CRukgCFMrzWsDFRTnF0YR3dhr
NukClTjQMqHBT3ilTYVfI31ot8oK09ZRDA0ZoKfXeFYq7k7w8/J0bf2RluM+9KFX
JF+M3l++MxKEFTwvzbWoICeTI5KArOQvwykTPofbX6Da1aOzKBjziXP5leko+jZt
2F4RMX6Mhu8oMDWcH4rI3QCw9K7+KclA3HaMxvHktTFUq+/GNJp9t3lO8PtTxp98
e/8NImuPclC+I97lVioqD21kKakrj4lf3VZ2CUFD/Cxaap1n/emSuJQI7mCGgOEr
um4xJ6yyhAFUPOlHbz1FsfdgApKcZ7KIYZBJQEgMAlr3gg2a5ieLLdWJbNjSadGe
Tfn5g7dXBT7gvRcGZfj9KIkL+sO3J1ljxVP6CKCrascGntzoubmeNC4FSRoJDBwr
jfppGvkJ300f0MHmn0lq
=Ax9n
-----END PGP SIGNATURE-----

--0H629O+sVkh21xTi--

--===============1374915085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============1374915085==--
