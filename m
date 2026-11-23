Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396078;
	b=wrBLSJH1P+oTnwKOAR3dfMdAxwR4HWeDFPvCVcxrJFsfVXY8m5yfLPWr+Efk1skzgidF
	 evtAWFcuBw8t/NBAHStYq9JM/0F8bXzrV1cbWC9COLE8QtetfSsfH4fNHUSxrQiDeg/8v
	 Bc5wJjfr4haaZbuqJdU4PMRU+5/NZL33tVPCAWYJmxRk9Ls+TknuTVMsocYTr1YLXAeml
	 dbhQaMNfGTEcXeCvc1KxvG8Z83IAwUJoWEKHTtlordGYe/3N0U+GfKATluCpz0u4Gp6hp
	 +tTYAHNEZFwlY3NWw8s/WlzJZtoLWNLz4N4ZeH1ww/pRklOJToFzW137+63Il4VQkaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396078;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Op6F7RuAD9kFLGsx1Fc12H3633P6MpRDK9xU8tzXi4M=;
	b=H6+ghm3+OVrzQtepUKnOILye5VQN4kkqcujkz0/wS8f+B8V8/jLi6BzsDGFWIEYVZ6Qf
	 TMUVsD82SH6BeuA+Qqx0COxsUYafM8RefT81BlrjY8IGE6lhaunx/jR6Lie/f986APg32
	 /qru4Cl20Y/OsSfZW+4ntnCzgjvEvmeDoLkKpoSEHZyNQHELruV7nn35wuLqNmyjrUyBW
	 wIgXcFvZO+jVNYZgXz15tg7xRREXLp5/Uy8bW8pzTEr4G45+FQfjdqHzDbiI5CH56sOaw
	 B4k+ulspoB+rBLbTFWc4LjWQ+LUWmSYtCgVwIfkqTjL3F3oBhT5Es/ingguDaZzWC3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=fAZkLfyJ;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADD6606A31A
	for <devicetree-compiler@vger.kernel.org>; Mon, 23 Nov 2026 01:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADD6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=fAZkLfyJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795396069;
	bh=Op6F7RuAD9kFLGsx1Fc12H3633P6MpRDK9xU8tzXi4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fAZkLfyJtytAB0qt4Cs6eI63U8kt+xgUrHE+QyS4NZAF0Hb2XfVztB1RUf2Kh1+zB
	 /jHRZ7zNJpjWzjNJJB6P30M/1fYg0fsZ+Hf3l8oLzoAWpD1s/vIsUYD+DBBvYNNsc9
	 zGt5kh2geuj5TqmsKulgFQNL+drEXnTG5yO637ekDRYqKNnzwX3ma6f7CvZB06Sco6
	 BiJaxaYPf2Zocx/PX5IynYypnLlbQbppIlnp8JTlL9xq1u9JS+DmOFqYBivHPbfTXs
	 k0+S6IDnYwUUvD+HgTgKu9m/0JePvveFvWz8aQRtZ+jdecPWQ7THQ989XvKzLBNpox
	 BbEFAnJ3ScIGw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jXnqT1cvZz4wJL; Mon, 23 Nov 2026 12:07:49 +1100 (AEDT)
Date: Mon, 23 Nov 2026 11:34:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v3 16/18] dtc: Add the overlay fragments from
 merge_fragments()
Message-ID: <awOKCRIXaGuJuR9c@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-17-sjg@chromium.org>
 <avqCubv6DB--kLeB@gractus.seuss>
 <20261119163508.48721934@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="wRLWxHbCrBmDGj1w"
Content-Disposition: inline
In-Reply-To: <20261119163508.48721934@bootlin.com>

--wRLWxHbCrBmDGj1w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 04:35:08PM +0100, Herve Codina wrote:
> On Mon, 16 Nov 2026 15:12:42 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Nov 06, 2026 at 12:51:43PM -0700, Simon Glass wrote:
> > > In a plugin, merge_first_ref() and merge_ref() call add_orphan_node()=
 to
