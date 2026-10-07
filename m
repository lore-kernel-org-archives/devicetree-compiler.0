Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC7264612
	for <devicetree-compiler@vger.kernel.org>; Wed,  7 Oct 2026 04:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791349178; cv=none; b=EuShGW/oillM3wFoOWPJ+IomRa7r8v5by2ErXX8Xf7K/P9wtoneWKQVdYMEveOsaDGwrS47YnH1dHXR/7mIsysd0BSma4bLPMWPJ8/Rfhe8RVA0pezUZRug+QWVxCqHpN8NGzv7ZI7Z8NxnPZVM19XLDCw+T4ryjEmm5jpWWJ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791349178; c=relaxed/simple;
	bh=bJyhSmEcp9KTIHTF/IhERy7XlZdrsMvZwr27JUDkEgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sB8AVi/kdPJeihk7hnvuDpq/9WD35psh7axXZgbu+JTIJpKzYwgE8big6D0YDSQO3U5J29fKFCPRGFjpaBFoO/wij871UlV0v9vnkuKztHVD+zvRbh7a00xqY6j5iuaYgSVaV4u6OtqyRAukKJ0UGtDTu/ad5ZcxErnWJJWRZYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=eEnCqP3C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="eEnCqP3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1791349164;
	bh=q2hp6ePFW2Za4tn3nx3OcDHxl2i5oGYABfzScnLAWQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEnCqP3CdggKH1eRFjbeD1TbEtPf2QqhXlaEZNnIdc4iA+4H17KDsaiEG5DCUDujw
	 Z7gNA4a2ujhq6uwsKeTXQJzkMted7BBxd3c7hO+YWaPuRhBIyVRXhF14Ho3jJ9R1cp
	 rJRvPJo61uBGQBsV0haX1k6lQH/v0RWVC1rfC8+eBKBGqflbCOyBsmam7kZvfXEHwZ
	 1WlwbuDRaL230whWw24cwj8ezBUNvuzvpvp95AmLYFSLE2mHvEal3LQIhuCZxqB20K
	 Fu9N2kutM+jdzh1PXeqfL2UEwaJ/aQ9WvwuonR8svvdcYMdwnygd2cxcIkqUN+tSR0
	 IibQZzOjSkfSw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j01BN60dXz4wFC; Wed, 07 Oct 2026 15:59:24 +1100 (AEDT)
Date: Wed, 7 Oct 2026 15:58:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Warn about overlapping reserved-memory ranges
Message-ID: <asXRewO5DieggXrA@gractus.seuss>
References: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>
 <CAL_Jsq+niOW2c2ueTmTOwJ6EinFRHbJfKKDAjwxMwMP6drjP9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+hGrDudIZl6Ociro"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+niOW2c2ueTmTOwJ6EinFRHbJfKKDAjwxMwMP6drjP9g@mail.gmail.com>

--+hGrDudIZl6Ociro
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 11:13:05AM -0500, Rob Herring wrote:
> On Wed, Sep 23, 2026 at 12:51=E2=80=AFPM Bjorn Andersson
> <bjorn.andersson@oss.qualcomm.com> wrote:
> >
> > Static /reserved-memory entries associate physical address ranges with
> > particular purposes and properties. While not explicitly prohibited,
> > overlapping ranges commonly indicate an incorrect address or size and
> > may assign the same memory conflicting attributes. Dtc currently
> > provides no diagnostic for this type of mistake.
> >
> > Check every non-empty reg range under available reserved-memory children
> > and report overlaps. Add tests covering overlapping and adjacent ranges,
> > as well as unavailable, zero-sized, and dynamically allocated regions.
>=20
> This issue is not just reserved memory, but any address really. 2 h/w
> nodes pointing to the same range points to a binding design problem.
> That gets a bit more complex to find since it might not be at the same
> level within the same subtree.

So.. that's kind of true, but I think we can examine it a bit more
closely.

One way to do the test would be to check for any overlaps between
either 'reg' properties or between the parent address parts of
'ranges' properties.  That works, and is sufficient when there are no
overlaps between either devices, or address ranges delegated to a
daughter bus via a bridge.  I suspect that's true in enough cases to
be useful as is.

Things get more complicated in cases where a large address range is
passed through a bridge - most often the entire bus address space
using an empty 'ranges' - but the range isn't exclusively delegated to
the subordinate bus.  That only makes sense with certain sorts of
bridge, but is also moderately common.

Perhaps this would be workable:

1st draft:
  * Check for overlaps between reg properties within a single parent
  * Check for overlaps in parent range between 'ranges' properties
    within a single parent (ignore empty 'ranges' nodes)
2nd draft:
  * Check for overlaps between 'reg' and 'ranges' parent range, still
    ignoring empty 'ranges' nodes
3rd draft:
  * When checking a single parent node, don't just check direct
    children, but also indirect descendents via nodes with empty
    'ranges'


> A check for that has been on my todo
> for a long time. I did have AI write something for me a while back
> that seemed to work. It also functioned as a DT to memory map tool
> given you check the entire address space. I'll try to find it...
>=20
> Rob
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+hGrDudIZl6Ociro
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrF0XsACgkQzQJF27ox
2GfSeg//aO50UW2xmyFSsNdbwsJ3lOKebdRY3BodRM3tftNP3kZU3YMUZsy1Sfz9
akA+sylxDpF5nE0kBqZhu27C+s6VqVv3iamuFUW0/8Vj16nH5imvecykJmXb0TBW
/4p6UgKuJCf84QOceC7c2+AUfrCeo2g8ZrJVHemX2Ve2/jK6/xX3MLoj+ZlyWoVJ
c3anxoPhR/iDojYGtMGsDG6w8EN8XgCPiE3QYk6uy1mXR8uXaK2ydD0eR1l14uZh
POSnRTQs1a3ahNI/LpZXtdg3lMvBSxizlwJe7mGKNiDsl00xLh9aYdmXyHsLrWLf
wTIBhWkmTJRxaeotxpMi80KYi6sfIzjvqP+u0lTu6CZz+J0UgLRpVVwcscG7xCf4
uYKMXRwkhV73Yc9gdWzWBDR2diKqVdvakPi4NNR0orOBeh0RAmWtgPnv1TrWbVGx
ztzCC/XGm80OmlobXbVvXuEtHkQtbiVtoqYp3rMmu6UqQ2ntry5RV+aJYAWz1UWA
a4XEled5RWd4yaUyMuPChZ4aUmyCwj/ajcNhn+TXfaIIH/trDlIHaGWNOAzWS9xz
RwLpqHVG9sP86O9t9YMC0NNHW+fg9TLZrVgGCTbcShBgK4e8Mb4zB7PHduvTZJO1
ZOqGwrKFBo3SstUPZqlFrNT+YYq6FmKQDy5aMKZ01buuoaTXeqw=
=Joqt
-----END PGP SIGNATURE-----

--+hGrDudIZl6Ociro--
