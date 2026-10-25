Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894294;
	b=Y4nG8sRUlh0OlDe+3csF19Y5rQYh92k50pAVQJKonWKClP7agOvLodQY0rH70Fd0K9MH
	 QSI4ezpQzLc7KO+7Sp0rSmkZzkul/jpGmEJ8m0x3lsbAocakoryQ0bJjSsI12WbK/2e46
	 lYkV58Z0Tql8k4W9LiCFDiiNzKo8c7g4183pVCZy+OyI+q9cZkbHgIPomuO2A0OOfIXNZ
	 Pp5Uivc76Xo0uZGRbER55Nfaeg+wmScD2pCasupnvjlklT8tC0pHMbP3xEvin+wD+m32F
	 qDsPREi1vKVqIv1KLZPRij9FiF72+4ZYYYpcRR5yK3zmlLNsdfuNm2GmA0w4+RW7vBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894294;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=RwiT82iHN3toZUQrHf+AMyIF8gLtZrSfoUnq3pDd/8Y=;
	b=MTAvpu9VHJd5kcpSu2Y9x+d5MqZ0PIRt/raH/H2WuotUT/BuZprp7g9p652Xr95j6P7j
	 Czm0SGS/0KiFuPGqhcUofX/Ri0VVmMliNrxML2BTdHB72NCEfdYSTfKyBV6oavbF12Oju
	 59NeU4gDI35AWffpgd4ZkURGmr01cZUazWmk3QXaVhQKLun+uPAf1+3iIShy5jeRqkjkU
	 Ln/MUCv2b7v7lIPgtsmOi3sOZc6gQIRc+NA/uPdQSBXfT269je5jhcWFn4KAPL9XPeqnP
	 XTn0xmfWPHZwJ1RSa01otboRgbA7Q3bJ3zdYtuIZG8AaUEcL21oGr8AgGLS2SfoURow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=IWGioRMG;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C78E606A31A;
	Sun, 25 Oct 2026 02:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C78E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=IWGioRMG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792894283;
	bh=RwiT82iHN3toZUQrHf+AMyIF8gLtZrSfoUnq3pDd/8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWGioRMGIbXaa+RbN3eg3cf8bq9a9k6kCWX8fkFeco7mSK2NFcKmR/bDhPCoQbzCj
	 6TY9fQ8BB3AYyTrED0E/9GuwbeX5ubGr5eLO4MjgfxyTDai3VH/JoR1DH1sOgliU+v
	 PjugCoozsMNhzgmSOw9DiCugcBwkS5wUKpYAiY5ITYte8E4GSVLTQXdKlz1yWMzZfQ
	 /SVVsgnhdt0/C9tqwWkLXLunSraHZjpoU45IuIOf3tUmMOO6cMKxAxl0wuKL38P9Ys
	 eE1mpWwpirRkOL/8oFglbqbXCeZy3crnV6fBhIxgAibTRL+sqpGtu9bXY+jzmOrjfI
	 ihwDCrXWvv/qA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jC0cC2z9Vz4wKs; Sun, 25 Oct 2026 13:11:23 +1100 (AEDT)
Date: Sun, 25 Oct 2026 13:11:14 +1100
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
Message-ID: <at1lLjOGvo34dXZI@gractus.seuss>
References: <as3ZWBr3wRonkxXF@gractus.seuss>
 <20261013190347.4f1d9b9d@bootlin.com>
 <atGzdxETQZ9ovJFh@gractus.seuss>
 <20261019151121.26d99f30@bootlin.com>
 <atgi4rMsw5W6kKkS@gractus.seuss>
 <20261021172043.4bbd2bc5@bootlin.com>
 <atmASGg1OZt9jfXI@gractus.seuss>
 <20261022151454.67125e41@bootlin.com>
 <atrNI_hqwxvfsRj7@gractus.seuss>
 <20261023105511.3ad2bc4d@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="mTyNvFqgpTnBiVi2"
Content-Disposition: inline
In-Reply-To: <20261023105511.3ad2bc4d@bootlin.com>

--mTyNvFqgpTnBiVi2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 10:55:11AM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Fri, 23 Oct 2026 13:57:54 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Thu, Oct 22, 2026 at 03:14:54PM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Thu, 22 Oct 2026 14:17:38 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Wed, Oct 21, 2026 at 05:20:43PM +0200, Herve Codina wrote: =20
> > > > > Hi David,
> > > > >=20
> > > > > On Wed, 21 Oct 2026 13:26:49 +1100
> > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > >    =20
> > > > > > >=20
> > > > > > > Ok, my proposal seems to be a no-go and so I will follow your=
 proposal given
