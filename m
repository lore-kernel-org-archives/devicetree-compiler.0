Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639070;
	b=yePwKaGnY3uXfls5C3IKzcA1MLp6X7Ms6/uYZOBc4ZP/4dJFadxyL7RAUuXbG1w9If9S
	 sp15/8eCXAP+qgBPwwj5oY3oH/hdJW0L9gFxebwUKeHsGEKJQNaZuNQs9H3ihcO5pM6mJ
	 ukCtR0p67oU2PfJSQu6BK3ch9lLs4R5yswC3rWwzISfxBQVQJ1g8vdzMtaQ9t1XWqU7i4
	 N/L0VIPisaTb1vORj+TaSL6Fqn4PBJx9ekNv/5GXWpYXfPCg13YM67Ajm6voPanvhbf8v
	 /DxDrwkPoS6WNm+yzmed+MzUPCariUfouSN+I7UePK52NaZX1qblMDZDacZlV0Kq7Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639070;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=2Vv9fUmCqweE9qS+76IlqIkZkrjZz9MP1KBOs5pGlCI=;
	b=eB9905/GBn8xHH5AN8Yntna2my7NcaB6jSmmjVzlatWASgpcpDo+oIQLZkAJqpb7DiUG
	 U3hqsHXkTi+IXzgTe6ddhaVbAMhykZNf3HqFEMObTCNODysPru6PA72p4SyqbJvRgf8OF
	 +AL4fNVDUD58446Kn3h3JSaWLrlqt45DKGulurhkTMdZ/D/HX87ak8F1xvQxr6fhWLbNY
	 IQBY0vrIWWLcgc/PjqbjXNjWvn8pCGwWKWH07iKrVQ2jJyAfsgNMGegIU3Z8F3HZCrnbL
	 6d/siiHgWXub/KcJE1XWRWaqYWjtumdTn0ITFH2LoerNE4CyzNPPXSJvJTJaicYF1Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE060A3815;
	Thu, 22 Oct 2026 03:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BE060A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792639066;
	bh=2Vv9fUmCqweE9qS+76IlqIkZkrjZz9MP1KBOs5pGlCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R43SLHeRRzRAn9ShAZ01lyFMhKv/GkFAJRZOpVmENzfdEis9TigVt6RKRB19or/CK
	 Eo6aAGrmZF7i7pBEkDzRIsA7o2i6lM51HbaLv5JSNXuY2ig65WuPdkIgrlOFl8g2SG
	 zplDHShyvDn8Ox2EPzk2FShHBgeIupgFpZzgttt/FEuKa3OvfOKzJW57FIioG2VR4E
	 53jaWN4xjVByOVyZTpG4Z2eVPEZ0MqRj9bjMz2qRqCxHsiSg8bhxPEfIYt+nE5Lsw7
	 HwY7fNT5uUbe4+vGyQw7fCaRjXQ/IhSnCA2i3yfUqcPZxgL5iyLTNqXebaxrxZsj7B
	 luwvndKjlfIQQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j9BDB4dNLz4wCW; Thu, 22 Oct 2026 14:17:46 +1100 (AEDT)
Date: Thu, 22 Oct 2026 14:17:38 +1100
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
Message-ID: <atmASGg1OZt9jfXI@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-16-herve.codina@bootlin.com>
 <arDMhoNNXcPi81sR@gractus.seuss>
 <20260925152157.511dc65c@bootlin.com>
 <as3ZWBr3wRonkxXF@gractus.seuss>
 <20261013190347.4f1d9b9d@bootlin.com>
 <atGzdxETQZ9ovJFh@gractus.seuss>
 <20261019151121.26d99f30@bootlin.com>
 <atgi4rMsw5W6kKkS@gractus.seuss>
 <20261021172043.4bbd2bc5@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="mL+9gLkvUMZ5U3yt"
Content-Disposition: inline
In-Reply-To: <20261021172043.4bbd2bc5@bootlin.com>

--mL+9gLkvUMZ5U3yt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 05:20:43PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 21 Oct 2026 13:26:49 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > >=20
> > > Ok, my proposal seems to be a no-go and so I will follow your proposa=
l given
> > > above. =20
> >=20
> > To be clear, I'm rejecting the original proposal because I think it's
> > internally inconsistent (if you follow the consequences of decisions
> > far enough).  I'm not necessarily opposed to something other than the
> > above, as long as the rules for when unknown tags must be invalidated
> > (and what that does to the version) are made very clear in the
> > structured tag spec.  e.g. see an alternative proposal below.
>=20
> No problem, I understand your point.
>=20
> ...
>=20
> >=20
> > Essentially the theory of the proposal above is to be maximally
> > conservative: any write (adding, removing, changing, in-place,
> > whatever) will invalidate all unknown tags and downgrade the version.
> >=20
> >=20
> > But, here's an alternative proposal for invalidation/version semantics
> > that I think is consistent, while being a bit closer to your original
> > proposal.
> >=20
> > 1. version and last_comp_version retain their meanings.  No new header
> >    version.
>=20
> Ok
>=20
> > 2. If version >=3D 18 the tree may include any structured tags, even if
> >    they weren't defined as of v18.
>=20
> Ok
>=20
> > 3. Some future version might _require_ certain structured tags to be
> >    present.  But a client must only rely on those tags if the version
> >    indicates it can.
> >      - e.g. suppose FDT_FOO tag is introduced in v20.  A client
> >        reading a v19 tree _might_ see some FDT_FOO tags (because of
> >        (2)), but cannot rely on them being present in all the places
> >        they should be.
>=20
> Ok, kind of degraded mode. Whether or not a v20 compatible client can con=
tinue
> or not will depend of each tags known by this v20 client. For some tags, =
having
> them removed will not be a problem whereas it will be a problem for some =
other.

