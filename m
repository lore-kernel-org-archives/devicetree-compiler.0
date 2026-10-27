Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067802;
	b=fIaTnqwzKtl5k5tfnkak/TdQdRrmULKEs4oH2CKzY9cho0/gxSgdzeM8pcCsAAVoT4XN
	 CnpUpsValxJ3BCgHMULL6Ee4Wk3+YZfC8qTi/eBnez6ny4E4QrhIg6G36nGbU1J1X3cxJ
	 lpsVrw5i1JGibsdmzj+cBqEtYMDc/tYuI16qdrK8HhtaFoh/xrLXnqhvyxYa5r7GFggAn
	 itW1agrjp4k36zwG3/o2Rfrnho/S6M6TO/7xQyUjDimqhWbrHBd/bYlUhOCl7hlYW2RWH
	 LcNF4D5hYdpmQtLPZbwQiB77B+P1upP3wI3pYuw17IePScK8Z25wPkwpW3kSfen5ByQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067802;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=7etAlynTAC6r0h2EFYqGEY7YZrfneyXCS4sNmRykkhQ=;
	b=Ho3/X1oPhRGjBqewxf1cyRYtKtve3y5Uw1MImGDlKmY2HVBVPUQIjRFJkaCBJLgFCFLF
	 +7dZIQSGoPMWRU2FCIDno15a/PPXLdxXTNXUmAgOW6gIxcP7C/03YlbZyDorAjRCulU54
	 Al2k6Rsh2V/T0yY4r1esYRogWH3bXx8JQEicS3MjL9QINHcZ7xUscbw1oeG1msjBjkpJ0
	 jVJ2a/bQ4RKamm6Cvo64MKwtYNgnYpvAaidSj1lbeICfyPu13U/1aucSLnZEFFuyjrLs7
	 pw9g1dVZBfxMMeQoRSppjU0fxhz7oCKbNg8js9iM+We3+lnYiRZmRYzeAVMYXr7cn2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=tsEPSCdV;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47A8606A31A;
	Tue, 27 Oct 2026 02:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D47A8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=tsEPSCdV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793067797;
	bh=7etAlynTAC6r0h2EFYqGEY7YZrfneyXCS4sNmRykkhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsEPSCdVr5Gq9tp1W1WXdapsM4lKpNh6VfsshDRMdQEaI0+QCxK/2xZ4PjR85MtcB
	 ARTxB4KmpT31Bor0KMmsCwAOl6fPkw6S0V0f/BMFZmtQIui5WytPLmyYAeB4VGNWPh
	 r254c4WsXnU7Mi2Nj4n9eegZyiQLRfhrfTlyzwnkw8PERJcicXNM3KvnCHriFDZ6a2
	 MVKLKZEizn84L1vnzbyxVkbdniIVc8w+mPJFbihriFQX7EtdzXozhJJm0MpbMsbLH8
	 uq7lBZBeX0h6xa0Hm1c8M6a8jCu3cc2O5O/ptNTeX8h3VMDv81htj86bd1iVkPb+4F
	 mDjoT9l0IxJyg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jDDn13VNWz4wDx; Tue, 27 Oct 2026 13:23:17 +1100 (AEDT)
Date: Tue, 27 Oct 2026 13:23:11 +1100
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
Message-ID: <auALCWwk8uauD1xm@gractus.seuss>
References: <atGzdxETQZ9ovJFh@gractus.seuss>
 <20261019151121.26d99f30@bootlin.com>
 <atgi4rMsw5W6kKkS@gractus.seuss>
 <20261021172043.4bbd2bc5@bootlin.com>
 <atmASGg1OZt9jfXI@gractus.seuss>
 <20261022151454.67125e41@bootlin.com>
 <atrNI_hqwxvfsRj7@gractus.seuss>
 <20261023105511.3ad2bc4d@bootlin.com>
 <at1lLjOGvo34dXZI@gractus.seuss>
 <20261026094233.0f5f8270@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="iFyX4dvPeieVf2AA"
Content-Disposition: inline
In-Reply-To: <20261026094233.0f5f8270@bootlin.com>

