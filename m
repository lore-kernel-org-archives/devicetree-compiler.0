Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2E9441
	for <devicetree-compiler@vger.kernel.org>; Thu, 14 Mar 2024 05:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710392839; cv=none; b=kTpdTTuUxGFlUk09gC4lkhRl7+ilZyEYHWad1c///4gPOOrhmumCfqV086F/vL7A9SqDkpWB0aQxCUoqMJttCFHvIKu9MJO+U1kWFSVkQ/7MlX8gs/+7kxQLijH5e7y31I7+XEoZA9ER+6YOQyNddaH8pRAt3ErXb3ZwWpnxyXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710392839; c=relaxed/simple;
	bh=rpVjj3gETrZMxnIH7hJIgOTACP1SlMGQejLFQNLtUcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RViQDclEcQBl7PnHznQyhEq539fReW8f4qUjEGDCCtyBrshVXIBMIsnDdyqtDCVShfqwdBY2gGpOAABVVV4ooJmxLMr7yCAYdBZFLBnX1zF8Oi6FG4DlukaDhMfuyiL2QSmZyMrMlfmUWZLzxLA2ltnEgpuuovqB3nA7zevDj/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=rgBjSaEA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="rgBjSaEA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1710392830;
	bh=FzfxTjY7vCC3r/1AzFeoFxxwOzoGg6vgPF833966avc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgBjSaEAK8VMDMZzn9s+o7ighRD0/zpaZDI2qQwcdoixK+StepmCdgKfAiiSmKwWY
	 x7jWZz+jvRqEfZZb0BPFAwLdZJ1pxcqEXvpR/jhvZjUy42EiD8A5WqpvIDcgAMcVwb
	 Ghbr205K4+K9KnMZH3eD7QQoYhrKUvojTMKTgKq/M0ua5FrSFvvPPR312DpmT5R0S6
	 yyYE/s4f2bWUatHd59fBG2wbHMVnbN9U7Y5KPbq+HeTL/t9r0D67E19YJxOdDOAmdd
	 8DS/rXdRw8yIm+a0jIPIXWHWBwwBFBeCVKO9nt52wt5S7zckLkz/qvTt8kCGGPZyEG
	 pOGjIAHO1TKpA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4TwFjp2kGZz4wcs; Thu, 14 Mar 2024 16:07:10 +1100 (AEDT)
Date: Thu, 14 Mar 2024 15:43:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Yves-Alexis Perez <corsac@debian.org>,
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v3] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <ZfKAYQ7sNYLpJOps@zatzit>
References: <20240225175422.156393-2-u.kleine-koenig@pengutronix.de>
 <ZdwncYaatDrRBkKU@zatzit>
 <mpmdkpzzfpw6vrgvpd3e324zouwd4u3oxq7rpmc2sktxjtojj7@gauowuw3mug5>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T9DNEIT/JSyScQlD"
Content-Disposition: inline
In-Reply-To: <mpmdkpzzfpw6vrgvpd3e324zouwd4u3oxq7rpmc2sktxjtojj7@gauowuw3mug5>


