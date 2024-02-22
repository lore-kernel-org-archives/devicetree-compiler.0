Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD705376ED
	for <devicetree-compiler@vger.kernel.org>; Thu, 22 Feb 2024 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592579; cv=none; b=Ts4cgVBehiSPhiGSSClvU4YpfWtqYcFxzRRhmPaD2j4QUMw3UxkN8nI06fOGfDlpuyJqV9vX0RgFL1skn0WCvpyG5oVNMClLm0jBbXHTTr9Dy8VOvZ3o7f6G8aAO2bmyjYAWdOewXu0E0NynhGnYLOUG9/SB9lsIfAQQHdJI1x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592579; c=relaxed/simple;
	bh=9IyQnDqBwpZHhvWLP2gd0v1hHnDHEulLRFU3pVWR9JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hm/0PdaBIXIOLraVPN7ry8bv19Q7aBipusrFt/ZPxpVgHTH5iNlBlL9/CJWWcW5wsOQbBtW0ZjyXCQ7htET1cuYhkB1gvqLwbkkMz6g4qEyCDiDhLv2DVYm7SQvAqI/sBd4uQbObMG/z/nU34zONJC039GKmwruj7rSbLXrbO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=N4HFcHSK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="N4HFcHSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1708592572;
	bh=VxJVrbDsaPnPPvtJZ1EGAgx0HI+aIfAYCwMMzoyqhnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4HFcHSKdfTWZsap8N54JeykfcxwgPsoz2/edsqJ8U9KsdQ01igcp+2l45pI8qLwo
	 kP4UTfkvvgS604PjrRvWHvJgH2XfiyCJ3QMjDbk7Bu82LxPS/hWXHNA+uVfyq3pR4+
	 6dq9fnM+PVUNnKaZsYqMV9hYO7A3nOJ6izX8ir95phL1+hYte/apl6gTvcJ/d+BVZq
	 WutDimcaHZKpO/jQt5Z//suINhirDNGf5+js2ygpgtGmxbq7x6E0ApZQ/az6sYOlhI
	 s+Yt5OTjTDgNn/YeLvqO2rXosEE7+AQTs7gvcCg0mwTJ9e62/loSztdKVNykS985iy
	 Cd1Lzu9RHdksQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4TgRxS2KLsz4wcr; Thu, 22 Feb 2024 20:02:52 +1100 (AEDT)
Date: Thu, 22 Feb 2024 20:02:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Yves-Alexis Perez <corsac@debian.org>,
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v2] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <ZdcNtSCopy-9BXb0@zatzit>
References: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
 <ZdbqaoTUfBmSlC98@zatzit>
 <eirdh4rp5zcees3b6p7jeazmg323vf74i5cgz64jzeph2bm5mp@qiqpdtz6id4a>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ish5uqtErss95vMY"
Content-Disposition: inline
In-Reply-To: <eirdh4rp5zcees3b6p7jeazmg323vf74i5cgz64jzeph2bm5mp@qiqpdtz6id4a>