--iFyX4dvPeieVf2AA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 09:42:33AM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Sun, 25 Oct 2026 13:11:14 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Oct 23, 2026 at 10:55:11AM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Fri, 23 Oct 2026 13:57:54 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Thu, Oct 22, 2026 at 03:14:54PM +0200, Herve Codina wrote: =20
> > > > > Hi David,
> > > > >=20
> > > > > On Thu, 22 Oct 2026 14:17:38 +1100
> > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > >    =20
> > > > > > On Wed, Oct 21, 2026 at 05:20:43PM +0200, Herve Codina wrote:  =
 =20
> > > > > > > Hi David,
> > > > > > >=20
> > > > > > > On Wed, 21 Oct 2026 13:26:49 +1100
> > > > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > > > >      =20
> > > > > > > > >=20
> > > > > > > > > Ok, my proposal seems to be a no-go and so I will follow =
your proposal given
> > > > > > > > > above.       =20
> > > > > > > >=20
> > > > > > > > To be clear, I'm rejecting the original proposal because I =
think it's
> > > > > > > > internally inconsistent (if you follow the consequences of =
decisions
> > > > > > > > far enough).  I'm not necessarily opposed to something othe=
r than the
> > > > > > > > above, as long as the rules for when unknown tags must be i=
nvalidated
> > > > > > > > (and what that does to the version) are made very clear in =
the
> > > > > > > > structured tag spec.  e.g. see an alternative proposal belo=
w.     =20
> > > > > > >=20
> > > > > > > No problem, I understand your point.
> > > > > > >=20
> > > > > > > ...
> > > > > > >      =20
> > > > > > > >=20
> > > > > > > > Essentially the theory of the proposal above is to be maxim=
ally
> > > > > > > > conservative: any write (adding, removing, changing, in-pla=
ce,
> > > > > > > > whatever) will invalidate all unknown tags and downgrade th=
e version.
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > But, here's an alternative proposal for invalidation/versio=
n semantics
> > > > > > > > that I think is consistent, while being a bit closer to you=
r original
> > > > > > > > proposal.
> > > > > > > >=20
> > > > > > > > 1. version and last_comp_version retain their meanings.  No=
 new header
> > > > > > > >    version.     =20
> > > > > > >=20
> > > > > > > Ok
> > > > > > >      =20
> > > > > > > > 2. If version >=3D 18 the tree may include any structured t=
ags, even if
> > > > > > > >    they weren't defined as of v18.     =20
> > > > > > >=20
> > > > > > > Ok
> > > > > > >      =20
> > > > > > > > 3. Some future version might _require_ certain structured t=
ags to be
> > > > > > > >    present.  But a client must only rely on those tags if t=
he version
> > > > > > > >    indicates it can.
> > > > > > > >      - e.g. suppose FDT_FOO tag is introduced in v20.  A cl=
ient
> > > > > > > >        reading a v19 tree _might_ see some FDT_FOO tags (be=
cause of
> > > > > > > >        (2)), but cannot rely on them being present in all t=
he places
> > > > > > > >        they should be.     =20
> > > > > > >=20
> > > > > > > Ok, kind of degraded mode. Whether or not a v20 compatible cl=
ient can continue
> > > > > > > or not will depend of each tags known by this v20 client. For=
 some tags, having
> > > > > > > them removed will not be a problem whereas it will be a probl=
em for some other.     =20
> > > > > >=20
> > > > > > Exactly.
> > > > > >    =20
> > > > > > > Makes sense.
> > > > > > >      =20
> > > > > > > > 4. Any write to a property (including in place) invalidates=
 all
> > > > > > > >    unknown tags on that property (they must be stripped)   =
  =20
> > > > > > >=20
> > > > > > > Ok
> > > > > > >      =20
> > > > > > > > 5. Any write to a property invalidates all unknown tags on =
that
> > > > > > > >    property's node     =20
> > > > > > >=20
> > > > > > > Will see in the implementation. The offset of the written pro=
perty will be
> > > > > > > incorrect after the write. Indeed, some tags (tags related to=
 the node)
