Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9CD403B10;
	Wed,  2 Sep 2026 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339419; cv=none; b=mcmLo231ReIIaoMdxvHJAoLisLpwjVsp4fh+p+WizXaNaTi7cZeXzijlU/Rn42v1AuahN0yRSYGfBVbYENNyxdxAFdvTXIqs7VgD0ep/CQWhFnFLlOpwKbfQ8dGCIq8Sj4CihR5F5Uw2rloMcnF40NaZU8CdEX2R9wL3E3fxHOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339419; c=relaxed/simple;
	bh=q86WmzqBmgx3LYDRKyK7e34u/MawNe85gmPf4WQUc78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jt7+Bd/omVLsPJlBZLgNE5mrgqzP1jT46D0+/QkZ9vYHyD57sc0xtLS+8fnWgmmVWiTROxykX5cV7QE4SCb4VmwkSrCGCBWwB5JKy+iZwsdG+9NK0HWquyc63iZ9lXiBSnrCEjweslaHlss5PkPH0j6zJrKMggtqWG0NcVxvZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=V3fhegKQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="V3fhegKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788339407;
	bh=b0Jl1OoKJeWyAmgBnIQYNZQaI1rY6FVGQBXJB1w9J3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3fhegKQsqRe234pk6voD3CruROJxFGAJhcvAiHx32ICEva5jroBx6fCwxu6lRMfS
	 uNHeS2E8FK9/I6ezF33h7sHqrbin4DWjiNEDTSXc5NHLf/2rg8/kKGNGX1xYxZSUc3
	 fRXU7tyynYwTnV7rakK7E7vCZiRayNcYdcppUR6U9cCfH5T/UK1iE27gcsXcjBuh6e
	 gPTwoLWMeSpCL3iQV6JCYWqvviay1YuCrGwtgWZR3IU5H0uRKtfGKu/c0PxmBjpMCn
	 dRTfnEy+iEc1Xp5a1dF9JWl3oZoY5nQdgIgkT+Nnv2R3iiazVRJqOThd/J+BZ0plbT
	 ZUEc3LFU2AOng==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hZc6R6383z4wK2; Wed, 02 Sep 2026 18:56:47 +1000 (AEST)
Date: Wed, 2 Sep 2026 17:06:03 +1000
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
Message-ID: <apfKx_u3v3GBfzOz@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-3-herve.codina@bootlin.com>
 <apOhk-NQusFgV5Sx@gractus.seuss>
 <20260831140119.1f14b420@bootlin.com>
 <apaBuQ8kn2bOzYcI@gractus.seuss>
 <20260901141826.49b1a1b7@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OIjszocFmTCYBpEJ"
Content-Disposition: inline
In-Reply-To: <20260901141826.49b1a1b7@bootlin.com>

--OIjszocFmTCYBpEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 02:18:26PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Tue, 1 Sep 2026 17:42:02 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Aug 31, 2026 at 02:01:19PM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Sun, 30 Aug 2026 13:21:06 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >=20
> > > ...
> > >  =20
> > > > > -int fdt_next_node(const void *fdt, int offset, int *depth)
> > > > > +int fdt_root_offset(const void *fdt)
> > > > >  {
> > > > >  	int nextoffset =3D 0;
> > > > > +	int offset;
> > > > > +	uint32_t tag;
> > > > > +
> > > > > +	do {
> > > > > +		offset =3D nextoffset;
> > > > > +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> > > > > +		switch (tag) {
> > > > > +		case FDT_END_NODE:
> > > > > +		case FDT_PROP:
> > > > > +			return -FDT_ERR_BADSTRUCTURE;
> > > > > +
> > > > > +		case FDT_BEGIN_NODE:
> > > > > +			return offset;
> > > > > +
> > > > > +		default:
> > > > > +			break;
> > > > > +		}
> > > > > +	} while (tag !=3D FDT_END);
> > > > > +
> > > > > +	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND;   =20
> > > >=20
> > > > This should be BADSTRUCTURE rather than NOTFOUND: a dtb without a r=
oot
> > > > node is not validly constructed.  (This could matter quite a lot if
> > > > this error gets propagated up a call chain - a NOTFOUND is usually
> > > > non-fatal, but BADSTRUCTURE means there's basically nothing that can
> > > > usefully be done with the dtb, which the caller needs to know as so=
on
> > > > as possible). =20
> > >=20
> > > Now yes, a dtb without a root node is an invalid dtb but soon with ad=
don this
> > > will be allowed [1]. =20
> >=20
> > Ah, ok.  I haven't looked at the addon stuff yet.  I do intend to, but
> > it will certainly take a while (70+ patches!).
> >=20
> > So, I'm guessing here, but it still seems odd to me that an addon with
> > no BEGIN_NODE tags at all could be useful.
>=20
> No BEGIN_NODE doesn't mean and empty addon.
>=20
> Addons can have only orphan nodes without any root node. Those orphan nod=
es are
> nodes existing in the base devicetree the addon is applied to. Addon need=
s to
> refer those existing node and this reference is the orphan node.
> --- 8< ---
> /addon/
>=20
> &node_from_base_dtb { /* <--- Orphan node. Node defined in the base DT */
>    node_defined_in_addon { /* <--- Node added by the addon once applied */
>       ...
>    };
> };
> --- 8< ---
>=20
> In the addon, those orphans are identified with BEGIN_NODE_REF [2] and ca=
nnot be
> considered as root nodes.

Ok.  So, in any case fdt_root_offset() would need modification to
handle this: otherwise it will ignore the BEGIN_NODE_REF tag and
continue on, possibly finding a BEGIN_NODE *within* one of the pieces
and incorrectly reporting that as the root.

> [2] addon series, patch 51/74
>     https://lore.kernel.org/all/20260826094950.1088288-52-herve.codina@bo=
otlin.com/
>=20
> >=20
> > > addon dtbs will be clearly identified (the dt_flags header field has
> > > FDT_FLAG_ADDON set for addon dtbs) and so what do you think if the er=
ror code
> > > returned depends on this flag.
> > >=20
> > > NOTFOUND in case of addon and BADSTRUCTURE otherwise. =20
> >=20
> > I'd need to look at the details of addons to figure out if this makes
> > sense but I'm not opposed to the approach in principle.
> >=20
> > > If you are ok with that, I will update this current patch to return B=
ADSTRUCTURE
> > > in all case. Indeed, addon are not yet available. =20
> >=20
> > Right, regardless of where we go with addons eventually, I think it's
> > preferable to return BADSTRUCTURE for now.  That can be changed once
> > addons are actually implemented.
>=20
> Exactly!
>=20
> >=20
> > >=20
> > > [1] https://lore.kernel.org/all/20260826094950.1088288-54-herve.codin=
a@bootlin.com/
> > >  =20
> ...
>=20
> > > >=20
> > > > Do you need this special casing? Won't the fact you've update
> > > > fdt_next_node() to handle the offset 0 case be enough? =20
> > >=20
> > > The full loop is the following:
> > > --- 8< ---
> > > 	for (offset =3D root_offset, depth =3D 0;
> > > 	     (offset >=3D 0) && (offset <=3D nodeoffset);
> > > 	     offset =3D fdt_next_node(fdt, offset, &depth)) {
> > > 		if (depth =3D=3D supernodedepth)
> > > 			supernodeoffset =3D offset;
> > >=20
> > > 		if (offset =3D=3D nodeoffset) {
> > > 			if (nodedepth)
> > > 				*nodedepth =3D depth;
> > >=20
> > > 			if (supernodedepth > depth)
> > > 				return -FDT_ERR_NOTFOUND;
> > > 			else
> > > 				return supernodeoffset;
> > > 		}
> > > 	}
> > > --- 8< ---
> > >=20
> > > The test 'offset =3D=3D nodeoffset' is the problematic one. nodeoffset
> > > is the parameter passed to the function.
> > >=20
> > > I have chosen to avoid offset 0 for the root node and I have updated =
'nodeoffset'
> > > previously if it is 0.
> > >=20
> > > Even if fdt_next_node() updates 'offset' if it is 0, 'nodeoffset' has=
 also to be
> > > update if it is 0. Indeed, 'offset' will be updated from 0 to the rea=
l root node
> > > offset. In all case to have the test be correct, 'nodeoffset' should =
be updated
> > > to the real root node offset if it is 0. =20
> >=20
> > > Having fdt_next_node() updating 'offset' if it is 0 will not handle a=
ll case.
> > > When offsets comparison is done, both offsets should consider the rea=
l offset of
> > > the root node instead of the 0 value. =20
> >=20
> > Ah, right.  I missed the fact it was updating the nodeoffset
> > parameter, rather than the working/starting offset.
> >=20
> > > Also the fdt_supernode_atdepth_offset() can be called with 'nodeoffse=
t' set to the
> > > real root node offset instead of 0. Indeed, fdt_root_offset() is avai=
lable (and
> > > needed). =20
> >=20
> > Theoretically we could avoid explicitly looking at the root offset for
> > 'offset', by starting 'offset' negative and moving the fdt_next_node()
> > to the start of the loop body instead of the end.  That would handle
> > the nodeoffset =3D=3D root_offset case, not not the nodeoffset =3D=3D 0=
 case.
> > Arguably we could disallow the later - finding the non-existent
> > supernode of something we know at compile time to be the root node
> > isn't very useful - if it only turned out to be the root node at
> > runtime, I'd expect it to have come from another function, which
> > should give us root_offset rather than 0.
> >=20
> > But.. it's certainly safer to keep it working whether passed 0 or the
> > real root offset.  There are other ways we could do it, but I think
> > they'd turn out equally inelegant.
> >=20
> > Ok, makes sense to me.
>=20
> Ok, I will update fdt_check_node_offset_() to have it updating its offset
> parameter to the real offset of the root node when its value is 0.
>=20
> Based on this update, will see where it goes. I mean, impacts on callers,=
 if
> it simplifies things or not, if the offset update needs also to be propag=
ate
> to caller's parameter or any other similar point that we can see during t=
he
> implementation.
>=20
> Having something implemented and available in a patch will be the best to
> compare changes and impacts related to fdt_check_node_offset_() update.
>=20
> Here we have a version of handling offset 0 vs real root node without any
> offset update done in fdt_check_node_offset_(). In the next iteration we =
will
> have the version with update done in fdt_check_node_offset_().
>=20
> I think the golden rules to follow on this point is "keep it as simple as
> possible".

Agreed.  Feel free to repost just the NOP before root patches on their
own.  At this time, frequent small series is easier for me to tackle
than occasional large series.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--OIjszocFmTCYBpEJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqXyscACgkQzQJF27ox
2Gf0GhAAmEt08BeeQE7bnr8xjaC2oJOhBjSuvOBx6BuboyE/WtlkIJi2eH7cHO1z
AVpayjhkmKVe11KE6v5t9assJBMeWeOlrcLad6ebdtLkWCsIXMrkHQX+STu2Qv7i
TmQD8mNXqDDWHJhpgl74VHsYcR6QSpp7gvBO/icvedMPoVnkCmyMDcJiAsEVar/D
61SGlayXs4UpDWuvsqiVpXlAN+xWhXlaf+ynmDpeStNYrS69bpiXruom/JvX0yAC
XLPHkBTsZfXYk0LsIOM9YwmHnw6iqSvJHeLnTaaYsYlTgVCS1/AYxYKzS4auST2u
GNI850Xht/H3dMB88w1ttAtzmjBYsXALVfblUdcADg7blqotGWofvW4t4qim/iX6
Nf54mO92rriacXlDarh0T9jJRtSFGCQFj5/hIzBw1eQZnuTH0Q3gQAnrVd/X90nk
OlZzBMIUkFpCyEZUNOeNVeFLpnowJVwNIYxpSm5UkkT1cac7Frw+xn857yJMaGBd
FkFo3VzbQof/yA3lI/F5jq35dJT43J8Hs47se5vlsKjP6i3IeXKVD1dkQEaNYEBe
ZJx29+T8gprNLT/d95nzSrd6rEk5cau9yCLpVj2mL0bUiHW/B3f2+fg/WG9qmRoT
JuLGgGd1kZXw6Q2YD/3BCCgP8ABgqlzXVzVbdeZUxeh9+1ASmVY=
=Q6Ju
-----END PGP SIGNATURE-----

--OIjszocFmTCYBpEJ--
