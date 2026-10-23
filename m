Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792724293;
	b=pfWaP0vXx+M0dvUaQMhXS/UYC4qey8PldE5+7VKgFTVabBF9045QKa5nKs0niwwPU7lo
	 ZO97Np/Z4f97JA5Uo09aXkjZxMrzduG10EBCeiNGsMrG3IfwoLosr5slRZm468Md7iNUF
	 eSlkc6kT6XYs+7OEnsVce94jGGkWq7YJgP4+iyJnf9yYSinFp4O0IdVGR3Ct67PkSudZB
	 06g6iVZSeO8Tjm72bhBrjJh15jbbGiQDwIrcNOXxXQbFDdlQphGr5Q9hnjgZBmmcVJF7T
	 vj5VfFFx2EGR4ux0CySi6/Ljg7wWULuCwyLg/AV1HrtA0mIinFUPJrIhL3U5UXFk5Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792724293;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=+4ilAPqKfmGCY4wgVLUJIUqUzyw4JAXXVfBhLy0lRDw=;
	b=h43mK0/OdzaqbjPztFuJvv9jrBFCET/gjXRahMO0aL920o4Ns2j+2V90/ck6kg54bFMi
	 9cECTMZ3agSGjWxq5eUQSxU+UkoFohyFqpXRYdUWxWKX7BsCsF/Ok99f4a7GH5d2qVHwz
	 UtTu2HJiOIpQMBWhQMLsVaat6HHH7m8vlIqd9ftrkC5kk80FY6C1xLSi/A6W8g7NDzmgl
	 l3ueHHUyWbfXTOQm/ixTzQbyggDKBhPJN8VF4Pa+D4lWNsob5nGgYtr69hZU9TuG7E8VF
	 jYYayVdTnUh8EfxA73tS9sMKogdy1+C2f6f9WTeAnvGfOaKhPnc4oCrGdFEYjdeoW6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=coJYAhd5;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1928E606A319;
	Fri, 23 Oct 2026 02:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1928E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=coJYAhd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792724288;
	bh=+4ilAPqKfmGCY4wgVLUJIUqUzyw4JAXXVfBhLy0lRDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coJYAhd5b1zSuHF+g7cDj/wkIglV+wLB/Tiv2C4KV3bqSXIvYecoBcgi4wPceh+8s
	 Rh9v14t3L3icErR0D6yXB/vqpMqEuhVYfMCpTBZoBdZ34M+lvIXgCT7sCcnRXxqTOF
	 Dko72iQQSb6OHSQ33QEWWURwre1vsmT/6G/XbrW+EDWLsRSoNMGZKcEXWYcFCgXD1X
	 hxmEUFBgqdvKnN1pFyYLyprD2GSDQWcOUwgBaD2i9WIZDezwPB88mTBzNMVN9I0Wvo
	 kuIXTzxgRZ2pYTVPZX7vem1wnxEW0DVOxCfAczUzqzUl/KTK8v054+jh1BK3sA41lF
	 zcMfbqqM4cedw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j9nl40Mfzz4wC8; Fri, 23 Oct 2026 13:58:08 +1100 (AEDT)
Date: Fri, 23 Oct 2026 13:57:54 +1100
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
Message-ID: <atrNI_hqwxvfsRj7@gractus.seuss>
References: <arDMhoNNXcPi81sR@gractus.seuss>
 <20260925152157.511dc65c@bootlin.com>
 <as3ZWBr3wRonkxXF@gractus.seuss>
 <20261013190347.4f1d9b9d@bootlin.com>
 <atGzdxETQZ9ovJFh@gractus.seuss>
 <20261019151121.26d99f30@bootlin.com>
 <atgi4rMsw5W6kKkS@gractus.seuss>
 <20261021172043.4bbd2bc5@bootlin.com>
 <atmASGg1OZt9jfXI@gractus.seuss>
 <20261022151454.67125e41@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="yNci9GeEh9+GPubB"