> > > > > > > available before the property can be removed. With splices in=
stead of
> > > > > > > FDT_NOP, offsets change.     =20
> > > > > >=20
> > > > > > Oh, good point, this rule doesn't work.  I think we still have a
> > > > > > consistent set of rules if property writes don't invalidate par=
ent
> > > > > > node tags (subnode add/delete still would).  Of coutse, that do=
es
> > > > > > further restrict what sorts of information you could safely put=
 in
> > > > > > node tags under this scheme.
> > > > > >    =20
> > > > > > > This also brings a question. Are API functions such as fdt_ge=
t_property_by_offset_w()
> > > > > > > need to be deprecated?     =20
> > > > > >=20
> > > > > > I think we can keep it - kind of like fdt_next_tag() this is a
> > > > > > low-level function.  If you use it, you're opting in to having =
to deal
> > > > > > with tag invalidation.
> > > > > >    =20
> > > > > > > Those kind of functions return a pointer to the data of a pro=
perty for modification
> > > > > > > by the caller. We don't know if the caller will modify or not=
 the property.
> > > > > > >=20
> > > > > > > Without deprecated it we can change the function to
> > > > > > > ---- 8< ----
> > > > > > > struct fdt_property *fdt_get_property_by_offset_w(void *fdt,
> > > > > > > 						  int offset,
> > > > > > > 						  int *lenp)
> > > > > > > {
> > > > > > > 	int new_offset;
> > > > > > >=20
> > > > > > >         /*
> > > > > > >          * The modification is goind to be done out of libfdt.
> > > > > > >          * Unknown tags are removed (rules for modification w=
hen unknown tags
> > > > > > >          * are involved) but also known tags. Indeed, we cann=
ot know if the
> > > > > > >          * modification will have impacts on known tags
> > > > > > >          */
> > > > > > > 	new_offset =3D fdt_remove_all_tags_due_to_property_modificat=
ion(fdt, offset);
> > > > > > >=20
> > > > > > > 	return (struct fdt_property *)(uintptr_t)
> > > > > > > 		fdt_get_property_by_offset(fdt, new_offset, lenp);
> > > > > > > }
> > > > > > > ---- 8< ----
> > > > > > >=20
> > > > > > > The idea is to be conservative here also and consider that pr=
operty data retrieved
> > > > > > > for writing will be modified by the caller.
> > > > > > >=20
> > > > > > > Also, the offset used as parameter of fdt_get_property_by_off=
set_w() is no more
> > > > > > > valid after the call.
> > > > > > >=20
> > > > > > > Last point to have in mind, getting the node offset from the =
property offset will
> > > > > > > need to walk the tree from the beginning. It can be costly.  =
   =20
> > > > > >=20
> > > > > > Right, that's what I was thinking of when I said this might not=
 be
> > > > > > practical to implement.  It's doable in the common case where w=
e alter
> > > > > > properties by node offset + property name, but not when we use a
> > > > > > property offset.  But the fact that this would change the offse=
t of
> > > > > > the property in queestion is a much bigger showstopper.
> > > > > >    =20
> > > > > > > > 6. Adding or deleting a property on a node invalidates all =
unknown tags
> > > > > > > >    on the node     =20
> > > > > > >=20
> > > > > > > Ok.
> > > > > > >      =20
> > > > > > > > 7. Adding or deleting a subnode invalidates all unknown tag=
s on the
> > > > > > > >    node     =20
> > > > > > >=20
> > > > > > > Ok.
> > > > > > >      =20
> > > > > > > > 8. Whenever a tag is invalidated and stripped, the overall =
version
> > > > > > > >    must be downgraded (to let clients know they can't count=
 on tags
> > > > > > > >    being present)     =20
> > > > > > >=20
> > > > > > > Ok.
> > > > > > >      =20
> > > > > > > >=20
> > > > > > > > Points (4)-(7) are all somewhat negotiable.  In particular,=
 I'm not
