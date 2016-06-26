From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 09/12] libfdt: Add fdt_getprop_namelen_w
Date: Sun, 26 Jun 2016 10:11:56 +0200
Message-ID: <20160626081156.GJ4000@lukather>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-10-maxime.ripard@free-electrons.com>
 <CAPnjgZ32sm6PHXYHmqrb59XM1NiNeF5+4V-V35hn=YSmLjNMtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="enLffk0M6cffIOOh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ32sm6PHXYHmqrb59XM1NiNeF5+4V-V35hn=YSmLjNMtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--enLffk0M6cffIOOh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Sat, Jun 25, 2016 at 08:53:55PM -0600, Simon Glass wrote:
> Hi Maxime,
>=20
> On 24 June 2016 at 08:27, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Add a function to retrieve a writeable property only by the first
> > characters of its name.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  include/libfdt.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/include/libfdt.h b/include/libfdt.h
> > index dbe8a0efca87..b8758de3ae54 100644
> > --- a/include/libfdt.h
> > +++ b/include/libfdt.h
> > @@ -619,6 +619,13 @@ const void *fdt_getprop_by_offset(const void *fdt,=
 int offset,
> >   */
> >  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
> >                                 const char *name, int namelen, int *len=
p);
> > +static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
> > +                                         const char *name, int namelen,
> > +                                         int *lenp)
> > +{
> > +       return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, =
name,
> > +                                                     namelen, lenp);
>=20
> What are the casts for?

This is modelled after the already existing fdt_getprop_w.

The casts just remove the const qualifier in fdt_getprop return value
so that you can modify it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--enLffk0M6cffIOOh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXb45MAAoJEBx+YmzsjxAgZ4MP/2Y4kFvx3aw+C57LJBTRBVEV
C8wiHIFczoKZyxcXMk6/FA2LCrzkWVCjFZXotdZh9/ZhvnEQg5kDiTsjezpQvHdh
VxIsVHMMneyGhNhJyJGd3mfQfpbLF03lAsn8Qy1Hl9fpYLxMv4o1vJlxQFax0+PD
yO+5AJNAaQj9jghAe9g1WhYHNzxlwch2GfLeugvhsV6Owf0rGjhisXoeQ+Ypx7J3
v6/qwtkDYS24HcToqDpgUA7wQR/DYJTF5eqnJwXekopsYpXROF4WJFDRZpXxVGXt
FYXwDWwrvs01KYg/3JWBHen9mMfDWKkFbUrs7xx2NctySMwKfOrtXpUVL2N0cjfq
IlLs0AgqyzBbnOupkxHFF0LKPgwYtNJLJilkt4UwfpK+0Jdyuhe54pu/I64htYF0
r7dZue+4hFk89178cKncrbxiOTQKb2UWES0vvAZL6OJOV27n6BK/RMKTSXpQKQ5T
tj4hnWBDlBhmsa1jz50+Jx+7l8Of248pJiXgshlWihF0vHg312fzU0o4Evnq21Kj
GPanY9QiYqlfBIIPBv5/PTlxIAmrihoyaMRuNfhnSVgPw/LQ4cTppbikvmnD+cVi
Pk5nchP1N1qQnxWxbx2YrqEW2n9stAdiGNvCC+y7se1rMPU16Fxs1Dm09uK3lKPQ
jXNUHW6QzAutiztL35m+
=5gXZ
-----END PGP SIGNATURE-----

--enLffk0M6cffIOOh--
