Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785683;
	b=vRMgbMes6oZa0Ud5LwKyDYi/YN/UWMVsDy5dp/Jh+/ewJExskQW8uhGpsjba+zUjxvuN
	 /Dj5lTgL5mm6HjnyeJJzW7wFKVKX85/fHWo/jKA/ahwctrpv46bvvad57Npp0Tb/RknhC
	 uWHe5VKIbouyFxxiy2swa5uVSWAd5s1qeNH4Tek2neA8lLcdbbQDwfEwIPeZXdrbuD2tm
	 Alj0ov5zy5kmd2HVTCMzdWC+UZ4Lpip2ci8nN4KDvk+tafOuiPdfoA49lkgYklXi4aw1r
	 DAI4FaUyXkcNFmeFH6r8sV1Ko5GaN+qW1/LU+LIabF7swQpBBEAE/87Pa/SOlYd25Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785683;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=BEyf/PzQTw8lJbpEeXqHevmaFR1OJmxhCHgI0s5IBjM=;
	b=3KzCOyfo4fOkiO8qsAifRvq6J/rpJ7QBdxFehE3fgAXVWzf+XR/+XHnBYNcpX6oUmJh+
	 rVusAhdbJd82nJZeIs2vi1l8m+4z06awoWFklT66aPRMesbsMEQ1+x9qv7m8cpLOE6MLm
	 /dUVITLjU9eE2aSiwgMCNYBXD4L2ctXRuoV3SyHRl5C68bvPANPzmqp6bYYmntTIVAybo
	 7lH6Xjo6cR43Yc4AQNIPoAs3dbYX/T9jpo2eBeYmIzz/f5cUgFpyoL0MnUm2SmFLBKZOJ
	 gk1jc+EzHOwbrZIw6mzTsHZGpfSWZbYptdTF9agfCYLw1bH35bmLTPvHBlDPZlfBC9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872D0606A32C
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 09:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872D0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793785672;
	bh=BEyf/PzQTw8lJbpEeXqHevmaFR1OJmxhCHgI0s5IBjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=doMPWJaYq5lukN6159G52qow1L4BY+PNaTXIAdbeLwGXv4ZhbqcVOP0YWXS3NXu5J
	 vyWr/QnVRgWtc5Iff+yfI2UDOXRKx7LlVoVvLO3oKTtejxQx6CQ0ZxUmru8tm4LOza
	 cJ6UvA9gggRhvSEKodUZYggrMmrZM3z5DFSrGN7Yrm5YX5suLVVFFfgASPAxalHPjE
	 YGl7yolX0VGNwUnU11odOI8NkFmB/HQfr+765jomFgM9EHhCQTpkIzt26USwWLrWVo
	 1ZigI24yjQp/SJOc2hn3LJz73w0uKgu8aORTC5upWPIkOkNpYQqya7jo76gG7yDFg7
	 twLrmV9/s1ThQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKLGJ6rCbz4w9g; Wed, 04 Nov 2026 20:47:52 +1100 (AEDT)
Date: Wed, 4 Nov 2026 20:34:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
Message-ID: <aur8CLGwivr22fxU@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-3-sjg@chromium.org>
 <auhctwoLtdWs9p-7@gractus.seuss>
 <20261103185620.3bba770a@bootlin.com>
 <aurRguellIz-7spN@gractus.seuss>
 <20261104092911.2f24be5d@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="X9I+wnAXlxH05x/k"
Content-Disposition: inline
In-Reply-To: <20261104092911.2f24be5d@bootlin.com>

--X9I+wnAXlxH05x/k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 09:29:11AM +0100, Herve Codina wrote:
> On Wed, 4 Nov 2026 17:32:35 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, Nov 03, 2026 at 06:56:20PM +0100, Herve Codina wrote:
> > > On Mon, 2 Nov 2026 20:49:48 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Sun, Nov 01, 2026 at 09:36:56AM -0700, Simon Glass wrote: =20
> > > > > A dts file is made up of top-level fragments: the root node, later
> > > > > definitions of a node by label or path, and /delete-node/ or
> > > > > /omit-if-no-ref/ with a reference. We would like to deal with each
> > > > > fragment on its own before it is merged, for example to apply del=
etes
> > > > > consistently or to run some checks on each one, but that requires
> > > > > keeping the fragments apart. At present the parser merges each on=
e into
> > > > > the tree as soon as it is parsed.   =20
> > > >=20
> > > > Btw, I'm extremely open to a better name than "fragment" if one occ=
urs
> > > > to you.  I believe I originally thought of these as "overlays" but
> > > > that's confusing since runtime overlays were invented. =20
> > >=20
> > > "A dts file is made up of top-level fragments: the root node, later
> > > definitions of a node by label or path"
> > >=20
> > > A node reference by a label or a path is not a definition of node, it=
 is
> > > a reference to a node.
> > >=20
> > > Once those references are merged (if possible), we only have a root n=
ode
> > > and orphan nodes (nodes without a parent node). Indeed, those orphan =
nodes
> > > reference a node out of the current devicetree (dts or dtb). =20
> >=20
> > Yes..
> >=20
> > > Orphan nodes are just references that cannot be merged in the current
> > > devicetree.
> > >=20
> > > Instead of "fragment", "unresolved" ?
> > >=20
> > > &label {
> > >    prop;
> > > };
> > >=20
> > > Is an unresolved node while &label is not resolved to an existing nod=
e.
> > >=20
> > > We try to merge those unresolved nodes (label resolution + merge) and=
 any