> > > > > > > > sure how feasible (6) is to implement.     =20
> > > > > > >=20
> > > > > > > Well, this new proposal is more complex to implement than you=
r first
> > > > > > > proposal but it has a finer grain to handle unknown tags on m=
odification.     =20
> > > > > >=20
> > > > > > Certainly - that's why I proposed the other one first :).
> > > > > >    =20
> > > > > > > I can try to implement something based on this new proposal. =
    =20
> > > > > >=20
> > > > > > To be clear, I kind of prefer my first proposal still.  The que=
stion
> > > > > > is whether what the updated scheme buys (preserving more tags w=
hen a
> > > > > > bootloader makes minor writes) worth the added complexity of
> > > > > > implementation.  You're better placed to answer that question t=
han I
> > > > > > am.   =20
> > > > >=20
> > > > > I would like to avoid bootloaders being blocking points and so:
> > > > >  a) They should not failed if they encounter an unknown skippable=
 tag.
> > > > >     We are in sync on this point.
> > > > >=20
> > > > >  b) They should preserve tags as much as possible.
> > > > >     The goal is to allow following software components (probably =
the Kernel)
> > > > >     to handle new tags.
> > > > >     This is the point where the right balance has be found.   =20
> > > >=20
> > > > Right.  I understand why these are both desirable.  However (b) is
> > > > pretty tricky, because of the question of invalidation.  It
> > > > necessarily involves a tradeoff between how much can be preserved
> > > > versus what sorts of information future tags can carry.
> > > >  =20
> > > > > Your first proposal is maybe too much aggressive on b). That's wh=
y, even it
> > > > > is more complex to implement I would prefer your last proposal (t=
aking into
> > > > > account the property offset issue) which can be summarize with th=
e following
> > > > > table:
> > > > >=20
> > > > >                       | existing prop | existing node (1)   | Dow=
ngrade
> > > > >                       | unknown tag   | unknown tag         | ver=
sion (2)
> > > > > ----------------------+---------------+---------------------+----=
-------
> > > > > Modify a property (5) |    Remove     | Keep (3) 	    | Yes
> > > > > Add a property        |    NA         | Remove              | Yes
> > > > > Delete a property     |    Remove     | Remove              | Yes=
 (4)
> > > > > Add a sub-node        |    NA         | Remove              | Yes
> > > > > Delete a sub-node     |    NA         | Remove              | Yes
> > > > > ----------------------+---------------+---------------------+----=
-------   =20
> > > >=20
> > > > Great summary, thanks.
> > > >  =20
> > > > > (1) The existing node is the node were the property or sub-node i=
nvolved
> > > > >     are present. Not all nodes, not the parent node but the node =
directly
> > > > >     impacted by the modification.
> > > > >=20
> > > > > (2) We downgrade the version only if tag are removed. If no unkno=
wn tags are
> > > > >     involved (and so not removed), the version will not be be dow=
ngraded.   =20
> > > >=20
> > > > Sadly, that doesn't work.  We have to downgrade on property
> > > > modification for the same reason we must downgrade on adding a
> > > > property: it might be adding data that requires certain tags in the
> > > > later version. =20
> > >=20
> > > Oh yes, I missed that point.
> > >=20
> > > (2) The version is always downgrade on any changes (modification, add=
ition,
> > >     deletion of a property or a sub-node) even if no tags are removed.
> > >     Indeed the modification done (even a property or sub-node deletio=
n) can
> > >     requires certain tags in the later version.
> > >     Downgrading the version on all changes is the way to state that t=
he
> > >     resulting dtb may be no more compliant with the later version. =
=20
> >=20
> > Probably wants some editing for clarity in the final version, but
> > basically sounds good.
> >=20
> > > > > (3) Removing unknown tags in the node when a property is modified=
 will lead
