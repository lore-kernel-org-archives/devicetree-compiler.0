Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD581381A0
	for <devicetree-compiler@vger.kernel.org>; Thu, 22 Feb 2024 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708594745; cv=none; b=kw0y50XLaQRr5hM24pIzsRpdBXjMms/z5horbVI5l3ROqKVEguRnLfazQV9+gbWnpsIGMBjOqNFh5QRuanbl86v4y8ewWHFkfLRhTEnp5/CX4LRVqfgyO4TAwdO8eBY6sx4gaZR9J/UvuIrCTNWv4uRb4e3S/K4UybWG9S/6rBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708594745; c=relaxed/simple;
	bh=PNbEp8AvsfiETOgZh/6kKHh8tLoAAqpOthGDoxyeEAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOisgdCUPvquRXVcCM0FU500+3bjewy3+LEIr8lBpP55aUUJbyPgrLsoFub5go/q1yIVMC4UDnxDBPZ+JJ9+5+1Q4qGKGsfb5odZey1uXfSneJWNBfCKz8hbu0/ubHjVf7LLtGWqvgyh8OXh/vEkWF8wi7sIlwwzTG8ThpSnwIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rd5Xb-0004BB-3s; Thu, 22 Feb 2024 10:38:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rd5Xa-002Cmq-67; Thu, 22 Feb 2024 10:38:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rd5Xa-009L23-0L;
	Thu, 22 Feb 2024 10:38:54 +0100
Date: Thu, 22 Feb 2024 10:38:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Yves-Alexis Perez <corsac@debian.org>, 
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v2] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <oitc63fe3agrg2vwgml6x652uo4dqst3m6kbaiu4rs3sbqnco4@rylqo655o4m5>
References: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
 <ZdbqaoTUfBmSlC98@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yw5l2aegtupqwgxy"
Content-Disposition: inline
In-Reply-To: <ZdbqaoTUfBmSlC98@zatzit>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-compiler@vger.kernel.org


--yw5l2aegtupqwgxy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 05:32:10PM +1100, David Gibson wrote:
> On Fri, Feb 16, 2024 at 07:19:20PM +0100, Uwe Kleine-K=F6nig wrote:
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
> > +		const fdt32_t *fixup_val;
> > +                const char *tree_val;
> > +                const char *name;
> > +                int fixup_len;
> > +                int tree_len;
> > +                int i;
> > +
> > +                fixup_val =3D fdt_getprop_by_offset(fdto, fixup_prop,
> > +                                                  &name, &fixup_len);
> > +                if (!fixup_val)
> > +                        return fixup_len;
> > +
> > +                if (fixup_len % sizeof(uint32_t))
> > +                        return -FDT_ERR_BADOVERLAY;
> > +                fixup_len /=3D sizeof(uint32_t);
> > +
> > +                tree_val =3D fdt_getprop(fdto, tree_node, name, &tree_=
len);
> > +                if (!tree_val) {
> > +                        if (tree_len =3D=3D -FDT_ERR_NOTFOUND)
> > +                                return -FDT_ERR_BADOVERLAY;
> > +
> > +                        return tree_len;
> > +                }
> > +
> > +		for (i =3D 0; i < fixup_len; i++) {
> > +			fdt32_t adj_val;
> > +			uint32_t poffset;
> > +
> > +			poffset =3D fdt32_to_cpu(fixup_val[i]);
>=20
> You can use fdt32_ld_() here to slightly simplify this

I don't see what you suggest here. fixup_val is assigned to in
fdt_getprop_by_offset() which I need to get fixup_len and then fixup_val
is already around. If you still think this could be improved, please be
more explicit.

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
>=20
> > +
> > +			if (fdt32_to_cpu(adj_val) =3D=3D fdto_phandle) {
> > +
> > +				adj_val =3D cpu_to_fdt32(fdt_phandle);
> > +
> > +				ret =3D fdt_setprop_inplace_namelen_partial(fdto,
> > +									  tree_node,
> > +									  name,
> > +									  strlen(name),
> > +									  poffset,
> > +									  &adj_val,
> > +									  sizeof(adj_val));
> > +				if (ret =3D=3D -FDT_ERR_NOSPACE)
> > +					return -FDT_ERR_BADOVERLAY;
> > +
> > +				if (ret)
> > +					return ret;
>=20
> And here you can use fdt32_st() on (tree_val + poffset), avoiding
> quite some complexity.

There is some complexity because tree_val is a const char * (as this is
what fdt_getprop() returns) and fdt32_st() obviously doens't take a
const pointer.

If you want to play around with that, the code is mostly a copy of
overlay_update_local_node_references() which could benefit from your
suggestions in the same way.

Can I lure you in improving overlay_update_local_node_references()? Then
I could copy from the improved function for my patch. (Or maybe refactor
the function to take a function as parameter which is

	uint32_t delta;
	uint32_t increase_by_delta(uint32_t phandle)
	{
		return phandle + delta;
	}

for the overlay_update_local_node_references() case and

	uint32_t fdt_phandle;
	uint32_t fdto_phandle;
	uint32_t resolve_fdt_conflict(uint32_t phandle)
	{
		if (phandle =3D=3D fdto_phandle)
			return fdt_phandle;
		else
			return phandle;
	}

for my function (maybe passing the data stored in global vars here in a
context parameter).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yw5l2aegtupqwgxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXXFi0ACgkQj4D7WH0S
/k7A4gf/cnEcrTzwinx9RpKIhed0gxhrEm8uihEuAFA8Oug9atTjXQirA8QBjvCN
hAIRvFQ6liH6WG3XwDD/y7+z9/puH1yjvQg8/J8P6BYGbuAfuOcLAImqspoKkSrx
1XmlmimAnXp8TiwyePQEygsFmGl5DSHI6Cooq0mXQD39LuZBUiI280UaSGrZYDdU
f22ImN1jCRUPi49U4RGCDUmQOCa27f3/fdTmnEXF/WJifPXGyH+nu5ir8H6tfrsL
jeg9mqRzLnmcq/I3ZD6JPI18dQE2rluml0pCtdX+Z3kOCrHUDCChkG5SwywhHVx1
wZyasD7TWRJISTsUGQmID95lSlC19Q==
=B0Y6
-----END PGP SIGNATURE-----

--yw5l2aegtupqwgxy--
