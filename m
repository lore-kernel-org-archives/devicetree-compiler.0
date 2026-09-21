Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDF0351C1C;
	Mon, 21 Sep 2026 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970856; cv=none; b=TmJquapxEyRRN3Hqpw6o5aXAM+I7CWsTMLGbAW/pIHcCe+Yk9Ljpg2wPTGpuScMm+FKdPOmWIJMi6lWP9bJA4dYXdjZ73ql9I83HQZiqCu5TF6I0KNc3mflHNMdIOW353FkH+vpCywzD5TGnwKdLEFMD0/4ZJKkrokNv1E2ujNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970856; c=relaxed/simple;
	bh=X8eH9hI87CAvXEbUodLqg66kXC6syF/yXBaxX7UCwpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebUjeOwj6cMfbaYUWRj6Od1tnXMdNsk1tyYvGacd1CLIxS1ySfNGbyET34LvqFD3om56XOfavXlsMfwBLbfwpS+IhxVdWOx+/lrf2xuaKZJkZDxsNqHiMoLekKFd35Z8+BSqHTiFXDBNiC5wJrIN1VoooWIyaIe6Ef8bwQ2Kitc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=UowIgF8t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="UowIgF8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789970829;
	bh=ZKLaW9H34SJ4s5YHf3p5wWEmQBUmtAaaIBbu4xT/etA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UowIgF8tkI/jvwUmOr4naYwq9VV3q8ZlH1WEjx8cPbPH96kMLG4TXwRXmGLyPvtRo
	 CJgEgZ6xSvnu4wX76ijYtXrxr8af3rynwLIw5otNyroBP7bN8ENZ6jMv7Xz0U642Oe
	 mbtClA9+b0axaRCZcHvos0L579DGJ6+g3hRybkWm8zRX9Y4lG0hQYoQaTXX3yDp2/H
	 VFfmRPw8XBiPqhvy4ZGc+eDjnVXs0WEQg4IBr9jv7ye3/U7IzCte2mdEH8w7a+66li
	 w/cwquYtZNnDvV3rYfAcwuv1KZ44TcAfaGJ6suyy4Nv2+akiCHYscLRaHXO+4HaKE6
	 wTUdJPnC+f4GA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hpCRx0jCfz4wSL; Mon, 21 Sep 2026 16:07:09 +1000 (AEST)
Date: Mon, 21 Sep 2026 16:06:13 +1000
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 14/15] libfdt: Handle unknown tags on dtb modifications
Message-ID: <arDJSBEh9Duus0kz@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-15-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SqICAo96eBB2Izzy"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-15-herve.codina@bootlin.com>

--SqICAo96eBB2Izzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:45AM +0200, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error.
>=20
> When the dtb is modified those unknown tags have to be taken into
> account.
>=20
> First, depending on the unknown tag location, the item associated with
> the tag is identified:
>   - An unknown tag located just after a FDT_BEGIN_NODE is related to the
>     node.
>=20
>   - An unknown tag located just after a FDT_PROP is related to the
>     property.
>=20
>   - An unknown tag out of any node (i.e located before the first
>     FDT_BEGIN_NODE or after the last FDT_END_NODE) is a global tag
>     related to the dtb itself.

Since we rely on those constraings here, it seems like those should
probably be written into the structured tag specs / description.
Which to my mind strengthens the case for explicitly calling them
"metadata tags".

> Then, if we are allowed to write a dtb containing unknown tags, the
> following rules are used:
>   - When a property is modified, tags related to this property are
>     removed and the dtb version is downgraded.

Hmm.  This seems weird to me, but maybe that's because we haven't
pinned down in specs / docs what the interaction is between new
skippable tags and the overall version.

My assumption had been that tags - even structured tags - newer than
vNNN must not appear in a dtb with version =3D=3D NNN (but they can appear
in a dtb with last_compat_version < NNN).

With that model, this seems kind of backwards - downgrading the
version would require removing newer tags throughout the tree, rather
than removing some tags causing the version to be downgraded.

>   - When a property is removed, tags related to this property are
>     obviously removed. The dtb version is kept unchanged.
>=20
>   - When a property or a node is added, obviously no unknown tags are
>     added and the dtb version is kept unchanged.