> > > > > > > above.     =20
> > > > > >=20
> > > > > > To be clear, I'm rejecting the original proposal because I thin=
k it's
> > > > > > internally inconsistent (if you follow the consequences of deci=
sions
> > > > > > far enough).  I'm not necessarily opposed to something other th=
an the
> > > > > > above, as long as the rules for when unknown tags must be inval=
idated
> > > > > > (and what that does to the version) are made very clear in the
> > > > > > structured tag spec.  e.g. see an alternative proposal below.  =
 =20
> > > > >=20
> > > > > No problem, I understand your point.
> > > > >=20
> > > > > ...
> > > > >    =20
> > > > > >=20
> > > > > > Essentially the theory of the proposal above is to be maximally
> > > > > > conservative: any write (adding, removing, changing, in-place,
> > > > > > whatever) will invalidate all unknown tags and downgrade the ve=
rsion.
> > > > > >=20
> > > > > >=20
> > > > > > But, here's an alternative proposal for invalidation/version se=
mantics
> > > > > > that I think is consistent, while being a bit closer to your or=
iginal
> > > > > > proposal.
> > > > > >=20
> > > > > > 1. version and last_comp_version retain their meanings.  No new=
 header
> > > > > >    version.   =20
> > > > >=20
> > > > > Ok
> > > > >    =20
> > > > > > 2. If version >=3D 18 the tree may include any structured tags,=
 even if
> > > > > >    they weren't defined as of v18.   =20
> > > > >=20
> > > > > Ok
> > > > >    =20
> > > > > > 3. Some future version might _require_ certain structured tags =
to be
> > > > > >    present.  But a client must only rely on those tags if the v=
ersion
> > > > > >    indicates it can.
> > > > > >      - e.g. suppose FDT_FOO tag is introduced in v20.  A client
> > > > > >        reading a v19 tree _might_ see some FDT_FOO tags (becaus=
e of
> > > > > >        (2)), but cannot rely on them being present in all the p=
laces
> > > > > >        they should be.   =20
> > > > >=20
> > > > > Ok, kind of degraded mode. Whether or not a v20 compatible client=
 can continue
> > > > > or not will depend of each tags known by this v20 client. For som=
e tags, having
> > > > > them removed will not be a problem whereas it will be a problem f=
or some other.   =20
> > > >=20
> > > > Exactly.
> > > >  =20
> > > > > Makes sense.
> > > > >    =20
> > > > > > 4. Any write to a property (including in place) invalidates all
> > > > > >    unknown tags on that property (they must be stripped)   =20
> > > > >=20
> > > > > Ok
> > > > >    =20
> > > > > > 5. Any write to a property invalidates all unknown tags on that
> > > > > >    property's node   =20
> > > > >=20
> > > > > Will see in the implementation. The offset of the written propert=
y will be
> > > > > incorrect after the write. Indeed, some tags (tags related to the=
 node)
> > > > > available before the property can be removed. With splices instea=
d of
> > > > > FDT_NOP, offsets change.   =20
> > > >=20
> > > > Oh, good point, this rule doesn't work.  I think we still have a
> > > > consistent set of rules if property writes don't invalidate parent
> > > > node tags (subnode add/delete still would).  Of coutse, that does
> > > > further restrict what sorts of information you could safely put in
> > > > node tags under this scheme.
> > > >  =20
> > > > > This also brings a question. Are API functions such as fdt_get_pr=
operty_by_offset_w()
> > > > > need to be deprecated?   =20
> > > >=20
> > > > I think we can keep it - kind of like fdt_next_tag() this is a
> > > > low-level function.  If you use it, you're opting in to having to d=
eal
> > > > with tag invalidation.
> > > >  =20
> > > > > Those kind of functions return a pointer to the data of a propert=
y for modification
> > > > > by the caller. We don't know if the caller will modify or not the=
 property.