Exactly.

> Makes sense.
>=20
> > 4. Any write to a property (including in place) invalidates all
> >    unknown tags on that property (they must be stripped)
>=20
> Ok
>=20
> > 5. Any write to a property invalidates all unknown tags on that
> >    property's node
>=20
> Will see in the implementation. The offset of the written property will be
> incorrect after the write. Indeed, some tags (tags related to the node)
> available before the property can be removed. With splices instead of
> FDT_NOP, offsets change.

Oh, good point, this rule doesn't work.  I think we still have a
consistent set of rules if property writes don't invalidate parent
node tags (subnode add/delete still would).  Of coutse, that does
further restrict what sorts of information you could safely put in
node tags under this scheme.

> This also brings a question. Are API functions such as fdt_get_property_b=
y_offset_w()
> need to be deprecated?

I think we can keep it - kind of like fdt_next_tag() this is a
low-level function.  If you use it, you're opting in to having to deal
with tag invalidation.

> Those kind of functions return a pointer to the data of a property for mo=
dification
> by the caller. We don't know if the caller will modify or not the propert=
y.
>=20
> Without deprecated it we can change the function to
> ---- 8< ----
> struct fdt_property *fdt_get_property_by_offset_w(void *fdt,
> 						  int offset,
> 						  int *lenp)
> {
> 	int new_offset;
>=20
>         /*
>          * The modification is goind to be done out of libfdt.
>          * Unknown tags are removed (rules for modification when unknown =
tags
>          * are involved) but also known tags. Indeed, we cannot know if t=
he
>          * modification will have impacts on known tags
>          */
> 	new_offset =3D fdt_remove_all_tags_due_to_property_modification(fdt, off=
set);
>=20
> 	return (struct fdt_property *)(uintptr_t)
> 		fdt_get_property_by_offset(fdt, new_offset, lenp);
> }
> ---- 8< ----
>=20
> The idea is to be conservative here also and consider that property data =
retrieved
> for writing will be modified by the caller.
>=20
> Also, the offset used as parameter of fdt_get_property_by_offset_w() is n=
o more
> valid after the call.
>=20
> Last point to have in mind, getting the node offset from the property off=
set will
> need to walk the tree from the beginning. It can be costly.

Right, that's what I was thinking of when I said this might not be
practical to implement.  It's doable in the common case where we alter
properties by node offset + property name, but not when we use a
property offset.  But the fact that this would change the offset of
the property in queestion is a much bigger showstopper.

> > 6. Adding or deleting a property on a node invalidates all unknown tags
> >    on the node
>=20
> Ok.
>=20
> > 7. Adding or deleting a subnode invalidates all unknown tags on the
> >    node
>=20
> Ok.
>=20
> > 8. Whenever a tag is invalidated and stripped, the overall version
> >    must be downgraded (to let clients know they can't count on tags
> >    being present)
>=20
> Ok.
>=20
> >=20
> > Points (4)-(7) are all somewhat negotiable.  In particular, I'm not
> > sure how feasible (6) is to implement.
>=20
> Well, this new proposal is more complex to implement than your first
> proposal but it has a finer grain to handle unknown tags on modification.

Certainly - that's why I proposed the other one first :).

> I can try to implement something based on this new proposal.

To be clear, I kind of prefer my first proposal still.  The question
is whether what the updated scheme buys (preserving more tags when a
bootloader makes minor writes) worth the added complexity of
implementation.  You're better placed to answer that question than I
am.

> > Note that because writes don't invalidate tags on ancestor nodes
> > beyond one level, this proposal doesn't permit tags to contain summary
> > information about an entire subtree that could be invalidated by
> > writes further down in that tree.
> >=20
>=20
> Well this doesn't look like an issue on my side. At some point if such ta=
gs
> are added, we can avoid any modification using the last_comp_version
> field.

Yes.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--mL+9gLkvUMZ5U3yt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrZgEgACgkQzQJF27ox
2GdsKw/+MOf+b1HVFIR37G0EXRAd8oIA3uvbH/rMYt5e7dYeWy0FBPn4rz4neLJx
quLI3gXiC+4fdJL6eYa30JLKYiipFK+/kyKKMF7cz2LLh7u+J9giRta52seYkcZl
nlBrU/oDyNbCPFZk0vQsIY0PYrrrSBQ5tdk7PZoQmPmmZAhNZZ8Xu/y6zKqTIKF8
qu6Yp0iWRR7Yf5rCsFV6B6U29a28ZyJuMJBoHPMG8kUztgs70gNEdxU8rp7gMPJQ
i/Rw9iPHviwMs5wpmDzhrxp2+U7q1S54V5zb0rM2eDxo2aJzmeX3A9W8d2GNvcZU
lb8rOnhKw6byugr0O4CxCL5uq7lAOiDGXfxWQzY7W9DcWGreAaYohqDlSUwQYFor
Z99zxcSeFMGBAOACatp9QQG2bskKbvsyiL26hFPj4ln7YYYC1OOM8n6TtDZAztiZ
erqOJ0fdD8+E/v0tyMUuZno82mzzyM2bYT07yIJkvWdDyhkkM6naUJY8MOQ0ln0Z
lq1Hp3VA/59aDODnTMD5Wa1GFc8EdK/ppF7Ub9k1Xl4JbR6QeR5kbOY9whMtBvHS
XMPNAQ91WUe18FQ/Hi13I9OTD55BL0urm4D4SlfKnjo3IxbwXZ1Jeo2sGG0+chkk
+Sxzn3LZF6oB56HgN/YGbp9Zr3pzdTwTlgjarYTcG1kRNgtE8hs=
=I6j+
-----END PGP SIGNATURE-----

--mL+9gLkvUMZ5U3yt--