This seems weird to me in combination with the behaviour on
modification.  The previous one makes more sense to me in the context
of an alternative model: newer versions might *require* certain
metadata tags are present.  But in that case this part doesn't work.

>   - When a node is removed, tags related to this node are obviously
>     removed. The dtb version is kept unchanged.
>=20
>   - Adding, removing or modifying a property is not considered as a node
>     modification and so, those operations have no impacts on unknown
>     tags related to the node. Those node related tags are kept unchanged.

That.. certainly constrains what it's possible to put in skippable
tags, in a way that we'd have to document, though it's not especially
easy to do so.

>   - The only modification considered as a node modification is setting
>     its name. We consider that this operation has no impact on tags
>     related to the node. Here also, those node related tags and the
>     dtb version are kept unchanged.
>=20
>   - Global (dtb related) unknown tags are kept unchanged regardless the
>     modification done.
>=20
> Implement those rules when a dtb is modified.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  libfdt/fdt_rw.c                               | 129 +++++++++++++++++-
>  libfdt/fdt_wip.c                              |  28 +++-
>  libfdt/libfdt_internal.h                      |   3 +
>  tests/run_tests.sh                            |  78 +++++++++++
>  ...own_tags_can_skip.fdtput.test.dtb.0.expect |  31 +++++
>  ...own_tags_can_skip.fdtput.test.dtb.1.expect |  35 +++++
>  ...own_tags_can_skip.fdtput.test.dtb.2.expect |  33 +++++
>  ...own_tags_can_skip.fdtput.test.dtb.3.expect |  35 +++++
>  ...own_tags_can_skip.fdtput.test.dtb.4.expect |  34 +++++
>  ...own_tags_can_skip.fdtput.test.dtb.5.expect |  32 +++++
>  ...own_tags_can_skip.fdtput.test.dtb.6.expect |  27 ++++
>  ...nknown_tags_can_skip.wip.test.dtb.0.expect |  31 +++++
>  ...nknown_tags_can_skip.wip.test.dtb.1.expect |  35 +++++
>  ...nknown_tags_can_skip.wip.test.dtb.2.expect |  37 +++++
>  ...nknown_tags_can_skip.wip.test.dtb.3.expect |  38 ++++++
>  15 files changed, 603 insertions(+), 3 deletions(-)
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
>  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
>  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.0.expect
>  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.1.expect
>  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.2.expect
>  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.3.expect
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index ceef49b8..87776609 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -197,10 +197,69 @@ int fdt_del_mem_rsv(void *fdt, int n)
>  	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
>  }
> =20
> +static void fdt_nopify_area(void *fdt, int start_offset, int next_offset)

This should be written in terms of fdt_nop_region_() from fdt_wip.c
(or else the other way around).  It should also probably live in
fdt_wip.c.