> > > > >     to the property offset change. Prefer avoid the property offs=
et change
> > > > >     and so keep node related unknown tags in that case.   =20
> > > >=20
> > > > Right, if we did that it would basically mean totally (and
> > > > incompatibly) redesigning the libfdt interface.
> > > >  =20
> > > > > (4) The version is downgrade only if we remove some tags related =
to the
> > > > >     node. If we remove only tags related to the property we delet=
e, there
> > > > >     is no reason to downgrade the version.   =20
> > > >=20
> > > > Unlike (2), I'm not certain if this one is unsafe.  But I suspect it
> > > > might be, and having it behave differently from case (2) seems
> > > > confusing to me. =20
> > >=20
> > > Hum ok, let be conservative and remove the note (4).
> > >=20
> > > The updated note (2) handles all modification. On any changes with an=
d without
> > > tag removal, the version is downgraded. =20
> >=20
> > Ok.
> >=20
> > > > > (5) All property modifications done outside libfdt using directly=
 the
> > > > >     property data pointer will not lead to any unknown tag remova=
l.
> > > > >    =20
> > > > >     This point is for the usage of fdt_get_property_by_offset_w(),
> > > > >     fdt_get_property_namelen_w(), fdt_get_property_w(),
> > > > >     fdt_getprop_by_offset_w(), fdt_getprop_namelen_w(), fdt_getpr=
op_w() and
> > > > >     maybe other similar functions where the property is returned =
writable
> > > > >     for possible modification. 'modify a property' mentioned in t=
he table
> > > > >     is related to modification done using fdt_setprop_*() and fdt=
_appendprop_*()
> > > > >     function families.   =20
> > > >=20
> > > > Right.  "I know what I'm doing" is part of the implicit contract wh=
en
> > > > using those functions. =20
> > >=20
> > > Also this note (5) will be updated
> > >=20
> > > (5) All property modifications done outside libfdt using directly the
> > >     property data pointer will not lead to any unknown tag removal nor
> > >     a version downgrade. =20
> >=20
> > The idea's right, though I don't think that expresses it particularly
> > well.  Not a priority right now, we can revise that later.
> >=20
> > > > > On your side, is all of that conservative enough to be used when =
modification
> > > > > involved unknown tags?   =20
> > > >=20
> > > > Not quite, as noted, but we might be able to get it there. =20
> > >=20
> > > Is it better? =20
> >=20
> > Yes, it is.
>=20
> Ok, I think we've reached an agreement :)

I concur.

> We have a new set of rules for handling "unknwon" tags on modification.
> I will implement this set in the next iteration.

Sounds good.  Let's hope there's not some showstopper inconsistency
neither of us spotted yet.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--iFyX4dvPeieVf2AA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrgCwkACgkQzQJF27ox
2GdRRxAAiFgBj9ZokIG27+Szw8NheNzVuWXhe5UJSZslprtCuWefJ+OKdwcp11w1
/zDA3LqJF2ZFyL+x/jGI+k1j6fRcwR/imcb9RCN4FRTAV5gxPTOlHz1LVAQiluM9
1D2gCIKwrD0Nx4S4nse3NxEPbihudzEBUrMFfv/r8O5ktPUdzsIapJE8yAX2obD5
dkpMVlj0iHLe6DjY1zYhtkQTMRX8rjGJw5gusRFEdTkgCmD9BFwgeoLlMs8giYnM
+a3dVJ5CxDCVV7GWgwiMycTupLm4PX1NJ40raqZHQgiiwjLYguU5PNupvuv6vrXI
C05YBCn/MGvhRAx8xS67PiH6W9vzmrgSyzNyToUhJBbSVrPcb3TbO42/hLUDTWVI
xR/zTkqQqMeIRPHcfMAaFBlPI3kRfNCcLrFWudkUdpmLUMv7SrC6gvD9MXEeckpJ
dg1gDDuht+KvS5UnuTazbsuhjNWxcNmTEE0jQzWRqkLYAf51FXW+CfHAqGdFunlz
Oh9Grl9lZHZ3Q26M4pi9ZhIAEs5/8Zgw9NZTVd4bmhz04DcaID1Ps2tTTWzZ0LJW
ew52ZwXvd7c1HwtYKqzdQhMkQnIviivYbWZe1rgs9FSmhXioETKt4gMD/BMQkiXn
KUSVyTrNw9Up7niTCaFuDsO+gCSCoX2sgyYL0WVfLXJ98J/lqsI=
=E392
-----END PGP SIGNATURE-----

--iFyX4dvPeieVf2AA--