> > > unresolved nodes that are not merged (label not resolved) are orphan =
nodes.
> > >=20
> > > The exact same occurs when we use paths instead of label. The only di=
fference
> > > is that a path can always be resolved. Having an unresolved path is a=
n error.
> > >=20
> > > With that in mind, having a look at orphan nodes in the addon series =
[0] (patch 44
> > > and following ones) could give some ideas.
> > >=20
> > > Does it make sense ? =20
> >=20
> > That's all true, but I don't see what you're suggesting.  Here I'm
> > looking for a name for the syntactic top-level construct, whether or
> > not it's resolvable within this file or not.
> >=20
>=20
> struct node {
> 	...
> 	const char *ref;  /* Only orphan nodes doesn't have a name but a ref */
> }

I don't think this is a good change.  Most nodes don't have this a
fragment (or whatever we call it) is a structurally different element
that should have a different representation.

> struct dt_info {
> 	struct node *root;
> 	struct node *orphanlist;
> 	...
> }
>=20
> When you parse, you create the orphanlist with orphan nodes (same order i=
n the
> list as the order in the dts) without trying to merge.

"orphan" is a bad name here - the "orphan" implies we don't have a
parent we can attach them to, which we don't know until we attempt to
resolve during merge.

> Once done, build_dt_info(..., root, orphanlist);

That's a good function signature (apart from the "orphan" name).

> Then, in build_dt_info() or later:
>=20
> reduce_orphans(struct dt_info *dt_info)
>   - Handle deletes
>     You have the root node and the orphan list with item in the same orde=
r as
>     they are found in the dts. Deleting node available before the "/delet=
e-node/"
>     keyword should be doable.
>   - Merge as much nodes as possible from the orphan list. This merge orph=
an
>     nodes in either the root node or a possible previous orphan.

Sure, but this isn't meaningfully different from the current draft (I
think, I haven't finished reading it).

> After this call:
>  - All possible deletes have been handled
>  - Orphans are reduced to real orphan without duplicates (merge done when
>    possible).
>=20
> For dts, this orphan list must be empty.
> For overlay or addons, this orphan list can have items.
>=20
> Perform the checks with this structure.
>=20
> Generate output:
>   For overlays: Convert to /fragment@N/... then generate the output
>   For addons: no conversion needed, generate the output
>=20
> Do we want to handle deletes at runtime ?

No.  Runtime overlays are already a nasty hack, I don't want to add
more complexity to them.

> The only relevant is having an overlay or addon the capabilities to
> delete an orphan node. In that case, at runtime, instead of merging
> a delete is perform. This use case is not handle yet but to handle
> them:
>=20
>   - reduce_orphans(struct dt_info *dt_info)
>     Delete what you can delete
>     Keep orphans with delete flag in the orphan list (after reduction)
>   - Generate output
>      for orphan with delete flag, encode the delete information (new node
>      metadata tag). Those orphan with delete flag should be empty. No
>      property to merge, no node to merge. Indeed they are in the output
>      just to tell that the related node in the base tree must be deleted.
>=20
>=20
> Now checks(). The orphan list has been reduce to the strict minimum. Is t=
hat
> ok for checks() you have in mind?
>=20
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--X9I+wnAXlxH05x/k
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrq/AgACgkQzQJF27ox
2GdYMQ/9EmSn1V8L4PAqjUoNCYfuP1SXnYQIiU3zYwMBxnaHY1zN1zaKOYpTZKb8
6vnSijfU5xXiWleXeSShLzwAMd3pf/IEdtiQNMXbNQPy+Xe0XronUJ9oOO+Y2bsR
1LAHV4TWzWbASA63HnXu+MDL7rCdKJBDsHD/PY6bT9cYDnE8v3giXNaAm4X4QU+0
TlEOkvl0zBgokeRuxRw1MxMTStsWa/DeUUs9RkuKohb21sPmuhJ6EvFjcHu7HCQq
AXUU7JgAJBSsC8beOuW8NKlH9iWA5BYXJxrSNm996wG8wjr32KC3VCkFxxUrpvmn
BSnBY7AuJg84C3e3ZZv8kFyi8qaNRcwCWHEupxAVU6KsMyKywVS02bDcqBW1bXhR
O5j37MMMSHg+hzx/3ScNnDGZPrAnOfP7HbiQXs5PWXIfRVloizwJNFrv6VH7FClo
6DE31pRHI/ahaJnTt6/xTWUFNMFfzJ2STb/1Q9Raz6PyeJrrVDrsZ9ff+9lCVncy
w7+NjvU0nEPTgDzodxR2zRcbBhV4/O7Xzm+U4ZxGvKQ4eiUlAth4sK/DaZrzm0Rn
/EYOLjXAYn0461XOKdSj9Re7Zh/5igeZkk6Z7fNAXin/fdSCnb1DIhYRObxiYXoi
IOoBcSFaD14wkvNpDL8HqFe6t5j82lYoCXtMvp/4Y5NBiPeKKe8=
=Sz6y
-----END PGP SIGNATURE-----

--X9I+wnAXlxH05x/k--
