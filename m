Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C53E22F740
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Jun 2025 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948969; cv=none; b=saPH5pMPOiJlwJiIB4Q74U2OozqsAVwXdLf8VJBw9QCLj3zMnV8KtttVaJGzhXdLXuB8t8huTc7la+5f6hQKjBb5r9e1CYVXbWjoeJyQhBVh0QPS7tPjRFBwMWCzHi/dmoZW0ZY1ofu51LiHayxpWCSMnbaeIfoldQHJXeicX9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948969; c=relaxed/simple;
	bh=aRB2kpOxJGvbfBKQspc/3KgcF5WoO/0CiYe19BI39eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxsfuV4M3UcxItT1olWErCzzenounV6mxTPNTDvDW6MEkA6RmLTDom7TvBu8HdwRS9sVwY6kRPRzHXxp78cBv9agJCXGWHCJBLdHH3o5OZbnvnghwUTCTH/F+7mVbrttVn0ScvcvcANbj7Smx7WmsMXcopdWJDv/xXZ7R/tB1Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=aizmprCw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="aizmprCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1748948964;
	bh=95L4iGD7RKMGGRXMr5O+axmekTnaszcNb94Bff0hV/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aizmprCwCXXF2HU3DuZy/iVRXUKHVgbmyCpPaR3fEhHMInsbwLrhT0yM7kf99xrBb
	 AhnQ7tAILKd1NoISiM9xV3zndlAHcoFc9Al/3l0QCal1E/SwhiQO+D33Q5anzRDVND
	 +OXkGtGAPSt1Zpsp3fJ/Wcyat4Ji0qZGc1L1rjtM5EeAMK5TMrpReI9Y+Sgi5idvjt
	 N3i+ABMt38DxIKeUXNCsVy0/509lPSbTlkay6quEpyAZBLEqIvH7qao9VUtXQu5o1X
	 5o3KmutnesHWEftLwb/GoqpLXk4g8mTZ9RA+fsWCNrKxkkKY//TrsvzRSmUF735oeb
	 60Wh7pfuWZOQg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4bBSdw4L7xz4xcj; Tue,  3 Jun 2025 21:09:24 +1000 (AEST)
Date: Tue, 3 Jun 2025 21:09:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: devicetree-compiler@vger.kernel.org, kernel@quicinc.com,
	kernel@oss.qualcomm.com, Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH v3 1/4] libfdt: overlay_merge: Introduce
 fdt_overlay_merge()
Message-ID: <aD7X2MMB5x0WWkLU@zatzit>
References: <20250519091043.621316-1-quic_wasimn@quicinc.com>
 <20250519091043.621316-2-quic_wasimn@quicinc.com>
 <aC1VQfD3F1v_1rem@zatzit>
 <aDmkipTfwXqyz1Mm@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OFn9ZnGvtcqOMuVM"
Content-Disposition: inline
In-Reply-To: <aDmkipTfwXqyz1Mm@hu-wasimn-hyd.qualcomm.com>


--OFn9ZnGvtcqOMuVM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 05:58:58PM +0530, Wasim Nazir wrote:
> On Wed, May 21, 2025 at 02:23:29PM +1000, David Gibson wrote:
> > On Mon, May 19, 2025 at 02:40:40PM +0530, Wasim Nazir wrote:
> > > From: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> > >=20
> > > fdt_overlay_merge() merges two overlay blobs. It is largely expected =
to be
> > > used offline on a build machine to combine two or more overlay blobs =
into one.
> > >=20
> > > It is intended to help maintain device-tree overlay code in
> > > multiple source repositories, but merge their binary forms (overlay b=
lobs)
> > > into one so that bootloader's task of searching for all relevant over=
lay blobs
> > > is simplified.
> > >=20
> > > Introduce fdt_overlay_merge() which is identical to fdt_overlay_apply=
().
> > > Subsequent patches will introduce required changes to merge overlay b=
lobs.
> > >=20
> > > Signed-off-by: Srivatsa Vaddagiri <vatsa@codeaurora.org>
> > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > ---
> > >  libfdt/fdt_overlay.c | 59 ++++++++++++++++++++++++++++++++++++++++++=
++
> > >  libfdt/libfdt.h      | 18 ++++++++++++++
> > >  2 files changed, 77 insertions(+)
> > >=20
> > > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > > index e6b9eb643958..8690ed55c8f6 100644
> > > --- a/libfdt/fdt_overlay.c
> > > +++ b/libfdt/fdt_overlay.c
> > > @@ -1098,3 +1098,62 @@ err:
> > >=20
> > >  	return ret;
> > >  }
> > > +
> > > +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
> >=20
> > The parameters should be renamed to reflect the new semantics.
>=20
> Sure will change to proper name.
>=20
> >=20
> > The 'fdto_nospace' parameter seems weird.  Why not just return
> > -FDT_ERR_NOSPACE from the function?
>=20
> fdto_nospace variable is used to know cases when 2nd fdto (overlaying fdt=
o)
> needs more space while -FDT_ERR_NOSPACE is used for cases when
> 1st fdto (base fdto) needs more space.

Ah, I see.  I can see the reason now, but it's still a deeply ugly
interface.

Hmm... why do you need to ever expand the applied size?  It's obvious
you'd need to expand the based dtbo, but not why you'd ever need to
expand the one you're applying on top.