--T9DNEIT/JSyScQlD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 10, 2024 at 09:30:31AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello David,
>=20
> On Mon, Feb 26, 2024 at 04:53:53PM +1100, David Gibson wrote:
> > On Sun, Feb 25, 2024 at 06:54:23PM +0100, Uwe Kleine-K=F6nig wrote:
> > > A phandle in an overlay is not supposed to overwrite a phandle that
> > > already exists in the base dtb as this breaks references to the
> > > respective node in the base.
> > >=20
> > > So add another iteration over the fdto that checks for such overwrites
> > > and fixes the fdto phandle's value to match the fdt's.
> > >=20
> > > A test is added that checks that newly added phandles and existing
> > > phandles work as expected.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > > Hello,
> > >=20
> > > here comes the next iteration of the patch that fixes overlay
> > > application to not overwrite existing phandles.
> > >=20
> > > It is rebased to current main branch. The changes since v2 are:
> > >=20
> > >  - Add documentation
> > >  - Apply the simplification from 24f60011fd43 ("libfdt: Simplify
> > >    adjustment of values for local fixups") in the functions added her=
e.
> > >  - Rename functions using shorter and better names
> > >  - Changed the test device trees to yield a hole in the phandle space
> > >  - Checked each phandle value not being overwritten separately
> > >=20
> > > Note I didn't switch the order of overlay_prevent_phandle_overwrite()=
 and
> > > overlay_fixup_phandles() because the overlay's phandles must be resol=
ved
> > > before I can do the recursion needed in
> > > overlay_prevent_phandle_overwrite().
> >=20
> > I'm not following what you mean here.  IIUC, conflicts of the sort
> > you're handling can only arise when the overlay describes a phandle
> > for the target node of the reference - and therefore that target is in
> > the overlay.  In that case all references to it in the overlay should
> > be encoded in __local_fixups__ rather than __fixups__.  __fixups__, in
> > contrast describes references to nodes that aren't in the overlay, and
> > so can't be filled in - even with a tentative value - until the
> > overlay is applied.
> >=20
> > So, I'm not seeing how fixing these conflicts depends on resolution of
> > those "external" fixups, rather than just the "local" fixups.  Am I
> > missing something?
>=20
> yupp, look at the overlay dts I added in tests/. It has
>=20
> 	&node_a {
> 		value =3D <32>;
> 	};
>=20
> which is translated to:
>=20
> 	fragment@1 {
> 	    target =3D <0xffffffff>;
> 	    __overlay__ {
> 	        value =3D <0x00000020>;
> 	    };
> 	};
> 	...
> 	__fixups__ {
> 	    node_a =3D ..., "/fragment@1:target:0"
> 	};
>=20
> Before I can recurse over fragment@1 and the matching base dtb node to
> check for phandle conflicts, I need /fragment@1:target resolved;
> otherwise I don't know where to look in the base dtb.
>=20
> So if I switch the order, fdtoverlay reports
>=20
> 	Failed to apply 'overlay_overlay_phandle.test.dtb': FDT_ERR_BADPHANDLE
>=20
> in make check.

Ah, right.  It's specifically that we need to resolve the fragment
targets (including via external symbols) before we can resolve this.
Do you have a test case for this specific problem?  If not, I'd be
worried, that I or someone else might forget the subtletey and try to
re-order at some point in the future.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--T9DNEIT/JSyScQlD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmXygFQACgkQzQJF27ox
2GdGAA//WfHmygcLLhXo46Psluh9jgO7KMDVHka8wCz2icTnvSKM+/HU+yZ5ClVe
0TxDwsjJe5yf5C3/46JyaYUEw/hqOnG2onwxvbpKe6XLZGJF28L8SHpnl+lzFbtm
w9qkm6SMJ1VZ9BvL3pS5X/9nOE9a5a8DVsd60WUo+pH8STI1c/ERFkcivxHxd+eN
2BRLrAcqslQ0ZvKGb7XrGCIdReEGlTKf0dt4i4ENt1ytj2Yj5UxoGl68P5HkRm+b
iRXrIMNNWufzGghmNSsVT0foyPMasjuWbygWq+TkYXANGdpYm2bG1FHf+UzSZ+Bq
tG7E4mXXXl/S/k7SQKHn2wpSAxPRaTzHhdxBi7YIvYJ/nFEmM/wDez/4pCcfB08Z
7Qm62rlrzesGGpQTokmj0jlKpn2q/tLLraSPjhtfiMk+xpNoZnFg8wEXBria9lYA
iVKXqN9nvXEM6hWJCVtcnk/gU5DCdwNN1c3UmADSdy7wRU2uibmd+mXrOcrxnKoA
H+Wxkx9QLsRmOq6YnqQans0W6MTMDcZiI13RK7lsBUYiOFH7Y1174qT3K8aOjOz4
WhDQ3a73g4iFYDGJ77WfT+0qohKEJeWWrd9LJhwNnzjm9VLs+60k490flJ/jPLFv
C5cTdP0g/9yNVnbYs+lZ6G20u6WzsE/WupP9rHJWmXqIeZ8lUaw=
=e/0j
-----END PGP SIGNATURE-----

--T9DNEIT/JSyScQlD--