Content-Disposition: inline
In-Reply-To: <20261022151454.67125e41@bootlin.com>

--yNci9GeEh9+GPubB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 03:14:54PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 22 Oct 2026 14:17:38 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Oct 21, 2026 at 05:20:43PM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Wed, 21 Oct 2026 13:26:49 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > >=20
> > > > > Ok, my proposal seems to be a no-go and so I will follow your pro=
posal given
> > > > > above.   =20
> > > >=20
> > > > To be clear, I'm rejecting the original proposal because I think it=
's
> > > > internally inconsistent (if you follow the consequences of decisions
> > > > far enough).  I'm not necessarily opposed to something other than t=
he
> > > > above, as long as the rules for when unknown tags must be invalidat=
ed
> > > > (and what that does to the version) are made very clear in the
> > > > structured tag spec.  e.g. see an alternative proposal below. =20
> > >=20
> > > No problem, I understand your point.
> > >=20
> > > ...
> > >  =20
> > > >=20
> > > > Essentially the theory of the proposal above is to be maximally
> > > > conservative: any write (adding, removing, changing, in-place,
> > > > whatever) will invalidate all unknown tags and downgrade the versio=
n.
> > > >=20
> > > >=20
> > > > But, here's an alternative proposal for invalidation/version semant=
ics
> > > > that I think is consistent, while being a bit closer to your origin=
al
> > > > proposal.
> > > >=20
> > > > 1. version and last_comp_version retain their meanings.  No new hea=
der
> > > >    version. =20
> > >=20
> > > Ok
> > >  =20
> > > > 2. If version >=3D 18 the tree may include any structured tags, eve=
n if
> > > >    they weren't defined as of v18. =20
> > >=20
> > > Ok
> > >  =20
> > > > 3. Some future version might _require_ certain structured tags to be
> > > >    present.  But a client must only rely on those tags if the versi=
on
> > > >    indicates it can.
> > > >      - e.g. suppose FDT_FOO tag is introduced in v20.  A client
> > > >        reading a v19 tree _might_ see some FDT_FOO tags (because of
> > > >        (2)), but cannot rely on them being present in all the places
> > > >        they should be. =20
> > >=20
> > > Ok, kind of degraded mode. Whether or not a v20 compatible client can=
 continue
> > > or not will depend of each tags known by this v20 client. For some ta=
gs, having
> > > them removed will not be a problem whereas it will be a problem for s=
ome other. =20
> >=20
> > Exactly.
> >=20
> > > Makes sense.
> > >  =20
> > > > 4. Any write to a property (including in place) invalidates all
> > > >    unknown tags on that property (they must be stripped) =20
> > >=20
> > > Ok
> > >  =20
> > > > 5. Any write to a property invalidates all unknown tags on that
> > > >    property's node =20
> > >=20
> > > Will see in the implementation. The offset of the written property wi=
ll be
> > > incorrect after the write. Indeed, some tags (tags related to the nod=
e)
> > > available before the property can be removed. With splices instead of
> > > FDT_NOP, offsets change. =20
> >=20
> > Oh, good point, this rule doesn't work.  I think we still have a
> > consistent set of rules if property writes don't invalidate parent
> > node tags (subnode add/delete still would).  Of coutse, that does
> > further restrict what sorts of information you could safely put in
> > node tags under this scheme.
> >=20
> > > This also brings a question. Are API functions such as fdt_get_proper=
ty_by_offset_w()
> > > need to be deprecated? =20
> >=20
> > I think we can keep it - kind of like fdt_next_tag() this is a
> > low-level function.  If you use it, you're opting in to having to deal
> > with tag invalidation.
> >=20
> > > Those kind of functions return a pointer to the data of a property fo=
r modification
> > > by the caller. We don't know if the caller will modify or not the pro=
perty.
> > >=20
> > > Without deprecated it we can change the function to
> > > ---- 8< ----
> > > struct fdt_property *fdt_get_property_by_offset_w(void *fdt,
> > > 						  int offset,
> > > 						  int *lenp)
> > > {
> > > 	int new_offset;
> > >=20
> > >         /*
> > >          * The modification is goind to be done out of libfdt.
> > >          * Unknown tags are removed (rules for modification when unkn=
own tags
> > >          * are involved) but also known tags. Indeed, we cannot know =
if the
> > >          * modification will have impacts on known tags
> > >          */
> > > 	new_offset =3D fdt_remove_all_tags_due_to_property_modification(fdt,=
 offset);
> > >=20
> > > 	return (struct fdt_property *)(uintptr_t)
> > > 		fdt_get_property_by_offset(fdt, new_offset, lenp);
> > > }
> > > ---- 8< ----
> > >=20
> > > The idea is to be conservative here also and consider that property d=
ata retrieved
> > > for writing will be modified by the caller.
> > >=20
> > > Also, the offset used as parameter of fdt_get_property_by_offset_w() =
is no more
> > > valid after the call.
> > >=20
> > > Last point to have in mind, getting the node offset from the property=
 offset will
