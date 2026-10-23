Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792718726;
	b=mg0Cza4cnmfaA82Cp/p9/bzaH51LUkdCBhIp/js5ag3i8I2gXYro0vu684LUNc2rsODZ
	 qhe7eUA2RpLYXU91ShxoJZwyw2QH6mseIT6pkr2xWPL+Gcln2qulKn75Hc3rC80C/1Xvm
	 d9roEviUf5FFxanTJV1L/n1nPc+e7sfhN5kVBM5QD/xb3fCTmKsuXIR5Fv9EAjk9SylSf
	 5zIDKXh52lTrBXi92g1x/smTxUXs7kc1mo50N5vv4OTal59A7uDT0IWxRDIBcmIPC90rB
	 2Bz2yqbxNcNSPdmy4VLEVgWHCXu+1RhADlIVbPy1o7/EXI8C95x8ust8PhFwsQ98sog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792718726;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=HW7n87NQFv77NFrN0KHBaQXhU1P6Kz/IXuxZlDEyv0k=;
	b=hxBYSuHJ0txcXaAG93EvMyASWkz0gZs3jjIUWO8f+RTMIetLLkkcXte7PapsRwPnaEUR
	 hp4/kRdU2Bo5M+ORaPTz+A/L+EN15UdV3t69VBo7TXXGVQE695/CpSFsw2IrvRDxRMDSH
	 sMYFxeJjxDTnUbUVMC7XO+n3LUSzqWFIrBNpCMfvRbkniFHTRMK3jv51IIVij8FJqtKRP
	 lCFRWaSzFBFYevy5W9qZ5P2wl+4vKOeFIvosjJf0yuUesPmYwI67Wl9bVmJ3ufRvog+6I
	 Qy/LOfvp7FSrY0TSqc3bfCEPDIkeLCRF290x8eTSC+l3+z4rW5YvT+8KNnppBiQyqkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5AB606A319;
	Fri, 23 Oct 2026 01:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD5AB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792718721;
	bh=HW7n87NQFv77NFrN0KHBaQXhU1P6Kz/IXuxZlDEyv0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGaNeA74u7hIZ44+MyFFnCrILDe8X+ErY6U/fzdZ4RNYn/TmcX7wYh9UJ0NT3WSnI
	 26P4rsf86BkenifhRTKlQHyniR2igQ3h9TRtpGZAHbGBDoW5Ph33Uj5VWpoCIQpA7N
	 i2aAejXFn8FucmFax1B9nNVUJBhNFt7urk8nODHfXRfzsvddfnK2v4qvih70/qi3Uz
	 +Uotf6o0yka65Y4HZC/PPkIn+07kpD7cBVpkFt0OR0rTZKAOWAKlV5tcb8/iDzm2BX
	 JEwFJziWJbeNxvs3QWs//ZnbLesj8yQ9Q7LudrxDwjJXKnQyWTqPpD2/FkWPb5zvlI
	 cr8KckjIUPBBQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j9lh141Rkz4w9g; Fri, 23 Oct 2026 12:25:21 +1100 (AEDT)
Date: Fri, 23 Oct 2026 12:23:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 07/74] Add support for FDT_PROPDATA_PHANDLE dtb tag
Message-ID: <atq3H0Ts4wTBTVCV@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-8-herve.codina@bootlin.com>
 <atgtw8QubzVfWMYP@gractus.seuss>
 <20261021192615.1f5b91ff@bootlin.com>
 <atl8nkrGFvhWRqDr@gractus.seuss>
 <20261022114741.31171b04@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8XxTctslv4XTfxt7"
Content-Disposition: inline
In-Reply-To: <20261022114741.31171b04@bootlin.com>

