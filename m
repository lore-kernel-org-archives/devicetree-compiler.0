Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792990311;
	b=L5AmCx6mX69UwgPjPRQsPog5OSFAb77D6fO9sZRwVS8o/5nh4c2gzAgEIFaUJSyu7vB+
	 tzGpXbkR7OVf7sqT6pSVc+qOOMs0leHSJPipNi7o3QER/mXInebHInI3baR0aaiGW3Oan
	 K5wL7c0BB1nWUeU34jjzEvqPN6MyRxuzInnHArDj/LfzaHCL1ff1VoGncpLmT02ySvHpg
	 XvTriTW9HS8nihS37fxrsgG+yj3B4R9XqAQq+AEyJz3R2VqVNRgnK479iv5Olr4cGInh/
	 PAPGzHdMNTaRoN4e9/cjADqtiBmsnKXiAikgsENfyGHlCIJrM7QRf7RXbogNozUiUlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990311;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=f9r1ZE6effix1uzB18resIhatR8ycz7JQ1ggkOa4O88=;
	b=wbmM1hajxkv1Xm+rcxuYaCn1rbIhqTL6OUonPkLnQkzV2ZHr8V3jUTY+69YaX+cK+G2V
	 IRSjCrbIfVFKCDZhGHN5DtptzagBlGyZV0XK3ph466tO0SpHeTPBBg6nRvxKhheQpN6Ut
	 m0O5aKrMg6k+6Yg7Sb27py2TTlDbSd75PxVGVzwI99ym2ehJFGIFbq2j7v2MKBx3xx4rv
	 aRO31HVL9UBqGzRfFR8t+zq6UOMFFdqpuUPX7E1GRGN6Ymcb/jjjzkaVTwcRonO1T6SmN
	 JgA85G0KtoZ8Du6XVdl5hyDyY8w4I1F1wjPMY8nHwAoYyMjLbGnaaxqmHrhxku09EMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=f9StagWW;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28778606A31F;
	Mon, 26 Oct 2026 04:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28778606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=f9StagWW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792990301;
	bh=f9r1ZE6effix1uzB18resIhatR8ycz7JQ1ggkOa4O88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9StagWW0nAEcYQIgrgW4wcax1b4PLYY3ziRWiJoHqkssAxqs0B+aDzAhivSa3TKP
	 sx8a4G3l1dOaT8bvS1/JvbAKJvVDSmXya55rDCYpN4dU7jD6Z+1LWdgaKzw4mzDJSD
	 JoxgmnaPd1ogKlquw45GcLRCM0eJmi7uCoyM1PZ7XcmDyoei1Vd4MZYpamjUnWzIlv
	 SHNk31OO4x33yvnoAoEgKwj+gO+wvl+kxHJ6akduaAm+mzf6gPOXGWQF8lAUeypW01
	 AGXIBwRjKotH7oCjbnml4vyrWVBF1B0aLQrzyPrzoUzZeUGtltN8asOL3rKD9y1nQY
	 yzonNBUjyYpCg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jCh6j3b9cz4wHs; Mon, 26 Oct 2026 15:51:41 +1100 (AEDT)
Date: Mon, 26 Oct 2026 12:30:31 +1100
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
Message-ID: <at6tLoIGUblHcEBz@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-8-herve.codina@bootlin.com>
 <atgtw8QubzVfWMYP@gractus.seuss>
 <20261021192615.1f5b91ff@bootlin.com>
 <atl8nkrGFvhWRqDr@gractus.seuss>
 <20261022114741.31171b04@bootlin.com>
 <atq3H0Ts4wTBTVCV@gractus.seuss>
 <20261023132949.4fc3072b@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="5UZzi/wIDVoUkAnO"
Content-Disposition: inline
In-Reply-To: <20261023132949.4fc3072b@bootlin.com>

--5UZzi/wIDVoUkAnO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 01:29:49PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Fri, 23 Oct 2026 12:23:58 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
>=20
> > > > > > > -static struct data data_append_markers(struct data d, struct=
 marker *m)
> > > > > > > +struct data data_append_markers(struct data d, struct marker=
 *m)
