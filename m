From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 09/13] libfdt: Add fdt_getprop_namelen_w
Date: Tue, 12 Jul 2016 15:10:17 +1000
Message-ID: <20160712051017.GV16355@voom.fritz.box>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
 <20160705082646.25044-10-maxime.ripard@free-electrons.com>
 <20160706012248.GS2251@voom.fritz.box>
 <20160711071227.GE4589@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qRqofxetdBO9L27H"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468300217;
	bh=69sr4WHABFZN6+hspcb4gtzrf6it4BfP5C1+A3JfHtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxaCarVeUS6hbp7laEDgnVcyPOMZsVFb9QxfpRAnuYJgsbo39mcA9KB21I8sQHciV
	 RHQOslDKzpgJzW62Xr9zVn9CUAcd7Scp7mKD7r58Nm+Eq2YI/1UEkdGZfruP5QwyPD
	 ItbJRXjk3iMpbLujd8sOFSzEVQJi6N9bQDI7eyCI=
Content-Disposition: inline
In-Reply-To: <20160711071227.GE4589@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--qRqofxetdBO9L27H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 09:12:27AM +0200, Maxime Ripard wrote:
> On Wed, Jul 06, 2016 at 11:22:48AM +1000, David Gibson wrote:
> > On Tue, Jul 05, 2016 at 10:26:42AM +0200, Maxime Ripard wrote:
> > > Add a function to retrieve a writeable property only by the first
> > > characters of its name.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >=20
> > This shouldn't be exported, so it should go into libfdt_internal.h.
> >=20
> > > ---
> > >  include/libfdt.h | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/include/libfdt.h b/include/libfdt.h
> > > index f13b01f08f71..a55d2d0d8c7b 100644
> > > --- a/include/libfdt.h
> > > +++ b/include/libfdt.h
> > > @@ -619,6 +619,13 @@ const void *fdt_getprop_by_offset(const void *fd=
t, int offset,
> > >   */
> > >  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
> > >  				const char *name, int namelen, int *lenp);
> > > +static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
> > > +					  const char *name, int namelen,
> > > +					  int *lenp)
> > > +{
> > > +	return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, name,
> > > +						      namelen, lenp);
> >=20
> > uintptr_t ??
>=20
> This is defined in the exact same way than fdt_getprop_w. Should I
> change that as well?

Good point.  I wonder why I did that in the first place.  I suspect it
was to stop sparse whinging about the removed const.  It's ok for now,
we can clean both up later if we get a better idea.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qRqofxetdBO9L27H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhHu5AAoJEGw4ysog2bOS6JQP/0+IaDOT3nyyC/9RV0iilJ5j
dWK0pdj32VQkwEc0WiLek+n3lC0rfvZug81TC03tMuXl1rgj260/9m3dnUb3Nq61
W/JY/lsTytctjUzxF6+W4dxVus0Rr/p/Q/xR36wEkJnYVtRTBkO8NcZRTOvjXFPr
FNHwszJMAmbKklMmkV1FwlqfVF9yKQpRrW5NDLAArr4Sah19+MGNO201ltLdFq8H
ORzOhIag84zvkfi46kdV0E9NAnQDPhiaNjTwBRc7L7RKq/C5EaOf9vVExNvorgk/
upKfC/otrhDk/J2ViWEyJLEAtEA1eOV1/YNfswZJLpTkChcLuLdCrOhHJDwNt3yZ
E6mQ29z3dyfN0Zyy4s9tGjwSPFGcNXINkUCCDTmNZcp70gmrwMZShSUj8rbfQPTp
GdfpReL7AdY7s9jTyT3+/OWQMzsfKjPStLklhk0qSyVk59dQvNFbW+dZjEKZ2qou
EKbO8jAj5JfNNAZ67fRZ03SHcMUg4ktTmJM8E+iL5ceXxiVY0sWYRef79uFKgacE
TMRVWVepS3kaeV/Erh2rdzgAhuHYmSUGNNRg/mtufIheHpWGfNm9P+9bJZoesPM2
fBuAS7zIHmfa0sMcFTj4MtQhW6HashIoL3vjQg7feJhX+Uuos3OymJJPCjZ7SggD
hYJzL+o3X8/bcm4kWgoU
=5BXu
-----END PGP SIGNATURE-----

--qRqofxetdBO9L27H--
