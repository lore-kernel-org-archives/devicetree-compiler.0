From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] fdt: Add a function to count strings
Date: Thu, 16 Jul 2015 22:29:35 +1000
Message-ID: <20150716122935.GD25179@voom.redhat.com>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
 <1436958839-14793-2-git-send-email-thierry.reding@gmail.com>
 <20150715134130.GA1567@voom.fritz.box>
 <20150716111352.GA4635@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150716111352.GA4635@ulmo>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 01:13:53PM +0200, Thierry Reding wrote:
> On Wed, Jul 15, 2015 at 11:41:30PM +1000, David Gibson wrote:
> > On Wed, Jul 15, 2015 at 01:13:57PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > Given a device tree node and a property name, the fdt_count_strings()
> > > function counts the number of strings found in the property value.
> > >=20
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  libfdt/fdt_ro.c      | 20 ++++++++++++++++
> > >  libfdt/libfdt.h      |  9 ++++++++
> > >  tests/.gitignore     |  1 +
> > >  tests/Makefile.tests |  1 +
> > >  tests/run_tests.sh   |  3 +++
> > >  tests/strings.c      | 64 ++++++++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  tests/strings.dts    | 10 ++++++++
> > >  7 files changed, 108 insertions(+)
> > >  create mode 100644 tests/strings.c
> > >  create mode 100644 tests/strings.dts
> > >=20
> > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > index a65e4b5b72b6..874975a0d8ad 100644
> > > --- a/libfdt/fdt_ro.c
> > > +++ b/libfdt/fdt_ro.c
> > > @@ -538,6 +538,26 @@ int fdt_stringlist_contains(const char *strlist,=
 int listlen, const char *str)
> > >  	return 0;
> > >  }
> > > =20
> > > +int fdt_count_strings(const void *fdt, int nodeoffset, const char *p=
roperty)
> > > +{
> > > +	int length, i, count =3D 0;
> > > +	const char *list;
> > > +
> > > +	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
> > > +	if (!list)
> > > +		return -length;
> > > +
> > > +	for (i =3D 0; i < length; i++) {
> > > +		int len =3D strlen(list);
> >=20
> > I like the concept of these patches, but this implementation is unsafe
> > if the given property does not, in fact, contain a list of \0
> > terminated strings.
>=20
> This should be fixed in v2 of the patches. This isn't quite as simple as
> using strnlen() instead of strlen() because it also means we need extra
> handling for the case where a NUL byte isn't found within the value.

Yes, I suspect it will actually be easier to use memchr().

> There is also a bit of an inconsistency for the fdt_find_string() and
> fdt_get_string() functions because they can successfully work with non-
> NUL-terminated values. I've gone into some detail about that in the v2
> cover letter, so feedback there would be most welcome.
>=20
> Thierry



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVp6OvAAoJEGw4ysog2bOS4GUQANdL/cE5BqaqfTGBWkE3XIAX
ETbOY0qMUWPNSRdHuzRS22CI4wetq1fy/da7Pcvf//076tmpOaCmzrSCl6geja7r
G3pHQDSRdkiwWju+VfpH1m+bdi+Tw1Xd18LQXLLBq0oOnCR6KXJo9qzaajW2TRle
Gk2bCTns7EYAxTe9J+TDpacUqFeidcHta7rbktlz3Z45gvmunkq10EF6CvHi6ZDf
53JRJ40DkhtEjcWhQmZRXpZ2f/d8Mjh3WVaxD6jIOUYybfZDY4YQ+vJjDR2D6vkh
kTY/Huh9y+Dau9oMNMpgTYPwcejbPSZT0F26fdPpAhC9g6DzgCOLwNDPdpUOFXrX
HMzg/iICC3sjh/T9nLqyDcywV2CV4VgADSZy5YEGrMKV//ns/mUOX9f8UFrX0z2i
iHqBIVVF7tm1clP1v8KLoEM0L+n858/turgTYFBV0KLCbieP2YlYLSp6dHfLVgxz
xntY80XacqlTvXT6X7K5lu9W/Q24hWzqUnZgbLn2I/DJs6EStUPdBb7PqTsdawgg
uXfBgtSeZbDMPa+riir0lfRsFT/DB9Qt98iKHcObMjRzHhmc+jTSYIDaT0MkfD0g
FtttKqmXehrLXkv4HO+4tzV9yE7Dr6xXaWAjodBD3TzuLmMy4pAB0chGFohWiUje
OdHokv07FPJ53ekLFmcj
=EQ6h
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--
