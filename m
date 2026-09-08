Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B833F589;
	Tue,  8 Sep 2026 06:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849741; cv=none; b=ZeCNcn/tRSpfCCaLQ0db4UJp+d4vTKtkA9JCMIj+J+FIOvlvNZd6TX4GDZv+mfrL1m9Sf5n1lCCv8B7v/ziUhgtYuQGZ14gUnvOH0nvXBzgxKIOqOmGZ1G7JETlQDcLbVv0jAIoA6OX947GLmbrLJ2tIoBvRdQXcjmbF/NHm3Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849741; c=relaxed/simple;
	bh=R1LsAciT+xsC2ZiK1jLwcFP0kPKlFlMJbz4ySywZy0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ue3d6yUxf270u+yUI5N/wCtcqvOtJcgY0iHzwHjxITifkUgS4ByRofbGeujIlz6YMgLpJO5v0v9jawch+FQI7ZO2ZwO2XfdfLZ0DPTD1m8kaLV+bd61FJ8veN7CnQ2p0MY6EgJndhC//fPf2f9idHw4Eke7GvT+CluR+ahc7QVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=IB5UQrg6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="IB5UQrg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788849726;
	bh=HW8YPibjl9buYwl5JB/jgTRDOYqx1+/Fng2gFbCfFww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IB5UQrg6Z0kgAIKuXNeDpSIK2QfJapcwSWfy0n88DzYE9cXcXlWd8yRe1OZnSyo08
	 9vJNYAM8TlSMrG7WT7HqvsDKWP0OiNE2PZVDwMyYEwgfznO2hwT+50jSZZ9XAvgcu9
	 C5aMB0rTMVbY96eVRbG7hyOYr6f/5t9gns6tIAR/E+r7wClUroyinA4sMubl08LTVg
	 3bTgMJHUmK3QxE4inbbSFLzijchwUiWbQUXC/bwcpx8DGdxwiqPr16Ifo3XFBQVNpE
	 VNV8L75hRplBObkH2rfq316g0cH9jyS2h3XIFAeZ14X7XEgm5njwSMBYhsM0/yxhgN
	 bg9baiC5TnU5A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hfDrG0bTcz4wSs; Tue, 08 Sep 2026 16:42:06 +1000 (AEST)
Date: Tue, 8 Sep 2026 16:41:06 +1000
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
Message-ID: <ap-t8qMg5VMwh-T9@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-3-herve.codina@bootlin.com>
 <apOhk-NQusFgV5Sx@gractus.seuss>
 <20260831140119.1f14b420@bootlin.com>
 <apaBuQ8kn2bOzYcI@gractus.seuss>
 <20260901141826.49b1a1b7@bootlin.com>
 <apfKx_u3v3GBfzOz@gractus.seuss>
 <20260907184641.537cfa49@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YZwUZMmSg92pVfpF"
Content-Disposition: inline
In-Reply-To: <20260907184641.537cfa49@bootlin.com>

--YZwUZMmSg92pVfpF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 06:46:41PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 2 Sep 2026 17:06:03 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
> > >=20
> > > Ok, I will update fdt_check_node_offset_() to have it updating its of=
fset
> > > parameter to the real offset of the root node when its value is 0.
> > >=20
> > > Based on this update, will see where it goes. I mean, impacts on call=
ers, if
> > > it simplifies things or not, if the offset update needs also to be pr=
opagate
> > > to caller's parameter or any other similar point that we can see duri=
ng the
> > > implementation.
> > >=20
> > > Having something implemented and available in a patch will be the bes=
t to
> > > compare changes and impacts related to fdt_check_node_offset_() updat=
e.
> > >=20
> > > Here we have a version of handling offset 0 vs real root node without=
 any
> > > offset update done in fdt_check_node_offset_(). In the next iteration=
 we will