> > > > >=20
> > > > > Without deprecated it we can change the function to
> > > > > ---- 8< ----
> > > > > struct fdt_property *fdt_get_property_by_offset_w(void *fdt,
> > > > > 						  int offset,
> > > > > 						  int *lenp)
> > > > > {
> > > > > 	int new_offset;
> > > > >=20
> > > > >         /*
> > > > >          * The modification is goind to be done out of libfdt.
> > > > >          * Unknown tags are removed (rules for modification when =
unknown tags
> > > > >          * are involved) but also known tags. Indeed, we cannot k=
now if the
> > > > >          * modification will have impacts on known tags
> > > > >          */
> > > > > 	new_offset =3D fdt_remove_all_tags_due_to_property_modification(=
fdt, offset);
> > > > >=20
> > > > > 	return (struct fdt_property *)(uintptr_t)
> > > > > 		fdt_get_property_by_offset(fdt, new_offset, lenp);
> > > > > }
> > > > > ---- 8< ----
> > > > >=20
> > > > > The idea is to be conservative here also and consider that proper=
ty data retrieved
> > > > > for writing will be modified by the caller.
> > > > >=20
> > > > > Also, the offset used as parameter of fdt_get_property_by_offset_=
w() is no more
> > > > > valid after the call.
> > > > >=20
> > > > > Last point to have in mind, getting the node offset from the prop=
erty offset will
> > > > > need to walk the tree from the beginning. It can be costly.   =20
> > > >=20
> > > > Right, that's what I was thinking of when I said this might not be
> > > > practical to implement.  It's doable in the common case where we al=
ter
> > > > properties by node offset + property name, but not when we use a
> > > > property offset.  But the fact that this would change the offset of
> > > > the property in queestion is a much bigger showstopper.
> > > >  =20
> > > > > > 6. Adding or deleting a property on a node invalidates all unkn=
own tags
> > > > > >    on the node   =20
> > > > >=20
> > > > > Ok.
> > > > >    =20
> > > > > > 7. Adding or deleting a subnode invalidates all unknown tags on=
 the
> > > > > >    node   =20
> > > > >=20
> > > > > Ok.
> > > > >    =20
> > > > > > 8. Whenever a tag is invalidated and stripped, the overall vers=
ion
> > > > > >    must be downgraded (to let clients know they can't count on =
tags
> > > > > >    being present)   =20
> > > > >=20
> > > > > Ok.
> > > > >    =20
> > > > > >=20
> > > > > > Points (4)-(7) are all somewhat negotiable.  In particular, I'm=
 not
> > > > > > sure how feasible (6) is to implement.   =20
> > > > >=20
> > > > > Well, this new proposal is more complex to implement than your fi=
rst
> > > > > proposal but it has a finer grain to handle unknown tags on modif=
ication.   =20
> > > >=20
> > > > Certainly - that's why I proposed the other one first :).
> > > >  =20
> > > > > I can try to implement something based on this new proposal.   =
=20
> > > >=20
> > > > To be clear, I kind of prefer my first proposal still.  The question
> > > > is whether what the updated scheme buys (preserving more tags when a
> > > > bootloader makes minor writes) worth the added complexity of
> > > > implementation.  You're better placed to answer that question than I
> > > > am. =20
> > >=20
> > > I would like to avoid bootloaders being blocking points and so:
> > >  a) They should not failed if they encounter an unknown skippable tag.
> > >     We are in sync on this point.
> > >=20
> > >  b) They should preserve tags as much as possible.
> > >     The goal is to allow following software components (probably the =
Kernel)
> > >     to handle new tags.
> > >     This is the point where the right balance has be found. =20
> >=20
> > Right.  I understand why these are both desirable.  However (b) is
> > pretty tricky, because of the question of invalidation.  It
> > necessarily involves a tradeoff between how much can be preserved
> > versus what sorts of information future tags can carry.
> >=20
> > > Your first proposal is maybe too much aggressive on b). That's why, e=
ven it
> > > is more complex to implement I would prefer your last proposal (takin=
g into
> > > account the property offset issue) which can be summarize with the fo=
llowing
> > > table:
> > >=20
> > >                       | existing prop | existing node (1)   | Downgra=
de
> > >                       | unknown tag   | unknown tag         | version=
 (2)
> > > ----------------------+---------------+---------------------+--------=
---
> > > Modify a property (5) |    Remove     | Keep (3) 	    | Yes
> > > Add a property        |    NA         | Remove              | Yes
> > > Delete a property     |    Remove     | Remove              | Yes (4)
> > > Add a sub-node        |    NA         | Remove              | Yes
> > > Delete a sub-node     |    NA         | Remove              | Yes
> > > ----------------------+---------------+---------------------+--------=
--- =20
> >=20
> > Great summary, thanks.
> >=20
> > > (1) The existing node is the node were the property or sub-node invol=
ved
> > >     are present. Not all nodes, not the parent node but the node dire=
ctly
> > >     impacted by the modification.
> > >=20
> > > (2) We downgrade the version only if tag are removed. If no unknown t=
ags are
> > >     involved (and so not removed), the version will not be be downgra=
ded. =20
> >=20
> > Sadly, that doesn't work.  We have to downgrade on property
> > modification for the same reason we must downgrade on adding a
> > property: it might be adding data that requires certain tags in the
> > later version.
>=20
> Oh yes, I missed that point.
>=20
> (2) The version is always downgrade on any changes (modification, additio=
n,
>     deletion of a property or a sub-node) even if no tags are removed.
>     Indeed the modification done (even a property or sub-node deletion) c=
an
>     requires certain tags in the later version.
>     Downgrading the version on all changes is the way to state that the
>     resulting dtb may be no more compliant with the later version.

