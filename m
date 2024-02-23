Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BB5C8DE
	for <devicetree-compiler@vger.kernel.org>; Fri, 23 Feb 2024 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708663335; cv=none; b=Jlrto4AL1g8piOn3eMBvUHioQtRc34gEwOqCD8COimErvf1UcLC+26x105KX9Xxqc+bsx4CQorXBS9VVf+7Wjs2nIZZFCdxtL2QI0Vwfk+rPD3hsrJEQ3pmCrhdIumKXKPqgIiIJ2lKMfKHDF5ErTrEkARqfW2fzyfpe/daGCtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708663335; c=relaxed/simple;
	bh=TMaIRJhD9hr/MN+xtcbfpLmMUVkfUy2wu0rXvhhM14E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpSeOgUh83Bl13W6aOtPjOx15lCVTXStp6Slmzo2aKq8bmqSocle8GBQ6s9fnqunBeVvT+CnFfUP+EbuiHLdY1JL+nnrOxMD79st9qnDz89YbZZMVkp3SyuIHItW7auemQu5z4dHw+YJWLCM0v17ddGUKt2tQyQiDtj09gOeip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=EqTSlN62; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="EqTSlN62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1708663328;
	bh=nuSc3Cx1beyrF6Ef8lxwrxohOoyqdswLU4T7inSFnFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EqTSlN62TOpqw/nz6gHAhGX4QVtM/CzRdGAHCoJU7vZfbrAU33Tjcoho9ZqlLu9BG
	 gcfecI0NBON9EhrLgcKphG0TSxLdbpcLKRbfrVgNsuTv3+KeA0yiWUkDJh8jzQMVkT
	 eQeTvJNWS4AqQRAKX328U8ld7XDX/gjVPpLks2EjAowj6thGrwDcggfLaMSI6HC/uf
	 UBzkC/RuvqgPardzT2+hApT5rBxo7znkGZ5wg9O57iLTFJjsejGpnpVe1+PFRfnjLC
	 HxBYNl0LLGedavVAA9DnZf0qNpQzFzzBbQUQ79EbSje2FWewE5aAA4MQWSnigr+sxw
	 EFEtO9+n1JXoA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Tgy684NQzz4wcv; Fri, 23 Feb 2024 15:42:08 +1100 (AEDT)
Date: Fri, 23 Feb 2024 15:41:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Yves-Alexis Perez <corsac@debian.org>,
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v2] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <ZdgiBAEvvr731H7c@zatzit>
References: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
 <ZdbqaoTUfBmSlC98@zatzit>
 <oitc63fe3agrg2vwgml6x652uo4dqst3m6kbaiu4rs3sbqnco4@rylqo655o4m5>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rkx3RUX24Or/PNqw"
Content-Disposition: inline
In-Reply-To: <oitc63fe3agrg2vwgml6x652uo4dqst3m6kbaiu4rs3sbqnco4@rylqo655o4m5>