> I will change the arguments for better clarity.
>=20
> >=20
> > > +{
> > > +	uint32_t delta =3D fdt_get_max_phandle(fdt);
> > > +	int ret;
> > > +
> > > +	FDT_RO_PROBE(fdt);
> > > +	FDT_RO_PROBE(fdto);
> > > +
> > > +	*fdto_nospace =3D 0;
> > > +
> > > +	ret =3D overlay_adjust_local_phandles(fdto, delta);
> > > +	if (ret) {
> > > +		if (ret =3D=3D -FDT_ERR_NOSPACE)
> > > +			*fdto_nospace =3D 1;
> > > +		goto err;
> > > +	}
> > > +
> > > +	ret =3D overlay_update_local_references(fdto, delta);
> > > +	if (ret) {
> > > +		if (ret =3D=3D -FDT_ERR_NOSPACE)
> > > +			*fdto_nospace =3D 1;
> > > +		goto err;
> > > +	}
> > > +
> > > +	ret =3D overlay_fixup_phandles(fdt, fdto);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > > +	ret =3D overlay_merge(fdt, fdto);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > > +	ret =3D overlay_symbol_update(fdt, fdto);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > > +	/*
> > > +	 * The overlay has been damaged, erase its magic.
> > > +	 */
> > > +	fdt_set_magic(fdto, ~0);
> > > +
> > > +	return 0;
> > > +
> > > +err:
> > > +	/*
> > > +	 * The overlay might have been damaged, erase its magic.
> > > +	 */
> > > +	fdt_set_magic(fdto, ~0);
> > > +
> > > +	/*
> > > +	 * The base device tree might have been damaged, erase its
> >=20
> > This comment is no longer accurate in the new context.
>=20
> New context here is two overlay files, while earlier it was dts and dtbo?
> I'm concerned that I may not have understood correctly, can you provide
> more details.

No, I think you have it.  The comment references a "base device tree",
i.e. not a dtbo, but that's no longer accurate.

> > > +	 * magic.
> > > +	 */
> > > +	if (!*fdto_nospace)
> > > +		fdt_set_magic(fdt, ~0);
> > > +
> > > +	return ret;
> > > +}
> > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > index b5e72001d115..664b141d5334 100644
> > > --- a/libfdt/libfdt.h
> > > +++ b/libfdt/libfdt.h
> > > @@ -2313,6 +2313,24 @@ int fdt_overlay_apply(void *fdt, void *fdto);
> > >  int fdt_overlay_target_offset(const void *fdt, const void *fdto,
> > >  			      int fragment_offset, char const **pathp);
> > >=20
> > > +/**
> > > + * fdt_overlay_merge - Merge two overlays into one
> > > + * @fdt: pointer to the first device tree overlay blob
> > > + * @fdto: pointer to the second device tree overlay blob
> > > + * @fdto_nospace: indicates if FDT_ERR_NOSPACE error code applies to=
 @fdto
> > > + *
> > > + * fdt_overlay_merge() will merge second overlay blob into first ove=
rlay blob.
> > > + *
> > > + * Expect the first device tree to be modified, even if the function
> > > + * returns an error.
> > > + *
> > > + * returns:
> > > + *	0, on success
> > > + *	-FDT_ERR_NOSPACE, there's not enough space in first device tree b=
lob
> > > + *	-FDT_ERR_BADVALUE
> > > + */
> > > +int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace);
> > > +
> > >  /*******************************************************************=
***/
> > >  /* Debugging / informational functions                              =
  */
> > >  /*******************************************************************=
***/
> >=20
>=20
> Regards,
> Wasim
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--OFn9ZnGvtcqOMuVM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmg+18sACgkQzQJF27ox
2GdQkQ//T7apVCFhhZ7E6HWcogr51y9h96dRKxSdm+WZUiTSBHfq+OlIIrfhYwDP
uzu+XB45NuaMnYA/tlpmCCRdis6xCM5aj8wgl2TwwUY3rgQoDxAfkkTmSXIPMqLn
PhSl4MiusIH3vTvTGQMrzi9Lqo6CzHsUbmDQAuM3uoQrY7VxlkpfIyQHVHcm0Mkp
kEgjpaXKbruOUyt81RgfooBWRXimq44BAEi2Voys3NqZmT78nmIfqbZoeRgl+Y52
cK2iejP/nD8XzqkzdfhAfGqiHuqCaeooU/hc7WbtqUadS8qgMBUkVa3xXceiGUZU
nE9YmXFSNypJjQ2RC8eOv/7O/LiKj1fs4M9RBrockrzLPkmDcyMGOlUyct2iitEF
NBCD/3UNAip0gt8jXlMgj/JGSRmzXdVdZT+Q3BQ7qb5mr3zvdxxaeTWa7ZNw0nbN
N8/Wfyx0++IeJ5PpBVYxzi9u75QYRa65NdhyYSZXTAtq5BgUje1glT6atcWAqodw
X2ZXmyHLtU7gTMkL0RidgHaBfl5FBkbvFqJ1rxleXI8TbTM4Ykw2sncR28t/wyw6
Xt2N0bkncU3OsuwXvvo1aPkfwGQfbHsyEuqXScpRCvG2E3rRlz/ix0hjTV7ZK0Fw
MVBlvyHOvhuSoBGgtRxNpOc38PMsYYaBwP3kaszldax88fgkeJU=
=PvPo
-----END PGP SIGNATURE-----

--OFn9ZnGvtcqOMuVM--
