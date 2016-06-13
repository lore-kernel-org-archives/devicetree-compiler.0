From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 7/9] libfdt: Add overlay application function
Date: Mon, 13 Jun 2016 11:51:50 +0200
Message-ID: <20160613095150.GG4481@lukather>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-8-git-send-email-maxime.ripard@free-electrons.com>
 <34997AD3-B621-4823-920E-22E4A6F0E0D1@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cp3Cp8fzgozWLBWL"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <34997AD3-B621-4823-920E-22E4A6F0E0D1-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--Cp3Cp8fzgozWLBWL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pantelis,

On Fri, Jun 10, 2016 at 05:28:11PM +0300, Pantelis Antoniou wrote:
> Hi Maxime,
>=20
> > On May 27, 2016, at 12:13 , Maxime Ripard <maxime.ripard@free-electrons=
=2Ecom> wrote:
> >=20
> > The device tree overlays are a good way to deal with user-modifyable
> > boards or boards with some kind of an expansion mechanism where we can
> > easily plug new board in (like the BBB, the Raspberry Pi or the CHIP).
> >=20
> > Add a new function to merge overlays with a base device tree.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> > include/libfdt.h         |  30 ++++
> > lib/libfdt/Makefile      |   2 +-
> > lib/libfdt/fdt_overlay.c | 414 ++++++++++++++++++++++++++++++++++++++++=
+++++++
> > 3 files changed, 445 insertions(+), 1 deletion(-)
> > create mode 100644 lib/libfdt/fdt_overlay.c
> >=20
> > diff --git a/include/libfdt.h b/include/libfdt.h
> > index 1e01b2c7ebdf..783067e841a1 100644
> > --- a/include/libfdt.h
> > +++ b/include/libfdt.h
> > @@ -1698,6 +1698,36 @@ int fdt_add_subnode(void *fdt, int parentoffset,=
 const char *name);
> >  */
> > int fdt_del_node(void *fdt, int nodeoffset);
> >=20
> > +/**
> > + * fdt_overlay_apply - Applies a DT overlay on a base DT
> > + * @fdt: pointer to the base device tree blob
> > + * @fdto: pointer to the device tree overlay blob
> > + *
> > + * fdt_overlay_apply() will apply the given device tree overlay on the
> > + * given base device tree.
> > + *
> > + * Expect the base device tree to be modified, even if the function
> > + * returns an error.
> > + *
>=20
> If the base tree has been modified on an error it is unsafe to use it
> for booting. A valid strategy would be to scribble over the DT magic
> number so that that blob is invalidated.
>=20
> What are the other people=E2=80=99s opinion on this?

That would probably be safer yes, I'll change that.

> > +static int fdt_overlay_get_target(const void *fdt, const void *fdto,
> > +				  int fragment)
> > +{
> > +	uint32_t phandle;
> > +	const char *path;
> > +
> > +	/* Try first to do a phandle based lookup */
> > +	phandle =3D fdt_overlay_get_target_phandle(fdto, fragment);
> > +	if (phandle)
> > +		return fdt_node_offset_by_phandle(fdt, phandle);
> > +
> > +	/* And then a path based lookup */
> > +	path =3D fdt_getprop(fdto, fragment, "target-path", NULL);
> > +	if (!path)
> > +		return -FDT_ERR_NOTFOUND;
> > +
> > +	return fdt_path_offset(fdt, path);
> > +}
> > +
>=20
> Those targets are fine; beware there are patches with more target options.

Ack.

> > +static int fdt_overlay_merge(void *dt, void *dto)
> > +{
> > +	int root, fragment;
> > +
> > +	root =3D fdt_path_offset(dto, "/");
> > +	if (root < 0)
> > +		return root;
> > +
> > +	fdt_for_each_subnode(dto, fragment, root) {
> > +		const char *name =3D fdt_get_name(dto, fragment, NULL);
> > +		uint32_t target;
> > +		int overlay;
> > +		int ret;
> > +
> > +		if (strncmp(name, "fragment", 8))
> > +			continue;
> > +
>=20
> This is incorrect. The use of =E2=80=9Cfragment=E2=80=9D is a convention =
only.
> The real test whether the node is an overlay fragment is that
> it contains a target property.
>=20
> > +		target =3D fdt_overlay_get_target(dt, dto, fragment);
> > +		if (target < 0)
> > +			return target;
> > +
>=20
> So you could do =E2=80=98if (target < 0) continue;=E2=80=99 or handle a m=
ore complex error code.

Ok, will change.

> I would caution against the liberal use of malloc in libfdt. We=E2=80=99re
> possibly running in a constrained environment; a custom extents
> based (non freeing) allocator should be better.

David had the same comments, and I will drop the mallocs entirely.

> We need some figures about memory consumption when this is enabled,
> and a CONFIG option to disable it.

The current code (before and after that patch) adds 18kB to a
sandbox_defconfig.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Cp3Cp8fzgozWLBWL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXoI2AAoJEBx+YmzsjxAg1KYP/1+m4Y3DFyleXPO+e1VFtKOU
YZfJZTl3uloIICIWEZT14vqsp6dkRkcSuJesqz2xTdofMtm1Q+3qYjzQDf36rSTi
WnfNh9uXcgdnILM+7WEdEQOPjRTcd/81Br4nugJM4Di2NHkzLg0FvjONAv2v2gwk
uDgKe2XuA8Qyn6gxH6bc/9NAHeJwHI4efXEO/lhq9bcRbTwcZeBT590W11WAVyZC
bGj9gpL6cUONY2+YYvN41pu29Bs/az8B2ig/pw/vUmPLIJbVUEO84Tk2pieUVJ55
l6iIMQQk2wkIVl21joa0nkypFB/HbPgqO5ncUWd59r2OYaM65gfItpGVjdQdZrSe
w0kxdpBFeARQQdJb4zzFBv0qtEZzUmk0oG2HSYT9TkKoAvGbOqEeDRHPbhioIHR/
t3b0WAwgswV4KDmZgC7uNMH5rFiAZdXVErvur5bk32HfNhLWW7MIUe4yuJAQhDsd
f6Q/J2CmGK46Y5KLreZdOskYwQvLF2oGBm0QlEoBQYzP4f5uYRPSxj0VNuev7Hur
xPGwdO9veBZeio0gSbo9BIjt9GH5NYS4hs/aLBwGPQYHSwwexXVdjkb43CRNRj8e
jmdf4LvMS762QeMg/59Sd3mu7It+UWoaMsMJyvzr/HXNezCfZITSroASDKzJn0Bg
9JOOfW8xs/c7eUAwGvsB
=fGTd
-----END PGP SIGNATURE-----

--Cp3Cp8fzgozWLBWL--
