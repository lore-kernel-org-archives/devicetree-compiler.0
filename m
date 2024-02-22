Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178E1755B
	for <devicetree-compiler@vger.kernel.org>; Thu, 22 Feb 2024 07:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708586580; cv=none; b=G9eS7LRcykHAEFRtEODCR58QdFjN8GTmH2osB+9qCOnGsVEhTEzIH+vjF3guuNFtVYSDPT2lyiixg53flDulgk8je0QMsk1Q93PxP5n2G6MpOE3vCpcEho+n9eMZ7NVn+hM7r6kBnkO09mprqr/UWX6OSx/Kfi9Qwa8nMnQTWxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708586580; c=relaxed/simple;
	bh=iAuL8tB6jZyRhGofhheSDA3bsTS9grlik8L/3M6NCLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2O4gsdQh/uCEo4oK8lwKKFuDSyoP5RYixhoNX79tWeGlu8LEKNE4/va7QARuHaZLeCGzERHykjDZbjWYdwUI5Larc1bdSlPnQbSqmzksYRdOBAvDMtzL40Eh1h/DeGu0eo4+YqyIKoUrY5tGwct0pXaMyJcmbdpUzBjLtm093c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rd3Pu-00056H-1h; Thu, 22 Feb 2024 08:22:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rd3Ps-002Bhi-SX; Thu, 22 Feb 2024 08:22:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rd3Ps-009HGu-2Z;
	Thu, 22 Feb 2024 08:22:48 +0100
Date: Thu, 22 Feb 2024 08:22:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Yves-Alexis Perez <corsac@debian.org>, 
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v2] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <eirdh4rp5zcees3b6p7jeazmg323vf74i5cgz64jzeph2bm5mp@qiqpdtz6id4a>
References: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
 <ZdbqaoTUfBmSlC98@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u6gnj5h265bg7li3"
Content-Disposition: inline
In-Reply-To: <ZdbqaoTUfBmSlC98@zatzit>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-compiler@vger.kernel.org


--u6gnj5h265bg7li3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello David,

On Thu, Feb 22, 2024 at 05:32:10PM +1100, David Gibson wrote:
> On Fri, Feb 16, 2024 at 07:19:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > [...]
> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index 5c0c3981b89d..914acc5b14a6 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -520,6 +520,228 @@ static int overlay_fixup_phandles(void *fdt, void=
 *fdto)
> >  	return 0;
> >  }
> > =20
>=20
> All of these new functions could do with descriptive comments saying
> what they do (see the existing code for examples).

Yeah, I was lazy. I didn't expect this patch to go in without comments
and avoided investing time documenting functions that maybe will change
in the course of the review-resend loop. :-)

> > [...]
> > +static int overlay_update_node_conflicting_references(void *fdto, int =
tree_node,
> > +						      int fixup_node,
> > +						      uint32_t fdt_phandle,
> > +						      uint32_t fdto_phandle)
> > +{
> > +	int fixup_prop;
> > +	int fixup_child;
> > +	int ret;
> > +
> > +	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
> > +
>=20
> Extraneous blank line.
>=20
> > +		const fdt32_t *fixup_val;
> > +                const char *tree_val;
>=20
> libfdt style is to use tab indents, looks like most of this block has
> space indents instead.

Huh, I'm surprised about myself that I didn't notice this alone.

> > +
> > +			/*
> > +			 * phandles to fixup can be unaligned.
> > +			 *
> > +			 * Use a memcpy for the architectures that do
> > +			 * not support unaligned accesses.
> > +			 */
> > +			memcpy(&adj_val, tree_val + poffset, sizeof(adj_val));
>=20
> And here you can use fdt32_ld() which has unaligned access handling
> built in.

I copied this from somewhere, so I guess there is some potential for
improvement in existing code. Will take a look.
=20
> > [...]
> > +
> > +static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtno=
de,
> > +						  void *fdto, int fdtonode)
>=20
> Maybe "overlay_resolve_phandle_conflict()" for a slightly shorter
> function name.

Sounds good, wasn't too lucky with
overlay_prevent_phandle_overwrite_node() either.
=20
> > +{
> > +	uint32_t fdt_phandle, fdto_phandle;
> > +	int fdtochild;
> > +
> > +	fdt_phandle =3D fdt_get_phandle(fdt, fdtnode);
> > +	fdto_phandle =3D fdt_get_phandle(fdto, fdtonode);
> > +
> > +	if (fdt_phandle && fdto_phandle) {
> > +		int ret;
> > +
> > +		ret =3D overlay_adjust_local_conflicting_phandle(fdto,
> > +							       fdt_phandle,
> > +							       fdto_phandle);
> > +		if (ret)
> > +			return ret;
>=20
> So while, as you've seen, there can be conflicting phandles between
> the fdt and the fdto, within the fdto a particular phandle should only
> appear on a single node.  If a phandle is duplicated across nodes
> witin a single fdto, you have bigger problems.  Therefore, having
> found a conflict, you're already found the only place you need to
> change the phandle property itself - you don't need to scan the full
> fdto again.
>=20
> So I believe you can replace the above call with just setting the
> phandle property on fdtonode.

Oh right!
=20
> > [...]
> >  /**
> >   * overlay_apply_node - Merges a node into the base device tree
> >   * @fdt: Base Device Tree blob
> > @@ -824,18 +1046,26 @@ int fdt_overlay_apply(void *fdt, void *fdto)
> >  	if (ret)
> >  		goto err;
> > =20
> > +	/* Increase all phandles in the fdto by delta */
> >  	ret =3D overlay_adjust_local_phandles(fdto, delta);
> >  	if (ret)
> >  		goto err;
> > =20
> > +	/* Adapt the phandle values in fdto to the above increase */
> >  	ret =3D overlay_update_local_references(fdto, delta);
> >  	if (ret)
> >  		goto err;
> > =20
> > +	/* Update fdto's phandles using symbols from fdt */
> >  	ret =3D overlay_fixup_phandles(fdt, fdto);
> >  	if (ret)
> >  		goto err;
> > =20
> > +	/* Don't overwrite phandles in fdt */
> > +	ret =3D overlay_prevent_phandle_overwrite(fdt, fdto);
> > +	if (ret)
> > +		goto err;
>=20
> I think this should go above overlay_fixup_phandles(), so that we're
> completing all the __local_fixups__ based adjustments before going to
> the __fixups__ based adjustments.

This is only to please the reader, right? Or is there a corner case I
failed to see?

The feedback I removed in this mail I agree with. Expect a v3 soon.

Thanks for your time to review my patch,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--u6gnj5h265bg7li3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXW9kcACgkQj4D7WH0S
/k5lUwf/Z7rhP7xkSZoUhisKzGo62S5wbdcUeLc8Vie38Vu3urXhEILCI2AlK2Fb
pyilCIZe1vfMU+xwoyzGRHtgAPfEU4HKpnnYZvbLAfAxlIh0gJkJkY/nZEWsyVun
tQOXCagUg9q8NkyUVaQiYiQymMaxQg4XslwYlND/7ICnedCdWnveerZ5SYZKMVgJ
dtC6hdD8ikOQGfxJ1L5HWyWUo2hJEYHHeLrqgjxEzvt7L4dasiWGsKZhCkXyptx0
ot1fDZsMCOunV81uoNnv2lp/5RJ1SNn2Iqk7O0JemuPzXY25Gga1ghqvhVyTasoT
PimHFSLZ63lB8nX9vOJQcYN1yAgtmQ==
=yRHF
-----END PGP SIGNATURE-----

--u6gnj5h265bg7li3--