> +{
> +	int count =3D (next_offset - start_offset) / sizeof(fdt32_t);
> +	fdt32_t fdt32_nop =3D cpu_to_fdt32(FDT_NOP);
> +	fdt32_t *ptr;
> +
> +	ptr =3D fdt_offset_ptr_w_(fdt, start_offset);
> +	while (count--)
> +		*(ptr++) =3D fdt32_nop;
> +};
> +
> +int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
> +				 int prop_offset, bool downgrade_version)
> +{
> +	int nextoffset, offset;
> +	bool is_unknown;
> +	uint32_t tag;
> +
> +	/*
> +	 * Only inplace using nopify is supported even if we could use an other
> +	 * method involving splices if force_inplace is set to false.

This comment is fairly hard to understand without reading a lot of the
rest of the patch first.  It's also really not ideal - when we're in
the fdt_rw context, we want to be able to really truly remove the
stale tags, not just NOP them.




> +	 */
> +
> +	tag =3D fdt_next_tag(fdt, prop_offset, &nextoffset);
> +	if (tag =3D=3D FDT_END)
> +		return nextoffset;
> +

Should this error out if tag !=3D FDT_PROP?

> +	/*
> +	 * Look at all tags related to the current property. I.e. tags after the
> +	 * current property and before either the next property, a sub-node  or
> +	 * the end of current node
> +	 */
> +	do {
> +		offset =3D nextoffset;
> +		tag =3D fdt_next_tag_(fdt, offset, &nextoffset, &is_unknown);
> +		if (tag =3D=3D FDT_END)
> +			return nextoffset;
> +
> +		/*
> +		 * Unknown tags are returned as NOP. Force FDT_NOP to be really
> +		 * present in the area to remove the unknown tag and its related
> +		 * data. Also, as a tag is removed, downgrade the dtb version
> +		 * if asked for.
> +		 */
> +		if (tag =3D=3D FDT_NOP) {

It seems to me this would be more natural using fdt_next_tag_all() (or
whatever it ends up being called) and handling the nopping in the
'default' case.

> +			if (is_unknown) {
> +				if (downgrade_version)
> +					fdt_downgrade_version(fdt);
> +				fdt_nopify_area(fdt, offset, nextoffset);
> +			}
> +		}
> +
> +	} while ((tag !=3D FDT_PROP) && (tag !=3D FDT_BEGIN_NODE) &&
> +		 (tag !=3D FDT_END_NODE));
> +
> +	return 0;
> +}
> +
>  static int fdt_resize_property_(void *fdt, int nodeoffset,
>  				const char *name, int namelen,
>  				int len, struct fdt_property **prop)
>  {
> +	int prop_offset;
>  	int oldlen;
>  	int err;
> =20
> @@ -209,6 +268,15 @@ static int fdt_resize_property_(void *fdt, int nodeo=
ffset,
>  	if (!*prop)
>  		return oldlen;
> =20
> +	/*
> +	 * The property is resized. Remove possible unknown tags related to the
> +	 * property downgrading the dtb version.
> +	 */
> +	prop_offset =3D fdt_ptr_offset_(fdt, *prop);
> +	err =3D fdt_prop_remove_unknown_tags(fdt, false, prop_offset, true);
> +	if (err)
> +		return err;
> +
>  	if ((err =3D fdt_splice_struct_(fdt, (*prop)->data, FDT_TAGALIGN(oldlen=
),
>  				      FDT_TAGALIGN(len))))
>  		return err;
> @@ -217,6 +285,29 @@ static int fdt_resize_property_(void *fdt, int nodeo=
ffset,
>  	return 0;
>  }
> =20
> +static int fdt_node_skip_unknown_tags(void *fdt, int next)

Is 'next' the offset of a node?  If so it should probably have a more
suggestive name.

> +{
> +	int nextoffset =3D next;
> +	int offset;
> +	uint32_t tag;
> +
> +	/*
> +	 * Skip all tags related to the current node. I.e. tags after the
> +	 * current node and before either the next property, a sub-node or the
> +	 * end of current node.
> +	 */
> +	do {
> +		offset =3D nextoffset;
> +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> +		if (tag =3D=3D FDT_END)
> +			return nextoffset;
> +
> +	} while ((tag !=3D FDT_PROP) && (tag !=3D FDT_BEGIN_NODE) &&
> +		 (tag !=3D FDT_END_NODE));
> +
> +	return offset;
> +}
> +
>  static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
>  			     int namelen, int len, struct fdt_property **prop)
>  {
> @@ -235,6 +326,15 @@ static int fdt_add_property_(void *fdt, int nodeoffs=
et, const char *name,
>  	if ((nextoffset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
>  		return nextoffset;
> =20
> +	/*
> +	 * nextoffset it at the first tag after the node.
> +	 * Skip possible unknown tags related to the node in order to add the
> +	 * property after those tags.
> +	 */
> +	nextoffset =3D fdt_node_skip_unknown_tags(fdt, nextoffset);
> +	if (nextoffset < 0)
> +		return nextoffset;
> +
>  	namestroff =3D fdt_find_add_string_(fdt, name, namelen, &allocated);
>  	if (namestroff < 0)
>  		return namestroff;
> @@ -333,11 +433,22 @@ int fdt_appendprop(void *fdt, int nodeoffset, const=
 char *name,
>  {
>  	struct fdt_property *prop;
>  	int err, oldlen, newlen;
> +	int prop_offset;
> =20
>  	FDT_RW_PROBE(fdt);
> =20
>  	prop =3D fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
>  	if (prop) {
> +		/*
> +		 * The property is going to be modified. Remove possible unknown
> +		 * tags related to this property downgrading the dtb version.
> +		 */
> +		prop_offset =3D fdt_ptr_offset_(fdt, prop);
> +		err =3D fdt_prop_remove_unknown_tags(fdt, false, prop_offset,
> +						   true);
> +		if (err)
> +			return err;

Just NOPing the unknown tags isn't ideal here.  This function can
already insert/remove stuff from the structure block, so removing the
tags entirely would be preferable.

>  		newlen =3D len + oldlen;
>  		err =3D fdt_splice_struct_(fdt, prop->data,
>  					 FDT_TAGALIGN(oldlen),

> @@ -360,6 +471,8 @@ int fdt_delprop(void *fdt, int nodeoffset, const char=
 *name)
>  {
>  	struct fdt_property *prop;
>  	int len, proplen;
> +	int prop_offset;
> +	int err;
> =20
>  	FDT_RW_PROBE(fdt);
> =20
> @@ -367,6 +480,15 @@ int fdt_delprop(void *fdt, int nodeoffset, const cha=
r *name)
>  	if (!prop)
>  		return len;
> =20
> +	/*
> +	 * The property is going to be removed. Remove also possible unknown
> +	 * tags related to this property. Keep the dtb version unchanged.
> +	 */
> +	prop_offset =3D fdt_ptr_offset_(fdt, prop);
> +	err =3D fdt_prop_remove_unknown_tags(fdt, false, prop_offset, false);
> +	if (err)
> +		return err;

Here, only NOPing the tags is worse, since delprop is expected to
entirely remove the property without leaving NOPs.

Also.. just NOPing unknown tags isn't correct either.  The property is
being removed, so *all* the associated skippable tags should be
removed as well (ideally with a single fdt_splice_struct_()).

> +
>  	proplen =3D sizeof(*prop) + FDT_TAGALIGN(len);
>  	return fdt_splice_struct_(fdt, prop, proplen, 0);
>  }
> @@ -395,7 +517,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoff=
set,
>  	else if (offset !=3D -FDT_ERR_NOTFOUND)
>  		return offset;
> =20
> -	/* Try to place the new node after the parent's properties */
> +	/*
> +	 * Try to place the new node after the parent's properties and unknown
> +	 * tags related to those properties.
> +	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag.
> +	 * Skipping FDT_NOP tags will correctly skip unknown tags.

True, but I think it would be clearer and more robust to explicitly
look for an FDT_BEGIN_NODE or FDT_END_NODE tag instead.

> +	 */
>  	tag =3D fdt_next_tag(fdt, parentoffset, &nextoffset);
>  	/* the fdt_subnode_offset_namelen() should ensure this never hits */
>  	if (!can_assume(LIBFDT_FLAWLESS) && (tag !=3D FDT_BEGIN_NODE))
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index c2d7566a..7ca3ffbc 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -15,17 +15,30 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, in=
t nodeoffset,
>  					uint32_t idx, const void *val,
>  					int len)
>  {
> +	int prop_offset;
>  	void *propval;
>  	int proplen;
> +	int err;
> =20
> -	propval =3D fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
> -					&proplen);
> +	prop_offset =3D fdt_getprop_offset_namelen(fdt, nodeoffset, name, namel=
en);
> +	if (prop_offset < 0)
> +		return prop_offset;
> +
> +	propval =3D fdt_getprop_by_offset_w(fdt, prop_offset, NULL, &proplen);
>  	if (!propval)
>  		return proplen;
> =20
>  	if ((unsigned)proplen < (len + idx))
>  		return -FDT_ERR_NOSPACE;
> =20
> +	/*
> +	 * Remove unknown tags related to the property downgrading the dtb
> +	 * version.
> +	 */
> +	err =3D fdt_prop_remove_unknown_tags(fdt, true, prop_offset, true);

Functions in fdt_wip.c should not depend on functions in fdw_rw.c.
Part of the reason for organising things this way is so that a client
only uses write-in-place functions, the linker will omit the more
complex full read-write code (even if an old or limited linker that
doesn't do e.g. function sections).  fdt_rw.c by contrast _is_
permitted to rely on fdt_wip.c

> +	if (err)
> +		return err;
> +
>  	memcpy((char *)propval + idx, val, len);
>  	return 0;
>  }
> @@ -59,12 +72,23 @@ static void fdt_nop_region_(void *start, int len)
>  int fdt_nop_property(void *fdt, int nodeoffset, const char *name)
>  {
>  	struct fdt_property *prop;
> +	int prop_offset;
>  	int len;
> +	int err;
> =20
>  	prop =3D fdt_get_property_w(fdt, nodeoffset, name, &len);
>  	if (!prop)
>  		return len;
> =20
> +	/*
> +	 * The property is going to be removed (nopified). Remove unknown tags
> +	 * related to this property. Keep the dtb version unchanged.
> +	 */
> +	prop_offset =3D fdt_ptr_offset_(fdt, prop);
> +	err =3D fdt_prop_remove_unknown_tags(fdt, true, prop_offset, false);
> +	if (err)
> +		return err;

Similar to fdt_delprop() this needs to NOP *all* the properties
associated with the property we're killing, not just the unknown ones
(again, ideally with a single fdt_nop_region_()).

>  	fdt_nop_region_(prop, len + sizeof(*prop));
> =20
>  	return 0;
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index e3923629..ce128fda 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -26,6 +26,9 @@ uint32_t fdt_next_tag_(const void *fdt, int startoffset=
, int *nextoffset,
>  int fdt_check_node_offset_(const void *fdt, int offset);
>  int fdt_check_prop_offset_(const void *fdt, int offset);
> =20
> +int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
> +				 int prop_offset, bool downgrade_version);
> +
>  int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
>  			       const char *name, int namelen);
>  static inline int fdt_getprop_offset(const void *fdt, int nodeoffset,
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 419a24d8..980ed6a0 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -586,6 +586,34 @@ libfdt_tests () {
>  		unknown_tags_no_skip.dtb; do
>  	run_test check_full -n $bad
>      done
> +
> +    # Check inplace modification with "unknown" tags that can be skipped
> +    dtb=3Dunknown_tags_can_skip.wip.test.dtb
> +    cp unknown_tags_can_skip.dtb $dtb
> +    base_run_test wrap_fdtdump $dtb $dtb.0.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> +    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"

As noted earlier in the series, tests of binary-level behaviour
shouldn't depend on specific source formatting.  The use of wip_func
to essentially do some of the test steps in shell seems clumsy to me -
I think this would be nicer as explicit tests written in C which
directly look at the binary dtb contents.

> +    run_test wip_func $dtb set_prop / prop-str 0 "vwxy"
> +    base_run_test wrap_fdtdump $dtb $dtb.1.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> +    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"
> +
> +    cp unknown_tags_can_skip.dtb $dtb
> +    run_test wip_func $dtb nop_prop /subnode2 prop-int1
> +    base_run_test wrap_fdtdump $dtb $dtb.2.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
> +    base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
> +
> +    cp unknown_tags_can_skip.dtb $dtb
> +    run_test wip_func $dtb nop_node /subnode2/subsubnode
> +    base_run_test wrap_fdtdump $dtb $dtb.3.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
> +    base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
>  }
> =20
>  dtc_tests () {
> @@ -1045,6 +1073,56 @@ fdtput_tests () {
>      run_wrap_error_test $DTPUT $dtb -d /chosen   non-existent-prop
> =20
>      # TODO: Add tests for verbose mode?
> +
> +    # Modify a dtb containing some "unknown" tags that can be skipped
> +    dtb=3Dunknown_tags_can_skip.fdtput.test.dtb
> +    cp unknown_tags_can_skip.dtb $dtb
> +    base_run_test wrap_fdtdump $dtb $dtb.0.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> +    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"
> +    run_fdtput_test "vwxyz" $dtb / prop-str -ts "vwxyz"
> +    base_run_test wrap_fdtdump $dtb $dtb.1.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> +    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"

Doing these as fdtput tests again seems kind of clumsy, unless the
point is explicitly to check the fdtput utility's behaviour.  The core
library functionality should be tested directly without introducing
extra layers.

> +    cp unknown_tags_can_skip.dtb $dtb
> +    run_wrap_test $DTPUT $dtb -c /tst-fdtput
> +    base_run_test wrap_fdtdump $dtb $dtb.2.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
> +    base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
> +    run_wrap_test $DTPUT $dtb -c /tst-fdtput/n1 /tst-fdtput/n2 /tst-fdtp=
ut/n3
> +    run_wrap_test $DTPUT $dtb -r /tst-fdtput/n1 /tst-fdtput/n3
> +    run_fdtget_test "n2" $dtb -l  /tst-fdtput
> +    base_run_test wrap_fdtdump $dtb $dtb.3.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
> +    base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
> +
> +    cp unknown_tags_can_skip.dtb $dtb
> +    run_wrap_test $DTPUT $dtb -d / prop-str
> +    run_fdtget_test "prop-int" $dtb -p  /
> +    base_run_test wrap_fdtdump $dtb $dtb.4.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.4.out
> +    base_run_test check_diff $dtb.4.out "$SRCDIR/$dtb.4.expect"
> +
> +    cp unknown_tags_can_skip.dtb $dtb
> +    run_wrap_test $DTPUT $dtb /subnode2 prop-tst-fdtput -ts "Test fdtput"
> +    base_run_test wrap_fdtdump $dtb $dtb.5.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.5.out
> +    base_run_test check_diff $dtb.5.out "$SRCDIR/$dtb.5.expect"
> +
> +    cp unknown_tags_can_skip.dtb $dtb
> +    run_wrap_test $DTPUT $dtb -r /subnode2/subsubnode
> +    base_run_test wrap_fdtdump $dtb $dtb.6.out
> +    # Remove unneeded header fields (keep those related to versions)
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.6.out
> +    base_run_test check_diff $dtb.6.out "$SRCDIR/$dtb.6.expect"
>  }
> =20
>  utilfdt_tests () {
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.0.expect
> new file mode 100644
> index 00000000..75883593
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
> @@ -0,0 +1,31 @@
> +/dts-v1/;
> +// version:		4294967295
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str =3D "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 =3D <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 =3D <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001=
231
> +            prop-bool;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> new file mode 100644
> index 00000000..b4d3ae29
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> @@ -0,0 +1,35 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str =3D "vwxyz";
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 =3D <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 =3D <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001=
231
> +            prop-bool;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.2.expect
> new file mode 100644
> index 00000000..a196bed3
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
> @@ -0,0 +1,33 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str =3D "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    tst-fdtput {
> +    };
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 =3D <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 =3D <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001=
231
> +            prop-bool;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.3.expect
> new file mode 100644
> index 00000000..52faa1dd
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
> @@ -0,0 +1,35 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str =3D "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    tst-fdtput {
> +        n2 {
> +        };
> +    };
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 =3D <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 =3D <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001=
231
> +            prop-bool;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.4.expect
> new file mode 100644
> index 00000000..1ddc694b
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
> @@ -0,0 +1,34 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 =3D <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 =3D <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001=
231
> +            prop-bool;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.5.expect
> new file mode 100644
> index 00000000..f955ac1c
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
> @@ -0,0 +1,32 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str =3D "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-tst-fdtput =3D "Test fdtput";
> +        prop-int1 =3D <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 =3D <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001=
231
> +            prop-bool;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.6.expect
> new file mode 100644
> index 00000000..59247478
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
> @@ -0,0 +1,27 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str =3D "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 =3D <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 =3D <0x00032022>;
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.0.expect b/tests/un=
known_tags_can_skip.wip.test.dtb.0.expect
> new file mode 100644
> index 00000000..75883593
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.wip.test.dtb.0.expect
> @@ -0,0 +1,31 @@
> +/dts-v1/;
> +// version:		4294967295
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str =3D "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 =3D <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 =3D <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001=
231
> +            prop-bool;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.1.expect b/tests/un=
known_tags_can_skip.wip.test.dtb.1.expect
> new file mode 100644
> index 00000000..2a0dd4a0
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.wip.test.dtb.1.expect
> @@ -0,0 +1,35 @@
> +/dts-v1/;
> +// version:		17
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str =3D "vwxy";
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    // [NOP]
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 =3D <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 =3D <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001=
231
> +            prop-bool;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.2.expect b/tests/un=
known_tags_can_skip.wip.test.dtb.2.expect
> new file mode 100644
> index 00000000..bc08885b
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.wip.test.dtb.2.expect
> @@ -0,0 +1,37 @@
> +/dts-v1/;
> +// version:		4294967295
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str =3D "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        prop-int2 =3D <0x00032022>;
> +        subsubnode {
> +            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001=
231
> +            prop-bool;
> +        };
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.3.expect b/tests/un=
known_tags_can_skip.wip.test.dtb.3.expect
> new file mode 100644
> index 00000000..aa6e9394
> --- /dev/null
> +++ b/tests/unknown_tags_can_skip.wip.test.dtb.3.expect
> @@ -0,0 +1,38 @@
> +/dts-v1/;
> +// version:		4294967295
> +// last_comp_version:	16
> +
> +// Unknown tag ignored: 0xd0000000, data len 4 00000001
> +/ {
> +    // Unknown tag ignored: 0xc0000000, data len 0
> +    prop-int =3D <0x00003201>;
> +    // Unknown tag ignored: 0xd0000000, data len 4 00000110
> +    prop-str =3D "abcd";
> +    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
> +    // Unknown tag ignored: 0xf0000000, data len 3 101112
> +    subnode1 {
> +        prop-int =3D <0x00006401 0x00006402>;
> +        // Unknown tag ignored: 0xc0000000, data len 0
> +    };
> +    subnode2 {
> +        // Unknown tag ignored: 0xd0000000, data len 4 00000121
> +        prop-int1 =3D <0x00064020 0x00064021>;
> +        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
> +        prop-int2 =3D <0x00032022>;
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // [NOP]
> +        // Unknown tag ignored: 0xf0000000, data len 3 212223
> +    };
> +    // Unknown tag ignored: 0xf0000000, data len 4 31323334
> +};
> +// Unknown tag ignored: 0xd0000000, data len 4 00000002
> +// Unknown tag ignored: 0xf0000000, data len 2 4041
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--SqICAo96eBB2Izzy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqwyUgACgkQzQJF27ox
2GfhVA/+NAICtVFqCRO8fL2iy8/a19koB/GbwhkQWzCl3x8oUvhHX+iibqzfhb5G
imoKO38uN/AmaRYK/igr2CLYb2TdZbh36o53jFphGaKPwkc+mtKyeTqokQXzYpYD
e18WMwgF6oFIZM/3WTiAq+er0yOYUIWjNGEwU2z/jqnybslUBR7luq3S0Kvg/WWK
FC7ldEGQmeN7NbW0rGWG5TjIDPikj6SzfHZTaktQr3Qouo5+HG8RIPZMLTTSnsHd
fXyvvMgkgK9HESw4E27JLdbQh/qW/6kZmDonFWI4xvGV7wrAoSSzNNigtfBYWK3B
UBWC/0jBz76NIr8YUbfXwVpxMrb7NOg+ns/4rB+XwTkt68AIexS+eE6VMsabGv+2
kOS/aXM2zljFfS7KT94QJH01yvON3mvY/GcimuNoFoENeJ/uWaPCST+OammU2ocz
MleoP5vdwYgmtydLqigmKlerEp9zTM9nt5Iue1n0wkGQQjPY5xqRZFVVFmYIjrex
UqsKyD2dZzFpCqYOR8ClSQ5Y1uLD80IbU7mYk1cceJOhsQtEvLLMUdzijhxfpssn
T9M5ubT0L4TkVv2uvatbsnbC4/i3rV/k9jJweNREWSk/3R9ZzlZp3E6+0PWa1Ijs
8q4lqetJDm1Ng4VxLmH1AZe0yBN0eeBEqBzrxPKeLWxhAzjpmRU=
=KUlU
-----END PGP SIGNATURE-----

--SqICAo96eBB2Izzy--