> > > need to walk the tree from the beginning. It can be costly. =20
> >=20
> > Right, that's what I was thinking of when I said this might not be
> > practical to implement.  It's doable in the common case where we alter
> > properties by node offset + property name, but not when we use a
> > property offset.  But the fact that this would change the offset of
> > the property in queestion is a much bigger showstopper.
> >=20
> > > > 6. Adding or deleting a property on a node invalidates all unknown =
tags
> > > >    on the node =20
> > >=20
> > > Ok.
> > >  =20
> > > > 7. Adding or deleting a subnode invalidates all unknown tags on the
> > > >    node =20
> > >=20
> > > Ok.
> > >  =20
> > > > 8. Whenever a tag is invalidated and stripped, the overall version
> > > >    must be downgraded (to let clients know they can't count on tags
> > > >    being present) =20
> > >=20
> > > Ok.
> > >  =20
> > > >=20
> > > > Points (4)-(7) are all somewhat negotiable.  In particular, I'm not
> > > > sure how feasible (6) is to implement. =20
> > >=20
> > > Well, this new proposal is more complex to implement than your first
> > > proposal but it has a finer grain to handle unknown tags on modificat=
ion. =20
> >=20
> > Certainly - that's why I proposed the other one first :).
> >=20
> > > I can try to implement something based on this new proposal. =20
> >=20
> > To be clear, I kind of prefer my first proposal still.  The question
> > is whether what the updated scheme buys (preserving more tags when a
> > bootloader makes minor writes) worth the added complexity of
> > implementation.  You're better placed to answer that question than I
> > am.
>=20
> I would like to avoid bootloaders being blocking points and so:
>  a) They should not failed if they encounter an unknown skippable tag.
>     We are in sync on this point.
>=20
>  b) They should preserve tags as much as possible.
>     The goal is to allow following software components (probably the Kern=
el)
>     to handle new tags.
>     This is the point where the right balance has be found.

Right.  I understand why these are both desirable.  However (b) is
pretty tricky, because of the question of invalidation.  It
necessarily involves a tradeoff between how much can be preserved
versus what sorts of information future tags can carry.

> Your first proposal is maybe too much aggressive on b). That's why, even =
it
> is more complex to implement I would prefer your last proposal (taking in=
to
> account the property offset issue) which can be summarize with the follow=
ing
> table:
>=20
>                       | existing prop | existing node (1)   | Downgrade
>                       | unknown tag   | unknown tag         | version (2)
> ----------------------+---------------+---------------------+-----------
> Modify a property (5) |    Remove     | Keep (3) 	    | Yes
> Add a property        |    NA         | Remove              | Yes
> Delete a property     |    Remove     | Remove              | Yes (4)
> Add a sub-node        |    NA         | Remove              | Yes
> Delete a sub-node     |    NA         | Remove              | Yes
> ----------------------+---------------+---------------------+-----------

