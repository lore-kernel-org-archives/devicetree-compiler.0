Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2F63438B5;
	Wed,  9 Sep 2026 06:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934714; cv=none; b=ajYsbDzhSKtg6JjdEZosk99+paCefXvTG9m/jM0oy9US673SW5JWRRbEVekAg4ef212TLow5iag8Gwnrg4qrYq10cg+2Zrs4PadVqqfX4KTMybglPIaSoiU4z1sv7pFPpIrKlM2tqXeCteiixo7O+z8KSbkSe/lNRPIkVjljqT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934714; c=relaxed/simple;
	bh=nBpXqvbBeac6mFbQDF/PL2sGhareohEgFgyuJn3lprQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnLeE4uH51EQVDyCOTOFbWCsybXKcZAB7ikqEnh9ZME/Vjx4HKocHRApIAUdkgfoanRXkSY80gdgEqdNkMqUf7ZlouuTrKYaX0fx4mmXPzojomQalWZgpLvUuVDs+BZ76ukzlLklkj5KOeRfUffZ71I6SHxAq0df8xkFCJ/mGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=oGxg4djI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="oGxg4djI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788934697;
	bh=dE7AIMm/vRXxGCVsB5UB239x+Yww0GL1Qfh53w0UAek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGxg4djIswfn0jIOCbgW5H8LddddkKdZ+49A8+chdrirL4JSydBvtWVh7WYmiNvYA
	 Pmaj7N3su9w/dilrDIpWGQ+4bYUPBPQod+U1s+1Iuzjfl9ZL3fBkKto/agQjkl37NW
	 IMuWXl2EYzQMj10Vu/frVprNQm5UTGrztO1yz8yUGWAEi3Vze0IPeY0Sb39nRb5tJX
	 HCl81SIXFyeQhhMdwDiJk2k/W7sGqpea/jviMaOLBKeilcP1AhpRiHGIMUS2YGqyEZ
	 fEum0UILVGMANxSRoPAcFLhPhIG9jIj/tHcEJfE/5bjAUBcwgFqWWZQUDiW3cnHNAp
	 21gvOpR/118Ew==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hfrGK2ytBz4wJs; Wed, 09 Sep 2026 16:18:17 +1000 (AEST)
Date: Wed, 9 Sep 2026 16:18:22 +1000
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
Subject: Re: [PATCH v3 02/15] libfdt: Don't assume the root node is available
 at offset 0
Message-ID: <aqD6LcbwtrZkk28m@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-3-herve.codina@bootlin.com>
 <apOhk-NQusFgV5Sx@gractus.seuss>
 <20260831140119.1f14b420@bootlin.com>
 <apaBuQ8kn2bOzYcI@gractus.seuss>
 <20260901141826.49b1a1b7@bootlin.com>
 <apfKx_u3v3GBfzOz@gractus.seuss>
 <20260907184641.537cfa49@bootlin.com>
 <ap-t8qMg5VMwh-T9@gractus.seuss>
 <20260908100823.1f474894@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BGDMZ4DzofC+sZVg"
Content-Disposition: inline
In-Reply-To: <20260908100823.1f474894@bootlin.com>

--BGDMZ4DzofC+sZVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 10:08:23AM +0200, Herve Codina wrote:
> On Tue, 8 Sep 2026 16:41:06 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Sep 07, 2026 at 06:46:41PM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Wed, 2 Sep 2026 17:06:03 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >=20
> > > ... =20
> > > > >=20
> > > > > Ok, I will update fdt_check_node_offset_() to have it updating it=
s offset
> > > > > parameter to the real offset of the root node when its value is 0.
> > > > >=20
> > > > > Based on this update, will see where it goes. I mean, impacts on =
callers, if
> > > > > it simplifies things or not, if the offset update needs also to b=
e propagate
> > > > > to caller's parameter or any other similar point that we can see =
during the
> > > > > implementation.
> > > > >=20
> > > > > Having something implemented and available in a patch will be the=
 best to