> > > turn a fragment which refers to the base tree into an overlay fragment
> > > (a fragment@N node). The grammar actions have always done this, but it
> > > mixes converting the plugin to the overlay format into the functions
> > > which merge each fragment.
> > >=20
> > > Have merge_fragment() tell its caller when a fragment is for the base
> > > tree, and call add_orphan_node() from merge_fragments() instead, so t=
hat
> > > none of the merge_*() functions does the conversion. Add a comment for
> > > add_orphan_node() too.
> > >=20
> > > This does not change the output.
> > >=20
> > > Suggested-by: Herve Codina <herve.codina@bootlin.com>
> > > Link: https://lore.kernel.org/devicetree-compiler/20261105100714.47bf=
0434@bootlin.com/
> > > Assisted-by: Claude:claude-opus-5-5
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > ---
> > > dtc gives the same output and messages as before for every .dts and
> > > .dtso file in Linux v7.3-12284-g3799eeb906c9
> > >=20
> > > Changes in v3:
> > > - Add new patch to add the overlay fragments from merge_fragments()
> > >=20
> > >  livetree.c | 47 +++++++++++++++++++++++++++++++----------------
> > >  1 file changed, 31 insertions(+), 16 deletions(-)
> > >=20
> > > diff --git a/livetree.c b/livetree.c
> > > index f2c7703..c5fec49 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -225,6 +225,15 @@ struct node *merge_nodes(struct node *old_node, =
struct node *new_node)
> > >  	return old_node;
> > >  }
> > > =20
> > > +/*
> > > + * Add an overlay fragment (a fragment@N node) to the root of a plug=
in, for a
> > > + * node which refers to the base tree. The node becomes the fragment=
's
> > > + * __overlay__ subnode and ref gives its target, either a path (targ=
et-path)
> > > + * or a label (target, as a phandle reference). Fragments are number=
ed in the
> > > + * order they are added.
> > > + *
> > > + * Returns the root node, dt
> > > + */
> > >  struct node * add_orphan_node(struct node *dt, struct node *new_node=
, char *ref)
> > >  {
> > >  	static unsigned int next_orphan_fragment =3D 0;
> > > @@ -611,9 +620,9 @@ static struct node *lookup_ref(struct node *dt, s=
truct fragment *f)
> > >  }
> > > =20
> > >  /*
> > > - * Make the tree at *dtp from a first fragment which refers to a lab=
el or path,
> > > - * rather than being the root node. This is only valid in a plugin, =
where the
> > > - * fragment becomes an overlay fragment.
> > > + * Make an empty tree at *dtp for a first fragment which refers to a=
 label or
> > > + * path, rather than being the root node. This is only valid in a pl=
ugin, where
> > > + * the fragment becomes an overlay fragment.
> > >   *
> > >   * Returns true on success, false on an error, which has been report=
ed.
> > >   */
> > > @@ -628,9 +637,7 @@ static bool merge_first_ref(struct node **dtp, st=
ruct fragment *f, bool plugin)
> > >  			     "Label or path %s not found", f->ref);
> > >  		ok =3D false;
> > >  	}
> > > -	/* Make a new, empty tree with a fragment@N node for the reference =
*/
> > > -	*dtp =3D add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""=
),
> > > -			       f->node, f->ref);
> > > +	*dtp =3D name_node(build_node(NULL, NULL, NULL), ""); =20
> >=20
> > This seems a bit awkward, since this operation no longer resembles any
> > kind of merge.  Seems like it would be nicer to unconditionally create
> > an empty tree in merge_fragments(), then "merge" everything into it,
> > including root fragments.
>=20
> In the future with addons, we could have a only orphan nodes.
> Creating and empty in merge_fragments() will lead potentially an this emp=
ty
> available even if no empty root nodes were present in DT.

Right.. but for the addon case we can call something different from
merge_fragments() that does the right thing for that case.

> This empty tree is needed for overlays. I don't think that having and emp=
ty
> tree artifact created by merge_fragments is the right solution.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--wRLWxHbCrBmDGj1w
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsDigkACgkQzQJF27ox
2GcNAA//QZp0o6iMonhE9e1o0ZZdbZqLdHjmtaH7ywVIxTFrlVGQPsngkxweXTbp
H46FkEu4eQzHpEMnTqDn6wfTqPIcj1fx3DIOkRLKoAlHAima9StxAC5+KV1dc5Te
VAk7/aUb1JS9OQyh5ws5omzwS0s8IGzb9Z6lmIdmhKGAnQobhops3XX3Qgf1rkt7
N16RppTylPzzQYcSkeMYz5Pl3My19pZshAnyDU5Gw26CaLXRUaq2cXtkn5kGqzFc
OQHFX4pyvvvzbRgg4/PRKnyfFD2hBP32zlZIjCy2KEXYXU5THH5bGQU7JgwLvCEP
JpvebsCyXd+8/MEAzIAmcFS85F+gwfrBbmy/hkyvOFoXAWrhcp09llvBll95VAE5
t/eci+18NS3/2ybzK1Q+GVTVGDVJHuNZDiXP90NoHj3oSFIs4zyAwDB2PBRXtL8/
mbSBL4ecz1IlGIbbOB6TrAxazk3UbcteMlscxSfwtEF2qgKVIA467592zGOF3R96
pR2NOQeX4iSZPXTpMf7c5UUjmSpSauk62J0scUhxhH//Ew1JjUwLonMhqFjZA46n
DRim0dVsGzjVOIMsJ+acR05zPe+wel+epPmWFFKFQADXr+noVVZahYIT1zBIc2Wl
D25ayCITMROIqYSmabBJgl0X+VE41qT7rJQGzUFZXiVQTGnYPgU=
=HOCq
-----END PGP SIGNATURE-----

--wRLWxHbCrBmDGj1w--