--Ish5uqtErss95vMY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 08:22:48AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello David,
>=20
> On Thu, Feb 22, 2024 at 05:32:10PM +1100, David Gibson wrote:
> > On Fri, Feb 16, 2024 at 07:19:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > > [...]
> > > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > > index 5c0c3981b89d..914acc5b14a6 100644
> > > --- a/libfdt/fdt_overlay.c
> > > +++ b/libfdt/fdt_overlay.c
> > > @@ -520,6 +520,228 @@ static int overlay_fixup_phandles(void *fdt, vo=
id *fdto)
> > >  	return 0;
> > >  }
> > > =20
> >=20
> > All of these new functions could do with descriptive comments saying
> > what they do (see the existing code for examples).
>=20
> Yeah, I was lazy. I didn't expect this patch to go in without comments
> and avoided investing time documenting functions that maybe will change
> in the course of the review-resend loop. :-)
>=20
> > > [...]
> > > +static int overlay_update_node_conflicting_references(void *fdto, in=
t tree_node,
> > > +						      int fixup_node,
> > > +						      uint32_t fdt_phandle,
> > > +						      uint32_t fdto_phandle)
> > > +{
> > > +	int fixup_prop;
> > > +	int fixup_child;
> > > +	int ret;
> > > +
> > > +	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
> > > +
> >=20
> > Extraneous blank line.
> >=20
> > > +		const fdt32_t *fixup_val;
> > > +                const char *tree_val;
> >=20
> > libfdt style is to use tab indents, looks like most of this block has
> > space indents instead.
>=20
> Huh, I'm surprised about myself that I didn't notice this alone.
>=20
> > > +
> > > +			/*
> > > +			 * phandles to fixup can be unaligned.
> > > +			 *
> > > +			 * Use a memcpy for the architectures that do
> > > +			 * not support unaligned accesses.
> > > +			 */
> > > +			memcpy(&adj_val, tree_val + poffset, sizeof(adj_val));
> >=20
> > And here you can use fdt32_ld() which has unaligned access handling
> > built in.
>=20
> I copied this from somewhere, so I guess there is some potential for
> improvement in existing code. Will take a look.
> =20
> > > [...]
> > > +
> > > +static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdt=
node,
> > > +						  void *fdto, int fdtonode)
> >=20
> > Maybe "overlay_resolve_phandle_conflict()" for a slightly shorter
> > function name.
>=20
> Sounds good, wasn't too lucky with
> overlay_prevent_phandle_overwrite_node() either.
> =20
> > > +{
> > > +	uint32_t fdt_phandle, fdto_phandle;
> > > +	int fdtochild;
> > > +
> > > +	fdt_phandle =3D fdt_get_phandle(fdt, fdtnode);
> > > +	fdto_phandle =3D fdt_get_phandle(fdto, fdtonode);
> > > +
> > > +	if (fdt_phandle && fdto_phandle) {
> > > +		int ret;
> > > +
> > > +		ret =3D overlay_adjust_local_conflicting_phandle(fdto,
> > > +							       fdt_phandle,
> > > +							       fdto_phandle);
> > > +		if (ret)
> > > +			return ret;
> >=20
> > So while, as you've seen, there can be conflicting phandles between
> > the fdt and the fdto, within the fdto a particular phandle should only
> > appear on a single node.  If a phandle is duplicated across nodes
> > witin a single fdto, you have bigger problems.  Therefore, having
> > found a conflict, you're already found the only place you need to
> > change the phandle property itself - you don't need to scan the full
> > fdto again.
> >=20
> > So I believe you can replace the above call with just setting the
> > phandle property on fdtonode.
>=20
> Oh right!
> =20
> > > [...]
> > >  /**
> > >   * overlay_apply_node - Merges a node into the base device tree
> > >   * @fdt: Base Device Tree blob
> > > @@ -824,18 +1046,26 @@ int fdt_overlay_apply(void *fdt, void *fdto)
> > >  	if (ret)
> > >  		goto err;
> > > =20
> > > +	/* Increase all phandles in the fdto by delta */
> > >  	ret =3D overlay_adjust_local_phandles(fdto, delta);
> > >  	if (ret)
> > >  		goto err;
> > > =20
> > > +	/* Adapt the phandle values in fdto to the above increase */
> > >  	ret =3D overlay_update_local_references(fdto, delta);
> > >  	if (ret)
> > >  		goto err;
> > > =20
> > > +	/* Update fdto's phandles using symbols from fdt */
> > >  	ret =3D overlay_fixup_phandles(fdt, fdto);
> > >  	if (ret)
> > >  		goto err;
> > > =20
> > > +	/* Don't overwrite phandles in fdt */
> > > +	ret =3D overlay_prevent_phandle_overwrite(fdt, fdto);
> > > +	if (ret)
> > > +		goto err;
> >=20
> > I think this should go above overlay_fixup_phandles(), so that we're
> > completing all the __local_fixups__ based adjustments before going to
> > the __fixups__ based adjustments.
>=20
> This is only to please the reader, right? Or is there a corner case I
> failed to see?

Correct.  At least as far as I've seen, too.

> The feedback I removed in this mail I agree with. Expect a v3 soon.
>=20
> Thanks for your time to review my patch,
> Uwe
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ish5uqtErss95vMY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmXXDbAACgkQzQJF27ox
2GfVcQ//RO3FSPg+nS9LhN4t1S2vQwimWjdjLuqDVEAZRTl0+baCVM3Dz5wuOCYG
JlrAAIcB+Vx58MIfi0G2DD7xbBV3btOmz5/vLJnjbq5n/Vg41J42mQSuKrhOFa0c
btFj5qBB+V9yqVPLo3EnepOkeBaMtfERLx9BlN9rWU3KwgPUAXI4HtenMHkizDAm
fJ9tljvP1YsSUPtFzqs1rgIQEPeF4PHb3haR1L7TwaARulohW2wZKAZ1L8cLWXeQ
x9gw5HTrZLx24t2C6F9yJL5uqoC4CvjDevtwLK0IdCJt/yjddxlXxEMJo2+6yDCA
MutRxljzryRNGwQV2wWBhgQ6UHmODkfdrl7FL+O7OKnkkzqWRPRGd2u3e3Yn+n23
UK9GjknT4WA//sFRNjrdE41E8bl9/JZQ/0b/t72hidsdR/hKZIE3IoTJdaz+VmBY
yXjZ2S5OP+seVU6Zn9x4qZwtIvvsXxt8p6IjQsGGXND0tdt7/hBhrv9kJVef4irQ
jAaajZPyEEl3c8tsNEEg7L8eimeXgxSOgaPMMcNV2XaWFPy79+yZdOQx5DPvG4Tf
jOKHOQt83RS/sS55lrEbLsd7aWxO2rdddEmfp46ApmpK6gbBEq0iEIKR3NzJGBFC
XO5cI5rnfRvRmq00Up4Mv+CP5qUIRwUFIV2Mq281jdeSOdJrPKc=
=QKq/
-----END PGP SIGNATURE-----

--Ish5uqtErss95vMY--