> > > > > compare changes and impacts related to fdt_check_node_offset_() u=
pdate.
> > > > >=20
> > > > > Here we have a version of handling offset 0 vs real root node wit=
hout any
> > > > > offset update done in fdt_check_node_offset_(). In the next itera=
tion we will
> > > > > have the version with update done in fdt_check_node_offset_().
> > > > >=20
> > > > > I think the golden rules to follow on this point is "keep it as s=
imple as
> > > > > possible".   =20
> > > >=20
> > > > Agreed.  Feel free to repost just the NOP before root patches on th=
eir
> > > > own.  At this time, frequent small series is easier for me to tackle
> > > > than occasional large series.
> > > >  =20
> > >=20
> > > I've moved forward on the fdt_check_node_offset_() update.
> > >=20
> > > The new fdt_check_node_offset_() looks like this:
> > > --- 8< ---
> > > int fdt_check_node_offset_(const void *fdt, int *offset)
> > > {
> > > 	int nextoffset;
> > >=20
> > > 	if (!can_assume(VALID_INPUT)
> > > 	    && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
> > > 		return -FDT_ERR_BADOFFSET;
> > >=20
> > > 	if (*offset =3D=3D 0) {
> > > 		*offset =3D fdt_root_offset(fdt);
> > > 		if (*offset < 0)
> > > 			return *offset;
> > > 	}
> > >=20
> > > 	if (fdt_next_tag(fdt, *offset, &nextoffset) !=3D FDT_BEGIN_NODE)
> > > 		return -FDT_ERR_BADOFFSET;
> > >=20
> > > 	return nextoffset;
> > > }
> > > --- 8< --- =20
> >=20
> > That looks fine.  If it was an exposed function I'd want to look for a
> > better interface, but as an internal function it's fine.
> >=20
> > > If the given offset is 0, fdt_check_node_offset_() considers we want =
to check
> > > the root node and so update offset to the real root node offset.
> > >=20
> > > Ok, I still need some fdt_root_offset() calls from some other parts b=
ut that's
> > > not my main issue.
> > >=20
> > > My main issue comes with orphan nodes in addons. fdt_check_node_offse=
t_() is
> > > called with offset pointing to an orphan node and this offset can be =
0.
> > >=20
> > > The offset 0 seen by fdt_check_node_offset_() can be the "fake" offse=
t of a root
> > > node and in that case fdt_check_node_offset_() should update offset t=
o the real
> > > root node offset but it can also be the offset of the orphan node we =
want to check
> > > and in that case the offset should not be updated.
> > >=20
> > > fdt_check_node_offset_() cannot determine whether or not the offset s=
hould be
> > > updated. =20
> >=20
> > Hrm.  But if offset 0 has an orphan node, we can see that with the
> > FDT_BEGIN_NODE or FDT_BEGIN_NODE_REF there, right?
> >=20
> > > With orphan nodes in the loop, fdt_check_node_offset_() becomes:
> > > --- 8< ---
> > > int fdt_check_node_offset_(const void *fdt, int *offset)
> > > {
> > >         int nextoffset;
> > >         uint32_t tag;
> > >=20
> > >         if (!can_assume(VALID_INPUT)
> > >             && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
> > >                 return -FDT_ERR_BADOFFSET;
> > >=20
> > >         if (*offset =3D=3D 0) {
> > > #pragma message "We have a problem!"
> > >                 /*
> > >                  * An orphan node can be present at offset 0.
> > >                  * In that case, looking for the root node may or may=
 not be
> > >                  * correct.
> > >                  * Indeed is offset =3D 0 requested because we want t=
he root
> > >                  * node and sadly an orphan node is available at offs=
et 0 or
> > >                  * is it requested because we want to really check th=
e orphan
> > >                  * node available at offset 0. How to determine the c=
orrect
> > >                  * case?
> > >                  */
> > >                 tag =3D fdt_next_tag(fdt, *offset, &nextoffset);
> > >                 if (tag =3D=3D FDT_BEGIN_NODE || tag =3D=3D FDT_BEGIN=
_NODE_REF)
> > >                         return nextoffset;
> > >=20
> > >                 *offset =3D fdt_root_offset(fdt);
> > >                 if (*offset < 0)
> > >                         return *offset;
> > >         }
> > >=20
> > >         tag =3D fdt_next_tag(fdt, *offset, &nextoffset);
> > >         if (tag !=3D FDT_BEGIN_NODE && tag !=3D FDT_BEGIN_NODE_REF)
> > >                 return -FDT_ERR_BADOFFSET;
> > >=20
> > >         return nextoffset;
> > > }
> > > --- 8< --- =20
> >=20
> > Right.. like that.  Except simpler would be to have fdt_root_offset()
> > stop when it sees a FDT_BEGIN_NODE_REF as well as a FDT_BEGIN_NODE.
> > Or maybe that should be, say, fdt_root_offset_(), and
> > fdt_root_offset() will wrap it to return an error on an addon tree
> > with no root.
>=20
> No, fdt_root_offset() must get the root node offset. An orphan node ident=
ified
> with FDT_BEGIN_NODE_REF cannot be a root node.
>=20
> An addon can have, a root node only, orphan nodes only or both a root nod=
e and
> orphan nodes.
>=20
> fdt_root_offset() looks for the root node (i.e. the first FDT_BEGIN_NODE =
at
> top level). If not found, -ERRNOTFOUND (addon) or -ERRBADSTRUCTURE (not a=
ddon).
>=20
> Having a fdt_root_offset() stop at either FDT_BEGIN_NODE_REF or FDT_BEGIN=
_NODE
> is "fdt_first_node_offset()".

> Let me introduce the internal fdt_first_node_offset_()
> - fdt_root_offset()
>   It calls fdt_first_node_offset_() and check that this node is a
>   FDT_BEGIN_NODE node.
>=20
> - fdt_check_node_offset_()
>   if the offset =3D=3D 0, it updates the value with the offset returned by
>   fdt_first_node_offset_()

Right, that's exactly what I'd suggest.

A possible tweak would be to have fdt_check_node_offset_() only apply
special case 0 handling if the _actual_ offset 0 doesn't look like a
valid node offset.  Not sure if that will make things messier or
cleaner.

> And so, a node offset 0 doesn't means the root node but the first node
> in the dtb (root or orphan). I am totally fine with this definition.

Right.  If you don't want that behaviour for addon dtbs, then I think
the way to go would be to explicitly avoid all special case handling
of 0 if the header flags an addon.  Handling addons requires new code,
so we don't have to maintain backwards compatibliity for things that
used 0 assuming it meant root node.

> At some point, maybe users of the API (when addon are involved) will have=
 to
> take care of that and perform something like:
>   root =3D fdt_root_offset();
>   fdt_get_property(fdt, root, "prop", NULL);
>=20
> Or
>   fdt_for_each_orphan(orphan, fdt) {
>      fdt_get_property(fdt, orphan, "prop", NULL);
>      ...
>   }
>=20
> Here also, I am totally fine with that an I already use this kind of sequ=
ence
> in libfdt/fdt_addon.c to apply an addon on a base dtb.
>=20
> I will introduce fdt_first_node_offset_() but let me know if you prefer
> having fdt_first_node_offset_() introduced right now in this "structure
> tags" series or later in the addon series.

Either is fine; do whichever results in less code churn.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--BGDMZ4DzofC+sZVg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqg+i0ACgkQzQJF27ox
2GfWcQ//fuxnBuGqBQf+T9uagh4tcc0h3oDkohwDnSEbBKTcTMl8SLJsrBDq4lNR
tQzk/MKnBpXvnnJKs+3ubvALMrr8SKnIj1IgJaYgG201jxJ1CSBLE3qIjp/0KPo/
JRLhDIJOjphn6aH81R9gLIZORgvcp4a+P6bsH5AAzoGmfd/Lvad9SX6+wk0pWsHh
JdyI/b1zPye2jkCzEzA/Xk41ipkBSy1dnxkHRurB1af3ScDFCfj+ijd0OlKThHhk
F6a1j95PgvEjm7uhgDAO3mzrRaoyqmbHFzGprPcHlAmVpljBr7G0V2UEFTACO05a
TunnbXl0CMnIdG+VviBtEqKmfVEOsyuT8aW4OSJzP3lTFB3mf6K3nfEOdbb+TMZi
0+p1wtmH2zeJw88BxVlCdlFiFr5QqMBDk52hgNh3HfEAPRxhE3oWAmsmYXODZdOl
tORVTFG3cWFNPzjM8sUzEkX/4CFYsa8f5lwKEKL2UYWi+fVEvbABHGi25PPx/o9H
bBngF2uULhZiyo9P2hfo/GXSF3qS0tkbfokiIhzt5NYUnf5di6KbjCGChYyogX5A
8bIlV1HaByFMvKKDtS7XKE/vas42e8EeTCRI0wEh/3ciuFUCnM0GrXhSFH3EYAXV
cGYkbSZtXVq7WM70NsXG6trBsRr0ccwkPMQYPVjNnIshGz9Ojoc=
=QphR
-----END PGP SIGNATURE-----

--BGDMZ4DzofC+sZVg--
