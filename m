Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592ED2BE7DC;
	Thu, 15 Jan 2026 06:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768457469; cv=none; b=D9hP3i/HBaIlwkKj9ofE44p9mv9baCi7kqQqXPVXG2tmrZf1YbnN7JipqLEgvrcGsVR4oMem5BnhmLOWtAVg14S5WC1CP7CmXBESHeE76wtcSGmZjvfGfvfnocUmGrmVskJcaBpW7eLjrI5nOCLFGpkxKqfQakBzo60hVXRmxi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768457469; c=relaxed/simple;
	bh=IccqRbohviQHOzGv5FpS7gkuhbdDbdxnAvaJanBSgF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqoVnXZwU1rFmP/TINqgyHM9aFCivmR+eirbqpeAG8R+s7h/07Y5ixRoivM054yOzN/V8hd+8gGIw5daesnsoU8VXEuEo9VK6EyWBhixyHt7uG+wT2Y833AJewqEGRZ30dylC7JyWYTp92CcJS2bG5LhvuU7v29ahZ4IwEfVzQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Fdf8S8Hy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Fdf8S8Hy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768457464;
	bh=/v+N4wFOjxE6v9I32IgBpE1ZnWV8wLwwopP2wGH6470=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fdf8S8HygMrVNV9T2Rhux7horZmdpNSH1cChkDUpEhvHoRhhfy+0gvbPueR4Mvz9H
	 Rmc+utZODyovDbrNLyf3EudIKtcJbo2ucuhH68eBJnAuk8ir7qla9XovSBvNGw2Cxi
	 zxYFlTCKZWfiTMfpWcc9i7rOxZOnn9ELvNfGs2J0QywwUWKNq6kEd2DV3eVjCxXZ5U
	 TOy9EbhPFZA1roQrppyfHGK0igHoI8x93lWQd569oCiMXOL7PjG/Y7ZUWIAfNP3gPd
	 o8KnbklPTXtgBLq8IFc1SBsNbunnRHNo+ir8vBz+fDbi2IurRKbg516xcSglp2DQiF
	 si8AHFux+/Kdg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsCKN4gNQz4wDk; Thu, 15 Jan 2026 17:11:04 +1100 (AEDT)
Date: Thu, 15 Jan 2026 16:52:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 19/77] dtc: Introduce export symbols
Message-ID: <aWiAmjfMiKpC4sdp@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-20-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XD8FN+vyk2YjwFtR"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-20-herve.codina@bootlin.com>


--XD8FN+vyk2YjwFtR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:09PM +0100, Herve Codina wrote:
> Export symbols allow to define a list of symbols exported at a given
> node level. Those exported symbols can be used by an addon when the
> addon is applied on the node exporting the symbols.

This seems to imply an addon always applies at a single node location.
I'm not sure that's a good design choice, since I don't see how it
covers the case of something that connects to several connectors.

> In order to perform
> its symbol resolution. Any unresolved phandle value will be resolved
> using those exported symbols.
>=20
> The feature is similar to __symbols__ involved with overlay but while
> all symbols are visible with __symbols__, only specific symbols
> (exported symbols) are visible with export symbols.

This paragraph doesn't make sense to me.  What's a "symbol" if it's
not something in __symbols__ or export symbols?

> Also an exported symbol has a specific name and this name has to
> used for symbol resolution. Having this specific name allows to:
>=20
>   - Have several nodes providing the same exported symbols
>     name but each of them pointing to different nodes.

That's not a property of having a specific name, that's a property of
being local to a node.