Probably wants some editing for clarity in the final version, but
basically sounds good.

> > > (3) Removing unknown tags in the node when a property is modified wil=
l lead
> > >     to the property offset change. Prefer avoid the property offset c=
hange
> > >     and so keep node related unknown tags in that case. =20
> >=20
> > Right, if we did that it would basically mean totally (and
> > incompatibly) redesigning the libfdt interface.
> >=20
> > > (4) The version is downgrade only if we remove some tags related to t=
he
> > >     node. If we remove only tags related to the property we delete, t=
here
> > >     is no reason to downgrade the version. =20
> >=20
> > Unlike (2), I'm not certain if this one is unsafe.  But I suspect it
> > might be, and having it behave differently from case (2) seems
> > confusing to me.
>=20
> Hum ok, let be conservative and remove the note (4).
>=20
> The updated note (2) handles all modification. On any changes with and wi=
thout
> tag removal, the version is downgraded.

Ok.

> > > (5) All property modifications done outside libfdt using directly the
> > >     property data pointer will not lead to any unknown tag removal.
> > >    =20
> > >     This point is for the usage of fdt_get_property_by_offset_w(),
> > >     fdt_get_property_namelen_w(), fdt_get_property_w(),
> > >     fdt_getprop_by_offset_w(), fdt_getprop_namelen_w(), fdt_getprop_w=
() and
> > >     maybe other similar functions where the property is returned writ=
able
> > >     for possible modification. 'modify a property' mentioned in the t=
able
> > >     is related to modification done using fdt_setprop_*() and fdt_app=
endprop_*()
> > >     function families. =20
> >=20
> > Right.  "I know what I'm doing" is part of the implicit contract when
> > using those functions.
>=20
> Also this note (5) will be updated
>=20
> (5) All property modifications done outside libfdt using directly the
>     property data pointer will not lead to any unknown tag removal nor
>     a version downgrade.

The idea's right, though I don't think that expresses it particularly
well.  Not a priority right now, we can revise that later.

> > > On your side, is all of that conservative enough to be used when modi=
fication
> > > involved unknown tags? =20
> >=20
> > Not quite, as noted, but we might be able to get it there.
>=20
> Is it better?

Yes, it is.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--mTyNvFqgpTnBiVi2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrdZS4ACgkQzQJF27ox
2GfZMg//So0zM/Hf/HB55JwbtIoS42SdtOPsirqpoXpS3uPF6j0cQ+w/dmN6GhlI
+cJGlKw1SqnesajDmetJUtx+pc4TRuieUrjyUEeGvP/pxVVEJq4F9kaN8p9J1Mez
tcQRPaadYYH1SlZFKn21uCfd2oMLSpi8ZnTx6BXveF+yfTqo9M857Ft9nT7SgSL8
kjkCmb+XZMBoztOFrKunDlyXUFJ1HZrOzXsp5s9XEuqa1zF15VnhyIb7PsMuYYr9
FPSYp4jHOfFKPxlwMEPRIytrzaJcTv22DWkd/clVP0/RCt0KTtrAiExbGgwmROA2
n8ymkwYa3y1bIZdkTQPh7O7MCw88VgG2hwQ/zeEXFhQQOKKtDw8SUXKq1JBXTKsW
2v8JtVPjkgqXFcCTyRznEA17ngrxpE/a+2UYh8/Hj+Wkn3LJLWBKatKxHOdMqktX
mi4bHDXQE6kmgVyT/V2Ww7h/6EbPk6l0FKKvt+tjGQ5ZrWCrS0pwfOMX80ZLMSiM
/xhqwvLgpp3amFyFR6U3APxYtM9MxfSZQHmQVmo5wKwQZA7gKB8IA1o6zJ86f7J5
BHz2vdps/8p4aYKiiqBjSMlJYdPncjfgB6JgaxM10768Ngz/GgmbtMwZc3QZum6W
nFC2CSG2YCf8BldP3TpJNVtPwwMyz9S7Lj1DBJo1jVzSmsy5k1c=
=ee4+
-----END PGP SIGNATURE-----

--mTyNvFqgpTnBiVi2--