Great summary, thanks.

> (1) The existing node is the node were the property or sub-node involved
>     are present. Not all nodes, not the parent node but the node directly
>     impacted by the modification.
>=20
> (2) We downgrade the version only if tag are removed. If no unknown tags =
are
>     involved (and so not removed), the version will not be be downgraded.

Sadly, that doesn't work.  We have to downgrade on property
modification for the same reason we must downgrade on adding a
property: it might be adding data that requires certain tags in the
later version.

> (3) Removing unknown tags in the node when a property is modified will le=
ad
>     to the property offset change. Prefer avoid the property offset change
>     and so keep node related unknown tags in that case.

Right, if we did that it would basically mean totally (and
incompatibly) redesigning the libfdt interface.

> (4) The version is downgrade only if we remove some tags related to the
>     node. If we remove only tags related to the property we delete, there
>     is no reason to downgrade the version.

Unlike (2), I'm not certain if this one is unsafe.  But I suspect it
might be, and having it behave differently from case (2) seems
confusing to me.

> (5) All property modifications done outside libfdt using directly the
>     property data pointer will not lead to any unknown tag removal.
>    =20
>     This point is for the usage of fdt_get_property_by_offset_w(),
>     fdt_get_property_namelen_w(), fdt_get_property_w(),
>     fdt_getprop_by_offset_w(), fdt_getprop_namelen_w(), fdt_getprop_w() a=
nd
>     maybe other similar functions where the property is returned writable
>     for possible modification. 'modify a property' mentioned in the table
>     is related to modification done using fdt_setprop_*() and fdt_appendp=
rop_*()
>     function families.

Right.  "I know what I'm doing" is part of the implicit contract when
using those functions.

> On your side, is all of that conservative enough to be used when modifica=
tion
> involved unknown tags?

Not quite, as noted, but we might be able to get it there.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--yNci9GeEh9+GPubB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrazSMACgkQzQJF27ox
2GcAQQ//aNM6LkeghEdsNQ8HNyWNjrPxBWEX6gjN8+rL66opIJrmSr/CWSYOalf0
lIvwIBBMxWwRspSbyhZ8aDzjDeKVcAHJ6pYjkmnWcmbDAkqdrkZp78LM882rfnIB
vFyXo3sTDdfgBFRA0Y/0Jix6iabQo7x8VXjrvwqZjz8OHWZOgPbqLKjfsP0XOXX4
DtfxD++MC2h5qsW6J9ZRlF5+DZGD/GHGVmRF2AohYRws+Puv4YYFLCRqO8mtez+q
f5axBT66UErIYwJTe54YPlvbfPGywhmlH9gYPolprYmNxEawFHogMi5f3/3CbE4V
yWRAFsSJQyd1Gebw9UsZbOWoXoruHgBJjekcvmyDUDprrYIREyC1RoC4fGKu1ziW
tYGmhVRcmkXuOWnWga4PccRmxQ+2/YSFV38Q/glyvgoU5DKj6t2JuB0cW6my75ES
Fh2Vz2CczyDz0yu7r5xBnIkXEoo6fSGy9oczw9Fo+m0shrpZy3NAHVJnYEjFKRNF
KejlYIhFOMBTNmv1gHYwA0k5ov4CEs6SOW1MeQENrKBHFzMKMIo4oT898yIMB+Dv
nrvKGtEG1Kz6RWEAT2k50SmrXJapv9vC5HiDGLOTv1HZ/19ksWksCwxOZlC3Id9O
oSYfuuOvY+xpC5qWVmUzFvXjZhx2uNfOR2jmQo6Ua1q+PdlcF3s=
=lT8n
-----END PGP SIGNATURE-----

--yNci9GeEh9+GPubB--
