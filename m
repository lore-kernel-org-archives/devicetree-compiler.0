From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 7/9] libfdt: Add overlay application function
Date: Wed, 15 Jun 2016 13:14:02 +1000
Message-ID: <20160615031402.GF4882@voom.fritz.box>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464340402-2249-8-git-send-email-maxime.ripard@free-electrons.com>
 <34997AD3-B621-4823-920E-22E4A6F0E0D1@konsulko.com>
 <20160614002550.GA4882@voom.fritz.box>
 <F0B62E6A-D5CE-4505-BC19-5EAB72A33ADE@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QXAv++6zoyBcX2gv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465961903;
	bh=jQFgkpP+HL0EfGY9s7rRMOpF7JIyTjLFvan+24QtMQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YdGjQF6BZVmm7nj3dINrV8x6VNViGFYLSWeZ2UyTKelOOT7K4NAqPwCTw2T8igYhk
	 qgtuZfou68R7vzg5cm8T/7HjxZ5SbZPE35NsL+FWbh2sW7I/o3/5emxZDImwrvDTLE
	 Wnggcg1cE0B28dPeVnuI9ho/NsU3NRSEhmpz7xDc=
Content-Disposition: inline
In-Reply-To: <F0B62E6A-D5CE-4505-BC19-5EAB72A33ADE-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--QXAv++6zoyBcX2gv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 12:22:23PM +0300, Pantelis Antoniou wrote:
> Hi David,
> > On Jun 14, 2016, at 03:25 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> > On Fri, Jun 10, 2016 at 05:28:11PM +0300, Pantelis Antoniou wrote:
[snip]
> >>> +static int fdt_overlay_merge(void *dt, void *dto)
> >>> +{
> >>> +	int root, fragment;
> >>> +
> >>> +	root =3D fdt_path_offset(dto, "/");
> >>> +	if (root < 0)
> >>> +		return root;
> >>> +
> >>> +	fdt_for_each_subnode(dto, fragment, root) {
> >>> +		const char *name =3D fdt_get_name(dto, fragment, NULL);
> >>> +		uint32_t target;
> >>> +		int overlay;
> >>> +		int ret;
> >>> +
> >>> +		if (strncmp(name, "fragment", 8))
> >>> +			continue;
> >>> +
> >>=20
> >> This is incorrect. The use of =E2=80=9Cfragment=E2=80=9D is a conventi=
on only.
> >> The real test whether the node is an overlay fragment is that
> >> it contains a target property.
> >=20
> > Hmm.. I dislike that approach.  First, it means that if new target
> > types are introduced in future, older code is likely to silently
> > ignore such fragments instead of realizing that it doesn't know how to
> > apply themm.  Second, it raises weird issues if some node down within
> > a fragment also happens to have a property called "target=E2=80=9D.
>=20
> Not really. If new targets are introduced then the fragment will be ignor=
ed.

Yes.. and that's bad.

> We can have an argument about what is better to do (report an error or=20
> ignore a fragment) but what it comes down to is that that applicator
> does not know how to handle the new target method.

Sure, let's have the argument.  The overlay is constructed on the
assumption that all the pieces will be applied, or none of them.  A
silent, partial application is an awful, awful failure mode.  We
absolutely should report an error, and in order to do so we need to
know what are applicable fragments, whether or not we understand the
target designation (or any other meta-data the fragment has).

Given what's established so far, checking the name seems the obvious
way to do that.

> There is no issues with any target properties inside a fragment because
> the check is not made recursively.

Ok, so the real test you're proposing is "at the top level AND has a
target property".

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QXAv++6zoyBcX2gv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYMf6AAoJEGw4ysog2bOSzhQQAJ+O4OhwCtA1WkpmQ/tLKLIA
9O38kWPDwOarBUGY5MTUYr1E4j5VDfpP0k+iQVsQavWbrLG+PbcsQXYMprshWSZw
G6SBWawJNXb/9gpZn49umQo70lIJGgFb4FQmT8oONk9rVNNyhd+gNvDpEQ+meTrI
yAg6tj0W27UwzYNtp5CEUMTiTxoQcWwG9wPtCnomExwTgPizTposnCmtGIbjrStA
S9UAHoh/z7r4ao0U9qMNKUO5glWPBKkpySh+IBlm2Tdo1B6ZQO0r789lBDoBhDKR
R+XK4V1Lo5wm8sbTehVt8hQK1QvTOxSdwzmuQzEgzxAhMg23qv9NaorXpRyBioRV
bRE7KQ7kDfW/0e9sY4liu42SYnFViLqbEiocVMBjLAV1bAfAquLjSCFchba/tsBk
Gra6ZKmocSdjBybz3HnUODYng7DfP9ldbZecVm0m4lTfkYwshR/80lgaGqYmDmd0
LhfpPjGMXTdsKYrwW2A28r5O1RBZhk7UPSbLL5hA1qGlTNkpG0bg04aASw4Ypgp+
YGKRkR9Yk1Hxpg30Xlp8Cuu3MqlXwMxQ9/WPKpgtBqYoqlFZu5TszpGKVazx0bYT
9uboD3gtyxlRlCpb61pVXIklaziGYqQkQdP2f1+I/eZsvgONfeRvaCowl4p6FX8M
QlyoG+elZE+4z+efkp8G
=9ViQ
-----END PGP SIGNATURE-----

--QXAv++6zoyBcX2gv--
