Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447700;
	b=ySGqxykSjKawy5RW/4ac06B8GYjdIOGzI7jRFMHDqglc9ryuG/yRiwOTBgSu0IY4bIGA
	 VUQKbauaNW+5lQCIrw2+8dbwJmWHSX8ks7wfcdkds1fgVDLKPNLTYdbEgECBubIT6Y9N1
	 Q8nqwJmB/L/ylqrnK5WKvOqLklwf+VhoJrj9m8J/BASrsstw6thJNE3vKVeYXlqRg4xG5
	 mVoFaBLOnoCjVptOrjsAo/GjSVNlvG0Q0fJvtnWLzqwKbR4hLKLie1lLcFcx6oWwQWfJN
	 FNf0kun07vw76vowQO89nMIE/NYLy9MoBhlSDtIv8h4Vam2iZnLe9Q+D/UVdDIlkjUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447700;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=0ux6+GKvQ/KV19LD8Gy72Ij4MSy+kSSaeb/vO0GC9Oo=;
	b=G+MSeWeQc0h37PQ2v2DD2xXGx56hCfxCjv8qS1ZCQ7MrLQ7BT4oVfLeUTxwhKvmCXckk
	 eR62xoPj3Ti0BbbgWtXHJ8sHib11Wz74yvFg8m7v79yRxjB9o6pv7r1hgaHpRIuWQGQlL
	 hZeOOEc4iNw0TBwqAlkCvQazcihbfZAEzx4goOWm0wFDpAhv3uJWSUz0LflDqpdb/jZNM
	 mvC77MPAHgXkpRbpznWjopiVrM3UvYaCrStShuvMAANZeC2IFxayL4KkeWF/S+hR1sNRi
	 ysmrZXjvq3Z17F/QIAKuYSfo9s+zuTfrFUh8NAJjVA9k+ZVceoaIU0lf3UP6D/Xx9Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Gf4JWqAN;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C770606A31C
	for <devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 01:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C770606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Gf4JWqAN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794447696;
	bh=0ux6+GKvQ/KV19LD8Gy72Ij4MSy+kSSaeb/vO0GC9Oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gf4JWqANQtimU9EYq92bt7MQXUNIWjiOP5MZfLyuxU3u887flN6Bf7w1xstyDRvyA
	 +ogu2MY8QiOKfHjUjolebGe8zjpNXnLBmoqGBzeS5S5g5ty1ucaJEcsFSPdB72K00S
	 VYUrROT5QCqF9b4uz9salNXIq2KRno59KsTh/2KlL/1eA4mM4uEwuyq3pCMRz/GmBz
	 wpVypg5OTK8kvXVYlJpiS+PgwqmKWFzTagQloT/iVf2A3/J2ncX3AvopgXkzXwhjT1
	 i2UeF2gSbDqUDW2/oLp+2iiuSkZRHwGXF/0lQ/kYqImf38GbhEFZxENCFrl9313lik
	 Sal4NESrJJyKg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQ35X6CVDz4wMH; Thu, 12 Nov 2026 12:41:36 +1100 (AEDT)
Date: Thu, 12 Nov 2026 12:27:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Vishal Chourasia <vishalc@linux.ibm.com>,
	devicetree-compiler@vger.kernel.org, sourabhjain@linux.ibm.com
Subject: Re: [PATCH] libfdt: Add fdt_add_subnode_tail()
Message-ID: <avUV_ejp78LB5Kpn@gractus.seuss>
References: <20261103161425.1258558-1-vishalc@linux.ibm.com>
 <aurG-frOaM-X-Ay8@gractus.seuss>
 <CAFLszTjTvXBSThF0VjC7Lq8gP+XfoGk_D_Z2GTW9Fmxggn3CEg@mail.gmail.com>
 <avPXjuf-q_bukDZc@gractus.seuss>
 <CAFLszThK3dnGdb42Qh6J3A9s96FWgx6kdTk-NkRd5GqPKr_8mw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="yCYJNxvBLmYCDovv"
Content-Disposition: inline
In-Reply-To: <CAFLszThK3dnGdb42Qh6J3A9s96FWgx6kdTk-NkRd5GqPKr_8mw@mail.gmail.com>

--yCYJNxvBLmYCDovv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 06:24:15PM +0000, Simon Glass wrote:
> Hi David,
>=20
> On Tue, 10 Nov 2026 at 19:50, David Gibson <david@gibson.dropbear.id.au> =
wrote:
> >
> > On Wed, Nov 04, 2026 at 05:50:45PM +0000, Simon Glass wrote:
> > > Hi,
> > >
> > > On Tue, 3 Nov 2026 at 22:55, David Gibson <david@gibson.dropbear.id.a=
u> wrote:
> > > >
> > > > On Tue, Nov 03, 2026 at 09:44:25PM +0530, Vishal Chourasia wrote:
> > > > > fdt_add_subnode() always inserts the new node as the first child =
of its
> > > > > parent, after the parent's properties. Code that builds a list of=
 nodes