--8XxTctslv4XTfxt7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 11:47:41AM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 22 Oct 2026 14:02:05 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
>=20
> > > What do you think is clunky ?
> > > Is it the PROPDATA term itself ? =20
> >=20
> > Pretty much yes.
> >=20
> > After the explanation above, I think I'm ok with FDT_PROPDATA_PHANDLE.
>=20
> Ok, I will keep it (and FDT_PROPDATA_PHANDLE_REF).
>=20
> ...
>=20
> > > > > -static struct data data_append_markers(struct data d, struct mar=
ker *m)
> > > > > +struct data data_append_markers(struct data d, struct marker *m)
> > > > >  {
> > > > >  	struct marker **mp =3D &d.markers;
> > > > > =20
> > > > > @@ -288,6 +288,7 @@ struct marker *alloc_marker(unsigned int offs=
et, enum markertype type,
> > > > >  	m->type =3D type;
> > > > >  	m->ref =3D ref;
> > > > >  	m->next =3D NULL;
> > > > > +	m->is_local =3D 0;   =20
> > > >=20
> > > > Storing is_local in the marker doesn't make sense to me.  I think t=
he
> > > > locality should be calculated only when we actually go to emit the =
dtb
> > > > - I believe we should be able to deduce it from m->ref. =20
> > >=20
> > > When we parse a dtb, we do not have any reference for local phandle, =
we have
> > > only the phandle value. =20
> >=20
> > Heh, right, I remarked on that further down.
> >=20
> > > Later in build_dt_info(), complete_references() is called. This new f=
unction
> > > is introduced in patch 9 ("dtc: Complete REF_PHANDLE markers with ref=
 strings
> > > and is_local flags"). It completes the reference either filling the r=
ef field
> > > based on the phandle value for all local reference (parsing from a dt=
b) or
> > > setting is_local based on the reference (parsing from a dts). =20
> >=20
> > Ah, right having that logic in a different patch makes it harder to
> > follow.
> >=20
> > What concerns me here is that currently we have an invariant that a
> > REF_PHANDLE marker always has a meaningful m->ref field - from as soon
> > as it's added to the property data.
> >=20
> > This patch breaks that assumption, which means when looking at some
> > random part of the code it's hard to know whether we're in a state
> > where m->ref is valid or it might not me.
> >=20
> > One approach is to minimise the gap where m->ref is invalid.  That's
> > both in terms of code path - at minimum the m->ref fields should be
> > valid by return from dt_from_*().  It's also in terms of not leaving
> > intermediate patches where this is not fixed up.
> >=20
> > The other approach would be to create new marker types indicating
> > these intermediate states.  The markers are for dtc internal use, they
> > don't need to have 1 to 1 correspondance with things in either dtb or
> > source format.
>=20
> I don't want to introduce new markers for handling intermediate states.
>=20
> I really prefer avoiding those kind of "fake" marker which will have
> a short lifetime and should not be seen by code (other than the code
> moving this intermediate state to the final state).
>=20
> My strategy was to ensure that once build_dt_info() is called, all
> markers are fully correct with all field (is_local and ref) correctly
> set.
>=20
> build_dt_info() is called by all parser at the end of the parsing
> operation to return a struct dt_info which is the dtc internal
> internal representation used by the rest of code.
>=20
> Are you ok with this strategy?

Having transitional states that don't last beyond build_dt_info() is
acceptable in principle, however:

  1) That leaves m->is_local and m->ref redudant after that point,
     which I don't like very much
  2) As of this patch specifically, that's not the case.  I don't want
     to have intermediate commits where this invariant is not
     preserved (it's bad for bisects).

> If yes, patches order in this series will be changed.
>=20
> The current order is
>  - Patch 7: Add support for FDT_PROPDATA_PHANDLE dtb tag
>  - Patch 8: livetree: Improve get_node_by_phandle()
>  - Patch 9: dtc: Complete REF_PHANDLE markers with ref strings and is_loc=
al flags
>=20
> With that order we have the incomplete marker state present after patch 7=
 and
> before patch 9.
>=20
> Moving 'Add support for FDT_PROPDATA_PHANDLE dtb tag' after introducing t=
he marker
> state completion will avoid the problem.
>  - Patch 7: livetree: Improve get_node_by_phandle()
>  - Patch 8: dtc: Complete REF_PHANDLE markers with ref strings and is_loc=
al flags
>  - Patch 9: Add support for FDT_PROPDATA_PHANDLE dtb tag
>=20
> Patch 8 and 9 could be squashed if you prefer to have the completion added
> in the 'Add support for FDT_PROPDATA_PHANDLE dtb tag' patch.

That sounds ok, though I think I'll have to look at the final result
to be sure.  I would prefer 8 & 9 be merged together for
reviewability.  That said, the libfdt parts of the changes could be
split out into an earlier patch than the dtc parts to keep the sizes
smaller.

> > It seems to me there's an important difference between the -Idts and
> > -Idtb cases: in the dts case, we have a valid reference, but the
> > phandle needs to be filled in later; in the dtb case, we have a valid
> > phandle, but the reference needs to be filled in later.  Using
> > different marker types for those cases doesn't seem unreasonable for
> > me.  In fact, for clarity it might even make sense to have a third
> > variant for "both phandle and m->ref are valid" - the fixup code
> > between input and output would convert either of the first two
> > variants into the third, which is what the final output code would
> > require.
> >=20
> > That's not necessarily the best way to do it, but I really prefer
> > where what's valid in a structure can be determined from the type and
> > contents alone - rather than having to know where you are in a complex
> > code path to know what's valid.
>=20
> Performing marker completion in build_dt_info() avoid additional markers
> and avoid also incomplete markers in the code path.
>=20
> Before build_dt_info() call, the internal devicetree representation doesn=
't
> exits for dtc. We are in the process of parsing and so we are building th=
is
> internal representation. After this call, the internal representation exi=
sts
> and all markers are fully set without the need to introduce (and handle)
> additional markers.
>=20
> In other word, dti returned by all dt_from_*() functions returns a fully
> complete dt_info.
> --- 8< ---
> 	if (streq(inform, "dts"))
> 		dti =3D dt_from_source(arg);
> 	else if (streq(inform, "fs"))
> 		dti =3D dt_from_fs(arg);
> 	else if(streq(inform, "dtb"))
> 		dti =3D dt_from_blob(arg);
> 	else
> 		die("Unknown input format \"%s\"\n", inform);
> --- 8< ---
>=20
> User of this dti will never see an incomplete marker.

Ok, that works.

> ...
>=20
> ...
> > > > > +		case FDT_PROPDATA_PHANDLE:
> > > > > +			if (!(flags & FTF_PROPDATA_PHANDLE))
> > > > > +				die("PROPDATA_PHANDLE tag found in flat tree"
> > > > > +				    " version <20\n");
> > > > > +
> > > > > +			if (!prop)
> > > > > +				die("PROPDATA_PHANDLE tag found without a previous PROP tag"=
);
> > > > > +
> > > > > +			offset =3D flat_read_word(dtbuf);
> > > > > +
> > > > > +			/*
> > > > > +			 * A reference to a phandle is present in the property
> > > > > +			 * Mark the whole property as TYPE_UINT32.
> > > > > +			 */
> > > > > +			property_add_marker(prop, TYPE_UINT32, 0, NULL);
> > > > > +
> > > > > +			/* Mark the offset as a local phandle reference */
> > > > > +			m =3D alloc_marker(offset, REF_PHANDLE, NULL);
> > > > > +			m->is_local =3D true;
> > > > > +			prop->val =3D data_append_markers(prop->val, m);   =20
> > > >=20
> > > > This doesn't properly populate m->ref which is an essential field i=
n a
> > > > REF_PHANDLE marker.  Of course, doing so is kind of tricky - it
> > > > requires searching for the node with the referenced phandle, which
> > > > might not have been parsed yet.  So, alas, it will require a second
> > > > pass to fix up the REF_PHANDLE markers. =20
> > >=20
> > > We cannot do it here. The whole dtb needs to be parsed to set correct=
ly
> > > m->ref. =20
> >=20
> > Right, that's what I mean by a second pass.
> >=20
> > > This is done by complete_references() introduced in patch 9. =20
> >=20
> > Yeah, as above I don't like leaving this structure in a potentially
> > incomplete state for several patches.
>=20
> Patch re-ordering proposed above will fix this problem.

Ok.  Note that=20

> ...
> > > > Need to check for overflows here. =20
> > >=20
> > > What do you think about
> > > 	if ((tmp + sizeof(fdt32_t) < tmp) ||
> > > 	    (uint32_t)proplen < tmp + sizeof(fdt32_t))
> > > 		return -FDT_ERR_???
> > > Probably using an uint32_t for tmp here. =20
> >=20
> > That'd work, but it might be more natural to use:
> > 	if (proplen < sizeof(fdt32_t) ||
> > 	    tmp < 0 ||
> > 	    tmp > proplen - sizeof(fdt32_t))
> > 		return <error>;
> >=20
> > That lets tmp remain an 'int'.  Using 'int' for offsets is sometimes
> > problematic, but it's a convention that's now pretty baked into the
> > libfdt interface.  Note that offsets encoded into the dtb are required
> > to be < 2^31, not just < 2^32.
>=20
> Fine, will do what you've suggested.
>=20
> >=20
> > >  =20
> > > >  =20
> > > > > +				return -FDT_ERR_BADSTRUCTURE;   =20
> > > >=20
> > > > I'm not sure BADSTRUCTURE makes sense for this.  I think it's proba=
bly
> > > > worth adding a new error code for bad metadata tags. =20
> > >=20
> > > #define FDT_ERR_BADMETADATA	20
> > > 	/* FDT_ERR_BADMETADATA: The device tree has corrupt metadata. */
> > >=20
> > > Is it ok on your side ? =20
> >=20
> > Works for me.
>=20
> Perfect.
>=20
> >=20
> > > > > +
> > > > > +			/* Retrieve the phandle value from the property */
> > > > > +			pfdt32 =3D prop;
> > > > > +			pfdt32 +=3D tmp / sizeof(fdt32_t);   =20
> > > >=20
> > > > Again, this will need updating for non-aligned phandles. =20
> > >=20
> > > Will handle unaligned offset.
> > >  =20
> > > >  =20
> > > > > +			val =3D fdt32_ld(pfdt32);   =20
> > > >=20
> > > > ... which reminds me the entire fdt32_ld() interface is kind of
> > > > broken.  They're specifically intended to handle misaligned accesse=
s,
> > > > strictly speaking it's already UB to generate a misaligned pointer,=
 so
> > > > there's a problem before we even call it.  Fixing this within API/A=
BI
> > > > constraints is a nasty problem :(. =20
> > >=20
> > > I can introduce and use the following:
> > > ---- 8< ----
> > > static inline uint32_t fdt32_ld_unaligned(const uint8_t *pfdt32)
> > > {
> > > 	return ((uint32_t)b[0] << 24)
> > > 		| ((uint32_t)b[1] << 16)
> > > 		| ((uint32_t)b[2] << 8)
> > > 		| b[3];
> > > }
> > > ---- 8< ---- =20
> >=20
> > Uh.. I'd rather not handle the fdt32_ld() mess at the same time as
> > dealing with the addon stuff.  For now I think use fdt32_ld(), and
> > continue to rely on the fact that in practice creating (but not
> > dereferencing) misaligned fdt32_t * pointers is generally fine.
>=20
> Ok, will keep fdt32_ld().
>=20
> ...
> > > > >   * be set to the offset immediately following the tag.
> > > > >   *
> > > > >   * returns:
> > > > > - *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP=
, FDT_END),
> > > > > + *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP=
, FDT_END
> > > > > + *	or any other known tags),   =20
> > > >=20
> > > > This hunk looks like it belongs in an earlier patch. =20
> > >=20
> > > Well we add FDT_PROPDATA_PHANDLE and this is the first known tag adde=
d other
> > > the existing ones already listed. Do you prefer an exhaustive list of=
 known tags?
> > >=20
> > > Also worth noting that fdt_next_tag() can return all unknown struture=
d tags that
> > > can be skipped this has to be mentioned in the series adding support =
for structured
> > > tag. =20
> >=20
> > Ah, yes.  Probably easiest to revise this to remove the complete
> > listing of tags at the point we introduce structured tags.
>=20
> Will update in the next iteration of the structured tag series and so no
> modification will be present here in this support for addon series.
>=20
> What do you thing about:
> --- 8< ---
> 	/**
> 	 * fdt_next_tag - get next tag in the device tree
> 	...
> 	* returns:
>  	*	The tag type, either a known tag or an unknown structured tag
> 	*       if this unknown tag can be skipped (SAFE_SKIP bit set in this
> 	*       tag).
> 	*	In case of error, FDT_END is returned with @nextoffset set to
> 	*	a negative error code.
>  	*/
> --- 8< ---

I don't think the extra detail really helps much - just "The tag
type." would be fine, I think.

> I suppose here, that you're ok to re-introduce SAFE_SKIP bit in structure=
d tags
> format. Asked in [1] and you don't reply yet.

Right, I'm aware, just haven't gotten to it yet.

>=20
> [1]: https://lore.kernel.org/devicetree-compiler/20261021155923.55e48904@=
bootlin.com/
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--8XxTctslv4XTfxt7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmratx8ACgkQzQJF27ox
2GebGA/+IFky6Uvs1jBRBmivCMmkFXY0YcubZmFJW5OIRSC+sm8bS2BKrvs4pSn5
07IlXEPdUxrgHf+uKvCliByhuswbA5/FWSaX+3ktx+B05R7mu7BpoXqwwuuZwmbv
MYmhcbvUYbIq8lKiHib0SbqeF6FDqqQkpWYnUx3Kwj98xNToAPkugVwLivUMIV9a
LKEBUdcM4QV3ZUgstGsokWVu4GXXx327ONFkRDM8iDs+nUWZKxdPQ9EG60eEKDq4
zbeq7Qy/8ujNi6mPy/IEzB3kgfBEtIp1ev2czd7B9OJakO0veThPHTxiQoAEf1vT
eD2ecFsf7U4rJUZ5Rxo0lit43xxiswhOYjRXDj7UAHQUVAG2jUEo6nttVHSWAoIZ
8NFT9esRKXijR00RLzeb5rgGayS49iYmKYgu2yyb1HoS4RLs39HDAdzYGpZ5oYq1
Z7vt4Z+OUjtc9oB/vOdoYk7rvH9TTp/zb8E0u7bXkQpn5IB6cKAi7tbveWO8eogz
rtw0GSGvqQ6ebirIQKTctVmpOj11zmKF2IN7oy74Srq0C9vz5WT/koJUOZuBKiUp
TE01dPZdugo92CYBQqya5RQSbQXN4HFsbfc1qnOTZTV49T92dt0jXK3szFQy9QA7
4T81nLAEl5TQcbATYiGODy8xtPRK8zBS7j/3WVEuB25lwCIfNLE=
=p9tE
-----END PGP SIGNATURE-----

--8XxTctslv4XTfxt7--