>     Without looking at the detail of the syntax, node-a and node-b
>     export the same symbol foo but pointing to different node.
>       node-a {
>         /* export foo -> /path/foo1 */
>       };
>       node-b {
>         /* export foo -> /path/foo2 */
>       };
>=20
>     This allow to have the exact same addon referencing 'foo' applied
>     either on node-a or node-b.
>=20
>   - Have several board describing a well defined node even if resources
>     needed for exported symbols are not the same.
>=20
>     On board A, the 'ctrl' exported symbols points to some ctrl device
>     available on the SoC:
>       node {
>         /* export 'ctrl' -> /soc/ctrl@1000
>       };
>=20
>     On board B, the ctrl device used is on a i2c bus
>       node {
>         /* export 'ctrl' -> /soc/i2c@5000/ctrl@10
>       };
>=20
>     The addon can be used on board A and board B without any
>     modification. It uses 'ctrl' exported by the node the it is applied
>     to.
>=20
> Introduce the 'symbol' internal data structure and the export symbol
> list related to a node.
>=20
> No functional change yet but preparation for the future support
> for export symbol parsing.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc-parser.y |  6 +++---
>  dtc.h        | 13 ++++++++++++-
>  flattree.c   |  2 +-
>  fstree.c     |  2 +-
>  livetree.c   |  7 ++++---
>  5 files changed, 21 insertions(+), 9 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 2e152b0..9c93673 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -183,7 +183,7 @@ devicetree:
>  			else if (is_ref_relative($1))
>  				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1=
);
>  			$$ =3D add_orphan_node(
> -					name_node(build_node(NULL, NULL, NULL),
> +					name_node(build_node(NULL, NULL, NULL, NULL),
>  						  ""),
>  					$2, $1);
>  		}
> @@ -270,11 +270,11 @@ devicetree:
>  nodedef:
>  	  '{' proplist subnodes '}' ';'
>  		{
> -			$$ =3D build_node($2, $3, &@$);
> +			$$ =3D build_node($2, $3, NULL, &@$);
>  		}
>  	| '{' subnodes '}' ';'
>  		{
> -			$$ =3D build_node(NULL, $2, &@$);
> +			$$ =3D build_node(NULL, $2, NULL, &@$);
>  		}
>  	;
> =20
> diff --git a/dtc.h b/dtc.h
> index c0fffd2..6508694 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -204,6 +204,16 @@ struct label {
>  	struct label *next;
>  };
> =20
> +struct symbol {
> +	bool is_local;
> +	char *name;
> +	char *ref;
> +	cell_t phandle;
> +	char *fullpath;
> +	struct symbol *next;
> +	struct srcpos *srcpos;
> +};
> +
>  struct bus_type {
>  	const char *name;
>  };
> @@ -224,6 +234,7 @@ struct node {
>  	char *name;
>  	struct property *proplist;
>  	struct node *children;
> +	struct symbol *exportsymlist;
> =20
>  	struct node *parent;
>  	struct node *next_sibling;
> @@ -272,7 +283,7 @@ struct property *chain_property(struct property *firs=
t, struct property *list);
>  struct property *reverse_properties(struct property *first);
> =20
>  struct node *build_node(struct property *proplist, struct node *children,
> -			struct srcpos *srcpos);
> +			struct symbol *exportsymlist, struct srcpos *srcpos);
>  struct node *build_node_delete(struct srcpos *srcpos);
>  struct node *name_node(struct node *node, const char *name);
>  struct node *omit_node_if_unused(struct node *node);
> diff --git a/flattree.c b/flattree.c
> index bedb286..36b795d 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -809,7 +809,7 @@ static struct node *unflatten_tree(struct inbuf *dtbu=
f,
>  	uint32_t offset;
>  	const char *str;
> =20
> -	node =3D build_node(NULL, NULL, NULL);
> +	node =3D build_node(NULL, NULL, NULL, NULL);
> =20
>  	flatname =3D flat_read_string(dtbuf);
> =20
> diff --git a/fstree.c b/fstree.c
> index 0f9a534..445ae53 100644
> --- a/fstree.c
> +++ b/fstree.c
> @@ -19,7 +19,7 @@ static struct node *read_fstree(const char *dirname)
>  	if (!d)
>  		die("Couldn't opendir() \"%s\": %s\n", dirname, strerror(errno));
> =20
> -	tree =3D build_node(NULL, NULL, NULL);
> +	tree =3D build_node(NULL, NULL, NULL, NULL);
> =20
>  	while ((de =3D readdir(d)) !=3D NULL) {
>  		char *tmpname;
> diff --git a/livetree.c b/livetree.c
> index 2a0a7ed..0050492 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -86,7 +86,7 @@ struct property *reverse_properties(struct property *fi=
rst)
>  }
> =20
>  struct node *build_node(struct property *proplist, struct node *children,
> -			struct srcpos *srcpos)
> +			struct symbol *exportsymlist, struct srcpos *srcpos)
>  {
>  	struct node *new =3D xmalloc(sizeof(*new));
>  	struct node *child;
> @@ -95,6 +95,7 @@ struct node *build_node(struct property *proplist, stru=
ct node *children,
> =20
>  	new->proplist =3D reverse_properties(proplist);
>  	new->children =3D children;
> +	new->exportsymlist =3D exportsymlist;
>  	new->srcpos =3D srcpos_copy(srcpos);
> =20
>  	for_each_child(new, child) {
> @@ -248,7 +249,7 @@ struct node * add_orphan_node(struct node *dt, struct=
 node *new_node, char *ref)
>  	xasprintf(&name, "fragment@%u",
>  			next_orphan_fragment++);
>  	name_node(new_node, "__overlay__");
> -	node =3D build_node(p, new_node, NULL);
> +	node =3D build_node(p, new_node, NULL, NULL);
>  	name_node(node, name);
>  	free(name);
> =20
> @@ -892,7 +893,7 @@ static struct node *build_and_name_child_node(struct =
node *parent, const char *n
>  {
>  	struct node *node;
> =20
> -	node =3D build_node(NULL, NULL, NULL);
> +	node =3D build_node(NULL, NULL, NULL, NULL);
>  	name_node(node, name);
>  	add_child(parent, node);
> =20
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--XD8FN+vyk2YjwFtR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlogJkACgkQzQJF27ox
2GdBbhAAhx1AqQLi10diw6dCxHYMb3MK64lP5lJbMG6K+iNvCr0n3W2AkJsUY9De
+2sMCYvjwTfhbdEznnly7DKio/cx+xoJjwByVv5lUgLClh1CgX0FEWacWj/zoFsf
PmtT+4TBr4pNILvY5scI+kil5REsGmrW7gl+a+jDPGDQL3h4RmJvB4ksNCw+uzMd
N92dC2Oi+I/5w1MiZq2MkDb5/ZZqbXiOPdQMegoFh1EL2KSKx8apurbLm61jendi
onapLXHQD0S3ZQGlmDloeE7uYnaBZtJ9hH3qjLcTtbFJG5sUWcAyNMlkeYITuvVq
vNxVud+IQaVMc9s9sl5gTvsRkNGPuXMlCAGkDNVAgJjzkW1bjczYzPoiIksJ9r+2
cE+b+E0p/bn2ex8iSJNuiOFmyngXyad9oqII1nYhqoIfJEz7e+OrYalakT0rsngx
hV2/ZqadID/gyVNHC1bf1s7JA25Eofi2pILCd9f+RjG1uN+GeFA5CspDWiugpN7I
dbMrjkqOE3Qv9l8kBfSqI4AFd6SlXh1W5O/QIjIzIDFcDouNBgjdnu+8Z5TrmWr/
ByEN7DyFOgjKps2IbUQooKyhykli7fOM/uz8aKyEjEhmQTmWOl9BXdbKsmt+x1Io
vJwSvJVZUQTyPkRTJxjiyc3rofusDLZKVadtll8xFR0pZcEtO2U=
=qZTm
-----END PGP SIGNATURE-----

--XD8FN+vyk2YjwFtR--