--rkx3RUX24Or/PNqw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 10:38:54AM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Feb 22, 2024 at 05:32:10PM +1100, David Gibson wrote:
> > On Fri, Feb 16, 2024 at 07:19:20PM +0100, Uwe Kleine-K=F6nig wrote:
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
> > > +		const fdt32_t *fixup_val;
> > > +                const char *tree_val;
> > > +                const char *name;
> > > +                int fixup_len;
> > > +                int tree_len;
> > > +                int i;
> > > +
> > > +                fixup_val =3D fdt_getprop_by_offset(fdto, fixup_prop,
> > > +                                                  &name, &fixup_len);
> > > +                if (!fixup_val)
> > > +                        return fixup_len;
> > > +
> > > +                if (fixup_len % sizeof(uint32_t))
> > > +                        return -FDT_ERR_BADOVERLAY;
> > > +                fixup_len /=3D sizeof(uint32_t);
> > > +
> > > +                tree_val =3D fdt_getprop(fdto, tree_node, name, &tre=
e_len);
> > > +                if (!tree_val) {
> > > +                        if (tree_len =3D=3D -FDT_ERR_NOTFOUND)
> > > +                                return -FDT_ERR_BADOVERLAY;
> > > +
> > > +                        return tree_len;
> > > +                }
> > > +
> > > +		for (i =3D 0; i < fixup_len; i++) {
> > > +			fdt32_t adj_val;
> > > +			uint32_t poffset;
> > > +
> > > +			poffset =3D fdt32_to_cpu(fixup_val[i]);
> >=20
> > You can use fdt32_ld_() here to slightly simplify this
>=20
> I don't see what you suggest here. fixup_val is assigned to in
> fdt_getprop_by_offset() which I need to get fixup_len and then fixup_val
> is already around. If you still think this could be improved, please be
> more explicit.

	poffset =3D fdt32_ld_(fixup_val + i);

Thus combining the memory read and the byteswap into one operation.  I
guess it doesn't really simplify the code, but correctly handling
reads and writes to memory within the dtb is what the fdt*_ld() and
fdt*_st() helpers are for.

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

Specifically
	adj_val =3D fdt32_ld(tree_val + poffset)

And then replacing fdt32_to_cpu(adj_val) with just adj_val below.

> >=20
> > > +
> > > +			if (fdt32_to_cpu(adj_val) =3D=3D fdto_phandle) {
> > > +
> > > +				adj_val =3D cpu_to_fdt32(fdt_phandle);
> > > +
> > > +				ret =3D fdt_setprop_inplace_namelen_partial(fdto,
> > > +									  tree_node,
> > > +									  name,
> > > +									  strlen(name),
> > > +									  poffset,
> > > +									  &adj_val,
> > > +									  sizeof(adj_val));
> > > +				if (ret =3D=3D -FDT_ERR_NOSPACE)
> > > +					return -FDT_ERR_BADOVERLAY;
> > > +
> > > +				if (ret)
> > > +					return ret;
> >=20
> > And here you can use fdt32_st() on (tree_val + poffset), avoiding
> > quite some complexity.
>=20
> There is some complexity because tree_val is a const char * (as this is
> what fdt_getprop() returns) and fdt32_st() obviously doens't take a
> const pointer.

Ah, right.  You can use fdt_getprop_w() to get a writable pointer
instead.  If there was a way to have fdt_getprop() return a const
pointer only if the fdt pointer it was given was const, I'd do that.

> If you want to play around with that, the code is mostly a copy of
> overlay_update_local_node_references() which could benefit from your
> suggestions in the same way.

That's quite plausible.

> Can I lure you in improving overlay_update_local_node_references()? Then

Fair point..

https://github.com/dgibson/dtc/commit/24f60011fd43683d8e3916435c4c726e9baac=
9c9

> I could copy from the improved function for my patch. (Or maybe refactor
> the function to take a function as parameter which is

Eh... I'd prefer to avoid higher order functions in something this low
level.

> 	uint32_t delta;
> 	uint32_t increase_by_delta(uint32_t phandle)
> 	{
> 		return phandle + delta;
> 	}
>=20
> for the overlay_update_local_node_references() case and
>=20
> 	uint32_t fdt_phandle;
> 	uint32_t fdto_phandle;
> 	uint32_t resolve_fdt_conflict(uint32_t phandle)
> 	{
> 		if (phandle =3D=3D fdto_phandle)
> 			return fdt_phandle;
> 		else
> 			return phandle;
> 	}
>=20
> for my function (maybe passing the data stored in global vars here in a
> context parameter).
>=20
> Best regards
> Uwe
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rkx3RUX24Or/PNqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmXYIe8ACgkQzQJF27ox
2Gd1Uw//V2RgQA8lQcwTqcAgi5j3/ybhl9rye1I1sc48+lIJArEpqZShPZz2L9cC
8XuyoOjXnjx+PC/DBvenL3iEVyLu8M3ZJalFhmesekjNiYrey7mi3gEO0q1NCzwR
aQxDkqp7sYnExPGs8q7lqyTzvDnr+F6fyWILrG88wfWckYWhu1HMm0cNUyVwgWot
egS5SwDh2mTiYW57WW+WhyQynRdOzEzKexmV3d87gn8AuLYwomMMrdKjsQVnnbCA
/xFwXcVwXVGhe9ibxp74dIAq+/pQ4Yf8eQa/6UzBp+vAaGucMnEdIgtuudTaZp1m
t71l8qB2iId341zB8Ab8xu0BlrBUpcUCrY1jQmsWeonJgUuL4fzg4DpgiXaMyV/t
2VM2joniT27bWC+6iOqDJ3yHi+NlFxl+zs9PWMgH01EwHUjGOjAuFe2maW6TXqrR
ooYM2Ecp3u02uMvbgriuENA1dKMWcNXNMWzVIq6hcP3ofpMsKQKgzhWNfp7jIKiD
heokJSigHD8FakQbgzy65FEgo9TnVznRJB285nIMx7U6vqqOEmEpxDsT1CxYrRS0
lJfAP+2KLlLoyqASMhguP0Ew0+7rtP3Pq3r/022gpaa9FQ8TrwWpTkx6E0IOnTN2
KpIU761126tjENWJffXatkis09KVtKo/I/oxuWyRWHkOqvFzKFY=
=NDkb
-----END PGP SIGNATURE-----

--rkx3RUX24Or/PNqw--