> > > have the version with update done in fdt_check_node_offset_().
> > >=20
> > > I think the golden rules to follow on this point is "keep it as simpl=
e as
> > > possible". =20
> >=20
> > Agreed.  Feel free to repost just the NOP before root patches on their
> > own.  At this time, frequent small series is easier for me to tackle
> > than occasional large series.
> >=20
>=20
> I've moved forward on the fdt_check_node_offset_() update.
>=20
> The new fdt_check_node_offset_() looks like this:
> --- 8< ---
> int fdt_check_node_offset_(const void *fdt, int *offset)
> {
> 	int nextoffset;
>=20
> 	if (!can_assume(VALID_INPUT)
> 	    && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
> 		return -FDT_ERR_BADOFFSET;
>=20
> 	if (*offset =3D=3D 0) {
> 		*offset =3D fdt_root_offset(fdt);
> 		if (*offset < 0)
> 			return *offset;
> 	}
>=20
> 	if (fdt_next_tag(fdt, *offset, &nextoffset) !=3D FDT_BEGIN_NODE)
> 		return -FDT_ERR_BADOFFSET;
>=20
> 	return nextoffset;
> }
> --- 8< ---

That looks fine.  If it was an exposed function I'd want to look for a
better interface, but as an internal function it's fine.

> If the given offset is 0, fdt_check_node_offset_() considers we want to c=
heck
> the root node and so update offset to the real root node offset.
>=20
> Ok, I still need some fdt_root_offset() calls from some other parts but t=
hat's
> not my main issue.
>=20
> My main issue comes with orphan nodes in addons. fdt_check_node_offset_()=
 is
> called with offset pointing to an orphan node and this offset can be 0.
>=20
> The offset 0 seen by fdt_check_node_offset_() can be the "fake" offset of=
 a root
> node and in that case fdt_check_node_offset_() should update offset to th=
e real
> root node offset but it can also be the offset of the orphan node we want=
 to check
> and in that case the offset should not be updated.
>=20
> fdt_check_node_offset_() cannot determine whether or not the offset shoul=
d be
> updated.

Hrm.  But if offset 0 has an orphan node, we can see that with the
FDT_BEGIN_NODE or FDT_BEGIN_NODE_REF there, right?

> With orphan nodes in the loop, fdt_check_node_offset_() becomes:
> --- 8< ---
> int fdt_check_node_offset_(const void *fdt, int *offset)
> {
>         int nextoffset;
>         uint32_t tag;
>=20
>         if (!can_assume(VALID_INPUT)
>             && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
>                 return -FDT_ERR_BADOFFSET;
>=20
>         if (*offset =3D=3D 0) {
> #pragma message "We have a problem!"
>                 /*
>                  * An orphan node can be present at offset 0.
>                  * In that case, looking for the root node may or may not=
 be
>                  * correct.
>                  * Indeed is offset =3D 0 requested because we want the r=
oot
>                  * node and sadly an orphan node is available at offset 0=
 or
>                  * is it requested because we want to really check the or=
phan
>                  * node available at offset 0. How to determine the corre=
ct
>                  * case?
>                  */
>                 tag =3D fdt_next_tag(fdt, *offset, &nextoffset);
>                 if (tag =3D=3D FDT_BEGIN_NODE || tag =3D=3D FDT_BEGIN_NOD=
E_REF)
>                         return nextoffset;
>=20
>                 *offset =3D fdt_root_offset(fdt);
>                 if (*offset < 0)
>                         return *offset;
>         }
>=20
>         tag =3D fdt_next_tag(fdt, *offset, &nextoffset);
>         if (tag !=3D FDT_BEGIN_NODE && tag !=3D FDT_BEGIN_NODE_REF)
>                 return -FDT_ERR_BADOFFSET;
>=20
>         return nextoffset;
> }
> --- 8< ---

Right.. like that.  Except simpler would be to have fdt_root_offset()
stop when it sees a FDT_BEGIN_NODE_REF as well as a FDT_BEGIN_NODE.
Or maybe that should be, say, fdt_root_offset_(), and
fdt_root_offset() will wrap it to return an error on an addon tree
with no root.

> Of course, extra complexity could be added such as an additional paramete=
r but
> I don't think it would make sense.
>=20
> The simplest way to handle the case is to not update the offset in
> fdt_check_node_offset_() and let callers to pass the offset pointing to t=
he
> real node offset expected to be checked. This is my initial proposal.

Even with the bulky fdt_check_node_offset_() above that doesn't seem
simpler to me.  fdt_check_node_offset_() is largish, but the
complexity is all in one place rather than distributed everywhere.

> Of course, I am still open to other ideas.
>=20
> For information, without addons and orphan nodes, just to compare against=
 my
> original proposal, the full patch ("libfdt: Don't assume the root node is
> available at offset 0") with the offset update done in fdt_check_node_off=
set_()
> becomes:
> --- 8< ---
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 56d4dcb2..d4d4b64b 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -228,16 +228,24 @@ uint32_t fdt_next_tag(const void *fdt, int startoff=
set, int *nextoffset)
>  	return tag;
>  }
> =20
> -int fdt_check_node_offset_(const void *fdt, int offset)
> +int fdt_check_node_offset_(const void *fdt, int *offset)
>  {
> +	int nextoffset;
> +
>  	if (!can_assume(VALID_INPUT)
> -	    && ((offset < 0) || (offset % FDT_TAGSIZE)))
> +	    && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
>  		return -FDT_ERR_BADOFFSET;
> =20
> -	if (fdt_next_tag(fdt, offset, &offset) !=3D FDT_BEGIN_NODE)
> +	if (*offset =3D=3D 0) {
> +		*offset =3D fdt_root_offset(fdt);
> +		if (*offset < 0)
> +			return *offset;
> +	}
> +
> +	if (fdt_next_tag(fdt, *offset, &nextoffset) !=3D FDT_BEGIN_NODE)
>  		return -FDT_ERR_BADOFFSET;
> =20
> -	return offset;
> +	return nextoffset;
>  }
> =20
>  int fdt_check_prop_offset_(const void *fdt, int offset)
> @@ -252,13 +260,38 @@ int fdt_check_prop_offset_(const void *fdt, int off=
set)
>  	return offset;
>  }
> =20
> +int fdt_root_offset(const void *fdt)
> +{
> +	int nextoffset =3D 0;
> +	int offset;
> +	uint32_t tag;
> +
> +	do {
> +		offset =3D nextoffset;
> +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> +		switch (tag) {
> +		case FDT_END_NODE:
> +		case FDT_PROP:
> +			return -FDT_ERR_BADSTRUCTURE;
> +
> +		case FDT_BEGIN_NODE:
> +			return offset;
> +
> +		default:
> +			break;
> +		}
> +	} while (tag !=3D FDT_END);
> +
> +	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND;
> +}
> +
>  int fdt_next_node(const void *fdt, int offset, int *depth)
>  {
>  	int nextoffset =3D 0;
>  	uint32_t tag;
> =20
>  	if (offset >=3D 0)
> -		if ((nextoffset =3D fdt_check_node_offset_(fdt, offset)) < 0)
> +		if ((nextoffset =3D fdt_check_node_offset_(fdt, &offset)) < 0)
>  			return nextoffset;
> =20
>  	do {
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 11f2e2ee..ec8af835 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -281,7 +281,7 @@ int fdt_path_offset_namelen(const void *fdt, const ch=
ar *path, int namelen)
>  		while (*p =3D=3D '/') {
>  			p++;
>  			if (p =3D=3D end)
> -				return offset;
> +				goto terminate;
>  		}
>  		q =3D memchr(p, '/', end - p);
>  		if (! q)
> @@ -294,7 +294,13 @@ int fdt_path_offset_namelen(const void *fdt, const c=
har *path, int namelen)
>  		p =3D q;
>  	}
> =20
> -	return offset;
> +terminate:
> +        /*
> +         * Avoid returning offset 0 or the real root offset.
> +         * Be sure to return one and only one offset for the root node, =
its
> +         * real offset.
> +         */
> +	return offset ? offset : fdt_root_offset(fdt);
>  }
> =20
>  int fdt_path_offset(const void *fdt, const char *path)
> @@ -304,14 +310,17 @@ int fdt_path_offset(const void *fdt, const char *pa=
th)
> =20
>  const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
>  {
> -	const struct fdt_node_header *nh =3D fdt_offset_ptr_(fdt, nodeoffset);
> +	const struct fdt_node_header *nh;
>  	const char *nameptr;
>  	int err;
> =20
> -	if (!can_assume(VALID_DTB) && (((err =3D fdt_ro_probe_(fdt)) < 0)
> -	    || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
> -			goto fail;
> +	if (!can_assume(VALID_DTB) && (err =3D fdt_ro_probe_(fdt)) < 0)
> +		goto fail;
> +
> +	if ((err =3D fdt_check_node_offset_(fdt, &nodeoffset)) < 0)
> +		goto fail;
> =20
> +	nh =3D fdt_offset_ptr_(fdt, nodeoffset);
>  	nameptr =3D nh->name;
> =20
>  	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
> @@ -344,7 +353,7 @@ int fdt_first_property_offset(const void *fdt, int no=
deoffset)
>  {
>  	int offset;
> =20
> -	if ((offset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> +	if ((offset =3D fdt_check_node_offset_(fdt, &nodeoffset)) < 0)
>  		return offset;
> =20
>  	return nextprop_(fdt, offset);
> @@ -574,6 +583,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, cha=
r *buf, int buflen)
>  {
>  	int pdepth =3D 0, p =3D 0;
>  	int offset, depth, namelen;
> +	int root_offset;
>  	const char *name;
> =20
>  	FDT_RO_PROBE(fdt);
> @@ -581,7 +591,14 @@ int fdt_get_path(const void *fdt, int nodeoffset, ch=
ar *buf, int buflen)
>  	if (buflen < 2)
>  		return -FDT_ERR_NOSPACE;
> =20
> -	for (offset =3D 0, depth =3D 0;
> +	root_offset =3D fdt_root_offset(fdt);
> +	if (root_offset < 0)
> +		return root_offset;
> +
> +	if (!nodeoffset)
> +		nodeoffset =3D root_offset;
> +
> +	for (offset =3D root_offset, depth =3D 0;
>  	     (offset >=3D 0) && (offset <=3D nodeoffset);
>  	     offset =3D fdt_next_node(fdt, offset, &depth)) {
>  		while (pdepth > depth) {
> @@ -627,13 +644,21 @@ int fdt_supernode_atdepth_offset(const void *fdt, i=
nt nodeoffset,
>  {
>  	int offset, depth;
>  	int supernodeoffset =3D -FDT_ERR_INTERNAL;
> +	int root_offset;
> =20
>  	FDT_RO_PROBE(fdt);
> =20
>  	if (supernodedepth < 0)
>  		return -FDT_ERR_NOTFOUND;
> =20
> -	for (offset =3D 0, depth =3D 0;
> +	root_offset =3D fdt_root_offset(fdt);
> +	if (root_offset < 0)
> +		return root_offset;
> +
> +	if (!nodeoffset)
> +		nodeoffset =3D root_offset;
> +
> +	for (offset =3D root_offset, depth =3D 0;
>  	     (offset >=3D 0) && (offset <=3D nodeoffset);
>  	     offset =3D fdt_next_node(fdt, offset, &depth)) {
>  		if (depth =3D=3D supernodedepth)
> @@ -663,12 +688,15 @@ int fdt_supernode_atdepth_offset(const void *fdt, i=
nt nodeoffset,
>  int fdt_node_depth(const void *fdt, int nodeoffset)
>  {
>  	int nodedepth;
> -	int err;
> +	int offset;
> +
> +	offset =3D fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
> +	if (offset < 0)
> +		return offset;
> +
> +	if (!can_assume(LIBFDT_FLAWLESS) && offset !=3D fdt_root_offset(fdt))
> +		return -FDT_ERR_INTERNAL;
> =20
> -	err =3D fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
> -	if (err)
> -		return (can_assume(LIBFDT_FLAWLESS) || err < 0) ? err :
> -			-FDT_ERR_INTERNAL;
>  	return nodedepth;
>  }
> =20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 850aafe4..a1a07f01 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -226,7 +226,7 @@ static int fdt_add_property_(void *fdt, int nodeoffse=
t, const char *name,
>  	int err;
>  	int allocated;
> =20
> -	if ((nextoffset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> +	if ((nextoffset =3D fdt_check_node_offset_(fdt, &nodeoffset)) < 0)
>  		return nextoffset;
> =20
>  	namestroff =3D fdt_find_add_string_(fdt, name, namelen, &allocated);
> @@ -377,6 +377,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoff=
set,
> =20
>  	FDT_RW_PROBE(fdt);
> =20
> +	if (!parentoffset) {
> +		parentoffset =3D fdt_root_offset(fdt);
> +		if (parentoffset < 0)
> +			return parentoffset;
> +	}
> +
>  	offset =3D fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
>  	if (offset >=3D 0)
>  		return -FDT_ERR_EXISTS;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c69a18ed..7a1915a5 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -503,6 +503,19 @@ int fdt_num_mem_rsv(const void *fdt);
>   */
>  int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t =
*size);
> =20
> +/**
> + * fdt_root_offset - Get the offset of the root node
> + * @fdt: pointer to the device tree blob
> + *
> + * The root node can be located after the offset 0. Indeed FDT_NOP tags =
can be
> + * present at offset 0. fdt_root_offset() takes care of those possible F=
DT_NOP
> + * tags.
> + *
> + * returns: offset of the root node or negative libfdt error value other=
wise
> + */
> +int fdt_root_offset(const void *fdt);
> +
> +
>  /**
>   * fdt_subnode_offset_namelen - find a subnode based on substring
>   * @fdt: pointer to the device tree blob
> @@ -1025,7 +1038,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, c=
har *buf, int buflen);
>   * at a specific depth from the root (where the root itself has depth
>   * 0, its immediate subnodes depth 1 and so forth).  So
>   *	fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, NULL);
> - * will always return 0, the offset of the root node.  If the node at
> + * will always return the offset of the root node.  If the node at
>   * nodeoffset has depth D, then:
>   *	fdt_supernode_atdepth_offset(fdt, nodeoffset, D, NULL);
>   * will return nodeoffset itself.
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 0e103caf..d5072279 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -20,7 +20,7 @@ int32_t fdt_ro_probe_(const void *fdt);
>  		}							\
>  	}
> =20
> -int fdt_check_node_offset_(const void *fdt, int offset);
> +int fdt_check_node_offset_(const void *fdt, int *offset);
>  int fdt_check_prop_offset_(const void *fdt, int offset);
> =20
>  const char *fdt_find_string_len_(const char *strtab, int tabsize, const =
char *s,
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index cbfef546..d0b71669 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -7,6 +7,7 @@ LIBFDT_1.2 {
>  		fdt_string;
>  		fdt_num_mem_rsv;
>  		fdt_get_mem_rsv;
> +		fdt_root_offset;
>  		fdt_subnode_offset_namelen;
>  		fdt_subnode_offset;
>  		fdt_path_offset_namelen;
> --- 8< ---
>=20
>=20
> I hope all of those details will help to move forward.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--YZwUZMmSg92pVfpF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqfrfIACgkQzQJF27ox
2GfjSBAAnQbTcPPGls17WN2oRpG4M+/ssZHQTURIQkt4G+z6S7MDvNa+yZZSanxy
z4T6IgallQi6Jo+MxLooxwpuAstUC3BVXVzfUlWogXQlJqIjyFffCqIz5fkxJY7y
0Cwh+qQULf10Ip+50KGmVKUZ+j+leQJSRrQ8H/iLRCptwHBwm2NEuzUK2zdLstfG
WiGGHyQZZxZkqci0W9bkKEiJY/tBaniUv0Z0oBPuIWljzoP75EibRq0TbaUGeyc2
6flmHXbN1B1bm+lhgURSi3ny/NWoJR96NRz9zgR16pGnji9tgjGjyfWL3FiW2MKZ
Tm/7n864Oyc0aCFk33EgW5R85zFppU0BYqn0mvw3dnPlgpo6WDvFeUFCXvNK3Tv7
zuchkIXhBloYe3jaVuGnUWWYofALqR9tT8r4WR6i+UK1bGqSIeCyMnrznycu5mVP
79+hmugUkGH/U7kHDcHCEnbyrGQRmj9wYsCo5oncL7zm/9hwCzS/BJUS1nbKYmNN
76h85W8nmlItB+UAS+xWT/G/z7dWCbkdGXHva6zQHh08dJdApHOUqttEc0ULKe8e
ncjyZsWJfr/OIBvgRCNOjPgyIsYb2dV/M4s8d5nzFY+4DB2rqwtzfizgXN1GbVDH
6wbOlOL/H1TughIo9K/cRblMDqaDKUORUc+JPukj7ViyWc7fOcw=
=uTPI
-----END PGP SIGNATURE-----

--YZwUZMmSg92pVfpF--
