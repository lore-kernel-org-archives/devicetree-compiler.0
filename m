From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 7/9] libfdt: Add overlay application function
Date: Wed, 15 Jun 2016 20:19:35 +1000
Message-ID: <20160615101935.GA16563@voom.fritz.box>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-8-git-send-email-maxime.ripard@free-electrons.com>
 <34997AD3-B621-4823-920E-22E4A6F0E0D1@konsulko.com>
 <20160614002550.GA4882@voom.fritz.box>
 <F0B62E6A-D5CE-4505-BC19-5EAB72A33ADE@konsulko.com>
 <20160615031402.GF4882@voom.fritz.box>
 <7E8A7CBD-D682-45E5-AD2C-19F137E5ED38@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465986061;
	bh=T8qOA14Cz7nvVzFjb3DyIVkLzEQZQmKGvEe1r4h0h44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyw9Ddnej+ZSXAnj7twOvSqMblY9FuCC/b8moI0/oF6ALc81JO6k4JFmUcV9DJuds
	 3BpAAR4keB0D7Pjsy9l107HGy/dLHQXPic2ZI4BPZMj1QLyFSxlcUElmzxKdb6km/t
	 wj9Hz67HzXNgvvLWUVXO4gStRvOEH/NLwAqXLVzo=
Content-Disposition: inline
In-Reply-To: <7E8A7CBD-D682-45E5-AD2C-19F137E5ED38-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 12:34:00PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On Jun 15, 2016, at 06:14 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >=20
> > On Tue, Jun 14, 2016 at 12:22:23PM +0300, Pantelis Antoniou wrote:
> >> Hi David,
> >>> On Jun 14, 2016, at 03:25 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org=
> wrote:
> >>> On Fri, Jun 10, 2016 at 05:28:11PM +0300, Pantelis Antoniou wrote:
> > [snip]
> >>>>> +static int fdt_overlay_merge(void *dt, void *dto)
> >>>>> +{
> >>>>> +	int root, fragment;
> >>>>> +
> >>>>> +	root =3D fdt_path_offset(dto, "/");
> >>>>> +	if (root < 0)
> >>>>> +		return root;
> >>>>> +
> >>>>> +	fdt_for_each_subnode(dto, fragment, root) {
> >>>>> +		const char *name =3D fdt_get_name(dto, fragment, NULL);
> >>>>> +		uint32_t target;
> >>>>> +		int overlay;
> >>>>> +		int ret;
> >>>>> +
> >>>>> +		if (strncmp(name, "fragment", 8))
> >>>>> +			continue;
> >>>>> +
> >>>>=20
> >>>> This is incorrect. The use of =E2=80=9Cfragment=E2=80=9D is a conven=
tion only.
> >>>> The real test whether the node is an overlay fragment is that
> >>>> it contains a target property.
> >>>=20
> >>> Hmm.. I dislike that approach.  First, it means that if new target
> >>> types are introduced in future, older code is likely to silently
> >>> ignore such fragments instead of realizing that it doesn't know how to
> >>> apply themm.  Second, it raises weird issues if some node down within
> >>> a fragment also happens to have a property called "target=E2=80=9D.
> >>=20
> >> Not really. If new targets are introduced then the fragment will be ig=
nored.
> >=20
> > Yes.. and that's bad.
>=20
> That=E2=80=99s arguable.

!?!  No, really, silent partial application is just horrible.

> >> We can have an argument about what is better to do (report an error or=
=20
> >> ignore a fragment) but what it comes down to is that that applicator
> >> does not know how to handle the new target method.
> >=20
> > Sure, let's have the argument.  The overlay is constructed on the
> > assumption that all the pieces will be applied, or none of them.  A
> > silent, partial application is an awful, awful failure mode.  We
> > absolutely should report an error, and in order to do so we need to
> > know what are applicable fragments, whether or not we understand the
> > target designation (or any other meta-data the fragment has).
>=20
> This way also allows having nodes being something other than fragments.
>=20
> So instead of being painted into a corner (all subnodes that are not
> named =E2=80=98fragment@X=E2=80=99 are errors), we have flexibility in in=
troducing
> nodes that contain configuration data for the loader.

There's no significant difference between the approaches from this
point of view.  Metadata nodes are certainly possible (we already have
__symbols__ and __fixups__) but calling them something other than
fragment@ is no harder than leaving off the target property.  In fact
even if it was workable, calling new metadata nodes fragment@ would be
stupidly confusing.

> > Given what's established so far, checking the name seems the obvious
> > way to do that.
> >=20
>=20
> Again, it=E2=80=99s arguable. Stricter checking against future-proofing.
>=20
> >> There is no issues with any target properties inside a fragment because
> >> the check is not made recursively.
> >=20
> > Ok, so the real test you're proposing is "at the top level AND has a
> > target property=E2=80=9D.
>=20
> Yes

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYSu3AAoJEGw4ysog2bOSsnMQAItF/QHuQNArLD0R7e5jgPBA
kF75qu8ulVrFBwFDbee7QskCcvHy+uNT9Ns4K/thxTChsPA39W1T6yP1M9AT9fae
FSzirjDkppl7wED7rWESTphjLgczGssu7fiF9A5WLc/omXQ2OAl83y2BhjBUP2nH
D2r0hchV8cuMRRj6vFiEkwPhE8Tbr4CE60fWfZ8sRPOcXI25hiZfk9F51aQbHb+2
bc2NxYVCDrA1STz3QWMc7vhCa8+9sDqKnxrn3FOpDizgl3Wbz0FJIkz3H+pvlGmS
r3W0BJG4zZpMeVuSibxcBek/P+GZOYtA3ZfULSGRPWjJgzvTt0brvUnQpx6CSxEf
rDNfBYdjd9xO6/2c+bnRpmwUdOg9H8v360gz1/PH0dvfCg9tgOu3t2RYdpT4EYrW
RyASw87MsnZhnu2U/cJP81lNYWBD7CCa9lguJ22G2e7HTWfyXIqYof7YlUnl6FPN
rktzzZvRRctb4HTP2/C3qDh+MNDeKBISE24IqpHcQNSVVMW/z5+aldITXDfsenR9
a2aF9atYjFzJuaq5iGlgBQh0M7EIEC0i9zIg5uotvFiy4mfgi4tl0c5xbMJ16Ca8
AQXv0xYnWe6k4Ov/spFJird/A3TYFsbdHeJBNBTkBoLHBy1CAmV2HIKVUfmh1Ksi
34Tnh/4X5hl24X8hr387
=xoVQ
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