> > > > > by adding them one at a time therefore ends up with the nodes in =
reverse
> > > > > order. That matters when the order is significant, e.g. when a bl=
ob is
> > > > > rebuilt from a live tree.
> > > > >
> > > > > Add fdt_add_subnode_tail() and fdt_add_subnode_namelen_tail(), wh=
ich
> > > > > insert the new node right before the closing tag of the parent, s=
o that
> > > > > nodes added in sequence keep that sequence. Like fdt_add_subnode(=
), they
> > > > > use fdt_splice_struct_() and so leave the blob unmodified if ther=
e is
> > > > > not enough room.
> > > > >
> > > > > Also add an Fdt.add_subnode_tail() method to pylibfdt.
> > > > >
> > > > > Add tests for both: a C testcase covering ordering, parents with =
and
> > > > > without existing children, the root node, duplicate names and run=
ning
> > > > > out of space, and a short pylibfdt test of the wrapper.
> > > > >
> > > > > Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> > > >
> > > > I'd need a stronger and more specific rationale to consider applying
> > > > this.  In general node order should not matter to consumers of the
> > > > device tree, which is why we make no attempt to preserve it the
> > > > fdt_rw.c interface,
> > >
> > > Yes 'when a blob is rebuilt from a live tree' needs more detail. What
> > > is the use case that drove this?
> > >
> > > The spec doesn=E2=80=99t say that sibling order is significant, but i=
t doesn=E2=80=99t
> > > say that it isn=E2=80=99t either. It only requires properties to come=
 before
> > > subnodes.
> >
> > I guess not, because the modern(ish) spec is specifically describing
> > the flattened format, which necessarily has some sort of order.
> > Non-significance of the order might be implied by compatibility of the
> > device tree contents with IEEE 1275.  In IEEE 1275 the tree is not
> > flattened (access is via Forth firmware methods), and I don't think it
> > precludes an implementation which uses a hash table to store
> > properties and subnodes.
>=20
> Right. We are only really talking about libfdt here, i.e. what it
> happens to implement. I believe this is a case to be made for keeping
> the current behaviour. But in any case perhaps we should document
> libfdt's intended node-ordering semantics, separate from its actual
> behaviour. For example we could say that when adding a node, libfdt
> may put it in any order, not necessarily at the start or end.

Right, certainly the intention was that add_subnode() makes no
guarantee about how it orders the new node.  Nothing that explicitly
might be worthwhile.

> I actually like the way it works now, but perhaps I've just got used to i=
t.
>=20
> > > rom my side, one use for this new function could be with Binman[1]
> > > which builds firmware images. The nodes describe the ordering of
> > > binaries within the image - example at [2].
> >
> > I would strongly advise you not to design something which relies on
> > property or node order within the fdt format.
>=20
> Another option would be to add a sequence numbers as a property to
> each node. Depending on where this goes I can update Binman.

The other option you could consider is having an explicit (ordered)
list of the things to consider as a different property somewhere.  Or,
having /aliases entries which give the numbers, along the lines of
	'hd0'	=3D> "/pci@XYZZY/scsi@PQRS/lun@3/..."
	'hd1'	=3D> "/pci@PLUGH/usb@ABCD/mass-storage@4,3/..."

Fwiw, sometime in the distant past that was suggested as a method that
the device tree could use to advertise a stable device naming/order to
Linux.  Not sure if that was ever implemented, though.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--yCYJNxvBLmYCDovv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr1Ff0ACgkQzQJF27ox
2GeGVQ/+O02Yf+HNhw4X6vmnVhySBUrbKd5/kOt+EvHOUPJkSAymk4LvDfC1Znq4
bvEUASGfARQ4BFm5b7UpyVdAYWYI76rDzWzhps4Ukqr9g2M1FwemGWZcYc7v4emc
UKf4iI1ojCwG0YHO+zOTJOMLkNyNnj4Xu+86mmnrXmSslnw2rF811LG7tvg+2nJh
snAsMBqq7Lsp8LmvXMQvbJRurzJwWh0k+7UwOd42IVV+WyLrizH3BUpBF1iPYWh1
CZgvo0R0DLAw2/K6OyFPSr05St+O8hKfYGKTt/2t+fbyFzKswaBEzl35oTC5G+iA
nKvkS6j7u9M3aykioBMysI9BSYgrq/ZoZVFvA4qOBwxSc2wzb71a+LzoDrpDFwoc
j4ghbNg8kNlRpJPCOSK7tlO7y53vtH5XXzz7eVmCVqE3U6hGFnIIdIF3kb9Ej/qr
O/7nCqMig+8IzTbbPD+8aqRA8IaMBi/qTlCx2fXLwUJQguLyekj1UpuQElHJnhlR
aKODjpfSQn/3Fue9rWOB7V3dit/vyND0MYqAAddLAHbLcQgHE9N55C8yvydeZ+1e
0udD8yaAAJs7b8KucPTwO2YiIbeIFJ8TefuAG35amBtIco4AD89y781idhOprZag
/8XAICCid9opO9JfxNye1HzCwFlE/Bx3yZLCjtzjeDN3diFldSQ=
=DeXG
-----END PGP SIGNATURE-----

--yCYJNxvBLmYCDovv--