> > > > > > >  {
> > > > > > >  	struct marker **mp =3D &d.markers;
> > > > > > > =20
> > > > > > > @@ -288,6 +288,7 @@ struct marker *alloc_marker(unsigned int =
offset, enum markertype type,
> > > > > > >  	m->type =3D type;
> > > > > > >  	m->ref =3D ref;
> > > > > > >  	m->next =3D NULL;
> > > > > > > +	m->is_local =3D 0;     =20
> > > > > >=20
> > > > > > Storing is_local in the marker doesn't make sense to me.  I thi=
nk the
> > > > > > locality should be calculated only when we actually go to emit =
the dtb
> > > > > > - I believe we should be able to deduce it from m->ref.   =20
> > > > >=20
> > > > > When we parse a dtb, we do not have any reference for local phand=
le, we have
> > > > > only the phandle value.   =20
> > > >=20
> > > > Heh, right, I remarked on that further down.
> > > >  =20
> > > > > Later in build_dt_info(), complete_references() is called. This n=
ew function
> > > > > is introduced in patch 9 ("dtc: Complete REF_PHANDLE markers with=
 ref strings
> > > > > and is_local flags"). It completes the reference either filling t=
he ref field
> > > > > based on the phandle value for all local reference (parsing from =
a dtb) or
> > > > > setting is_local based on the reference (parsing from a dts).   =
=20
> > > >=20
> > > > Ah, right having that logic in a different patch makes it harder to
> > > > follow.
> > > >=20
> > > > What concerns me here is that currently we have an invariant that a
> > > > REF_PHANDLE marker always has a meaningful m->ref field - from as s=
oon
> > > > as it's added to the property data.
> > > >=20
> > > > This patch breaks that assumption, which means when looking at some
> > > > random part of the code it's hard to know whether we're in a state
> > > > where m->ref is valid or it might not me.
> > > >=20
> > > > One approach is to minimise the gap where m->ref is invalid.  That's
> > > > both in terms of code path - at minimum the m->ref fields should be
> > > > valid by return from dt_from_*().  It's also in terms of not leaving
> > > > intermediate patches where this is not fixed up.
> > > >=20
> > > > The other approach would be to create new marker types indicating
> > > > these intermediate states.  The markers are for dtc internal use, t=
hey
> > > > don't need to have 1 to 1 correspondance with things in either dtb =
or
> > > > source format. =20
> > >=20
> > > I don't want to introduce new markers for handling intermediate state=
s.
> > >=20
> > > I really prefer avoiding those kind of "fake" marker which will have
> > > a short lifetime and should not be seen by code (other than the code
> > > moving this intermediate state to the final state).
> > >=20
> > > My strategy was to ensure that once build_dt_info() is called, all
> > > markers are fully correct with all field (is_local and ref) correctly
> > > set.
> > >=20
> > > build_dt_info() is called by all parser at the end of the parsing
> > > operation to return a struct dt_info which is the dtc internal
> > > internal representation used by the rest of code.
> > >=20
> > > Are you ok with this strategy? =20
> >=20
> > Having transitional states that don't last beyond build_dt_info() is
> > acceptable in principle, however:
> >=20
> >   1) That leaves m->is_local and m->ref redudant after that point,
> >      which I don't like very much
>=20
> Ok I've looked deeper to remove the is_local field. It should be doable.
>=20
> complete_references(), probably renamed to fixup_references(), will still=
 be
> needed

Right, I'd expect that.

> and called from build_dt_info().

This I'm less certain about, since the function needs to fix up in
opposite directions depending on the input mode.  But, I'll look at
the patch once it's posted.

> Indeed, all refs need to point to a
> valid string (path or label).
>=20
> The idea removing is_local is to have the transitional state where ref ca=
n be NULL.
> (REF_PHANDLE created from FDT_PROPDATA_PHANDLE where no ref are available=
 but just
> the phandle value).
>=20
> Those NULL ref, identifying a local phandle, will be updated by fixup_ref=
erences()
> called from build_dt_info().
>=20
> I plan also to remove the is_local field from export symbols structure. I=
ndeed, the
> exact same problematic exist with export symbol and related to this 'is_l=
ocal' topic
> REF_PHANDLE markers and export symbols have no reason to be handled in a =
different
> way.

Ok.  I'll keep that in mind once I start looking at those patches.

> I plan to introduce an new function:
>     bool ref_is_local(struct dt_info *dti, const char *ref)
> in order to determine if a given reference is local or not.

Sounds good.

> As you already stated, this will be needed to emit the correct tag in the=
 output dtb.
>=20
> This function will walk the tree, no way to avoid that with a 'is_local' =
flag.

Ok.

> >   2) As of this patch specifically, that's not the case.  I don't want
> >      to have intermediate commits where this invariant is not
> >      preserved (it's bad for bisects).
> >=20
> > > If yes, patches order in this series will be changed.
> > >=20
> > > The current order is
> > >  - Patch 7: Add support for FDT_PROPDATA_PHANDLE dtb tag
> > >  - Patch 8: livetree: Improve get_node_by_phandle()
> > >  - Patch 9: dtc: Complete REF_PHANDLE markers with ref strings and is=
_local flags
> > >=20
> > > With that order we have the incomplete marker state present after pat=
ch 7 and
> > > before patch 9.
> > >=20
> > > Moving 'Add support for FDT_PROPDATA_PHANDLE dtb tag' after introduci=
ng the marker
> > > state completion will avoid the problem.
> > >  - Patch 7: livetree: Improve get_node_by_phandle()
> > >  - Patch 8: dtc: Complete REF_PHANDLE markers with ref strings and is=
_local flags
> > >  - Patch 9: Add support for FDT_PROPDATA_PHANDLE dtb tag
> > >=20
> > > Patch 8 and 9 could be squashed if you prefer to have the completion =
added
> > > in the 'Add support for FDT_PROPDATA_PHANDLE dtb tag' patch. =20
> >=20
> > That sounds ok, though I think I'll have to look at the final result
> > to be sure.  I would prefer 8 & 9 be merged together for
> > reviewability.  That said, the libfdt parts of the changes could be
> > split out into an earlier patch than the dtc parts to keep the sizes
> > smaller.
>=20
> Ok, I will merge and extract libfdt related parts to a specific patch.
>=20
> >=20
> > > > It seems to me there's an important difference between the -Idts and
> > > > -Idtb cases: in the dts case, we have a valid reference, but the
> > > > phandle needs to be filled in later; in the dtb case, we have a val=
id
> > > > phandle, but the reference needs to be filled in later.  Using
> > > > different marker types for those cases doesn't seem unreasonable for
> > > > me.  In fact, for clarity it might even make sense to have a third
> > > > variant for "both phandle and m->ref are valid" - the fixup code
> > > > between input and output would convert either of the first two
> > > > variants into the third, which is what the final output code would
> > > > require.
> > > >=20
> > > > That's not necessarily the best way to do it, but I really prefer
> > > > where what's valid in a structure can be determined from the type a=
nd
> > > > contents alone - rather than having to know where you are in a comp=
lex
> > > > code path to know what's valid. =20
> > >=20
> > > Performing marker completion in build_dt_info() avoid additional mark=
ers
> > > and avoid also incomplete markers in the code path.
> > >=20
> > > Before build_dt_info() call, the internal devicetree representation d=
oesn't
> > > exits for dtc. We are in the process of parsing and so we are buildin=
g this
> > > internal representation. After this call, the internal representation=
 exists
> > > and all markers are fully set without the need to introduce (and hand=
le)
> > > additional markers.
> > >=20
> > > In other word, dti returned by all dt_from_*() functions returns a fu=
lly
> > > complete dt_info.
> > > --- 8< ---
> > > 	if (streq(inform, "dts"))
> > > 		dti =3D dt_from_source(arg);
> > > 	else if (streq(inform, "fs"))
> > > 		dti =3D dt_from_fs(arg);
> > > 	else if(streq(inform, "dtb"))
> > > 		dti =3D dt_from_blob(arg);
> > > 	else
> > > 		die("Unknown input format \"%s\"\n", inform);
> > > --- 8< ---
> > >=20
> > > User of this dti will never see an incomplete marker. =20
> >=20
> > Ok, that works.
>=20
> Fine.
>=20
> ...
>=20
> > >=20
> > > What do you thing about:
> > > --- 8< ---
> > > 	/**
> > > 	 * fdt_next_tag - get next tag in the device tree
> > > 	...
> > > 	* returns:
> > >  	*	The tag type, either a known tag or an unknown structured tag
> > > 	*       if this unknown tag can be skipped (SAFE_SKIP bit set in this
> > > 	*       tag).
> > > 	*	In case of error, FDT_END is returned with @nextoffset set to
> > > 	*	a negative error code.
> > >  	*/
> > > --- 8< --- =20
> >=20
> > I don't think the extra detail really helps much - just "The tag
> > type." would be fine, I think.
>=20
> Ok on my side, I will remove the detail.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--5UZzi/wIDVoUkAnO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrerS4ACgkQzQJF27ox
2Gc5ZA//RFSzhc3frY0NIu5OWq2dLeSQYr/M4+IT2AB40PKNO+au+DFaaHKHXjBY
93TM+A3gB720eJGT2jc+JlVvYu6/+ak/YIMjyXMn/dmyTnzotvgvRb4/SQQ2Zh3U
9fmw2BoXFLnE+LuEbTdwJlaLoFWdCeITbdo/IpBsiyHk/NacQOOGvcw8zphWyof1
tnk4Dtc3Q+eXh7uuWzOUatKeqhdt3Ux7SUvcdj9MGNN1q3cL2cB2pjNPuFVnYP0T
iLuQ/McfAKlWApSdFJUupAgwGxAN/1NgHhvBX51z77oY7Hr4p9dXQO/1lPlUMc9c
ddDUOvG8HSsv9hzVC8Yu7mpVoI0PSpTlwnr4ckQjsh2o1dPizKhKmaS/Sf+IQj5T
60CI+HyKv3dRs64CpBORhb8MAyYywVqLRSYI9kgFeH1P+YOdTH3eXWbtiIDfg9wr
E7KkTtf2lOQgusmJmuGYDbIAjPwyXaNaZUM27p/bEwFIoM8RFhC4LFcDqI6TNWcH
/eYLHhNMhszQtFoxjZmz5rJQYK6Qn93jkTbyykeemo7pyD75j3WAu05Hqk4VDZca
oZFg6RFEDVBKGiwf65x6A9ixQ65H9arhVYIKgXGD2v5C3F8pbORWAaSA2y62Rdok
jKKfCQI+EPlXqev4G0/FVrCkgpDUqGSf5CYBMxkMMi5f14dZFkk=
=NKs8
-----END PGP SIGNATURE-----

--5UZzi/wIDVoUkAnO--
